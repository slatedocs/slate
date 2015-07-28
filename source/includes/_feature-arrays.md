## Array Variables

Simple variables have only one value per row; sometimes, however, it is convenient to consider multiple values (of the same type) as a single Variable. The Crunch system implements these as an array of "subvariables" which are defined as any other variable, but are then bound together into a single logical "parent" variable. These come in two types of parent variable: categorical array and multiple response.

### Categorical arrays

For the "categorical_array" type, each subvariable is considered distinct, and a row may have a different value for each of them. For example, you might field a survey where you ask respondents to rate soft drinks by filling in a grid of a set of brands versus a set of ratings:

72. How much do you like each soft drink?
       Not at all   Not much   OK   A bit   A lot
 Coke       o           o      o      o       o
Pepsi       o           o      o      o       o
   RC       o           o      o      o       o

The respondent may only select one rating in each row. To represent that answer data in Crunch, you would first define a Variable for "Coke", one for "Pepsi", and one for "RC". Each of them would be of type "categorical", with a set of categories like:

"categories": [
    {"id": -1, "name": "No Data",    "numeric_value": None, "missing":  True},
    {"id":  1, "name": "Not at all", "numeric_value": None, "missing": False},
    {"id":  2, "name": "Not much",   "numeric_value": None, "missing": False},
    {"id":  3, "name": "OK",         "numeric_value": None, "missing": False},
    {"id":  4, "name": "A bit",      "numeric_value": None, "missing": False},
    {"id":  5, "name": "A lot",      "numeric_value": None, "missing": False},
    {"id": 99, "name": "Skipped",    "numeric_value": None, "missing":  True}
]

These variables would be populated like any other Variable of type "categorical". For example, when sending data Column-by-column, you might POST a Variable Entity with the payload:

{
    ...
    "body": {
        "name": "Coke",
        "type": "categorical",
        "categories": [...],
        "values": [2, 4, 4, {"?": 99}, {"?": -1}, 3, ...]
    }
}

Once all of the individual variables have been defined (you don't have to have all their data added yet), then you may create the parent array variable. Doing so by POSTing a Variable Entity would have a payload like:

{
    "body": {
        "name": "Soft Drinks",
        "type": "categorical_array",
        "subvariables": [<URI of the "Coke" variable>, <URI of the "Pepsi" variable>, <URI of the "RC" variable>]
    }
}

The "Soft Drinks" categorical array variable may now be included in analyses like any other variable, but has 2 dimensions instead of the typical 1. For example, a crosstab of a 1-dimensional "Gender" variable with a 1-dimensional "Education" variable yields a 2-D cube. A crosstab of 1-D "Gender" by 2-D "Soft Drinks" yields a 3-D cube.

### Multiple response
The second type of array is "multiple_response". These arrays look very similar to categorical_array variables in their data representations, but are usually gathered very differently and behave differently in analyses. For example, you might field a survey where you ask respondents to select countries they have visited:

38. Which countries have you visited?

[] USA
[] Germany
[] Japan
[] None of the above 

The respondent may check the box or not for each row. To represent that answer data in Crunch, you would first define a Variable for "USA", one for "Germany", one for "Japan", and one for "None of the above". Each of them would be of type "categorical".

"categories": [
    {"id": -1, "name": "No Data",     "numeric_value": None, "missing":  True},
    {"id":  1, "name": "Checked",     "numeric_value": None, "missing": False},
    {"id":  2, "name": "Not checked", "numeric_value": None, "missing": False},
    {"id": 98, "name": "Not shown",   "numeric_value": None, "missing":  True},
    {"id": 99, "name": "Skipped",     "numeric_value": None, "missing":  True}
]

These variables would be populated like any other Variable of type "categorical". For example, when sending data Column-by-column, you might POST a Variable Entity with the payload:

{
    ...
    "body": {
        "name": "USA",
        "type": "categorical",
        "categories": [...],
        "values": [1, 2, 2, {"?": 99}, {"?": -1}, 1, ...]
    }
}

Once all of the individual variables have been defined (you don't have to have all their data added yet), then you may create the parent array variable. Doing so by POSTing a Variable Entity would have a payload like:

{
    "body": {
        "name": "Countries Visited",
        "type": "multiple_response",
        "subvariables": [<URI of the "USA" variable>, <URI of the "Germany" variable>, <URI of the "Japan" variable>],
        "selected_categories": ["Checked"]
    }
}

Aside from the new type name, the primary difference from the basic categorical array is that one or more categories are marked as "selected". These are then used to dichotomize the categories such that any subvariable response is treated more as if it were true or false (selected or unselected) than maintaining the difference between each category. If POSTing to create "multiple_response", you may include a "selected_categories" key in the body, containing an array of category names that indicate the dichotomous selection. If you do not include "selected_categories", there must be at least one "selected": true category in the subvariables you are binding into the multiple-response variable to indicate the dichotomous selection–see Object Reference#categories. If neither are true, the request will return 400 status.

The "Countries Visited" categorical array variable may now be included in analyses like any other variable, but with a noticeable difference. Rather than contributing a dimension of distinct categories, it instead contributes a dimension of distinct subvariables. For example, a crosstab of a 1-dimensional "Gender" variable with a 1-dimensional "Education" variable yields a 2-D cube: one dimension of the categories of Gender and one dimension of the categories of Education. A crosstab of 1-D "Gender" by the multiple response "Countries Visited" also yields a 2-D cube: one dimension of the categories of Gender but the other dimension has one entry for "USA", one for "Germany", one for "Japan", and one for "None of the above".

A quirk of multiple response variables is that analyses of them often require knowledge across subvariables: which rows had any subvariable selected, which rows had no subvariable selected, and which rows had all subvariables marked as "missing". The Crunch system calculates these ancillary "subvariables" for you, and includes them in analysis output. Including an explicit "None of the above" subvariable in the example above complicates this, since Crunch has no way of knowing to treat such subvariables specially; it will faithfully consider the "None of the above" subvariable like any other subvariable when calculating the any/none/missing views. Depending on your application, you may wish to 1) not even include that option in your survey, 2) skip adding that variable to your Crunch dataset, 3) add it but do not bind it into the parent array variable, or 4) include it and have it be treated like any other multiple response subvariable in your analyses.

### Naming Subvariables

To define array variables, you must first define the categorical variables that comprise them, then bind them into an array by POSTing a variable definition with type "categorical_array" or "multiple_response" and a "subvariables" key, which contains an array of URLs of the categorical variables. See above for examples. There is not currently a one-step method of defining an array variable without first defining its constituent parts. 

Given the uniqueness constraint on names, along with the procedure for creating array variables, you may encounter challenges when trying to create many array variables that have subvariables with names in common. If you were to try to define all of your subvariables first, then bind sets of them into arrays, you would fail because of the constraint that non-subvariable names must be unique. This is because the individual variables aren't considered "subvariables" until you bind them into arrays–they're regular variables, subject to the uniqueness constraint. A solution is to add array subvariables one array at a time and bind them into the array before adding the next array's subvariables.

### Adding new subvariables

In the scenario that a variable was left out when creating an array variable, it is possible to modify the array variable so that new subvariables get added (always on the last position).

To do so, the subvariable-to-be should currently be a variable of the dataset and have the same type as the subvariables ("categorical").

Send a PATCH request containing the url of the new subvariable with an empty object as its tuple:

{
  ...
  index: {
      http://.../url/new/subvariable/: {}
  }
}

A 204 response will indicate that the catalog was updated, and the new subvariable now is part of the array variable.