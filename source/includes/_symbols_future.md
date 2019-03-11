

# Symbols Future APIs

Requires authentication.

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

