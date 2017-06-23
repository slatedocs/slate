## Array Variables

Simple variables have only one value per row; sometimes, however, it is convenient to consider multiple values (of the same type) as a single Variable. The Crunch system implements the data as a 2-dimensional array, but the array variable includes two additional attributes: "subvariables", which is a list of subvariable URLs, and "subreferences", which is an object of {name, alias, description, ...} objects keyed by subvariable URL. There are two types of array variable: categorical array and multiple response.

### Categorical arrays

For the "categorical_array" type, a row has multiple values, and may have a different value for each subvariable. For example, you might field a survey where you ask respondents to rate soft drinks by filling in a grid of a set of brands versus a set of ratings:

```
72. How much do you like each soft drink?
       Not at all   Not much   OK   A bit   A lot
 Coke       o           o      o      o       o
Pepsi       o           o      o      o       o
   RC       o           o      o      o       o
```

The respondent may only select one rating in each row. To represent that answer data in Crunch, you would define an array. For example, you might POST a Variable Entity with the payload:

```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Soft Drinks",
        "type": "categorical_array",
        "subvariables": [
            "./subvariables/001/", 
            "./subvariables/002/",
            "./subvariables/003/"
         ],
        "subreferences": {
            "./subvariables/002/": {"name": "Coke", "alias": "coke"},
            "./subvariables/003/": {"name": "Pepsi", "alias": "pepsi"},
            "./subvariables/001/": {"name": "RC", "alias": "rc"}
        },
        "categories": [
            {"id": -1, "name": "No Data",    "numeric_value": null, "missing":  true},
            {"id":  1, "name": "Not at all", "numeric_value": null, "missing": false},
            {"id":  2, "name": "Not much",   "numeric_value": null, "missing": false},
            {"id":  3, "name": "OK",         "numeric_value": null, "missing": false},
            {"id":  4, "name": "A bit",      "numeric_value": null, "missing": false},
            {"id":  5, "name": "A lot",      "numeric_value": null, "missing": false},
            {"id": 99, "name": "Skipped",    "numeric_value": null, "missing":  true}
        ],
        "values": [
            [1, 2, {"?": 99}],
            [{"?": -1}, 4, 3],
            [5, 2, {"?": -1}],
        ]
    }
}
```

The "Soft Drinks" categorical array variable may now be included in analyses like any other variable, but has 2 dimensions instead of the typical 1. For example, a crosstab of a 1-dimensional "Gender" variable with a 1-dimensional "Education" variable yields a 2-D cube. A crosstab of 1-D "Gender" by 2-D "Soft Drinks" yields a 3-D cube.

In rare cases, you may have already added a separate Variable for "Coke", one for "Pepsi", and one for "RC". You may move them to a single array variable by POSTing a Variable Entity for the array that instead of a "subreferences" attribute has a "subvariables" attribute, a list of URL's of the variables you'd like to bind together:

```json
{
    "body": {
        "name": "Soft Drinks",
        "type": "categorical_array",
        "subvariables": [<URI of the "Coke" variable>, <URI of the "Pepsi" variable>, <URI of the "RC" variable>]
    }
}
```

The existing variables are removed from the normal order and become virtual subvariables of the new array. This approach will cast all subvariables to a common set of categories if they differ. The existing name and alias of each subvariable will be moved to the array's "subreferences" attribute.

If you wish to analyze a set of categorical variables as an array *without* moving them, you need to build a derived array instead.

```json
{
    "body": {
        "name": "Soft Drinks",
        "type": "categorical_array",
        "derivation": {
            "function": "array",
            "args": [{
                "function": "select",
                "args": [{"map": {
                    "000000": {"variable": <URI of the "Coke" variable>},
                    "000001": {"variable": <URI of the "Pepsi" variable>},
                    "000002": {"variable": <URI of the "RC" variable>}
                }}]
            }]
        }
    }
}
```

Your client library may have helper functions to construct the above more easily. This is a bit more advanced, but consequently more powerful: you can grab subvariables from other existing arrays, use more powerful subsetting functions like "deselect" and "subvariables", cast, combine, what-have-you.


### Multiple response
The second type of array is "multiple_response". These arrays look very similar to categorical_array variables in their data representations, but are usually gathered very differently and behave differently in analyses. For example, you might field a survey where you ask respondents to select countries they have visited:

```
38. Which countries have you visited?

[] USA
[] Germany
[] Japan
[] None of the above 
```

The respondent may check the box or not for each row. To represent that answer data in Crunch, you would define an array Variable with separate subreferences for "USA", "Germany", "Japan", and "None of the above":

```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Countries Visited",
        "type": "multiple_response",
        "subvariables": [
            "./subvariables/001/", 
            "./subvariables/002/",
            "./subvariables/003/",
            "./subvariables/004/"
         ],
        "subreferences": {
            "./subvariables/002/": {"name": "USA", "alias": "visited_usa"},
            "./subvariables/004/": {"name": "Germany", "alias": "visited_germany"},
            "./subvariables/001/": {"name": "Japan", "alias": "visited_japan"},
            "./subvariables/003/": {"name": "None of the above", "alias": "visited_none_of_the_above"}
        },
        "categories": [
            {"id": -1, "name": "No Data",     "numeric_value": null, "missing":  true},
            {"id":  1, "name": "Checked",     "numeric_value": null, "missing": false, "selected": true},
            {"id":  2, "name": "Not checked", "numeric_value": null, "missing": false},
            {"id": 98, "name": "Not shown",   "numeric_value": null, "missing":  true},
            {"id": 99, "name": "Skipped",     "numeric_value": null, "missing":  true}
        ]
    }
}
```

Aside from the new type name, the primary difference from the basic categorical array is that one or more categories are marked as "selected". These are then used to dichotomize the categories such that any subvariable response is treated more as if it were true or false (selected or unselected) than maintaining the difference between each category. If POSTing to create "multiple_response", you may include a "selected_categories" key in the body, containing an array of category names that indicate the dichotomous selection. If you do not include "selected_categories", there must be at least one "selected": true category in the subvariables you are binding into the multiple-response variable to indicate the dichotomous selection–see Object Reference#categories. If neither are true, the request will return 400 status.

The "Countries Visited" multiple response variable may now be included in analyses like any other variable, but with a noticeable difference. Rather than contributing a dimension of distinct categories, it instead contributes a dimension of distinct subvariables. For example, a crosstab of a 1-dimensional "Gender" variable with a 1-dimensional "Education" variable yields a 2-D cube: one dimension of the categories of Gender and one dimension of the categories of Education. A crosstab of 1-D "Gender" by the multiple response "Countries Visited" also yields a 2-D cube: one dimension of the categories of Gender but the other dimension has one entry for "USA", one for "Germany", one for "Japan", and one for "None of the above".

A quirk of multiple response variables is that analyses of them often require knowledge across subvariables: which rows had any subvariable selected, which rows had no subvariable selected, and which rows had all subvariables marked as "missing". The Crunch system calculates these ancillary "subvariables" for you, and includes them in analysis output. Including an explicit "None of the above" subvariable in the example above complicates this, since Crunch has no way of knowing to treat such subvariables specially; it will faithfully consider the "None of the above" subvariable like any other subvariable when calculating the any/none/missing views. Depending on your application, you may wish to 1) not even include that option in your survey, 2) skip adding that variable to your Crunch dataset, 3) add it but do not bind it into the parent array variable, or 4) include it and have it be treated like any other multiple response subvariable in your analyses.


### Non-uniform basis

As presented above, multiple response variables assume that subvariables have a consistent, uniform basis or number of rows in each subvariable. In some cases, the number of valid and missing entries may be wildly different from one subvariable to the next. In a survey example, a new response may be added to a longer-running series, or different responses may be presented to subsets of respondents in the context of an experiment. The boolean field `uniform_basis`, if `false`, provides a hint to users that, rather than using the `__any__` column (from the `selections` function output) in an analysis query, they should instead calculate the basis per subvariable by summing the ‘selected’ and ‘not selected’ categories. The field’s default is `true`.

### Adding new subvariables

In the scenario that a variable was left out when creating an array variable, it is possible to modify the array variable so that new subvariables get added (always on the last position).

To do so, the subvariable-to-be should currently be a variable of the dataset and have the same type as the subvariables ("categorical").

Send a PATCH request containing the url of the new subvariable with an empty object as its tuple:

```json
{
  ...
  "index": {
      "http://.../url/new/subvariable/": {}
  }
}
```

A 204 response will indicate that the catalog was updated, and the new subvariable now is part of the array variable.
