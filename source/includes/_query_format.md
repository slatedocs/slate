## Query Format and Filtering

<aside class="notice">The SMARTSolar API uses Flask-Restless filtering syntax. A brief overview is show here. For full details see: <a href='https://flask-restless.readthedocs.io/en/stable/searchformat.html'>Flask Restless Query Format </a> </aside>



> The filters can be applied using the `q` query parameter as follows:

```python
url = "https://smartapi.bboxx.co.uk/v1/products"
params = {
    "q": json.dumps({
        "filters": filters,
        "limit": limit,
        "offset": offset,
        "group_by": group_by,
        "order_by": order_by,
        "single": True
    })
}
headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + token}

r = requests.get(url, params, headers)
```

> Where each mapping is optional. A brief example of each mapping is shown here, full details can be seen below:

```python
filters = [
    {"fieldname": "product_imei", "op": "eq", "val": "013777894687"},
    {"fieldname": "product_type_id", "op": "lt", "val": 3}
]

limit = 100

offset = 10

group_by = [
    {"field": "product_type_id"},
    {"field": "hub_id"},
    {"field": "shop_id"},
]

order_by = [
    {"field": "created_at", "direction": "asc"},
    {"field": "capacity_limit", "direction": "desc"}
]

single = True/False
```

Filtering of requests is made via the query parameter.
The query parameter q must be a JSON string. It can have the following mappings, all of which are optional:

- filters
- limit
- group_by
- order_by
- offset
- single


### Filters
Filters are a list of objects of one of the following forms:

`{"name": <fieldname>, "op": <operatorname>, "val": <argument>}`

                        or:

`{"name": <fieldname>, "op": <operatorname>, "field": <fieldname>}`

> Some examples of each operator used inside the filters dictionary

```python
# EQUALS
{"name": "product_imei", "op": "==", "val": "013777894687"}
{"name": "product_imei", "op": "eq", "val": "013777894687"}
{"name": "product_imei", "op": "equals", "val": "013777894687"}
{"name": "product_imei", "op": "equals_to", "fieldname": "current_tamper_flag"}

# NOT EQUALS
{"name": "enabled_flag", "op": "!=", "val": "013777894687"}
{"name": "enabled_flag", "op": "neq", "val": "013777894687"}
{"name": "enabled_flag", "op": "does_not_equal", "val": "013777894687"}
{"name": "enabled_flag", "op": "not_equal_to", "val": "013777894687"}

# GREATER THAN
{"name": "capacity_limit", "op": ">", "val": 15}
{"name": "capacity_limit", "op": "gt", "val": 15}

# GREATHER THAN OR EQUAL TO
{"name": "capacity_limit", "op": ">=", "val": 15}
{"name": "capacity_limit", "op": "ge", "val": 15}
{"name": "capacity_limit", "op": "gte", "val": 15}
{"name": "capacity_limit", "op": "geq", "val": 15}

# LESS THAN
{"name": "capacity_limit", "op": "<", "val": 15}
{"name": "capacity_limit", "op": "lt", "val": 15}

# IN
{"name": "product_imei", "op": "in", "val": [1,2,5]}

# IS NULL
{"name": "software_lock", "op": "is_null", "val": ""}

# IS NOT NULL
{"name": "software_lock", "op": "is_not_null", "val": ""}
```
### Operators
The operator strings recognized by the API incude:

Operator | Alternative string | Meaning
-------- | -------------------|--------
== | eq, equals, equals_to  | equals
!= | neq, does_not_equal, not_equal_to | does not equal
>  | gt  | strictly greater than
<  | lt  | strictly less than
>= | ge, gte, geq | greater than or equal to
<= | le, lte, leq | less than or equal to
in |  | contained with-in the list supplied. `val` can be specified or a filter
not_in | | not contained with-in the list supplied. `val` can be specified or a filter
is_null | | is NULL
is_not_null | | is not NULL
like  | | __case-sensitive__ string matching
ilike | | __case-insensitive__ string matching
has | | True if a single related field matches a value in the supplied list. `val` can be specified or a query.
any | | True if any related field matches a value in the supplied list. `val` can be specified or a query.

In the first form, `<operatorname>` is one of the strings described in the Operators section, the first `<fieldname>` is the name of the field of the model to which to apply the operator, `<argument>` is a value to be used as the second argument to the given operator. In the second form, the second `<fieldname>` is the field of the model that should be used as the second argument to the operator.

`<fieldname>` may alternately specify a field on a related model, if it is a string of the form `<relationname>__<fieldname>`.

If the field name is the name of a relation and the operator is `"has"` or `"any"`, the `"val"` argument can be a dictionary with the arguments representing another filter to be applied as the argument for `"has"` or `"any"`.

The returned list of matching instances will include only those instances that satisfy all of the given filters.

Filter objects can also be arbitrary Boolean formulas. For example:

`{"or": [<filterobject>, {"and": [<filterobject>, ...]}, ...]}`

If a filter is poorly formatted (for example, op is set to '==' but val is not set), the server responds with 400 Bad Request.

### Limit
```python
params = {
    "q": json.dumps({
        "limit": 5
    })
}
```
A positive integer which specifies the maximum number of objects to return.




### Offset
```python
params = {
    "q": json.dumps({
        "offset": 10
    })
}
```
A positive integer which specifies the offset into the result set of the returned list of instances.



### Order By
```python
params = {
    "q": json.dumps({
        "order_by": [{"field": "created_at", "direction": "asc"}]
    })
}
```
A list of objects of the form:

`{"field": <fieldname>, "direction": <directionname>}`

Where `<fieldname>` is a string corresponding to the name of a field of the requested model and `<directionname>` is either "asc" or "desc".

`<fieldname>` may alternately specify a field on a related model, if it is a string of the form `<relationname>__<fieldname>`.



### Group By
```python
params = {
    "q": json.dumps({
        "group_by": [
            {"field": product_imei},
            {"field": product_entity_linker__anomaly_id}
        ]
    })
}
```
A list of objects of the form:

`{"field": <fieldname>}`

Where `<fieldname>` is a string corresponding to the name of a field of the requested model.

`<fieldname>` may alternately specify a field on a related model, if it is a string of the form `<relationname>__<fieldname>`.



### Single
```python
params = {
    "q": json.dumps({
        "single": True
    })
}
```

A Boolean representing whether a single result is expected as a result of the search. If this is true and either no results or multiple results meet the criteria of the search, the server responds with an error message.




