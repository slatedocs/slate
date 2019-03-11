

# Symbol Activity APIs

Requires authentication.

## Get Settings Schema

Returns the settings schema for currently authorized user.

```APIs
GET https://dev.zoomsymbols.com/api/symbol-activity/getSettingsSchema
```

> Response

```json
{
   "result": [
       {
          "code": "calculation",
          "name": "Calculation",
          "selected": "weekly",
          "rows": [
              {
                 "code": "daily",
                 "name": "Daily"
              },
              ...
          ]
       },
       ...
}
```

## Get Trading Activity

Returns trading activity for a given future symbol.

```APIs
GET https://dev.zoomsymbols.com/api/symbol-activity/getTradingActivity
```

> Parameters

```
symbol or symbolId: your_future_symbol
interval: your_interval (default "d")
field: your_field (default "volume")
pageSize: page_size (default "max")
startDate: start_date (optional)
endDate: end_date (optional)
```

> Response

```json
{
   "result": {
       "symbol_value": "A6N2018",
       "symbol": "A6N2018",
       "symbol_name": "Australian Dollar June 2018",
       "symbol_id": "1517019",
       "rows": [
           {
              "year": 2018,
              "value": 6966
           }
       ]
   }
}
```


## Get Daily Activity

Returns daily activity for a given future symbol.

```APIs
GET https://dev.zoomsymbols.com/api/symbol-activity/getDailyActivity
```

> Parameters

```
symbol or symbolId: your_future_symbol
pageSize: page_size (default "max")
startDate: start_date (optional)
endDate: end_date (optional)
sortdatafield: (default "px_date")
sortorder: (default "desc")
```

> Response

```json
{
   "result": {
       "symbol_value": "A6N2018",
       "symbol": "A6N2018",
       "symbol_name": "Australian Dollar June 2018",
       "symbol_id": "1517019",
       "max": 1.37,
       "min": 0,
       "avg": 0.436,
       "rows": [
           {
              "px_date": "2018-07-16",
              "value": 0
           }
           ...
       ]
   }
}
```
