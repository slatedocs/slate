## Deriving Variables

Derived variables are variables that, instead of having a column of values backing them, are functionally dependent on other variables. In Crunch, users with view-only permissions on a dataset can still make derived variables of their own–just as they can make filters. Dataset editors can also derive other types of variables as permanent additions to the dataset, available for all viewers.

<aside class="notice">
    In this section, sample variable documents have been trimmed to the attributes essential to the derivation examples. Actual variable documents in the wild will have more attributes than those shown here.
</aside>

### Combining categories

The "combine_categories" function takes two arguments:

* A reference to the categorical or categorical_array variable to be combined
* A definition of the categories of the new variable, including all members found in categories, plus a "combined_ids" key that maps the derived category to one or more categories (by id) in the input variable.

Given a variable such as:

```json
{
    "element": "shoji:entity",
    "self": "https://beta.crunch.io/api/datasets/3ad42c/variables/0000f5/",
    "body": {
        "name": "Education",
        "alias": "educ",
        "type": "categorical",
        "categories": [
            {
                "numeric_value": null,
                "missing": true,
                "id": -1,
                "name": "No Data"
            },
            {
                "numeric_value": 1,
                "missing": false,
                "id": 1,
                "name": "No HS"
            },
            {
                "numeric_value": 2,
                "missing": false,
                "id": 2,
                "name": "High school graduate"
            },
            {
                "numeric_value": 3,
                "missing": false,
                "id": 3,
                "name": "Some college"
            },
            {
                "numeric_value": 4,
                "missing": false,
                "id": 4,
                "name": "2-year"
            },
            {
                "numeric_value": 5,
                "missing": false,
                "id": 5,
                "name": "4-year"
            },
            {
                "numeric_value": 6,
                "missing": false,
                "id": 6,
                "name": "Post-grad"
            },
            {
                "numeric_value": 8,
                "missing": true,
                "id": 8,
                "name": "Skipped"
            },
            {
                "numeric_value": 9,
                "missing": true,
                "id": 9,
                "name": "Not Asked"
            }
        ],
        "description": "Education"
    }
}
```

POST'ing to the private variables catalog a Shoji Entity containing a ZCL function like:

```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Education (3 category)",
        "description": "Combined from six-category education",
        "alias": "educ3",
        "expr": {
            "function": "combine_categories",
            "args": [
                {
                    "variable": "https://beta.crunch.io/api/datasets/3ad42c/variables/0000f5/"
                },
                {
                    "value": [
                        {
                            "name": "High school or less",
                            "numeric_value": null,
                            "id": 1,
                            "missing": false,
                            "combined_ids": [1, 2]
                        },
                        {
                            "name": "Some college",
                            "numeric_value": null,
                            "id": 2,
                            "missing": false,
                            "combined_ids": [3, 4]
                        },
                        {
                            "name": "4-year college or more",
                            "numeric_value": null,
                            "id": 3,
                            "missing": false,
                            "combined_ids": [5, 6]
                        },
                        {
                            "name": "Missing",
                            "numeric_value": null,
                            "id": 4,
                            "missing": true,
                            "combined_ids": [8, 9]
                        },
                        {
                            "name": "No data",
                            "numeric_value": null,
                            "id": -1,
                            "missing": true,
                            "combined_ids": [-1]
                        }
                    ]
                }
            ]
        }
    }
}
```

results in a private categorical variable with three valid categories.

Combining the categories of a categorical array is the same as it is for categorical variables. The resulting variable is also of type "categorical_array". This variable type also has a "subvariables_catalog", like the variable from which it is derived, and the subvariables contained in it are derived "combine_categories" categorical variables.

### Combining responses

For multiple response variables, you may combine responses rather than categories.

Given a variable such as:

```json
{
    "element": "shoji:entity",
    "self": "https://beta.crunch.io/api/datasets/455288/variables/3c2e57/",
    "body": {
        "name": "Aided awareness",
        "alias": "aided",
        "subvariables": [
            "../870a2d/",
            "../a8b0eb/",
            "../dc444f/",
            "../8e6279/",
            "../f775ab/",
            "../6405c2/"
        ],
        "type": "multiple_response",
        "categories": [
            {
                "numeric_value": 1,
                "selected": true,
                "id": 1,
                "name": "Selected",
                "missing": false
            },
            {
                "numeric_value": 2,
                "id": 2,
                "name": "Not selected",
                "missing": false
            },
            {
                "numeric_value": 8,
                "id": 3,
                "name": "Skipped",
                "missing": true
            },
            {
                "numeric_value": 9,
                "id": 4,
                "name": "Not asked",
                "missing": true
            },
            {
                "numeric_value": null,
                "id": -1,
                "name": "No data",
                "missing": true
            }
        ],
        "description": "Which of the following coffee brands do you recognize? Check all that apply."
    }
}
```

POSTing to the variables catalog a Shoji Entity containing a ZCL function like:

```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Aided awareness by region",
        "description": "Combined from aided brand awareness",
        "alias": "aided_region",
        "expr": {
            "function": "combine_responses",
            "args": [
                {
                    "variable": "https://beta.crunch.io/api/datasets/455288/variables/3c2e57/"
                },
                {
                    "value": [
                        {
                            "name": "San Francisco",
                            "combined_ids": [
                                "../870a2d/",
                                "../a8b0eb/",
                                "../dc444f/"
                            ]
                        },
                        {
                            "name": "Portland",
                            "combined_ids": [
                                "../8e6279/",
                                "../f775ab/"
                            ]
                        },
                        {
                            "name": "Chicago",
                            "combined_ids": [
                                "../6405c2/"
                            ]
                        }
                    ]
                }
            ]
        }
    }
}
```

results in a multiple response variable with three responses. The "selected" state of the responses in the derived variable is an "OR" of the combined subvariables.

### Case statements

The "case" function derives a variable using values from the first argument. Each of the remaining arguments contains a boolean expression. These are evaluated in order in an IF, ELSE IF, ELSE IF, ..., ELSE fashion; the first one that matches selects the corresponding value from the first argument. For example, if the first two boolean expressions do not match (return False) but the third one matches, then the third value in the first argument is placed into that row in the output. You may include an extra value for the case when none of the boolean expressions match; if not provided, it defaults to the system "No Data" missing value.

```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Market segmentation",
        "description": "Super-scientific classification of people",
        "alias": "segments",
        "expr": {
            "function": "case",
            "args": [
                {
                    "column": [1, 2, 3, 4],
                    "type": {
                        "value": {
                            "class": "categorical",
                            "categories": [
                                {"id": 3, "name": "Hipsters", "numeric_value": null, "missing": false},
                                {"id": 1, "name": "Techies", "numeric_value": null, "missing": false},
                                {"id": 2, "name": "Yuppies", "numeric_value": null, "missing": false},
                                {"id": 4, "name": "Other", "numeric_value": null, "missing": true}
                            ]
                        }
                    }
                },
                {
                    "function": "and",
                    "args": [
                        {"function": "in", "args": [{"variable": "55fc29/"}, {"value": [5, 6]}]},
                        {"function": "<=", "args": [{"variable": "673dde/"}, {"value": 30}]}
                    ]
                },
                {
                    "function": "and",
                    "args": [
                        {"function": "in", "args": [{"variable": "889dc3/"}, {"value": [4, 5, 6]}]},
                        {"function": ">", "args": [{"variable": "673dde/"}, {"value": 40}]}
                    ]
                },
                {"function": "==", "args": [{"variable": "13cbf4/"}, {"value": 1}]}
            ]
        }
    }
}
```

### Weights

A numeric variable suitable for use as row weights can be constructed from one or more categorical variables and target proportions of their categories. The sample distribution is “raked” iteratively to each categorical marginal target to produce a set of joint values that can be used as weights. Note that available weight variables are shared by all; you may not create private weights. To create a weight variable, POST a JSON variable definition to the variables catalog describing the properties of the weight variable, with an "expr" member indicating to use the "rake" function, which takes a "targets" argument containing an array of Crunch Tables of targets:

```shell
POST /api/datasets/{datasetid}/variables/ HTTP/1.1
Content-Type: application/shoji
Content-Length: 739
{
    "name": "weight",
    "description": "my raked weight",
    "expr": {
        "function": "rake",
        "args": {
            "targets": [
                {
                    "{variable1.id}": [1, 2],
                    "target": [49.1, 50.9]
                },
                …
            ]
        }
    }
}
---------
201 Created
Location: /api/datasets/{datasetid}/variables/{variableid}/
```

### Other transformations

Forthcoming.
