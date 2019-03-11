

# Symbols Performance APIs

Requires authentication.

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
