# UI APIs

Does not require authentication.

## Get Applications

Returns all available applications (grouped).

```APIs
GET https://dev.zoomsymbols.com/api/ui/getApplications?isMobile=true
```

> Response

```json
{
  "result": [{
      "code": "today",
      "name": "Today",
      "group_code": "markets",
      "group_name": "Markets",
      "navigation": "TodayStack",
      "icon": "bar-chart-2",
      "icon_family": "Feather",
      "user_can_access": true,
      "flag": "free"
      },
  ...
  ]
}
```

## List Updates

Returns data from "What's New".

```APIs
GET https://dev.zoomsymbols.com/api/ui/listUpdates
```

> Response

```json
{
  "totalRecords": "3",
  "totalPages": 1,
  "pageSize": 100,
  "pageNum": null,
  "result": [{
      "whats_news_id": "1",
      "create_date": "2018-11-20xx:xx:xx.xxxx",
      "version": "1.0 (2018-11-01)",
      "details": "Markets : xxxxxxx",
      "totalRecords": "3",
      },
  ...
  ]
}
```

## List Release Notes

Returns the release notes.

```APIs
GET https://dev.zoomsymbols.com/api/ui/listReleaseNotes
```

> Response

```json
{
  "totalRecords": "2",
  "totalPages": 1,
  "pageSize": 100,
  "pageNum": null,
  "result": [{
      "release_notes_id": "1",
      "category": "notes",
      "post_date": "2018-09-10T00:00:00.000Z",
      "details": "Markets > xxxxxxx",
      "totalRecords": "2",
      },
  ...
  ]
}
```
