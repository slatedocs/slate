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
curl "https://api.timelyapp.com/1.1/apps/6594/objects/6594" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70354880998360}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 64924d6154cf48c846adf934fb51db88cf811a2b773fd188193dec6ddf76c9df" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/6594/objects/6594
Accept: application/json
Content-Type: application/json
Authorization: Bearer 64924d6154cf48c846adf934fb51db88cf811a2b773fd188193dec6ddf76c9df
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70354880998360}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-17T12:40:47+01:00","auto_import":true,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-17T12:40:47+01:00","auto_import":false,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


## delete calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/6596/objects/6596" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70354880470540}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5300c8002ed479e8c640a0977d045b458850c0b3747ac2aa3b54512b0054ed4b" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/6596/objects/6596
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5300c8002ed479e8c640a0977d045b458850c0b3747ac2aa3b54512b0054ed4b
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70354880470540}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-17T12:40:48+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":false},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


## list objects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/6592/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 83b13e28745daac49be945ccc6b0938bbeca5e1103c6e07f06cff1baf7e25a4c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/6592/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 83b13e28745daac49be945ccc6b0938bbeca5e1103c6e07f06cff1baf7e25a4c
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":false},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":false},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


## list objects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/6593/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d3822cc0066345bf56302ce3966cf71b55ca2a861872506ea5f9f2bf556231fc" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/6593/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer d3822cc0066345bf56302ce3966cf71b55ca2a861872506ea5f9f2bf556231fc
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"object_id":"AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAAhT1AAAA","name":"Calendar","etag":"5oz8Ye3dNUGORWPMT6HxsAAAAAAV7g==","integrated":false},{"object_id":"AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAAhT2AAAA","name":"United States holidays","etag":"5oz8Ye3dNUGORWPMT6HxsAAAAAAV7w==","integrated":false},{"object_id":"AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAAhT4AAAA","name":"Birthdays","etag":"5oz8Ye3dNUGORWPMT6HxsAAAAAAV8Q==","integrated":false},{"object_id":"AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAABSmEdwAAAA=","name":"timely calendar","etag":"5oz8Ye3dNUGORWPMT6HxsAAAFKjA1Q==","integrated":false},{"object_id":"AQMkADAwATM0MDAAMS1mYWNmLTc0NTctMDACLTAwCgBGAAADRBR9GFAcnECww3HfNZ02uQcA5oz8Ye3dNUGORWPMT6HxsAAAAgEGAAAA5oz8Ye3dNUGORWPMT6HxsAAAABzE_nIAAAA=","name":"pravin cal","etag":"5oz8Ye3dNUGORWPMT6HxsAAAHMiPOg==","integrated":false}]
```


## update calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/6595/objects/6595" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70354887296240}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6210595ff32b53b1f24f0d4b59db5b0a2e58d5739b83aac9ce24e64cbb9d1a6e" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/6595/objects/6595
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6210595ff32b53b1f24f0d4b59db5b0a2e58d5739b83aac9ce24e64cbb9d1a6e
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70354887296240}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-17T12:40:48+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-17T12:40:48+01:00","auto_import":true,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


# Apps



## delete connected app


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/10602/connected/6614" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 485c28a577adec603e89b1d6f9916b0c8a9a15c62524714ec8b601f156ad91d3" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/apps/:app_id/connected/:id`

```plaintext
DELETE /1.1/apps/10602/connected/6614
Accept: application/json
Content-Type: application/json
Authorization: Bearer 485c28a577adec603e89b1d6f9916b0c8a9a15c62524714ec8b601f156ad91d3
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{}
```


## list apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 91116e89067c7773d43f8ccb64be33cb781199b53a53c53378a6ca720cec01a9" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps`

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer 91116e89067c7773d43f8ccb64be33cb781199b53a53c53378a6ca720cec01a9
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"app_id":10588,"id":"google_calendar","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-17T12:40:48+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Google Calendar entries.","provider":"Google","provider_url":"https://calendar.google.com","screenshots":["screenshots/google_calendar/screenshot1.png"],"logo_path":"apps_logo/google_calendar.png","authorize_url":"/auth/google_calendar/authorize","connected_apps_url":"/apps/10588/connected"},{"app_id":10589,"id":"office365","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-17T12:40:48+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Office 365 entries.","provider":"Microsoft","provider_url":"https://products.office.com/en-us/business/explore-office-365-for-business","screenshots":["screenshots/office365/screenshot1.png"],"logo_path":"apps_logo/office365.png","authorize_url":"/auth/office365/authorize","connected_apps_url":"/apps/10589/connected"},{"app_id":10590,"id":"gmail","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-17T12:40:48+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"See exactly how much time you spend managing your Gmail each day. All the emails you send in a day will automatically appear in your private Memory timeline for easy reference.","provider":"Google","provider_url":"https://gmail.com/","screenshots":["screenshots/gmail/screenshot1.png"],"logo_path":"apps_logo/gmail.png","authorize_url":"/auth/gmail/authorize","connected_apps_url":"/apps/10590/connected"},{"app_id":10591,"id":"moves_app","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":1,"connected_integrations_count":1,"first_created_at":"2019-01-15T12:40:48+01:00","last_imported_at":"2019-01-16T12:40:48+01:00","platforms":["ios","android"],"summary":"Track off-site meetings, travel for work and the time you spend in the office every day. Essential for on-the-go professionals who need to record where they’ve been and for how long.","provider":"Facebook","provider_url":"https://moves-app.com/","screenshots":["screenshots/moves_app/screenshot1.png","screenshots/moves_app/screenshot2.png"],"logo_path":"apps_logo/moves_app.png","authorize_url":"/auth/moves_app/authorize","connected_apps_url":"/apps/10591/connected"}]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/10592/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer cc19350ba6353a89ee9926cf317e9ebbb79e40cfe41e9e93752cc82f2221a7d1" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/10592/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer cc19350ba6353a89ee9926cf317e9ebbb79e40cfe41e9e93752cc82f2221a7d1
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":6602,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-17T12:40:49+01:00","updated_at":"2019-01-17T12:40:49+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":true,"objects_type":"calendars","objects_url":"/1.1/apps/6602/objects"}]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/10598/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8747014f4b58a60f3260425461433a9fee4842f66cdd2e660bffc95cec0f908d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/10598/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8747014f4b58a60f3260425461433a9fee4842f66cdd2e660bffc95cec0f908d
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":6609,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-17T12:40:49+01:00","updated_at":"2019-01-17T12:40:49+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":false}]
```


# BudgetRecurrences



## month recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23478/projects/23199/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer aa8864c9fd9f0f63a0eeb91fb590e17941237d0f41d651d995888f11208cbe75" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/23478/projects/23199/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer aa8864c9fd9f0f63a0eeb91fb590e17941237d0f41d651d995888f11208cbe75
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"recur":"August 2018","start_date":"2018-08-01","end_date":"2018-08-31","totals":{"duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"cost":{"fractional":40000,"formatted":"$400.00","amount":400.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0}}},{"recur":"September 2018","start_date":"2018-09-01","end_date":"2018-09-30","totals":{"duration":{"hours":5,"minutes":0,"seconds":0,"formatted":"05:00","total_hours":5.0,"total_seconds":18000,"total_minutes":300},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":50000,"formatted":"$500.00","amount":500.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"October 2018","start_date":"2018-10-01","end_date":"2018-10-31","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"November 2018","start_date":"2018-11-01","end_date":"2018-11-30","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}}]
```


## month recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23479/projects/23200/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9511b351ffb71fd3447b1474bd4e38b962184420801ef18475a7f1cbea295b4a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/23479/projects/23200/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9511b351ffb71fd3447b1474bd4e38b962184420801ef18475a7f1cbea295b4a
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"recur":"August 2018","start_date":"2018-08-01","end_date":"2018-08-31","totals":{"duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"cost":{"fractional":40000,"formatted":"$400.00","amount":400.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0}}},{"recur":"September 2018","start_date":"2018-09-01","end_date":"2018-09-30","totals":{"duration":{"hours":5,"minutes":0,"seconds":0,"formatted":"05:00","total_hours":5.0,"total_seconds":18000,"total_minutes":300},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":50000,"formatted":"$500.00","amount":500.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"October 2018","start_date":"2018-10-01","end_date":"2018-10-31","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"November 2018","start_date":"2018-11-01","end_date":"2018-11-30","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"September 2019","start_date":"2019-09-01","end_date":"2019-09-30","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":5,"minutes":0,"seconds":0,"formatted":"05:00","total_hours":5.0,"total_seconds":18000,"total_minutes":300},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":50000,"formatted":"$500.00","amount":500.0}}}]
```


## week recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23476/projects/23197/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 165f45d60c0f72fb7de3e61f61bbcca7e41d1431da4ccfd2076067a06b5ec0b5" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/23476/projects/23197/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 165f45d60c0f72fb7de3e61f61bbcca7e41d1431da4ccfd2076067a06b5ec0b5
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"recur":"33 2018","start_date":"2018-08-13","end_date":"2018-08-19","totals":{"duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"cost":{"fractional":40000,"formatted":"$400.00","amount":400.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0}}},{"recur":"35 2018","start_date":"2018-08-27","end_date":"2018-09-02","totals":{"duration":{"hours":5,"minutes":0,"seconds":0,"formatted":"05:00","total_hours":5.0,"total_seconds":18000,"total_minutes":300},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":50000,"formatted":"$500.00","amount":500.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"40 2018","start_date":"2018-10-01","end_date":"2018-10-07","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"45 2018","start_date":"2018-11-05","end_date":"2018-11-11","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}}]
```


## week recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23477/projects/23198/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e2a7d8f896289500667a9a149f390550df6517f7bb853456ceb603f4b35329ef" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/23477/projects/23198/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer e2a7d8f896289500667a9a149f390550df6517f7bb853456ceb603f4b35329ef
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"recur":"33 2018","start_date":"2018-08-13","end_date":"2018-08-19","totals":{"duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"cost":{"fractional":40000,"formatted":"$400.00","amount":400.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0}}},{"recur":"35 2018","start_date":"2018-08-27","end_date":"2018-09-02","totals":{"duration":{"hours":5,"minutes":0,"seconds":0,"formatted":"05:00","total_hours":5.0,"total_seconds":18000,"total_minutes":300},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":50000,"formatted":"$500.00","amount":500.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"40 2018","start_date":"2018-10-01","end_date":"2018-10-07","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"45 2018","start_date":"2018-11-05","end_date":"2018-11-11","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":8,"minutes":0,"seconds":0,"formatted":"08:00","total_hours":8.0,"total_seconds":28800,"total_minutes":480},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":80000,"formatted":"$800.00","amount":800.0}}},{"recur":"37 2019","start_date":"2019-09-09","end_date":"2019-09-15","totals":{"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":5,"minutes":0,"seconds":0,"formatted":"05:00","total_hours":5.0,"total_seconds":18000,"total_minutes":300},"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":50000,"formatted":"$500.00","amount":500.0}}}]
```


# Discard Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/23485/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[12005]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bad91197b0ff61ab301d3aebe7a6f60d9b6669849c353e94b135e498443be97f" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/suggested_entries/discard`

```plaintext
POST /1.1/23485/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer bad91197b0ff61ab301d3aebe7a6f60d9b6669849c353e94b135e498443be97f
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[12005]}}
```

None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{}
```


## index


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23484/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 390708d8c97ce17c1a139fafba6c74b07f6e58f06de2e324d7689840647dc4a6" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries/discarded`

```plaintext
GET /1.1/23484/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer 390708d8c97ce17c1a139fafba6c74b07f6e58f06de2e324d7689840647dc4a6
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
[{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[12004],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","projects":[],"importance":0.8,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```


## remove


### Request

```shell
curl "https://api.timelyapp.com/1.1/23486/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[12008]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 46fcec4740f59d930339adc46d370b3b72bd3bb68d8e7ce0a9240941e18545b4" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggested_entries/discard`

```plaintext
DELETE /1.1/23486/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 46fcec4740f59d930339adc46d370b3b72bd3bb68d8e7ce0a9240941e18545b4
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[12008]}}
```

None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{}
```


# Duration



## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=12009%2C12010" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d645c01fb8952590bd05f330e3337b85300ab14063c864b33663858ab9b9b19a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=12009%2C12010
Accept: application/json
Content-Type: application/json
Authorization: Bearer d645c01fb8952590bd05f330e3337b85300ab14063c864b33663858ab9b9b19a
```

#### Parameters

```json
entry_ids: 12009,12010
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
{"hours":4,"minutes":30,"seconds":0,"formatted":"04:30","total_hours":4.5,"total_seconds":16200,"total_minutes":270}
```


## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=12011%2C12012" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 57daf21e2e4b6aefabfb06e129ed935f9131f8d68665bbb33c510350320c04b9" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=12011%2C12012
Accept: application/json
Content-Type: application/json
Authorization: Bearer 57daf21e2e4b6aefabfb06e129ed935f9131f8d68665bbb33c510350320c04b9
```

#### Parameters

```json
entry_ids: 12011,12012
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
{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}
```


## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=12013%2C12014" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 42474809b3fe8961d03aebbd55337957d3dfd6afe8865f28d6bc72a54f92c0ee" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=12013%2C12014
Accept: application/json
Content-Type: application/json
Authorization: Bearer 42474809b3fe8961d03aebbd55337957d3dfd6afe8865f28d6bc72a54f92c0ee
```

#### Parameters

```json
entry_ids: 12013,12014
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
{"hours":5,"minutes":0,"seconds":0,"formatted":"05:00","total_hours":5.0,"total_seconds":18000,"total_minutes":300}
```


# Entries



## update deleted


### Request

```shell
curl "https://api.timelyapp.com/1.1/entries/12026" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f949b5e072bbd3712751002e7268c39d170d90aabaca25f957bf01f354c0cd57" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/entries/:id`

```plaintext
DELETE /1.1/entries/12026
Accept: application/json
Content-Type: application/json
Authorization: Bearer f949b5e072bbd3712751002e7268c39d170d90aabaca25f957bf01f354c0cd57
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{}
```


## with date


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?date=2019-01-19" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 27d68509691c614df55c8acdbe82f41e994ceb0f659a92f146243214692f0cde" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?date=2019-01-19
Accept: application/json
Content-Type: application/json
Authorization: Bearer 27d68509691c614df55c8acdbe82f41e994ceb0f659a92f146243214692f0cde
```

#### Parameters

```json
date: 2019-01-19
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
[{"id":12020,"type":"google_calendar","uid":"c600370a-4758-4146-a72b-9ca3bb9dda6c","title":"Meeting","note":"Discuss about future","description":"12:40 - 16:10 • Discuss about future","date":"2019-01-19","from":"2019-01-17T12:40:56+01:00","to":"2019-01-17T16:10:56+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T12:40:56+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


## with default params


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9e4b05ab9463d1340806757999d4628bd790a44a0710ae1bc01203e6bc91ab2c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9e4b05ab9463d1340806757999d4628bd790a44a0710ae1bc01203e6bc91ab2c
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
[{"id":12015,"type":"macOS","uid":"c600370a-4758-4146-a72b-9ca3bb9dda6c","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":"2019-01-17T12:40:55+01:00","to":"2019-01-17T16:10:55+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T12:40:55+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null},{"id":12016,"type":"google_calendar","uid":"c600370a-4758-4146-a72b-9ca3bb9dda6c","title":"Meeting","note":"Discuss about future","description":"12:40 - 16:10 • Discuss about future","date":"2019-01-17","from":"2019-01-17T12:40:55+01:00","to":"2019-01-17T16:10:55+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T12:40:55+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


## with entry_ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=12021%2C12023" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7061fe716dfe32ea2de81f2cd989834b5b1a8f17ec22704ddd82621660761e6a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=12021%2C12023
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7061fe716dfe32ea2de81f2cd989834b5b1a8f17ec22704ddd82621660761e6a
```

#### Parameters

```json
entry_ids: 12021,12023
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
[{"id":12021,"type":"macOS","uid":"c600370a-4758-4146-a72b-9ca3bb9dda6c","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":"2019-01-17T12:40:56+01:00","to":"2019-01-17T16:10:56+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T12:40:56+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null},{"id":12023,"type":"google_calendar","uid":"c600370a-4758-4146-a72b-9ca3bb9dda6c","title":"Meeting","note":"Discuss about future","description":"12:40 - 16:10 • Discuss about future","date":"2019-01-19","from":"2019-01-17T12:40:56+01:00","to":"2019-01-17T16:10:56+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T12:40:56+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


# Events



## hour with id


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23507/events/15722" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ffb5664014b8f249289ec36bb44d6ec126116eccd56ea1efb0cc5f35439a857b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/23507/events/15722
Accept: application/json
Content-Type: application/json
Authorization: Bearer ffb5664014b8f249289ec36bb44d6ec126116eccd56ea1efb0cc5f35439a857b
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{"id":15722,"uid":"9359e18e-f043-4f33-8f54-c92937abb2ea","user":{"id":54305,"email":"quentin@timelyapp.com","name":"Quintin Duponde","active":false,"day_view_onboarded":true,"memory_onboarded":true,"created_at":1547725260,"updated_at":1547725260,"default_hour_rate":0.0,"last_received_memories_date":null,"sign_in_count":null,"external_id":null},"project":{"id":23218,"active":true,"account_id":23507,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17525,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725260,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"labels":[]},"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"estimated_duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"cost":{"fractional":17500,"formatted":"$175.00","amount":175.0},"estimated_cost":{"fractional":20000,"formatted":"$200.00","amount":200.0},"day":"2019-01-17","note":"Notes for testing with some random #hash in it.","sequence":1,"estimated":false,"timer_state":"default","timer_started_on":0,"timer_stopped_on":0,"label_ids":[],"user_ids":[],"updated_at":1547725260,"created_at":1547725260,"created_from":"Web","updated_from":"Web","billed":false,"to":"2019-01-17T16:11:00+01:00","from":"2019-01-17T12:41:00+01:00","deleted":false,"hour_rate":50.0,"hour_rate_in_cents":5000.0,"creator_id":null,"updater_id":null,"external_id":null,"entry_ids":[],"suggestion_id":null}
```


## not found


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23508/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8ce159cf97e54919759283b2e27e22ad0bc800d1662fb99baa07cc64dec8ab59" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/23508/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8ce159cf97e54919759283b2e27e22ad0bc800d1662fb99baa07cc64dec8ab59
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
404 Not Found
```

```json
{"errors":{"message":"Not found"}}
```


# Plans



## plans for appstore


### Request

```shell
curl -g "https://api.timelyapp.com/1.2/private/plans" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8191deae657c729522785c0695baf04ccf27db9184afdf0c525a4c2c7f698cc7" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8191deae657c729522785c0695baf04ccf27db9184afdf0c525a4c2c7f698cc7
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":28,"code":"essential","name":"Essential","users_limit":0,"projects_limit":0,"grace_period":950400,"trial":1209600,"price":15,"user_price":15,"default":false,"enabled":true,"version":4,"cycle":"M","term":2592000,"campaign":"default","appstore":true,"playstore":true,"features":[{"name":"memories","days":60},{"name":"billing","days":-1}]},{"id":34,"code":"solo_v1","name":"Solo","users_limit":1,"projects_limit":3,"grace_period":950400,"trial":1209600,"price":8,"user_price":8,"default":false,"enabled":true,"version":4,"cycle":"M","term":2592000,"campaign":"default","appstore":true,"playstore":true,"features":[{"name":"memories","days":30}]}]
```


## plans for playstore


### Request

```shell
curl -g "https://api.timelyapp.com/1.2/private/plans" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 83ae8fc99ef4b5354c041ddd37aa076b8c883c8b015aafda5a6f3ab8f3fc0d27" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 83ae8fc99ef4b5354c041ddd37aa076b8c883c8b015aafda5a6f3ab8f3fc0d27
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":28,"code":"essential","name":"Essential","users_limit":0,"projects_limit":0,"grace_period":950400,"trial":1209600,"price":15,"user_price":15,"default":false,"enabled":true,"version":4,"cycle":"M","term":2592000,"campaign":"default","appstore":true,"playstore":true,"features":[{"name":"memories","days":60},{"name":"billing","days":-1}]},{"id":34,"code":"solo_v1","name":"Solo","users_limit":1,"projects_limit":3,"grace_period":950400,"trial":1209600,"price":8,"user_price":8,"default":false,"enabled":true,"version":4,"cycle":"M","term":2592000,"campaign":"default","appstore":true,"playstore":true,"features":[{"name":"memories","days":30}]}]
```


# ProjectSubscriptions



## create project subscribers


### Request

```shell
curl "https://api.timelyapp.com/1.1/23518/projects/23229/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8c4627329323d6645a9518e9c8568a35fe8c9b81aea944091952a9f7cff81ca7" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
POST /1.1/23518/projects/23229/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8c4627329323d6645a9518e9c8568a35fe8c9b81aea944091952a9f7cff81ca7
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{}
```


## delete project subscribers


### Request

```shell
curl "https://api.timelyapp.com/1.1/23519/projects/23230/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 09db4005942190d1644efa7068a84d5ab1f352ac8a013010083fc15472504045" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
DELETE /1.1/23519/projects/23230/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 09db4005942190d1644efa7068a84d5ab1f352ac8a013010083fc15472504045
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{}
```


## list subscribed users


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23515/projects/23226/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 56101d1fc26cf7b53691bd1d7944f13456a1214ebe6b71bc9f44444cebdef5be" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscribers`

```plaintext
GET /1.1/23515/projects/23226/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer 56101d1fc26cf7b53691bd1d7944f13456a1214ebe6b71bc9f44444cebdef5be
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":54321,"email":"quentin@timelyapp.com","name":"Quintin Duponde","avatar":{"timeline":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_timeline.jpg&s=","medium_retina":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","medium":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium.jpg&s="}}]
```


## show project subscription


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23516/projects/23227/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer faadc3457da9e6ad1d1ac6e2467fb17da5bf6b9f37c1ba133e7d09d0dd488002" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/23516/projects/23227/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer faadc3457da9e6ad1d1ac6e2467fb17da5bf6b9f37c1ba133e7d09d0dd488002
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{"project_budget_progress":true}
```


## show project subscription


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23517/projects/23228/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 844a9379513a185672d61ad65313eb922b031d02f2b86547b834306eb3c7e8cf" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/23517/projects/23228/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 844a9379513a185672d61ad65313eb922b031d02f2b86547b834306eb3c7e8cf
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{"project_budget_progress":false}
```


# Projects



## Search all projects with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23530/projects/search?q=Coco" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 03e792f19c9310138749560ddfcb2f66a88d818cd29aae342a2941257d585ddf" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/23530/projects/search?q=Coco
Accept: application/json
Content-Type: application/json
Authorization: Bearer 03e792f19c9310138749560ddfcb2f66a88d818cd29aae342a2941257d585ddf
```

#### Parameters

```json
q: Coco
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
[{"id":23255,"name":"Coco","color":"67a3bc","active":true,"client":{"id":17548,"name":"Timely","active":true,"external_id":null}}]
```


## active


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23528/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 35b7c5668dfd6f4d0233ea1fe6854724d07ebc3df2609ae8bdc792c46d3ff99c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/23528/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer 35b7c5668dfd6f4d0233ea1fe6854724d07ebc3df2609ae8bdc792c46d3ff99c
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
[{"id":23243,"active":true,"account_id":23528,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17546,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725265,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54347,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## all


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23527/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 66a56181b6716b8d3b063880f02a4f36467b9c5aecde3871e0c5fcd6eb7faeda" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/23527/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer 66a56181b6716b8d3b063880f02a4f36467b9c5aecde3871e0c5fcd6eb7faeda
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
[{"id":23241,"active":true,"account_id":23527,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17545,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725265,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54345,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]},{"id":23242,"active":false,"account_id":23527,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17545,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725265,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54345,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## archived


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23529/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0b73d3db3ada66d0f6511ea6dbe0a9ea4ea641f97a469d0516a408f2ff8ebb6d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/23529/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0b73d3db3ada66d0f6511ea6dbe0a9ea4ea641f97a469d0516a408f2ff8ebb6d
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
[{"id":23246,"active":false,"account_id":23529,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17547,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725265,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54349,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23535/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":17553,"budget_type":"M","budget":300,"users":[{"user_id":54361}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 291709a608158fefc4ef2a51dbe5829fc663eefe7f0731751e6e962488bbdefe" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/23535/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 291709a608158fefc4ef2a51dbe5829fc663eefe7f0731751e6e962488bbdefe
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":17553,"budget_type":"M","budget":300,"users":[{"user_id":54361}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
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
{"id":23270,"active":true,"account_id":23535,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17553,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725267,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54361,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23532/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":17550,"users":[{"user_id":54355}],"labels":[{"label_id":5378},{"label_id":5379,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2c8fc5e0a9170c90f0f3ed5ae4570812a2e5a9121af0ecf5fa1ed30734c91c10" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/23532/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2c8fc5e0a9170c90f0f3ed5ae4570812a2e5a9121af0ecf5fa1ed30734c91c10
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":17550,"users":[{"user_id":54355}],"labels":[{"label_id":5378},{"label_id":5379,"budget":0,"required":false}]}}
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
{"id":23267,"active":true,"account_id":23532,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17550,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725266,"label_ids":[5378,5379],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54355,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5378,"budget":null,"required":false},{"label_id":5379,"budget":0,"required":false}]}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23533/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":17551,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":54357}],"labels":[{"label_id":5380,"budget":100,"required":false},{"label_id":5381,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3782c55eb03ce68e5b49c3934c9e3c0c0006a4a79fb92f1a3d61f99d1a88da83" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/23533/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3782c55eb03ce68e5b49c3934c9e3c0c0006a4a79fb92f1a3d61f99d1a88da83
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":17551,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":54357}],"labels":[{"label_id":5380,"budget":100,"required":false},{"label_id":5381,"budget":200,"required":true}]}}
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
{"id":23268,"active":true,"account_id":23533,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17551,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725266,"label_ids":[5380,5381],"required_label_ids":[5381],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54357,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5380,"budget":100,"required":false},{"label_id":5381,"budget":200,"required":true}]}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23534/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":17552,"budget_type":"M","budget":300,"users":[{"user_id":54359}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 528de4bc88f5a1673afb12f833865bfbdfb80c2d0c579f392f5fdf13aa1e0a4c" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/23534/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 528de4bc88f5a1673afb12f833865bfbdfb80c2d0c579f392f5fdf13aa1e0a4c
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":17552,"budget_type":"M","budget":300,"users":[{"user_id":54359}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
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
{"id":23269,"active":true,"account_id":23534,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17552,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725267,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54359,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## mine with projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23525/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3d8bf87e7c1bc796c84cd5d5e047eebb430240cc0c8fe74d74a740ef44337a7e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/23525/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3d8bf87e7c1bc796c84cd5d5e047eebb430240cc0c8fe74d74a740ef44337a7e
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
[{"id":23237,"active":true,"account_id":23525,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17543,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725264,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":54341,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## mine without projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23526/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e31fa87fecb9834d94546a0637303565d204840f9fffe91238066985eb6ce0d5" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/23526/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer e31fa87fecb9834d94546a0637303565d204840f9fffe91238066985eb6ce0d5
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
[]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23545/projects/23280" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8dbe0b5733039fa17c2382b588ed192a05a43cb6a68ef1c6da1ae8acaf1ab9af" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23545/projects/23280
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8dbe0b5733039fa17c2382b588ed192a05a43cb6a68ef1c6da1ae8acaf1ab9af
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
{"id":23280,"active":true,"account_id":23545,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17563,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725269,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23536/projects/23271" -d '{"project":{"labels":[{"label_id":5382},{"label_id":5383,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c630d933a94a946a5e03650038e5a5399982038431e6e5547576ea65f9ce7357" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23536/projects/23271
Accept: application/json
Content-Type: application/json
Authorization: Bearer c630d933a94a946a5e03650038e5a5399982038431e6e5547576ea65f9ce7357
```

#### Parameters


```json
{"project":{"labels":[{"label_id":5382},{"label_id":5383,"budget":0,"required":false}]}}
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
{"id":23271,"active":true,"account_id":23536,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17554,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725267,"label_ids":[5382,5383],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5382,"budget":null,"required":false},{"label_id":5383,"budget":0,"required":false}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23537/projects/23272" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":5384,"budget":100,"required":true},{"label_id":5385,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5dfb28dc3ee6e630ada0f7d3804b2f4dc62aae7cb929e6ee0c3d3d82a01300a2" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23537/projects/23272
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5dfb28dc3ee6e630ada0f7d3804b2f4dc62aae7cb929e6ee0c3d3d82a01300a2
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":5384,"budget":100,"required":true},{"label_id":5385,"budget":100,"required":true}]}}
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
{"id":23272,"active":true,"account_id":23537,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17555,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725267,"label_ids":[5384,5385],"required_label_ids":[5384,5385],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":200,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5384,"budget":100,"required":true},{"label_id":5385,"budget":100,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23538/projects/23273" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":5386,"budget":100,"required":true},{"label_id":5387,"budget":100,"required":true},{"label_id":5388,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 36d4f60d38a710f9655ee6b696c8ad8b073d4ab9fc76257c1a462fa171c42171" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23538/projects/23273
Accept: application/json
Content-Type: application/json
Authorization: Bearer 36d4f60d38a710f9655ee6b696c8ad8b073d4ab9fc76257c1a462fa171c42171
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":5386,"budget":100,"required":true},{"label_id":5387,"budget":100,"required":true},{"label_id":5388,"budget":200,"required":true}]}}
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
{"id":23273,"active":true,"account_id":23538,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17556,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725268,"label_ids":[5386,5387,5388],"required_label_ids":[5386,5387,5388],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5386,"budget":100,"required":true},{"label_id":5387,"budget":100,"required":true},{"label_id":5388,"budget":200,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23539/projects/23274" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":5391,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a49927b0e85df1943dea8bd80deaea79c25db29871c1c9a94271911aa8636a03" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23539/projects/23274
Accept: application/json
Content-Type: application/json
Authorization: Bearer a49927b0e85df1943dea8bd80deaea79c25db29871c1c9a94271911aa8636a03
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":5391,"budget":400,"required":true}]}}
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
{"id":23274,"active":true,"account_id":23539,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17557,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725268,"label_ids":[5391],"required_label_ids":[5391],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5391,"budget":400,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23540/projects/23275" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2a09a74c4cf1df383370f6786d370af9efeb521791ee2f7b13a3222fedbfdba5" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23540/projects/23275
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2a09a74c4cf1df383370f6786d370af9efeb521791ee2f7b13a3222fedbfdba5
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
{"id":23275,"active":true,"account_id":23540,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17558,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725268,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23541/projects/23276" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8abb0b9f9df6f2ec8c9e1f273940cf4ef407337b1af8c15afb518b592dbbab52" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23541/projects/23276
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8abb0b9f9df6f2ec8c9e1f273940cf4ef407337b1af8c15afb518b592dbbab52
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
{"id":23276,"active":true,"account_id":23541,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17559,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725269,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23542/projects/23277" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9004f8a7a09711585967bed27a2a731093c6204037ab8b7ddaab09e5fcac7081" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23542/projects/23277
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9004f8a7a09711585967bed27a2a731093c6204037ab8b7ddaab09e5fcac7081
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
{"id":23277,"active":true,"account_id":23542,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":17560,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547725269,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23543/projects/23278" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5fcc4edafd9a9616dbdf9f4672701012672db85bf594f1c7e2be76fbbfe85851" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23543/projects/23278
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5fcc4edafd9a9616dbdf9f4672701012672db85bf594f1c7e2be76fbbfe85851
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
{"errors":{"budget_recurrence":[{"start_date":["invalid date"],"end_date":["invalid date","invalid date"],"recur":["cannot be updated"]}]}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/23544/projects/23279" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1249773c951cb8f64ad050d6cb0a0098596b6745f13eb08a0146c140990920ba" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/23544/projects/23279
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1249773c951cb8f64ad050d6cb0a0098596b6745f13eb08a0146c140990920ba
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
{"errors":{"budget_recurrence":[{"start_date":["invalid date"],"end_date":["invalid date","invalid date"]}],"budget":["cannot be changed"]}}
```


# Suggested Entries



## index


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23547/suggested_entries?date=2019-01-17" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 630a1bc2244d53c2f528486296a6dbd2d1728d45162b33e3f660f702012a872f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/23547/suggested_entries?date=2019-01-17
Accept: application/json
Content-Type: application/json
Authorization: Bearer 630a1bc2244d53c2f528486296a6dbd2d1728d45162b33e3f660f702012a872f
```

#### Parameters

```json
date: 2019-01-17
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
[{"title":"Meeting","note":"Discuss about future","date":"2019-01-17","from":null,"to":null,"description":"14:00 - 15:00 • Discuss about future","entry_ids":[12027],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","projects":[],"importance":0,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60}},{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[12028,12029],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","projects":[{"project_id":23282,"accuracy":0.8,"count":2}],"importance":0.8,"duration":{"hours":7,"minutes":0,"seconds":0,"formatted":"07:00","total_hours":7.0,"total_seconds":25200,"total_minutes":420}},{"title":"Congratulations on winning $100000","note":"You won $100000, share your netbanking details","date":"2019-01-17","from":null,"to":null,"description":" • You won $100000, share your netbanking details","entry_ids":[12030],"icon_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","icon_fallback_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","projects":[{"project_id":23282,"accuracy":0.8,"count":1}],"importance":0,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/23548/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":12032,"project_id":23284}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 82f5fbb887b3f4e52e8a9408e75edc6a1d23a0e12e19406580423294e9c1eb2e" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/23548/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 82f5fbb887b3f4e52e8a9408e75edc6a1d23a0e12e19406580423294e9c1eb2e
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":12032,"project_id":23284}]}}
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
{}
```


# Suggested Hours



## default


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23549/suggested_hours?date=2019-01-17" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0a6989e82029b48713bb8d1bf2452e3e5fcc557b3bacfe435ab8512fb9cd7330" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/23549/suggested_hours?date=2019-01-17
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0a6989e82029b48713bb8d1bf2452e3e5fcc557b3bacfe435ab8512fb9cd7330
```

#### Parameters

```json
date: 2019-01-17
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
[{"id":2554,"owner":{"id":22659,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":23285,"date":"2019-01-17","to":"2019-01-17T16:11:11+01:00","from":"2019-01-17T12:41:11+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T12:41:11+01:00","suggested_entry_ids":[12035,12036],"version":"0.2.0","updated_at":"2019-01-17T12:41:11+01:00"}]
```


## show


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23555/suggested_hours/2566" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 83281a20d4d927b7c19bdf0d8da5bd2bebc8c1a62126c92c5b4fe75cda746fbc" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
GET /1.1/23555/suggested_hours/2566
Accept: application/json
Content-Type: application/json
Authorization: Bearer 83281a20d4d927b7c19bdf0d8da5bd2bebc8c1a62126c92c5b4fe75cda746fbc
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
{"id":2566,"owner":{"id":22665,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":23291,"date":"2019-01-17","to":"2019-01-17T16:11:12+01:00","from":"2019-01-17T12:41:12+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T12:41:12+01:00","suggested_entry_ids":[12059,12060],"version":"0.2.0","updated_at":"2019-01-17T12:41:12+01:00"}
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23551/suggested_hours?date=2019-01-17&since=2019-01-15&until=2019-01-17" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e8bdb30f2ef41235c440d9b3a9bb2e30380060c244aa1dceb06dc050d8cd8c0a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/23551/suggested_hours?date=2019-01-17&amp;since=2019-01-15&amp;until=2019-01-17
Accept: application/json
Content-Type: application/json
Authorization: Bearer e8bdb30f2ef41235c440d9b3a9bb2e30380060c244aa1dceb06dc050d8cd8c0a
```

#### Parameters

```json
date: 2019-01-17
since: 2019-01-15
until: 2019-01-17
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
[{"id":2558,"owner":{"id":22661,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":23287,"date":"2019-01-17","to":"2019-01-17T16:11:11+01:00","from":"2019-01-17T12:41:11+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T12:41:11+01:00","suggested_entry_ids":[12043,12044],"version":"0.2.0","updated_at":"2019-01-17T12:41:11+01:00"},{"id":2559,"owner":{"id":22661,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":23287,"date":"2019-01-15","to":"2019-01-17T16:11:11+01:00","from":"2019-01-17T12:41:11+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T12:41:11+01:00","suggested_entry_ids":[12045],"version":"0.2.0","updated_at":"2019-01-17T12:41:11+01:00"}]
```


## suggested hour ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23552/suggested_hours?date=2019-01-17&suggested_hour_ids=2560" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0a528cb5575cec318f37f822541cbebc9b96412654377547ad79e61027ac785b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/23552/suggested_hours?date=2019-01-17&amp;suggested_hour_ids=2560
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0a528cb5575cec318f37f822541cbebc9b96412654377547ad79e61027ac785b
```

#### Parameters

```json
date: 2019-01-17
suggested_hour_ids: 2560
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
[{"id":2560,"owner":{"id":22662,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":23288,"date":"2019-01-17","to":"2019-01-17T16:11:12+01:00","from":"2019-01-17T12:41:12+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T12:41:12+01:00","suggested_entry_ids":[12047,12048],"version":"0.2.0","updated_at":"2019-01-17T12:41:12+01:00"}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/23553/suggested_hours/2562" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9e174643b41a0d6d4c2dbbdab5e853dfb2e83d205de51dde0de1358844d14696" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/23553/suggested_hours/2562
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9e174643b41a0d6d4c2dbbdab5e853dfb2e83d205de51dde0de1358844d14696
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
{"id":2562,"owner":{"id":22663,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":23289,"date":"2019-01-17","to":"2019-01-17T16:11:12+01:00","from":"2019-01-17T12:41:12+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"dismissed","source":"prediction","created_at":"2019-01-17T12:41:12+01:00","suggested_entry_ids":[12051,12052],"version":"0.2.0","updated_at":"2019-01-17T12:41:12+01:00"}
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/23554/suggested_hours/decline" -d '{"suggested_hour_ids":[2564]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 94a9a43fb8936a595f5d9c3788188facbd8fc120758965f1ba3d30f2c755d6b6" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/decline`

```plaintext
PUT /1.1/23554/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer 94a9a43fb8936a595f5d9c3788188facbd8fc120758965f1ba3d30f2c755d6b6
```

#### Parameters


```json
{"suggested_hour_ids":[2564]}
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
{}
```


## with date


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23550/suggested_hours?date=2019-01-15" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7c8a279e586fcc91408aad1b18b595e3fcf3b286e3ba8aeba0e4485846b36047" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/23550/suggested_hours?date=2019-01-15
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7c8a279e586fcc91408aad1b18b595e3fcf3b286e3ba8aeba0e4485846b36047
```

#### Parameters

```json
date: 2019-01-15
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
[{"id":2557,"owner":{"id":22660,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":23286,"date":"2019-01-15","to":"2019-01-17T16:11:11+01:00","from":"2019-01-17T12:41:11+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T12:41:11+01:00","suggested_entry_ids":[12041],"version":"0.2.0","updated_at":"2019-01-17T12:41:11+01:00"}]
```


# Training Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/23562/training_entries" -d '{"training_entries":{"entries":[{"entry_id":12066,"project_id":23297}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 55cfe49f3496db7ef1e846503ba8fe8e9bc008f9f80217a8fa6b1555b542b7e9" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/23562/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 55cfe49f3496db7ef1e846503ba8fe8e9bc008f9f80217a8fa6b1555b542b7e9
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":12066,"project_id":23297}]}}
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
{}
```


## list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23561/training_entries?date=2019-01-17" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bab5182bab34a7779f27be373d9f69aea3a53ba1bb6b3addca424cca4d7b78a7" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/training_entries`

```plaintext
GET /1.1/23561/training_entries?date=2019-01-17
Accept: application/json
Content-Type: application/json
Authorization: Bearer bab5182bab34a7779f27be373d9f69aea3a53ba1bb6b3addca424cca4d7b78a7
```

#### Parameters

```json
date: 2019-01-17
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
[{"id":12063,"type":"macOS","uid":"c600370a-4758-4146-a72b-9ca3bb9dda6c","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":"2019-01-17T10:00:00+01:00","to":"2019-01-17T12:00:00+01:00","entry_type":null,"duration":{"hours":2,"minutes":0,"seconds":0,"formatted":"02:00","total_hours":2.0,"total_seconds":7200,"total_minutes":120},"at":"2019-01-17T10:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null,"score":0.8},{"id":12064,"type":"macOS","uid":"c600370a-4758-4146-a72b-9ca3bb9dda6c","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":"2019-01-17T14:00:00+01:00","to":"2019-01-17T15:00:00+01:00","entry_type":null,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60},"at":"2019-01-17T14:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null,"score":0.6}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/23563/training_entries" -d '{"training_entries":{"entries":[{"entry_id":12068,"project_id":23298},{"entry_id":12067,"project_id":23298}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f7ada32f71844a37a2c7aceba30c3db866894238655b4bf375a61750fbf2d17c" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/23563/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer f7ada32f71844a37a2c7aceba30c3db866894238655b4bf375a61750fbf2d17c
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":12068,"project_id":23298},{"entry_id":12067,"project_id":23298}]}}
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
{}
```


# Upgrade



## upgrade account plan from web account


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/23574/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ce900a97b15c90b293dc52d5f584b1d4c8071340405e1911e74e187acb0b8ad4" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/23574/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer ce900a97b15c90b293dc52d5f584b1d4c8071340405e1911e74e187acb0b8ad4
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
{"errors":{"message":"Upgrade via appstore failed."}}
```


## upgrade account plan from web account


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/23576/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d71a76a373b2863074b3c4de9ae67bccaf77b993e122a70f36e52e09792e5906" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/23576/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer d71a76a373b2863074b3c4de9ae67bccaf77b993e122a70f36e52e09792e5906
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
{"errors":{"message":"Plan upgrade failed. You need to delete some projects,           Solo plan supports only  project."}}
```


## upgrade account plan to essential


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/23573/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer dd1220db708ddbca2ada44bee29cb4ad89420ca6ee2cd77016ca2431e5d61924" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/23573/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer dd1220db708ddbca2ada44bee29cb4ad89420ca6ee2cd77016ca2431e5d61924
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
{"id":23573,"name":"Timely","from":"Web","max_users":0,"max_projects":0,"num_users":2,"num_projects":0,"plan_id":28,"plan_name":"Essential","next_charge":"2019-02-17","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1547725278,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"essential","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA0MDM2NzgsInYiOjAsImlhdCI6MTU0NzcyNTI3OCwiZCI6eyJ1c2VyX2lkIjoiNTQ0NjAiLCJhY2NvdW50X2lkIjoiMjM1NzMiLCJ1c2VyX3R5cGUiOiJub3JtYWwiLCJ1aWQiOiI3ZDc2YWY3YzI1ZjI1NTczNWE4NWIwZTg0ZWI1NGJhNiJ9fQ._2rvQ5dlz3b89hExDtWgkfwkLrYlDulRXPnynADqOiE"}
```


## upgrade account plan to solo


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/23572/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 103d70c9c9e3d26ab4edf350e5653abd782c9271d9c0d4f79a6f3830efde632c" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/23572/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 103d70c9c9e3d26ab4edf350e5653abd782c9271d9c0d4f79a6f3830efde632c
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
{"id":23572,"name":"Timely","from":"Web","max_users":1,"max_projects":3,"num_users":2,"num_projects":0,"plan_id":34,"plan_name":"Solo","next_charge":"2019-02-17","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1547725278,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"solo_v1","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA0MDM2NzgsInYiOjAsImlhdCI6MTU0NzcyNTI3OCwiZCI6eyJ1c2VyX2lkIjoiNTQ0NTgiLCJhY2NvdW50X2lkIjoiMjM1NzIiLCJ1c2VyX3R5cGUiOiJub3JtYWwiLCJ1aWQiOiI0ODFmOWFkY2ZhZDQ4MjBkZDJlMDY4YTk0ZWJlM2VjMCJ9fQ.v0pZmPVwfIwdjDMbL84f8rimOyT1L-N3NzdKokwpCyk"}
```


## upgrade for duplicate appstore_transaction_id


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/23578/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b2c847aa12ca65da8ef383ddcb7f245d70d778790f64e147f4eacd7cb6f513bb" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/23578/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer b2c847aa12ca65da8ef383ddcb7f245d70d778790f64e147f4eacd7cb6f513bb
```

#### Parameters


```json
{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}
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
{"errors":{"message":"Current Apple ID is used by another Timely account. Please login with original Timely account, or use another Apple ID if you want to subscribe."}}
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
[{"user_id":54213,"property":"has_seen_calendar_day","value":"yes","updated_at":"2019-01-17T12:40:46+01:00"},{"user_id":54213,"property":"has_seen_calendar_week","value":"no","updated_at":"2019-01-17T12:40:46+01:00"}]
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
[{"user_id":54212,"property":"has_seen_calendar_week","value":"yes","updated_at":"2019-01-17T12:40:45+01:00"}]
```


# Users



## Search all users with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/23570/users/search?q=Ariel+Erdman" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d798967ccb6dd77c925b7e05202659acf62f7b9ae8d7540cc02c49da9dadc4d8" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/search`

```plaintext
GET /1.1/23570/users/search?q=Ariel+Erdman
Accept: application/json
Content-Type: application/json
Authorization: Bearer d798967ccb6dd77c925b7e05202659acf62f7b9ae8d7540cc02c49da9dadc4d8
```

#### Parameters

```json
q: Ariel Erdman
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
[{"id":54437,"email":"dino@gmail.com","name":"Ariel Erdman","active":false,"external_id":null,"avatar":{"large":"https://www.gravatar.com/avatar/717b8857ae9080afdff6d65e88363c77?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200","medium":"https://www.gravatar.com/avatar/717b8857ae9080afdff6d65e88363c77?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","small":"https://www.gravatar.com/avatar/717b8857ae9080afdff6d65e88363c77?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"},"updated_at":1547725277}]
```


