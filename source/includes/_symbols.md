

# Symbols APIs

Requires authentication.

## Get History

Returns history for given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getHistory
```

> Parameters

```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
symbols: array_of_symbols
symbolIds: symbol_ids
watchlist: your_watchlist
portfolio: your_portfolio
```


> Response

```json
{
   "totalRecords": "51",
   "totalPages": 1,
   "pageSize": 100,
   "pageNum": null,
   "result": [
       {
           "px_dte": "1996-12-31",
           "symbol_id": "1595093",
           "symbol_value": "$ALBANIACONSPE",
           "symbol": "$ALBANIACONSPE",
           "symbol_name": "Albania Consumer Spending",
           "chg_1d": null,
           "return_1d": null,
           "px_open": null,
           "px_high": null,
           "px_low": null,
           "px_close": "337561.00",
           "volume": null,
           "totalRecords": "51"
       },
       ...
   ]
}
```


## Get Latest History

Returns latest history for given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getHistoryLatest
```

> Parameters

```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
symbols: array_of_symbols
symbolIds: symbol_ids
watchlist: your_watchlist
portfolio: your_portfolio
```


> Response

```json
{
   "totalRecords": "1",
   "totalPages": 1,
   "pageSize": 100,
   "pageNum": null,
   "result": [
       {
           "px_dte": "1996-12-31",
           "symbol_id": "1595093",
           "symbol_value": "$ALBANIACONSPE",
           "symbol": "$ALBANIACONSPE",
           "symbol_name": "Albania Consumer Spending",
           "chg_1d": null,
           "return_1d": null,
           "px_open": null,
           "px_high": null,
           "px_low": null,
           "px_close": "337561.00",
           "volume": null,
           "totalRecords": "1"
       },
   ]
}
```


## Clear User Symbol History

Clears symbol history for currently authorized user.

```APIs
POST https://dev.zoomsymbols.com/api/v2/symbols/clearUserSymbolHistory
```

> Response

```json
{
   "result": "Done"
}
```

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


## Get Exchanges

Returns data for all exchanges.


```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getExchanges
```

> Response

```json
{
   "totalRecords": "167",
   "totalPages": 2,
   "pageSize": 100,
   "pageNum": null,
   "result": [
       {
           "exchange_id": 409,
           "exchange_code": "ADX",
           "exchange_name": "Abi Dhabi Securities Exchange",
           "country_id": 192,
           "country_name": "United Arab Emirates",
           "country_iso2": "AE",
           "country_iso3": "ARE",
           "region_id": 3,
           "region": "Africa / Middle East",
           "currency_id": 2,
           "currency_name": "United Arab Emirates Dirham",
           "iso_code": "AED",
           "currency_code": "AED",
           "exchange_parent_id": null,
           "exchange_parent_code": null,
           "exchange_parent_name": null,
           "totalRecords": "167"
       },
       ...
   ]
}
```

## Get Exchanges Sources Drop Down

Returns data for all exchanges sources drop downs.


```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getExchangesSourcesDropDown
```

> Parameters

```
(Optional and doesn't take any value)
byExchange
```

> Response

```json
{
   "result": {
       "populare": [
           {
               "country_id": 12,
               "country_name": "Australia",
               "country_iso2": "AU"
           },
           ...
       ],
       "more": [
           {
               "country_id": 1,
               "country_name": "Afghanistan",
               "country_iso2": "AF"
           },
           ...
       ]
}
```

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

## Get Future Groups

Returns all future groups.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getFutureGroups
```

> Response

```json
{
    "result": [
        {
           "group_id": 1,
           "group_code": "financials",
           "group_title": "Financials"
        },
        ...
}
```


## Get Future Exchanges

Returns all future exchanges.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getFutureExchanges
```

> Response

```json
{
    "result": [
        {
           "exchange_id": 3016,
           "group_code": "APEX",
           "group_title": "APEX"
        },
        ...
}
```


## Get Future Root Symbols

Returns all future root symbols.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getFutureRootSymbols
```

> Parameters

```
(All parameters are optional and are only used to filter results.)
group_code: your_group
exhange_code: your_exchange
symbol_value: your_symbol
```

> Response

```json
{
    "totalRecords": "358",
    "totalPages": 4,
    "pageSize": 100,
    "pageNum": null,
    "result": [
        {
           "symbol_id": 1514931,
           "symbol_value": "M2",
           "symbol": "M2",
           "symbol_name": "10-Year EUR I/R Swap",
           "exchange_code": "CBOT",
           "group_id": 1,
           "group_code": "financials",
           "group_title": "Financials",
           "contract_size": null,
           "exhange_margin": null,
           "traded_months": null,
           "point_value": null,
           "tick_value": null,
           "trading_hours": null,
           "totalRecords": "358"
        },
        ...
}
```

## Get Future Prices

Returns all future prices for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getFuturePrices
```


> Parameters

```
symbol: your_future_symbol
```

> Response

```json
{
    "totalRecords": "112",
    "totalPages": 2,
    "pageSize": 100,
    "pageNum": null,
    "result": [
        {
           "px_date": "2018-02-05",
           "symbol_id": "1517019",
           "symbol_value": "A6N2018",
           "symbol": "A6N2018",
           "symbol_name": "Australian Dollar June 2018",
           "chg_1d": "0.0488",
           "return_1d": "6.5821",
           "px_open": "0.79",
           "px_high": "0.79",
           "px_low": "0.79",
           "px_close": "0.79",
           "volume": null,
           "totalRecords": "112"
        },
        ...
    ]
}
```

## Get ETF Members

Returns ETF members for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getEtfMembers
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
    totalRecords: "0",
    totalPages: 0,
    pageSize: 100,
    pageNum: null,
    columns: [
        {
          code: "constituent_name",
          name: "Constituent Name",
          styles: {
             textAlign: "left"
          }
        },
        ...
    ]
    ...
}
```

## Get ETF Holders

Returns ETF holders for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getEtfHolders
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
    totalRecords: "0",
    totalPages: 0,
    pageSize: 100,
    pageNum: null,
    columns: [
        {
          code: "symbol_vlue",
          name: "Symbol",
          styles: {
             textAlign: "left"
          }
          width: 140,
          fixed: true
        },
        ...
    ]
    ...
}
```

## Get Performance Data

Returns performance data for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getPerformanceData
```

> Parameters

```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
watchlist: your_watchlist
```

> Response

```json
{
    result: [
        {
           symbol_value: "$ALBANIACONSPE",
           symbol_name: "Albania Consumer Spending",
           symbol_id: "1595093",
           px_date: "2018-06-30T00:00:00.000Z",
           chg_1d_val: "43879.603000000",
           chg_1d_pct: "0.16694xxxxxx",
           ...
        }
    ]
}

```


## Get Performance Report

Returns performance report for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getPerformanceReport
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
    result: [
        {
           period: "YTD",
           symbol_id: "1595093",
           range_high_date: null,
           range_low_date: null,
           chg_val: "0",
           chg_pct: "0",
           range_low: "0",
           range_high: "0",
           range_open: "0",
           range_close: "0",
           open_to_low_pct: "0",
           close_to_high_pct: "0"
        },
        ...
}
```

## Get Updowns for Symbol

Returns updowns for a given symbol.


```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getUpDownsForSymbol
```

> Parameters

```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
interval: your_interval (default "d")
```

> Response

```json
{
    result: [
       {
           label: "Mon",
           p_count: 3,
           n_count: 3,
           p_chg: 0.10168,
           n_chg: -0.05509
       },
       ...
    ]
}
```

## Get Exchanges Overview

Returns exchanges overview for a given datetime.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getExchangesOverview
```

> Parameters

```
dateTime: your_datetime
(e.g: "2018-06-30T00:00:00.000Z")
```

> Response

```json
{
    error: null,
    result: {
        userId: "xxxxxxxxx",
        exchange: "NYSE",
        securityTypes: "equity",
        dateTime: "2018-06-30T00:00:00.000Z",
        pageSize: 10,
        columns: [
            {
               code: "symbol_value",
               name: "Symbol",
               styles: {
                  textAlign: "left"
               },
               width: 140,
               fixed: true
            },
            ...
        ]
    }
}
```

## Get Exchanges Shares Trading

Returns exchanges shares trading data for given datetime.


```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getExchangesOverview
```

> Parameters

```
dateTime: your_datetime
(e.g: "2018-06-30T00:00:00.000Z")
```

> Response

```json
{
    result: {
        declones: null,
        advanced: null,
        not_change: null,
        columns: [
            {
               code: "advanced",
               name: "Advanced",
               styles: {
                  textAlign: "right",
                  color: "#24e5a2"
               },
               format: {
                  type: "number",
                  formatValue: "2",
                  enableSort: true
               },
               width: 130,
               colorized: true
            },
            ...
        ]
    }
}
```

## Get Exchanges Most Active

Returns most active exchanges.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getExchangesOverview
```

> Response

```json
{
    totalRecords: "5619",
    totalPages: 57,
    pageSize: 100,
    pageNum: null,
    columns: [
        {
           code: "symbol_value",
           name: "Symbol",
           styles: {
              textAlign: "left"
           },
           width: 140,
           fixed: true
        },
        ...
    ]
}
```


## Get Exchanges Declines

Returns exchanges declines data.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getExchangesDeclines
```

> Response

```json
{
    totalRecords: "3315",
    totalPages: 34,
    pageSize: 100,
    pageNum: null,
    columns: [
        {
           code: "symbol_value",
           name: "Symbol",
           styles: {
              textAlign: "left"
           },
           width: 140,
           fixed: true
        },
        ...
    ]
}
```

## Get Symbol Gain Loss

Returns data for symbol gain loss

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolGainLoss
```

> Parameters

```
symbol or symbolId: your_symbol
view (optional): your_view
amount (required when view = growth): your_amount
```

> Response

```json
{
    result: {
       symbol_id: "4671378",
       symbol: "TRIBL",
       symbol_name: "Trust Investment Bank Limited",
       start_date: "2015-04-15",
       end_date: "2019-01-08",
       shares_count: null,
       amount_invested: null,
       min: null,
       max: null,
       ...
    }
}
```

## Get Symbol Returns

Returns symbol returns data for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolReturns
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
    result: {
       returns: {
           return_1d: {
               start_date: "2019-01-22",
               end_date: "2019-01-08",
               value: 0
           },
           ...
       }
    }
}
```

## Get Symbol Trends

Returns symbol trends for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getSymbolTrends
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
    columns: [
        {
           code: "direction",
           name: "Direction",
           styles: {
              textAlign: "left"
           },
           width: 120,
        },
        ...
    ]
    ...
}
```
