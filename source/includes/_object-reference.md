# Object Reference

version 0.15

The Crunch REST API takes a decidedly column-oriented approach to data. A "column" is simply a sequence of values of the same type. A "variable" binds a name (and other metadata) to the column, and indeed may possess a series of columns over its lifetime as inserts and updates are made to it. A "dataset" is a set of variables. Each variable in the dataset is sorted the same way; the variables together form a relation. Reading the N'th item from each variable produces a row.

Interaction with the Crunch REST API is by variables and columns. When you add data to Crunch, you send a set of columns. When you fetch data from Crunch, you send a set of variable expressions and receive a set of columns. When you update data in Crunch, you send a set of expressions which tells Crunch how to update variables with new column data.

The Crunch API consists of just a few primitive objects, arranged differently for each request and response. Learning the basic components will help you create the most complicated queries.

## Response types

### Shoji entity

A Shoji entity is identified by the `element` key having value `shoji:entity`.
Its principal attribute is the `body` key, which is an object containing the
attributes that describe the entity.

### Shoji catalog

A catalog is identified by its `element` key having value `shoji:catalog` with
its principal attribute being `index` that contains an object keyed by the URLs
of the entities it contains and for each key an object (tuple) with attributes
from the referenced entity.

Shoji catalogs are **not** ordered. For its ordered representations they may
provide an `orders` set of Shoji order resources.

### Shoji view

A Shoji view is identified by its `element` key having value `shoji:view` with
its principal attribute being `value`. This can contain any arbitrary JSON
object.

### Shoji order

Shoji orders are identified by the `element` key having a value `shoji:order`.
Their principal attribute is the `graph` key which is an array containing the
order of present resources.

A shoji order may be associated with a catalog. In such case it will contain a
subset or totality of the entities present in the catalog. The catalog remains
as the authoritative source of available entities.

Any entity not present on the order but present in the catalog may be
considered to belong at the bottom of the root of the graph in an arbitrary
order, or may be excluded from view.

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

Crunch employs a structural type system rather than a nominative one. The variable definition includes more knowledge than just the type name (numeric, text, categorical, etc); we also learn details about range, precision, missing values and reasons, order, etc. For example:

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

This section describes the metadata of a variable as exposed across HTTP, both expected response values and valid input values.

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

Variables in Crunch have multiple attributes that provide identifying information: "name", "alias", and "description".

##### name

Crunch takes a principled stand that variable "names" should be for people, not for computers.

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

These attributes must be present for the specified variable types when creating a variable, but they are not defined for other types.

##### categories

Categorical variables must contain an array of Category objects, each of which includes:

* **id**: a read-only integer identifier for the category. These correspond to the data values.
* **name**: the string name which applications should use to identify the category.
* **numeric_value**: the numeric value bound to each name. If no numeric value should be bound, this should be null. numeric_values need not be unique, and they may be `null`.
* **missing**: boolean indicating whether the data corresponding to this category should be interpreted as missing.
* **selected**: (optional) boolean indicating whether this category corresponds to a selected value for a dichotomized variable, i.e. part of a multiple response variable. Not required for regular categorical variables, and defaults to `false` if omitted. There also is no requirement for Categories in a multiple-response variable that only one Category be marked "selected".

Categories are valid if:

* Category names are unique within the set
* Category ids are unique within the set
* Category ids for user-defined categories are positive integers no greater than 32767. Negative ids are reserved for system missing reasons. See "missing_reasons" below.

The order of the array defines the order of the categories, and thus the order in which aggregate data will be presented. This order can be changed by saving a reordered set of Categories.

##### subvariables

Multiple Response and Categorical Array variables contain an array of subvariable
 references. In the HTTP API, these are presented as URLs. To create a variable
 of type "multiple_response" or "categorical_array", you must include a
 "subvariables" member with an array of subvariable references. These variables
 will become the subvariables in the new array variable.

Like Categories, the array of subvariables within an array variable indicate
 the order in which they are presented; to reorder them, save a modified array
 of subvariable ids/urls.

##### subreferences

Multiple Response and Categorical Array variables contain an object of subvariable
 "references": names, alias, description, etc. To create a variable of type
 "multiple_response" or "categorical_array" directly, you must include a
 "subreferences" member with an object of objects. These label the subvariables
 in the new array variable.

The shape of each subreferences member must contain a name and optionally an alias.
Note that the subreferences is an unordered object. The order of the subvariables
is read from the "subvariables" attribute.

```json
{
    "type": "categorical_array",
    "name": "Example array",
    "categories": [
        {
            "name": "Category 1",
            "numeric_value": 1,
            "id": 1,
            "missing": false
        },
        {
            "name": "Category 2",
            "numeric_value": 0,
            "id": 2,
            "missing": false
        }
    ],
    "subvariables": [
      "/api/datasets/abcdef/variables/abc/subvariables/1/",
      "/api/datasets/abcdef/variables/abc/subvariables/2/",
      "/api/datasets/abcdef/variables/abc/subvariables/3/"
    ],
    "subreferences": {
        "/api/datasets/abcdef/variables/abc/subvariables/2/": {"name": "subvariable 2", "alias": "subvar2_alias"},
        "/api/datasets/abcdef/variables/abc/subvariables/1/": {"name": "subvariable 1"},
        "/api/datasets/abcdef/variables/abc/subvariables/3/": {"name": "subvariable 3"}
    }
}
```

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
* include_noneoftheabove: For multiple-response types only. If true, display a "none of the above" category in the requested summary or analysis.
* geodata: A list of associations of a variable to Crunch geodatm entities. PATCH a variable entity amending the `view.geodata` in order to create, modify, or remove an association. An association is an object with required keys `geodatum`, `feature_key`, and optional `match_field`. The geodatum must exist; `feature_key` is the name of the property of each ‘feature’ in the geojson/topojson that corresponds to the `match_field` of the variable (perhaps a dotted string for nested properties; e.g. ”properties.postal-code”). By default, `match_field` is “name”: a categorical variable will match category names to the `feature_key` present in the given geodatum.

##### discarded

Discarded is a boolean value indicating whether the variable should be viewed as part of the dataset. Hiding variables by setting discarded to True is like a soft, restorable delete method.

Default is `false`.

##### private

If `true`, the variable will not show in the common variable catalog; instead, it will be included in the personal variables catalog. 

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

Crunch supports array type variables, which contain an array of subvariables. "Multiple response" and "Categorical array" are both arrays of categorical subvariables. Subvariables do not exist as independent variables; they are exposed as "virtual" variables in some places, and can be analyzed independently, but they do not have their own type or categories.

Arrays are currently always categorical, so they sned and receive data in the same format: category ids. The only difference is that regular categorical variables sned and receive one id per row, where arrays send and receive a list of ids (of equal length to the number of subvariables in the array).

### Variables

A complete Variable, then, is simply a Definition combined with its data array.

### Expressions

Crunch expressions are used to compute on a dataset, to do nuanced selects,
updates, and deletes, and to accomplish many other routine operations.
Expressions are JSON objects in which each term is wrapped in an object which
declares whether the term is a variable, a value, or a function, etc. While
verbose, doing so allows us to be more explicit about the operations we wish
to do.

Expressions generally contain references to **variables**, **values**, or **columns** of values, often composed in **functions**. The output of expressions can be other variables, values, boolean masks, or cube aggregations, depending on the context and expression content. Some endpoints have special semantics, but the general structure of the expressions follows the model described below.

#### Variable terms

Terms refer to variables when they include a "variable" member. The value is the URL for the desired variable. For example:

 * `{"variable": "../variables/X/"}`
 * `{"variable": "https://app.crunch.io/api/datasets/48ffc3/joins/abcd/variables/Y/"}`

URLs must either be absolute or relative to the URL of the current request. For example, to refer to a variable in a query at `https://app.crunch.io/api/datasets/48ffc3/cube/`, a variable at `https://app.crunch.io/api/datasets/48ffc3/variables/9410fc/` may be referenced by its full URL or by "../variables/9410fc/".

#### Value terms

Terms refer to data values when they include a "value" member. Its value is any individual data value; that is, a value that is addressable by a column and row in the dataset. For example:

 * `{"value": 13}`
 * `{"value": [3, 4, 5]}`

Note that individual values may themselves be complex arrays or objects, depending on their type. You may explicitly include a "type" member in the object, or let Crunch infer the type. One way to do this is to use the "typeof" function to indicate that the value you're specifying corresponds to the exact type of an existing variable. See "functions" below for more details.

#### Column terms

Terms refer to columns (construct them, actually) when they include a "column" member. The value is an array of data values. You may include "type" and/or "references" members as well.

 * `{"column": [1, 2, 3, 17]}`
 * `{"column": [{"?": -2}, 1, 4, 1], "type": {"class": "categorical", "categories": [...], ...}}`

#### Function terms

Terms refer to functions (and operators) when they include a "function" member. The value is the identifier for the desired function. They parameterize the function with an "args" member, whose value is an array of terms, one for each argument. Examples:

 * `{"function": "==", "args": [{"variable": "../variables/X/"}, {"value": 13}]}`
 * `{"function": "contains", "args": [{"variable": "../joins/abcd/variables/Y/"}, {"value": "foo"}]}`

You may include a "references" member to provide a name, alias, description, etc to the output of the function.

##### Supported functions
Here is a list of all functions available for crunch expressions.  Note that these functions can be used in conjuction
to compose an expression.

##### Binary functions
   * `+` add
   * `-` subtract
   * `*` multiply
   * `/` div divide
   * `//` floor division
   * `^` power
   * `%` modulus
   * `&` bitwise and
   * `|` bitwise or
   * `~` invert

##### Builtin functions

   * `array` Return the given Frame materialized as an array.
   * `as_selected` Return the given variable reduced to the [1, 0, -1] "selections" type.
   * `bin` Return column's values broken into equidistant bins.
   * `case` Evaluate the given conditions in order, selecting the corresponding choice.
   * `cast` Return a Column of column's values cast to the given type.
   * `char_length` Return the length of each string (or missing reason) in the given column.
   * `copy_variable` Returns a copy of the column with a copy of its metadata.
   * `combine_categories` Return a column of categories combined according to the category_info.
   * `combine_responses` Combine the given categorical variables into a new one.
   * `current_batch` Return the batch_id of the current frame.
   * `get` Return a subvariable from the given column.
   * `lookup` Map each row of source through its keys index to a corresponding value.
   * `missing` Return the given column as missing for the given reason.
   * `normalize` Return a Column with the given values normalized so sum(c) == len(c).
   * `row` Return a Numeric column with row indices.
   * `selected_array` Return a bool Array from the given categorical, plus None/__none__/__any__ .
   * `selected_depth` Return a numeric column containing the number of selected categories in each row of the given array.
   * `selections` Return the given array, reduced to the [1, 0, -1] "selections" type, plus an `__any__` magic subvariable.
   * `subvariables` Return a Frame containing subvariables of the given array.
   * `tiered` Return a variable formed by collapsing the given array's subvariables in the given category tiers.
   * `typeof` Return (a copy of) the Type of the given column.
   * `unmissing` Return the given column with user missing replaced by valid values.

##### Comparisons

   * `==` equals
   * `!=` not equals
   * `=><=` between
   * `between` between
   * `<` less than
   * `>` greater than
   * `<=` less than or equal
   * `>=` greater than or equal
   * `in` in
   * `all` True for each row where all subvariables in a multiple_response array are selected
   * `any` True for each row where any subvariable in a multiple_response array is selected
   * `is_none_of_the_above` True for each row where no subvariables in a multiple_response array are selected, unless all subvariables have missing values
   * `contains` Return a mask where A is an element of array B, or a key of object B.
   * `icontains` Case-insensitive version of 'contains'
   * `~=` compare against regular expression (regex)
   * `and` logical and
   * `or` logical or
   * `not` logical not
   * `is_valid` Boolean array of rows which are valid for the given column
   * `is_missing` Boolean array of rows which are missing for the given column
   * `any_missing` Boolean array of rows where any of the subvariables are missing
   * `all_valid` Boolean array of rows where all of the subvariables are valid
   * `all_missing` Boolean array of rows where all of the subvariables are missing

##### Date Functions

   * `default_rollup_resolution` default_rollup_resolution
   * `datetime_to_numeric` Convert the given datetime column to numeric.
   * `format_datetime` Convert datetime values to strings using the fmt as strftime mask.
   * `numeric_to_datetime` Convert the given numeric column to datetime with the given resolution.
   * `parse_datetime` Parse string to datetime using optional format string
   * `rollup` Return column's values (which must be type datetime) into calendrical bins.

##### Frame Functions

    * `page` Return the given frame, limited/offset by the given values.
    * `select` Return a Frame of results from the given map of variables.
    * `sheet` Return the given frame, limited/offset in the number of variables.
    * `dependents` Return the given frame with only dependents of the given variable.
    * `deselect` Return a frame NOT including the indicated variables.
    * `adapt` Return the given frame adapted to the given to_key.
    * `join` Return a JoinedFrame from the given list of subframes.
    * `find` Return a Frame with those variables which match the given criteria.
    * `flatten` Return a frame including all variables, plus all subvariables at dotted ids.

###### Examples

* **select**: Receives an argument which is a map expression in the following shape:
```json

{
  "function": "select",
  "args": [{
    "map": {
      <destination id>: {variable: <source frame id>},
      <destination id>: {variable: <source frame id>},
      ...
    }
  }]

}
```
Where `destination id` is the ID that the mapped variable will have on the
resulting frame by selecting only the `source frame id` variables from the
frame where this function is applied on.

* **deselect**: Same as `select` but will exclude the variable ids mentioned
from the source frame. On this usage the `destination id` part of the `map`
argument are disregarded.
```json

{
  "function": "deselect",
  "args": [{
    "map": {
      <destination id>: {variable: <source frame id>},
      <destination id>: {variable: <source frame id>},
      ...
    }
  }]

}
```

##### Measures Functions

   * `cube_count`
   * `cube_distinct_count`
   * `cube_max` A measure which returns the maximum value in a column.
   * `cube_mean`
   * `cube_min` A measure which returns the minimum value in a column.
   * `cube_missing_frequencies` Return an object with parallel 'code' and 'count' arrays.
   * `cube_quantile`
   * `cube_stddev` A measure which returns the standard deviation value in a column.
   * `cube_sum`
   * `cube_valid_count`
   * `cube_weighted_max`
   * `cube_weighted_min`
   * `top` Return the given (1D/1M) cube, filtered to its top N members.

##### Cube Functions

   * `autocube` Return a cube crossing A by B (which may be None).
   * `autofreq` Return a cube of frequencies for A.
   * `cube` Return a Cube instance from the given arguments.
   * `each` Yield one expression result per item in the given iterable.
   * `multitable` Return cubes for each target variable crossed by None + each template variable.
   * `transpose` Transpose the given cube, rearranging its (0-based) axes to the given order.
   * `stack` Return a cube of 1 more dimension formed by stacking the given array.

#### Filter terms

Terms that refer to filters entities by URL are shorthand for the boolean expression stored in the entity. So, `{"filter": "../filters/59fc4d/"}` yields the Crunch expression contained in the Filter entity's "expression" attribute. Filter terms can be combined together with other expressions as well. For example, `{"function": "and", "args": [{"filter": "../filters/59fc4d/"}, {"function": "==", "args": [{"variable": "../variables/X/"}, {"value": 13}]}]}` would "and" together the boolean expression in filter 59fc4d with the `X == 13` expression.

## Documents

### Shoji

Most representations returned from the API are Shoji Documents. Shoji is a media type designed to foster scalable API's. Shoji is built with JSON, so any JSON parser should be able to at least deserialize Shoji documents. Shoji adds four document types: Entity, Catalog, View, and Order.

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

#### Catalog

Catalogs collect or contain entities. They act as an index to a collection, and indeed possess an "index" member for this:

```json
{
    "element": "shoji:catalog",
    "self": "https://.../api/users/",
    "description": "A list of all the users.",
    "specification": "https://.../api/specifications/users/",
    "orders": {
        "default": "default_order/"
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

In general, an HTTP GET to the "self" URL will return the document, and a PUT of the same will update it. Many catalogs allow POST to add a new entity to the collection. PUT should not be used for partial updates--use PATCH for that instead. In general, each member included in the "index" of a PATCH message will replace the current representation; tuples not included will not be altered. Tuples included in a PATCH which are not present in the server's current representation of the index may be added; it is up to each resource whether to support (and document!) this approach or prefer POST to add entities to the collection. In general, catalogs that _contain_ entities get new entities created by POST, while catalogs that _collect_ entities that are contained by other catalogs (e.g. a catalog of users who have permissions on a dataset) will have entities added by PATCH.

Similarly, removing entities from catalogs is supported in one of two ways, typically varying by catalog type. For catalogs that contain entities, entities are removed only by DELETE on the entity's URL (its key in the Catalog.index). In contrast, for catalogs that collect entities, entities are removed by PATCHing the catalog with a `null` tuple. This removes the entity from the catalog but does not delete the entity (which is contained by a different catalog). T

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
    },
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
            "metadata": {"references": {}, "type": {"class": "numeric", "integer": true, ...}},
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
        "1": {"data": [90, 120]}
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
{
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
