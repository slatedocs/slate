---
title: Timely Internal API doc
language_tabs:
  - shell: cURL

includes:
  - timely_authorization
  - errors

search: true
---

Use Timely API to integrate with your apps

Timely API helps you integrate your application with Timely. Following are the list of API’s available. For any help or support email support@timelyapp.com
# AppObjects



## create calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/245/objects/245" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70196533488820}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 15c389d2b2c2609e7aaf6728b6fe1720fccf28975936c0ce62e7ff8f74379e30" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/245/objects/245
Accept: application/json
Content-Type: application/json
Authorization: Bearer 15c389d2b2c2609e7aaf6728b6fe1720fccf28975936c0ce62e7ff8f74379e30
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70196533488820}}
```

| Name | Description |
|:-----|:------------|
| app_objects *required* | Object attributes |
| app_objects[objects] *required* | Calendar attributes |
| objects[name] *required* | Object name |
| objects[etag] *required* | Object etag |
| objects[object_id]  | Object id |
| objects[project_id]  | Object project id |
| objects[auto_import]  | Auto import hours |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "object_id": "timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com",
    "name": "Fixtures",
    "etag": "\"1482740512308000\"",
    "integrated": true,
    "updated_at": "2019-01-23T15:18:33+01:00",
    "auto_import": true,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": true,
    "updated_at": "2019-01-23T15:18:33+01:00",
    "auto_import": false,
    "project_id": 2
  },
  {
    "object_id": "timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com",
    "name": "Calendar Sync Test",
    "etag": "\"1457979057839000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com",
    "name": "Timely Trials",
    "etag": "\"1457979060008000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com",
    "name": "Calendar Sync II",
    "etag": "\"1457979061137000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com",
    "name": "Calendar integration",
    "etag": "\"1469680526663000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com",
    "name": "Calendar Sync III",
    "etag": "\"1457979056819000\"",
    "integrated": false
  }
]
```


## delete calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/247/objects/247" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70196485418160}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 25c861ad27b1bd54240ece6a5d05b1494006ffb8318711cd005e0f8359df93f3" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/247/objects/247
Accept: application/json
Content-Type: application/json
Authorization: Bearer 25c861ad27b1bd54240ece6a5d05b1494006ffb8318711cd005e0f8359df93f3
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70196485418160}}
```

| Name | Description |
|:-----|:------------|
| app_objects *required* | Object attributes |
| app_objects[objects] *required* | Calendar attributes |
| objects[name] *required* | Object name |
| objects[etag] *required* | Object etag |
| objects[object_id]  | Object id |
| objects[project_id]  | Object project id |
| objects[auto_import]  | Auto import hours |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "object_id": "timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com",
    "name": "Fixtures",
    "etag": "\"1482740512308000\"",
    "integrated": true,
    "updated_at": "2019-01-23T15:18:34+01:00",
    "auto_import": false,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com",
    "name": "Calendar Sync Test",
    "etag": "\"1457979057839000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com",
    "name": "Timely Trials",
    "etag": "\"1457979060008000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com",
    "name": "Calendar Sync II",
    "etag": "\"1457979061137000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com",
    "name": "Calendar integration",
    "etag": "\"1469680526663000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com",
    "name": "Calendar Sync III",
    "etag": "\"1457979056819000\"",
    "integrated": false
  }
]
```


## list objects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/243/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9d3f924bd3ef975184bb73f046531c9c1920ad29767486eab45127f8dced8ebe" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/243/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9d3f924bd3ef975184bb73f046531c9c1920ad29767486eab45127f8dced8ebe
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "object_id": "timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com",
    "name": "Fixtures",
    "etag": "\"1482740512308000\"",
    "integrated": false
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com",
    "name": "Calendar Sync Test",
    "etag": "\"1457979057839000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com",
    "name": "Timely Trials",
    "etag": "\"1457979060008000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com",
    "name": "Calendar Sync II",
    "etag": "\"1457979061137000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com",
    "name": "Calendar integration",
    "etag": "\"1469680526663000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com",
    "name": "Calendar Sync III",
    "etag": "\"1457979056819000\"",
    "integrated": false
  }
]
```


## list objects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/244/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2e11cfb5e6468e94eafb607ccf2b3cdaeb1cb5bfa9a4b20f763f25e56a4f1a76" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/244/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2e11cfb5e6468e94eafb607ccf2b3cdaeb1cb5bfa9a4b20f763f25e56a4f1a76
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "object_id": "AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAAhT1AAAA",
    "name": "Calendar",
    "etag": "5oz8Ye3dNUGORWPMT6HxsAAAAAAV7g==",
    "integrated": false
  },
  {
    "object_id": "AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAAhT2AAAA",
    "name": "United States holidays",
    "etag": "5oz8Ye3dNUGORWPMT6HxsAAAAAAV7w==",
    "integrated": false
  },
  {
    "object_id": "AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAAhT4AAAA",
    "name": "Birthdays",
    "etag": "5oz8Ye3dNUGORWPMT6HxsAAAAAAV8Q==",
    "integrated": false
  },
  {
    "object_id": "AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAABSmEdwAAAA=",
    "name": "timely calendar",
    "etag": "5oz8Ye3dNUGORWPMT6HxsAAAFKjA1Q==",
    "integrated": false
  },
  {
    "object_id": "AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAABzE_nIAAAA=",
    "name": "pravin cal",
    "etag": "5oz8Ye3dNUGORWPMT6HxsAAAHMiPOg==",
    "integrated": false
  }
]
```


## update calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/246/objects/246" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70196532039100}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer df5804a99622a9ca1fbc3423c0c8f75786713bfe540d3f63299aa536491909a4" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/246/objects/246
Accept: application/json
Content-Type: application/json
Authorization: Bearer df5804a99622a9ca1fbc3423c0c8f75786713bfe540d3f63299aa536491909a4
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70196532039100}}
```

| Name | Description |
|:-----|:------------|
| app_objects *required* | Object attributes |
| app_objects[objects] *required* | Calendar attributes |
| objects[name] *required* | Object name |
| objects[etag] *required* | Object etag |
| objects[object_id]  | Object id |
| objects[project_id]  | Object project id |
| objects[auto_import]  | Auto import hours |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "object_id": "timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com",
    "name": "Fixtures",
    "etag": "\"1482740512308000\"",
    "integrated": true,
    "updated_at": "2019-01-23T15:18:34+01:00",
    "auto_import": false,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": true,
    "updated_at": "2019-01-23T15:18:34+01:00",
    "auto_import": true,
    "project_id": 2
  },
  {
    "object_id": "timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com",
    "name": "Calendar Sync Test",
    "etag": "\"1457979057839000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com",
    "name": "Timely Trials",
    "etag": "\"1457979060008000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com",
    "name": "Calendar Sync II",
    "etag": "\"1457979061137000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com",
    "name": "Calendar integration",
    "etag": "\"1469680526663000\"",
    "integrated": false
  },
  {
    "object_id": "timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com",
    "name": "Calendar Sync III",
    "etag": "\"1457979056819000\"",
    "integrated": false
  }
]
```


# Apps



## delete connected app


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/332/connected/265" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7eb372fb5358951ce105a6f01c1535c4407132384dbddc1e8ab139e08f0f80fe" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/apps/:app_id/connected/:id`

```plaintext
DELETE /1.1/apps/332/connected/265
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7eb372fb5358951ce105a6f01c1535c4407132384dbddc1e8ab139e08f0f80fe
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


## list apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 56e7675f3f48b7326ece75df0430aa163f1dd20c960a939c2338dbfbf81a2ad8" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps`

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer 56e7675f3f48b7326ece75df0430aa163f1dd20c960a939c2338dbfbf81a2ad8
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "app_id": 318,
    "id": "google_calendar",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-23T15:18:34+01:00",
    "last_imported_at": null,
    "platforms": [
      "ios",
      "android"
    ],
    "summary": "Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Google Calendar entries.",
    "provider": "Google",
    "provider_url": "https://calendar.google.com",
    "screenshots": [
      "screenshots/google_calendar/screenshot1.png"
    ],
    "logo_path": "apps_logo/google_calendar.png",
    "authorize_url": "/auth/google_calendar/authorize",
    "connected_apps_url": "/apps/318/connected"
  },
  {
    "app_id": 319,
    "id": "office365",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-23T15:18:34+01:00",
    "last_imported_at": null,
    "platforms": [
      "ios",
      "android"
    ],
    "summary": "Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Office 365 entries.",
    "provider": "Microsoft",
    "provider_url": "https://products.office.com/en-us/business/explore-office-365-for-business",
    "screenshots": [
      "screenshots/office365/screenshot1.png"
    ],
    "logo_path": "apps_logo/office365.png",
    "authorize_url": "/auth/office365/authorize",
    "connected_apps_url": "/apps/319/connected"
  },
  {
    "app_id": 320,
    "id": "gmail",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-23T15:18:34+01:00",
    "last_imported_at": null,
    "platforms": [
      "ios",
      "android"
    ],
    "summary": "See exactly how much time you spend managing your Gmail each day. All the emails you send in a day will automatically appear in your private Memory timeline for easy reference.",
    "provider": "Google",
    "provider_url": "https://gmail.com/",
    "screenshots": [
      "screenshots/gmail/screenshot1.png"
    ],
    "logo_path": "apps_logo/gmail.png",
    "authorize_url": "/auth/gmail/authorize",
    "connected_apps_url": "/apps/320/connected"
  },
  {
    "app_id": 321,
    "id": "moves_app",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 1,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-21T15:18:34+01:00",
    "last_imported_at": "2019-01-22T15:18:34+01:00",
    "platforms": [
      "ios",
      "android"
    ],
    "summary": "Track off-site meetings, travel for work and the time you spend in the office every day. Essential for on-the-go professionals who need to record where they’ve been and for how long.",
    "provider": "Facebook",
    "provider_url": "https://moves-app.com/",
    "screenshots": [
      "screenshots/moves_app/screenshot1.png",
      "screenshots/moves_app/screenshot2.png"
    ],
    "logo_path": "apps_logo/moves_app.png",
    "authorize_url": "/auth/moves_app/authorize",
    "connected_apps_url": "/apps/321/connected"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/322/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d82e4286f582ac8fc8d1645ed0868848ae630b24c90778e768e2b940519003bc" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/322/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer d82e4286f582ac8fc8d1645ed0868848ae630b24c90778e768e2b940519003bc
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 253,
    "name": "Tom Hardy",
    "email": "tom@timelyapp.com",
    "active": true,
    "created_at": "2019-01-23T15:18:34+01:00",
    "updated_at": "2019-01-23T15:18:34+01:00",
    "last_imported_at": null,
    "disconnected": false,
    "disconnected_reason": null,
    "objects": true,
    "objects_type": "calendars",
    "objects_url": "/1.1/apps/253/objects"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/328/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 06bd2040961f1ca44eae524f024a857be837e012a59955b38c2ed83f50d156b0" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/328/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 06bd2040961f1ca44eae524f024a857be837e012a59955b38c2ed83f50d156b0
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 260,
    "name": "Tom Hardy",
    "email": "tom@timelyapp.com",
    "active": true,
    "created_at": "2019-01-23T15:18:34+01:00",
    "updated_at": "2019-01-23T15:18:34+01:00",
    "last_imported_at": null,
    "disconnected": false,
    "disconnected_reason": null,
    "objects": false
  }
]
```


# BudgetRecurrences



## month recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1251/projects/1008/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8b6b7ea6efd0ea82bf1cfc2b32d790d16f1c2e5e6e35c3df602990796098c42d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1251/projects/1008/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8b6b7ea6efd0ea82bf1cfc2b32d790d16f1c2e5e6e35c3df602990796098c42d
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "recur": "August 2018",
    "start_date": "2018-08-01",
    "end_date": "2018-08-31",
    "totals": {
      "duration": {
        "hours": 4,
        "minutes": 0,
        "seconds": 0,
        "formatted": "04:00",
        "total_hours": 4.0,
        "total_seconds": 14400,
        "total_minutes": 240
      },
      "estimated_duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "cost": {
        "fractional": 40000,
        "formatted": "$400.00",
        "amount": 400.0
      },
      "estimated_cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      }
    }
  },
  {
    "recur": "September 2018",
    "start_date": "2018-09-01",
    "end_date": "2018-09-30",
    "totals": {
      "duration": {
        "hours": 5,
        "minutes": 0,
        "seconds": 0,
        "formatted": "05:00",
        "total_hours": 5.0,
        "total_seconds": 18000,
        "total_minutes": 300
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 50000,
        "formatted": "$500.00",
        "amount": 500.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "October 2018",
    "start_date": "2018-10-01",
    "end_date": "2018-10-31",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "November 2018",
    "start_date": "2018-11-01",
    "end_date": "2018-11-30",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  }
]
```


## month recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1252/projects/1009/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ea899582c84d6840fa984ac9bde696ca2256963546bd0b1919ab5b3df26768da" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1252/projects/1009/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer ea899582c84d6840fa984ac9bde696ca2256963546bd0b1919ab5b3df26768da
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "recur": "August 2018",
    "start_date": "2018-08-01",
    "end_date": "2018-08-31",
    "totals": {
      "duration": {
        "hours": 4,
        "minutes": 0,
        "seconds": 0,
        "formatted": "04:00",
        "total_hours": 4.0,
        "total_seconds": 14400,
        "total_minutes": 240
      },
      "estimated_duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "cost": {
        "fractional": 40000,
        "formatted": "$400.00",
        "amount": 400.0
      },
      "estimated_cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      }
    }
  },
  {
    "recur": "September 2018",
    "start_date": "2018-09-01",
    "end_date": "2018-09-30",
    "totals": {
      "duration": {
        "hours": 5,
        "minutes": 0,
        "seconds": 0,
        "formatted": "05:00",
        "total_hours": 5.0,
        "total_seconds": 18000,
        "total_minutes": 300
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 50000,
        "formatted": "$500.00",
        "amount": 500.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "October 2018",
    "start_date": "2018-10-01",
    "end_date": "2018-10-31",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "November 2018",
    "start_date": "2018-11-01",
    "end_date": "2018-11-30",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "September 2019",
    "start_date": "2019-09-01",
    "end_date": "2019-09-30",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 5,
        "minutes": 0,
        "seconds": 0,
        "formatted": "05:00",
        "total_hours": 5.0,
        "total_seconds": 18000,
        "total_minutes": 300
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 50000,
        "formatted": "$500.00",
        "amount": 500.0
      }
    }
  }
]
```


## week recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1249/projects/1006/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 16b704a345d01765d4a269377f72c260ecf2001abc85c7228decd8d835d3055e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1249/projects/1006/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 16b704a345d01765d4a269377f72c260ecf2001abc85c7228decd8d835d3055e
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "recur": "33 2018",
    "start_date": "2018-08-13",
    "end_date": "2018-08-19",
    "totals": {
      "duration": {
        "hours": 4,
        "minutes": 0,
        "seconds": 0,
        "formatted": "04:00",
        "total_hours": 4.0,
        "total_seconds": 14400,
        "total_minutes": 240
      },
      "estimated_duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "cost": {
        "fractional": 40000,
        "formatted": "$400.00",
        "amount": 400.0
      },
      "estimated_cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      }
    }
  },
  {
    "recur": "35 2018",
    "start_date": "2018-08-27",
    "end_date": "2018-09-02",
    "totals": {
      "duration": {
        "hours": 5,
        "minutes": 0,
        "seconds": 0,
        "formatted": "05:00",
        "total_hours": 5.0,
        "total_seconds": 18000,
        "total_minutes": 300
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 50000,
        "formatted": "$500.00",
        "amount": 500.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "40 2018",
    "start_date": "2018-10-01",
    "end_date": "2018-10-07",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "45 2018",
    "start_date": "2018-11-05",
    "end_date": "2018-11-11",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  }
]
```


## week recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1250/projects/1007/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer cac53237cf8f1c21ab831e39232f2e4b0b0e9f5c43ec16a0f2f73921ec48eadb" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1250/projects/1007/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer cac53237cf8f1c21ab831e39232f2e4b0b0e9f5c43ec16a0f2f73921ec48eadb
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "recur": "33 2018",
    "start_date": "2018-08-13",
    "end_date": "2018-08-19",
    "totals": {
      "duration": {
        "hours": 4,
        "minutes": 0,
        "seconds": 0,
        "formatted": "04:00",
        "total_hours": 4.0,
        "total_seconds": 14400,
        "total_minutes": 240
      },
      "estimated_duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "cost": {
        "fractional": 40000,
        "formatted": "$400.00",
        "amount": 400.0
      },
      "estimated_cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      }
    }
  },
  {
    "recur": "35 2018",
    "start_date": "2018-08-27",
    "end_date": "2018-09-02",
    "totals": {
      "duration": {
        "hours": 5,
        "minutes": 0,
        "seconds": 0,
        "formatted": "05:00",
        "total_hours": 5.0,
        "total_seconds": 18000,
        "total_minutes": 300
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 50000,
        "formatted": "$500.00",
        "amount": 500.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "40 2018",
    "start_date": "2018-10-01",
    "end_date": "2018-10-07",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "45 2018",
    "start_date": "2018-11-05",
    "end_date": "2018-11-11",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 8,
        "minutes": 0,
        "seconds": 0,
        "formatted": "08:00",
        "total_hours": 8.0,
        "total_seconds": 28800,
        "total_minutes": 480
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 80000,
        "formatted": "$800.00",
        "amount": 800.0
      }
    }
  },
  {
    "recur": "37 2019",
    "start_date": "2019-09-09",
    "end_date": "2019-09-15",
    "totals": {
      "duration": {
        "hours": 0,
        "minutes": 0,
        "seconds": 0,
        "formatted": "00:00",
        "total_hours": 0.0,
        "total_seconds": 0,
        "total_minutes": 0
      },
      "estimated_duration": {
        "hours": 5,
        "minutes": 0,
        "seconds": 0,
        "formatted": "05:00",
        "total_hours": 5.0,
        "total_seconds": 18000,
        "total_minutes": 300
      },
      "cost": {
        "fractional": 0,
        "formatted": "$0.00",
        "amount": 0.0
      },
      "estimated_cost": {
        "fractional": 50000,
        "formatted": "$500.00",
        "amount": 500.0
      }
    }
  }
]
```


# Discard Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/1257/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[294]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 507555408357bfd87347d166afdd702e7f9ae2d4b17e585144f791710395c904" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/suggested_entries/discard`

```plaintext
POST /1.1/1257/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 507555408357bfd87347d166afdd702e7f9ae2d4b17e585144f791710395c904
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[294]}}
```

None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


## index


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1256/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fb66e04801f15e73cef90e958cd4bb15fdc7981fde76d65cc1df48cc0ac9f2fb" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries/discarded`

```plaintext
GET /1.1/1256/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer fb66e04801f15e73cef90e958cd4bb15fdc7981fde76d65cc1df48cc0ac9f2fb
```

#### Parameters

```json
{}: 
```


None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-23",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      293
    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [

    ],
    "importance": 0.8,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 293,
        "type": "macOS",
        "uid": "e02bea9f-f598-4f96-aa84-8af28bf768b5",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2019-01-23",
        "from": "2019-01-23T10:00:00+01:00",
        "to": "2019-01-23T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2019-01-23T10:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": "mac_vim.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/timeline_app_logos/macvim.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0.8,
        "spam": true
      }
    ]
  }
]
```


## remove


### Request

```shell
curl "https://api.timelyapp.com/1.1/1258/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[297]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer df49bf90d7ba7b114ede3317bf559ac16346960b3080dd0dd916b9d718c1bfb8" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggested_entries/discard`

```plaintext
DELETE /1.1/1258/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer df49bf90d7ba7b114ede3317bf559ac16346960b3080dd0dd916b9d718c1bfb8
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[297]}}
```

None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


# Duration



## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=298%2C299" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 845afa8bbec87088b12dabbd91e7639171dd8ff75f13abd9c88f3d4c7571d95c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=298%2C299
Accept: application/json
Content-Type: application/json
Authorization: Bearer 845afa8bbec87088b12dabbd91e7639171dd8ff75f13abd9c88f3d4c7571d95c
```

#### Parameters

```json
entry_ids: 298,299
```


| Name | Description |
|:-----|:------------|
| entry_ids  | Comma separated list of entry ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "hours": 4,
  "minutes": 30,
  "seconds": 0,
  "formatted": "04:30",
  "total_hours": 4.5,
  "total_seconds": 16200,
  "total_minutes": 270
}
```


## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=300%2C301" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 97c708b952de72f85287425f635c408e02a4622120ca6989ab20c3a4afb20ad9" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=300%2C301
Accept: application/json
Content-Type: application/json
Authorization: Bearer 97c708b952de72f85287425f635c408e02a4622120ca6989ab20c3a4afb20ad9
```

#### Parameters

```json
entry_ids: 300,301
```


| Name | Description |
|:-----|:------------|
| entry_ids  | Comma separated list of entry ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "hours": 3,
  "minutes": 30,
  "seconds": 0,
  "formatted": "03:30",
  "total_hours": 3.5,
  "total_seconds": 12600,
  "total_minutes": 210
}
```


## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=302%2C303" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8e0751314f5608f71b9194f4a0fe2068d0ec6d2929b13d3d9cbce327246faec4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=302%2C303
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8e0751314f5608f71b9194f4a0fe2068d0ec6d2929b13d3d9cbce327246faec4
```

#### Parameters

```json
entry_ids: 302,303
```


| Name | Description |
|:-----|:------------|
| entry_ids  | Comma separated list of entry ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "hours": 5,
  "minutes": 0,
  "seconds": 0,
  "formatted": "05:00",
  "total_hours": 5.0,
  "total_seconds": 18000,
  "total_minutes": 300
}
```


# Entries



## update deleted


### Request

```shell
curl "https://api.timelyapp.com/1.1/entries/315" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d943745b9176848e928098a7c903949caf1ab1010736f8c7065d9271e25484fb" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/entries/:id`

```plaintext
DELETE /1.1/entries/315
Accept: application/json
Content-Type: application/json
Authorization: Bearer d943745b9176848e928098a7c903949caf1ab1010736f8c7065d9271e25484fb
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


## with date


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?date=2019-01-25" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b6348fedf5efb13a5d9a146810abb1319f98e658bea0bde66fc1fe3c137f9719" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?date=2019-01-25
Accept: application/json
Content-Type: application/json
Authorization: Bearer b6348fedf5efb13a5d9a146810abb1319f98e658bea0bde66fc1fe3c137f9719
```

#### Parameters

```json
date: 2019-01-25
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 100) |
| date  | Date to retrieve records (Default current date) |
| order  | Order to retrieve records (Default updated_at DESC) |
| entry_ids  | Retrieve specific entry_ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 309,
    "type": "google_calendar",
    "uid": "737fb0fb-3bca-42cc-af1b-f1ec88ad305a",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "15:18 - 18:48 • Discuss about future",
    "date": "2019-01-25",
    "from": "2019-01-23T15:18:43+01:00",
    "to": "2019-01-23T18:48:43+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2019-01-23T15:18:43+01:00",
    "extra_attributes": [

    ],
    "icon": "google_calendar.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "url": null
  }
]
```


## with date


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/summary?from=2019-01-23&to=2019-01-29" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 40185f5c08d31e3048a86105e3e632fee0bb00cef48a4205dcd6e47cc98e3164" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/summary`

```plaintext
GET /1.1/entries/summary?from=2019-01-23&amp;to=2019-01-29
Accept: application/json
Content-Type: application/json
Authorization: Bearer 40185f5c08d31e3048a86105e3e632fee0bb00cef48a4205dcd6e47cc98e3164
```

#### Parameters

```json
from: 2019-01-23
to: 2019-01-29
```


| Name | Description |
|:-----|:------------|
| from  | From date to retrieve records (Default current date) |
| to  | To date to retrieve records (Default current date) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "day": "2019-01-23",
    "entry_ids": [
      319,
      320
    ]
  },
  {
    "day": "2019-01-25",
    "entry_ids": [
      321
    ]
  }
]
```


## with default params


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d814aca81e59c2b74e9f483abef2924ff8c603f1fec15c4c2f33202ecf601280" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer d814aca81e59c2b74e9f483abef2924ff8c603f1fec15c4c2f33202ecf601280
```

#### Parameters



| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 100) |
| date  | Date to retrieve records (Default current date) |
| order  | Order to retrieve records (Default updated_at DESC) |
| entry_ids  | Retrieve specific entry_ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 304,
    "type": "macOS",
    "uid": "295749c7-15a7-4759-8e63-e719380ab9d9",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-23",
    "from": "2019-01-23T15:18:42+01:00",
    "to": "2019-01-23T18:48:42+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2019-01-23T15:18:42+01:00",
    "extra_attributes": [
      {
        "name": "application",
        "value": "MacVim"
      },
      {
        "name": "detail",
        "value": ""
      }
    ],
    "icon": "mac_vim.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "url": null
  },
  {
    "id": 305,
    "type": "google_calendar",
    "uid": "c5f46fcf-7437-4fb0-b5f0-01bcfdc4ef12",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "15:18 - 18:48 • Discuss about future",
    "date": "2019-01-23",
    "from": "2019-01-23T15:18:42+01:00",
    "to": "2019-01-23T18:48:42+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2019-01-23T15:18:42+01:00",
    "extra_attributes": [

    ],
    "icon": "google_calendar.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "url": null
  }
]
```


## with default params


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/summary" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9c7a9349c01fe86ddac11b29a4cb5459ae35efa02e0e3990562f71c681bef93e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/summary`

```plaintext
GET /1.1/entries/summary
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9c7a9349c01fe86ddac11b29a4cb5459ae35efa02e0e3990562f71c681bef93e
```

#### Parameters



| Name | Description |
|:-----|:------------|
| from  | From date to retrieve records (Default current date) |
| to  | To date to retrieve records (Default current date) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "day": "2019-01-23",
    "entry_ids": [
      316,
      317
    ]
  }
]
```


## with entry_ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=310%2C312" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 19ad0769fa5ea248892f842a681873b1cd6973e143082928d678fbc3e542296c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=310%2C312
Accept: application/json
Content-Type: application/json
Authorization: Bearer 19ad0769fa5ea248892f842a681873b1cd6973e143082928d678fbc3e542296c
```

#### Parameters

```json
entry_ids: 310,312
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 100) |
| date  | Date to retrieve records (Default current date) |
| order  | Order to retrieve records (Default updated_at DESC) |
| entry_ids  | Retrieve specific entry_ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 310,
    "type": "macOS",
    "uid": "e7527037-11a1-42fc-a356-8ab48a24ea5d",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-23",
    "from": "2019-01-23T15:18:43+01:00",
    "to": "2019-01-23T18:48:43+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2019-01-23T15:18:43+01:00",
    "extra_attributes": [
      {
        "name": "application",
        "value": "MacVim"
      },
      {
        "name": "detail",
        "value": ""
      }
    ],
    "icon": "mac_vim.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "url": null
  },
  {
    "id": 312,
    "type": "google_calendar",
    "uid": "2c7febb3-431a-4233-8f96-f0c9830179df",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "15:18 - 18:48 • Discuss about future",
    "date": "2019-01-25",
    "from": "2019-01-23T15:18:43+01:00",
    "to": "2019-01-23T18:48:43+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2019-01-23T15:18:43+01:00",
    "extra_attributes": [

    ],
    "icon": "google_calendar.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "url": null
  }
]
```


# Events



## hour with id


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1281/events/1228" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 05a96b301f82936d841948591dbcf3ccbf1ac2c0aec3f20e40f43e3b91d50702" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/1281/events/1228
Accept: application/json
Content-Type: application/json
Authorization: Bearer 05a96b301f82936d841948591dbcf3ccbf1ac2c0aec3f20e40f43e3b91d50702
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1228,
  "uid": "0db6c70b-1e4f-4c26-8b70-ecf44c3957db",
  "user": {
    "id": 2920,
    "email": "quentin@timelyapp.com",
    "name": "Quintin Duponde",
    "active": false,
    "day_view_onboarded": true,
    "memory_onboarded": true,
    "created_at": 1548253128,
    "updated_at": 1548253128,
    "default_hour_rate": 0.0,
    "last_received_memories_date": null,
    "sign_in_count": null,
    "external_id": null
  },
  "project": {
    "id": 1026,
    "active": true,
    "account_id": 1281,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 799,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548253128,
    "label_ids": [

    ],
    "required_label_ids": [

    ],
    "team_ids": [

    ],
    "external_id": null,
    "budget_scope": null,
    "budget": 0,
    "budget_type": "",
    "hour_rate": 50.0,
    "hour_rate_in_cents": 5000.0,
    "labels": [

    ]
  },
  "duration": {
    "hours": 3,
    "minutes": 30,
    "seconds": 0,
    "formatted": "03:30",
    "total_hours": 3.5,
    "total_seconds": 12600,
    "total_minutes": 210
  },
  "estimated_duration": {
    "hours": 4,
    "minutes": 0,
    "seconds": 0,
    "formatted": "04:00",
    "total_hours": 4.0,
    "total_seconds": 14400,
    "total_minutes": 240
  },
  "cost": {
    "fractional": 17500,
    "formatted": "$175.00",
    "amount": 175.0
  },
  "estimated_cost": {
    "fractional": 20000,
    "formatted": "$200.00",
    "amount": 200.0
  },
  "day": "2019-01-23",
  "note": "Notes for testing with some random #hash in it.",
  "sequence": 1,
  "estimated": false,
  "timer_state": "default",
  "timer_started_on": 0,
  "timer_stopped_on": 0,
  "label_ids": [

  ],
  "user_ids": [

  ],
  "updated_at": 1548253128,
  "created_at": 1548253128,
  "created_from": "Web",
  "updated_from": "Web",
  "billed": false,
  "to": "2019-01-23T18:48:48+01:00",
  "from": "2019-01-23T15:18:48+01:00",
  "deleted": false,
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "creator_id": null,
  "updater_id": null,
  "external_id": null,
  "entry_ids": [

  ],
  "suggestion_id": null
}
```


## not found


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1282/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9340acc74623431827dc4bbca64be9c65b4f90c90e228943e7b2c68111ab9c07" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/1282/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9340acc74623431827dc4bbca64be9c65b4f90c90e228943e7b2c68111ab9c07
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
404 Not Found
```

```json
{
  "errors": {
    "message": "Not found"
  }
}
```


# Plans



## plans for appstore


### Request

```shell
curl -g "https://api.timelyapp.com/1.2/private/plans" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 02bcda59c9dab0c2fe0a291a2e656112b80f9f57d8a4bfba06d06158af9c07e3" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 02bcda59c9dab0c2fe0a291a2e656112b80f9f57d8a4bfba06d06158af9c07e3
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 28,
    "code": "essential",
    "name": "Essential",
    "users_limit": 0,
    "projects_limit": 0,
    "grace_period": 950400,
    "trial": 1209600,
    "price": 15,
    "user_price": 15,
    "default": false,
    "enabled": true,
    "version": 4,
    "cycle": "M",
    "term": 2592000,
    "campaign": "default",
    "appstore": true,
    "playstore": true,
    "features": [
      {
        "name": "memories",
        "days": 60
      },
      {
        "name": "billing",
        "days": -1
      }
    ]
  },
  {
    "id": 34,
    "code": "solo_v1",
    "name": "Solo",
    "users_limit": 1,
    "projects_limit": 3,
    "grace_period": 950400,
    "trial": 1209600,
    "price": 8,
    "user_price": 8,
    "default": false,
    "enabled": true,
    "version": 4,
    "cycle": "M",
    "term": 2592000,
    "campaign": "default",
    "appstore": true,
    "playstore": true,
    "features": [
      {
        "name": "memories",
        "days": 30
      }
    ]
  }
]
```


## plans for playstore


### Request

```shell
curl -g "https://api.timelyapp.com/1.2/private/plans" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3fc2297db3d8ef05bd0594c0901a0cd16e05cc33b957614af18bcebc1e352cba" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3fc2297db3d8ef05bd0594c0901a0cd16e05cc33b957614af18bcebc1e352cba
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 28,
    "code": "essential",
    "name": "Essential",
    "users_limit": 0,
    "projects_limit": 0,
    "grace_period": 950400,
    "trial": 1209600,
    "price": 15,
    "user_price": 15,
    "default": false,
    "enabled": true,
    "version": 4,
    "cycle": "M",
    "term": 2592000,
    "campaign": "default",
    "appstore": true,
    "playstore": true,
    "features": [
      {
        "name": "memories",
        "days": 60
      },
      {
        "name": "billing",
        "days": -1
      }
    ]
  },
  {
    "id": 34,
    "code": "solo_v1",
    "name": "Solo",
    "users_limit": 1,
    "projects_limit": 3,
    "grace_period": 950400,
    "trial": 1209600,
    "price": 8,
    "user_price": 8,
    "default": false,
    "enabled": true,
    "version": 4,
    "cycle": "M",
    "term": 2592000,
    "campaign": "default",
    "appstore": true,
    "playstore": true,
    "features": [
      {
        "name": "memories",
        "days": 30
      }
    ]
  }
]
```


# ProjectSubscriptions



## create project subscribers


### Request

```shell
curl "https://api.timelyapp.com/1.1/1292/projects/1037/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 92a88a8fe2221cf44ea99cafe19ed47f2b3d9985df6eaeb9fbc499ab82a6d4e6" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
POST /1.1/1292/projects/1037/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 92a88a8fe2221cf44ea99cafe19ed47f2b3d9985df6eaeb9fbc499ab82a6d4e6
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


## delete project subscribers


### Request

```shell
curl "https://api.timelyapp.com/1.1/1293/projects/1038/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3f450c6fa0acb45f056477e692d9fb5adb061e3eecb8c177f776339b0770ce70" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
DELETE /1.1/1293/projects/1038/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3f450c6fa0acb45f056477e692d9fb5adb061e3eecb8c177f776339b0770ce70
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


## list subscribed users


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1289/projects/1034/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c2cbf3846510a9e88bea5fcf226f99131d329cbe5dbf1aca0297fb1eb18dbaad" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscribers`

```plaintext
GET /1.1/1289/projects/1034/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer c2cbf3846510a9e88bea5fcf226f99131d329cbe5dbf1aca0297fb1eb18dbaad
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 2936,
    "email": "quentin@timelyapp.com",
    "name": "Quintin Duponde",
    "avatar": {
      "timeline": "https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_timeline.jpg&s=",
      "medium_retina": "https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50",
      "medium": "https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium.jpg&s="
    }
  }
]
```


## show project subscription


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1290/projects/1035/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 78fce25848ecb357b08e9b2cfeaefa5c2007b2ff90dd8110419c2c6ede46aa0e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/1290/projects/1035/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 78fce25848ecb357b08e9b2cfeaefa5c2007b2ff90dd8110419c2c6ede46aa0e
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "project_budget_progress": true
}
```


## show project subscription


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1291/projects/1036/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d1e6389acad8374d83202cd5c573f2649cb516cd7dcd2757e73fe98e57c3c7dc" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/1291/projects/1036/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer d1e6389acad8374d83202cd5c573f2649cb516cd7dcd2757e73fe98e57c3c7dc
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "project_budget_progress": false
}
```


# Projects



## Search all projects with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1304/projects/search?q=Lucy" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ae9fdf915a14930113da6843db1eac9a20f8da5092555cd759f0a6e9aeb81d84" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/1304/projects/search?q=Lucy
Accept: application/json
Content-Type: application/json
Authorization: Bearer ae9fdf915a14930113da6843db1eac9a20f8da5092555cd759f0a6e9aeb81d84
```

#### Parameters

```json
q: Lucy
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| q *required* | Search query (min 2 characters) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 1059,
    "name": "Lucy",
    "color": "67a3bc",
    "active": true,
    "client": {
      "id": 822,
      "name": "Timely",
      "active": true,
      "external_id": null
    }
  }
]
```


## active


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1302/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b982a87fd89eea9b88d71357ab7b353f255aa9e504fe8a993f5be09e24aff16b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1302/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer b982a87fd89eea9b88d71357ab7b353f255aa9e504fe8a993f5be09e24aff16b
```

#### Parameters

```json
filter: active
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| order  | Reverses the sorting order |
| filter  | Specifies which records to retrieve, default is current users active projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 1051,
    "active": true,
    "account_id": 1302,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 820,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548253133,
    "label_ids": [

    ],
    "required_label_ids": [

    ],
    "team_ids": [

    ],
    "external_id": null,
    "budget_scope": null,
    "budget": 300,
    "budget_type": "",
    "hour_rate": 50.0,
    "hour_rate_in_cents": 5000.0,
    "users": [
      {
        "user_id": 2962,
        "hour_rate": 100.0,
        "hour_rate_in_cents": 10000.0
      }
    ],
    "cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "estimated_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "estimated_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "billed_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "billed_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "unbilled_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "unbilled_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "labels": [

    ]
  }
]
```


## all


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1301/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d8f9dff7ef7b21c857427696c8ada80c122d558f149d103f3be8595de62909ad" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1301/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer d8f9dff7ef7b21c857427696c8ada80c122d558f149d103f3be8595de62909ad
```

#### Parameters

```json
filter: all
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| order  | Reverses the sorting order |
| filter  | Specifies which records to retrieve, default is current users active projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 1049,
    "active": true,
    "account_id": 1301,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 819,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548253133,
    "label_ids": [

    ],
    "required_label_ids": [

    ],
    "team_ids": [

    ],
    "external_id": null,
    "budget_scope": null,
    "budget": 300,
    "budget_type": "",
    "hour_rate": 50.0,
    "hour_rate_in_cents": 5000.0,
    "users": [
      {
        "user_id": 2960,
        "hour_rate": 100.0,
        "hour_rate_in_cents": 10000.0
      }
    ],
    "cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "estimated_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "estimated_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "billed_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "billed_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "unbilled_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "unbilled_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "labels": [

    ]
  },
  {
    "id": 1050,
    "active": false,
    "account_id": 1301,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 819,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548253133,
    "label_ids": [

    ],
    "required_label_ids": [

    ],
    "team_ids": [

    ],
    "external_id": null,
    "budget_scope": null,
    "budget": 300,
    "budget_type": "",
    "hour_rate": 50.0,
    "hour_rate_in_cents": 5000.0,
    "users": [
      {
        "user_id": 2960,
        "hour_rate": 100.0,
        "hour_rate_in_cents": 10000.0
      }
    ],
    "cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "estimated_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "estimated_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "billed_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "billed_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "unbilled_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "unbilled_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "labels": [

    ]
  }
]
```


## archived


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1303/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 82ef613b13d468857e3e243bffffdc1d20cb43df31a3119588cf085ac62e7486" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1303/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer 82ef613b13d468857e3e243bffffdc1d20cb43df31a3119588cf085ac62e7486
```

#### Parameters

```json
filter: archived
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| order  | Reverses the sorting order |
| filter  | Specifies which records to retrieve, default is current users active projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 1054,
    "active": false,
    "account_id": 1303,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 821,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548253133,
    "label_ids": [

    ],
    "required_label_ids": [

    ],
    "team_ids": [

    ],
    "external_id": null,
    "budget_scope": null,
    "budget": 300,
    "budget_type": "",
    "hour_rate": 50.0,
    "hour_rate_in_cents": 5000.0,
    "users": [
      {
        "user_id": 2964,
        "hour_rate": 100.0,
        "hour_rate_in_cents": 10000.0
      }
    ],
    "cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "estimated_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "estimated_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "billed_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "billed_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "unbilled_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "unbilled_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "labels": [

    ]
  }
]
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1309/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":827,"budget_type":"M","budget":300,"users":[{"user_id":2976}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c2c472fea47c27bedbd17ae8223400286e25ac86badfce121d85abf1d6e324c2" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1309/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer c2c472fea47c27bedbd17ae8223400286e25ac86badfce121d85abf1d6e324c2
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":827,"budget_type":"M","budget":300,"users":[{"user_id":2976}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
{
  "id": 1078,
  "active": true,
  "account_id": 1309,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 827,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253135,
  "label_ids": [

  ],
  "required_label_ids": [

  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": null,
  "budget": 300,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [
    {
      "user_id": 2976,
      "hour_rate": 50.0,
      "hour_rate_in_cents": 5000.0
    }
  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [

  ],
  "budget_recurrence": {
    "recur": "week",
    "start_date": "2018-09-21",
    "end_date": null,
    "recur_until": "archived",
    "days_count": 0
  }
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1306/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":824,"users":[{"user_id":2970}],"labels":[{"label_id":722},{"label_id":723,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a330fabfded015734cc453e8ac2d82e1de9e33cb512ed64848e2936137c1462c" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1306/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer a330fabfded015734cc453e8ac2d82e1de9e33cb512ed64848e2936137c1462c
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":824,"users":[{"user_id":2970}],"labels":[{"label_id":722},{"label_id":723,"budget":0,"required":false}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
{
  "id": 1075,
  "active": true,
  "account_id": 1306,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 824,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253134,
  "label_ids": [
    722,
    723
  ],
  "required_label_ids": [

  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": null,
  "budget": 0,
  "budget_type": "",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [
    {
      "user_id": 2970,
      "hour_rate": 50.0,
      "hour_rate_in_cents": 5000.0
    }
  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [
    {
      "label_id": 722,
      "budget": null,
      "required": false
    },
    {
      "label_id": 723,
      "budget": 0,
      "required": false
    }
  ]
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1307/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":825,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":2972}],"labels":[{"label_id":724,"budget":100,"required":false},{"label_id":725,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 20a062ba16b5d12233ff623f80945350cddfe8b045f972305f0bf5dc50d166f7" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1307/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 20a062ba16b5d12233ff623f80945350cddfe8b045f972305f0bf5dc50d166f7
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":825,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":2972}],"labels":[{"label_id":724,"budget":100,"required":false},{"label_id":725,"budget":200,"required":true}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
{
  "id": 1076,
  "active": true,
  "account_id": 1307,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 825,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253134,
  "label_ids": [
    724,
    725
  ],
  "required_label_ids": [
    725
  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": "tag",
  "budget": 300,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [
    {
      "user_id": 2972,
      "hour_rate": 50.0,
      "hour_rate_in_cents": 5000.0
    }
  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [
    {
      "label_id": 724,
      "budget": 100,
      "required": false
    },
    {
      "label_id": 725,
      "budget": 200,
      "required": true
    }
  ]
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1308/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":826,"budget_type":"M","budget":300,"users":[{"user_id":2974}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0ae61abc5a87ef69ff0e3c2d2cb8238eaaa1b453c2d962d515ae68698f839fce" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1308/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0ae61abc5a87ef69ff0e3c2d2cb8238eaaa1b453c2d962d515ae68698f839fce
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":826,"budget_type":"M","budget":300,"users":[{"user_id":2974}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
{
  "id": 1077,
  "active": true,
  "account_id": 1308,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 826,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253135,
  "label_ids": [

  ],
  "required_label_ids": [

  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": null,
  "budget": 300,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [
    {
      "user_id": 2974,
      "hour_rate": 50.0,
      "hour_rate_in_cents": 5000.0
    }
  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [

  ],
  "budget_recurrence": {
    "recur": "week",
    "start_date": "2018-09-21",
    "end_date": "2019-09-21",
    "recur_until": "end_date",
    "days_count": 365
  }
}
```


## mine with projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1299/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 73d49d459d31cdff0a7948ae726bd5701e4ef3bac6cc6a382d2f88e3637aa88f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1299/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 73d49d459d31cdff0a7948ae726bd5701e4ef3bac6cc6a382d2f88e3637aa88f
```

#### Parameters



| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| order  | Reverses the sorting order |
| filter  | Specifies which records to retrieve, default is current users active projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 1045,
    "active": true,
    "account_id": 1299,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 817,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548253132,
    "label_ids": [

    ],
    "required_label_ids": [

    ],
    "team_ids": [

    ],
    "external_id": null,
    "budget_scope": null,
    "budget": 300,
    "budget_type": "",
    "hour_rate": 50.0,
    "hour_rate_in_cents": 5000.0,
    "users": [
      {
        "user_id": 2956,
        "hour_rate": 100.0,
        "hour_rate_in_cents": 10000.0
      }
    ],
    "cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "estimated_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "estimated_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "billed_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "billed_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "unbilled_cost": {
      "fractional": 0,
      "formatted": "$0.00",
      "amount": 0.0
    },
    "unbilled_duration": {
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "formatted": "00:00",
      "total_hours": 0.0,
      "total_seconds": 0,
      "total_minutes": 0
    },
    "labels": [

    ]
  }
]
```


## mine without projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1300/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 336a41ee758db65dcfa2418d42cfabb3728e5341766c5b89550687cbbd1444e6" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1300/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 336a41ee758db65dcfa2418d42cfabb3728e5341766c5b89550687cbbd1444e6
```

#### Parameters



| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| order  | Reverses the sorting order |
| filter  | Specifies which records to retrieve, default is current users active projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[

]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1319/projects/1088" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f99800252f3487a5b4c9898893f0b2209323b97b5c572f63533dbe57f2b66b83" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1319/projects/1088
Accept: application/json
Content-Type: application/json
Authorization: Bearer f99800252f3487a5b4c9898893f0b2209323b97b5c572f63533dbe57f2b66b83
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":300}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1088,
  "active": true,
  "account_id": 1319,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 837,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253138,
  "label_ids": [

  ],
  "required_label_ids": [

  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": null,
  "budget": 300,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [

  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [

  ],
  "budget_recurrence": {
    "recur": "week",
    "start_date": "2018-09-21",
    "end_date": "2019-09-21",
    "recur_until": "end_date",
    "days_count": 365
  }
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1310/projects/1079" -d '{"project":{"labels":[{"label_id":726},{"label_id":727,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7c174a27403bb182886fb520576cbac88c92c8e162a753c0c14838abe96d0f23" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1310/projects/1079
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7c174a27403bb182886fb520576cbac88c92c8e162a753c0c14838abe96d0f23
```

#### Parameters


```json
{"project":{"labels":[{"label_id":726},{"label_id":727,"budget":0,"required":false}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1079,
  "active": true,
  "account_id": 1310,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 828,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253135,
  "label_ids": [
    726,
    727
  ],
  "required_label_ids": [

  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": null,
  "budget": 300,
  "budget_type": "",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [

  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [
    {
      "label_id": 726,
      "budget": null,
      "required": false
    },
    {
      "label_id": 727,
      "budget": 0,
      "required": false
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1311/projects/1080" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":728,"budget":100,"required":true},{"label_id":729,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a8a72b4fdcdbbdb2948435dd5c17fc50bf71abe9ba0b3f229c2383b5fcec7b3a" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1311/projects/1080
Accept: application/json
Content-Type: application/json
Authorization: Bearer a8a72b4fdcdbbdb2948435dd5c17fc50bf71abe9ba0b3f229c2383b5fcec7b3a
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":728,"budget":100,"required":true},{"label_id":729,"budget":100,"required":true}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1080,
  "active": true,
  "account_id": 1311,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 829,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253136,
  "label_ids": [
    728,
    729
  ],
  "required_label_ids": [
    728,
    729
  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": "tag",
  "budget": 200,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [

  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [
    {
      "label_id": 728,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 729,
      "budget": 100,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1312/projects/1081" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":730,"budget":100,"required":true},{"label_id":731,"budget":100,"required":true},{"label_id":732,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d2dee2de05da7e7edc354065711ddc6fadbe58ac0d536f9a652b56b7745bc1a4" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1312/projects/1081
Accept: application/json
Content-Type: application/json
Authorization: Bearer d2dee2de05da7e7edc354065711ddc6fadbe58ac0d536f9a652b56b7745bc1a4
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":730,"budget":100,"required":true},{"label_id":731,"budget":100,"required":true},{"label_id":732,"budget":200,"required":true}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1081,
  "active": true,
  "account_id": 1312,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 830,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253136,
  "label_ids": [
    730,
    731,
    732
  ],
  "required_label_ids": [
    730,
    731,
    732
  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": "tag",
  "budget": 400,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [

  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [
    {
      "label_id": 730,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 731,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 732,
      "budget": 200,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1313/projects/1082" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":735,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6b5b16a6963108001c264339a2af4297f679803db6473396a72415087aa82fb6" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1313/projects/1082
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6b5b16a6963108001c264339a2af4297f679803db6473396a72415087aa82fb6
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":735,"budget":400,"required":true}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1082,
  "active": true,
  "account_id": 1313,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 831,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253136,
  "label_ids": [
    735
  ],
  "required_label_ids": [
    735
  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": "tag",
  "budget": 400,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [

  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [
    {
      "label_id": 735,
      "budget": 400,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1314/projects/1083" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6257b9f9f3a31eaf208a62a0c44803013bd7824adf517e248597444900d8be80" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1314/projects/1083
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6257b9f9f3a31eaf208a62a0c44803013bd7824adf517e248597444900d8be80
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":400,"labels":[]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1083,
  "active": true,
  "account_id": 1314,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 832,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253136,
  "label_ids": [

  ],
  "required_label_ids": [

  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": null,
  "budget": 400,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [

  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [

  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1315/projects/1084" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1f0fc1d54bb90b5ab28fa11574d6da2120cd4758aeac1b3a94c1354a8f6264ba" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1315/projects/1084
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1f0fc1d54bb90b5ab28fa11574d6da2120cd4758aeac1b3a94c1354a8f6264ba
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1084,
  "active": true,
  "account_id": 1315,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 833,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253137,
  "label_ids": [

  ],
  "required_label_ids": [

  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": null,
  "budget": 300,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [

  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [

  ],
  "budget_recurrence": {
    "recur": "week",
    "start_date": "2018-09-21",
    "end_date": "2019-09-21",
    "recur_until": "end_date",
    "days_count": 365
  }
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1316/projects/1085" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 402485f38e7e3df3cd4c10bb02b7cd47131e844e8412e984d14bde09d8c9339a" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1316/projects/1085
Accept: application/json
Content-Type: application/json
Authorization: Bearer 402485f38e7e3df3cd4c10bb02b7cd47131e844e8412e984d14bde09d8c9339a
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1085,
  "active": true,
  "account_id": 1316,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 834,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548253137,
  "label_ids": [

  ],
  "required_label_ids": [

  ],
  "team_ids": [

  ],
  "external_id": null,
  "budget_scope": null,
  "budget": 300,
  "budget_type": "M",
  "hour_rate": 50.0,
  "hour_rate_in_cents": 5000.0,
  "users": [

  ],
  "cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "estimated_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "estimated_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "billed_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "billed_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "unbilled_cost": {
    "fractional": 0,
    "formatted": "$0.00",
    "amount": 0.0
  },
  "unbilled_duration": {
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "formatted": "00:00",
    "total_hours": 0.0,
    "total_seconds": 0,
    "total_minutes": 0
  },
  "first_logged_on": null,
  "last_logged_on": null,
  "labels": [

  ],
  "budget_recurrence": {
    "recur": "week",
    "start_date": "2018-09-21",
    "end_date": null,
    "recur_until": "archived",
    "days_count": 0
  }
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1317/projects/1086" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 732a48ad9e00dd515bce1db29907da01515c39499daf5b63b020aa7ca72b0ffa" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1317/projects/1086
Accept: application/json
Content-Type: application/json
Authorization: Bearer 732a48ad9e00dd515bce1db29907da01515c39499daf5b63b020aa7ca72b0ffa
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
{
  "errors": {
    "budget_recurrence": [
      {
        "start_date": [
          "invalid date"
        ],
        "end_date": [
          "invalid date",
          "invalid date"
        ],
        "recur": [
          "cannot be updated"
        ]
      }
    ]
  }
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1318/projects/1087" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7c1dde73087c9b1d401f35527da13ef55fd3886165fd2de63fa99051fda619a2" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1318/projects/1087
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7c1dde73087c9b1d401f35527da13ef55fd3886165fd2de63fa99051fda619a2
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
{
  "errors": {
    "budget_recurrence": [
      {
        "start_date": [
          "invalid date"
        ],
        "end_date": [
          "invalid date",
          "invalid date"
        ]
      }
    ],
    "budget": [
      "cannot be changed"
    ]
  }
}
```


# Suggested Entries



## index


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1321/suggested_entries?date=2019-01-23" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a84b916f1b7e52da8ae64207fad18b18257255a60d9984e4a58a4776889c7663" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/1321/suggested_entries?date=2019-01-23
Accept: application/json
Content-Type: application/json
Authorization: Bearer a84b916f1b7e52da8ae64207fad18b18257255a60d9984e4a58a4776889c7663
```

#### Parameters

```json
date: 2019-01-23
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "title": "Meeting",
    "note": "Discuss about future",
    "date": "2019-01-23",
    "from": null,
    "to": null,
    "description": "14:00 - 15:00 • Discuss about future",
    "entry_ids": [
      322
    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [

    ],
    "importance": 0,
    "duration": {
      "hours": 1,
      "minutes": 0,
      "seconds": 0,
      "formatted": "01:00",
      "total_hours": 1.0,
      "total_seconds": 3600,
      "total_minutes": 60
    },
    "entries": [
      {
        "id": 322,
        "type": "google_calendar",
        "uid": "6f834bae-086d-4172-95a9-baa190f02d88",
        "title": "Meeting",
        "note": "Discuss about future",
        "description": "14:00 - 15:00 • Discuss about future",
        "date": "2019-01-23",
        "from": "2019-01-23T14:00:00+01:00",
        "to": "2019-01-23T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2019-01-23T14:00:00+01:00",
        "extra_attributes": [

        ],
        "icon": "google_calendar.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
        "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-23",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      323,
      324
    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 1090,
        "accuracy": 0.8,
        "count": 2
      }
    ],
    "importance": 0.8,
    "duration": {
      "hours": 7,
      "minutes": 0,
      "seconds": 0,
      "formatted": "07:00",
      "total_hours": 7.0,
      "total_seconds": 25200,
      "total_minutes": 420
    },
    "entries": [
      {
        "id": 323,
        "type": "macOS",
        "uid": "9317f54b-de61-4544-b254-05a67ae517a6",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2019-01-23",
        "from": "2019-01-23T10:00:00+01:00",
        "to": "2019-01-23T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2019-01-23T10:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": "mac_vim.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/timeline_app_logos/macvim.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      },
      {
        "id": 324,
        "type": "macOS",
        "uid": "1ec71dea-c1e5-4178-acd8-54e0dbb0a6ef",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2019-01-23",
        "from": "2019-01-23T14:00:00+01:00",
        "to": "2019-01-23T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2019-01-23T14:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": "mac_vim.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/timeline_app_logos/macvim.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      }
    ]
  },
  {
    "title": "Congratulations on winning $100000",
    "note": "You won $100000, share your netbanking details",
    "date": "2019-01-23",
    "from": null,
    "to": null,
    "description": " • You won $100000, share your netbanking details",
    "entry_ids": [
      325
    ],
    "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 1090,
        "accuracy": 0.8,
        "count": 1
      }
    ],
    "importance": 0,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 325,
        "type": "gmail",
        "uid": "09ec4c9c-9e82-4f92-8c1d-8e73e805d228",
        "title": "Congratulations on winning $100000",
        "note": "You won $100000, share your netbanking details",
        "description": " • You won $100000, share your netbanking details",
        "date": "2019-01-23",
        "from": "2019-01-23T18:10:00+01:00",
        "to": "2019-01-23T18:10:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 0,
          "minutes": 0,
          "seconds": 0,
          "formatted": "00:00",
          "total_hours": 0.0,
          "total_seconds": 0,
          "total_minutes": 0
        },
        "at": "2019-01-23T18:10:00+01:00",
        "extra_attributes": [

        ],
        "icon": "gmail.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
        "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  }
]
```


## index


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1322/suggested_entries?date=2019-01-23&spam=true" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 05e08d72905264cce9f1353b0107547be086fbccdebf84a13ce41e3476220cb8" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/1322/suggested_entries?date=2019-01-23&amp;spam=true
Accept: application/json
Content-Type: application/json
Authorization: Bearer 05e08d72905264cce9f1353b0107547be086fbccdebf84a13ce41e3476220cb8
```

#### Parameters

```json
date: 2019-01-23
spam: true
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "title": "Meeting",
    "note": "Discuss about future",
    "date": "2019-01-23",
    "from": null,
    "to": null,
    "description": "14:00 - 15:00 • Discuss about future",
    "entry_ids": [
      327
    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [

    ],
    "importance": 0,
    "duration": {
      "hours": 1,
      "minutes": 0,
      "seconds": 0,
      "formatted": "01:00",
      "total_hours": 1.0,
      "total_seconds": 3600,
      "total_minutes": 60
    },
    "entries": [
      {
        "id": 327,
        "type": "google_calendar",
        "uid": "88b7579f-c6d4-4d69-984f-a8a1ab4a7091",
        "title": "Meeting",
        "note": "Discuss about future",
        "description": "14:00 - 15:00 • Discuss about future",
        "date": "2019-01-23",
        "from": "2019-01-23T14:00:00+01:00",
        "to": "2019-01-23T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2019-01-23T14:00:00+01:00",
        "extra_attributes": [

        ],
        "icon": "google_calendar.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
        "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-23",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      328,
      329
    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 1091,
        "accuracy": 0.8,
        "count": 2
      }
    ],
    "importance": 0.8,
    "duration": {
      "hours": 7,
      "minutes": 0,
      "seconds": 0,
      "formatted": "07:00",
      "total_hours": 7.0,
      "total_seconds": 25200,
      "total_minutes": 420
    },
    "entries": [
      {
        "id": 328,
        "type": "macOS",
        "uid": "044528bf-7175-4dc7-9e34-99f6a6c366f9",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2019-01-23",
        "from": "2019-01-23T10:00:00+01:00",
        "to": "2019-01-23T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2019-01-23T10:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": "mac_vim.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/timeline_app_logos/macvim.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      },
      {
        "id": 329,
        "type": "macOS",
        "uid": "ba124695-4267-4864-9f68-33ccd4ee6f8c",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2019-01-23",
        "from": "2019-01-23T14:00:00+01:00",
        "to": "2019-01-23T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2019-01-23T14:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": "mac_vim.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/timeline_app_logos/macvim.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      }
    ]
  },
  {
    "title": "Congratulations on winning $100000",
    "note": "You won $100000, share your netbanking details",
    "date": "2019-01-23",
    "from": null,
    "to": null,
    "description": " • You won $100000, share your netbanking details",
    "entry_ids": [
      330
    ],
    "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 1091,
        "accuracy": 0.8,
        "count": 1
      }
    ],
    "importance": 0,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 330,
        "type": "gmail",
        "uid": "99416edb-0da7-4638-9a7c-f159d13283f0",
        "title": "Congratulations on winning $100000",
        "note": "You won $100000, share your netbanking details",
        "description": " • You won $100000, share your netbanking details",
        "date": "2019-01-23",
        "from": "2019-01-23T18:10:00+01:00",
        "to": "2019-01-23T18:10:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 0,
          "minutes": 0,
          "seconds": 0,
          "formatted": "00:00",
          "total_hours": 0.0,
          "total_seconds": 0,
          "total_minutes": 0
        },
        "at": "2019-01-23T18:10:00+01:00",
        "extra_attributes": [

        ],
        "icon": "gmail.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
        "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "Time Meeting",
    "note": "Discuss about future",
    "date": "2019-01-23",
    "from": null,
    "to": null,
    "description": "10:00 - 12:00 • Discuss about future",
    "entry_ids": [
      331
    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [

    ],
    "importance": 0.8,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 331,
        "type": "google_calendar",
        "uid": "952b6882-e77b-48fb-8fa8-7874883f7db6",
        "title": "Time Meeting",
        "note": "Discuss about future",
        "description": "10:00 - 12:00 • Discuss about future",
        "date": "2019-01-23",
        "from": "2019-01-23T10:00:00+01:00",
        "to": "2019-01-23T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2019-01-23T10:00:00+01:00",
        "extra_attributes": [

        ],
        "icon": "google_calendar.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
        "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
        "url": null,
        "importance": 0.8,
        "spam": true
      }
    ]
  }
]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1323/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":333,"project_id":1093}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 32021f403fc1f658829ae40c1a7836d5fd0fb8c1ed8d37f701c118756c2db0dd" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/1323/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 32021f403fc1f658829ae40c1a7836d5fd0fb8c1ed8d37f701c118756c2db0dd
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":333,"project_id":1093}]}}
```

| Name | Description |
|:-----|:------------|
| suggested_entries  | Suggested Entries to update |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


# Suggested Hours



## default


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1324/suggested_hours?date=2019-01-23" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 04c6f6c61e5706ba28b8486e75e5ac9bf1b56c68e4ba3285075b737a5c692f87" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1324/suggested_hours?date=2019-01-23
Accept: application/json
Content-Type: application/json
Authorization: Bearer 04c6f6c61e5706ba28b8486e75e5ac9bf1b56c68e4ba3285075b737a5c692f87
```

#### Parameters

```json
date: 2019-01-23
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |
| since  | Suggested entries form specific date to until |
| until  | Suggested entries until specific date from since |
| suggested_hour_ids  | Suggested hours for specific ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 69,
    "owner": {
      "id": 582,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1094,
    "date": "2019-01-23",
    "to": "2019-01-23T18:48:59+01:00",
    "from": "2019-01-23T15:18:59+01:00",
    "note": "Notes for testing with some random #hash in it.",
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "status": "pending",
    "source": "prediction",
    "created_at": "2019-01-23T15:18:59+01:00",
    "suggested_entry_ids": [
      337,
      338
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-23T15:18:59+01:00"
  }
]
```


## show


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1330/suggested_hours/81" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9dbf1ca0388c0a8911caf94be1c31eb74af4e2b85fc846f4ee3c7a5ab4b3b7c5" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
GET /1.1/1330/suggested_hours/81
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9dbf1ca0388c0a8911caf94be1c31eb74af4e2b85fc846f4ee3c7a5ab4b3b7c5
```

#### Parameters

```json
{}: 
```


None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 81,
  "owner": {
    "id": 588,
    "email": "notifications@timelyapp.com",
    "name": "Timely",
    "avatar": {
      "timeline": "/assets/timely_user_avatar_timeline.png",
      "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
      "medium": "/assets/timely_user_avatar_medium.png"
    }
  },
  "project_id": 1100,
  "date": "2019-01-23",
  "to": "2019-01-23T18:49:01+01:00",
  "from": "2019-01-23T15:19:01+01:00",
  "note": "Notes for testing with some random #hash in it.",
  "duration": {
    "hours": 3,
    "minutes": 30,
    "seconds": 0,
    "formatted": "03:30",
    "total_hours": 3.5,
    "total_seconds": 12600,
    "total_minutes": 210
  },
  "status": "pending",
  "source": "prediction",
  "created_at": "2019-01-23T15:19:01+01:00",
  "suggested_entry_ids": [
    361,
    362
  ],
  "version": "0.2.0",
  "updated_at": "2019-01-23T15:19:01+01:00"
}
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1326/suggested_hours?date=2019-01-23&since=2019-01-21&until=2019-01-23" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5de92040e21f83f667282684c768d3d0d01cfb09348aed83ea620766957e1c96" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1326/suggested_hours?date=2019-01-23&amp;since=2019-01-21&amp;until=2019-01-23
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5de92040e21f83f667282684c768d3d0d01cfb09348aed83ea620766957e1c96
```

#### Parameters

```json
date: 2019-01-23
since: 2019-01-21
until: 2019-01-23
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |
| since  | Suggested entries form specific date to until |
| until  | Suggested entries until specific date from since |
| suggested_hour_ids  | Suggested hours for specific ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 73,
    "owner": {
      "id": 584,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1096,
    "date": "2019-01-23",
    "to": "2019-01-23T18:49:00+01:00",
    "from": "2019-01-23T15:19:00+01:00",
    "note": "Notes for testing with some random #hash in it.",
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "status": "pending",
    "source": "prediction",
    "created_at": "2019-01-23T15:19:00+01:00",
    "suggested_entry_ids": [
      345,
      346
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-23T15:19:00+01:00"
  },
  {
    "id": 74,
    "owner": {
      "id": 584,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1096,
    "date": "2019-01-21",
    "to": "2019-01-23T18:49:00+01:00",
    "from": "2019-01-23T15:19:00+01:00",
    "note": "Notes for testing with some random #hash in it.",
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "status": "pending",
    "source": "prediction",
    "created_at": "2019-01-23T15:19:00+01:00",
    "suggested_entry_ids": [
      347
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-23T15:19:00+01:00"
  }
]
```


## suggested hour ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1327/suggested_hours?date=2019-01-23&suggested_hour_ids=75" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ba82cf19db683462d8ae6025c20644a82c0e53b19fe4cefccc35f93df841b8c2" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1327/suggested_hours?date=2019-01-23&amp;suggested_hour_ids=75
Accept: application/json
Content-Type: application/json
Authorization: Bearer ba82cf19db683462d8ae6025c20644a82c0e53b19fe4cefccc35f93df841b8c2
```

#### Parameters

```json
date: 2019-01-23
suggested_hour_ids: 75
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |
| since  | Suggested entries form specific date to until |
| until  | Suggested entries until specific date from since |
| suggested_hour_ids  | Suggested hours for specific ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 75,
    "owner": {
      "id": 585,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1097,
    "date": "2019-01-23",
    "to": "2019-01-23T18:49:00+01:00",
    "from": "2019-01-23T15:19:00+01:00",
    "note": "Notes for testing with some random #hash in it.",
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "status": "pending",
    "source": "prediction",
    "created_at": "2019-01-23T15:19:00+01:00",
    "suggested_entry_ids": [
      349,
      350
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-23T15:19:00+01:00"
  }
]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1328/suggested_hours/77" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b973b49330b87e8fff84f39995dda970675c7c704c81f00bafa39dd15d99f2c2" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/1328/suggested_hours/77
Accept: application/json
Content-Type: application/json
Authorization: Bearer b973b49330b87e8fff84f39995dda970675c7c704c81f00bafa39dd15d99f2c2
```

#### Parameters


```json
{}
```

None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 77,
  "owner": {
    "id": 586,
    "email": "notifications@timelyapp.com",
    "name": "Timely",
    "avatar": {
      "timeline": "/assets/timely_user_avatar_timeline.png",
      "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
      "medium": "/assets/timely_user_avatar_medium.png"
    }
  },
  "project_id": 1098,
  "date": "2019-01-23",
  "to": "2019-01-23T18:49:01+01:00",
  "from": "2019-01-23T15:19:01+01:00",
  "note": "Notes for testing with some random #hash in it.",
  "duration": {
    "hours": 3,
    "minutes": 30,
    "seconds": 0,
    "formatted": "03:30",
    "total_hours": 3.5,
    "total_seconds": 12600,
    "total_minutes": 210
  },
  "status": "dismissed",
  "source": "prediction",
  "created_at": "2019-01-23T15:19:01+01:00",
  "suggested_entry_ids": [
    353,
    354
  ],
  "version": "0.2.0",
  "updated_at": "2019-01-23T15:19:01+01:00"
}
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1329/suggested_hours/decline" -d '{"suggested_hour_ids":[79]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0f7e62fd79583c553ff474f82bcf5597a1f54256b7e0862e465b952ee5aa3c04" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/decline`

```plaintext
PUT /1.1/1329/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0f7e62fd79583c553ff474f82bcf5597a1f54256b7e0862e465b952ee5aa3c04
```

#### Parameters


```json
{"suggested_hour_ids":[79]}
```

| Name | Description |
|:-----|:------------|
| suggested_hour_ids  | Suggested hour ids to decline |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


## with date


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1325/suggested_hours?date=2019-01-21" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2583f0c9e65cb3f6ab63867f67691c60d87c5a7af287f65c73b1ccc62899a329" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1325/suggested_hours?date=2019-01-21
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2583f0c9e65cb3f6ab63867f67691c60d87c5a7af287f65c73b1ccc62899a329
```

#### Parameters

```json
date: 2019-01-21
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |
| since  | Suggested entries form specific date to until |
| until  | Suggested entries until specific date from since |
| suggested_hour_ids  | Suggested hours for specific ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 72,
    "owner": {
      "id": 583,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1095,
    "date": "2019-01-21",
    "to": "2019-01-23T18:49:00+01:00",
    "from": "2019-01-23T15:19:00+01:00",
    "note": "Notes for testing with some random #hash in it.",
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "status": "pending",
    "source": "prediction",
    "created_at": "2019-01-23T15:19:00+01:00",
    "suggested_entry_ids": [
      343
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-23T15:19:00+01:00"
  }
]
```


# Training Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/1337/training_entries" -d '{"training_entries":{"entries":[{"entry_id":368,"project_id":1106}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer db3fe633cf812f689b36d9acdb94766d87f1abb1a96a57ec9f86954a002c3163" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/1337/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer db3fe633cf812f689b36d9acdb94766d87f1abb1a96a57ec9f86954a002c3163
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":368,"project_id":1106}]}}
```

| Name | Description |
|:-----|:------------|
| training_entries  | Training Entries to create/update |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


## list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1336/training_entries?date=2019-01-23" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6124c678c6651ee56063c5f478e8d45c5e8c8f8302357f35ab404b6d2ec13754" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/training_entries`

```plaintext
GET /1.1/1336/training_entries?date=2019-01-23
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6124c678c6651ee56063c5f478e8d45c5e8c8f8302357f35ab404b6d2ec13754
```

#### Parameters

```json
date: 2019-01-23
```


| Name | Description |
|:-----|:------------|
| date  | Training entries for date (Default today) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 365,
    "type": "macOS",
    "uid": "e463b7f1-4d69-4c7d-a27b-474550d85fa3",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-23",
    "from": "2019-01-23T10:00:00+01:00",
    "to": "2019-01-23T12:00:00+01:00",
    "entry_type": null,
    "duration": {
      "hours": 2,
      "minutes": 0,
      "seconds": 0,
      "formatted": "02:00",
      "total_hours": 2.0,
      "total_seconds": 7200,
      "total_minutes": 120
    },
    "at": "2019-01-23T10:00:00+01:00",
    "extra_attributes": [
      {
        "name": "application",
        "value": "MacVim"
      },
      {
        "name": "detail",
        "value": ""
      }
    ],
    "icon": "mac_vim.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "url": null,
    "score": 0.8
  },
  {
    "id": 366,
    "type": "macOS",
    "uid": "02c50010-1b9e-4c73-af1c-0f4cf2cf0783",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-23",
    "from": "2019-01-23T14:00:00+01:00",
    "to": "2019-01-23T15:00:00+01:00",
    "entry_type": null,
    "duration": {
      "hours": 1,
      "minutes": 0,
      "seconds": 0,
      "formatted": "01:00",
      "total_hours": 1.0,
      "total_seconds": 3600,
      "total_minutes": 60
    },
    "at": "2019-01-23T14:00:00+01:00",
    "extra_attributes": [
      {
        "name": "application",
        "value": "MacVim"
      },
      {
        "name": "detail",
        "value": ""
      }
    ],
    "icon": "mac_vim.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "url": null,
    "score": 0.6
  }
]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1338/training_entries" -d '{"training_entries":{"entries":[{"entry_id":370,"project_id":1107},{"entry_id":369,"project_id":1107}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 12019f797cc768f907a07b4b1a2309951f4eccb58bfed4c231ff403062a3efca" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/1338/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 12019f797cc768f907a07b4b1a2309951f4eccb58bfed4c231ff403062a3efca
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":370,"project_id":1107},{"entry_id":369,"project_id":1107}]}}
```

| Name | Description |
|:-----|:------------|
| training_entries  | Training Entries to create/update |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
}
```


# Upgrade



## upgrade account plan from web account


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1349/upgrade" -d '{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e338833848e886e8f1c7204c9ed9d60519aa554680a96d5a0a067e2ecda4caf2" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1349/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer e338833848e886e8f1c7204c9ed9d60519aa554680a96d5a0a067e2ecda4caf2
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
{
  "errors": {
    "message": "Upgrade via appstore failed."
  }
}
```


## upgrade account plan from web account


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1351/upgrade" -d '{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d4af17168f82ce906909cdf9505fbbec94d7ea6fee20d191203ed9fe26df4233" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1351/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer d4af17168f82ce906909cdf9505fbbec94d7ea6fee20d191203ed9fe26df4233
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
{
  "errors": {
    "message": "Plan upgrade failed. You need to delete some projects,           Solo plan supports only 3 project."
  }
}
```


## upgrade account plan to essential


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1348/upgrade" -d '{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f18ce340c62b398c2b3ec50a4359c82d91e72b68a7ca7cb393ec3830f388ab70" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1348/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer f18ce340c62b398c2b3ec50a4359c82d91e72b68a7ca7cb393ec3830f388ab70
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1348,
  "name": "Timely",
  "from": "Web",
  "max_users": 0,
  "max_projects": 0,
  "num_users": 2,
  "num_projects": 0,
  "plan_id": 28,
  "plan_name": "Essential",
  "next_charge": "2019-02-23",
  "currency": {
    "id": "usd",
    "name": "United States Dollar",
    "iso_code": "USD",
    "symbol": "$",
    "symbol_first": true
  },
  "start_of_week": 0,
  "beta": false,
  "created_at": 1548253146,
  "payment_mode": "appstore",
  "paid": false,
  "company_size": "10-49",
  "color": "44505e",
  "logo": {
    "large_retina": "/assets/account_thumbs/account_large_retina.png",
    "medium_retina": "/assets/account_thumbs/account_medium_retina.png",
    "small_retina": "/assets/account_thumbs/account_small_retina.png"
  },
  "capacity": {
    "hours": 40.0,
    "minutes": 0.0,
    "seconds": 0.0,
    "formatted": "40:00",
    "total_hours": 40.0,
    "total_seconds": 144000.0,
    "total_minutes": 2400.0
  },
  "plan_code": "essential",
  "appstore_transaction_id": "some-appstore-id",
  "expired": false,
  "trial": true,
  "days_to_end_trial": 31,
  "features": [
    {
      "name": "control",
      "days": -1
    },
    {
      "name": "memories",
      "days": -1
    },
    {
      "name": "billing",
      "days": -1
    },
    {
      "name": "project_labels",
      "days": -1
    },
    {
      "name": "teams",
      "days": -1
    },
    {
      "name": "recurring_budget",
      "days": -1
    }
  ],
  "firebase_url": "https://shining-fire-1562.firebaseio.com/",
  "firebase_auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA5MzE1NDcsInYiOjAsImlhdCI6MTU0ODI1MzE0NywiZCI6eyJ1c2VyX2lkIjoiMzA3NyIsImFjY291bnRfaWQiOiIxMzQ4IiwidXNlcl90eXBlIjoibm9ybWFsIiwidWlkIjoiMjdjN2IyNWIxY2VlY2I4ZGExNTZmY2Y3MGNiNmNlZWEifX0.2g8Xy6CelsgsEvwUUSGZ5IhyG94fHyqy7LtFYoXvOCA"
}
```


## upgrade account plan to solo


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1347/upgrade" -d '{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 72262310a2c6a9748b451431ab1727a8f598db18179c13b8bb14869ffe404eeb" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1347/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 72262310a2c6a9748b451431ab1727a8f598db18179c13b8bb14869ffe404eeb
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 1347,
  "name": "Timely",
  "from": "Web",
  "max_users": 1,
  "max_projects": 3,
  "num_users": 2,
  "num_projects": 0,
  "plan_id": 34,
  "plan_name": "Solo",
  "next_charge": "2019-02-23",
  "currency": {
    "id": "usd",
    "name": "United States Dollar",
    "iso_code": "USD",
    "symbol": "$",
    "symbol_first": true
  },
  "start_of_week": 0,
  "beta": false,
  "created_at": 1548253146,
  "payment_mode": "appstore",
  "paid": false,
  "company_size": "10-49",
  "color": "44505e",
  "logo": {
    "large_retina": "/assets/account_thumbs/account_large_retina.png",
    "medium_retina": "/assets/account_thumbs/account_medium_retina.png",
    "small_retina": "/assets/account_thumbs/account_small_retina.png"
  },
  "capacity": {
    "hours": 40.0,
    "minutes": 0.0,
    "seconds": 0.0,
    "formatted": "40:00",
    "total_hours": 40.0,
    "total_seconds": 144000.0,
    "total_minutes": 2400.0
  },
  "plan_code": "solo_v1",
  "appstore_transaction_id": "some-appstore-id",
  "expired": false,
  "trial": true,
  "days_to_end_trial": 31,
  "features": [
    {
      "name": "control",
      "days": -1
    },
    {
      "name": "memories",
      "days": -1
    },
    {
      "name": "billing",
      "days": -1
    },
    {
      "name": "project_labels",
      "days": -1
    },
    {
      "name": "teams",
      "days": -1
    },
    {
      "name": "recurring_budget",
      "days": -1
    }
  ],
  "firebase_url": "https://shining-fire-1562.firebaseio.com/",
  "firebase_auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA5MzE1NDYsInYiOjAsImlhdCI6MTU0ODI1MzE0NiwiZCI6eyJ1c2VyX2lkIjoiMzA3NSIsImFjY291bnRfaWQiOiIxMzQ3IiwidXNlcl90eXBlIjoibm9ybWFsIiwidWlkIjoiYWQwYjI2NDgyNTEzOWRmZjU5ZGViODgxMGQxNzhiNWMifX0.ZX7hWXvgA3S81x_Zo-v3VujfpP4fgOxVfslUZscZWcc"
}
```


## upgrade for duplicate appstore_transaction_id


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1353/upgrade" -d '{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d7d5921bdda21db0163f02d0ae974097bad8f087a2a7d0619d8b886b811de8d7" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1353/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer d7d5921bdda21db0163f02d0ae974097bad8f087a2a7d0619d8b886b811de8d7
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-23","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
{
  "errors": {
    "message": "Current Apple ID is used by another Timely account. Please login with original Timely account, or use another Apple ID if you want to subscribe."
  }
}
```


# User Onboarding



## create or update properties


### Request

```shell
curl "https://api.timelyapp.com/user_onboarding" -d '{"user_onboarding":{"user_onboarding_properties":[{"property":"has_seen_calendar_day","value":"yes"},{"property":"has_seen_calendar_week","value":"no"}]}}' -X PUT \
	-H "Host: app.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Cookie: "
```

#### Endpoint

`PUT /user_onboarding`

```plaintext
PUT /user_onboarding
Accept: application/json
Content-Type: application/json
```

#### Parameters


```json
{"user_onboarding":{"user_onboarding_properties":[{"property":"has_seen_calendar_day","value":"yes"},{"property":"has_seen_calendar_week","value":"no"}]}}
```

| Name | Description |
|:-----|:------------|
| user_onboarding *required* | User onboarding |
| user_onboarding[user_onboarding_properties] *required* | Array of multiple property and valyes |
| user_onboarding_properties[property] *required* | Onboarding property name |
| user_onboarding_properties[value] *required* | Onboarding property value |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "user_id": 2826,
    "property": "has_seen_calendar_day",
    "value": "yes",
    "updated_at": "2019-01-23T15:18:32+01:00"
  },
  {
    "user_id": 2826,
    "property": "has_seen_calendar_week",
    "value": "no",
    "updated_at": "2019-01-23T15:18:32+01:00"
  }
]
```


## list properties


### Request

```shell
curl -g "https://api.timelyapp.com/user_onboarding" -X GET \
	-H "Host: app.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Cookie: "
```

#### Endpoint

`GET /user_onboarding`

```plaintext
GET /user_onboarding
Accept: application/json
Content-Type: application/json
```

#### Parameters

```json
{}: 
```


None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "user_id": 2825,
    "property": "has_seen_calendar_week",
    "value": "yes",
    "updated_at": "2019-01-23T15:18:31+01:00"
  }
]
```


# Users



## Search all users with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1345/users/search?q=Damon+Hammes" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5945e9041812a8bdc5699e21ad85c7e895ad24beb7e7b14340df2b362b951a87" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/search`

```plaintext
GET /1.1/1345/users/search?q=Damon+Hammes
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5945e9041812a8bdc5699e21ad85c7e895ad24beb7e7b14340df2b362b951a87
```

#### Parameters

```json
q: Damon Hammes
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| q *required* | Search query (min 2 characters) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 3055,
    "email": "greg@gmail.com",
    "name": "Damon Hammes",
    "active": false,
    "external_id": null,
    "avatar": {
      "large": "https://www.gravatar.com/avatar/7f1e09c363f9a2f7421e8715b760eb24?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200",
      "medium": "https://www.gravatar.com/avatar/7f1e09c363f9a2f7421e8715b760eb24?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50",
      "small": "https://www.gravatar.com/avatar/7f1e09c363f9a2f7421e8715b760eb24?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"
    },
    "updated_at": 1548253145
  }
]
```


