# Advanced Filtering

Users have an alternative way to create dataset specific filters. Utilizing the
syntax shown on the right, a user can make queries with AND and OR conditions.

<aside class="notice">
    This filter syntax has the added benefit of being able to be nested, allowing 
    one to up the complexity and specificity of their query.
</aside>

> Dataset Filter Format

```json
{"op":"<operator>", "col":"<data_column>", "val":"<numerical value>"}
```

```json
{"op": "and", "val": [
    {"op": "ge", "col": "point_date", "val": "2016-01-01"},
    {"op":"or", "val": [
        {"op":"eq","col":"iucr","val":"0110"},
        {"op":"eq","col":"description","val":"CREDIT CARD FRAUD"}
        ]
    }
    ]
}
```

> Translates to:

> ... WHERE point_date >= "2016-01-01" AND (iucr = 0110 OR description = "CREDIT CARD FRAUD")

<aside class="warning">
    You cannot specify both dataset columns and a dataset filter. If you do,
    Plenario will ignore the query arguments pertaining to dataset columns and
    only use the filter argument. It will then issue a warning message in the
    returned response letting you know the arguments it ignored.
</aside>

## `"op"`

`"op"` short for **operator**, is used at the beginning of a filter to define 
which query operator is being used.

```
"op": "<operator>"
```

`"op"` is followed by a colon and the chosen operator. These operators are not
preceded by underscores, as they normally are when specifying columns as query 
arguments.

The currently available operators are `"eq"`, `"gt"`, `"ge"`, `"lt"`, `"le"`, 
`"ne"`, `"like"`, `"ilike"`, and `"in"`.

## `"col"`

`"col"` and its value signify which dataset **column** the filter builds a
condition for.

```
`"col": "<column_name>"`
```

## `"val"`

`"val"` sets the target **value** which is used, in combination with op and
col, to construct a SQL WHERE condition.

```
`"val": "<target_value>"`
```
