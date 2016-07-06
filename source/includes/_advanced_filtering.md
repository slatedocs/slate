# Advanced Filtering

> `v1/api/<endpoint>/<dataset_name>__filter={"op":"<operator>", "col":"<data_column>"", "val":"<numerical value>"}`

Users are now able to add additional filters (including and/or functions) to their API calls. `filter` essentially acts as another [query operator](#query-operators-for-raw-data); its basic syntax is **shown on the right**.

There are three additional query parameters for advanced filtering. They are `"op"`, `"col"` and `"val"`.

## `"op"`

`"op"` is short for '*operator*', and is used at the beginning of an advanced filtering call to define which [query operator](#query-operators-for-raw-data) is being used.

```
"op":"<operator>"
```

`"op"` is followed by a colon and the preferred operator, also in quotation marks, as seen on the right. These operators do not use underscores, as they do when querying a raw data endpoint. 

The currently available operators are `"eq"`, `"gt"`, `"ge"`, `"lt"`, `"le"`, `"ne"`, `"like"`, `"ilike"`, and `"in"`.

## `"col"`

`"col"` and its value signify which dataset **column** the filter will pull from.

```
`"col":"<column_name>"`
```

## `"val"`

`"val"` sets a **value** which the operator takes and implements.

```
`"val":"<numerical value>"`
```






{"op": "and/or", "val": [
  {"op": "stuff" ...},
  {"op": "more stuff" ...},
  {"op": "or", "val": [
    {}
  ]}
]}
