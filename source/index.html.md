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
curl "https://api.timelyapp.com/1.1/apps/255/objects/255" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70092756975540}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 71675a20eef51d00ccd22b87faaf261c1c7282062e3ec1b46443d9dbb1c402f2" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/255/objects/255
Accept: application/json
Content-Type: application/json
Authorization: Bearer 71675a20eef51d00ccd22b87faaf261c1c7282062e3ec1b46443d9dbb1c402f2
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70092756975540}}
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
    "updated_at": "2019-01-18T12:04:59+01:00",
    "auto_import": true,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": true,
    "updated_at": "2019-01-18T12:04:59+01:00",
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
curl "https://api.timelyapp.com/1.1/apps/257/objects/257" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70092755641140}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0a4d2a03fe2faff939ab8901700cd6ebb142b4848a5c23e54c858bb88791ea58" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/257/objects/257
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0a4d2a03fe2faff939ab8901700cd6ebb142b4848a5c23e54c858bb88791ea58
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70092755641140}}
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
    "updated_at": "2019-01-18T12:04:59+01:00",
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
curl -g "https://api.timelyapp.com/1.1/apps/253/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3e93b5adfb7498532a461bdb42904eeec83232a97987c8013ee43e7edcd59c3d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/253/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3e93b5adfb7498532a461bdb42904eeec83232a97987c8013ee43e7edcd59c3d
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
curl -g "https://api.timelyapp.com/1.1/apps/254/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bed5dd25b3c7aa8bd0a0ae8941880e265d6ba75aea58c247fa25766f0b87cfa5" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/254/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer bed5dd25b3c7aa8bd0a0ae8941880e265d6ba75aea58c247fa25766f0b87cfa5
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
curl "https://api.timelyapp.com/1.1/apps/256/objects/256" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70092750655200}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6d58bb29789fbc3c3f5eacae238fc7b13a042f92dda404fb67ff118b7cdf4996" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/256/objects/256
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6d58bb29789fbc3c3f5eacae238fc7b13a042f92dda404fb67ff118b7cdf4996
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70092750655200}}
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
    "updated_at": "2019-01-18T12:04:59+01:00",
    "auto_import": false,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": true,
    "updated_at": "2019-01-18T12:04:59+01:00",
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
curl "https://api.timelyapp.com/1.1/apps/426/connected/275" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 98c792353311c04cfda96a8956dd343a098bf006f64423f2ab8e45c602fff2a5" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/apps/:app_id/connected/:id`

```plaintext
DELETE /1.1/apps/426/connected/275
Accept: application/json
Content-Type: application/json
Authorization: Bearer 98c792353311c04cfda96a8956dd343a098bf006f64423f2ab8e45c602fff2a5
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
	-H "Authorization: Bearer 6dff25f83a8570e6d8d3cad9abcefbbae931fbce0aaa29d5a07b53ec0928cdd4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps`

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6dff25f83a8570e6d8d3cad9abcefbbae931fbce0aaa29d5a07b53ec0928cdd4
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
    "app_id": 412,
    "id": "google_calendar",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-18T12:04:59+01:00",
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
    "connected_apps_url": "/apps/412/connected"
  },
  {
    "app_id": 413,
    "id": "office365",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-18T12:04:59+01:00",
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
    "connected_apps_url": "/apps/413/connected"
  },
  {
    "app_id": 414,
    "id": "gmail",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-18T12:04:59+01:00",
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
    "connected_apps_url": "/apps/414/connected"
  },
  {
    "app_id": 415,
    "id": "moves_app",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 1,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-16T12:04:59+01:00",
    "last_imported_at": "2019-01-17T12:04:59+01:00",
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
    "connected_apps_url": "/apps/415/connected"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/416/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b371b97294209b27a226c970ff08f957e2fd46e0106bbb72b363ab3243394b1f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/416/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer b371b97294209b27a226c970ff08f957e2fd46e0106bbb72b363ab3243394b1f
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
    "id": 263,
    "name": "Tom Hardy",
    "email": "tom@timelyapp.com",
    "active": true,
    "created_at": "2019-01-18T12:05:00+01:00",
    "updated_at": "2019-01-18T12:05:00+01:00",
    "last_imported_at": null,
    "disconnected": false,
    "disconnected_reason": null,
    "objects": true,
    "objects_type": "calendars",
    "objects_url": "/1.1/apps/263/objects"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/422/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 69f3ac0370df8ff411bbc71c4a0ba7455f621fdf749bfc12b2031908f9aa5469" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/422/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 69f3ac0370df8ff411bbc71c4a0ba7455f621fdf749bfc12b2031908f9aa5469
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
    "id": 270,
    "name": "Tom Hardy",
    "email": "tom@timelyapp.com",
    "active": true,
    "created_at": "2019-01-18T12:05:00+01:00",
    "updated_at": "2019-01-18T12:05:00+01:00",
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
curl -g "https://api.timelyapp.com/1.1/900/projects/898/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f50025f91e67d581b0296f2d1d69f9080c9c692b22ff608a087825dea1139111" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/900/projects/898/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer f50025f91e67d581b0296f2d1d69f9080c9c692b22ff608a087825dea1139111
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
curl -g "https://api.timelyapp.com/1.1/901/projects/899/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ef023f1f621c7d2816e7cbd2ebe805239c656a8883b65f6f2c3130e02b4dad07" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/901/projects/899/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer ef023f1f621c7d2816e7cbd2ebe805239c656a8883b65f6f2c3130e02b4dad07
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
curl -g "https://api.timelyapp.com/1.1/898/projects/896/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 62c0bca77fe42ec6dcec065a218f3ee2918bafac18bc1c1690ad1b09c77f7a3b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/898/projects/896/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 62c0bca77fe42ec6dcec065a218f3ee2918bafac18bc1c1690ad1b09c77f7a3b
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
curl -g "https://api.timelyapp.com/1.1/899/projects/897/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d031a886369fdd5bb6955a3745a3028479b1e43bff818651848bc9a163f3f0a8" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/899/projects/897/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer d031a886369fdd5bb6955a3745a3028479b1e43bff818651848bc9a163f3f0a8
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
curl "https://api.timelyapp.com/1.1/906/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[465]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9dba27a957f4081df8bcfc08d7cec847d9f29f32d2919a3d06683bebba3b2c99" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/suggested_entries/discard`

```plaintext
POST /1.1/906/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9dba27a957f4081df8bcfc08d7cec847d9f29f32d2919a3d06683bebba3b2c99
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[465]}}
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
curl -g "https://api.timelyapp.com/1.1/905/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 94bcf9956371a0f78af9bda99faf59af4ab9607055b99940604c34e591ccd2ef" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries/discarded`

```plaintext
GET /1.1/905/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer 94bcf9956371a0f78af9bda99faf59af4ab9607055b99940604c34e591ccd2ef
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
      464
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
curl "https://api.timelyapp.com/1.1/907/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[468]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bc23870d0ff3c442f60fd9ef60d2d8e7904b09bac08c03908f5eb66bd6952a38" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggested_entries/discard`

```plaintext
DELETE /1.1/907/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer bc23870d0ff3c442f60fd9ef60d2d8e7904b09bac08c03908f5eb66bd6952a38
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[468]}}
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=469%2C470" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 31224c62dc598b0d8ff04ba69ba523f3c4cd04e4b29853f5dfe9c4b03b94fc2a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=469%2C470
Accept: application/json
Content-Type: application/json
Authorization: Bearer 31224c62dc598b0d8ff04ba69ba523f3c4cd04e4b29853f5dfe9c4b03b94fc2a
```

#### Parameters

```json
entry_ids: 469,470
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=471%2C472" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0b3d077dd4bc959a620fd6f37f872114cad0b8d26202939ff3905fddfc0c814e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=471%2C472
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0b3d077dd4bc959a620fd6f37f872114cad0b8d26202939ff3905fddfc0c814e
```

#### Parameters

```json
entry_ids: 471,472
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=473%2C474" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b1dbc1318a5dc906c8181e5abf687301914c22996a0a6855cfbf817db08b3851" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=473%2C474
Accept: application/json
Content-Type: application/json
Authorization: Bearer b1dbc1318a5dc906c8181e5abf687301914c22996a0a6855cfbf817db08b3851
```

#### Parameters

```json
entry_ids: 473,474
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
curl "https://api.timelyapp.com/1.1/entries/486" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 06d5250955f7faa5075f4e3ac580aa10ef38bd406cc502b2d76f474ea2e37a97" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/entries/:id`

```plaintext
DELETE /1.1/entries/486
Accept: application/json
Content-Type: application/json
Authorization: Bearer 06d5250955f7faa5075f4e3ac580aa10ef38bd406cc502b2d76f474ea2e37a97
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
	-H "Authorization: Bearer 97853f73336071f96529cfcc645f105e0ecb990a0c54c226494adea74d6eb0a9" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?date=2019-01-20
Accept: application/json
Content-Type: application/json
Authorization: Bearer 97853f73336071f96529cfcc645f105e0ecb990a0c54c226494adea74d6eb0a9
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
    "id": 480,
    "type": "google_calendar",
    "uid": "480652d8-2005-49b5-9f46-67b86ddc5bb7",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "12:05 - 15:35 • Discuss about future",
    "date": "2019-01-20",
    "from": "2019-01-18T12:05:08+01:00",
    "to": "2019-01-18T15:35:08+01:00",
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
    "at": "2019-01-18T12:05:08+01:00",
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
	-H "Authorization: Bearer bb1bd90749ecea2acce33b1b72330b95e07618e2dd3c11198a0b86509e98ab7b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer bb1bd90749ecea2acce33b1b72330b95e07618e2dd3c11198a0b86509e98ab7b
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
    "id": 475,
    "type": "macOS",
    "uid": "480652d8-2005-49b5-9f46-67b86ddc5bb7",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-18",
    "from": "2019-01-18T12:05:08+01:00",
    "to": "2019-01-18T15:35:08+01:00",
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
    "at": "2019-01-18T12:05:08+01:00",
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
    "id": 476,
    "type": "google_calendar",
    "uid": "480652d8-2005-49b5-9f46-67b86ddc5bb7",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "12:05 - 15:35 • Discuss about future",
    "date": "2019-01-18",
    "from": "2019-01-18T12:05:08+01:00",
    "to": "2019-01-18T15:35:08+01:00",
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
    "at": "2019-01-18T12:05:08+01:00",
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
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=481%2C483" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e0f172b4563afc94b237816157f4d36ba292a193ea5849825c3f3ed6fcc85f97" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=481%2C483
Accept: application/json
Content-Type: application/json
Authorization: Bearer e0f172b4563afc94b237816157f4d36ba292a193ea5849825c3f3ed6fcc85f97
```

#### Parameters

```json
entry_ids: 481,483
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
    "id": 481,
    "type": "macOS",
    "uid": "480652d8-2005-49b5-9f46-67b86ddc5bb7",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-18",
    "from": "2019-01-18T12:05:08+01:00",
    "to": "2019-01-18T15:35:08+01:00",
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
    "at": "2019-01-18T12:05:08+01:00",
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
    "id": 483,
    "type": "google_calendar",
    "uid": "480652d8-2005-49b5-9f46-67b86ddc5bb7",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "12:05 - 15:35 • Discuss about future",
    "date": "2019-01-20",
    "from": "2019-01-18T12:05:08+01:00",
    "to": "2019-01-18T15:35:08+01:00",
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
    "at": "2019-01-18T12:05:08+01:00",
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
curl -g "https://api.timelyapp.com/1.1/928/events/659" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2c13abe406b90ec8d2cf450e9dea19a5507a874eed8bde411bd0eba3ed148c4c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/928/events/659
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2c13abe406b90ec8d2cf450e9dea19a5507a874eed8bde411bd0eba3ed148c4c
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
  "id": 659,
  "uid": "4bca9002-124b-44c6-ada3-e15b17095364",
  "user": {
    "id": 2128,
    "email": "quentin@timelyapp.com",
    "name": "Quintin Duponde",
    "active": false,
    "day_view_onboarded": true,
    "memory_onboarded": true,
    "created_at": 1547809513,
    "updated_at": 1547809513,
    "default_hour_rate": 0.0,
    "last_received_memories_date": null,
    "sign_in_count": null,
    "external_id": null
  },
  "project": {
    "id": 916,
    "active": true,
    "account_id": 928,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 700,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547809513,
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
  "updated_at": 1547809513,
  "created_at": 1547809513,
  "created_from": "Web",
  "updated_from": "Web",
  "billed": false,
  "to": "2019-01-18T15:35:13+01:00",
  "from": "2019-01-18T12:05:13+01:00",
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
curl -g "https://api.timelyapp.com/1.1/929/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e86206b4aa87e35f324eef09bac38e40270eed068f85d17ec6553054c6b6b04a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/929/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer e86206b4aa87e35f324eef09bac38e40270eed068f85d17ec6553054c6b6b04a
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
	-H "Authorization: Bearer 41635846a54c3345ac7a5de7c0a9db55b3a98a5cf30a7f3599b9782980dda737" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 41635846a54c3345ac7a5de7c0a9db55b3a98a5cf30a7f3599b9782980dda737
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
	-H "Authorization: Bearer 4f786a49645ca02035da359aea04e4f6eba3a56a70693d18bf7034de342f071f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4f786a49645ca02035da359aea04e4f6eba3a56a70693d18bf7034de342f071f
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
curl "https://api.timelyapp.com/1.1/939/projects/927/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c72d39f5285f541afb913cc1949c0c93fa4b3e1eddb8f99c2fdd2e6e8dde6940" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
POST /1.1/939/projects/927/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer c72d39f5285f541afb913cc1949c0c93fa4b3e1eddb8f99c2fdd2e6e8dde6940
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
curl "https://api.timelyapp.com/1.1/940/projects/928/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 314d4da35fcd9492dd530ee270a9058403b1244d963f8d3fa000cd89208369d2" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
DELETE /1.1/940/projects/928/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 314d4da35fcd9492dd530ee270a9058403b1244d963f8d3fa000cd89208369d2
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
curl -g "https://api.timelyapp.com/1.1/936/projects/924/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 811590f5ed48ef546eef7781d99c8a1adc082fc733386793b48e989d34edb4bd" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscribers`

```plaintext
GET /1.1/936/projects/924/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer 811590f5ed48ef546eef7781d99c8a1adc082fc733386793b48e989d34edb4bd
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
    "id": 2144,
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
curl -g "https://api.timelyapp.com/1.1/937/projects/925/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer cf09715d368b9bbae67737990e47c8e690b2e66e7b1516d4bb42dff26a1ad427" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/937/projects/925/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer cf09715d368b9bbae67737990e47c8e690b2e66e7b1516d4bb42dff26a1ad427
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
curl -g "https://api.timelyapp.com/1.1/938/projects/926/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c147879009f6fb34b135be1436f8d5944f1b2c3dff4ace6818f46ba52094c143" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/938/projects/926/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer c147879009f6fb34b135be1436f8d5944f1b2c3dff4ace6818f46ba52094c143
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
curl -g "https://api.timelyapp.com/1.1/951/projects/search?q=Smudge" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 744b1d25a3da8fe16309c66072e0e3e21c09bc95e0f66eabc4013faaf558e4ed" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/951/projects/search?q=Smudge
Accept: application/json
Content-Type: application/json
Authorization: Bearer 744b1d25a3da8fe16309c66072e0e3e21c09bc95e0f66eabc4013faaf558e4ed
```

#### Parameters

```json
q: Smudge
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
    "id": 947,
    "name": "Smudge",
    "color": "67a3bc",
    "active": true,
    "client": {
      "id": 723,
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
curl -g "https://api.timelyapp.com/1.1/949/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 53f99cdff6f65c259746865029cb2da5fdceb3aa22d39c6044fb13b7b26a440e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/949/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer 53f99cdff6f65c259746865029cb2da5fdceb3aa22d39c6044fb13b7b26a440e
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
    "id": 941,
    "active": true,
    "account_id": 949,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 721,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547809517,
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
        "user_id": 2170,
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
curl -g "https://api.timelyapp.com/1.1/948/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ab0c692bb890404a758140d40537e522b79f3200c9dbcc08694164d8868a2114" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/948/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer ab0c692bb890404a758140d40537e522b79f3200c9dbcc08694164d8868a2114
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
    "id": 939,
    "active": true,
    "account_id": 948,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 720,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547809516,
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
        "user_id": 2168,
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
    "id": 940,
    "active": false,
    "account_id": 948,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 720,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547809516,
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
        "user_id": 2168,
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
curl -g "https://api.timelyapp.com/1.1/950/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a1acad36943160b49b475f575da3c78000c6abad2ee97000be8dae5c81dffc54" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/950/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer a1acad36943160b49b475f575da3c78000c6abad2ee97000be8dae5c81dffc54
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
    "id": 944,
    "active": false,
    "account_id": 950,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 722,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547809517,
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
        "user_id": 2172,
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
curl "https://api.timelyapp.com/1.1/956/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":728,"budget_type":"M","budget":300,"users":[{"user_id":2184}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b8e43d0502fcce4c8a1929042776562554a0962284d37b71cfa13ff62fcf083a" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/956/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer b8e43d0502fcce4c8a1929042776562554a0962284d37b71cfa13ff62fcf083a
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":728,"budget_type":"M","budget":300,"users":[{"user_id":2184}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
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
  "id": 968,
  "active": true,
  "account_id": 956,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 728,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809518,
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
      "user_id": 2184,
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
curl "https://api.timelyapp.com/1.1/953/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":725,"users":[{"user_id":2178}],"labels":[{"label_id":202},{"label_id":203,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9cc9b6766e333e5987afea51252dcff07982b742f46f363c3524d5a24cfe5a33" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/953/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9cc9b6766e333e5987afea51252dcff07982b742f46f363c3524d5a24cfe5a33
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":725,"users":[{"user_id":2178}],"labels":[{"label_id":202},{"label_id":203,"budget":0,"required":false}]}}
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
  "id": 965,
  "active": true,
  "account_id": 953,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 725,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809518,
  "label_ids": [
    202,
    203
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
      "user_id": 2178,
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
      "label_id": 202,
      "budget": null,
      "required": false
    },
    {
      "label_id": 203,
      "budget": 0,
      "required": false
    }
  ]
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/954/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":726,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":2180}],"labels":[{"label_id":204,"budget":100,"required":false},{"label_id":205,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3f7d4a09b8bda3aaac7ab94ee9b40449283e1d8105badd58450d029464811890" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/954/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3f7d4a09b8bda3aaac7ab94ee9b40449283e1d8105badd58450d029464811890
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":726,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":2180}],"labels":[{"label_id":204,"budget":100,"required":false},{"label_id":205,"budget":200,"required":true}]}}
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
  "id": 966,
  "active": true,
  "account_id": 954,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 726,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809518,
  "label_ids": [
    204,
    205
  ],
  "required_label_ids": [
    205
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
      "user_id": 2180,
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
      "label_id": 204,
      "budget": 100,
      "required": false
    },
    {
      "label_id": 205,
      "budget": 200,
      "required": true
    }
  ]
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/955/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":727,"budget_type":"M","budget":300,"users":[{"user_id":2182}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3f52414acf97c674ff025b51c35f1f9d0f9957f826fcced6f54d45c3641f814b" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/955/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3f52414acf97c674ff025b51c35f1f9d0f9957f826fcced6f54d45c3641f814b
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":727,"budget_type":"M","budget":300,"users":[{"user_id":2182}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
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
  "id": 967,
  "active": true,
  "account_id": 955,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 727,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809518,
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
      "user_id": 2182,
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
curl -g "https://api.timelyapp.com/1.1/946/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 369b98cb1ca8c75fcfb2aba7fa572552e1a04ba6dfa2d541de78f82eb0e53664" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/946/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 369b98cb1ca8c75fcfb2aba7fa572552e1a04ba6dfa2d541de78f82eb0e53664
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
    "id": 935,
    "active": true,
    "account_id": 946,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 718,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1547809516,
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
        "user_id": 2164,
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
curl -g "https://api.timelyapp.com/1.1/947/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fc73dcc04445a681978ef91acf07bfa98fa6b795fe1ea983c660bee6fa749f8e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/947/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer fc73dcc04445a681978ef91acf07bfa98fa6b795fe1ea983c660bee6fa749f8e
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
curl "https://api.timelyapp.com/1.1/966/projects/978" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 045239f87366558241d7fcb27f263ee66a1dd0e5e6d09eccae99b22e2d24ac82" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/966/projects/978
Accept: application/json
Content-Type: application/json
Authorization: Bearer 045239f87366558241d7fcb27f263ee66a1dd0e5e6d09eccae99b22e2d24ac82
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
  "id": 978,
  "active": true,
  "account_id": 966,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 738,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809521,
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
curl "https://api.timelyapp.com/1.1/957/projects/969" -d '{"project":{"labels":[{"label_id":206},{"label_id":207,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6e9b260b4b682817530601838dadd3add8b0bfa6e95b306a6ddf5e05d589187e" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/957/projects/969
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6e9b260b4b682817530601838dadd3add8b0bfa6e95b306a6ddf5e05d589187e
```

#### Parameters


```json
{"project":{"labels":[{"label_id":206},{"label_id":207,"budget":0,"required":false}]}}
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
  "id": 969,
  "active": true,
  "account_id": 957,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 729,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809519,
  "label_ids": [
    206,
    207
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
      "label_id": 206,
      "budget": null,
      "required": false
    },
    {
      "label_id": 207,
      "budget": 0,
      "required": false
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/958/projects/970" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":208,"budget":100,"required":true},{"label_id":209,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d49d5e7161978502d23ec46e1e12a8467c894707a994e9ee9f920e78d91ccb11" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/958/projects/970
Accept: application/json
Content-Type: application/json
Authorization: Bearer d49d5e7161978502d23ec46e1e12a8467c894707a994e9ee9f920e78d91ccb11
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":208,"budget":100,"required":true},{"label_id":209,"budget":100,"required":true}]}}
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
  "id": 970,
  "active": true,
  "account_id": 958,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 730,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809519,
  "label_ids": [
    208,
    209
  ],
  "required_label_ids": [
    208,
    209
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
      "label_id": 208,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 209,
      "budget": 100,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/959/projects/971" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":210,"budget":100,"required":true},{"label_id":211,"budget":100,"required":true},{"label_id":212,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d4e4943c7d7a638149feeab3ae40538f49a6ff753b62b54255f29f30a81f2add" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/959/projects/971
Accept: application/json
Content-Type: application/json
Authorization: Bearer d4e4943c7d7a638149feeab3ae40538f49a6ff753b62b54255f29f30a81f2add
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":210,"budget":100,"required":true},{"label_id":211,"budget":100,"required":true},{"label_id":212,"budget":200,"required":true}]}}
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
  "id": 971,
  "active": true,
  "account_id": 959,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 731,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809519,
  "label_ids": [
    210,
    211,
    212
  ],
  "required_label_ids": [
    210,
    211,
    212
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
      "label_id": 210,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 211,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 212,
      "budget": 200,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/960/projects/972" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":215,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e1718ce20ab3122eef82ada090c23f81c5eef849a35f8d6d83dbb4ee833deeed" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/960/projects/972
Accept: application/json
Content-Type: application/json
Authorization: Bearer e1718ce20ab3122eef82ada090c23f81c5eef849a35f8d6d83dbb4ee833deeed
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":215,"budget":400,"required":true}]}}
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
  "id": 972,
  "active": true,
  "account_id": 960,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 732,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809519,
  "label_ids": [
    215
  ],
  "required_label_ids": [
    215
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
      "label_id": 215,
      "budget": 400,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/961/projects/973" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f9c8edf8fa551cc5f6aa6263f51db2c353e1ab769ff7e19c4a2ce6ee5fad21d6" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/961/projects/973
Accept: application/json
Content-Type: application/json
Authorization: Bearer f9c8edf8fa551cc5f6aa6263f51db2c353e1ab769ff7e19c4a2ce6ee5fad21d6
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
  "id": 973,
  "active": true,
  "account_id": 961,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 733,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809520,
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
curl "https://api.timelyapp.com/1.1/962/projects/974" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9eafc3e0b7241176a843610fa34a7192adf1d4ab97a46b845405c57e5c09092f" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/962/projects/974
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9eafc3e0b7241176a843610fa34a7192adf1d4ab97a46b845405c57e5c09092f
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
  "id": 974,
  "active": true,
  "account_id": 962,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 734,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809520,
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
curl "https://api.timelyapp.com/1.1/963/projects/975" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 013317ef2834302547c574735270338ad37fea1537eee205e59c24a7b25d24d9" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/963/projects/975
Accept: application/json
Content-Type: application/json
Authorization: Bearer 013317ef2834302547c574735270338ad37fea1537eee205e59c24a7b25d24d9
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
  "id": 975,
  "active": true,
  "account_id": 963,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 735,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1547809520,
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
curl "https://api.timelyapp.com/1.1/964/projects/976" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer abed092b6c2b62c7e479d463dbd60c6dc3fb8d581cb92580f26969c4d24797c0" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/964/projects/976
Accept: application/json
Content-Type: application/json
Authorization: Bearer abed092b6c2b62c7e479d463dbd60c6dc3fb8d581cb92580f26969c4d24797c0
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
curl "https://api.timelyapp.com/1.1/965/projects/977" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e1ad142d19b74d32c339875b963c7635933850edd7fbaf12c79c05b06e4d069c" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/965/projects/977
Accept: application/json
Content-Type: application/json
Authorization: Bearer e1ad142d19b74d32c339875b963c7635933850edd7fbaf12c79c05b06e4d069c
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
curl -g "https://api.timelyapp.com/1.1/968/suggested_entries?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ee0765a5029ea431e514ff9f1186801610743480ce03f3e6722e6a15bbc5bb39" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/968/suggested_entries?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer ee0765a5029ea431e514ff9f1186801610743480ce03f3e6722e6a15bbc5bb39
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
      487
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
      488,
      489
    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 980,
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
      490
    ],
    "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 980,
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
curl "https://api.timelyapp.com/1.1/969/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":492,"project_id":982}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 562e49293d8f0851295988a5b31d9e7b8a7fa8e69fe0174297e10f2f2a6b1859" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/969/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 562e49293d8f0851295988a5b31d9e7b8a7fa8e69fe0174297e10f2f2a6b1859
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":492,"project_id":982}]}}
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
curl -g "https://api.timelyapp.com/1.1/970/suggested_hours?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3167b17689a7428b96e8660005b093e93f1a4ccc93442f5e3c9056dcd57ef69a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/970/suggested_hours?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3167b17689a7428b96e8660005b093e93f1a4ccc93442f5e3c9056dcd57ef69a
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
    "id": 99,
    "owner": {
      "id": 963,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 983,
    "date": "2019-01-18",
    "to": "2019-01-18T15:35:22+01:00",
    "from": "2019-01-18T12:05:22+01:00",
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
    "created_at": "2019-01-18T12:05:22+01:00",
    "suggested_entry_ids": [
      495,
      496
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T12:05:22+01:00"
  }
]
```


## show


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/976/suggested_hours/111" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d81568e65bbbac6709d16b360671da95ebc0cf2d16f169253510cb21aca436d2" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
GET /1.1/976/suggested_hours/111
Accept: application/json
Content-Type: application/json
Authorization: Bearer d81568e65bbbac6709d16b360671da95ebc0cf2d16f169253510cb21aca436d2
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
  "id": 111,
  "owner": {
    "id": 969,
    "email": "notifications@timelyapp.com",
    "name": "Timely",
    "avatar": {
      "timeline": "/assets/timely_user_avatar_timeline.png",
      "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
      "medium": "/assets/timely_user_avatar_medium.png"
    }
  },
  "project_id": 989,
  "date": "2019-01-18",
  "to": "2019-01-18T15:35:24+01:00",
  "from": "2019-01-18T12:05:24+01:00",
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
  "created_at": "2019-01-18T12:05:24+01:00",
  "suggested_entry_ids": [
    519,
    520
  ],
  "version": "0.2.0",
  "updated_at": "2019-01-18T12:05:24+01:00"
}
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/972/suggested_hours?date=2019-01-18&since=2019-01-16&until=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b3f94a4251bc6e55f3167c090245319b96a3d82173e1435a698158d74135c438" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/972/suggested_hours?date=2019-01-18&amp;since=2019-01-16&amp;until=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer b3f94a4251bc6e55f3167c090245319b96a3d82173e1435a698158d74135c438
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
    "id": 103,
    "owner": {
      "id": 965,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 985,
    "date": "2019-01-18",
    "to": "2019-01-18T15:35:22+01:00",
    "from": "2019-01-18T12:05:22+01:00",
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
    "created_at": "2019-01-18T12:05:22+01:00",
    "suggested_entry_ids": [
      503,
      504
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T12:05:22+01:00"
  },
  {
    "id": 104,
    "owner": {
      "id": 965,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 985,
    "date": "2019-01-16",
    "to": "2019-01-18T15:35:22+01:00",
    "from": "2019-01-18T12:05:22+01:00",
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
    "created_at": "2019-01-18T12:05:22+01:00",
    "suggested_entry_ids": [
      505
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T12:05:22+01:00"
  }
]
```


## suggested hour ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/973/suggested_hours?date=2019-01-18&suggested_hour_ids=105" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9a36102c421c2c00c6015df05f9651b059cebdc485d36a7fd48ef342a26d3f28" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/973/suggested_hours?date=2019-01-18&amp;suggested_hour_ids=105
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9a36102c421c2c00c6015df05f9651b059cebdc485d36a7fd48ef342a26d3f28
```

#### Parameters

```json
date: 2019-01-18
suggested_hour_ids: 105
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
    "id": 105,
    "owner": {
      "id": 966,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 986,
    "date": "2019-01-18",
    "to": "2019-01-18T15:35:23+01:00",
    "from": "2019-01-18T12:05:23+01:00",
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
    "created_at": "2019-01-18T12:05:23+01:00",
    "suggested_entry_ids": [
      507,
      508
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T12:05:23+01:00"
  }
]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/974/suggested_hours/107" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 612add764f1f5c8b601c8b2fdeadf273cd8d07211e7c2996808d3fe3d5f3e5f8" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/974/suggested_hours/107
Accept: application/json
Content-Type: application/json
Authorization: Bearer 612add764f1f5c8b601c8b2fdeadf273cd8d07211e7c2996808d3fe3d5f3e5f8
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
  "id": 107,
  "owner": {
    "id": 967,
    "email": "notifications@timelyapp.com",
    "name": "Timely",
    "avatar": {
      "timeline": "/assets/timely_user_avatar_timeline.png",
      "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
      "medium": "/assets/timely_user_avatar_medium.png"
    }
  },
  "project_id": 987,
  "date": "2019-01-18",
  "to": "2019-01-18T15:35:23+01:00",
  "from": "2019-01-18T12:05:23+01:00",
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
  "created_at": "2019-01-18T12:05:23+01:00",
  "suggested_entry_ids": [
    511,
    512
  ],
  "version": "0.2.0",
  "updated_at": "2019-01-18T12:05:23+01:00"
}
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/975/suggested_hours/decline" -d '{"suggested_hour_ids":[109]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 40eb09f5cf77a218c5abd123758a52508a602358f0fade6c50028be23e8ff3f2" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/decline`

```plaintext
PUT /1.1/975/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer 40eb09f5cf77a218c5abd123758a52508a602358f0fade6c50028be23e8ff3f2
```

#### Parameters


```json
{"suggested_hour_ids":[109]}
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
curl -g "https://api.timelyapp.com/1.1/971/suggested_hours?date=2019-01-16" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1151eb27e26b60694f2b5f55d24cd6d6022eed7c10b40cb82efe8c6c008da96e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/971/suggested_hours?date=2019-01-16
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1151eb27e26b60694f2b5f55d24cd6d6022eed7c10b40cb82efe8c6c008da96e
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
    "id": 102,
    "owner": {
      "id": 964,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 984,
    "date": "2019-01-16",
    "to": "2019-01-18T15:35:22+01:00",
    "from": "2019-01-18T12:05:22+01:00",
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
    "created_at": "2019-01-18T12:05:22+01:00",
    "suggested_entry_ids": [
      501
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-18T12:05:22+01:00"
  }
]
```


# Training Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/983/training_entries" -d '{"training_entries":{"entries":[{"entry_id":526,"project_id":995}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 89c33b80a2f439aeec2d863f27f6a56d7fd4c64b654067a6e0cd8cd85485a46b" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/983/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 89c33b80a2f439aeec2d863f27f6a56d7fd4c64b654067a6e0cd8cd85485a46b
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":526,"project_id":995}]}}
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
curl -g "https://api.timelyapp.com/1.1/982/training_entries?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 08565a6e2efd3f56e44593be77c15d6dd5a1e13bbc09dbb3f1917932224bbaf0" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/training_entries`

```plaintext
GET /1.1/982/training_entries?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer 08565a6e2efd3f56e44593be77c15d6dd5a1e13bbc09dbb3f1917932224bbaf0
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
    "id": 523,
    "type": "macOS",
    "uid": "480652d8-2005-49b5-9f46-67b86ddc5bb7",
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
    "id": 524,
    "type": "macOS",
    "uid": "480652d8-2005-49b5-9f46-67b86ddc5bb7",
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
curl "https://api.timelyapp.com/1.1/984/training_entries" -d '{"training_entries":{"entries":[{"entry_id":528,"project_id":996},{"entry_id":527,"project_id":996}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 61caf13731d9d6694368253a139a6d2e2a7c45b6bcb1f74a7a7b4bc83915d38f" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/984/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 61caf13731d9d6694368253a139a6d2e2a7c45b6bcb1f74a7a7b4bc83915d38f
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":528,"project_id":996},{"entry_id":527,"project_id":996}]}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/995/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer cbb34fcd9cbe787559451aa8f0305df1ed555761807340e847d4f33ab37f6899" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/995/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer cbb34fcd9cbe787559451aa8f0305df1ed555761807340e847d4f33ab37f6899
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
curl "https://api.timelyapp.com/1.2/private/accounts/997/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b58f9bedb2719ee66c13b7bcb7d733595ecda5da3401186b91e62ce481687469" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/997/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer b58f9bedb2719ee66c13b7bcb7d733595ecda5da3401186b91e62ce481687469
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
curl "https://api.timelyapp.com/1.2/private/accounts/994/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8d9260786c7138305d33f5c6557def3b634a42cd1c40fdeb1b0205e43476cb99" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/994/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8d9260786c7138305d33f5c6557def3b634a42cd1c40fdeb1b0205e43476cb99
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
  "id": 994,
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
  "created_at": 1547809529,
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
  "firebase_auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA0ODc5MjksInYiOjAsImlhdCI6MTU0NzgwOTUyOSwiZCI6eyJ1c2VyX2lkIjoiMjI4MyIsImFjY291bnRfaWQiOiI5OTQiLCJ1c2VyX3R5cGUiOiJub3JtYWwiLCJ1aWQiOiI3MTg4MDA5NjU5ZmJhNzZhZTk5M2YxYWQ3NGU1ZWViZCJ9fQ.gM2inEgV0qfLqpUWPCIm9Ilz-QVSeiJek4PmKhS_Uqc"
}
```


## upgrade account plan to solo


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/993/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer aa91551639bd622bf9defcd02d7a72c90883dfd759e9ec0f215eece7e3a34bcb" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/993/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer aa91551639bd622bf9defcd02d7a72c90883dfd759e9ec0f215eece7e3a34bcb
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
  "id": 993,
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
  "created_at": 1547809529,
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
  "firebase_auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA0ODc5MjksInYiOjAsImlhdCI6MTU0NzgwOTUyOSwiZCI6eyJ1c2VyX2lkIjoiMjI4MSIsImFjY291bnRfaWQiOiI5OTMiLCJ1c2VyX3R5cGUiOiJub3JtYWwiLCJ1aWQiOiJlOTdkYWYyYzkzNTNhOWNiNmJlMjY0MzJiNDMxNjEyZiJ9fQ.DNjqhiV8oNZNt1LFOwREcRqUoH2rNeKba7I5IL1HndM"
}
```


## upgrade for duplicate appstore_transaction_id


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/999/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 010bc0855382f9d7c1ca8f39ca51f758d859ef2fbf7f584d45cb45a08429c22f" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/999/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 010bc0855382f9d7c1ca8f39ca51f758d859ef2fbf7f584d45cb45a08429c22f
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
    "user_id": 2038,
    "property": "has_seen_calendar_day",
    "value": "yes",
    "updated_at": "2019-01-18T12:04:58+01:00"
  },
  {
    "user_id": 2038,
    "property": "has_seen_calendar_week",
    "value": "no",
    "updated_at": "2019-01-18T12:04:58+01:00"
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
    "user_id": 2037,
    "property": "has_seen_calendar_week",
    "value": "yes",
    "updated_at": "2019-01-18T12:04:57+01:00"
  }
]
```


# Users



## Search all users with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/991/users/search?q=Quintin+Duponde" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7ffb7a53ec19234b8ec07cd3bc6e75ccb5ae8e65f6da038406eee72cdcf30007" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/search`

```plaintext
GET /1.1/991/users/search?q=Quintin+Duponde
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7ffb7a53ec19234b8ec07cd3bc6e75ccb5ae8e65f6da038406eee72cdcf30007
```

#### Parameters

```json
q: Quintin Duponde
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
    "id": 2255,
    "email": "quentin@timelyapp.com",
    "name": "Quintin Duponde",
    "active": false,
    "external_id": null,
    "avatar": {
      "large": "https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200",
      "medium": "https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50",
      "small": "https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"
    },
    "updated_at": 1547809528
  }
]
```


