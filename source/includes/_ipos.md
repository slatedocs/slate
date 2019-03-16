# IPOs APIs
Requires authentication.

## Get IPOs Rows

Returns all IPOs

```APIs
GET https://dev.zoomsymbols.com/api/ipos/getIPOsRows
```


> Response

```json
{
    totalRecords: "217",
    totalPages: 3,
    pageSize: 100,
    pageNum: null,
    columns: [{
                code: "ipo_date",
                name: "Ipo Date",
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
                code: "symbol_value",
                name: "Symbol",
                enableSort: true,
                styles: {
                    textAlign: "left"
                },
                width: 240,
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
            {
                code: "chart_data",
                name: "Chart",
                enableSort: false,
                format: {
                    type: "chart",
                    formatValue: "0",
                    enableSort: false
                },
                width: 150
            },
            {
                code: "px_close",
                name: "Close Price",
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
                width: 150,
                fixed: false
            },
            ...
    ]
  }
```
