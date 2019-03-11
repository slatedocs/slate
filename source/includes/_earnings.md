

# Earnings APIs

Requires authentication.

## Get Earnings

Returns earnings for settings.

```APIs
GET https://dev.zoomsymbols.com/api/earnings/getEarnings
```

> Paramters

```
(Must be given at least one parameter)
symbol: your_symbol
symbolId: symbol_id
symbols: array_of_symbols
```


> Response

```json
{
  columns: [
     {
       code: "end_date",
       name: "End Date",
       styles: {
          textAlign: "left"
       },
       format: {
          type: "date",
          formatValue: "MM/DD/YYYY"
       },
       width: 130
     }
     ...
   ]
}
```

## Get Earnings Types

Returns available types of earnings.

```APIs
GET https://dev.zoomsymbols.com/api/earnings/getEarningsTypes
```

> Response

```json
{
  result: [
     {
         code: "earnings",
         name: "Earnings"
     },
     {
         code: "dividends",
         name: "Dividends"
     },
     ...
   ]
}
```


## Get Earnings Fields

Returns available fields of earnings.

```APIs
GET https://dev.zoomsymbols.com/api/earnings/getEarningsFields
```

> Response

```json
{
  result: [
     {
         field_id: 1112,
         field_name: "Revenue",
         field_code: "revenue",
         fundamental_template_id: 1
     },
     ...
   ]
}
```



## Get Data

Returns available data for given tab.

```APIs
GET https://dev.zoomsymbols.com/api/earnings/getData
```
> Parameters

```
tab: Calendar/Results/Revisions/Dividends/News
```


> Response

```json
{
  totalRecords: "0",
  totalPages: 0,
  pageSize: 100,
  pageNum: null,
  columns: [
      {
        code: "symbol_value",
        name: "Symbol",
        styles: {
           textAlign: "left"
        },
        width: 140
      },
      ...
  ]
}
```

## Get Settings

Returns all earnings settings for the current authorized user.

```APIs
GET https://dev.zoomsymbols.com/api/earnings/getSettings
```

> Response

```json
{
  "result": {
      "user_setting_id": 322,
      "user_id": "xxxxxx-xxxx-...",
      "username": "xxxx",
      "is_default": false,
      "accepted_terms": false,
      "exchange_id": 96,
      "exchange_code": "NYSE",
      "watchlist": [
          {
             "watchlist_id": 2528,
             "watchlist_value": "kate1",
             "visibility": "P",
             "description": null
          }
       ],
      ...
}
```

## Get Default Settings

Returns all default earnings settings for the current authorized user.

```APIs
GET https://dev.zoomsymbols.com/api/earnings/getDefaultSettings
```

> Response

```json
{
  "result": {
      "user_setting_id": 322,
      "user_id": "xxxxxx-xxxx-...",
      "username": "xxxx",
      "is_default": true,
      "accepted_terms": false,
      "exchange_id": 96,
      "exchange_code": "NYSE",
      "sector_code_list": [
          {
             "gics_id": id,
             "gics_code": "energy",
             "gics_name": "Energy",
          }
       ],
      "active_source": "exchange"
   }
}
```


## Set Settings

Sets earning settings for current authorized user.

```APIs
POST https://dev.zoomsymbols.com/api/earnings/setSettings
```

> Parameters

```
industry_code_list: gics industry code list seperated by comma
sector_code_list: gics sector code list seperated by comma
security_type_code_list: security type list comma seperated
active_source: exchange/exchange_country/exchange_parent/symbol/watchlist/portfolio 
exchange_code: use this value when "active_source" is set to "exchange"
exchange_country_code: use this value when "active_source" = "exchange_country"
exchange_parent_code: use this value when active_source = "exchange_parent"
symbol_id: use this value when "active_source" = "exchange_parent"
watch_id_list: use this value when "active_source" = "watchlist"
portfolio_id_list: use this value when "active_source" = "portfolio"
```

> Response

```json
{
  "result": {
     "user_setting_id": 322,
     "user_id": "xxxxx-xxxxx-xxx",
     "username": "xxxx",
     "is_default": false,
     "accepted_terms": false,
     "exchange_id": 96,
     "exchange_code": "NYSE",
     "watchlist": [
         {
             "watchlist_id": 2528,
             "watchlist_value": "kate1",
             "visibility": "P",
             "description": null
         }
      ],
      "corp_action_type_code": "split",
      "sector_code_list": [
          {
               "gics_id": 6,
               "gics_code": "industrials",
               "gics_name": "Industrials"
          }
      ],
      "active_source": "watchlist"
   }
}
```

## Reset Settings

Reset all earnings settings for the current authorized user.

```APIs
POST https://dev.zoomsymbols.com/api/earnings/resetSettings
```

