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
curl "https://api.timelyapp.com/1.1/apps/330/objects/330" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70341114596360}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 74e5bf16ff91fdf94f4ae77a61034537dfd12c248659a27384d8ac59a7399f24" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/330/objects/330
Accept: application/json
Content-Type: application/json
Authorization: Bearer 74e5bf16ff91fdf94f4ae77a61034537dfd12c248659a27384d8ac59a7399f24
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70341114596360}}
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
    "updated_at": "2019-01-18T16:37:01+01:00",
    "auto_import": true,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": true,
    "updated_at": "2019-01-18T16:37:01+01:00",
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
curl "https://api.timelyapp.com/1.1/apps/332/objects/332" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70341090801120}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 18288ab2217301239e80f4cbeb371ca2beefc75407546846cbb5b227e303787c" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/332/objects/332
Accept: application/json
Content-Type: application/json
Authorization: Bearer 18288ab2217301239e80f4cbeb371ca2beefc75407546846cbb5b227e303787c
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70341090801120}}
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
    "updated_at": "2019-01-18T16:37:01+01:00",
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
curl -g "https://api.timelyapp.com/1.1/apps/328/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a5e14edb6cf43d6479ef5a875bd2a1bce5af50c8c532a76898e7a55d18ee5d74" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/328/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer a5e14edb6cf43d6479ef5a875bd2a1bce5af50c8c532a76898e7a55d18ee5d74
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
curl -g "https://api.timelyapp.com/1.1/apps/329/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9248dd8db4d6ccbdd7fdd2240360ba0bae9182a16a226ae3f03f60c3e078829e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/329/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9248dd8db4d6ccbdd7fdd2240360ba0bae9182a16a226ae3f03f60c3e078829e
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
curl "https://api.timelyapp.com/1.1/apps/331/objects/331" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70341044953560}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 55145b19908aa3940a031bc9de1dfbb23b649caa09fe5cbd445b1980f946f34f" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/331/objects/331
Accept: application/json
Content-Type: application/json
Authorization: Bearer 55145b19908aa3940a031bc9de1dfbb23b649caa09fe5cbd445b1980f946f34f
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70341044953560}}
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
    "updated_at": "2019-01-18T16:37:01+01:00",
    "auto_import": false,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": true,
    "updated_at": "2019-01-18T16:37:01+01:00",
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
curl "https://api.timelyapp.com/1.1/apps/511/connected/350" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 762711c43cb5ea3ed2f5742477ca62c5443d45fa67bb047af1c323b19a4ec017" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/apps/:app_id/connected/:id`

```plaintext
DELETE /1.1/apps/511/connected/350
Accept: application/json
Content-Type: application/json
Authorization: Bearer 762711c43cb5ea3ed2f5742477ca62c5443d45fa67bb047af1c323b19a4ec017
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
	-H "Authorization: Bearer da1878e869c78279b5630d9e9763cd8784123786be395c337dc534e75aa3d3d7" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps`

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer da1878e869c78279b5630d9e9763cd8784123786be395c337dc534e75aa3d3d7
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
    "app_id": 497,
    "id": "google_calendar",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-18T16:37:01+01:00",
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
    "connected_apps_url": "/apps/497/connected"
  },
  {
    "app_id": 498,
    "id": "office365",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-18T16:37:01+01:00",
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
    "connected_apps_url": "/apps/498/connected"
  },
  {
    "app_id": 499,
    "id": "gmail",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-18T16:37:01+01:00",
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
    "connected_apps_url": "/apps/499/connected"
  },
  {
    "app_id": 500,
    "id": "moves_app",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 1,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-16T16:37:01+01:00",
    "last_imported_at": "2019-01-17T16:37:01+01:00",
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
    "connected_apps_url": "/apps/500/connected"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/501/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 92c6189abac38e2ffdbf00af3afdf95c008f0b94c655be1f0040c3de5c9cd331" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/501/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 92c6189abac38e2ffdbf00af3afdf95c008f0b94c655be1f0040c3de5c9cd331
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
    "id": 338,
    "name": "Tom Hardy",
    "email": "tom@timelyapp.com",
    "active": true,
    "created_at": "2019-01-18T16:37:01+01:00",
    "updated_at": "2019-01-18T16:37:01+01:00",
    "last_imported_at": null,
    "disconnected": false,
    "disconnected_reason": null,
    "objects": true,
    "objects_type": "calendars",
    "objects_url": "/1.1/apps/338/objects"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/507/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 378e0e4f8c0c2369cd971c62798fda58c583e9d031a947e4df3fa5c1f666034c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/507/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 378e0e4f8c0c2369cd971c62798fda58c583e9d031a947e4df3fa5c1f666034c
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
    "id": 345,
    "name": "Tom Hardy",
    "email": "tom@timelyapp.com",
    "active": true,
    "created_at": "2019-01-18T16:37:02+01:00",
    "updated_at": "2019-01-18T16:37:02+01:00",
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
curl -g "https://api.timelyapp.com/1.1/1348/projects/1232/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d5a210c2afbab059efc31e195bb22630913a63c1eb1fb89a1a49d9c25affc803" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1348/projects/1232/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer d5a210c2afbab059efc31e195bb22630913a63c1eb1fb89a1a49d9c25affc803
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
curl -g "https://api.timelyapp.com/1.1/1349/projects/1233/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 21cd1988b8daea698e18faf7dbfc3dc91ba272c5887e83d328fd7306b37c519e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1349/projects/1233/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 21cd1988b8daea698e18faf7dbfc3dc91ba272c5887e83d328fd7306b37c519e
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
curl -g "https://api.timelyapp.com/1.1/1346/projects/1230/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4345c5051f26795c22dafe06466d669cfeab366ad909849da0c89d5ceddc77d1" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1346/projects/1230/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4345c5051f26795c22dafe06466d669cfeab366ad909849da0c89d5ceddc77d1
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
curl -g "https://api.timelyapp.com/1.1/1347/projects/1231/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7881dbb3173be4a008d74ae332cc43ba5e3560fe1b9a71b09a67aa951f78fd82" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1347/projects/1231/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7881dbb3173be4a008d74ae332cc43ba5e3560fe1b9a71b09a67aa951f78fd82
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
curl "https://api.timelyapp.com/1.1/1354/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[523]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4225905a4bffbe867bc2462f0be6c3c7dfbfe538c5fd0d0489197ac0664306fc" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/suggested_entries/discard`

```plaintext
POST /1.1/1354/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4225905a4bffbe867bc2462f0be6c3c7dfbfe538c5fd0d0489197ac0664306fc
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[523]}}
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
curl -g "https://api.timelyapp.com/1.1/1353/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 80ecba63e15778e4159733c30a6acbf8ffce423359f5663dc4d185dcd20098e7" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries/discarded`

```plaintext
GET /1.1/1353/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer 80ecba63e15778e4159733c30a6acbf8ffce423359f5663dc4d185dcd20098e7
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
    "date": "2019-01-18",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      522
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
    }
  }
]
```


## remove


### Request

```shell
curl "https://api.timelyapp.com/1.1/1355/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[526]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6b69776451e6c2b07d8f20a2889a2d3806fdcc41738d2325da1afe733392afad" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggested_entries/discard`

```plaintext
DELETE /1.1/1355/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6b69776451e6c2b07d8f20a2889a2d3806fdcc41738d2325da1afe733392afad
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[526]}}
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=527%2C528" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f1a94a72ff5931d90e9586de83eb005c70f9b60c55c5949358820efd158dca8e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=527%2C528
Accept: application/json
Content-Type: application/json
Authorization: Bearer f1a94a72ff5931d90e9586de83eb005c70f9b60c55c5949358820efd158dca8e
```

#### Parameters

```json
entry_ids: 527,528
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=529%2C530" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c7562cd55de176cf65cf6f81a42e16c2105e054b0e276c3df8cf6bdaa590cb26" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=529%2C530
Accept: application/json
Content-Type: application/json
Authorization: Bearer c7562cd55de176cf65cf6f81a42e16c2105e054b0e276c3df8cf6bdaa590cb26
```

#### Parameters

```json
entry_ids: 529,530
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=531%2C532" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a03429ee09612c60fdf6468f2ab2f263cf4aa26685c26da88daf85ff132312b8" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=531%2C532
Accept: application/json
Content-Type: application/json
Authorization: Bearer a03429ee09612c60fdf6468f2ab2f263cf4aa26685c26da88daf85ff132312b8
```

#### Parameters

```json
entry_ids: 531,532
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
curl "https://api.timelyapp.com/1.1/entries/544" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d57d504f490f14e4f28a95466febdafdb5d63681f7c0c5cf78aadf68dcf79b09" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/entries/:id`

```plaintext
DELETE /1.1/entries/544
Accept: application/json
Content-Type: application/json
Authorization: Bearer d57d504f490f14e4f28a95466febdafdb5d63681f7c0c5cf78aadf68dcf79b09
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
curl -g "https://api.timelyapp.com/1.1/entries?date=2019-01-20" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 90bb61d582213e7afced4915890f5f69bdbe8e50d40321eb4af7d0aae8292b23" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?date=2019-01-20
Accept: application/json
Content-Type: application/json
Authorization: Bearer 90bb61d582213e7afced4915890f5f69bdbe8e50d40321eb4af7d0aae8292b23
```

#### Parameters

```json
date: 2019-01-20
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
    "id": 538,
    "type": "google_calendar",
    "uid": "9f7cd050-0d23-48ed-99ad-f07cf784b3a9",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "16:37 - 20:07 • Discuss about future",
    "date": "2019-01-20",
    "from": "2019-01-18T16:37:07+01:00",
    "to": "2019-01-18T20:07:07+01:00",
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
    "at": "2019-01-18T16:37:07+01:00",
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
curl -g "https://api.timelyapp.com/1.1/entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bd2b3f168df205c860564a039d9a0e7947213f46fec973f042157f7369e33e1f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer bd2b3f168df205c860564a039d9a0e7947213f46fec973f042157f7369e33e1f
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
    "id": 533,
    "type": "macOS",
    "uid": "9f7cd050-0d23-48ed-99ad-f07cf784b3a9",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-18",
    "from": "2019-01-18T16:37:07+01:00",
    "to": "2019-01-18T20:07:07+01:00",
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
    "at": "2019-01-18T16:37:07+01:00",
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
    "id": 534,
    "type": "google_calendar",
    "uid": "9f7cd050-0d23-48ed-99ad-f07cf784b3a9",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "16:37 - 20:07 • Discuss about future",
    "date": "2019-01-18",
    "from": "2019-01-18T16:37:07+01:00",
    "to": "2019-01-18T20:07:07+01:00",
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
    "at": "2019-01-18T16:37:07+01:00",
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


## with entry_ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=539%2C541" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c3e827f7206e1bcd3164e1b29a1b8e92f5905d25cf8ed991bb45e0e77f0764aa" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=539%2C541
Accept: application/json
Content-Type: application/json
Authorization: Bearer c3e827f7206e1bcd3164e1b29a1b8e92f5905d25cf8ed991bb45e0e77f0764aa
```

#### Parameters

```json
entry_ids: 539,541
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
    "id": 539,
    "type": "macOS",
    "uid": "9f7cd050-0d23-48ed-99ad-f07cf784b3a9",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-18",
    "from": "2019-01-18T16:37:07+01:00",
    "to": "2019-01-18T20:07:07+01:00",
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
    "at": "2019-01-18T16:37:07+01:00",
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
    "id": 541,
    "type": "google_calendar",
    "uid": "9f7cd050-0d23-48ed-99ad-f07cf784b3a9",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "16:37 - 20:07 • Discuss about future",
    "date": "2019-01-20",
    "from": "2019-01-18T16:37:07+01:00",
    "to": "2019-01-18T20:07:07+01:00",
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
    "at": "2019-01-18T16:37:07+01:00",
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
curl -g "https://api.timelyapp.com/1.1/1376/events/1127" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4a363ad9275c4d3299007f4d83f8d8e7a9b8eaac690a90b62f1748bd9206c18e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/1376/events/1127
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4a363ad9275c4d3299007f4d83f8d8e7a9b8eaac690a90b62f1748bd9206c18e
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
  "id": 1127,
  "uid": "a9aecdb9-ca88-4bd5-b2a2-0d9a1b3ce048",
  "user": {
    "id": 3167,
    "email": "quentin@timelyapp.com",
    "name": "Quintin Duponde",
    "active": false,
    "day_view_onboarded": true,
    "memory_onboarded": true,
    "created_at": 1547825831,
    "updated_at": 1547825831,
    "default_hour_rate": 0.0,
    "last_received_memories_date": null,
    "sign_in_count": null,
    "external_id": null
  },
  "project": {
    "id": 1250,
    "active": true,
    "account_id": 1376,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 958,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547825831,
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
  "day": "2019-01-18",
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
  "updated_at": 1547825831,
  "created_at": 1547825831,
  "created_from": "Web",
  "updated_from": "Web",
  "billed": false,
  "to": "2019-01-18T20:07:11+01:00",
  "from": "2019-01-18T16:37:11+01:00",
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
curl -g "https://api.timelyapp.com/1.1/1377/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5ed16161b404e03e8d086763fc1a1d24ddbda65e57108eccd0ca2ecea256269b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/1377/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5ed16161b404e03e8d086763fc1a1d24ddbda65e57108eccd0ca2ecea256269b
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
	-H "Authorization: Bearer a3b50223e49bf3b555ddc00bbb63e5202d91297371a281994f15867789b82f0c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer a3b50223e49bf3b555ddc00bbb63e5202d91297371a281994f15867789b82f0c
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
	-H "Authorization: Bearer f0059a8995db2640a670c313370ccf8a60a4f16b48717c9d21c9a0939ad1638e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer f0059a8995db2640a670c313370ccf8a60a4f16b48717c9d21c9a0939ad1638e
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
curl "https://api.timelyapp.com/1.1/1387/projects/1261/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4e56efda446b586baedb3d3be7a203a2e1d72c163a310d41c0bd1d785c3bb6e6" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
POST /1.1/1387/projects/1261/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4e56efda446b586baedb3d3be7a203a2e1d72c163a310d41c0bd1d785c3bb6e6
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
curl "https://api.timelyapp.com/1.1/1388/projects/1262/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 610f734f46bc9305b148f1f9edb1c41d7d210967c9b6f0d5c1d25b4aca89153c" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
DELETE /1.1/1388/projects/1262/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 610f734f46bc9305b148f1f9edb1c41d7d210967c9b6f0d5c1d25b4aca89153c
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
curl -g "https://api.timelyapp.com/1.1/1384/projects/1258/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2e9cb63dc26900eb5edf1adc66ce74bc3f08900e526261b01f21003d12a105aa" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscribers`

```plaintext
GET /1.1/1384/projects/1258/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2e9cb63dc26900eb5edf1adc66ce74bc3f08900e526261b01f21003d12a105aa
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
    "id": 3183,
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
curl -g "https://api.timelyapp.com/1.1/1385/projects/1259/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0373fbc5845fc74642f247199a50ebdb580d7a881f59af9d184c453a3c6a84db" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/1385/projects/1259/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0373fbc5845fc74642f247199a50ebdb580d7a881f59af9d184c453a3c6a84db
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
curl -g "https://api.timelyapp.com/1.1/1386/projects/1260/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ce9f044299b7480d86eb5af0ba1f08b9bd2807284e9a5258ab46abf7112eb4f4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/1386/projects/1260/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer ce9f044299b7480d86eb5af0ba1f08b9bd2807284e9a5258ab46abf7112eb4f4
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
curl -g "https://api.timelyapp.com/1.1/1400/projects/search?q=Daisy" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9f540e12e9645dc17098b04d9697dc13cb594400afd42b9f29133c2c151945e4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/1400/projects/search?q=Daisy
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9f540e12e9645dc17098b04d9697dc13cb594400afd42b9f29133c2c151945e4
```

#### Parameters

```json
q: Daisy
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
    "id": 1284,
    "name": "Daisy",
    "color": "67a3bc",
    "active": true,
    "client": {
      "id": 982,
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
curl -g "https://api.timelyapp.com/1.1/1398/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9d19dfb4eab2edcf4109daeb22e32f28568e1bed432335ad89d996bacd0637c7" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1398/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9d19dfb4eab2edcf4109daeb22e32f28568e1bed432335ad89d996bacd0637c7
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
    "id": 1276,
    "active": true,
    "account_id": 1398,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 980,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547825836,
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
        "user_id": 3211,
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
curl -g "https://api.timelyapp.com/1.1/1397/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7f84658d52c5a5502a833f1cf4414903224de3ff4e4b417d0cd5b9002b6b5101" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1397/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7f84658d52c5a5502a833f1cf4414903224de3ff4e4b417d0cd5b9002b6b5101
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
    "id": 1274,
    "active": true,
    "account_id": 1397,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 979,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547825836,
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
        "user_id": 3209,
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
    "id": 1275,
    "active": false,
    "account_id": 1397,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 979,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547825836,
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
        "user_id": 3209,
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
curl -g "https://api.timelyapp.com/1.1/1399/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a9ebcd06a12a14af998fa4bd3ed49a1a18bcb715f69428cd24e6b88cfc1ffaab" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1399/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer a9ebcd06a12a14af998fa4bd3ed49a1a18bcb715f69428cd24e6b88cfc1ffaab
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
    "id": 1279,
    "active": false,
    "account_id": 1399,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 981,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547825836,
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
        "user_id": 3213,
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
curl "https://api.timelyapp.com/1.1/1405/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":987,"budget_type":"M","budget":300,"users":[{"user_id":3225}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 006fc328ae0ab218fa096bce88337caedc232c59570e69c8b98e4bf3b84d6c4e" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1405/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 006fc328ae0ab218fa096bce88337caedc232c59570e69c8b98e4bf3b84d6c4e
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":987,"budget_type":"M","budget":300,"users":[{"user_id":3225}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
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
  "id": 1303,
  "active": true,
  "account_id": 1405,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 987,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825837,
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
      "user_id": 3225,
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
curl "https://api.timelyapp.com/1.1/1402/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":984,"users":[{"user_id":3219}],"labels":[{"label_id":525},{"label_id":526,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7a7ef9da3225e0743275bc44a5a16cfdbfaad3fc0bb469e2f80b2114d95b5fb5" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1402/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7a7ef9da3225e0743275bc44a5a16cfdbfaad3fc0bb469e2f80b2114d95b5fb5
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":984,"users":[{"user_id":3219}],"labels":[{"label_id":525},{"label_id":526,"budget":0,"required":false}]}}
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
  "id": 1300,
  "active": true,
  "account_id": 1402,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 984,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825837,
  "label_ids": [
    525,
    526
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
      "user_id": 3219,
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
      "label_id": 525,
      "budget": null,
      "required": false
    },
    {
      "label_id": 526,
      "budget": 0,
      "required": false
    }
  ]
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1403/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":985,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":3221}],"labels":[{"label_id":527,"budget":100,"required":false},{"label_id":528,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6ec03c13b6206499fad6d256ca77aab3618d0f6b3fe13e717de95eed1ce01edb" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1403/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6ec03c13b6206499fad6d256ca77aab3618d0f6b3fe13e717de95eed1ce01edb
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":985,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":3221}],"labels":[{"label_id":527,"budget":100,"required":false},{"label_id":528,"budget":200,"required":true}]}}
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
  "id": 1301,
  "active": true,
  "account_id": 1403,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 985,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825837,
  "label_ids": [
    527,
    528
  ],
  "required_label_ids": [
    528
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
      "user_id": 3221,
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
      "label_id": 527,
      "budget": 100,
      "required": false
    },
    {
      "label_id": 528,
      "budget": 200,
      "required": true
    }
  ]
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1404/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":986,"budget_type":"M","budget":300,"users":[{"user_id":3223}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 52eaf8c75a2979ff93869b1fefe392ea3e2a923d2591a552d8d9c8e8e938c789" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1404/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 52eaf8c75a2979ff93869b1fefe392ea3e2a923d2591a552d8d9c8e8e938c789
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":986,"budget_type":"M","budget":300,"users":[{"user_id":3223}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
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
  "id": 1302,
  "active": true,
  "account_id": 1404,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 986,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825837,
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
      "user_id": 3223,
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
curl -g "https://api.timelyapp.com/1.1/1395/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer add52d909ecc1ea3db6cc239c334d7b98c3cb24b5176a9ecffebb4bd0594c65e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1395/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer add52d909ecc1ea3db6cc239c334d7b98c3cb24b5176a9ecffebb4bd0594c65e
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
    "id": 1270,
    "active": true,
    "account_id": 1395,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 977,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547825835,
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
        "user_id": 3205,
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
curl -g "https://api.timelyapp.com/1.1/1396/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 32d0191ce96acd9dab91d727c4d86859964f3b129393ce0c936058b04ac0c3d7" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1396/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 32d0191ce96acd9dab91d727c4d86859964f3b129393ce0c936058b04ac0c3d7
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
curl "https://api.timelyapp.com/1.1/1415/projects/1313" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 11961a3cbdb9282de7c89fd5689c0dfcfb3af80340faa2f4b7d705adf63b9982" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1415/projects/1313
Accept: application/json
Content-Type: application/json
Authorization: Bearer 11961a3cbdb9282de7c89fd5689c0dfcfb3af80340faa2f4b7d705adf63b9982
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
  "id": 1313,
  "active": true,
  "account_id": 1415,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 997,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825840,
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
curl "https://api.timelyapp.com/1.1/1406/projects/1304" -d '{"project":{"labels":[{"label_id":529},{"label_id":530,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f5464a313459c90cdee18c3bb39544e3b0c8c7a54e551bbf5466e2e78cb456b2" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1406/projects/1304
Accept: application/json
Content-Type: application/json
Authorization: Bearer f5464a313459c90cdee18c3bb39544e3b0c8c7a54e551bbf5466e2e78cb456b2
```

#### Parameters


```json
{"project":{"labels":[{"label_id":529},{"label_id":530,"budget":0,"required":false}]}}
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
  "id": 1304,
  "active": true,
  "account_id": 1406,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 988,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825838,
  "label_ids": [
    529,
    530
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
      "label_id": 529,
      "budget": null,
      "required": false
    },
    {
      "label_id": 530,
      "budget": 0,
      "required": false
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1407/projects/1305" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":531,"budget":100,"required":true},{"label_id":532,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a9ddc89dde1c981c27ebb574500862ea0c599df6e58afac08e321bfb39aeb28e" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1407/projects/1305
Accept: application/json
Content-Type: application/json
Authorization: Bearer a9ddc89dde1c981c27ebb574500862ea0c599df6e58afac08e321bfb39aeb28e
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":531,"budget":100,"required":true},{"label_id":532,"budget":100,"required":true}]}}
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
  "id": 1305,
  "active": true,
  "account_id": 1407,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 989,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825838,
  "label_ids": [
    531,
    532
  ],
  "required_label_ids": [
    531,
    532
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
      "label_id": 531,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 532,
      "budget": 100,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1408/projects/1306" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":533,"budget":100,"required":true},{"label_id":534,"budget":100,"required":true},{"label_id":535,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e411e33eb206c72f71ab095af892f448e3edeb172738542b1a21d005e1f23264" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1408/projects/1306
Accept: application/json
Content-Type: application/json
Authorization: Bearer e411e33eb206c72f71ab095af892f448e3edeb172738542b1a21d005e1f23264
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":533,"budget":100,"required":true},{"label_id":534,"budget":100,"required":true},{"label_id":535,"budget":200,"required":true}]}}
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
  "id": 1306,
  "active": true,
  "account_id": 1408,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 990,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825838,
  "label_ids": [
    533,
    534,
    535
  ],
  "required_label_ids": [
    533,
    534,
    535
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
      "label_id": 533,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 534,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 535,
      "budget": 200,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1409/projects/1307" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":538,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 08a5dc69652b6715ce9ba6562cbcff599791580ad1cdcd641f3959b448037059" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1409/projects/1307
Accept: application/json
Content-Type: application/json
Authorization: Bearer 08a5dc69652b6715ce9ba6562cbcff599791580ad1cdcd641f3959b448037059
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":538,"budget":400,"required":true}]}}
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
  "id": 1307,
  "active": true,
  "account_id": 1409,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 991,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825838,
  "label_ids": [
    538
  ],
  "required_label_ids": [
    538
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
      "label_id": 538,
      "budget": 400,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1410/projects/1308" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3568c34b2cf3233356544f1e7e19c22653aa2a8441721c0cdf2b2adfede6011c" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1410/projects/1308
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3568c34b2cf3233356544f1e7e19c22653aa2a8441721c0cdf2b2adfede6011c
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
  "id": 1308,
  "active": true,
  "account_id": 1410,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 992,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825839,
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
curl "https://api.timelyapp.com/1.1/1411/projects/1309" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3a407fc3f9b0f28b9ca59b102d319b6921f240e8ac0b28f7db7dacdc970fe21e" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1411/projects/1309
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3a407fc3f9b0f28b9ca59b102d319b6921f240e8ac0b28f7db7dacdc970fe21e
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
  "id": 1309,
  "active": true,
  "account_id": 1411,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 993,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825839,
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
curl "https://api.timelyapp.com/1.1/1412/projects/1310" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 118a47db10d195bd9dde3fe67609959c1756b5f99dc9cf1728e76022aff41eee" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1412/projects/1310
Accept: application/json
Content-Type: application/json
Authorization: Bearer 118a47db10d195bd9dde3fe67609959c1756b5f99dc9cf1728e76022aff41eee
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
  "id": 1310,
  "active": true,
  "account_id": 1412,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 994,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547825839,
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
curl "https://api.timelyapp.com/1.1/1413/projects/1311" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6fd2cf70efa600e3fb2f5c15e173eed826daf0870c25c880401d3c873f97f0ce" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1413/projects/1311
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6fd2cf70efa600e3fb2f5c15e173eed826daf0870c25c880401d3c873f97f0ce
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
curl "https://api.timelyapp.com/1.1/1414/projects/1312" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer be62438a144fd293e97d5637cdc8a94957b57160209e2752c310d91b05d7b857" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1414/projects/1312
Accept: application/json
Content-Type: application/json
Authorization: Bearer be62438a144fd293e97d5637cdc8a94957b57160209e2752c310d91b05d7b857
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
curl -g "https://api.timelyapp.com/1.1/1417/suggested_entries?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2948be9255199e56be3e5608f518b178ac3abc298b79bc9bda6cb75238128162" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/1417/suggested_entries?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2948be9255199e56be3e5608f518b178ac3abc298b79bc9bda6cb75238128162
```

#### Parameters

```json
date: 2019-01-18
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
    "date": "2019-01-18",
    "from": null,
    "to": null,
    "description": "14:00 - 15:00 • Discuss about future",
    "entry_ids": [
      545
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
    }
  },
  {
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-18",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      546,
      547
    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 1315,
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
    }
  },
  {
    "title": "Congratulations on winning $100000",
    "note": "You won $100000, share your netbanking details",
    "date": "2019-01-18",
    "from": null,
    "to": null,
    "description": " • You won $100000, share your netbanking details",
    "entry_ids": [
      548
    ],
    "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 1315,
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
    }
  }
]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1418/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":550,"project_id":1317}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 06082c750b9210a61e8c021cb38d8d9a4861c736d58a8efe554530d14e3a7342" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/1418/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 06082c750b9210a61e8c021cb38d8d9a4861c736d58a8efe554530d14e3a7342
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":550,"project_id":1317}]}}
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
curl -g "https://api.timelyapp.com/1.1/1419/suggested_hours?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0293e3b65d511ebd734cc19bb39a40e679fe98b2176ce2a41f35fb533ec604eb" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1419/suggested_hours?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0293e3b65d511ebd734cc19bb39a40e679fe98b2176ce2a41f35fb533ec604eb
```

#### Parameters

```json
date: 2019-01-18
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
    "id": 119,
    "owner": {
      "id": 1064,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1318,
    "date": "2019-01-18",
    "to": "2019-01-18T20:07:20+01:00",
    "from": "2019-01-18T16:37:20+01:00",
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
    "created_at": "2019-01-18T16:37:21+01:00",
    "suggested_entry_ids": [
      553,
      554
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T16:37:21+01:00"
  }
]
```


## show


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1425/suggested_hours/131" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 69b6a4314ec9a326ac923b83bd6a838a6bd80bc8d53e09e2a659b9e47f7471e9" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
GET /1.1/1425/suggested_hours/131
Accept: application/json
Content-Type: application/json
Authorization: Bearer 69b6a4314ec9a326ac923b83bd6a838a6bd80bc8d53e09e2a659b9e47f7471e9
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
  "id": 131,
  "owner": {
    "id": 1070,
    "email": "notifications@timelyapp.com",
    "name": "Timely",
    "avatar": {
      "timeline": "/assets/timely_user_avatar_timeline.png",
      "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
      "medium": "/assets/timely_user_avatar_medium.png"
    }
  },
  "project_id": 1324,
  "date": "2019-01-18",
  "to": "2019-01-18T20:07:22+01:00",
  "from": "2019-01-18T16:37:22+01:00",
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
  "created_at": "2019-01-18T16:37:22+01:00",
  "suggested_entry_ids": [
    577,
    578
  ],
  "version": "0.2.0",
  "updated_at": "2019-01-18T16:37:22+01:00"
}
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1421/suggested_hours?date=2019-01-18&since=2019-01-16&until=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e5857ec08b885e33a501e6616dd19aa977383ad6c834d700f63e79f1f8b4e1eb" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1421/suggested_hours?date=2019-01-18&amp;since=2019-01-16&amp;until=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer e5857ec08b885e33a501e6616dd19aa977383ad6c834d700f63e79f1f8b4e1eb
```

#### Parameters

```json
date: 2019-01-18
since: 2019-01-16
until: 2019-01-18
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
    "id": 123,
    "owner": {
      "id": 1066,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1320,
    "date": "2019-01-18",
    "to": "2019-01-18T20:07:21+01:00",
    "from": "2019-01-18T16:37:21+01:00",
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
    "created_at": "2019-01-18T16:37:21+01:00",
    "suggested_entry_ids": [
      561,
      562
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T16:37:21+01:00"
  },
  {
    "id": 124,
    "owner": {
      "id": 1066,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1320,
    "date": "2019-01-16",
    "to": "2019-01-18T20:07:21+01:00",
    "from": "2019-01-18T16:37:21+01:00",
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
    "created_at": "2019-01-18T16:37:21+01:00",
    "suggested_entry_ids": [
      563
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T16:37:21+01:00"
  }
]
```


## suggested hour ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1422/suggested_hours?date=2019-01-18&suggested_hour_ids=125" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8f7fc8c7d032068e6eeb9b0b0728cfc24dee2ea07ff385feee4637c3363945f7" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1422/suggested_hours?date=2019-01-18&amp;suggested_hour_ids=125
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8f7fc8c7d032068e6eeb9b0b0728cfc24dee2ea07ff385feee4637c3363945f7
```

#### Parameters

```json
date: 2019-01-18
suggested_hour_ids: 125
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
    "id": 125,
    "owner": {
      "id": 1067,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1321,
    "date": "2019-01-18",
    "to": "2019-01-18T20:07:21+01:00",
    "from": "2019-01-18T16:37:21+01:00",
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
    "created_at": "2019-01-18T16:37:21+01:00",
    "suggested_entry_ids": [
      565,
      566
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T16:37:21+01:00"
  }
]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1423/suggested_hours/127" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4f2e2aa0e570fbcbbade75091a42768b9a160048bbcbec788ebb201c17276de1" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/1423/suggested_hours/127
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4f2e2aa0e570fbcbbade75091a42768b9a160048bbcbec788ebb201c17276de1
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
  "id": 127,
  "owner": {
    "id": 1068,
    "email": "notifications@timelyapp.com",
    "name": "Timely",
    "avatar": {
      "timeline": "/assets/timely_user_avatar_timeline.png",
      "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
      "medium": "/assets/timely_user_avatar_medium.png"
    }
  },
  "project_id": 1322,
  "date": "2019-01-18",
  "to": "2019-01-18T20:07:22+01:00",
  "from": "2019-01-18T16:37:22+01:00",
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
  "created_at": "2019-01-18T16:37:22+01:00",
  "suggested_entry_ids": [
    569,
    570
  ],
  "version": "0.2.0",
  "updated_at": "2019-01-18T16:37:22+01:00"
}
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1424/suggested_hours/decline" -d '{"suggested_hour_ids":[129]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9dfd1bb541980c2d01aa483b10c9fd9facff743507098adf61c5784f8a0f43bb" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/decline`

```plaintext
PUT /1.1/1424/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9dfd1bb541980c2d01aa483b10c9fd9facff743507098adf61c5784f8a0f43bb
```

#### Parameters


```json
{"suggested_hour_ids":[129]}
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
curl -g "https://api.timelyapp.com/1.1/1420/suggested_hours?date=2019-01-16" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0d09ed35bdd4d7a6c49d03d0190c5ed617e4b77739b56b079b0ef1e3660e64f4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1420/suggested_hours?date=2019-01-16
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0d09ed35bdd4d7a6c49d03d0190c5ed617e4b77739b56b079b0ef1e3660e64f4
```

#### Parameters

```json
date: 2019-01-16
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
    "id": 122,
    "owner": {
      "id": 1065,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1319,
    "date": "2019-01-16",
    "to": "2019-01-18T20:07:21+01:00",
    "from": "2019-01-18T16:37:21+01:00",
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
    "created_at": "2019-01-18T16:37:21+01:00",
    "suggested_entry_ids": [
      559
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T16:37:21+01:00"
  }
]
```


# Training Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/1432/training_entries" -d '{"training_entries":{"entries":[{"entry_id":584,"project_id":1330}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a3251524aec8984ec95273218c4d72a89d6ae148ae9532b20647ce62fdac8e41" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/1432/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer a3251524aec8984ec95273218c4d72a89d6ae148ae9532b20647ce62fdac8e41
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":584,"project_id":1330}]}}
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
curl -g "https://api.timelyapp.com/1.1/1431/training_entries?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a62103f78f8a559779bf963e946dfba8af6b9554d8b71db28056362896fadd9c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/training_entries`

```plaintext
GET /1.1/1431/training_entries?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer a62103f78f8a559779bf963e946dfba8af6b9554d8b71db28056362896fadd9c
```

#### Parameters

```json
date: 2019-01-18
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
    "id": 581,
    "type": "macOS",
    "uid": "9f7cd050-0d23-48ed-99ad-f07cf784b3a9",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-18",
    "from": "2019-01-18T10:00:00+01:00",
    "to": "2019-01-18T12:00:00+01:00",
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
    "at": "2019-01-18T10:00:00+01:00",
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
    "id": 582,
    "type": "macOS",
    "uid": "9f7cd050-0d23-48ed-99ad-f07cf784b3a9",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-18",
    "from": "2019-01-18T14:00:00+01:00",
    "to": "2019-01-18T15:00:00+01:00",
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
    "at": "2019-01-18T14:00:00+01:00",
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
curl "https://api.timelyapp.com/1.1/1433/training_entries" -d '{"training_entries":{"entries":[{"entry_id":586,"project_id":1331},{"entry_id":585,"project_id":1331}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a8802983bcac89fd20db8db5872fbde4dd2023a08017c70ab079089296aa74ed" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/1433/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer a8802983bcac89fd20db8db5872fbde4dd2023a08017c70ab079089296aa74ed
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":586,"project_id":1331},{"entry_id":585,"project_id":1331}]}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/1444/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 265f38fd6702e868268e4bee5615c231873a4a4888b300510c739c038b5827f4" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1444/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 265f38fd6702e868268e4bee5615c231873a4a4888b300510c739c038b5827f4
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/1446/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4b4a9644fb6e1483c9bda54e2ce1f5680001fc0f278c59b84aa4c6a33a165244" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1446/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4b4a9644fb6e1483c9bda54e2ce1f5680001fc0f278c59b84aa4c6a33a165244
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/1443/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fcf43b9313bc933c6a311b3d28bc8ad4c49a76db513683296b6e3c3abdb68cdb" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1443/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer fcf43b9313bc933c6a311b3d28bc8ad4c49a76db513683296b6e3c3abdb68cdb
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
  "id": 1443,
  "name": "Timely",
  "from": "Web",
  "max_users": 0,
  "max_projects": 0,
  "num_users": 2,
  "num_projects": 0,
  "plan_id": 28,
  "plan_name": "Essential",
  "next_charge": "2019-02-18",
  "currency": {
    "id": "usd",
    "name": "United States Dollar",
    "iso_code": "USD",
    "symbol": "$",
    "symbol_first": true
  },
  "start_of_week": 0,
  "beta": false,
  "created_at": 1547825847,
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
  "firebase_auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA1MDQyNDcsInYiOjAsImlhdCI6MTU0NzgyNTg0NywiZCI6eyJ1c2VyX2lkIjoiMzMyNCIsImFjY291bnRfaWQiOiIxNDQzIiwidXNlcl90eXBlIjoibm9ybWFsIiwidWlkIjoiZjI0ZWZkYjI5YmJhZWI1Yzg0ZTMzNDZjMmU5YWE1OGYifX0.wYEiTeG1e6zk7JftBlTrY0KmHfCA4e0XRbLhY69FvwE"
}
```


## upgrade account plan to solo


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1442/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 998784b05434dc09fe9b192a0e913f76c616feadecceb0e60ea696de5d91867d" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1442/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 998784b05434dc09fe9b192a0e913f76c616feadecceb0e60ea696de5d91867d
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
  "id": 1442,
  "name": "Timely",
  "from": "Web",
  "max_users": 1,
  "max_projects": 3,
  "num_users": 2,
  "num_projects": 0,
  "plan_id": 34,
  "plan_name": "Solo",
  "next_charge": "2019-02-18",
  "currency": {
    "id": "usd",
    "name": "United States Dollar",
    "iso_code": "USD",
    "symbol": "$",
    "symbol_first": true
  },
  "start_of_week": 0,
  "beta": false,
  "created_at": 1547825846,
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
  "firebase_auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA1MDQyNDcsInYiOjAsImlhdCI6MTU0NzgyNTg0NywiZCI6eyJ1c2VyX2lkIjoiMzMyMiIsImFjY291bnRfaWQiOiIxNDQyIiwidXNlcl90eXBlIjoibm9ybWFsIiwidWlkIjoiYWVjZTFkZGVhNDdiMGVjY2QzZTA0MTcyZGVmNzU2MTcifX0.rox7TePEs5MEwNXwd03HAwOI1zwKnmibJEbBLE5fTeY"
}
```


## upgrade for duplicate appstore_transaction_id


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1448/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b444b0819f0fa7b2d8044f1e9bada188167d5ca4f58838c7c910e6165f94a87e" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1448/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer b444b0819f0fa7b2d8044f1e9bada188167d5ca4f58838c7c910e6165f94a87e
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}
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
    "user_id": 3077,
    "property": "has_seen_calendar_day",
    "value": "yes",
    "updated_at": "2019-01-18T16:36:59+01:00"
  },
  {
    "user_id": 3077,
    "property": "has_seen_calendar_week",
    "value": "no",
    "updated_at": "2019-01-18T16:36:59+01:00"
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
    "user_id": 3076,
    "property": "has_seen_calendar_week",
    "value": "yes",
    "updated_at": "2019-01-18T16:36:59+01:00"
  }
]
```


# Users



## Search all users with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1440/users/search?q=Laurice+Connelly+PhD" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fbf6e6d22fb8f90f91a3675788ee9ca5706dc83ca8632ffc1c8922ce32044273" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/search`

```plaintext
GET /1.1/1440/users/search?q=Laurice+Connelly+PhD
Accept: application/json
Content-Type: application/json
Authorization: Bearer fbf6e6d22fb8f90f91a3675788ee9ca5706dc83ca8632ffc1c8922ce32044273
```

#### Parameters

```json
q: Laurice Connelly PhD
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
    "id": 3304,
    "email": "nancee@yahoo.com",
    "name": "Laurice Connelly PhD",
    "active": false,
    "external_id": null,
    "avatar": {
      "large": "https://www.gravatar.com/avatar/537bdf1b2fe3882a2384c6af40d595ae?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200",
      "medium": "https://www.gravatar.com/avatar/537bdf1b2fe3882a2384c6af40d595ae?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50",
      "small": "https://www.gravatar.com/avatar/537bdf1b2fe3882a2384c6af40d595ae?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"
    },
    "updated_at": 1547825846
  }
]
```


