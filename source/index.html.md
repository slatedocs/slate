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
curl "https://api.timelyapp.com/1.1/apps/363/objects/363" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70162121661860}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9f0e65bfeb301aacc12a5163bcaada60a5fe1ed2fd38395ad4c69104e03ebe58" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/363/objects/363
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9f0e65bfeb301aacc12a5163bcaada60a5fe1ed2fd38395ad4c69104e03ebe58
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70162121661860}}
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
    "updated_at": "2019-01-21T09:20:32+01:00",
    "auto_import": true,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": true,
    "updated_at": "2019-01-21T09:20:32+01:00",
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
curl "https://api.timelyapp.com/1.1/apps/365/objects/365" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70162106422240}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3222442239a24dfb03adaa473c377dc87eaf2dad4b98179ddff0e6490d5591d1" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/365/objects/365
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3222442239a24dfb03adaa473c377dc87eaf2dad4b98179ddff0e6490d5591d1
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70162106422240}}
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
    "updated_at": "2019-01-21T09:20:32+01:00",
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
curl -g "https://api.timelyapp.com/1.1/apps/361/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4988b9fde66abb66372c08ca157db263173fa52b4d9fb992aa5ad3d1ce929ef2" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/361/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4988b9fde66abb66372c08ca157db263173fa52b4d9fb992aa5ad3d1ce929ef2
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
curl -g "https://api.timelyapp.com/1.1/apps/362/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 513a5943bb40366a8fc3df068ba830520f5e6bf11df0642f30ec9cb8bfc68f8d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/362/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 513a5943bb40366a8fc3df068ba830520f5e6bf11df0642f30ec9cb8bfc68f8d
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
curl "https://api.timelyapp.com/1.1/apps/364/objects/364" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70162104734960}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e5d42a7242256f7e2836b5d6bebc3bcc930ecdfb06e2bad05dc45ded154ea5be" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/364/objects/364
Accept: application/json
Content-Type: application/json
Authorization: Bearer e5d42a7242256f7e2836b5d6bebc3bcc930ecdfb06e2bad05dc45ded154ea5be
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70162104734960}}
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
    "updated_at": "2019-01-21T09:20:32+01:00",
    "auto_import": false,
    "project_id": 1
  },
  {
    "object_id": "anup@timelyapp.com",
    "name": "anup@timelyapp.com",
    "etag": "\"1457979055759000\"",
    "integrated": true,
    "updated_at": "2019-01-21T09:20:32+01:00",
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
curl "https://api.timelyapp.com/1.1/apps/600/connected/383" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8101c8c822573974dcb124469c21d41a0c96128cdea5de653cd791540e781e61" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/apps/:app_id/connected/:id`

```plaintext
DELETE /1.1/apps/600/connected/383
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8101c8c822573974dcb124469c21d41a0c96128cdea5de653cd791540e781e61
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
	-H "Authorization: Bearer 8d2ec84fd3fffacd37a339bbcb810433f3d68c4dcca9ce48399157ae3849c8e4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps`

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8d2ec84fd3fffacd37a339bbcb810433f3d68c4dcca9ce48399157ae3849c8e4
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
    "app_id": 586,
    "id": "google_calendar",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-21T09:20:32+01:00",
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
    "connected_apps_url": "/apps/586/connected"
  },
  {
    "app_id": 587,
    "id": "office365",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-21T09:20:32+01:00",
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
    "connected_apps_url": "/apps/587/connected"
  },
  {
    "app_id": 588,
    "id": "gmail",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-21T09:20:32+01:00",
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
    "connected_apps_url": "/apps/588/connected"
  },
  {
    "app_id": 589,
    "id": "moves_app",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 1,
    "connected_integrations_count": 1,
    "first_created_at": "2019-01-19T09:20:32+01:00",
    "last_imported_at": "2019-01-20T09:20:32+01:00",
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
    "connected_apps_url": "/apps/589/connected"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/590/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4693c201e2f9bb9dd01db2bb02a323011fdc9d135d503ab11e7465346866282d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/590/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4693c201e2f9bb9dd01db2bb02a323011fdc9d135d503ab11e7465346866282d
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
    "id": 371,
    "name": "Tom Hardy",
    "email": "tom@timelyapp.com",
    "active": true,
    "created_at": "2019-01-21T09:20:32+01:00",
    "updated_at": "2019-01-21T09:20:32+01:00",
    "last_imported_at": null,
    "disconnected": false,
    "disconnected_reason": null,
    "objects": true,
    "objects_type": "calendars",
    "objects_url": "/1.1/apps/371/objects"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/596/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7288229eb3d45569bd756a244e8311ae6d08ebed0adf186e323efdc879af2003" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/596/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7288229eb3d45569bd756a244e8311ae6d08ebed0adf186e323efdc879af2003
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
    "id": 378,
    "name": "Tom Hardy",
    "email": "tom@timelyapp.com",
    "active": true,
    "created_at": "2019-01-21T09:20:33+01:00",
    "updated_at": "2019-01-21T09:20:33+01:00",
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
curl -g "https://api.timelyapp.com/1.1/1278/projects/1279/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ce246f2aa9c9c4ecfad62f54ff007197b309faf4ce48103bde0a95895465cb05" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1278/projects/1279/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer ce246f2aa9c9c4ecfad62f54ff007197b309faf4ce48103bde0a95895465cb05
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
curl -g "https://api.timelyapp.com/1.1/1279/projects/1280/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer af95a67f9adfc7849141fec56a29b3ca8a504b67eb80b0f2b019df297fda1d0a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1279/projects/1280/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer af95a67f9adfc7849141fec56a29b3ca8a504b67eb80b0f2b019df297fda1d0a
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
curl -g "https://api.timelyapp.com/1.1/1276/projects/1277/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 87ea0581bbf01ab723ccf11b6fe59a07a779f0767dd44c6ce83485e3f8d940b4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1276/projects/1277/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 87ea0581bbf01ab723ccf11b6fe59a07a779f0767dd44c6ce83485e3f8d940b4
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
curl -g "https://api.timelyapp.com/1.1/1277/projects/1278/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 73e2cb547b19568a3d1921d876d3249863508a2d569d54b49bd709c7fb9a69dd" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1277/projects/1278/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 73e2cb547b19568a3d1921d876d3249863508a2d569d54b49bd709c7fb9a69dd
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
curl "https://api.timelyapp.com/1.1/1284/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[663]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fda081684a3284422dd97afddd70fafe566f24dde6f9dcbab7620f9dc7e19302" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/suggested_entries/discard`

```plaintext
POST /1.1/1284/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer fda081684a3284422dd97afddd70fafe566f24dde6f9dcbab7620f9dc7e19302
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[663]}}
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
curl -g "https://api.timelyapp.com/1.1/1283/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2f6af5c66c60786e68ef8c56b50ad0340fcd8a682d6b4432f312aae17b79541f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries/discarded`

```plaintext
GET /1.1/1283/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2f6af5c66c60786e68ef8c56b50ad0340fcd8a682d6b4432f312aae17b79541f
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
    "date": "2019-01-21",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      662
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
curl "https://api.timelyapp.com/1.1/1285/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[666]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5066caab04e30f452dba01578f82a927256513ed974b2eda14b9bbd12dc0c525" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggested_entries/discard`

```plaintext
DELETE /1.1/1285/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5066caab04e30f452dba01578f82a927256513ed974b2eda14b9bbd12dc0c525
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[666]}}
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=667%2C668" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a17665937033f3caf3d7cd3401f0f1786e2e9b8a10864cc4fd803dd5afd4eb3a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=667%2C668
Accept: application/json
Content-Type: application/json
Authorization: Bearer a17665937033f3caf3d7cd3401f0f1786e2e9b8a10864cc4fd803dd5afd4eb3a
```

#### Parameters

```json
entry_ids: 667,668
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=669%2C670" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8f69d2e398ae65b966061271ab18c24ec749cd790a83efed79c0756d45f5cc27" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=669%2C670
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8f69d2e398ae65b966061271ab18c24ec749cd790a83efed79c0756d45f5cc27
```

#### Parameters

```json
entry_ids: 669,670
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=671%2C672" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 82311cd88dca1a878a2c6d470432bea7dab564e189e0b5a493d5cded8ab15386" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=671%2C672
Accept: application/json
Content-Type: application/json
Authorization: Bearer 82311cd88dca1a878a2c6d470432bea7dab564e189e0b5a493d5cded8ab15386
```

#### Parameters

```json
entry_ids: 671,672
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
curl "https://api.timelyapp.com/1.1/entries/684" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b8b29d4232f34c7e8b5084143a314be5b808bc792c5dcd75ceb928b84878370c" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/entries/:id`

```plaintext
DELETE /1.1/entries/684
Accept: application/json
Content-Type: application/json
Authorization: Bearer b8b29d4232f34c7e8b5084143a314be5b808bc792c5dcd75ceb928b84878370c
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
curl -g "https://api.timelyapp.com/1.1/entries?date=2019-01-23" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 02cc3130e006c0dd620fe4abc8221d0686f973b79cfe924ba21386b29e2a8d72" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?date=2019-01-23
Accept: application/json
Content-Type: application/json
Authorization: Bearer 02cc3130e006c0dd620fe4abc8221d0686f973b79cfe924ba21386b29e2a8d72
```

#### Parameters

```json
date: 2019-01-23
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
    "id": 678,
    "type": "google_calendar",
    "uid": "24fdef29-df37-47d6-9be6-4418ea8d15c0",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "09:20 - 12:50 • Discuss about future",
    "date": "2019-01-23",
    "from": "2019-01-21T09:20:40+01:00",
    "to": "2019-01-21T12:50:40+01:00",
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
    "at": "2019-01-21T09:20:40+01:00",
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
	-H "Authorization: Bearer 2150537d8ad76116c9ffc8e97082cee012649e41c2c5f522bc26e79bfe7ea727" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2150537d8ad76116c9ffc8e97082cee012649e41c2c5f522bc26e79bfe7ea727
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
    "id": 673,
    "type": "macOS",
    "uid": "24fdef29-df37-47d6-9be6-4418ea8d15c0",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-21",
    "from": "2019-01-21T09:20:39+01:00",
    "to": "2019-01-21T12:50:39+01:00",
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
    "at": "2019-01-21T09:20:39+01:00",
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
    "id": 674,
    "type": "google_calendar",
    "uid": "24fdef29-df37-47d6-9be6-4418ea8d15c0",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "09:20 - 12:50 • Discuss about future",
    "date": "2019-01-21",
    "from": "2019-01-21T09:20:39+01:00",
    "to": "2019-01-21T12:50:39+01:00",
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
    "at": "2019-01-21T09:20:39+01:00",
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
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=679%2C681" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3f121da02cf3e0cbdb2d2f7fe2f0b68f933e89d9258be01f4317d25287cb6212" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=679%2C681
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3f121da02cf3e0cbdb2d2f7fe2f0b68f933e89d9258be01f4317d25287cb6212
```

#### Parameters

```json
entry_ids: 679,681
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
    "id": 679,
    "type": "macOS",
    "uid": "24fdef29-df37-47d6-9be6-4418ea8d15c0",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-21",
    "from": "2019-01-21T09:20:40+01:00",
    "to": "2019-01-21T12:50:40+01:00",
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
    "at": "2019-01-21T09:20:40+01:00",
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
    "id": 681,
    "type": "google_calendar",
    "uid": "24fdef29-df37-47d6-9be6-4418ea8d15c0",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "09:20 - 12:50 • Discuss about future",
    "date": "2019-01-23",
    "from": "2019-01-21T09:20:40+01:00",
    "to": "2019-01-21T12:50:40+01:00",
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
    "at": "2019-01-21T09:20:40+01:00",
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
curl -g "https://api.timelyapp.com/1.1/1306/events/914" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e987a415feb0e86f646ddbc6f6ed40060cfe8dc9d413b3a29453bce14718e001" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/1306/events/914
Accept: application/json
Content-Type: application/json
Authorization: Bearer e987a415feb0e86f646ddbc6f6ed40060cfe8dc9d413b3a29453bce14718e001
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
  "id": 914,
  "uid": "452bdeac-fff2-4183-8e8c-9a836c8019b3",
  "user": {
    "id": 2998,
    "email": "quentin@timelyapp.com",
    "name": "Quintin Duponde",
    "active": false,
    "day_view_onboarded": true,
    "memory_onboarded": true,
    "created_at": 1548058843,
    "updated_at": 1548058843,
    "default_hour_rate": 0.0,
    "last_received_memories_date": null,
    "sign_in_count": null,
    "external_id": null
  },
  "project": {
    "id": 1297,
    "active": true,
    "account_id": 1306,
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
    "updated_at": 1548058844,
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
  "day": "2019-01-21",
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
  "updated_at": 1548058844,
  "created_at": 1548058844,
  "created_from": "Web",
  "updated_from": "Web",
  "billed": false,
  "to": "2019-01-21T12:50:44+01:00",
  "from": "2019-01-21T09:20:44+01:00",
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
curl -g "https://api.timelyapp.com/1.1/1307/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fc894cc9da6b80d1d026dcaa215254dcc5dcd0b383ab111e0c41b87386bac851" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/1307/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer fc894cc9da6b80d1d026dcaa215254dcc5dcd0b383ab111e0c41b87386bac851
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
	-H "Authorization: Bearer 489f4978e735a3aa19d44e79f8e1da262f14a8bbcff4ad9c8de2e2c90ce322f3" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 489f4978e735a3aa19d44e79f8e1da262f14a8bbcff4ad9c8de2e2c90ce322f3
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
	-H "Authorization: Bearer 483de5f3b45d014637833aa0584814e01836b2de0464fa60be0cf992757fd66f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 483de5f3b45d014637833aa0584814e01836b2de0464fa60be0cf992757fd66f
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
curl "https://api.timelyapp.com/1.1/1317/projects/1308/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b7b44affcc472ab0474b4f8c00ebcaae54411dc625ad080eb02dfd78df71bf26" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
POST /1.1/1317/projects/1308/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer b7b44affcc472ab0474b4f8c00ebcaae54411dc625ad080eb02dfd78df71bf26
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
curl "https://api.timelyapp.com/1.1/1318/projects/1309/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 025901202a33b72a01328538f519baddd0ba037ba5ef5bb3d65a30ad28e5ae61" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
DELETE /1.1/1318/projects/1309/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 025901202a33b72a01328538f519baddd0ba037ba5ef5bb3d65a30ad28e5ae61
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
curl -g "https://api.timelyapp.com/1.1/1314/projects/1305/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b06bfd5bb7c44a35dd5dae00add7a373eaf702ee5b34f1107a8b5a8578996693" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscribers`

```plaintext
GET /1.1/1314/projects/1305/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer b06bfd5bb7c44a35dd5dae00add7a373eaf702ee5b34f1107a8b5a8578996693
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
    "id": 3014,
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
curl -g "https://api.timelyapp.com/1.1/1315/projects/1306/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9aa065e19120f47a8e166eb79f5600188230cd49f7ae002116c61a2dc32c888d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/1315/projects/1306/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9aa065e19120f47a8e166eb79f5600188230cd49f7ae002116c61a2dc32c888d
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
curl -g "https://api.timelyapp.com/1.1/1316/projects/1307/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a93f9acfe82eb63823fc7acc0f9211730327e190d37b909cdfa1eea33174d35b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/1316/projects/1307/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer a93f9acfe82eb63823fc7acc0f9211730327e190d37b909cdfa1eea33174d35b
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
curl -g "https://api.timelyapp.com/1.1/1329/projects/search?q=Daisy" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 75061deee2401483d08b734ac7b4467b67ed5b93fbfd078c15419177cc3a5fd5" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/1329/projects/search?q=Daisy
Accept: application/json
Content-Type: application/json
Authorization: Bearer 75061deee2401483d08b734ac7b4467b67ed5b93fbfd078c15419177cc3a5fd5
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
    "id": 1327,
    "name": "Daisy",
    "color": "67a3bc",
    "active": true,
    "client": {
      "id": 1011,
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
curl -g "https://api.timelyapp.com/1.1/1327/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6d1a3eb0c1d91b2f7a9409088a08675b019c765f337e6f91bde19fc170cee420" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1327/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6d1a3eb0c1d91b2f7a9409088a08675b019c765f337e6f91bde19fc170cee420
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
    "id": 1322,
    "active": true,
    "account_id": 1327,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 1009,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548058849,
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
        "user_id": 3040,
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
curl -g "https://api.timelyapp.com/1.1/1326/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0dc196d7cda9d627350c065e77dad1fb0f03ec03943ac0e7aa2a17a66920a05a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1326/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0dc196d7cda9d627350c065e77dad1fb0f03ec03943ac0e7aa2a17a66920a05a
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
    "id": 1320,
    "active": true,
    "account_id": 1326,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 1008,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548058849,
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
        "user_id": 3038,
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
    "id": 1321,
    "active": false,
    "account_id": 1326,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 1008,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548058849,
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
        "user_id": 3038,
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
curl -g "https://api.timelyapp.com/1.1/1328/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 254f2386bf225f96510e5cb1ecebd3301873e931027a076bf0daa1b7f2e31371" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1328/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer 254f2386bf225f96510e5cb1ecebd3301873e931027a076bf0daa1b7f2e31371
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
    "id": 1325,
    "active": false,
    "account_id": 1328,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 1010,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548058849,
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
        "user_id": 3042,
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
curl "https://api.timelyapp.com/1.1/1334/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1016,"budget_type":"M","budget":300,"users":[{"user_id":3054}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer abd260855ef5384ae068dc664fab33906294da7eff27aa1343a221c11a76b944" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1334/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer abd260855ef5384ae068dc664fab33906294da7eff27aa1343a221c11a76b944
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1016,"budget_type":"M","budget":300,"users":[{"user_id":3054}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
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
  "id": 1349,
  "active": true,
  "account_id": 1334,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1016,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058851,
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
      "user_id": 3054,
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
curl "https://api.timelyapp.com/1.1/1331/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1013,"users":[{"user_id":3048}],"labels":[{"label_id":286},{"label_id":287,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a90d41237dc5d0b441b81a5376f4431b0808abd92fb365e3bf1bba5ec6d381b5" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1331/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer a90d41237dc5d0b441b81a5376f4431b0808abd92fb365e3bf1bba5ec6d381b5
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1013,"users":[{"user_id":3048}],"labels":[{"label_id":286},{"label_id":287,"budget":0,"required":false}]}}
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
  "id": 1346,
  "active": true,
  "account_id": 1331,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1013,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058850,
  "label_ids": [
    286,
    287
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
      "user_id": 3048,
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
      "label_id": 286,
      "budget": null,
      "required": false
    },
    {
      "label_id": 287,
      "budget": 0,
      "required": false
    }
  ]
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1332/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1014,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":3050}],"labels":[{"label_id":288,"budget":100,"required":false},{"label_id":289,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b6d2d451f5937230a64dd0c33c6663a66833a17aa257a213afb08c47f53c4ba4" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1332/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer b6d2d451f5937230a64dd0c33c6663a66833a17aa257a213afb08c47f53c4ba4
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1014,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":3050}],"labels":[{"label_id":288,"budget":100,"required":false},{"label_id":289,"budget":200,"required":true}]}}
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
  "id": 1347,
  "active": true,
  "account_id": 1332,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1014,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058850,
  "label_ids": [
    288,
    289
  ],
  "required_label_ids": [
    289
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
      "user_id": 3050,
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
      "label_id": 288,
      "budget": 100,
      "required": false
    },
    {
      "label_id": 289,
      "budget": 200,
      "required": true
    }
  ]
}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1333/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1015,"budget_type":"M","budget":300,"users":[{"user_id":3052}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer aae092233bed4862423ed88877fbc389109d2887097778451064c3d2de0db3f2" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1333/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer aae092233bed4862423ed88877fbc389109d2887097778451064c3d2de0db3f2
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1015,"budget_type":"M","budget":300,"users":[{"user_id":3052}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
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
  "id": 1348,
  "active": true,
  "account_id": 1333,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1015,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058850,
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
      "user_id": 3052,
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
curl -g "https://api.timelyapp.com/1.1/1324/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 093b623208b536231625cde7acaa221daad16bbb73fefeafcfb2bcfd37d6c8d3" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1324/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 093b623208b536231625cde7acaa221daad16bbb73fefeafcfb2bcfd37d6c8d3
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
    "id": 1316,
    "active": true,
    "account_id": 1324,
    "name": "Timely",
    "color": "67a3bc",
    "rate_type": "project",
    "client": {
      "id": 1006,
      "name": "Timely",
      "active": true,
      "external_id": null
    },
    "billable": true,
    "updated_at": 1548058848,
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
        "user_id": 3034,
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
curl -g "https://api.timelyapp.com/1.1/1325/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer dce0682c17dd02e095368f8f33186e6d892b525039f43fef72938577e491d0b7" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1325/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer dce0682c17dd02e095368f8f33186e6d892b525039f43fef72938577e491d0b7
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
curl "https://api.timelyapp.com/1.1/1344/projects/1359" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f34322e12524ddce200b639ce26c803283ff8e684b9470c2a1a35d9f7a63a151" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1344/projects/1359
Accept: application/json
Content-Type: application/json
Authorization: Bearer f34322e12524ddce200b639ce26c803283ff8e684b9470c2a1a35d9f7a63a151
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
  "id": 1359,
  "active": true,
  "account_id": 1344,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1026,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058853,
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
curl "https://api.timelyapp.com/1.1/1335/projects/1350" -d '{"project":{"labels":[{"label_id":290},{"label_id":291,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a4c8f32bb09a78356f911def2374df3a38df1f0d4871cd8a29f8229694f9f4a2" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1335/projects/1350
Accept: application/json
Content-Type: application/json
Authorization: Bearer a4c8f32bb09a78356f911def2374df3a38df1f0d4871cd8a29f8229694f9f4a2
```

#### Parameters


```json
{"project":{"labels":[{"label_id":290},{"label_id":291,"budget":0,"required":false}]}}
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
  "id": 1350,
  "active": true,
  "account_id": 1335,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1017,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058851,
  "label_ids": [
    290,
    291
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
      "label_id": 290,
      "budget": null,
      "required": false
    },
    {
      "label_id": 291,
      "budget": 0,
      "required": false
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1336/projects/1351" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":292,"budget":100,"required":true},{"label_id":293,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ff74431cc08490b0aa1ddd6084272faa82741583d0253b98332de38183db6b1c" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1336/projects/1351
Accept: application/json
Content-Type: application/json
Authorization: Bearer ff74431cc08490b0aa1ddd6084272faa82741583d0253b98332de38183db6b1c
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":292,"budget":100,"required":true},{"label_id":293,"budget":100,"required":true}]}}
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
  "id": 1351,
  "active": true,
  "account_id": 1336,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1018,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058851,
  "label_ids": [
    292,
    293
  ],
  "required_label_ids": [
    292,
    293
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
      "label_id": 292,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 293,
      "budget": 100,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1337/projects/1352" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":294,"budget":100,"required":true},{"label_id":295,"budget":100,"required":true},{"label_id":296,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f9d358464b91034228c3f45c34c82a52c1cace2fdb831b88057114915dbf5bfc" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1337/projects/1352
Accept: application/json
Content-Type: application/json
Authorization: Bearer f9d358464b91034228c3f45c34c82a52c1cace2fdb831b88057114915dbf5bfc
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":294,"budget":100,"required":true},{"label_id":295,"budget":100,"required":true},{"label_id":296,"budget":200,"required":true}]}}
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
  "id": 1352,
  "active": true,
  "account_id": 1337,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1019,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058851,
  "label_ids": [
    294,
    295,
    296
  ],
  "required_label_ids": [
    294,
    295,
    296
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
      "label_id": 294,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 295,
      "budget": 100,
      "required": true
    },
    {
      "label_id": 296,
      "budget": 200,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1338/projects/1353" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":299,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 01d964600304ffa91eb725640de3d72beaf9dbc520d20b750c89ca4429c4b6ed" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1338/projects/1353
Accept: application/json
Content-Type: application/json
Authorization: Bearer 01d964600304ffa91eb725640de3d72beaf9dbc520d20b750c89ca4429c4b6ed
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":299,"budget":400,"required":true}]}}
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
  "id": 1353,
  "active": true,
  "account_id": 1338,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1020,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058852,
  "label_ids": [
    299
  ],
  "required_label_ids": [
    299
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
      "label_id": 299,
      "budget": 400,
      "required": true
    }
  ]
}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1339/projects/1354" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 38d62665f432d710d14c2d67cb79135fedc5ba59b4524650b2e821d0ac8e7db9" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1339/projects/1354
Accept: application/json
Content-Type: application/json
Authorization: Bearer 38d62665f432d710d14c2d67cb79135fedc5ba59b4524650b2e821d0ac8e7db9
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
  "id": 1354,
  "active": true,
  "account_id": 1339,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1021,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058852,
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
curl "https://api.timelyapp.com/1.1/1340/projects/1355" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9fdc58955b04d6e71bc61980684233b197ab2c61bf5e18300eda2c3d391dde43" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1340/projects/1355
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9fdc58955b04d6e71bc61980684233b197ab2c61bf5e18300eda2c3d391dde43
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
  "id": 1355,
  "active": true,
  "account_id": 1340,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1022,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058852,
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
curl "https://api.timelyapp.com/1.1/1341/projects/1356" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0495a968bdfc5d9f3a4f4c6762d42e1b5af50e59e8670c5c2ba9e71ba6603b46" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1341/projects/1356
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0495a968bdfc5d9f3a4f4c6762d42e1b5af50e59e8670c5c2ba9e71ba6603b46
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
  "id": 1356,
  "active": true,
  "account_id": 1341,
  "name": "Timely",
  "color": "67a3bc",
  "rate_type": "project",
  "client": {
    "id": 1023,
    "name": "Timely",
    "active": true,
    "external_id": null
  },
  "billable": true,
  "updated_at": 1548058852,
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
curl "https://api.timelyapp.com/1.1/1342/projects/1357" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 989e96aa0407d9763e91d0f829ce2a61d7502f7e9a3991d26c24c35316f0ae5d" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1342/projects/1357
Accept: application/json
Content-Type: application/json
Authorization: Bearer 989e96aa0407d9763e91d0f829ce2a61d7502f7e9a3991d26c24c35316f0ae5d
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
curl "https://api.timelyapp.com/1.1/1343/projects/1358" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8a8f129feb7b42e0697f60cf03e3b0d932e9884edad5bb51cbf538f4a9eee81b" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1343/projects/1358
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8a8f129feb7b42e0697f60cf03e3b0d932e9884edad5bb51cbf538f4a9eee81b
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
curl -g "https://api.timelyapp.com/1.1/1346/suggested_entries?date=2019-01-21" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c398f6f1df831f2070677dce5fc69e7c6c9b708e0ef37d41841c533f641f0557" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/1346/suggested_entries?date=2019-01-21
Accept: application/json
Content-Type: application/json
Authorization: Bearer c398f6f1df831f2070677dce5fc69e7c6c9b708e0ef37d41841c533f641f0557
```

#### Parameters

```json
date: 2019-01-21
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
    "date": "2019-01-21",
    "from": null,
    "to": null,
    "description": "14:00 - 15:00 • Discuss about future",
    "entry_ids": [
      685
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
    "date": "2019-01-21",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      686,
      687
    ],
    "icon_url": "/timeline_app_logos/macvim.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 1361,
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
    "date": "2019-01-21",
    "from": null,
    "to": null,
    "description": " • You won $100000, share your netbanking details",
    "entry_ids": [
      688
    ],
    "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
    "icon_fallback_url": "/assets/apps_logo/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png",
    "projects": [
      {
        "project_id": 1361,
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
curl "https://api.timelyapp.com/1.1/1347/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":690,"project_id":1363}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d597858859703db484bc17d6acf8e19e4c95b22b803530315265f75ebcb532e5" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/1347/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer d597858859703db484bc17d6acf8e19e4c95b22b803530315265f75ebcb532e5
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":690,"project_id":1363}]}}
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
curl -g "https://api.timelyapp.com/1.1/1348/suggested_hours?date=2019-01-21" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9baf798cf05ea9779f6c79749adba09cf56e8eb7187a6af303cb8bfd1e6b3792" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1348/suggested_hours?date=2019-01-21
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9baf798cf05ea9779f6c79749adba09cf56e8eb7187a6af303cb8bfd1e6b3792
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
    "id": 141,
    "owner": {
      "id": 1338,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1364,
    "date": "2019-01-21",
    "to": "2019-01-21T12:50:55+01:00",
    "from": "2019-01-21T09:20:55+01:00",
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
    "created_at": "2019-01-21T09:20:55+01:00",
    "suggested_entry_ids": [
      693,
      694
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-21T09:20:55+01:00"
  }
]
```


## show


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1354/suggested_hours/153" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e288617e26ab6c08578b4ace591dc9abdb108b7dde9fe9ca5d37c2bd160029df" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
GET /1.1/1354/suggested_hours/153
Accept: application/json
Content-Type: application/json
Authorization: Bearer e288617e26ab6c08578b4ace591dc9abdb108b7dde9fe9ca5d37c2bd160029df
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
  "id": 153,
  "owner": {
    "id": 1344,
    "email": "notifications@timelyapp.com",
    "name": "Timely",
    "avatar": {
      "timeline": "/assets/timely_user_avatar_timeline.png",
      "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
      "medium": "/assets/timely_user_avatar_medium.png"
    }
  },
  "project_id": 1370,
  "date": "2019-01-21",
  "to": "2019-01-21T12:50:57+01:00",
  "from": "2019-01-21T09:20:57+01:00",
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
  "created_at": "2019-01-21T09:20:57+01:00",
  "suggested_entry_ids": [
    717,
    718
  ],
  "version": "0.2.0",
  "updated_at": "2019-01-21T09:20:57+01:00"
}
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1350/suggested_hours?date=2019-01-21&since=2019-01-19&until=2019-01-21" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9ccf0ed7a500aa9ed0a3241ed6877526b9abac2db40a71e9d503d54f2731506f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1350/suggested_hours?date=2019-01-21&amp;since=2019-01-19&amp;until=2019-01-21
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9ccf0ed7a500aa9ed0a3241ed6877526b9abac2db40a71e9d503d54f2731506f
```

#### Parameters

```json
date: 2019-01-21
since: 2019-01-19
until: 2019-01-21
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
    "id": 145,
    "owner": {
      "id": 1340,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1366,
    "date": "2019-01-21",
    "to": "2019-01-21T12:50:55+01:00",
    "from": "2019-01-21T09:20:55+01:00",
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
    "created_at": "2019-01-21T09:20:55+01:00",
    "suggested_entry_ids": [
      701,
      702
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-21T09:20:55+01:00"
  },
  {
    "id": 146,
    "owner": {
      "id": 1340,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1366,
    "date": "2019-01-19",
    "to": "2019-01-21T12:50:55+01:00",
    "from": "2019-01-21T09:20:55+01:00",
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
    "created_at": "2019-01-21T09:20:55+01:00",
    "suggested_entry_ids": [
      703
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-21T09:20:55+01:00"
  }
]
```


## suggested hour ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1351/suggested_hours?date=2019-01-21&suggested_hour_ids=147" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0c49c0c2912205b3a3d770b796c0efe26cae9da5dd1e9ca8c9c353841b069665" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1351/suggested_hours?date=2019-01-21&amp;suggested_hour_ids=147
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0c49c0c2912205b3a3d770b796c0efe26cae9da5dd1e9ca8c9c353841b069665
```

#### Parameters

```json
date: 2019-01-21
suggested_hour_ids: 147
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
    "id": 147,
    "owner": {
      "id": 1341,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1367,
    "date": "2019-01-21",
    "to": "2019-01-21T12:50:56+01:00",
    "from": "2019-01-21T09:20:56+01:00",
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
    "created_at": "2019-01-21T09:20:56+01:00",
    "suggested_entry_ids": [
      705,
      706
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-21T09:20:56+01:00"
  }
]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1352/suggested_hours/149" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f3a9fe48559fce5c85594115fd30cfc0f33237417ac6331c4438224dc2cb0cd6" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/1352/suggested_hours/149
Accept: application/json
Content-Type: application/json
Authorization: Bearer f3a9fe48559fce5c85594115fd30cfc0f33237417ac6331c4438224dc2cb0cd6
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
  "id": 149,
  "owner": {
    "id": 1342,
    "email": "notifications@timelyapp.com",
    "name": "Timely",
    "avatar": {
      "timeline": "/assets/timely_user_avatar_timeline.png",
      "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
      "medium": "/assets/timely_user_avatar_medium.png"
    }
  },
  "project_id": 1368,
  "date": "2019-01-21",
  "to": "2019-01-21T12:50:56+01:00",
  "from": "2019-01-21T09:20:56+01:00",
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
  "created_at": "2019-01-21T09:20:56+01:00",
  "suggested_entry_ids": [
    709,
    710
  ],
  "version": "0.2.0",
  "updated_at": "2019-01-21T09:20:56+01:00"
}
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1353/suggested_hours/decline" -d '{"suggested_hour_ids":[151]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer febfa2c90258435b450ce0e3649b3fa8a6ddd87bcc4be7f542f0b0955290e049" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/decline`

```plaintext
PUT /1.1/1353/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer febfa2c90258435b450ce0e3649b3fa8a6ddd87bcc4be7f542f0b0955290e049
```

#### Parameters


```json
{"suggested_hour_ids":[151]}
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
curl -g "https://api.timelyapp.com/1.1/1349/suggested_hours?date=2019-01-19" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 81137fd2ff9f028d809684b4be6e96570c6a974600a1f0cafb52f96732ddc11f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1349/suggested_hours?date=2019-01-19
Accept: application/json
Content-Type: application/json
Authorization: Bearer 81137fd2ff9f028d809684b4be6e96570c6a974600a1f0cafb52f96732ddc11f
```

#### Parameters

```json
date: 2019-01-19
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
    "id": 144,
    "owner": {
      "id": 1339,
      "email": "notifications@timelyapp.com",
      "name": "Timely",
      "avatar": {
        "timeline": "/assets/timely_user_avatar_timeline.png",
        "medium_retina": "/assets/timely_user_avatar_medium_retina.png",
        "medium": "/assets/timely_user_avatar_medium.png"
      }
    },
    "project_id": 1365,
    "date": "2019-01-19",
    "to": "2019-01-21T12:50:55+01:00",
    "from": "2019-01-21T09:20:55+01:00",
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
    "created_at": "2019-01-21T09:20:55+01:00",
    "suggested_entry_ids": [
      699
    ],
    "version": "0.2.0",
    "updated_at": "2019-01-21T09:20:55+01:00"
  }
]
```


# Training Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/1361/training_entries" -d '{"training_entries":{"entries":[{"entry_id":724,"project_id":1376}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5e08716f32e5d541f06d15b9686f238e979f2b6bb6c5470964006e7e8d0e9e5d" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/1361/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5e08716f32e5d541f06d15b9686f238e979f2b6bb6c5470964006e7e8d0e9e5d
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":724,"project_id":1376}]}}
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
curl -g "https://api.timelyapp.com/1.1/1360/training_entries?date=2019-01-21" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f31b0a43aab166bbe3e6f1ac60fadb99e5a3d47da03ff7e297bf6eeb4b066426" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/training_entries`

```plaintext
GET /1.1/1360/training_entries?date=2019-01-21
Accept: application/json
Content-Type: application/json
Authorization: Bearer f31b0a43aab166bbe3e6f1ac60fadb99e5a3d47da03ff7e297bf6eeb4b066426
```

#### Parameters

```json
date: 2019-01-21
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
    "id": 721,
    "type": "macOS",
    "uid": "24fdef29-df37-47d6-9be6-4418ea8d15c0",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-21",
    "from": "2019-01-21T10:00:00+01:00",
    "to": "2019-01-21T12:00:00+01:00",
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
    "at": "2019-01-21T10:00:00+01:00",
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
    "id": 722,
    "type": "macOS",
    "uid": "24fdef29-df37-47d6-9be6-4418ea8d15c0",
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2019-01-21",
    "from": "2019-01-21T14:00:00+01:00",
    "to": "2019-01-21T15:00:00+01:00",
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
    "at": "2019-01-21T14:00:00+01:00",
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
curl "https://api.timelyapp.com/1.1/1362/training_entries" -d '{"training_entries":{"entries":[{"entry_id":726,"project_id":1377},{"entry_id":725,"project_id":1377}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer da3483feaaeff81089e0eb7708ff5a0aa4a277f51b7a690eaaa46000069889d6" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/1362/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer da3483feaaeff81089e0eb7708ff5a0aa4a277f51b7a690eaaa46000069889d6
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":726,"project_id":1377},{"entry_id":725,"project_id":1377}]}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/1373/upgrade" -d '{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b18bfd6e5f0cb3ce0d1b01402685d0eeb1394c6586a7ab56acd3cb079d0abfb6" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1373/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer b18bfd6e5f0cb3ce0d1b01402685d0eeb1394c6586a7ab56acd3cb079d0abfb6
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/1375/upgrade" -d '{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bb8ffd183d3dc01854d17d4d23255ae23c18e9b379a98dbf66963ca97cf915ff" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1375/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer bb8ffd183d3dc01854d17d4d23255ae23c18e9b379a98dbf66963ca97cf915ff
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/1372/upgrade" -d '{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5e961a2f1bcd4e3ed45b36ea7a541ddfdd393f37532f9928d11d5ed59301a18a" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1372/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5e961a2f1bcd4e3ed45b36ea7a541ddfdd393f37532f9928d11d5ed59301a18a
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
  "id": 1372,
  "name": "Timely",
  "from": "Web",
  "max_users": 0,
  "max_projects": 0,
  "num_users": 2,
  "num_projects": 0,
  "plan_id": 28,
  "plan_name": "Essential",
  "next_charge": "2019-02-21",
  "currency": {
    "id": "usd",
    "name": "United States Dollar",
    "iso_code": "USD",
    "symbol": "$",
    "symbol_first": true
  },
  "start_of_week": 0,
  "beta": false,
  "created_at": 1548058862,
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
  "firebase_auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA3MzcyNjIsInYiOjAsImlhdCI6MTU0ODA1ODg2MiwiZCI6eyJ1c2VyX2lkIjoiMzE1MyIsImFjY291bnRfaWQiOiIxMzcyIiwidXNlcl90eXBlIjoibm9ybWFsIiwidWlkIjoiYzkwODVhMjAyMDZiZDI2ZmVmNjAwMGQxODhjNjNiZDkifX0.p4QhkkT6mxfaT0WFyVMl5uIy7fmh3zG22seMDx6JPfw"
}
```


## upgrade account plan to solo


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1371/upgrade" -d '{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a0316a68c4f520eac78e5b5862035ed6c660773e510efb888b1665612313f584" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1371/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer a0316a68c4f520eac78e5b5862035ed6c660773e510efb888b1665612313f584
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
  "id": 1371,
  "name": "Timely",
  "from": "Web",
  "max_users": 1,
  "max_projects": 3,
  "num_users": 2,
  "num_projects": 0,
  "plan_id": 34,
  "plan_name": "Solo",
  "next_charge": "2019-02-21",
  "currency": {
    "id": "usd",
    "name": "United States Dollar",
    "iso_code": "USD",
    "symbol": "$",
    "symbol_first": true
  },
  "start_of_week": 0,
  "beta": false,
  "created_at": 1548058861,
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
  "firebase_auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA3MzcyNjIsInYiOjAsImlhdCI6MTU0ODA1ODg2MiwiZCI6eyJ1c2VyX2lkIjoiMzE1MSIsImFjY291bnRfaWQiOiIxMzcxIiwidXNlcl90eXBlIjoibm9ybWFsIiwidWlkIjoiNzUyNjBlZmU3ODY0MjE5OTcxNTcwOWQxMzk3MzgxYjUifX0.4g8fl179Q_lNeLWzMwSDlYTyEyalWFU0DntzyJLbRNQ"
}
```


## upgrade for duplicate appstore_transaction_id


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1377/upgrade" -d '{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7c53a554c50626b8967dfac217cb11d57ced57625d19109e8b0f1989a8e28569" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1377/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7c53a554c50626b8967dfac217cb11d57ced57625d19109e8b0f1989a8e28569
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-21","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}
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
    "user_id": 2908,
    "property": "has_seen_calendar_day",
    "value": "yes",
    "updated_at": "2019-01-21T09:20:30+01:00"
  },
  {
    "user_id": 2908,
    "property": "has_seen_calendar_week",
    "value": "no",
    "updated_at": "2019-01-21T09:20:30+01:00"
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
    "user_id": 2907,
    "property": "has_seen_calendar_week",
    "value": "yes",
    "updated_at": "2019-01-21T09:20:30+01:00"
  }
]
```


# Users



## Search all users with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1369/users/search?q=Carman+Welch" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d994700f5455eb73c7ea3b502dba7aaf1e7f015fd12e65ec3e33ac557d24ffa0" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/search`

```plaintext
GET /1.1/1369/users/search?q=Carman+Welch
Accept: application/json
Content-Type: application/json
Authorization: Bearer d994700f5455eb73c7ea3b502dba7aaf1e7f015fd12e65ec3e33ac557d24ffa0
```

#### Parameters

```json
q: Carman Welch
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
    "id": 3134,
    "email": "brian.hackett@yahoo.com",
    "name": "Carman Welch",
    "active": false,
    "external_id": null,
    "avatar": {
      "large": "https://www.gravatar.com/avatar/8af7b3913905d0ed7b7e3e0e89ba7cd6?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200",
      "medium": "https://www.gravatar.com/avatar/8af7b3913905d0ed7b7e3e0e89ba7cd6?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50",
      "small": "https://www.gravatar.com/avatar/8af7b3913905d0ed7b7e3e0e89ba7cd6?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"
    },
    "updated_at": 1548058861
  }
]
```


