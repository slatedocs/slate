# Mobile APIs
Requires authentication.

## Get Markets Page

Returns data for all available markets.

```APIs
GET https://dev.zoomsymbols.com/api/mobile/getMarketsPage
```

> Response

```json
{
    result: {
        columns: [{
            code: "symbol_value",
            name: "Symbol",
            enableSort: true,
            styles: {
                textAlign: "left"
            },
            width: 180,
            fixed: true,
            onPress: {
                navigateTo: {
                    screen: "Symbol",
                    params: {
                        symbolItem: {
                            symbol_id: "{symbol_id}",
                            symbol_value: "{symbol_value}",
                            symbol_name: "{symbol_name}"
                        }
                    }
                }
            }
        }, ...],
        menu: [{
            group_code: "indices",
            group_title: "Indices",
            children: [{
                id: 72,
                group_code: "indices",
                group_title: "Indices"
            }]
        }, ...]
    }
  }
  ```

## Get Markets Page Grid Rows

Returns data for all available markets but as rows.

```APIs
GET https://dev.zoomsymbols.com/api/mobile/getMarketsPageGridRows
```

> Response

```json
  {
    columns: [{
        code: "symbol_value",
        name: "Symbol",
        enableSort: true,
        styles: {
            textAlign: "left"
        },
        width: 180,
        fixed: true,
        onPress: {
            navigateTo: {
                screen: "Symbol",
                params: {
                    symbolItem: {
                        symbol_id: "{symbol_id}",
                        symbol_value: "{symbol_value}",
                        symbol_name: "{symbol_name}"
                    }
                }
            }
        }
    },
    rows: [...],
    groupBy: "title_name"
    ]
}
```

## Get Symbol Summary

Returns a summary for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/mobile/getSymbolSummary
```

> Parameters

```
symbol/symbolId: your_symbol
```

> Response

```json
{
    result: {
        statistics: {
            symbol: "MSF",
            symbol_id: "34489",
            company_id: 21835,
            symbol_value: "MSF",
            symbol_name: "Microsoft Corporation",
            exchange_id: 6,
            exchange_code: "ENXTBR",
            exchange_name: "Euronext Brussels",
            data_provider_id: 2,
            ...
        }
    }
}
```

## Get Symbols Prices Range

Returns prices range for all symbols.

```APIs
GET https://dev.zoomsymbols.com/api/mobile/getSymbolsPricesRange
```

> Response

```json
{
    result: {
        columns: [{
                code: "px_date",
                name: "Date",
                enableSort: true,
                styles: {
                    textAlign: "left"
                },
                format: {
                    type: "date",
                    formatValue: "MM/DD/YYYY",
                    enableSort: true
                },
                width: 150
            },
            {
                code: "px_open",
                name: "Open Price",
                enableSort: true,
                styles: {
                    textAlign: "right"
                },
                format: {
                    type: "number",
                    cellsFormat: "d",
                    formatValue: "2",
                    enableSort: true
                },
                width: 130
            }, ...
        ]
    }
}
```
