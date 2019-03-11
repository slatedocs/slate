

# Calendars APIs

Requires authentication.

## Get Calendar Events

Returns calendar data for given parameter.

```APIs
GET https://dev.zoomsymbols.com/api/calendars/getCalendarEvents
```

> Parameters

```
(Must be given at least one parameter.)
category: desired_category
sector: desired_sector
industry: desired_industry
country: desired_country
```

> Response

```json
{
  "totalRecords": "0",
  "totalPages": 0,
  "pageSize": 100,
  "pageNum": null,
  "columns": [{
      "code": "symbol_value",
      "name": "Symbol",
      "styles": {
         "textAlign": "left"
      },
      "width": 140
  },
   ...
}
```
