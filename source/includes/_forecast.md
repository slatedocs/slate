

# Forecast APIs

Requires authentication.

## Get Forecast

Returns forecast for all symbols.

```APIs
GET https://dev.zoomsymbols.com/api/forecast/getForecast
```

> Response

```json
{
  "totalRecords": "14161",
  "totalPages": 142,
  "pageSize": 100,
  "pageNum": null,
  "result": [{
      "symbol_value": "$ADSMI"
      "symbol_name": "ADX GENERAL",
      ...
  },
  ...
  ]
}
```

## Get Forecast For Symbol

Returns forecast for a specific symbol.

```APIs
GET https://dev.zoomsymbols.com/api/forecast/getForecastForSymbol
```

> Parameters

```
symbol: query_symbol
```

> Response

```json
{
  "totalRecords": "14161",
  "totalPages": 142,
  "pageSize": 100,
  "pageNum": null,
  "result": [{
      "symbol_value": "$ADSMI"
      "symbol_name": "ADX GENERAL",
      ...
  },
  ...
  ]
}
```

