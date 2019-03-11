

# ETF Holdings APIs

Requires authentication.

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

