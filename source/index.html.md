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
curl "https://api.timelyapp.com/1.1/apps/7159/objects/7159" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70286524134000}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a11c7f33fcd4898c91a813be2d7ebdd710d51603e0996f734fd987b3d77e8de1" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/7159/objects/7159
Accept: application/json
Content-Type: application/json
Authorization: Bearer a11c7f33fcd4898c91a813be2d7ebdd710d51603e0996f734fd987b3d77e8de1
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70286524134000}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-18T11:26:17+01:00","auto_import":true,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-18T11:26:17+01:00","auto_import":false,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


## delete calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/7161/objects/7161" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70286463688360}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5c6d35ff383483dcc79ddac9619bf52ecdb79d6faf049ada1da81b0afc17eb85" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/7161/objects/7161
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5c6d35ff383483dcc79ddac9619bf52ecdb79d6faf049ada1da81b0afc17eb85
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70286463688360}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-18T11:26:18+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":false},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


## list objects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/7157/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 26e968d482c12d8eafb4f786ebca8e5e07b64313305760bf7467b0b4fe2a676e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/7157/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 26e968d482c12d8eafb4f786ebca8e5e07b64313305760bf7467b0b4fe2a676e
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
curl -g "https://api.timelyapp.com/1.1/apps/7158/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 66e9c968aa8cec154e7610881f2b6813944670a71edb3c75e00605d4a669da8c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/7158/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 66e9c968aa8cec154e7610881f2b6813944670a71edb3c75e00605d4a669da8c
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
curl "https://api.timelyapp.com/1.1/apps/7160/objects/7160" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70286505195120}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8cfe0e675e3cbc11d97c60aaf5d976dfb8b72f9134e6188710504f85343e9322" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/7160/objects/7160
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8cfe0e675e3cbc11d97c60aaf5d976dfb8b72f9134e6188710504f85343e9322
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70286505195120}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-18T11:26:17+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-18T11:26:17+01:00","auto_import":true,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


# Apps



## delete connected app


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/11494/connected/7179" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3cb1232bac3324b49939fdd3aa080116ce507de34b3da5192702cbb4975389e1" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/apps/:app_id/connected/:id`

```plaintext
DELETE /1.1/apps/11494/connected/7179
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3cb1232bac3324b49939fdd3aa080116ce507de34b3da5192702cbb4975389e1
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
	-H "Authorization: Bearer 24253a841bf6c734a748f258ae7f0f01c8c258fcd95ccd010c757bbe44cf9389" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps`

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer 24253a841bf6c734a748f258ae7f0f01c8c258fcd95ccd010c757bbe44cf9389
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"app_id":11480,"id":"google_calendar","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-18T11:26:18+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Google Calendar entries.","provider":"Google","provider_url":"https://calendar.google.com","screenshots":["screenshots/google_calendar/screenshot1.png"],"logo_path":"apps_logo/google_calendar.png","authorize_url":"/auth/google_calendar/authorize","connected_apps_url":"/apps/11480/connected"},{"app_id":11481,"id":"office365","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-18T11:26:18+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Office 365 entries.","provider":"Microsoft","provider_url":"https://products.office.com/en-us/business/explore-office-365-for-business","screenshots":["screenshots/office365/screenshot1.png"],"logo_path":"apps_logo/office365.png","authorize_url":"/auth/office365/authorize","connected_apps_url":"/apps/11481/connected"},{"app_id":11482,"id":"gmail","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-18T11:26:18+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"See exactly how much time you spend managing your Gmail each day. All the emails you send in a day will automatically appear in your private Memory timeline for easy reference.","provider":"Google","provider_url":"https://gmail.com/","screenshots":["screenshots/gmail/screenshot1.png"],"logo_path":"apps_logo/gmail.png","authorize_url":"/auth/gmail/authorize","connected_apps_url":"/apps/11482/connected"},{"app_id":11483,"id":"moves_app","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":1,"connected_integrations_count":1,"first_created_at":"2019-01-16T11:26:18+01:00","last_imported_at":"2019-01-17T11:26:18+01:00","platforms":["ios","android"],"summary":"Track off-site meetings, travel for work and the time you spend in the office every day. Essential for on-the-go professionals who need to record where they’ve been and for how long.","provider":"Facebook","provider_url":"https://moves-app.com/","screenshots":["screenshots/moves_app/screenshot1.png","screenshots/moves_app/screenshot2.png"],"logo_path":"apps_logo/moves_app.png","authorize_url":"/auth/moves_app/authorize","connected_apps_url":"/apps/11483/connected"}]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/11484/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d05a31ddc02a5abfd927bb904403dc745343203f17ccac51ecfc048efa980f45" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/11484/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer d05a31ddc02a5abfd927bb904403dc745343203f17ccac51ecfc048efa980f45
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":7167,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-18T11:26:18+01:00","updated_at":"2019-01-18T11:26:18+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":true,"objects_type":"calendars","objects_url":"/1.1/apps/7167/objects"}]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/11490/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c3c7ea1259fc54b8bef2b4ccba2d3d38291a268f3590eca926bf1d177505436e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/11490/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer c3c7ea1259fc54b8bef2b4ccba2d3d38291a268f3590eca926bf1d177505436e
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":7174,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-18T11:26:18+01:00","updated_at":"2019-01-18T11:26:18+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":false}]
```


# BudgetRecurrences



## month recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25404/projects/25130/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9011490706d009b30cfb15c99257700d3fa9c7ac8f51ebaac181f80212352e41" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/25404/projects/25130/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9011490706d009b30cfb15c99257700d3fa9c7ac8f51ebaac181f80212352e41
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
curl -g "https://api.timelyapp.com/1.1/25405/projects/25131/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7b14a041f4fc176d0805fc69bd5255e41765ede04dc75db8d7ae167393120257" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/25405/projects/25131/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7b14a041f4fc176d0805fc69bd5255e41765ede04dc75db8d7ae167393120257
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
curl -g "https://api.timelyapp.com/1.1/25402/projects/25128/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4d3bd8bb0b7879100c427470c6192b53601e300813ad36ab91e568d7399b3b0a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/25402/projects/25128/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4d3bd8bb0b7879100c427470c6192b53601e300813ad36ab91e568d7399b3b0a
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
curl -g "https://api.timelyapp.com/1.1/25403/projects/25129/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer eb6429985bac91ed694040de6c3eeb9bb80bd6d65ac51dab52bec67730f8ae17" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/25403/projects/25129/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer eb6429985bac91ed694040de6c3eeb9bb80bd6d65ac51dab52bec67730f8ae17
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
curl "https://api.timelyapp.com/1.1/25411/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[12997]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ea3a215661e4ebe2bfb11cbdfcdfa65183e26e5e03accad3a1704eb284783d63" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/suggested_entries/discard`

```plaintext
POST /1.1/25411/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer ea3a215661e4ebe2bfb11cbdfcdfa65183e26e5e03accad3a1704eb284783d63
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[12997]}}
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
curl -g "https://api.timelyapp.com/1.1/25410/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1df421166c15eaece317c9daf699c31f9f49acec836399932beefdf1aae0cd13" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries/discarded`

```plaintext
GET /1.1/25410/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1df421166c15eaece317c9daf699c31f9f49acec836399932beefdf1aae0cd13
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
[{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-18","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[12996],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","projects":[],"importance":0.8,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```


## remove


### Request

```shell
curl "https://api.timelyapp.com/1.1/25412/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[13000]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7e771dcfcf5c286cccd549cd67f09c5acf3119ca091c887f556ad34768e5ff56" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggested_entries/discard`

```plaintext
DELETE /1.1/25412/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7e771dcfcf5c286cccd549cd67f09c5acf3119ca091c887f556ad34768e5ff56
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[13000]}}
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=13001%2C13002" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8dc6191cbedc7328d7a365d34d13ad071272068abb76cc6b7e70a666bd6f2730" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=13001%2C13002
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8dc6191cbedc7328d7a365d34d13ad071272068abb76cc6b7e70a666bd6f2730
```

#### Parameters

```json
entry_ids: 13001,13002
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=13003%2C13004" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a983aaae93bec845577692536434435097e5b60e80c1968d8ad5da4e42a143c9" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=13003%2C13004
Accept: application/json
Content-Type: application/json
Authorization: Bearer a983aaae93bec845577692536434435097e5b60e80c1968d8ad5da4e42a143c9
```

#### Parameters

```json
entry_ids: 13003,13004
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=13005%2C13006" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d78b4479effc0a44ec4cd90ea236bc1a8c0cc48d58b6c4e0e558e7bc453552a3" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=13005%2C13006
Accept: application/json
Content-Type: application/json
Authorization: Bearer d78b4479effc0a44ec4cd90ea236bc1a8c0cc48d58b6c4e0e558e7bc453552a3
```

#### Parameters

```json
entry_ids: 13005,13006
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
curl "https://api.timelyapp.com/1.1/entries/13018" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer abf5c3c9a22e33991f2715063c5164ee92ca402b8c85888be7cd269ba70dabd8" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/entries/:id`

```plaintext
DELETE /1.1/entries/13018
Accept: application/json
Content-Type: application/json
Authorization: Bearer abf5c3c9a22e33991f2715063c5164ee92ca402b8c85888be7cd269ba70dabd8
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
curl -g "https://api.timelyapp.com/1.1/entries?date=2019-01-20" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b5ddcbae3da7e5f9e08ff1e84d0b8c4bf18a6d4273c0cbe6684aaae54b25c8eb" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?date=2019-01-20
Accept: application/json
Content-Type: application/json
Authorization: Bearer b5ddcbae3da7e5f9e08ff1e84d0b8c4bf18a6d4273c0cbe6684aaae54b25c8eb
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
[{"id":13012,"type":"google_calendar","uid":"2770e1bf-cf57-4f06-b751-4532df44922e","title":"Meeting","note":"Discuss about future","description":"11:26 - 14:56 • Discuss about future","date":"2019-01-20","from":"2019-01-18T11:26:25+01:00","to":"2019-01-18T14:56:25+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-18T11:26:25+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


## with default params


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2cf472c8007f68b3866bc3d473698aa5980e28174ed113ef946496ea43581e2a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2cf472c8007f68b3866bc3d473698aa5980e28174ed113ef946496ea43581e2a
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
[{"id":13007,"type":"macOS","uid":"2770e1bf-cf57-4f06-b751-4532df44922e","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-18","from":"2019-01-18T11:26:25+01:00","to":"2019-01-18T14:56:25+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-18T11:26:25+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null},{"id":13008,"type":"google_calendar","uid":"2770e1bf-cf57-4f06-b751-4532df44922e","title":"Meeting","note":"Discuss about future","description":"11:26 - 14:56 • Discuss about future","date":"2019-01-18","from":"2019-01-18T11:26:25+01:00","to":"2019-01-18T14:56:25+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-18T11:26:25+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


## with entry_ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=13013%2C13015" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 75a96acba47cb5f63b1b30e874e054c675cc68492fc768bf609e7fb210cdce1b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=13013%2C13015
Accept: application/json
Content-Type: application/json
Authorization: Bearer 75a96acba47cb5f63b1b30e874e054c675cc68492fc768bf609e7fb210cdce1b
```

#### Parameters

```json
entry_ids: 13013,13015
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
[{"id":13013,"type":"macOS","uid":"2770e1bf-cf57-4f06-b751-4532df44922e","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-18","from":"2019-01-18T11:26:25+01:00","to":"2019-01-18T14:56:25+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-18T11:26:25+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null},{"id":13015,"type":"google_calendar","uid":"2770e1bf-cf57-4f06-b751-4532df44922e","title":"Meeting","note":"Discuss about future","description":"11:26 - 14:56 • Discuss about future","date":"2019-01-20","from":"2019-01-18T11:26:25+01:00","to":"2019-01-18T14:56:25+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-18T11:26:25+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


# Events



## hour with id


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25433/events/17047" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1fcd14645b8c0c5f83f372ac7d7a85e493689dfdf06f35e71643d4d009bb34ad" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/25433/events/17047
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1fcd14645b8c0c5f83f372ac7d7a85e493689dfdf06f35e71643d4d009bb34ad
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{"id":17047,"uid":"ca5edb1d-be85-4762-a49d-20597e6f0797","user":{"id":58734,"email":"quentin@timelyapp.com","name":"Quintin Duponde","active":false,"day_view_onboarded":true,"memory_onboarded":true,"created_at":1547807190,"updated_at":1547807190,"default_hour_rate":0.0,"last_received_memories_date":null,"sign_in_count":null,"external_id":null},"project":{"id":25149,"active":true,"account_id":25433,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":18992,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807190,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"labels":[]},"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"estimated_duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"cost":{"fractional":17500,"formatted":"$175.00","amount":175.0},"estimated_cost":{"fractional":20000,"formatted":"$200.00","amount":200.0},"day":"2019-01-18","note":"Notes for testing with some random #hash in it.","sequence":1,"estimated":false,"timer_state":"default","timer_started_on":0,"timer_stopped_on":0,"label_ids":[],"user_ids":[],"updated_at":1547807190,"created_at":1547807190,"created_from":"Web","updated_from":"Web","billed":false,"to":"2019-01-18T14:56:30+01:00","from":"2019-01-18T11:26:30+01:00","deleted":false,"hour_rate":50.0,"hour_rate_in_cents":5000.0,"creator_id":null,"updater_id":null,"external_id":null,"entry_ids":[],"suggestion_id":null}
```


## not found


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25434/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4b3316fc650657c8710de484d6e176335bf687e9603b07587943afd804996924" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/25434/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4b3316fc650657c8710de484d6e176335bf687e9603b07587943afd804996924
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
	-H "Authorization: Bearer 9fb7e124628282f0a985faf6b04bd46ab8d0b4f2043432a4eb6e2b8e2a51f33b" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9fb7e124628282f0a985faf6b04bd46ab8d0b4f2043432a4eb6e2b8e2a51f33b
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
	-H "Authorization: Bearer 22a7c13d8db1f19b671dc5d13046692381804864ea6b491a00598619daf0c2c5" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 22a7c13d8db1f19b671dc5d13046692381804864ea6b491a00598619daf0c2c5
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
curl "https://api.timelyapp.com/1.1/25444/projects/25160/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6fc96030a58bacaa0972bb8f828dcdd181930fe62686965d565a671d19a73436" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
POST /1.1/25444/projects/25160/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6fc96030a58bacaa0972bb8f828dcdd181930fe62686965d565a671d19a73436
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
curl "https://api.timelyapp.com/1.1/25445/projects/25161/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 15bae6c34ff8c60d026f164ebcfe9ad092d207cd538f2e4585aaf7148848c8dc" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
DELETE /1.1/25445/projects/25161/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 15bae6c34ff8c60d026f164ebcfe9ad092d207cd538f2e4585aaf7148848c8dc
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
curl -g "https://api.timelyapp.com/1.1/25441/projects/25157/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5bb03dd6a987f4f718bf385fa22cef75b39af2d61e71d0aa23d6b3585fefe9aa" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscribers`

```plaintext
GET /1.1/25441/projects/25157/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5bb03dd6a987f4f718bf385fa22cef75b39af2d61e71d0aa23d6b3585fefe9aa
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":58750,"email":"quentin@timelyapp.com","name":"Quintin Duponde","avatar":{"timeline":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_timeline.jpg&s=","medium_retina":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","medium":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium.jpg&s="}}]
```


## show project subscription


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25442/projects/25158/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9e69385d405ac74cf61ea81c696ff8919300800bc1bd0ae954a2d1e4de49d131" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/25442/projects/25158/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9e69385d405ac74cf61ea81c696ff8919300800bc1bd0ae954a2d1e4de49d131
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
curl -g "https://api.timelyapp.com/1.1/25443/projects/25159/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a43c7272ac31798b339451349b7e598efaf25090af70bd4a38163d24bf535911" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/25443/projects/25159/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer a43c7272ac31798b339451349b7e598efaf25090af70bd4a38163d24bf535911
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
curl -g "https://api.timelyapp.com/1.1/25456/projects/search?q=Charlie" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer acfdf8d867e09ed44f795bfd61bb972529027b298041dfcc46c33664f8200149" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/25456/projects/search?q=Charlie
Accept: application/json
Content-Type: application/json
Authorization: Bearer acfdf8d867e09ed44f795bfd61bb972529027b298041dfcc46c33664f8200149
```

#### Parameters

```json
q: Charlie
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
[{"id":25180,"name":"Charlie","color":"67a3bc","active":true,"client":{"id":19015,"name":"Timely","active":true,"external_id":null}}]
```


## active


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25454/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8b8c310a9d14d7bc452d411a549447d77e98b5c3b8703e8b65d30da086696ab0" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/25454/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8b8c310a9d14d7bc452d411a549447d77e98b5c3b8703e8b65d30da086696ab0
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
[{"id":25174,"active":true,"account_id":25454,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19013,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807195,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58776,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## all


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25453/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0f67047c6cfef6bdef6a75e1d500acfc5006190495bd7460bfb9cd6580d94cba" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/25453/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0f67047c6cfef6bdef6a75e1d500acfc5006190495bd7460bfb9cd6580d94cba
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
[{"id":25172,"active":true,"account_id":25453,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19012,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807195,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58774,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]},{"id":25173,"active":false,"account_id":25453,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19012,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807195,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58774,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## archived


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25455/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e3cfb6516455c586a9b2870563ef4b936d33525e009ee53acb8c48f0833d546f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/25455/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer e3cfb6516455c586a9b2870563ef4b936d33525e009ee53acb8c48f0833d546f
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
[{"id":25177,"active":false,"account_id":25455,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19014,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807195,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58778,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25461/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":19020,"budget_type":"M","budget":300,"users":[{"user_id":58790}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6e923e2480c116cb5f4b08eb5849a973b1c06659f40bfed7de9d949997037009" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/25461/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6e923e2480c116cb5f4b08eb5849a973b1c06659f40bfed7de9d949997037009
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":19020,"budget_type":"M","budget":300,"users":[{"user_id":58790}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
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
{"id":25201,"active":true,"account_id":25461,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19020,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807197,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58790,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25458/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":19017,"users":[{"user_id":58784}],"labels":[{"label_id":5798},{"label_id":5799,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 664c5342d99ed5794f58bb96ebeb29c4a73249a281dd6ac4ad6fd9b8a0fd6fd1" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/25458/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 664c5342d99ed5794f58bb96ebeb29c4a73249a281dd6ac4ad6fd9b8a0fd6fd1
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":19017,"users":[{"user_id":58784}],"labels":[{"label_id":5798},{"label_id":5799,"budget":0,"required":false}]}}
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
{"id":25198,"active":true,"account_id":25458,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19017,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807196,"label_ids":[5798,5799],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58784,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5798,"budget":null,"required":false},{"label_id":5799,"budget":0,"required":false}]}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25459/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":19018,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":58786}],"labels":[{"label_id":5800,"budget":100,"required":false},{"label_id":5801,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 61bb4b132f61afc77378c5a92fe11240d72d7abf88132d284633810d75c09606" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/25459/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 61bb4b132f61afc77378c5a92fe11240d72d7abf88132d284633810d75c09606
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":19018,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":58786}],"labels":[{"label_id":5800,"budget":100,"required":false},{"label_id":5801,"budget":200,"required":true}]}}
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
{"id":25199,"active":true,"account_id":25459,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19018,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807197,"label_ids":[5800,5801],"required_label_ids":[5801],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58786,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5800,"budget":100,"required":false},{"label_id":5801,"budget":200,"required":true}]}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25460/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":19019,"budget_type":"M","budget":300,"users":[{"user_id":58788}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0c2115fb3495a7a8854d8ea4838cd306ae1af55cac8c885c5643667accd90bed" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/25460/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0c2115fb3495a7a8854d8ea4838cd306ae1af55cac8c885c5643667accd90bed
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":19019,"budget_type":"M","budget":300,"users":[{"user_id":58788}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
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
{"id":25200,"active":true,"account_id":25460,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19019,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807197,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58788,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## mine with projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25451/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e24a9a5679b2e2bd01400f9afcd4de3808a8dcedca089a015676e6a3d4213f34" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/25451/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer e24a9a5679b2e2bd01400f9afcd4de3808a8dcedca089a015676e6a3d4213f34
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
[{"id":25168,"active":true,"account_id":25451,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19010,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807194,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":58770,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## mine without projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25452/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0be7768b9555808d3b09187aec7a7a017177a5ca562b4357973c84dc3c73bd3d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/25452/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0be7768b9555808d3b09187aec7a7a017177a5ca562b4357973c84dc3c73bd3d
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
curl "https://api.timelyapp.com/1.1/25471/projects/25211" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f4972d287f8558b58c64b4846ed299a61f09122cfb27d23e20bfacde595f271c" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25471/projects/25211
Accept: application/json
Content-Type: application/json
Authorization: Bearer f4972d287f8558b58c64b4846ed299a61f09122cfb27d23e20bfacde595f271c
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
{"id":25211,"active":true,"account_id":25471,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19030,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807202,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25462/projects/25202" -d '{"project":{"labels":[{"label_id":5802},{"label_id":5803,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0c590e342eeea045dd36d3236ba00facb5dcd098626862d0d74f80f784d684a2" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25462/projects/25202
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0c590e342eeea045dd36d3236ba00facb5dcd098626862d0d74f80f784d684a2
```

#### Parameters


```json
{"project":{"labels":[{"label_id":5802},{"label_id":5803,"budget":0,"required":false}]}}
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
{"id":25202,"active":true,"account_id":25462,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19021,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807198,"label_ids":[5802,5803],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5802,"budget":null,"required":false},{"label_id":5803,"budget":0,"required":false}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25463/projects/25203" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":5804,"budget":100,"required":true},{"label_id":5805,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 84080162962959f1bb89fc2addbd70a3112b3b3eccc2c4d8cfbafdf9f62dc8d7" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25463/projects/25203
Accept: application/json
Content-Type: application/json
Authorization: Bearer 84080162962959f1bb89fc2addbd70a3112b3b3eccc2c4d8cfbafdf9f62dc8d7
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":5804,"budget":100,"required":true},{"label_id":5805,"budget":100,"required":true}]}}
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
{"id":25203,"active":true,"account_id":25463,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19022,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807198,"label_ids":[5804,5805],"required_label_ids":[5804,5805],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":200,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5804,"budget":100,"required":true},{"label_id":5805,"budget":100,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25464/projects/25204" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":5806,"budget":100,"required":true},{"label_id":5807,"budget":100,"required":true},{"label_id":5808,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer aa32ed33b63c740a05fa3bbded7d5715ad8386152defeb9d2a74b616351fcf4b" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25464/projects/25204
Accept: application/json
Content-Type: application/json
Authorization: Bearer aa32ed33b63c740a05fa3bbded7d5715ad8386152defeb9d2a74b616351fcf4b
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":5806,"budget":100,"required":true},{"label_id":5807,"budget":100,"required":true},{"label_id":5808,"budget":200,"required":true}]}}
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
{"id":25204,"active":true,"account_id":25464,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19023,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807198,"label_ids":[5806,5807,5808],"required_label_ids":[5806,5807,5808],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5806,"budget":100,"required":true},{"label_id":5807,"budget":100,"required":true},{"label_id":5808,"budget":200,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25465/projects/25205" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":5811,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 96b53d147241faa8812f7e2666db2ac5a5f72f395ef313cc01ff15ea158ea753" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25465/projects/25205
Accept: application/json
Content-Type: application/json
Authorization: Bearer 96b53d147241faa8812f7e2666db2ac5a5f72f395ef313cc01ff15ea158ea753
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":5811,"budget":400,"required":true}]}}
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
{"id":25205,"active":true,"account_id":25465,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19024,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807198,"label_ids":[5811],"required_label_ids":[5811],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":5811,"budget":400,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25466/projects/25206" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6dfa5da708695cd8e0d998a8bdf6b0c738376262160473d919a45f529b7b4f66" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25466/projects/25206
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6dfa5da708695cd8e0d998a8bdf6b0c738376262160473d919a45f529b7b4f66
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
{"id":25206,"active":true,"account_id":25466,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19025,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807199,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25467/projects/25207" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 492a4b753f8cc2d56975fdc00d675f87d5a4101752dce43ae0bf94843e144739" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25467/projects/25207
Accept: application/json
Content-Type: application/json
Authorization: Bearer 492a4b753f8cc2d56975fdc00d675f87d5a4101752dce43ae0bf94843e144739
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
{"id":25207,"active":true,"account_id":25467,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19026,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807200,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25468/projects/25208" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f81b431e0ce8e2427cb93dc25ab43ab8672a31d5ee7b4efea088eeb6be240d06" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25468/projects/25208
Accept: application/json
Content-Type: application/json
Authorization: Bearer f81b431e0ce8e2427cb93dc25ab43ab8672a31d5ee7b4efea088eeb6be240d06
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
{"id":25208,"active":true,"account_id":25468,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":19027,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547807200,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/25469/projects/25209" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e292542be1c2ea3849d20323ea9a8afcb62b5904388ca633530c46008b624e6d" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25469/projects/25209
Accept: application/json
Content-Type: application/json
Authorization: Bearer e292542be1c2ea3849d20323ea9a8afcb62b5904388ca633530c46008b624e6d
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
curl "https://api.timelyapp.com/1.1/25470/projects/25210" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 72de24538d793956fb1cc14e8e9c3be299419705aecce8a4742252f66f3ca618" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/25470/projects/25210
Accept: application/json
Content-Type: application/json
Authorization: Bearer 72de24538d793956fb1cc14e8e9c3be299419705aecce8a4742252f66f3ca618
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
curl -g "https://api.timelyapp.com/1.1/25473/suggested_entries?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 630ffdce495b97d898be6d1db89e3ae8cda1bbe1396115c5307a3ddb61a3c834" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/25473/suggested_entries?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer 630ffdce495b97d898be6d1db89e3ae8cda1bbe1396115c5307a3ddb61a3c834
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
[{"title":"Meeting","note":"Discuss about future","date":"2019-01-18","from":null,"to":null,"description":"14:00 - 15:00 • Discuss about future","entry_ids":[13019],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","projects":[],"importance":0,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60}},{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-18","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[13020,13021],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","projects":[{"project_id":25213,"accuracy":0.8,"count":2}],"importance":0.8,"duration":{"hours":7,"minutes":0,"seconds":0,"formatted":"07:00","total_hours":7.0,"total_seconds":25200,"total_minutes":420}},{"title":"Congratulations on winning $100000","note":"You won $100000, share your netbanking details","date":"2019-01-18","from":null,"to":null,"description":" • You won $100000, share your netbanking details","entry_ids":[13022],"icon_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","icon_fallback_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","projects":[{"project_id":25213,"accuracy":0.8,"count":1}],"importance":0,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/25474/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":13024,"project_id":25215}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a1ceea15ea8bac5caf1879aa6d52a5a52339f3524bcaec145dde68298d9353da" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/25474/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer a1ceea15ea8bac5caf1879aa6d52a5a52339f3524bcaec145dde68298d9353da
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":13024,"project_id":25215}]}}
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
curl -g "https://api.timelyapp.com/1.1/25475/suggested_hours?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e581a0c72b7092e0dd777506ec78374642ba88b607d0be389e680943240e4a9a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/25475/suggested_hours?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer e581a0c72b7092e0dd777506ec78374642ba88b607d0be389e680943240e4a9a
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
[{"id":2764,"owner":{"id":24570,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":25216,"date":"2019-01-18","to":"2019-01-18T14:56:44+01:00","from":"2019-01-18T11:26:44+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-18T11:26:44+01:00","suggested_entry_ids":[13027,13028],"version":"0.2.0","updated_at":"2019-01-18T11:26:44+01:00"}]
```


## show


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25481/suggested_hours/2776" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b56d3bcfb7ed47c6df0ca77cf5481085887bf80b3e2fb7cfb666a1b4cfbeb3e3" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
GET /1.1/25481/suggested_hours/2776
Accept: application/json
Content-Type: application/json
Authorization: Bearer b56d3bcfb7ed47c6df0ca77cf5481085887bf80b3e2fb7cfb666a1b4cfbeb3e3
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
{"id":2776,"owner":{"id":24576,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":25222,"date":"2019-01-18","to":"2019-01-18T14:56:47+01:00","from":"2019-01-18T11:26:47+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-18T11:26:47+01:00","suggested_entry_ids":[13051,13052],"version":"0.2.0","updated_at":"2019-01-18T11:26:47+01:00"}
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25477/suggested_hours?date=2019-01-18&since=2019-01-16&until=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f5a1c7fc9ab274a04504ef41512b396ad86ec04232944dbd74379234d585ed1e" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/25477/suggested_hours?date=2019-01-18&amp;since=2019-01-16&amp;until=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer f5a1c7fc9ab274a04504ef41512b396ad86ec04232944dbd74379234d585ed1e
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
[{"id":2768,"owner":{"id":24572,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":25218,"date":"2019-01-18","to":"2019-01-18T14:56:45+01:00","from":"2019-01-18T11:26:45+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-18T11:26:45+01:00","suggested_entry_ids":[13035,13036],"version":"0.2.0","updated_at":"2019-01-18T11:26:45+01:00"},{"id":2769,"owner":{"id":24572,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":25218,"date":"2019-01-16","to":"2019-01-18T14:56:45+01:00","from":"2019-01-18T11:26:45+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-18T11:26:45+01:00","suggested_entry_ids":[13037],"version":"0.2.0","updated_at":"2019-01-18T11:26:45+01:00"}]
```


## suggested hour ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25478/suggested_hours?date=2019-01-18&suggested_hour_ids=2770" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer df5159e2583c7f4becd1673c76ea32358092ea4f2c00e8ef6a21e32ccd7a590c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/25478/suggested_hours?date=2019-01-18&amp;suggested_hour_ids=2770
Accept: application/json
Content-Type: application/json
Authorization: Bearer df5159e2583c7f4becd1673c76ea32358092ea4f2c00e8ef6a21e32ccd7a590c
```

#### Parameters

```json
date: 2019-01-18
suggested_hour_ids: 2770
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
[{"id":2770,"owner":{"id":24573,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":25219,"date":"2019-01-18","to":"2019-01-18T14:56:46+01:00","from":"2019-01-18T11:26:46+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-18T11:26:46+01:00","suggested_entry_ids":[13039,13040],"version":"0.2.0","updated_at":"2019-01-18T11:26:46+01:00"}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/25479/suggested_hours/2772" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0e5e6fa34f48cfd9d825d9964505ec8b97b28d9b461cfdce2ea3af247a4c7d82" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/25479/suggested_hours/2772
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0e5e6fa34f48cfd9d825d9964505ec8b97b28d9b461cfdce2ea3af247a4c7d82
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
{"id":2772,"owner":{"id":24574,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":25220,"date":"2019-01-18","to":"2019-01-18T14:56:46+01:00","from":"2019-01-18T11:26:46+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"dismissed","source":"prediction","created_at":"2019-01-18T11:26:46+01:00","suggested_entry_ids":[13043,13044],"version":"0.2.0","updated_at":"2019-01-18T11:26:46+01:00"}
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/25480/suggested_hours/decline" -d '{"suggested_hour_ids":[2774]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f6077b83bb8d41f740625f1d2aa1a9a7b677a8ddfdaf1f9a475d483af2ce06b8" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/decline`

```plaintext
PUT /1.1/25480/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer f6077b83bb8d41f740625f1d2aa1a9a7b677a8ddfdaf1f9a475d483af2ce06b8
```

#### Parameters


```json
{"suggested_hour_ids":[2774]}
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
curl -g "https://api.timelyapp.com/1.1/25476/suggested_hours?date=2019-01-16" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8f171e289c718248cdf9aa37934a997fb9a1e221f5c68580c37e471de2a77f44" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/25476/suggested_hours?date=2019-01-16
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8f171e289c718248cdf9aa37934a997fb9a1e221f5c68580c37e471de2a77f44
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
[{"id":2767,"owner":{"id":24571,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":25217,"date":"2019-01-16","to":"2019-01-18T14:56:45+01:00","from":"2019-01-18T11:26:45+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-18T11:26:45+01:00","suggested_entry_ids":[13033],"version":"0.2.0","updated_at":"2019-01-18T11:26:45+01:00"}]
```


# Training Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/25488/training_entries" -d '{"training_entries":{"entries":[{"entry_id":13058,"project_id":25228}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0ae65d0b2eebf5ab0cf25c3ba48fa6812935002837e135638acf082d6a79f8a6" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/25488/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0ae65d0b2eebf5ab0cf25c3ba48fa6812935002837e135638acf082d6a79f8a6
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":13058,"project_id":25228}]}}
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
curl -g "https://api.timelyapp.com/1.1/25487/training_entries?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 35451893e35bfa991a6b49d3ffd8e6262cd4417bb137d38cf750115b3780fe4f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/training_entries`

```plaintext
GET /1.1/25487/training_entries?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer 35451893e35bfa991a6b49d3ffd8e6262cd4417bb137d38cf750115b3780fe4f
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
[{"id":13055,"type":"macOS","uid":"2770e1bf-cf57-4f06-b751-4532df44922e","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-18","from":"2019-01-18T10:00:00+01:00","to":"2019-01-18T12:00:00+01:00","entry_type":null,"duration":{"hours":2,"minutes":0,"seconds":0,"formatted":"02:00","total_hours":2.0,"total_seconds":7200,"total_minutes":120},"at":"2019-01-18T10:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null,"score":0.8},{"id":13056,"type":"macOS","uid":"2770e1bf-cf57-4f06-b751-4532df44922e","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-18","from":"2019-01-18T14:00:00+01:00","to":"2019-01-18T15:00:00+01:00","entry_type":null,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60},"at":"2019-01-18T14:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null,"score":0.6}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/25489/training_entries" -d '{"training_entries":{"entries":[{"entry_id":13060,"project_id":25229},{"entry_id":13059,"project_id":25229}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2b225c1ff6f98f90085bdf494cfb22917979ee788b283e219c5eced662b7edfc" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/25489/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2b225c1ff6f98f90085bdf494cfb22917979ee788b283e219c5eced662b7edfc
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":13060,"project_id":25229},{"entry_id":13059,"project_id":25229}]}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/25500/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer da45a8a03acde0e178770300c31d4aa08abfec83399cc3c2dd9d8c879d4c636d" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/25500/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer da45a8a03acde0e178770300c31d4aa08abfec83399cc3c2dd9d8c879d4c636d
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
{"errors":{"message":"Upgrade via appstore failed."}}
```


## upgrade account plan from web account


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/25502/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 042e2dfeda78aa25436703bb0803b08bf9afd94c29e6185ba1d849d462220a9a" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/25502/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 042e2dfeda78aa25436703bb0803b08bf9afd94c29e6185ba1d849d462220a9a
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
{"errors":{"message":"Plan upgrade failed. You need to delete some projects,           Solo plan supports only  project."}}
```


## upgrade account plan to essential


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/25499/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1760cae7ba9db4999cd37b747fda98bdb02bfe8ab804dc22464bedd346425b64" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/25499/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1760cae7ba9db4999cd37b747fda98bdb02bfe8ab804dc22464bedd346425b64
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
{"id":25499,"name":"Timely","from":"Web","max_users":0,"max_projects":0,"num_users":2,"num_projects":0,"plan_id":28,"plan_name":"Essential","next_charge":"2019-02-18","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1547807213,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"essential","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA0ODU2MTMsInYiOjAsImlhdCI6MTU0NzgwNzIxMywiZCI6eyJ1c2VyX2lkIjoiNTg4ODkiLCJhY2NvdW50X2lkIjoiMjU0OTkiLCJ1c2VyX3R5cGUiOiJub3JtYWwiLCJ1aWQiOiIzZDVlMDIzNTFhZTVjZDg1YmQ2MDE4OGQ3OTk2YTdhNiJ9fQ.tF_STZi7OytDv40AyxNomvnLpVZwDs_mZDiHz_6KY2I"}
```


## upgrade account plan to solo


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/25498/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ef0bd97d7b3502a90f0652dc3c6963da770ed95cde8d5e2888ef0756b989ffb0" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/25498/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer ef0bd97d7b3502a90f0652dc3c6963da770ed95cde8d5e2888ef0756b989ffb0
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
{"id":25498,"name":"Timely","from":"Web","max_users":1,"max_projects":3,"num_users":2,"num_projects":0,"plan_id":34,"plan_name":"Solo","next_charge":"2019-02-18","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1547807213,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"solo_v1","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTA0ODU2MTMsInYiOjAsImlhdCI6MTU0NzgwNzIxMywiZCI6eyJ1c2VyX2lkIjoiNTg4ODciLCJhY2NvdW50X2lkIjoiMjU0OTgiLCJ1c2VyX3R5cGUiOiJub3JtYWwiLCJ1aWQiOiI5ODE4YjQ0YTNjN2M2ZmE4NjViYjdiMmMyNmEyZThiYSJ9fQ.lmZ3gucgDmyq7Mgxk4l7uGacltsssgJAOXsdDIGzXBQ"}
```


## upgrade for duplicate appstore_transaction_id


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/25504/upgrade" -d '{"account":{"next_charge":"2019-02-18","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d9ff7d1f3cb22ff036eebb47fae77db613ff2fa0a6deaf810fc5862a7417e84c" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/25504/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer d9ff7d1f3cb22ff036eebb47fae77db613ff2fa0a6deaf810fc5862a7417e84c
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
[{"user_id":58642,"property":"has_seen_calendar_day","value":"yes","updated_at":"2019-01-18T11:26:16+01:00"},{"user_id":58642,"property":"has_seen_calendar_week","value":"no","updated_at":"2019-01-18T11:26:16+01:00"}]
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
[{"user_id":58641,"property":"has_seen_calendar_week","value":"yes","updated_at":"2019-01-18T11:26:15+01:00"}]
```


# Users



## Search all users with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/25496/users/search?q=Lawerence+O%27Hara" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c5c4b507ca25a84a0d30b9968d82f130dcdacfc094343678bd6f9864d9ab71d4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/search`

```plaintext
GET /1.1/25496/users/search?q=Lawerence+O%27Hara
Accept: application/json
Content-Type: application/json
Authorization: Bearer c5c4b507ca25a84a0d30b9968d82f130dcdacfc094343678bd6f9864d9ab71d4
```

#### Parameters

```json
q: Lawerence O&#39;Hara
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
[{"id":58863,"email":"lee@gmail.com","name":"Lawerence O'Hara","active":false,"external_id":null,"avatar":{"large":"https://www.gravatar.com/avatar/3b51941a9904ce23b87c58372d0c9aa2?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200","medium":"https://www.gravatar.com/avatar/3b51941a9904ce23b87c58372d0c9aa2?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","small":"https://www.gravatar.com/avatar/3b51941a9904ce23b87c58372d0c9aa2?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"},"updated_at":1547807211}]
```


