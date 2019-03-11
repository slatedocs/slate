

# GICs Types APIs

Requires authentication.

## Get Gics Tree

Returns the entire gics tree.


```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getGicsTree
```

> Response

```json
{
   "result": [
       {
          "gics_code": "consumer_discretionary",
          "gics_name": "Consumer Discretionary",
          "gics_type_code": "sector",
          "children": [
              {
                  "gics_code": "automobiles_&_components",
                  "gics_name": "Automobiles & Components",
                  "gics_type_code": "group",
                  "children": [
                      ...
                  ]
              },
              ...
           ]
           ...
       },
       ...
    ]
}
```


## Get Gics Rows

Returns all gics rows.


```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getGicsRows
```

> Parameters

```
(Optional)
type: filters_by_type
```

> Response

```json
{ 
    "result": [  
        {
            "gics_code": "aerospace_&_defense",
            "gics_name": "Aerospace & Defense",
            "gics_type_code": "industry",
            "parent_gics_code": "capital_goods"
        },
        ...
     ]
}
```

