

# Fundamentals APIs

Requires authentication.

## Get Fundamental Data

Returns fundamental data for given symbol and statement.

```APIs
GET https://dev.zoomsymbols.com/api/fundamentals/getFundamentalData
```

> Parameters

```
symbolId/symbol: your_symbol
statement: your_statement
```

> Response

```json
{
   "totalRecords": "x",
   "totalPages": x,
   "pageSize": 100,
   "pageNum": null,
   "result": [...]
}
```

## Get Fundamental History

Returns fundamental history for given symbol and statement.

```APIs
GET https://dev.zoomsymbols.com/api/fundamentals/getFundamentalHistory
```

> Parameters

```
symbolId/symbol: your_symbol
statement: your_statement
```

> Response

```json
{
   "totalRecords": "x",
   "totalPages": x,
   "pageSize": 100,
   "pageNum": null,
   "result": [
       {
         symbol_id: "4671378",
         symbol_value: "TRIBL",
         symbol: "TRIBL",
         symbol_name: "Trust Investment Bank Limited",
         period_type_code: "QTR",
         period_type_name: "Quarterly",
         end_date: "2018-03-31T00:00:00.000Z",
         calendar_year: 2018,
         calendar_quarter: 1,
         fiscal_year: 2018,
         fiscal_quarter: 3,
         field_id: 1342,
         field_code: "diluted_weighted_average_shares_outstanding",
         field_name: "Diluted Weighted Average Shares Outstanding",
         field_value: "138398214.000000",
         totalRecords: "430"
        },
        ...
   ]
}
```

## Get Fundamental As Column View

Returns fundamental viewed in columns.

```APIs
GET https://dev.zoomsymbols.com/api/fundamentals/getFundamentalAsColumnView
```

> Parameters

```
symbolId/symbol: your_symbol
statement: your_statement
years: number_of_years
period: your_period
```

> Response

```json
{
  "result": {
    "columns": [{
       "code": "fieldName",
       "name": ""
    },
   ...
  }]
  ...
}
```

## Get Fundamental Statements

Returns fundamental statements.

```APIs
GET https://dev.zoomsymbols.com/api/fundamentals/getFundamentalStatements
```

> Response

```json
{
  "result": [{
      "code": "income_statement",
      "name": "Income Statement"
  },
  ...
 ]
}
```


## Get Fundamental Periods

Returns fundamental periods.

```APIs
GET https://dev.zoomsymbols.com/api/fundamentals/getFundamentalPeriods
```

> Response

```json
{
  "result": [{
      "code": "FY",
      "name": "Annual"
  },
  ...
 ]
}
```

