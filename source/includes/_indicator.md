

# Indicator APIs

Does not require authentication.

## Get Indicator Groups

Returns all groups of indicator.

```APIs
GET https://dev.zoomsymbols.com/api/indicator/getIndicatorGroups
```

> Response

```json
{
  "result": [{
      "code": "main",
      "name": "Main Indicators",
      "rows": [{
          "code": "gpd_growth_rate",
          "name": "GDP Growth Rate",
          "reference": "Q4",
          "latest_value": "1.6%",
          "next_value": "2.9%"
      },
        ...
      ]
      ...
      }]
}
```


## Get Indicator Lists

Returns all lists of indicator.

```APIs
GET https://dev.zoomsymbols.com/api/indicator/getIndicatorList
```

> Parameters

```
country/category: country/category to retrieve info about.
```

> Response

```json
{
   "totalRecords": "192",
   "totalPages": 2,
   "pageSize": 100,
   "pageNum": null,
   "columns": [{
       "code": "category_name",
       "name": "Category",
       "styles": {
          "textAlign": "left"
       },
       "width": 210
    }, {
       "code": "latest_value",
       "name": "LATEST",
       "styles": {
            "textAlign": "left"
       },
   ...
   ]  
  ...     
}
```
