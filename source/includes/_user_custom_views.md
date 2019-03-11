

# User Custom Views APIs

Requires authentication.

## Get Views

Returns main views for currently authorized user.

```APIs
GET https://dev.zoomsymbols.com/api/user-custom-views/getViews
```

> Response

```json
{
   "result": [
       {
            "title": "Main View",
            "is_primary": true,
            "is_custom": false,
            "fields": [
                {
                     "code": "px_date",
                     "name": "Date"
                },
                {
                     "code": "symbol_value",
                     "name": "Ticker Symbol"
                },
                ...
             ]
       }
    ]
}
```

## Get View List

Returns view list for currently authorized user.

```APIs
GET https://dev.zoomsymbols.com/api/user-custom-views/getViewList
```

> Response

```json
{
    "result": [
        {
           "code": "sample_views",
           "name": "Sample Views",
           "rows": [
                {
                    "code": "main_view",
                    "name": "Main",
                    "fields": [
                         {
                             "styles": {
                                "textAlign": "left"
                             },
                             "format": {
                                 "type": "date",
                                 "formatValue": "MM/DD/YYYY"
                             },
                    "width": 120,
                    "code": "px_date",
                    "name": "Date"
                         },
                         ...
                    ]
           ]
        }
    ]
}
```
