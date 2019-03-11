

# Symbols History APIs

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
