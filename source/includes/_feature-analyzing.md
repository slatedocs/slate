## Multidimensional analysis

In the Crunch system, any analysis is also referred to as a "cube". Cubes are the mechanical means of representing analyses to and from the Crunch system; you can think of them as spreadsheets that might have other than two dimensions. A cube consists of two primary parts: "dimensions" which supply the cube axes, and "measures" which populate the cells. Although both the request and response include dimensions and measures, it is important to distinguish between them. The request supplies expressions for each, while the response has data (and metadata) for each. The request declares what variables to use and what to do with them, while the response includes and describes the results. See Object Reference:Cube for complete details.

### Dimensions

Each dimension of an analysis can be simply one variable, a function over it, a traversal of its subvariables (for array variables), or even a combination of multiple variables (e.g. A + B). Any expression you can use in a "select" command can be used as a dimension. The big difference is that the system will consider the distinct values rather than all values of the result. Variables which are already "categorical" or "enumerated" will simply use their "categories" or "elements" as the extent. Other variables form their extents from their distinct values.

For example, if "3ffd45" is a categorical variable with three categories (one of which is "No Data": -1), then the following dimension expressions:

```json
"dimensions": [
    {"variable": "datasets/ab8832/variables/3ffd45/"},
    {"function": "+", "args": [{"variable": "datasets/ab8832/variables/2098f1/"}, {"value": 5}]}
]
```

...would form a result cube with two dimensions: one using the categories of variable "3ffd45", and one using the distinct values of (variable "2098f1" + 5). If variable "2098f1" has the distinct values [5, 15, 25, 35], then we would obtain a cube with the following extents:

|   | 1 | 2 | -1 |
|---|---|---|----|
|  5|   |   |    |
| 15|   |   |    |
| 25|   |   |    |
| 35|   |   |    |

Each dimension used in a cube query needs to be reduced to distinct values. For categorical or enumerated variables, we only need to refer to the variable, and the system will automatically use the "categories" or "elements" metadata to determine the distinct values. For other types, the default is to scan the variable's data to find the unique values present and use those. Often, however, we want a more sophisticated approach: numeric variables, for example, are usually more useful when binned into a handful of ranges, like "0 to 10, 10 to 20, ...90 to 100" rather than 100 distinct points (or many more when dealing with non-integers). The available dimensioning functions vary from type to type; the most common are:

 * categorical: {"variable": url}
 * text: {"variable": url}
 * numeric:  Group the distinct values into a smaller number of bins via:
   * {"function": "bin", "args": [{"variable": url}]}
 * datetime: Roll up seconds into hours, days into months, or any other grouping via:
   * {"function": "rollup", "args": [{"variable": url}, {"value": variable.rollup_resolution}]}
 * categorical_array:
   * One dimension for the categories: {"variable": url}
   * One dimension for the subvariables: {"each": url}
 * multiple response: 
   * One dimension for the selected categories, which means transforming the array from a set of categorical variables to a set of boolean (true/false) variables via:
     * {"function": "selected_array", "args": [{"variable": url}]}
     * Note that, because this input dimension is now a boolean, it will not add an output dimension. Instead, it will filter the calculation to only consider those entries (for each subvariable) which are true, which means they were selected categories. If you wish to have a separate output dimension including each distinct category (whether selected or not), do not apply the "selected_array" function; instead, just supply the variable reference as-is.
One dimension for the subvariables: {"each": url}

### Measures
A set of named functions to populate each cell of the cube. You can request multiple functions over the same dimensions (such as “cube_mean” and “cube_stddev”) or more commonly just one (like “cube_count”). For example:

```json
"measures": {"count": {"function": "cube_count", "args": []}}
```

or:

```json
    "measures": {
        "mean": {"function": "cube_mean", "args": [{"variable": "datasets/1/variables/3"}]},
        "stddev": {"function": "cube_stddev", "args": [{"variable": "datasets/1/variables/3/"}]}
    }
```

When applied to the dimensions we defined above, this second example might fill the table thusly for the "mean" measure:

|mean| 1 | 2 | -1 |
|---|---|---|----|
|  5|4.3|12.3|8.1|
| 15|13.1|0.0|9.2|
| 25|72.4|4.2|55.5|
| 35|8.9|9.1|0.4|
 
...and produce a similar one for the "stddev" measure. You can think of multiple measures as producing "overlays" over the same dimensions. However, the actual output format (in JSON) is more compact in that the dimensions are not repeated; see Object Reference:Cube output for details.

### Comparisons

Occasionally, it is useful to compare analyses from different sources. A common example is to define "benchmarks" for a given analysis, so that you can quickly compare an analysis to an established target. These are, in effect, one analysis laid over another in such a way that at least one of their dimensions lines up (and typically, using the same measures). These are also therefore defined in terms of cubes: one set which defines the base analyses, and another which defines the overlay.

For example, if we have an analysis over two categorical variables "88dd88" and "ee4455":

```json
{
    "dimensions": [
        {"variable": "../variables/88dd88/"},
        {"variable": "../variables/ee4455/"}
    ],
    "measures": {"count": {"function": "cube_count", "args": []}}
}
```

then we might obtain a cube with the following output:

|   | 1 | 2 | -1 |
|---|---|---|----|
|  1|15|12|9|
|  2|72|8|3|
|  3|23|4|17|

Let's say we then want to overlay a comparison showing benchmarks for 88dd88 as follows:
 
|   | 1 | 2 | -1 |benchmarks|
|---|---|---|----|----------|
|1|15|12|9|20|
|2|72|8|3|70|
|3|23|4|17|10|

Our first pass at this might be to generate the benchmark targets in some other system, and hand-enter them into Crunch. To accomplish this, we need to define a comparison. First, we need to define the "bases": the cube(s) to which our comparison applies, which in our case is just the above cube:

```json
{
    "name": "My benchmark",
    "bases": [{
        "dimensions": [{"variable": "88dd88"}],
        "measures": {"count": {"function": "cube_count", "args": []}}
    }]
}
```

Notice, however, that we've left out the second dimension. This means that this comparison will be available for any analysis where "88dd88" is the row dimension. The base cube here is a sort of "supercube": a superset of the cubes to which we might apply the comparison. We include the measure to indicate that this comparison should apply to a "cube_count" (frequency count) involving variable "88dd88".

Then, we need to define target data. We are supplying these in a hand-generated way, so our measure is simply a static column instead of a function:

```json
{
    "overlay": {
        "dimensions": [{"variable": "88dd88"}],
        "measures": {
            "count": {
                "column": [20, 70, 10],
                "type": {"function": "typeof", "args": [{"variable": "88dd88"}]}
            }
        }
    }
}
```

Note that our overlay has to have a dimension, too. In this case, we simply re-use variable "88dd88" as the dimension. This ensures that our target data is interpreted with the same category metadata as our base analysis.

We POST the above to datasets/{id}/comparisons/ and can obtain the overlay output at datasets/{id}/comparisons/{comparison_id}/cube/. See the Endpoint Reference for details.


### Multitables

Analyses as described above are truly multidimensional; when you add another variable, the resulting cube obtains another dimension. Sometimes, however, you want to compare analyses side by side, typically looking at several (even *all*) variables against a common set of conditioning variables. For example, you might nominate "Gender", "Age", and "Race" as the conditioning variables and cross every other variable with those, in order to quickly discover common correlations. 

Multi-table definitions mainly provide a `template` member that clients can use to construct a valid query with the variable(s) of interest.

Crunch provides a separate catalog where you can define and manage these common sets of variables. Like most catalogs, you can GET it to see which multitables are defined:

```http
GET datasets/{id}/multitables/ HTTP/1.1

200 OK
{
    "element": "shoji:catalog",
    "index": {
        "1/": {"name": "Major demographics"},
        "2/": {"name": "Political tendencies"}
    }
}
```

...POST a new overview:

```http
POST datasets/{id}/multitables/ HTTP/1.1

{
    "element": "shoji:entity",
    "body": {
        "name": "Geographical indicators",
        "template": [
            {
                "variable": "../variables/de85b32/",
                "query": [
                    {
                        "variable": "../variables/de85b32/"
                    }
                ]
            },
            {
                "variable": "../variables/398620f/",
                "query": [
                    {
                        "variable": "../variables/398620f/"
                    }
                ]
            },
            {
                "variable": "../variables/c116a77/",
                "query": [
                    {
                        "function": "bin",
                        "args": [
                            {
                                "variable": "../variables/398620f/"
                            }
                        ]
                    }
                ]
            }
        ],
        "is_public": false
    }
}

201 Created
Location: datasets/{id}/multitables/3/
```

...or GET an individual multitable:

```http
GET datasets/{id}/multitable/3/ HTTP/1.1

{
    "element": "shoji:entity",
    "body": {
        "name": "Geographical indicators",
        "template": [
            {
                "variable": "../variables/de85b32/",
                "query": [
                    {
                        "variable": "../variables/de85b32/"
                    }
                ]
            },
            {
                "variable": "../variables/398620f/",
                "query": [
                    {
                        "variable": "../variables/398620f/"
                    }
                ]
            },
            {
                "variable": "../variables/c116a77/",
                "query": [
                    {
                        "function": "bin",
                        "args": [
                            {
                                "variable": "../variables/398620f/"
                            }
                        ]
                    }
                ]
            }
        ]
    }
}
```

Each multi-table template may be a list of variable references and other information used to construct the dimension and transform its output.

### More complex multitable templates

The template may contain in addition to variable references and their query arguments, an optional `transform`: \
To obtain their multiple output cubes, you `GET datasets/{id}/cube?query=<q>` where `<q>` is a ZCL object in JSON format (which must then be URI encoded for inclusion in the querystring). Use the "each" function to iterate over the overview variables’ `query`, producing one output cube for each one as "variable x". For example, to cross each of the above 3 variables against another variable "449b421":


```json
{
    "function": "each",
    "args": [
        {
            "value": "x"
        },
        [
            {
                "variable": "de85b32"
            },
            {
                "variable": "398620f"
            },
            {
                "variable": "c116a77"
            }
        ]
    ],
    "block": {
        "function": "cube",
        "args": [
            [
                {
                    "variable": "449b421"
                },
                {
                    "variable": "x"
                }
            ],
            {
                "map": {
                    "count": {
                        "function": "cube_count",
                        "args": []
                    }
                }
            },
            {
                "value": null
            }
        ]
    }
}
```

The result will be an array of output cubes:

```json
{
    "element": "shoji:view",
    "value": [
        {
            "query": {},
            "result": {
                "element": "crunch:cube",
                "dimensions": [
                    {
                        "references": "449b421",
                        "type": "etc."
                    },
                    {
                        "references": "de85b32",
                        "type": "etc."
                    }
                ],
                "measures": {...}
            }
        },
        {
            "query": {},
            "result": {
                "element": "crunch:cube",
                "dimensions": [
                    {
                        "references": "449b421",
                        "type": "etc."
                    },
                    {
                        "references": "398620f",
                        "type": "etc."
                    }
                ],
                "measures": {...}
            }
        },
        {
            "query": {},
            "result": {
                "element": "crunch:cube",
                "dimensions": [
                    {
                        "references": "449b421",
                        "type": "etc."
                    },
                    {
                        "references": "c116a77",
                        "type": "etc."
                    }
                ],
                "measures": {...}
            }
        }
    ]
}
```

### Transforming analyses for presentation

The `transform` member of an analysis specification (or multitable definition)
provides a way to transform that dimension's results after computation. The 
cube result dimension will always be derived from the `query` part of the
request (`{variable: $variableId})`, `{function: f, args: [$variableId, …]}`, &c.

### Structure

A `transform` is an array of target transforms for output-dimension elements. 
Therefore to create a valid `transform` it is generally necessary to make a cube query, inspect
the result dimension, and proceed from there. For categorical and multiple response
variables, elements may also be obtained from the variable entity.

Transforms are designed for variables that are more stable than not, with element ids
that inhere in the underlying elements, such as category or subvariable ids. Dynamic
elements such as results of `bin`ning a numeric variable, may not be transformed.

Consider the following example result dimension:

| Name       | missing | id |
|------------|---------|----|
| Element A  |         | 0  |
| Element B  |         | 1  |
| Element C  |         | 2  |
| Don’t know |         | 3  |
| Not asked  | true    | 4  |

A full `transform` can specify a new order of output elements, new names, 
and in the future, bases for hypothesis testing, result sorting, and 
aggregation of results. A `transform` has elements that look generally like
the dimension's extent, with some optional properties: 

- **id**: (required) id or array of ids in the target row/column
- **name**: name of new target column
- **sort**: `-1` or `1` indicating to sort results descending or ascending by this element
- **compare**: `neq`, `leq`, `geq` indicating to test other rows/columns against
the hypothesis that they are ≠, ≤, or ≥ to the present element
- **combine**: `sum` (or `mean`?) — combine the indices in `[i]` to produce this target row/column
- **hide**: suppress this element's row/column from displaying at all. Defaults to false for valid elements, true for missing, so that if an element is added, it will be present until a transform with `hide: true` is added to suppress it.

A `transform` with object members can do lots of things. Suppose we want to put _Element C_ first, 
hide the _Don’t know_, and more compactly represent the result as just _C, A, B_:

```json
transform: [
    {'id': 2, 'name': 'C'},
    {'id': 0, 'name': 'A'},
    {'id': 1, 'name': 'B'},
    {'id': 3, 'hide': true}
]
```

#### In the future: `combine`

Suppose we want to combine results in _A_ and _B_ into _Others_:

```json
transform: [
    {'id': 2, 'name': 'C'},
    {'id': [0,1], 'name': 'Others', 'combine': 'sum'},
    {'id': 3, 'hide': true}
]
```

#### Order of transform operations

1. Combine
1. Name
1. Order
2. Hide

#### Example transform in a saved analysis

In a saved analysis the transforms are an array in `display_settings` with the same extents output dimensions (as well as, of course, the query used to generate them). This syntax makes a univariate table of a multitple response variable and re-orders the result.


```json
{
    "query": {
        "dimensions": [
            {
                "function": "selected_array",
                "args": [
                    {
                        "variable": "../variables/398620f/"
                    }
                ]
            },
            {
                "variable": "../variables/398620f/"
            }
        ],
        "measures": {
            "count": {
                "function": "cube_count",
                "args": []
            }
        }
    },
    "display_settings": {
        "transform": [
            {
                "id": "f007",
                "value": "My preferred first item"
            },
            {
                "id": "fee7",
                "value": "The zeroth response"
            },
            {
                "id": "c001",
                "name": "Third response"
            }
        ]
    }
}
```

#### Example transform in a multitable template

In a multitable, the `transform` is part of each dimension definition object in the `template` array. 

```json
{
    "template": [
        {
            "variable": "A",
            "query": [
                {
                    "variable": "A"
                }
            ],
            "transform": [
                {},
                {}
            ]
        },
        {
            "variable": "B",
            "query": [
                {
                    "function": "rollup",
                    "args": [
                        {
                            "value": "M"
                        },
                        {
                            "variable": "B"
                        }
                    ]
                }
            ]
        }
    ]
}
```
