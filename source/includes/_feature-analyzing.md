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
    }],
```

Notice, however, that we've left out the second dimension. This means that this comparison will be available for any analysis where "88dd88" is the row dimension. The base cube here is a sort of "supercube": a superset of the cubes to which we might apply the comparison. We include the measure to indicate that this comparison should apply to a "cube_count" (frequency count) involving variable "88dd88".

Then, we need to define target data. We are supplying these in a hand-generated way, so our measure is simply a static column instead of a function:

```json
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
