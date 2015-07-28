# Object Reference

version 0.14

The Crunch REST API takes a decidedly column-oriented approach to data. A "column" is simply a sequence of values of the same type. A "variable" binds a name (and other metadata) to the column, and indeed may possess a series of columns over its lifetime as inserts and updates are made to it. A "dataset" is a set of variables. Each variable in the dataset is sorted the same way; the variables together form a relation. Reading the N'th item from each variable produces a row.

Interaction with the Crunch REST API is by variables and columns. When you add data to Crunch, you send a set of columns. When you fetch data from Crunch, you send a set of variable expressions and receive a set of columns. When you update data in Crunch, you send a set of expressions which tells Crunch how to update variables with new column data.

The Crunch API consists of just a few primitive objects, arranged differently for each request and response. Learning the basic components will help you create the most complicated queries.

## Statistical data

### Identifiers

Datasets, variables, and other resources are always identified by strings. All identifiers are case-sensitive, and may contain any unicode character, including spaces. Examples:

* "q1"
* "My really useful dataset"
* "变量"

### Data Values

Individual data values follow the JSON representations where possible. JSON exposes the following types: number, string, array, object, true, false, null. Crunch adds additional types with special syntax (see Types, below). Examples:

* 13
* 45.330495
* "foo"
* [3, 4, 5]
* {"bar": {"a": [12.4, 89.2, 0]}}
* true
* null
* "2014-03-02T14:29:59Z"

Because a single JSON type may be used to represent multiple Crunch types, you should never rely on the JSON type to interpret the class of a datum. Instead, inspect the type object (see below) to interpret the data.

#### Missing values

Crunch provides a robust "missing entries" system. Anywhere a (valid) data value can appear, a missing value may also appear. Missing values are represented by an object with a single "?" key. The value is a missing integer code (see Missing reasons, below); negative integers are reserved for system-generated reasons, user-defined reasons are automatically assigned positive integers. Examples:

* {"?": -1}
* {"?": 24}

#### Arrays
A set of data values (and/or missing values) which are of the same type can be ordered in an array. All entries in an array are of the same Crunch type.

Examples:

* [13, 4, 5, {"?": -2}, 7, 2]
* ["foo", "bar"]

#### Enumerations

Some arrays, rather than repeating a small set of large values, benefit from storing a small integer code instead, moving the larger values they represent into the metadata, and doing lookups when needed to encode/decode. The "categorical" type is the most common example of this: rather than store an array of large string names like ["Internet Explorer", "Internet Explorer", "Firefox", ...] it instead stores integer codes like: [1, 1, 2], placing the longer strings in the metadata as type.categories = [{"id": 1, "name": "Internet Explorer", ...}, ...]. We call this encoding process enumeration, and its opposite, where the coded are re-expanded into their original values, elaboration.

Enumeration also provides the opportunity to order the possible values, as well as include potential values which do not yet exist in the data array itself.

Enumeration typically causes the volume of data to shrink dramatically, and can speed up very common operations like filtering, grouping, and almost any data transfer. Because of this, it is common to:

* Enumerate a data array as early as possible. Indeed, when a variable can be enumerated, the fastest way to insert new data is to send the new values as the integer codes.
* Elaborate a data array as late as possible. As long as the metadata is shipped along with the enumerated data, the transfer size and therefore time is much smaller. Many cases do not even call for a complete elaboration of the entire column.

### Variable Definitions

This section describes the metadata of a variable as exposed across HTTP, both expected response values and valid input values.

Crunch operates on the principle that analytic users proceed through a series of steps where they both refine existing data and transform existing variables into new variables. Therefore, it employs a structural type system, not a nominative one. Practically, this means that, although we may know the "type" of a variable (numeric, text, categorical, etc) even before data is input, we learn more about the metadata of a variable as time goes on. The variable definition therefore includes more knowledge than just the type name; we also learn details about range, precision, missing values and reasons, order, etc. Both definitions and types, therefore, are complete objects, not just names. For example:

```json
{
    "type": "categorical",
    "name": "Party ID",
    "description": "Do you consider yourself generally a Democrat, a Republican, or an Independent?",
    "categories": [
        {
            "name": "Republican",
            "numeric_value": 1,
            "id": 1,
            "missing": false
        },
        {
            "name": "Democrat",
            "numeric_value": -1,
            "id": 2,
            "missing": false
        },
        {
            "name": "Independent",
            "numeric_value": 0,
            "id": 3,
            "missing": false
        }
    ]
}
```

#### Variable types

The "type" of a Variable is a string which defines the superset of values from which the variable may draw. The type governs not only the set of values but also their syntax. (See below.)

The following types are defined for public use:

* text
* numeric
* categorical
* datetime
* multiple_response
* categorical_array

#### Variable names
Crunch takes a principled stand that variable "names" should be for people, not for computers. 

##### name

You may be used to domains that have variable "name", "label", and "description". Name is some short, unique, machine-friendlier ID like "Q2"; label is short and human-friendly, something like "Brand awareness", and description is where you might put question wording if you have survey data. Crunch has "alias", "name", and "description". What you may be used to thinking of as a variable name, we consider as an alias: something for more internal use, not something appropriate for a polished dataset ready to share with people who didn't create the dataset (See more in the "Alias" section below). In Crunch, the variable's "name" is what you may be used to thinking of as a label. 

All variables must have a name, and these names must be unique across all variables, including "hidden" variables (see below) but excluding subvariables (see "Subvariables" below). Within an array variable, subvariable names must be unique. (You can think of subvariable names within an array as being variable_name.subvariable_name, and with that approach, all "variable names" must be unique.)

Names must be a string of length greater than zero, and any valid unicode string is allowed. See "Identifiers" above.

##### alias

Alias is a string identifier for variables. It must be unique across all variables, including subvariables, such that it can be used as an identifier. This is what legacy statistical software typically calls a variable name. 

Aliases have several uses. Client applications, such as those exposing a scripting interface, may want to use aliases as a more machine-friendly, yet still human-readable, way of referencing variables. Aliases may also be used to help line up variables across different import batches.

When creating variables via the API, alias is not a required field; if omitted, an alias will be generated. If an alias is supplied, it must be unique across all variables, including subvariables, and the new variable request will be rejected if the alias is not unique. When data are imported from file formats that have unique variable names, those names will in many cases be used as the alias in Crunch. 

##### description

Description is an optional string that provides more information about the variable. It is displayed in the web application on variable summary cards and with analyses. 

#### Type-specific attributes

These keys must be present for the specified variable types when creating a variable, but they are not defined for other types.

##### categories

Categorical variables must contain an array of Category objects, each of which includes:

name: the string name which applications should use to identify the category.
numeric_value: the numeric value bound to each name. If no numeric value should be bound, this should be null.
id: a read-only integer identifier for the category. These correspond to the data values.
missing: boolean indicating whether this category should be interpreted as missing values. 
selected: (optional) boolean indicating whether this category corresponds to a selected value for a dichotomized variable, i.e. part of a multiple response variable. Not required for regular categorical variables, and defaults to `false` if omitted.

Categories are valid if:

* Category names are unique within the set
* Category ids are unique within the set
* Category ids for user-defined categories are nonnegative. Negative ids are reserved for system missing reasons. See "missing_reasons" below. 

numeric_values need not be unique. There also is no requirement for Categories in a dichotomized subvariable that only one Category be marked "selected". 

The order of the array defines the order of the categories, and thus the order in which aggregate data will be presented. This order can be changed by saving a reordered set of Categories. 

##### subvariables

Multiple Response and Categorical Array variables contain an array of subvariable references. In the HTTP API, these are presented as URLs. To create a variable of type "multiple_response" or "categorical_array", you must include a "subvariables" member with an array of variable references. These variables will become the subvariables in the new array variable.

Like Categories, the array of subvariables within an array variable indicate the order in which they are presented; to reorder them, save a modified array of subvariable references.

##### resolution

Datetime variables must have a resolution string that indicates the unit size of the datetime data. Valid values include "Y", "M", "D", "h", "m", "s", and "ms". Every datetime variable must have a resolution.

#### Other definition attributes

These attributes may be supplied on variable creation, and they are included in API responses unless otherwise noted.

##### format

An object with various members to control the display of Variable data:

* data: An object with a "digits" member, stating how many digits to display after the decimal point.
* summary: An object with a "digits" member, stating how many digits to display after the decimal point.

##### view
An object with various members to control the display of Variable data:

* show_codes: For categorical types only. If true, numeric values are shown.
* show_counts: If true, show counts; if false, show percents.
* include_missing: For categorical types only. If true, include missing categories.
* column_width: For "untyped" Variables only. The selected display width of column data, in pixels, or None.
* include_noneoftheabove: For multipleresponse types only. If true, display a "none of the above" category in the requested summary or analysis.

##### discarded

Discarded is a boolean value indicating whether the variable should be viewed as part of the dataset. Hiding variables by setting discarded to True is like a soft, restorable delete method.

Default is "False".

##### private

If True, the variable will not show in the common variable catalog; instead, it will be included in the private variables catalog. Such variables may have their ids included in the variable order.

##### missing_reasons

An object whose keys are reason strings and whose values are the codes used for missing entries.

Crunch allows any entry in a column to be either a valid value or a missing code. Regardless of the class, missing codes are represented in the interface as an object with a single "?" key mapped to a single missing integer code. For example, a segment of [4.56, 9.23, {"?": -1}] includes 2 valid values and 1 missing value.

The missing codes map to a reason phrase via this "missing reasons" type member. Entries which are missing for reasons determined by the system are negative integers. Users may define their own missing reasons, which receive positive integer codes. Zero is a reserved value.

In the above example, the code of -1 would be looked up in a missing reasons map such as:

```json
{
    "missing reasons": {
        "no data": -1,
        "type mismatch": -2,
        "my backup was corrupted": 1
    }
}
```

See the Endpoint Reference for user-defined missing reasons.

Categorical variables do not require a missing_reasons object because the categories array contains the information about missingness.

#### Values

When creating a new variable, one can also include a "values" member that contains the data column corresponding to the variable metadata. See Importing Data: Column-by-column. This subsection outlines how the various variable types have their values formatted both when one supplies values to add to the dataset and when one requests values from a dataset.

##### Text

Text values are an array of quoted strings. Missing values are indicated as `{"?": <integer>}`, as discussed above, and all integer missing value codes must be defined in the "missing_reasons" object of the variable's metadata.
    
##### Numeric

A "numeric" value will always be e.g. 500 (a number, without quotes) in the JSON request and response messages, not "500" (a string, with quotes). Missing values are handled as with text variables.

##### Categorical

Insert an array of integers that correspond to the ids of the variable's categories. Only integers found in the category ids are allowed. That is, you cannot insert values for which there is no category metadata. It is, however, permitted to have categories defined for which there are no values.

##### Datetime

Datetime input and output are in ISO-8601 formatted strings.

##### Arrays

Crunch supports array type variables, which contain an array of subvariables. "Multiple response" and "Categorical array" are both arrays of categorical variables. Subvariables that have been "bound" into arrays can be dealt with separately as well.

All statements about variables are also true for subvariables unless otherwise noted.

##### Multiple Response

Requesting multiple response values returns values that are each an array, the values of which are the subvariable names for which that row of the data has a value indicated as "selected".

##### Categorical Array

Requesting categorical array values return values that are each an array, the values of which are the category names of the values for each subvariable. Each value in a categorical array is an array of equal length of the number of subvariables in the array.

### Variables

A complete Variable, then, is simply a Definition combined with its data array.

### Expressions

When attempting to describe which columns we'd like to use, we construct expressions. For example, to add columns X and Y into a third column Z, we could write "Z = X + Y". However, we have to be a bit careful that we distinguish between "Z = X + Y" where Y is the identifier of a variable, and "Z = X + Y" where we want to append the character "Y" to each value in variable X. We also have to distinguish a variable named "Qr" from a function named "Qr". Therefore, we wrap up each term in the expression in an object which declares whether the term is a variable, a value, or a function, etc.

#### Value terms

Terms refer to data values when they include a "value" member. Its value is any individual data value; that is, a value that is addressable by a column and row in the dataset. For example:

 * {"value": 13}
 * {"value": [3, 4, 5]}

Note that individual values may themselves be complex arrays or objects, depending on their type. You may explicitly include a "type" member in the object, or let Crunch infer the type.

#### Variable terms

Terms refer to variables when they include a "variable" member. The value is the URL for the desired variable. For example:

 * {"variable": "../variables/X/"}
 * {"variable": "../joins/abcd/variables/Y/"}

#### Function terms

Terms refer to functions (and operators) when they include a "function" member. The value is the identifier for the desired function. They parameterize the function with an "args" member, whose value is an array of terms, one for each argument. Examples:

 * {"function": "==", "args": [{"variable": "../variables/X/"}, {"value": 13}]}
 * {"function": "contains", "args": [{"variable": "../joins/abcd/variables/Y/"}, {"value": "foo"}]}

You may include a "references" member to provide a name, alias, description, etc to the output of the function.

#### Column terms

Terms refer to columns (construct them, actually) when they include a "column" member. The value is an array of data values. You may include "type" and/or "references" members as well.

 * {"column": [1, 2, 3, 17]}
 * {"column": [{"?": -2}, 1, 4, 1], "type": {"class": "categorical", "categories": [...], ...}}

## Documents

### Shoji

Many representations returned from the API are Shoji Documents. Shoji is a media type designed to foster scalable API's. Shoji is built with JSON, so any JSON parser should be able to at least deserialize Shoji documents. Shoji adds four document types: Entity, Catalog, View, and Order.

#### Entity

Anything that can be thought of as "a thing by itself" will probably be represented by a Shoji Entity Document. Entities possess a "body" member: a JSON object where each key/value pair is an attribute name and value. For example:

```json
{
    "element": "shoji:entity",
    "self": "https://.../api/users/1/",
    "description": "Details for a User.",
    "specification": "https://.../api/specifications/users/",
    "fragments": {
        "address": "address/"
    },
    "body": {
        "first_name": "Genghis",
        "last_name": "Khan"
    }
}
```

In general, an HTTP GET to the "self" URL will return the document, and a PUT of the same will update it. PUT should not be used for partial updates–use PATCH for that instead. In general, each member included in the "body" of a PATCH message will replace the current representation; attributes not included will not be altered. There is no facility to remove an attribute from an Entity.body via PATCH. In some cases, however, even finer-grained control is possible via PATCH; see the Endpoint Reference for details.

##### Dataset Entity

A Dataset entity is a Shoji Entity which defines a rectangular collection of variables. It has the following members:
 * description: A textual discussion of the Dataset resource in general.
 * specification: A link to a formal specification of the Dataset resource format.
 * catalogs: An object containing links to related catalogs:
   * batches: the collection of batches contained by the Dataset. Each batch represents a set of inserted rows.
   * variables: the collection of variables contained by the Dataset.
   * ...
 * fragments:
   * table: the editable data array for this Dataset.
 * body: An editable object whose members include:
   * archived: If true, the Dataset is hidden from most views.
   * creation_time: an ISO-8601 timestamp, like "2014-07-07T19:15:29.541633+00:00".
   * description: A long-form, textual description of the Dataset.
   * name: A unique, friendly name for the Dataset.
   * user_id: The id of a User resource which owns the Dataset.
   * weight: The URI of a Variable in the Dataset which should be used for weights (and is therefore hidden from most other views and controls), or null.

##### Variable Entity

A Variable entity is a Shoji Entity which defines a variable. It has the following members:
 * description: A description of what a Variable resource is and how it behaves.
 * specification: A URL to a formal specification for Variable objects.
 * body: An object with appropriate members from the variable's Definition, plus the following additional member:
   * dataset_id: The id of the Dataset to which this Variable belongs. This is also published in the dataset_url, which you should probably prefer.

When creating a Variable entity, you only need to specify the "body"; attributes such as "description" and "specification" are returned as part of the Shoji Entity but are not required to create a Variable.

#### Catalog

Catalogs collect or contain entities. They act as an index to a collection, and indeed possess an "index" member for this:

```json
{
    "element": "shoji:catalog",
    "self": "https://.../api/users/",
    "description": "A list of all the users.",
    "specification": "https://.../api/specifications/users/",
    "orders": {
        "default": "default_order/",
    },
    "index": {
        "2/": {"active": true},
        "1/": {"active": false},
        "4/": {"active": true},
        "3/": {"active": true}
    }
}
```

Each key in the index is a URL (possibly relative to "self") which refers to a different resource. Often, these are Shoji Entity documents, but not always. The index also allows some attributes to be published as a set, rather than in each individual Entity. This allows clients to act on the collection as a whole, such as when rendering a list of references from which the user might select one entity.

In general, an HTTP GET to the "self" URL will return the document, and a PUT of the same will update it. Many catalogs allow POST to add a new entity to the collection. PUT should not be used for partial updates–use PATCH for that instead. In general, each member included in the "index" of a PATCH message will replace the current representation; tuples not included will not be altered. Tuples included in a PATCH which are not present in the server's current representation of the index may be added; it is up to each resource whether to support (and document!) this approach or prefer POST to add entities to the collection. There is no facility to remove a tuple from a Catalog.index via PATCH–use PUT for that instead. In some cases, even finer-grained control is possible via PATCH; see the Endpoint Reference below for details.

#### View

Views cut across entities. They can publish nearly any arrangement of data, and are especially good for exposing arrays of arrays and the like. In general, a Shoji View is read-only, and only a GET will be successful.

#### Order

Orders can arrange any set of strings into an arbitrarily-nested tree; most often, they are used to provide one or more orderings of a Catalog's index. For example, each user may have their own ordering for an index of variables; the same URL's from the index keys are arranged in the Order. Given the Catalog above, for example, we might produce an Order like:

```json
{
    "element": "shoji:order",
    "self": "https://.../api/users/order/",
    "graph": [
        "2/",
        {"group A": ["1/", "3/", "2/"]},
        {"group B": ["4/"]}
    ]
}
```

This represents the tree:

```
      /  |  \
     2  {A} {B}
       / | \  \
      1  3  2  4
```

The Order object itself allows lots of flexibility. Each of the following decisions are up to the API endpoint to constrain or not as it sees fit (see the Endpoint Reference for these details):

* Not every string in the original set has to be present, allowing partial orders.
* Strings from the original set which are not mentioned may be ignored, or default to an "ungrouped" group, or other behaviors as each application sees fit.
* Groups may contain member strings and other groups interleaved (but still ordered).
* Groups may exist without any members.
* Members may appear in more than one group.
* Group names may be repeated at different points within the tree.
* Group member arrays, although represented in a JSON array, may be declared to be non-strict in their order (that is, the array should be treated more like an unordered set).

### Crunch Objects

Most of the other representations returned from the API are Crunch Objects. They are built with JSON, so any JSON parser should be able to at least deserialize Crunch documents. Crunch adds two document types: Table and Cube.

#### Table

Tables collect columns of data and (optionally) their metadata into two-dimensional relations.

```json
{
    "element": "crunch:table",
    "self": "https://.../api/datasets/.../table/?limit=7",
    "description": "The data belonging to this Dataset.",
    "metadata": {
        "1ef0455": {"name": "Education", "type": "categorical", "categories": [...], ...},
        "588392a": {"name": "Favorite color", "type": "text", ...}
    }
    "data": {
        "1ef0455": [6, 4, 7, 7, 3, 2, 1],
        "588392a": ["green", "red", "blue", "Red", "RED", "pink", " red"]
    }
}
```

Each key in the "data" member is a variable identifier, and its corresponding value is a column of Crunch data values. The data values in a given column are homogeneous, but across columns they are heterogeneous. The lengths of all columns MUST be the same. The "metadata" member is optional; if given, it MUST contain matching keys that correspond to variable definitions.

Like any JSON object, the "data" and "metadata" objects are explicitly unordered. When supplying a crunch:table, such as when POST'ing to datasets/ to create a new dataset, you must supply an Order if you want an explicit variable order.

#### Cube

Cubes have both input and output formats. The "crunch:cube" element is used for the output only.

##### Cube input

The input format may vary slightly according to the API endpoint (since some parameters may be inherent in the particular resource), but involves the same basic ingredients.

Example:

```json
{
    "dimensions": [
        {"variable": "datasets/ab8832/variables/3ffd45/"},
        {"function": "+", "args": [{"variable": "datasets/ab8832/variables/2098f1/"}, {"value": 5}]}
    ],
    "measures": {
        "count": {"function": "cube_count", "args": []}
    }
}
```

###### dimensions

An array of input expressions. Each expression contributes one dimension to the output cube. The only exception is when a dimension results in a boolean (true/false) column, in which case the data are filtered by it as a mask instead of adding a dimension to the output.

When a dimension is added, the resulting axis consists of distinct values rather than all values. Variables which are already "categorical" or "enumerated" will simply use their "categories" or "elements" as the extent. Other variables form their extents from their distinct values.

###### measures

A set of cube functions to populate each cell of the cube. You can request multiple functions over the same dimensions (such as “cube_mean” and “cube_stddev”) or more commonly just one (like “cube_count”). Each member MUST be a ZZ9 cube function designed for the purpose. See ZZ9 User Guide:Cube Functions for a list of such functions and their arguments.

###### filters

An array containing references to filters that need to be applied to the dataset before starting the cube calculations. It can be an empty array or null, in which case no filtering will be applied.

###### weight

A reference to a variable to be used as the weight on all cube operations.

##### Cube output

Cubes collect columns of measure data in an arbitrary number of dimensions. Multiple measures in the same cube share dimensions, effectively overlaying each other. For example, a cube might contain a "count" measure and a "mean" measure with the same shape:

```json
{
    "element": "crunch:cube",
    "n": 210,
    "missing": 12,
    "dimensions": [
        {"references": {"name": "A", ...}, "type": {"class": "categorical", "categories": [{"id": 1, ...}, {"id": 2, ...}, {"id": 3, ...}]}},
        {"references": {"name": "B", ...}, "type": {"class": "categorical", "categories": [{"id": 11, ...}, {"id": 12, ...}]}}
    ],
    "measures": {
        "count": {
            "metadata": {"references": {}, "type": {"class": "numeric", "integer": True, ...}},
            "data": [10, 20, 30, 40, 50, 60],
            "n_missing": 12
        },
        "mean": {
            "metadata": {"references": {}, "type": {"class": "numeric", ...}},
            "data": [3.5, 17.8, 9.9, 7.32, 0, 23.4],
            "n_missing": 12
        }
    },
    "margins": {
        "data": [210],
        "0": {"data": [30, 70, 110]},
        "1": {"data": [90, 120]},
    }
}
```

###### dimensions

The "dimensions" member is the most straightforward: an array of variable Definition objects. Each one defines an axis of the cube's output. This may be different from the input dimensions' definitions. For example, when counting numeric variables, the input dimension might be an expression involving the bin builtin function. Even though the input variable is of type "numeric", the output dimension would be of type "enum" .

###### n

The number of rows considered for all measures. 

###### measures

The "measures" member includes one object for each measure. The "metadata" member of each tells you the name, type and other definitions of the measure. The "data" member of each is a flattened array of values for that measure; the dimensions stride into that array in order, with the last dimension varying the fastest. In the example above, the first dimension ("A") has 3 categories, while "B" has 2; therefore, the "flat" array [10, 20, 30, 40, 50, 60] for the "count" measure is interpreted as the "unflattened" array [[10, 20], [30, 40], [50, 60]]. Graphically:

|   |B:11|B:12|
|---|----|----|
|A:1|  10|  20|
|A:2|  30|  40|
|A:3|  50|  60|

This is known in NumPy and other domains as "C order" (versus "Fortran order" which would be interpreted as [[10, 30, 50], [20, 40, 60]] instead).

###### n_missing

The number of rows that are missing for this measure. Because different measures may have different inputs (the column to take the mean of, for example, or weighted versus unweighted), this number may vary from one measure to another even though the total "n" is the same for all.

###### margins

The "margins" member is optional. When present, it is a tree of nested margins with one level of depth for each dimension. At the top, we always include the "grand total" for all dimensions. Then, we include a branch for each axis we "unroll". So, for example, for a 3-dimensional cube of X, Y, and Z, the margins member might contain:

```json
"margins": {
    "data": [4526],
    "0": {
        "data": [1755, 2771],
        "1": {"data": [
            [601, 370, 322, 269, 147, 46],
            [332, 215, 596, 523, 437, 668]
        ]},
        "2": {"data": [[1198, 557], [1493, 1278]]}
    },
    "1": {
        "data": [933, 585, 918, 792, 584, 714],
        "0": {"data": [
            [601, 370, 322, 269, 147, 46],
            [332, 215, 596, 523, 437, 668]
        ]},
        "2": {"data": [
            [825, 108], [560, 25], [325, 593],
            [417, 375], [191, 393], [373, 341]
        ]}
    },
    "2": {
        "data": [2691, 1835],
        "0": {"data": [[1198, 557], [1493, 1278]]},
        "1": {"data": [
            [825, 108], [560, 25], [325, 593],
            [417, 375], [191, 393], [373, 341]
        ]}
    }
}
```

Again, each branch in the tree is an axis we "unroll" from the grand total. So margins[0][2] contains the margin where X (axis 0) and Z (axis 2) are unrolled, and only Y (axis 1) is still "rolled up".
