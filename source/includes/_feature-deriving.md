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
    "self": "https://app.crunch.io/api/datasets/3ad42c/variables/0000f5/",
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
        "derivation": {
            "function": "combine_categories",
            "args": [
                {
                    "variable": "https://app.crunch.io/api/datasets/3ad42c/variables/0000f5/"
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
    "self": "https://app.crunch.io/api/datasets/455288/variables/3c2e57/",
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
        "derivation": {
            "function": "combine_responses",
            "args": [
                {
                    "variable": "https://app.crunch.io/api/datasets/455288/variables/3c2e57/"
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
        "derivation": {
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

### Making ad hoc arrays

It is possible to create derived arrays reusing subvariables from other arrays 
using the `array` function and indicating the reference for each of its 
subvariables. 

The subvariables of an array are specified using the `select` function, with its
first `map` argument indicating the IDs for each of these virtual subvariables.
These IDs are user defined and can be any string. They remain unique inside the
parent variable so they can be reused between different arrays.
The second argument of the `select` function indicates the order of the 
subvariables in the array. They are referenced by the user defined IDs.

Each of its variables must point to a variable expression, which can take an
optional (but recommended) `references` attribute to specify a particular name and alias for
the subvariable, if not specified, the same name from the original will be used
and the alias will be padded to ensure uniqueness.

```json
{
  "CA3": {
    "name": "cat array 3", 
    "derivation": {
      "function": "array", 
      "args": [
        {
          "function": "select", 
          "args": [
            {
              "map": {
                "var1": {
                  "variable": "ca2-subvar-2", 
                  "references": {
                    "alias": "subvar2", 
                    "name": "Subvar 2"
                  }
                }, 
                "var0": {
                  "variable": "ca1-subvar-1", 
                  "references": {
                    "alias": "subvar1", 
                    "name": "Subvar 1"
                  }
                }
              }
            }, 
            {
              "value": [
                "var1", 
                "var0"
              ]
            }
          ]
        }
      ]
    }
  }, 
  "CA2": {
    "subvariables": [
      {
        "alias": "ca2-subvar-1", 
        "name": "ca2-subvar-1"
      }, 
      {
        "alias": "ca2-subvar-2", 
        "name": "ca2-subvar-2"
      }
    ], 
    "type": "categorical_array", 
    "name": "cat array 2", 
    "categories": [
      {
        "numeric_value": null, 
        "missing": false, 
        "id": 1, 
        "name": "yes"
      }, 
      {
        "numeric_value": null, 
        "missing": false, 
        "id": 2, 
        "name": "no"
      }, 
      {
        "numeric_value": null, 
        "missing": true, 
        "id": -1, 
        "name": "No Data"
      }
    ]
  }, 
  "CA1": {
    "subvariables": [
      {
        "alias": "ca1-subvar-1", 
        "name": "ca1-subvar-1"
      }, 
      {
        "alias": "ca1-subvar-2", 
        "name": "ca1-subvar-2"
      }, 
      {
        "alias": "ca1-subvar-3", 
        "name": "ca1-subvar-3"
      }
    ], 
    "type": "categorical_array", 
    "name": "cat array 1", 
    "categories": [
      {
        "numeric_value": null, 
        "missing": false, 
        "id": 1, 
        "name": "yes"
      }, 
      {
        "numeric_value": null, 
        "missing": false, 
        "id": 2, 
        "name": "no"
      }, 
      {
        "numeric_value": null, 
        "missing": true, 
        "id": -1, 
        "name": "No Data"
      }
    ]
  }
}
```

On the above example, the array `CA3` uses the array function and uses 
subvariables `ca1-subvar-1` and `ca2-subvar-2` from `CA1` and `CA2` respectively.
The `references` attribute is used to indicate specific name/alias for these
subvariables.

<aside class="warning">
Note that when making an array with this method its subvariables catalog
and subvariables will return 405 on PATCH attempts. The correct way to make
modifications to them (add/remove subvariable, edit subvariable attributes) is
to update the new array variable's entity `derivation` attribute with the 
updated expression indicating the desired subvariable modifications.
</aside>



### Weights

A numeric variable suitable for use as row weights can be constructed from one 
or more categorical variables and target proportions of their categories. The 
sample distribution is “raked” iteratively to each categorical marginal target 
to produce a set of joint values that can be used as weights. Note that 
available weight variables are shared by all; you may not create private 
weights. To create a weight variable, POST a JSON variable definition to the 
variables catalog describing the properties of the weight variable, with an 
"derivation" member indicating to use the "rake" function, which takes arguments
 containing an array of variable targets:

```shell
POST /api/datasets/{datasetid}/variables/ HTTP/1.1
Content-Type: application/shoji
Content-Length: 739
{
    "name": "weight",
    "description": "my raked weight",
    "derivation": {
        "function": "rake",
        "args": [{
            "variable": variabl1.id,
            "targets": [[1, 0.491], [2, 0.509]]
        }]
    }
}
---------
201 Created
Location: /api/datasets/{datasetid}/variables/{variableid}/
```

### Multiple Response Views

The "select_categories" function allows you to form a multiple response array from a categorical array, or alter the "selected" categories in an existing multiple response array. It takes two arguments:

* A reference to a categorical or categorical_array variable
* A list of the category ids to mark as "selected"

Given a variable such as:

```json
{
    "element": "shoji:entity",
    "self": "https://app.crunch.io/api/datasets/3ad42c/variables/0000f5/",
    "body": {
        "name": "Cola",
        "alias": "cola",
        "type": "categorical",
        "categories": [
            {"id": -1, "name": "No Data", "numeric_value": null, "missing": true},
            {"id": 0, "name": "Never", "numeric_value": null, "missing": false},
            {"id": 1, "name": "Sometimes", "numeric_value": null, "missing": false},
            {"id": 2, "name": "Frequently", "numeric_value": null, "missing": false},
            {"id": 3, "name": "Always", "numeric_value": null, "missing": false}
        ],
        "subvariables": ["0001", "0002", "0003"],
        "references": {
            "subreferences": {
                "0003": {"alias": "Coke"},
                "0002": {"alias": "Pepsi"},
                "0001": {"alias": "RC"}
            }
        }
    }
}
```

POST'ing to the private variables catalog a Shoji Entity containing a ZCL function like:

```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Cola likes",
        "description": "Cola preferences",
        "alias": "cola_likes",
        "derivation": {
            "function": "select_categories",
            "args": [
                {"variable": "https://app.crunch.io/api/datasets/3ad42c/variables/0000f5/"},
                {"value": [2, 3]}
            ]
        }
    }
}
```

...results in a private multiple_response variable where the "Frequently" and "Always" categories are selected.


### Text Analysis

#### Sentiment Analysis

The "sentiment" function allows you to derive a categorical variable from text variable data, which is classified and accumulated in three categories (positive, negative, and neutral).  It takes one parameter: 

* A reference to a text variable

Given a variable such as:

```json
{
    "element": "shoji:entity",
    "self": "https://app.crunch.io/api/datasets/3ad42c/variables/0000f5/",
    "body": {
        "name": "Zest",
        "alias": "zest",
        "type": "text",
        "values": [
            "Zest is best",
            "Zest I can take it or leave it",
            "Zest is the worst"
        ]
    }
}
```

`POST`ing to the private variables catalog a Shoji Entity containing a ZCL function like:

```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Zesty Sentiment",
        "description": "Customer sentiment about Zest",
        "alias": "zest_sentiment",
        "derivation": {
            "function": "sentiment",
            "args": [
                {"variable": "https://app.crunch.io/api/datasets/3ad42c/variables/0000f5/"}
            ]
        }
    }
}
```

Will result in a new categorical variable, where for each row the text variable is classified as “Negative”, “Neutral”, or “Positive” using the [VADER](https://github.com/cjhutto/vaderSentiment) English social-media-tuned lexicon.

### Other transformations

#### Arithmetic operations

It is possible to create new numeric variables out of pairs of other
 numeric variables. The following arithmetic operations are available
 and will take two numeric variables as their arguments.

 * "+" for adding up two numeric variables.
 * "-" returns the difference between two numeric variables.
 * "*" for the product of two numeric variables.
 * "/" Real division.
 * "//" Floor division; Returns always an integer.
 * "^" Raises the first argument to the power of the second argument
 * "%" Modulo operation; Accepts floats


The usage is as follows for all operators:

```json
{
    "function": "+",
    "args": [
        {"variable": "https://app.crunch.io/api/datasets/123/variables/abc/"}
        {"variable": "https://app.crunch.io/api/datasets/123/variables/def/"}
    ]
}
```


#### bin
Receives a numeric variable and returns a categorical one where each
category represents a bin of the numeric values.

Each category on the new variable is annotated with a "boundaries" 
member that contains the lower/upper bound of each bin.

```json
{
    "function": "bin",
    "args": [
        {"variable": "https://app.crunch.io/api/datasets/123/variables/abc/"}
    ]
}
```

Optionally it is possible to pass a second argument indicating the desired
bin size to use instead of allowing the API to decide them.


```json
{
    "function": "bin",
    "args": [
        {"variable": "https://app.crunch.io/api/datasets/123/variables/abc/"},
        {'value': 100}
    ]
}
```

#### case
Returns a categorical variable with its categories following the specified
conditions from different variables on the dataset. [View Case Statements](#Case-statements)

#### cast
Returns a new variable with its type and values casted. Not applicable
on arrays or date variable; use [Date Functions](#Date-Functions) to
work with date variables.

```json
{
    "function": "cast",
    "args": [
        {"variable": "https://app.crunch.io/api/datasets/123/variables/abc/"},
        {"value": "numeric"}
    ]
}
```

The allowed output variable types are:

* numeric
* text
* categorical

For categorical types it is necessary to indicate the categories as a type
definition instead of a string name:

To cast to categorical type, the second argument `value` should not be
 a name string (`numeric`, `text`) but a type definition indicating a 
 `class` and `categories` as follow:

```json
{
    "function": "cast",
    "args": [
        {"variable": "https://app.crunch.io/api/datasets/123/variables/abc/"},
        {"value": {
                "class": "categorical",
                "categories": [
                    {"id": 1, "name": "one", "missing": false, "numeric_value": null},
                    {"id": 2, "name": "two", "missing": false, "numeric_value": null},
                    {"id": -1, "name": "No Data", "missing": true, "numeric_value": null},
                ]
            }
        }
    ]
}
```

To change the type of a variable a client should POST to the `/variable/:id/cast/`
endpoint. See [Convert type](#Convert-type) for API examples.


#### char_length
Returns a numeric variable containing the text length of each value. Only
applicable on text variables.

```json
{
    "function": "char_length",
    "args": [
        {"variable": "https://app.crunch.io/api/datasets/123/variables/abc/"}
    ]
}
```

#### copy_variable
Returns a shallow copy of the indicated variable maintaining type and data.

```json
{
    "function": "copy_variable",
    "args": [
        {"variable": "https://app.crunch.io/api/datasets/123/variables/abc/"}
    ]
}
```

Changes on the data of the original variable will be reflected on this copy.


#### combine_categories
Returns a categorical variable with values combined following the specified
combination rules. See [Combining categories](#Combining-categories)


#### combine_responses
Given a list of categorical variables, return the selected value out
of them. See [Combining responses](#Combining-responses)


#### row
Returns a numeric variable with row 0 based indices. It takes no arguments.

```json
{
    "function": "row",
    "args": []
}
```
