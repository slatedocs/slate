## Variables

### Catalog

`/datasets/{id}/variables/{?relative,nosubvars}`

A Shoji Catalog of variables.

#### GET catalog

When authenticated and authorized to view the given dataset, GET returns 200 status with a Shoji Catalog of variables in the dataset. If authorization is lacking, response will instead be 404.

Private variables are not included in the index of this catalog, although entities may be present at `variables/{id}/`. See Private Variables for an index of those.

Catalog tuples contain the following keys:

Name | Type | Description
---- | ---- | -----------
name | string | Human-friendly string identifier
alias | string | More machine-friendly, traditional name for a variable
description | string | Optional longer string
id | string | Immutable internal identifier
discarded | boolean | Whether the variable should be hidden from most views; default: false
derived | boolean | Whether the variable is a function of another; default: false
type | string | The string type name, one of "numeric", "text", "categorical", "datetime", "categorical_array", or "multiple_response"
subvariables | array of URLs | For arrays, array of (ordered) references to subvariables
subvariables_catalog | URL | For arrays, link to a Shoji Catalog of subvariables



The catalog has two optional query parameters:

Name | Type | Description
---- | ---- | -----------
relative | string | If "on", all URLs in the "index" will be relative to the catalog's "self"
nosubvars | integer | If 1, array subvariables will not be included directly in the variables catalog. Their metadata are instead accessible in each array variable's "subvariables_catalog".

With both flags enabled, the variable catalog looks something like this:

```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/datasets/5ee0a0/variables/",
    "orders": {
        "hier": "https://beta.crunch.io/api/datasets/5330a0/variables/hier/",
    },
    "views": {
        "weights": "https://beta.crunch.io/api/datasets/5ee0a0/variables/weights/",
        "search": "https://beta.crunch.io/api/datasets/5ee0a0/variables/search/?q={token}"
    },
    "specification": "https://beta.crunch.io/api/specifications/variables/",
    "description": "List of Variables of this dataset",
    "index": {
        "a77d9f/": {
            "name": "Birth Year",
            "derived": false,
            "discarded": false,
            "alias": "birthyear",
            "type": "numeric",
            "id": "a77d9f",
            "description": "In what year were you born?"
        },
        "9e4c84/": {
            "name": "Comments",
            "derived": false,
            "discarded": false,
            "alias": "qccomments",
            "type": "text",
            "id": "9e4c84",
            "description": "Do you have any comments on your experience of taking this survey (optional)?"
        },
        "aad4ad/": {
            "subvariables_catalog": "aad4ad/subvariables/",
            "name": "An Array",
            "derived": true,
            "discarded": false,
            "alias": "arrayvar",
            "subvariables": [
                "439dcf/",
                "1c99ea/"
            ],
            "type": "categorical_array",
            "id": "aad4ad",
            "description": ""
        },
    }
}
```

#### PATCH catalog

Use PATCH to edit the "name", "description", "alias", or "discarded" state of one or more variables. A successful request returns a 204 response. The attributes changed will be seen by all users with access to this dataset; i.e., names, descriptions, aliases, and discarded state are not merely attributes of your view of the data but of the datasets themselves.

Authorization is required: you must have "edit" privileges on the dataset being modified, as shown in the "permissions" object in the dataset's catalog tuple. If you try to PATCH and are not authorized, you will receive a 403 response and no changes will be made.

The tuple attributes other than "name", "description", "alias", and "discarded" cannot be modified here by PATCH. Attempting to modify other attributes, or including new attributes, will return a 400 response. Variable "type" can only be modified by the "cast" method, described below. The "subvariables" can be modified by PATCH on the variable entity. "subvariables_catalog" is a URL to a different variable catalog and is thus not editable, though you can navigate to its location and modify subvariable attributes there. A variable's "id" and its "derived" state are immutable.

When PATCHing, you may include only the keys in each tuple that are being modified, or you may send the complete tuple. As long as the keys that cannot be modified via PATCH here are not modified, the request will succeed.

Note that, because this catalog contains its entities (rather than collecting them), you cannot PATCH to add new variables, nor can you PATCH a null tuple to delete them. Attempting either will return a 400 response. Creating variables is allowed only by POST to the catalog, while deleting variables is accomplished via a DELETE on the variable entity.

```json
{
    "element": "shoji:catalog",
    "index": {
        "9e4c84/": {
            "discarded": true
        }
    }
}
```

PATCHing this payload on the above catalog will return a 204 status. A subsequent GET of the catalog returns the following response; note the change in line 24.

```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/datasets/5ee0a0/variables/",
    "orders": {
        "hier": "https://beta.crunch.io/api/datasets/5330a0/variables/hier/"
    },
    "views": {
        "weights": "https://beta.crunch.io/api/datasets/5ee0a0/variables/weights/",
        "search": "https://beta.crunch.io/api/datasets/5ee0a0/variables/search/?q={token}"
    },
    "specification": "https://beta.crunch.io/api/specifications/variables/",
    "description": "List of Variables of this dataset",
    "index": {
        "a77d9f/": {
            "name": "Birth Year",
            "derived": false,
            "discarded": false,
            "alias": "birthyear",
            "type": "numeric",
            "id": "a77d9f",
            "description": "In what year were you born?"
        },
        "9e4c84/": {
            "name": "Comments",
            "derived": false,
            "discarded": true,
            "alias": "qccomments",
            "type": "text",
            "id": "9e4c84",
            "description": "Do you have any comments on your experience of taking this survey (optional)?"
        },
        "aad4ad/": {
            "subvariables_catalog": "aad4ad/subvariables/",
            "name": "An Array",
            "derived": true,
            "discarded": false,
            "alias": "arrayvar",
            "subvariables": [
                "439dcf/",
                "1c99ea/"
            ],
            "type": "categorical_array",
            "id": "aad4ad",
            "description": ""
        },
    }
}
```

#### POST catalog

A POST to this resource must be a Shoji Entity with the following "body" attributes:

 * **name**
 * **type**
 * (If "type" is "categorical", "multiple_response", or "categorical_array"): **categories**: an array of category definitions
 * If "type" is "multiple_response" or "categorical_array": **subvariables**: an array of either URLs of variables to be "bound" together to form the array variable, or partial variable definitions, which will be created as categorical variables and then bound to form the array. If including partial variable definitions, the array definition must include "categories", which are shared among the subvariables
 * If type is "multiple_response", the definition may include **selected_categories**: an array of category names present in the subvariables. This will mark the specified category or categories as the "selected" response in the multiple response variable. If no "selected_categories" array is provided, the new variable will use any categories already flagged as "selected": true. If no such category exists, the response will return a 400 status.
 * If "type" is "datetime": **resolution**: a string, such as "Y", "M", "D", "h", "m", "s", "ms", that indicates the unit size of the datetime data.

See Variable Definitions for more details and examples of valid attributes, and Feature Guide: Arrays for more information on the various cases for creating array variables.

It is encouraged, but not required, to include an "alias" in the body. If omitted, one will be generated from the required "name".

You may also include "values", which will create the column of data corresponding to this variable definition. See [Importing Data: Column-by-column](#column-by-column) for details and examples.

You may instead also include an "expr" to derive a variable as a function of other variables. In this case, "type" is not required because it depends on the output of the specified derivation function. For details and examples, see [Deriving Variables](#deriving-variables).

A 201 indicates success and includes the URL of the newly-created variable in the Location header.

#### Private variables catalog

`/datasets/{id}/variables/private/{?relative,nosubvars}`

`GET` returns a Shoji Catalog of variables, as described above, containing those variables that are private to the authenticated user. You may `PATCH` this catalog to edit names, aliases, descriptions, etc. of the private variables. `POST`, however, is not supported at this endpoint. To create new private variables, `POST` to the main variables catalog with a `"private": true` body attribute.

### Hierarchical Order

`/datasets/{id}/variables/hier/`

#### GET

Returns a Shoji Order.

#### PATCH

Will expect a Shoji Order representation containing a replacement or new grouped entities. This allows one to create new groups on the fly or overwrite existing groups with new 'entities'.

The match happens by each group name and will overwrite the values of each group with the received one.

After PATCH any variable not present in the order will always be appended to the root of the graph.

#### PUT

Receives a Shoji Order representation with a completely new graph. Any previously existing group will be eliminated and any new groups will be added. This will overwrite the complete set of current groups.

After PUT any variable not present on any of the groups will always be appended to the root of the graph.

### Weights

`/datasets/{id}/variables/weights/`

GET a "groups" view with a single group named `weight_variables` that contains the urls of the variables that have been designated as possible weight variables.

PATCH the `value` with a "groups" body. The URLs on the payload (that aren't weight variables already) will be appended to the existing list of weight variables.

PUT the `value` with a "groups" view. The value will overwrite the current weight variables with the incoming ones. Use this to delete weight variables.

```json
{
  "groups": [{
    "group": "weight_variables",
    "entities": ["https://beta.crunch.io/api/datasets/42d0a3/variables/42229f"]
  }]
}
```

<aside class="warning">
It is only possible to submit variables that belong to the main dataset. That is, variables from joined datasets cannot be set as weight.
</aside>

### Search

`/datasets/{id}/variables/search/{?q}`

On GET will return a Crunch Order with the variables matching the `q` token in the URL. The results will be under the "Search Results" group containing the urls for the matching variables.

```json
{
    "element": "shoji:view",
    "self": "https://beta.crunch.io/api/datasets/4e9a00/variables/search/?q=something",
    "description": "Returns a view with a group containing all the variables that match the given query",
    "value": {
        "groups": [
            {
                "entities": [
                    "https://beta.crunch.io/api/datasets/4e9a00/variables/b66668/",
                    "https://beta.crunch.io/api/datasets/4e9a00/variables/8f68ca/",
                    "https://beta.crunch.io/api/datasets/4e9a00/variables/f6ae03/",
                    "https://beta.crunch.io/api/datasets/4e9a00/variables/b4bd6a/",
                ],
                "group": "Search Results"
            }
        ]
    }
}
```

### Entity

`/datasets/{id}/variables/{id}/`

A Shoji Entity which exposes most of the metadata about a Variable in the dataset.

#### GET

Variable entities' `body` attributes contain the following:

Name | Type | Description
---- | ---- | -----------
name | string | Human-friendly string identifier
alias | string | More machine-friendly, traditional name for a variable
description | string | Optional longer string
id | string | Immutable internal identifier
discarded | boolean | Whether the variable should be hidden from most views; default: false
private | boolean | If true, the Variable is only visible to the owner and is only included in the private variables catalog, not the common catalog.
derived | boolean | Whether the variable is a function of another; default: false
type | string | The string type name
categories | array | If "type" is "categorical", "multiple_response", or "categorical_array", an array of category definitions (see below). Other types have an empty array.
subvariables | array of URLs | For arrays, array of (ordered) references to subvariables
derivation | object | For derived variables, a Crunch expression which was used to derive this variable; or null.
format | object | An object with various members to control the display of Variable data (see below)
view | object | An object with various members to control the display of Variable data
dataset_id | string | The id of the Dataset to which this Variable belongs.
missing_reasons | object | An object whose keys are reason phrases and whose values are missing codes. Missing entries in Variable data are represented by a {"?": code} missing marker; clients may look up the corresponding reason phrase for each code in this one-to-one map.

Category objects have the following members:

Name | Type | Description
---- | ---- | -----------
id | integer | identifier for the category, corresponding to values in the column of data
name | string | A unique label identifying the category
numeric_value | numeric | A quantity assigned to this category for numeric aggregation. May be `null`.
missing | boolean | If true, the given category is marked as "missing", and is omitted from most calculations.
selected | boolean | For categories in multiple response variables, those with `"selected": true` which values correspond to the "response" being selected. If omitted, the category is treated as not selected. Multiple response variables must have at least one category marked as selected and may have more than one.

<aside class="notice">
For variables with categories, you can get the "missing reasons" from the category definitions. You don't need the "missing_reasons" body attribute.
</aside>

Format objects may contain:

Name | Type | Description
---- | ---- | -----------
data | object | An object with an integer "digits" member, stating how many digits to display after the decimal point when showing data values.
summary | object | An object with an integer "digits" member, stating how many digits to display after the decimal point when showing aggregates values.

View objects may contain:

Name | Type | Description
---- | ---- | -----------
show_codes | boolean | For categorical types only. If true, numeric values are shown.
show_counts | boolean | If true, show counts; if false, show percents.
include_missing | boolean | For categorical types only. If true, include missing categories.
include_noneoftheabove | boolean | For multiple response types only. If true, display a "none of the above" category in the requested summary or analysis.

#### PATCH

PATCH variable entities to edit their metadata. Send a Shoji Entity with a "body" member containing the attributes to modify. Omitted body attributes will be unchanged.

Successful requests return 204 status. Among the actions achievable by PATCHing variable entities:

* Editing category attributes and adding categories. Include all categories.
* Remove categories by sending all categories except for the ones you wish to remove. You can only remove categories that don't have any corresponding data values. Attempting to remove categories that have data associated will fail with a 400 response status.
* Reordering subvariables in an array. Unlike categories, subvariables cannot be added or removed via PATCH here.
* Editing derivation expressions
* Editing format and view settings

Actions that are best or only achieved elsewhere include:

* changing variable names, aliases, and descriptions, which is best accomplished by PATCHing the variable catalog, as described above;
* changing a variable's type, which can only be done by POSTing to the variable's "cast" resource (see [Convert type](#convert-type) below);
* editing names, aliases, and descriptions of subvariables in an array, which is done by PATCHing the variable's subvariable catalog;
* altering missing rules.

Variable "id" and "dataset_id" are immutable.

#### DELETE

Calling DELETE on this resource will delete the variable. On success, `DELETE` returns 200 status with a Shoji View. When deleting array variables, this response value will contain the URLs of the (formerly sub-)variables, which are promoted to regular variables on `DELETE` of the array. That is, deleting an array "unbinds" the subvariables, and to delete the array fully, one must then make a `DELETE` request on each of the returned URLs.

For non-array variables, this View will be an empty array.

### Summary

`/datasets/{id}/variables/{id}/summary/{?filter}`

A collection of summary information describing the variable. A successful GET returns an object containing various scalars and tabular results in various formats. The set of included members varies by variable type. Exclusions, filters, and weights may all alter the output.

For example, given a numeric variable with data [1, 2, 3, 4, 5, 4, {"?": -1}, 3, 5, {"?": -1}, 4, 3], a successful GET with no exclusions, filters, or weights returns:

```json
{
    "count": 12,
    "valid_count": 10,
    "fivenum": [
        ["0", 1.0],
        ["0.25", 3.0],
        ["0.5", 3.5],
        ["0.75", 4.0],
        ["1", 5.0],
    ],
    "missing_count": 2,
    "min": 1.0,
    "median": 3.5,
    "histogram": [
        {"at": 1.5, "bins": [1.0, 2.0], "value": 1},
        {"at": 2.5, "bins": [2.0, 3.0], "value": 1},
        {"at": 3.5, "bins": [3.0, 4.0], "value": 3},
        {"at": 4.5, "bins": [4.0, 5.0], "value": 5}
    ],
    "stddev": 1.2649110640673518,
    "max": 5.0,
    "mean": 3.4,
    "missing_frequencies": [{"count": 2, "value": "No Data"}],
}
```

#### numeric

The members include several counts:

 * count: The number of entries in the variable.
 * valid_count: The number of entries in the variable which are not missing.
 * missing_count: The number of entries in the variable which are missing.
 * missing_frequencies: An array of row objects. Each row represents a distinct missing reason, and includes the reason phrase as the "value" member and the number of entries which are missing for that reason as the "count" member.
 * histogram: An array of row objects. Each row represents a discrete interval in the probability distribution, whose boundaries are given by the "bins" pair. An "at" member is included giving the midpoint between the two boundaries. The "value" member gives a count of entries which fall into the given bin.
as well as basic summary statistics:
 * fivenum: An array of five [quartile, point] pairs, where the "quartile" element is one of the strings "0", "0.25", "0.5", "0.75", "1", representing the min, first quartile, median, third quartile, and max boundaries to divide the data values into four equal groups. The "point" is the real number at each boundary, and is estimated using the same algorithm as Excel or R's "algorithm 7", where h is: (N - 1)p + 1.
 * min, median, max: taken from "fivenum", above.
 * mean: the sum of the values divided by the number of values, or, if weighted, the sum of weight times value divided by the sum of the weights.
 * stddev: The standard deviation of the values.

#### categorical

The basic counts are included:

 * count: The number of entries in the variable.
 * valid_count: The number of entries in the variable which are not missing.
 * missing_count: The number of entries in the variable which are missing.
 * missing_frequencies: An array of row objects. Each row represents a distinct missing reason, and includes the reason phrase as the "value" member. The number of entries which are missing for that reason is included as the "count" member.

And the typical "frequencies" member is expanded into a custom "categories" member:

 * categories: An array of row objects. Each row represents a distinct category (whether valid or missing), and includes its id the "_id" member (note the leading underscore), and its name as the "name" member. The "missing" member is true or false depending on whether the category is marked missing or not. The number of entries which possess that value is included as the "count" member.

#### text

The basic counts are included:

 * count: The number of entries in the variable.
 * valid_count: The number of entries in the variable which are not missing.
 * frequencies: An array of row objects. Each row represents a distinct valid value, and includes it as the "value" member. The number of entries which possess that value is included as the "count" member. The length of the array is limited to 10 entries; if more than 10 distinct values are present in the data, an 11th row is added with a "value" member of "(Others)", summing their counts.
 * missing_count: The number of entries in the variable which are missing.
 * missing_frequencies: An array of row objects. Each row represents a distinct missing reason, and includes the reason phrase as the "value" member. The number of entries which are missing for that reason is included as the "count" member.
 * nunique: The number of distinct values in the data.

In addition:

 * max_chars: The number of characters of the longest value in the data.

### Summary view model

`/datasets/{id}/variables/{id}/card_view/{?filter}`

A GET on this resource returns the information needed to render a "variable card" in the Crunch UI. It includes the same members as variables/{id}/ with the following alterations:

A "summary" member is added to the body, with the same output as `variable/{id}/summary/`.

For categorical and multiple response variables, body.summary.categories is removed, and body.categories is instead munged to include new members in each category object:

 * count: taken from summary.categories.
 * max_count: the largest "count" member from all categories.
 * total_count: the sum of the "count" members from all categories.
 * percent: (100 * count) / total_count, or {"?": -1} if no percent could be obtained.

A "weight" member is added to the body if the Variable is being used as a weight variable for the Dataset.

The "urls" member is reduced to just a "variable_url" member, which points back at the transactional view of the variable and "dataset_url" which points back to the dataset.

#### Univariate frequencies

`/datasets/{id}/variables/{id}/frequencies/{?filter,exclude_exclusion_filter}`

An array of row objects, giving the count of distinct values. The exact members vary by type:

 * numeric: Each row represents a distinct valid value, and includes it as the "value" member. The number of entries which possess that value is included as the "count" member.
 * categorical: Each row represents a distinct category (whether valid or missing), and includes its id the "_id" member (note the leading underscore), and its name as the "name" member. The "missing" member is true or false depending on whether the category is marked missing or not. The number of entries which possess that value is included as the "count" member.
 * text: Each row represents a distinct valid value, and includes it as the "value" member. The number of entries which possess that value is included as the "count" member. The length of the array is limited to 10 entries; if more than 10 distinct values are present in the data, an 11th row is added with a "value" member of "(Others)", summing their counts.

### Transforming

#### Convert type

`/datasets/{id}/variables/{id}/cast/`

A POST to this resource, with a JSON request body of {"cast_as": type}, will alter the variable to the given type. If the variable cannot be cast to the given type, 409 is returned. See next to obtain a preview summary of such a cast before committing to it.

##### Casting to datetime

 * From Numeric: Need to include keys: `offset` as an ISO-8601 date string and `resolution` which is one of the following strings:
   * Y: Year
   * Q: Quarter
   * M: Month
   * W: Week
   * D: Day
   * h: Hour
   * m: Minutes
 * From Text: Need to include a `format` key containing a valid strftime string to format with.
 * From Categorical: Need to include a `format` key containing a valid strftime string to format with.

##### Casting from datetime

 * To Numeric: Not supported
 * To Text: Need to include a `format` key containing a valid strftime string that matches the variable values to parse with.
 * To Categorical: Need to include a `format` key containing a valid strftime string that matches the category names to parse with.

##### Array variables

 * Multiple Response: Not supported
 * Categorical Array: Not supported

`/datasets/{id}/variables/{id}/cast/?cast_as={type}`

A GET on this resource will return the same response as ../summary would if the variable were cast to the given type. If the given type is not valid, 404 is returned.

### Attributes

#### Missing values

`/datasets/{id}/variables/{id}/missing_rules/`

A Shoji Entity whose "body" member contains an array of missing rule objects. POST a {reason: rule} to this URL to add a new rule. Rules take one of the following forms:

 * {'value': v}: Entries which match the given value will be marked as missing for the given reason.
 * {'set': [v1, v2, ...]}: Entries which are present in the given set will be marked as missing for the given reason.
 * {'range': [lower, upper], 'inclusive': [true, false]}: Entries which exist between the given boundaries will be marked as missing for the given reason. If either "inclusive" element is null, the corresponding boundary is unbounded.
 * {'function': '...', 'args': [...]}: Entries which match the given filter function will be marked as missing for the given reason. This is typically a tree of simple rules logical-OR'd together.

Example:

```json
[
  {
    "Invalid": {"value": 0},
    "Sarai doesn't know how to use a calculator :(": {"range": [1000, null], "inclusive": [true, false]},
  }
]
```

#### Subvariables

`/datasets/{id}/variables/{id}/subvariables/`

##### GET

This endpoint will return 404 for any variable that is not an array variable (Multiple response and Categorical variable).

For array variables, this endpoint will return a Shoji Catalog containing a variables catalog with tuples for the subvariables. The tuples will have the same shape as the main variables catalog.

##### PATCH

On PATCH, this endpoint allows modification to the variables attributes exposed on the tuples (name, description, alias, discarded).

It is possible to add new subvariables to the array variable in question. To do so include the URL of another variable (currently existing on the dataset) on the payload with an empty tuple and such variable will be converted into a subvariable and added at the end.

#### Values

`/datasets/{id}/variables/{id}/values/{?start,total,filter}`

A GET on this set of resources will return a JSON array of values from the variable's data. Numeric variables will return numbers, text variables will return strings, and categorical variables will return category names for valid categories and {"?": code} missing markers for missing categories. The "start" and "total" parameters paginate the results. The "filter" is a Crunch filter expression.

### Private Variables

`/datasets/{id}/variables/private/`

Private variables are variables that, instead of being shared with everyone, are viewable only by the user that created them. In Crunch, users with view-only permissions on a dataset can still make variables of their own–just as they can make private filters.

Private variables are not shown in the common variable catalog. Instead, they have their own Shoji Catalog of private variables belonging to the specified dataset for the authenticated user. Aside from this separate catalog, private variable entities and the catalog behave just as described above for public variables.
