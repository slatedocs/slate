

# Filing APIs

Requires authentication.

## Get Filings

Returns filings for symbol or symbols (symbols, symbolId or symbolIds) which are optional, startDate, endDate and report_type.

```APIs
GET https://dev.zoomsymbols.com/api/filings/getFilings
```
> Paramters

```
symbols: array_of_symbols
symbolIds: array_of_symbolIds
symbol: your_symbol
symbolId: symbol_id
startDate: start_date
endDate: end_date
report_type: report_type
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
        code: "period_type_name",
        name: "Period",
        styles: {
           textAlign: "left"
        },
        width: 130
     }
  ...
}
```
