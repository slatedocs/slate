

# Symbols Router APIs

Requires authentication.

## Search Symbols List

Returns a list of search symbols.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/searchSymbolsList
```

> Parameters

```
symbol/query: symbol_or_query
extension: your_extenstion (optional)
compare/queryCompare: comparable_query (default 'contains')
```

> Response

```json
{
  "result": [
      {
        "symbol_id": "1595832",
        "company_id": -1595832,
        "symbol_value": "$ALBANIALFPR",
        "symbol": "$ALBANIALFPR",
        "symbol_name": "Albania Labor Force Participation Rate",
        "exchange_id": null,
        "exchange_code": null,
        "exchange_name": null,
        "data_provider_id": 3,
        "exchange_country_name": null,
        "exchange_country_iso2": null,
        "exchange_parent_code": null,
        "symbol_status_name": "Active",
        "security_type_code": "indicator",
        "latest_px_date": "2018-09-30T00:00:00.000Z",
        "latest_px_open": null,
        "latest_px_high": null,
        "latest_px_low": null,
        "latest_px_close": "68.30",
        "latest_volume": null,
        "latest_chg_1d": "0.3000",
        "latest_return_1d": "0.4412",
        "price_data_provider_id": 3,
        "latest_modify_date": "2018-12-19T21:28:11.293Z",
        "exchange_currency_name": "Albanian Lek",
        "exchange_currency_code": "ALL",
        "row_id": "130548",
        "is_active": true,
        "ciq_security_id": null,
        "is_fav": false
     },
     ...
   ]
}
```

## Get All Fields Info

Returns all info fields.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getAllFieldsInfo
```

> Response

```json
{
   "result": [
       {
           "field_id": 2018,
           "field_code": "accounts_payable_total",
           "field_name": "Accounts Payable, Total",
           "field_type_code": "number",
           "field_group_id": 1054,
           "field_group_code": "dnb_financial_data",
           "field_group_name": "DnB Financial Data"
       },
       ...
    ]
}
```

## Get Symbols Info

Returns info regarding a given symbol

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolsInfo
```

> Parameters

```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
```

> Response

```json
{
   "result": [
       {
           "symbol": "$ALBANIACONSPE",
           "symbol_id": "1595093",
           "company_id": -1595093,
           "symbol_value": "$ALBANIACONSPE",
           "symbol_name": "Albania Consumer Spending",
           "exchange_id": null,
           "exchange_code": "Timeseries",
           "exchange_name": "Timeseries",
           "data_provider_id": 3,
           "exchange_country_name": "Albania",
           "exchange_country_iso2": "AL",
           "exchange_parent_code": null,
           "symbol_status_name": "Active",
           "security_type_code": "indicator",
           "latest_px_date": "2018-09-30T00:00:00.000Z",
           "latest_px_open": null,
           "latest_px_high": null,
           "latest_px_low": null,
           "latest_px_close": "68.30",
           "latest_volume": null,
           "latest_chg_1d": "0.3000",
           "latest_return_1d": "0.4412",
           "price_data_provider_id": 3,
           "latest_modify_date": "2018-12-19T21:28:11.293Z",
           "exchange_currency_name": "Albanian Lek",
           "exchange_currency_code": "ALL",
           "row_id": "130548",
           "is_active": true,
           "ciq_security_id": null,
           "exchange_country_id": 2,
           "briefDescription": "06/30/2018 | Timeseries | EOD | Currency in ALL",
           "enable_trade": false
        }
     ]
  }
```

## Get Symbol Info

Returns detailed info regarding a given symbol

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolInfo
```

> Parameters

```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
```

> Response

```json
{
   "result": {
       "symbol": "$ALBANIACONSPE",
       "symbol_id": "1595093",
       "company_id": -1595093,
       "symbol_value": "$ALBANIACONSPE",
       "symbol_name": "Albania Consumer Spending",
       "exchange_id": null,
       "exchange_code": "Timeseries",
       "exchange_name": "Timeseries",
       "data_provider_id": 3,
       "exchange_country_name": "Albania",
       "exchange_country_iso2": "AL",
       "exchange_parent_code": null,
       "symbol_status_name": "Active",
       "security_type_code": "indicator",
       "latest_px_date": "2018-09-30T00:00:00.000Z",
       "latest_px_open": null,
       "latest_px_high": null,
       "latest_px_low": null,
       "latest_px_close": "68.30",
       "latest_volume": null,
       "latest_chg_1d": "0.3000",
       "latest_return_1d": "0.4412",
       "price_data_provider_id": 3,
       "latest_modify_date": "2018-12-19T21:28:11.293Z",
       "exchange_currency_name": "Albanian Lek",
       "exchange_currency_code": "ALL",
       "row_id": "130548",
       "is_active": true,
       "ciq_security_id": null,
       "exchange_country_id": 2,
       "briefDescription": "06/30/2018 | Timeseries | EOD | Currency in ALL",
       "enable_trade": false
       "tabsTree": [
           {
               "tab_code": "overview",
               "tab_title": "Overview",
               "list_order": 1,
               "children": [
                   {
                      "tab_code": "summary",
                      "tab_title": "Summary",
                      "list_order": 1,
                      "user_can_access": true
                   },
                   ...
        ]
  }
```

## Get Symbol Profile

Returns the profile for a given symbol

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolProfile
```

> Parameters

```
(Must be given at least one symbol.)
symbol: your_symbol
symbolId: symbol_id
```

> Response

```json
{
   "result": [
       {
          "key": "Symbol Code",
          "value": "$ALBANIACONSPE",
          "group": "Main"
       },
       ...
}
```

## Get Related Securities

Returns all related securities for given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getRelatedSecurities
```

> Parameters

```
(Must be given at least one symbol.)
symbol: your_symbol
symbolId: symbol_id
```

> Response

```
{
   "columns": [
       {
          "code": "symbol_value",
          "name": "Symbol",
          "styles": {
              "textAlign": "left"
          },
          "width": 140
       },
       ...
}
```

## Get Symbol Key Stats

Returns all key statistics for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolKeyStats
```

> Parameters

```
(Must be given at least one symbol.)
symbol: your_symbol
symbolId: symbol_id
```

> Response

```json
{
  "result": {
      "Prices": [
          {
              "symbol_id": "1595093",
              "field_id": 8,
              "field_code": "px_close",
              "field_name": "Close Price",
              "field_title": "Prices",
              "value": 306718.27
           }
       ],
       "Performance": [
           {
              "symbol_id": "159503",
              "field_id": 1,
              "field_code": "chg_1d",
              "field_name": "Change 1 day",
              "field_title": "Performance",
              "value": 9934.8507,
              "color": "#24E5A2"
           },
           ...
        ]
}
```

## Get Security Types

Returns all security types.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSecurityTypes
```

> Response

```json
{
   "result": [
       {
          "security_type_code": "equity",
          "security_type_name": "Equity"
       },
       ...
   ]
}
```

## Get Symbols Timeseries

Returns timeseries for symbols.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolTimeseries
```

> Response

```json
{
   "totalRecords": "4",
   "totalPages": 1,
   "pagesSize": 100,
   "pageNum": null,
   "result": [
      {
           "symbol_id": "12",
           "symbol_value": "BAC",
           "symbol": "BAC",
           "symbol_name": "Bank of America Corporation",
           "exchange_id": 96,
           "symbol_status_id": 15,
           "data_provider_company_id": 19049,
           "data_provider_security_id": 2592913,
           "create_date": "2018-08-03T15:59:05.831Z",
           "modify_date": "2018-08-03T15:59:05.831Z",
           "is_enable": true,
           "data_provider_trading_item_id": "2592914",
           "composite_figi": "BBG000BCTLF6",
           "gics_id": 157,
           "importance": null,
           "security_type_id": 4,
           "security_type_code": "currency",
           "security_type_name": "Currency",
           "totalRecords": "4"
      },
      ...
   ]
}
```

## Get Key List Groups

Returns key lists groups

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getKeyListGroups
```

> Response

```json
{
   "result": [
       {
          "group_code": "indices",
          "group_title": "Indices",
          "children": [
              {
                  "id": 92,
                  "group_code": "indices_major",
                  "group_title": "Major Indices"
              },
              ...
    ]
}
```

## Get Key List Rows

Returns key list rows.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getKeyListRows
```

> Response

```json
{
   "result": [
    {
      "id": 68,
      "title": "Safe-heaven Assets vs. Equity Indices",
      "symbols": "GLD,SPY,FXY",
      "symbol_ids": "1338381,1338591,1403578"
    },
    ...
   ]
}
```

## Get Key List Prices

Returns all keylist prices.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getKeyListPrices
```

> Parameters

```
id: keylist_id
```

> Response

```json
{
   "totalRecords": "9",
   "totalPages": 1,
   "pageSize": 100,
   "pageNum": null,
   "columns": [
       {
          "code": "symbol",
          "name": "Symbol",
          "styles": {
             "textAlign": "left"
          }
       },
       ...
    ]
}
```

## Get Symbol News

Returns all symbols news.


```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolsNews
```

> Response

```json
{
   "totalRecords": "1564243",
   "totalPages": 15643,
   "pageSize": 100,
   "pageNum": null,
   "result": [
       {
          "id": "4556589",
          "symbol_id": "283",
          "symbol_value": "AAPL",
          "symbol": "AAPL",
          "symbol_name": "Apple Inc.",
          "title": "Qualcomm urges U.S. regulators to reverse course and ban some iphones",
          "summary": "...",
          "publication_date": "2019-02-20T02:48:04.000Z",
          "url": "https://...",
          "totalRecords": "1564243"
        },
        ...
    ]
}
```

## Get Technical Analysis Values

Returns all technical analysis values for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getTechnicalAnalysisValues
```

> Parameters
 
```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
```

> Response

```
{
    "result": {
       "symbol": {
           "symbol": "$ALBANIACONSPE",
           "symbol_id": "1595093",
           "company_id": -1595093,
           "symbol_value": "$ALBANIACONSPE",
           "symbol_name": "Albania Consumer Spending",
           "exchange_id": null,
           "exchange_code": "Timeseries",
           "exchange_name": "Timeseries",
           "data_provider_id": 3,
           "exchange_country_name": "Albania",
           "exchange_country_iso2": "AL",
           "exchange_parent_code": null,
           "symbol_status_name": "Active",
           "security_type_code": "indicator",
           "latest_px_date": "2018-09-30T00:00:00.000Z",
           "latest_px_open": null,
           "latest_px_high": null,
           "latest_px_low": null,
           "latest_px_close": "68.30",
           "latest_volume": null,
           "latest_chg_1d": "0.3000",
           "latest_return_1d": "0.4412",
           "price_data_provider_id": 3,
           "latest_modify_date": "2018-12-19T21:28:11.293Z",
           "exchange_currency_name": "Albanian Lek",
           "exchange_currency_code": "ALL",
           "row_id": "130548",
           "is_active": true,
           "ciq_security_id": null,
           "exchange_country_id": 2,
           "briefDescription": "06/30/2018 | Timeseries | EOD | Currency in ALL",
           "enable_trade": false
         },
         "sections": [
             {
                "columns": [
                    {
                       "styles": {
                           "textAlign": "right"
                       },
                       "code": "period",
                       "name": "Period"
                    },
                    ...
                ]
             },
             ...
       }
```

## Get Prices Scale

Returns all prices scales for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getPricesScale
```

> Parameters

```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
```

> Response

```json
{
   "result": {
       "symbol": {
           "symbol": "$ALBANIACONSPE",
           "symbol_id": "1595093",
           "company_id": -1595093,
           "symbol_value": "$ALBANIACONSPE",
           "symbol_name": "Albania Consumer Spending",
           "exchange_id": null,
           "exchange_code": "Timeseries",
           "exchange_name": "Timeseries",
           "data_provider_id": 3,
           "exchange_country_name": "Albania",
           "exchange_country_iso2": "AL",
           "exchange_parent_code": null,
           "symbol_status_name": "Active",
           "security_type_code": "indicator",
           "latest_px_date": "2018-09-30T00:00:00.000Z",
           "latest_px_open": null,
           "latest_px_high": null,
           "latest_px_low": null,
           "latest_px_close": "68.30",
           "latest_volume": null,
           "latest_chg_1d": "0.3000",
           "latest_return_1d": "0.4412",
           "price_data_provider_id": 3,
           "latest_modify_date": "2018-12-19T21:28:11.293Z",
           "exchange_currency_name": "Albanian Lek",
           "exchange_currency_code": "ALL",
           "row_id": "130548",
           "is_active": true,
           "ciq_security_id": null,
           "exchange_country_id": 2,
           "briefDescription": "06/30/2018 | Timeseries | EOD | Currency in ALL",
           "enable_trade": false
        },
        "columns": [
            {
               "code": "indicator",
               "name": "Indicator"
            },
            {
               "code": "level",
               "name": "Level"
            }
         ],
         "rows": [
             {
                 "indicator": "Today's Return",
                 "highlighted": false,
                 "level": -0.536352575
             },
             ...
          ]
     }
}
```


## Get Trading Signals

Returns all trading signals.


```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getTradingSignals
```

> Response

```json
{
   "result": {
       "Composite Indicators": [
           {
              "title": "TrendSptter",
              "signal": "buy"
           },
           {
              "title": "Short Term Average",
              "value": "80% Buy",
              "signal": "buy",
              "is_summary": true
           },
           {
              "title": "20-Day Average Volume",
              "value": "52,735",
              "is_summary": true
           }
        ],
        "Short Terms Indicators": [
            {
               "title": "7 Day ADI",
               "signal": "buy"
            },
            ...
         ]
}
```

