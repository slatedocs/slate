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
curl "https://api.timelyapp.com/1.1/apps/474/objects/474" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70352124443600}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2881ee139462c4eac985f0508269854ec43317c7fef9bc920ff73e59913da040" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/474/objects/474
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2881ee139462c4eac985f0508269854ec43317c7fef9bc920ff73e59913da040
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70352124443600}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-17T11:20:43+01:00","auto_import":true,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-17T11:20:43+01:00","auto_import":false,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


## delete calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/476/objects/476" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70352122436080}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4a07cb320b5941b3edb3290f93b8b1ff409a7fd2b54f63a270660eaeccbe6cb5" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/476/objects/476
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4a07cb320b5941b3edb3290f93b8b1ff409a7fd2b54f63a270660eaeccbe6cb5
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70352122436080}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-17T11:20:44+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":false},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


## list objects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/472/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6f80421cbdcde6829dfdf25b9eded9fba211c16c02796ad358db4e5647b9a5ae" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/472/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6f80421cbdcde6829dfdf25b9eded9fba211c16c02796ad358db4e5647b9a5ae
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
curl -g "https://api.timelyapp.com/1.1/apps/473/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a9592ccf292f476e37d4f4843081efdb969ece41dc937a48dbf42a62aad37409" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/473/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer a9592ccf292f476e37d4f4843081efdb969ece41dc937a48dbf42a62aad37409
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
curl "https://api.timelyapp.com/1.1/apps/475/objects/475" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70352131677240}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 07de15534239233dee4279e1c56bcddd11ab5c10b8f25da6606c7f65b68fe4b6" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/475/objects/475
Accept: application/json
Content-Type: application/json
Authorization: Bearer 07de15534239233dee4279e1c56bcddd11ab5c10b8f25da6606c7f65b68fe4b6
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70352131677240}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-17T11:20:44+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-17T11:20:44+01:00","auto_import":true,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```


# Apps



## delete connected app


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/878/connected/494" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 673e91b22475b256f1ea5e7459ce7366e33198eeb6503b3a0caed4c7f7187560" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/apps/:app_id/connected/:id`

```plaintext
DELETE /1.1/apps/878/connected/494
Accept: application/json
Content-Type: application/json
Authorization: Bearer 673e91b22475b256f1ea5e7459ce7366e33198eeb6503b3a0caed4c7f7187560
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
	-H "Authorization: Bearer 1fe34bdbc1cb06f7d3944ac0ac2765ba132317631c1bc56c25fedcccb4a34638" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps`

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1fe34bdbc1cb06f7d3944ac0ac2765ba132317631c1bc56c25fedcccb4a34638
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"app_id":864,"id":"google_calendar","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-17T11:20:44+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Google Calendar entries.","provider":"Google","provider_url":"https://calendar.google.com","screenshots":["screenshots/google_calendar/screenshot1.png"],"logo_path":"apps_logo/google_calendar.png","authorize_url":"/auth/google_calendar/authorize","connected_apps_url":"/apps/864/connected"},{"app_id":865,"id":"office365","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-17T11:20:44+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Office 365 entries.","provider":"Microsoft","provider_url":"https://products.office.com/en-us/business/explore-office-365-for-business","screenshots":["screenshots/office365/screenshot1.png"],"logo_path":"apps_logo/office365.png","authorize_url":"/auth/office365/authorize","connected_apps_url":"/apps/865/connected"},{"app_id":866,"id":"gmail","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-17T11:20:44+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"See exactly how much time you spend managing your Gmail each day. All the emails you send in a day will automatically appear in your private Memory timeline for easy reference.","provider":"Google","provider_url":"https://gmail.com/","screenshots":["screenshots/gmail/screenshot1.png"],"logo_path":"apps_logo/gmail.png","authorize_url":"/auth/gmail/authorize","connected_apps_url":"/apps/866/connected"},{"app_id":867,"id":"moves_app","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":1,"connected_integrations_count":1,"first_created_at":"2019-01-15T11:20:44+01:00","last_imported_at":"2019-01-16T11:20:44+01:00","platforms":["ios","android"],"summary":"Track off-site meetings, travel for work and the time you spend in the office every day. Essential for on-the-go professionals who need to record where they’ve been and for how long.","provider":"Facebook","provider_url":"https://moves-app.com/","screenshots":["screenshots/moves_app/screenshot1.png","screenshots/moves_app/screenshot2.png"],"logo_path":"apps_logo/moves_app.png","authorize_url":"/auth/moves_app/authorize","connected_apps_url":"/apps/867/connected"}]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/868/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 767e805b7bb957151b1e995247db163def4557f267150be420d7870e8117362c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/868/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 767e805b7bb957151b1e995247db163def4557f267150be420d7870e8117362c
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":482,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-17T11:20:44+01:00","updated_at":"2019-01-17T11:20:44+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":true,"objects_type":"calendars","objects_url":"/1.1/apps/482/objects"}]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/874/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bfac67de9b92fe1b536cc63c346d7c7a157760a58c4ee4ab7c825c13791cc365" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/874/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer bfac67de9b92fe1b536cc63c346d7c7a157760a58c4ee4ab7c825c13791cc365
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":489,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-17T11:20:44+01:00","updated_at":"2019-01-17T11:20:44+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":false}]
```


# BudgetRecurrences



## month recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1881/projects/1782/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0155c52599a150f62c3bb5014edc938734f5c538d079ab327aa837f87fc203d3" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1881/projects/1782/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0155c52599a150f62c3bb5014edc938734f5c538d079ab327aa837f87fc203d3
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
curl -g "https://api.timelyapp.com/1.1/1882/projects/1783/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 92a18b6b57806998acea511af0ce0743de430934ef1763ffff8e889f2aa025c6" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1882/projects/1783/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 92a18b6b57806998acea511af0ce0743de430934ef1763ffff8e889f2aa025c6
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
curl -g "https://api.timelyapp.com/1.1/1879/projects/1780/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f5bb77de21381c4b5b48d458c0a7e130f9cab351df0935dc44d2fb301bcf21c2" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1879/projects/1780/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer f5bb77de21381c4b5b48d458c0a7e130f9cab351df0935dc44d2fb301bcf21c2
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
curl -g "https://api.timelyapp.com/1.1/1880/projects/1781/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e33d2ee6dd54f1360ba6b534bea6c05537a6bb6acd6df9e970b1fa762253b204" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/1880/projects/1781/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer e33d2ee6dd54f1360ba6b534bea6c05537a6bb6acd6df9e970b1fa762253b204
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
curl "https://api.timelyapp.com/1.1/1888/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[1009]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bf0eca428419c77fbeae7d95cd47600432c892b58f12aed1398636a7d428fb6c" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/suggested_entries/discard`

```plaintext
POST /1.1/1888/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer bf0eca428419c77fbeae7d95cd47600432c892b58f12aed1398636a7d428fb6c
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[1009]}}
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
curl -g "https://api.timelyapp.com/1.1/1887/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 87f394e481c2d9609d478220b416ca78d4ca40313fb7bd7eeab68d09f6ac866d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries/discarded`

```plaintext
GET /1.1/1887/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer 87f394e481c2d9609d478220b416ca78d4ca40313fb7bd7eeab68d09f6ac866d
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
[{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[1008],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","projects":[],"importance":0.8,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```


## remove


### Request

```shell
curl "https://api.timelyapp.com/1.1/1889/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[1012]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 99aee2f23572e2bf85302a7ff75eaf137bb0e33dce7ea1dc822175c28441c192" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggested_entries/discard`

```plaintext
DELETE /1.1/1889/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 99aee2f23572e2bf85302a7ff75eaf137bb0e33dce7ea1dc822175c28441c192
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[1012]}}
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=1013%2C1014" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 652413e645a8c61c87cb3a01a5473c6846dc7973e267d1fb3e4b589cff6693ac" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=1013%2C1014
Accept: application/json
Content-Type: application/json
Authorization: Bearer 652413e645a8c61c87cb3a01a5473c6846dc7973e267d1fb3e4b589cff6693ac
```

#### Parameters

```json
entry_ids: 1013,1014
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=1015%2C1016" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ca9f2d4e8907e5fedb62caccca35b16bd5ef036884b02943fc172b1afb60d101" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=1015%2C1016
Accept: application/json
Content-Type: application/json
Authorization: Bearer ca9f2d4e8907e5fedb62caccca35b16bd5ef036884b02943fc172b1afb60d101
```

#### Parameters

```json
entry_ids: 1015,1016
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=1017%2C1018" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4a854e72d52766ef7e9f5f8e246f3461f0b18c17ba5d284c6cef969c6087bee9" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=1017%2C1018
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4a854e72d52766ef7e9f5f8e246f3461f0b18c17ba5d284c6cef969c6087bee9
```

#### Parameters

```json
entry_ids: 1017,1018
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
curl "https://api.timelyapp.com/1.1/entries/1030" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0920869ebc95806ffbc947c95cf959c23208556745468ddd07ef60b029df80e3" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/entries/:id`

```plaintext
DELETE /1.1/entries/1030
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0920869ebc95806ffbc947c95cf959c23208556745468ddd07ef60b029df80e3
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
	-H "Authorization: Bearer ccf7a86d42e07b3b83af23a0455754a412570cc976bae258971b3d69099bcf8f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?date=2019-01-19
Accept: application/json
Content-Type: application/json
Authorization: Bearer ccf7a86d42e07b3b83af23a0455754a412570cc976bae258971b3d69099bcf8f
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
[{"id":1024,"type":"google_calendar","uid":"024eabd3-c956-4c0e-aa78-e2896b943e3e","title":"Meeting","note":"Discuss about future","description":"11:20 - 14:50 • Discuss about future","date":"2019-01-19","from":"2019-01-17T11:20:53+01:00","to":"2019-01-17T14:50:53+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T11:20:53+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


## with default params


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer aeb6e7e82daf732eccaae91c588e4993934dc0041445fa2746fd0c1885298f0a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer aeb6e7e82daf732eccaae91c588e4993934dc0041445fa2746fd0c1885298f0a
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
[{"id":1019,"type":"macOS","uid":"024eabd3-c956-4c0e-aa78-e2896b943e3e","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":"2019-01-17T11:20:52+01:00","to":"2019-01-17T14:50:52+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T11:20:52+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null},{"id":1020,"type":"google_calendar","uid":"024eabd3-c956-4c0e-aa78-e2896b943e3e","title":"Meeting","note":"Discuss about future","description":"11:20 - 14:50 • Discuss about future","date":"2019-01-17","from":"2019-01-17T11:20:52+01:00","to":"2019-01-17T14:50:52+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T11:20:52+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


## with entry_ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=1025%2C1027" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9aeeab78d522d75b07c601d4374324df0f4dd5a3dd0062a4bbef1b11670dd6ce" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=1025%2C1027
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9aeeab78d522d75b07c601d4374324df0f4dd5a3dd0062a4bbef1b11670dd6ce
```

#### Parameters

```json
entry_ids: 1025,1027
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
[{"id":1025,"type":"macOS","uid":"024eabd3-c956-4c0e-aa78-e2896b943e3e","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":"2019-01-17T11:20:53+01:00","to":"2019-01-17T14:50:53+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T11:20:53+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null},{"id":1027,"type":"google_calendar","uid":"024eabd3-c956-4c0e-aa78-e2896b943e3e","title":"Meeting","note":"Discuss about future","description":"11:20 - 14:50 • Discuss about future","date":"2019-01-19","from":"2019-01-17T11:20:53+01:00","to":"2019-01-17T14:50:53+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-17T11:20:53+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```


# Events



## hour with id


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1910/events/1469" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 00241fe92703fcc8a77802299ca6233f055cf2e19ea38326efb7f77f58d8ac86" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/1910/events/1469
Accept: application/json
Content-Type: application/json
Authorization: Bearer 00241fe92703fcc8a77802299ca6233f055cf2e19ea38326efb7f77f58d8ac86
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{"id":1469,"uid":"b15986e2-d184-41e4-9492-2d59255c4b9b","user":{"id":4397,"email":"quentin@timelyapp.com","name":"Quintin Duponde","active":false,"day_view_onboarded":true,"memory_onboarded":true,"created_at":1547720457,"updated_at":1547720457,"default_hour_rate":0.0,"last_received_memories_date":null,"sign_in_count":null,"external_id":null},"project":{"id":1801,"active":true,"account_id":1910,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1363,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720457,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"labels":[]},"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"estimated_duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"cost":{"fractional":17500,"formatted":"$175.00","amount":175.0},"estimated_cost":{"fractional":20000,"formatted":"$200.00","amount":200.0},"day":"2019-01-17","note":"Notes for testing with some random #hash in it.","sequence":1,"estimated":false,"timer_state":"default","timer_started_on":0,"timer_stopped_on":0,"label_ids":[],"user_ids":[],"updated_at":1547720457,"created_at":1547720457,"created_from":"Web","updated_from":"Web","billed":false,"to":"2019-01-17T14:50:57+01:00","from":"2019-01-17T11:20:57+01:00","deleted":false,"hour_rate":50.0,"hour_rate_in_cents":5000.0,"creator_id":null,"updater_id":null,"external_id":null,"entry_ids":[],"suggestion_id":null}
```


## not found


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1911/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ef6f4ca3489de5dfb3c157b5823929680c3a2f45ae9cd6e3bb6d0b0efa14af7d" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/1911/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer ef6f4ca3489de5dfb3c157b5823929680c3a2f45ae9cd6e3bb6d0b0efa14af7d
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
	-H "Authorization: Bearer 6a4bbb9ad1f622dc042fd6144a73a26f5a7f1f004b297a468f1c44f63f4f6fe1" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6a4bbb9ad1f622dc042fd6144a73a26f5a7f1f004b297a468f1c44f63f4f6fe1
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
	-H "Authorization: Bearer f1546ebd9cbdd09b628cd6f67b36cdfe855baeca68a61650c065c81cc115376a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer f1546ebd9cbdd09b628cd6f67b36cdfe855baeca68a61650c065c81cc115376a
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
curl "https://api.timelyapp.com/1.1/1921/projects/1812/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a0e6bbf90c3a885292363dd77466a180015dd0e06be374805a4a39f985c8952e" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
POST /1.1/1921/projects/1812/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer a0e6bbf90c3a885292363dd77466a180015dd0e06be374805a4a39f985c8952e
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
curl "https://api.timelyapp.com/1.1/1922/projects/1813/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer dcf76d82699b10020f72eb32b6f96e44a08a480a8f5e2c2ea516e532ea6afa23" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
DELETE /1.1/1922/projects/1813/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer dcf76d82699b10020f72eb32b6f96e44a08a480a8f5e2c2ea516e532ea6afa23
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
curl -g "https://api.timelyapp.com/1.1/1918/projects/1809/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer feb7a2d10e9fb52cab98e5c682ec67964b85f6c519c14fc5a8a139650f9f243c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscribers`

```plaintext
GET /1.1/1918/projects/1809/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer feb7a2d10e9fb52cab98e5c682ec67964b85f6c519c14fc5a8a139650f9f243c
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[{"id":4413,"email":"quentin@timelyapp.com","name":"Quintin Duponde","avatar":{"timeline":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_timeline.jpg&s=","medium_retina":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","medium":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium.jpg&s="}}]
```


## show project subscription


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1919/projects/1810/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6a49f9ddd768ec95a51c44f549eb05098247bf8313a2783ee47fcd4beca76c49" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/1919/projects/1810/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6a49f9ddd768ec95a51c44f549eb05098247bf8313a2783ee47fcd4beca76c49
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
curl -g "https://api.timelyapp.com/1.1/1920/projects/1811/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0809ff5b8f5b386d1cddd838ffa3a071bbb005960b9ec3c79aec46d7995ec0c9" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/1920/projects/1811/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0809ff5b8f5b386d1cddd838ffa3a071bbb005960b9ec3c79aec46d7995ec0c9
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
curl -g "https://api.timelyapp.com/1.1/1933/projects/search?q=Tiger" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1579335ae8a18a52bba39938bc7207a25564a60fca6a28243834f9c90540cecd" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/1933/projects/search?q=Tiger
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1579335ae8a18a52bba39938bc7207a25564a60fca6a28243834f9c90540cecd
```

#### Parameters

```json
q: Tiger
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
[{"id":1836,"name":"Tiger","color":"67a3bc","active":true,"client":{"id":1386,"name":"Timely","active":true,"external_id":null}}]
```


## active


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1931/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 29378499198331580991a9dbb77dcf7c2299886b85a9f645646f59f7e1ed4a98" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1931/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer 29378499198331580991a9dbb77dcf7c2299886b85a9f645646f59f7e1ed4a98
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
[{"id":1826,"active":true,"account_id":1931,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1384,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720462,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4439,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## all


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1930/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4e71f5f400b443be24e9f76ef338290585c18c7d849d1d5258269df2ce1e7478" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1930/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4e71f5f400b443be24e9f76ef338290585c18c7d849d1d5258269df2ce1e7478
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
[{"id":1824,"active":true,"account_id":1930,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1383,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720461,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4437,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]},{"id":1825,"active":false,"account_id":1930,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1383,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720461,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4437,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## archived


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1932/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d922588a1bd3f84bda39f8ce8bde1d754b691016dfe919aa6772920a63619295" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1932/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer d922588a1bd3f84bda39f8ce8bde1d754b691016dfe919aa6772920a63619295
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
[{"id":1829,"active":false,"account_id":1932,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1385,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720462,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4441,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1938/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1391,"budget_type":"M","budget":300,"users":[{"user_id":4453}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 81f6775cb51ce4ea28f1e9661ed09a5a4586f5a9930b84a6cb9623551f9cc861" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1938/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 81f6775cb51ce4ea28f1e9661ed09a5a4586f5a9930b84a6cb9623551f9cc861
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1391,"budget_type":"M","budget":300,"users":[{"user_id":4453}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
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
{"id":1853,"active":true,"account_id":1938,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1391,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720464,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4453,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1935/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1388,"users":[{"user_id":4447}],"labels":[{"label_id":639},{"label_id":640,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a9608f63b402fb43bd924d1bfc023ed86e73e0d51c318648fc771b2ca733947e" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1935/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer a9608f63b402fb43bd924d1bfc023ed86e73e0d51c318648fc771b2ca733947e
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1388,"users":[{"user_id":4447}],"labels":[{"label_id":639},{"label_id":640,"budget":0,"required":false}]}}
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
{"id":1850,"active":true,"account_id":1935,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1388,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720463,"label_ids":[639,640],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4447,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":639,"budget":null,"required":false},{"label_id":640,"budget":0,"required":false}]}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1936/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1389,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":4449}],"labels":[{"label_id":641,"budget":100,"required":false},{"label_id":642,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 038322ef6608bf230a5cce4692574ec2e2498009f3daadb418bf51091ccdf7fa" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1936/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 038322ef6608bf230a5cce4692574ec2e2498009f3daadb418bf51091ccdf7fa
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1389,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":4449}],"labels":[{"label_id":641,"budget":100,"required":false},{"label_id":642,"budget":200,"required":true}]}}
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
{"id":1851,"active":true,"account_id":1936,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1389,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720463,"label_ids":[641,642],"required_label_ids":[642],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4449,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":641,"budget":100,"required":false},{"label_id":642,"budget":200,"required":true}]}
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1937/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1390,"budget_type":"M","budget":300,"users":[{"user_id":4451}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2ce33d5b03112d78990220cd4476baabed6242ccc3595c190e389b7562d13958" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/1937/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2ce33d5b03112d78990220cd4476baabed6242ccc3595c190e389b7562d13958
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":1390,"budget_type":"M","budget":300,"users":[{"user_id":4451}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
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
{"id":1852,"active":true,"account_id":1937,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1390,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720463,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4451,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## mine with projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1928/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c8dadd9c2b05d9e745b0f7374e9e5c5e7f8a219d33d360fc7d04d3546666ee04" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1928/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer c8dadd9c2b05d9e745b0f7374e9e5c5e7f8a219d33d360fc7d04d3546666ee04
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
[{"id":1820,"active":true,"account_id":1928,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1381,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720461,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":4433,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```


## mine without projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1929/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 49ad0dade4144cfbb8dcfc952e1ff0f218c9d45338d2ed2d7054d43f1e7bb6b1" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/1929/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 49ad0dade4144cfbb8dcfc952e1ff0f218c9d45338d2ed2d7054d43f1e7bb6b1
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
curl "https://api.timelyapp.com/1.1/1948/projects/1863" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 88a6c47f37c47034ef37858b80c6bab55314fa9009e76db811ad936779ca322e" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1948/projects/1863
Accept: application/json
Content-Type: application/json
Authorization: Bearer 88a6c47f37c47034ef37858b80c6bab55314fa9009e76db811ad936779ca322e
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
{"id":1863,"active":true,"account_id":1948,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1401,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720466,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1939/projects/1854" -d '{"project":{"labels":[{"label_id":643},{"label_id":644,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ba287e81bc126f3a203589b3d69e3b7b321ed643433ea6221595c6ed79024184" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1939/projects/1854
Accept: application/json
Content-Type: application/json
Authorization: Bearer ba287e81bc126f3a203589b3d69e3b7b321ed643433ea6221595c6ed79024184
```

#### Parameters


```json
{"project":{"labels":[{"label_id":643},{"label_id":644,"budget":0,"required":false}]}}
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
{"id":1854,"active":true,"account_id":1939,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1392,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720464,"label_ids":[643,644],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":643,"budget":null,"required":false},{"label_id":644,"budget":0,"required":false}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1940/projects/1855" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":645,"budget":100,"required":true},{"label_id":646,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer dedaf8e6926b615a14202d96f9579ffc1ad2d7d2d3e6600a8e9a67935c5f5d96" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1940/projects/1855
Accept: application/json
Content-Type: application/json
Authorization: Bearer dedaf8e6926b615a14202d96f9579ffc1ad2d7d2d3e6600a8e9a67935c5f5d96
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":645,"budget":100,"required":true},{"label_id":646,"budget":100,"required":true}]}}
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
{"id":1855,"active":true,"account_id":1940,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1393,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720464,"label_ids":[645,646],"required_label_ids":[645,646],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":200,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":645,"budget":100,"required":true},{"label_id":646,"budget":100,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1941/projects/1856" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":647,"budget":100,"required":true},{"label_id":648,"budget":100,"required":true},{"label_id":649,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 208dc642427ab94752ef4dfa39c70bd0811989f3e4ca278e4109f7e66b009bcc" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1941/projects/1856
Accept: application/json
Content-Type: application/json
Authorization: Bearer 208dc642427ab94752ef4dfa39c70bd0811989f3e4ca278e4109f7e66b009bcc
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":647,"budget":100,"required":true},{"label_id":648,"budget":100,"required":true},{"label_id":649,"budget":200,"required":true}]}}
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
{"id":1856,"active":true,"account_id":1941,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1394,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720464,"label_ids":[647,648,649],"required_label_ids":[647,648,649],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":647,"budget":100,"required":true},{"label_id":648,"budget":100,"required":true},{"label_id":649,"budget":200,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1942/projects/1857" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":652,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 95b6575fdd61ccb63d3900a935e82671151a1b17df852634a445e29b7590986b" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1942/projects/1857
Accept: application/json
Content-Type: application/json
Authorization: Bearer 95b6575fdd61ccb63d3900a935e82671151a1b17df852634a445e29b7590986b
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":652,"budget":400,"required":true}]}}
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
{"id":1857,"active":true,"account_id":1942,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1395,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720465,"label_ids":[652],"required_label_ids":[652],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":652,"budget":400,"required":true}]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1943/projects/1858" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5982c8d2d40a1bd2018b86f90a415192459a94826894933542d317615274264c" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1943/projects/1858
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5982c8d2d40a1bd2018b86f90a415192459a94826894933542d317615274264c
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
{"id":1858,"active":true,"account_id":1943,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1396,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720465,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[]}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1944/projects/1859" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a0a5767843b6775b5c10ce7e582569ae7c9cb56d74f765dfaf44fc7e541b3151" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1944/projects/1859
Accept: application/json
Content-Type: application/json
Authorization: Bearer a0a5767843b6775b5c10ce7e582569ae7c9cb56d74f765dfaf44fc7e541b3151
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
{"id":1859,"active":true,"account_id":1944,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1397,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720465,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1945/projects/1860" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d638027c566a8668d043f2c993aebdc9c6b50a0027404c00975e2bb9656e4607" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1945/projects/1860
Accept: application/json
Content-Type: application/json
Authorization: Bearer d638027c566a8668d043f2c993aebdc9c6b50a0027404c00975e2bb9656e4607
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
{"id":1860,"active":true,"account_id":1945,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":1398,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547720465,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/1946/projects/1861" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 69141cf821afc5d200205028e3f420b23c5a5e5cdde3aa4fad80a152af2f38ae" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1946/projects/1861
Accept: application/json
Content-Type: application/json
Authorization: Bearer 69141cf821afc5d200205028e3f420b23c5a5e5cdde3aa4fad80a152af2f38ae
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
curl "https://api.timelyapp.com/1.1/1947/projects/1862" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8767eeb83bc6c4d1293404891f0309978806918d03702ff9acb2855e20f00420" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/1947/projects/1862
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8767eeb83bc6c4d1293404891f0309978806918d03702ff9acb2855e20f00420
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
curl -g "https://api.timelyapp.com/1.1/1950/suggested_entries?date=2019-01-17" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b4ae0e5494ae020af4759faa4607477d592c1f2e7c394608730c3782aab9aa2a" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/1950/suggested_entries?date=2019-01-17
Accept: application/json
Content-Type: application/json
Authorization: Bearer b4ae0e5494ae020af4759faa4607477d592c1f2e7c394608730c3782aab9aa2a
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
[{"title":"Meeting","note":"Discuss about future","date":"2019-01-17","from":null,"to":null,"description":"14:00 - 15:00 • Discuss about future","entry_ids":[1031],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","projects":[],"importance":0,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60}},{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[1032,1033],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","projects":[{"project_id":1865,"accuracy":0.8,"count":2}],"importance":0.8,"duration":{"hours":7,"minutes":0,"seconds":0,"formatted":"07:00","total_hours":7.0,"total_seconds":25200,"total_minutes":420}},{"title":"Congratulations on winning $100000","note":"You won $100000, share your netbanking details","date":"2019-01-17","from":null,"to":null,"description":" • You won $100000, share your netbanking details","entry_ids":[1034],"icon_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","icon_fallback_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","projects":[{"project_id":1865,"accuracy":0.8,"count":1}],"importance":0,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1951/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":1036,"project_id":1867}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 26292cf2d4f81317d46677634dd97fb09a6fbd28818ded72fc3cf3f6bd214b04" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/1951/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 26292cf2d4f81317d46677634dd97fb09a6fbd28818ded72fc3cf3f6bd214b04
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":1036,"project_id":1867}]}}
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
curl -g "https://api.timelyapp.com/1.1/1952/suggested_hours?date=2019-01-17" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 27385f8bf62b0b5e53836ee14bf9ebe2b058a096e2bb74107ef29a96e5af8e14" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1952/suggested_hours?date=2019-01-17
Accept: application/json
Content-Type: application/json
Authorization: Bearer 27385f8bf62b0b5e53836ee14bf9ebe2b058a096e2bb74107ef29a96e5af8e14
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
[{"id":175,"owner":{"id":1593,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":1868,"date":"2019-01-17","to":"2019-01-17T14:51:07+01:00","from":"2019-01-17T11:21:07+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T11:21:07+01:00","suggested_entry_ids":[1039,1040],"version":"0.2.0","updated_at":"2019-01-17T11:21:07+01:00"}]
```


## show


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1958/suggested_hours/187" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 83b0e8ac006add95f8119a20f47847676112fe6cdd2d6539d18a7e8a72ea5994" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
GET /1.1/1958/suggested_hours/187
Accept: application/json
Content-Type: application/json
Authorization: Bearer 83b0e8ac006add95f8119a20f47847676112fe6cdd2d6539d18a7e8a72ea5994
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
{"id":187,"owner":{"id":1599,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":1874,"date":"2019-01-17","to":"2019-01-17T14:51:10+01:00","from":"2019-01-17T11:21:10+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T11:21:10+01:00","suggested_entry_ids":[1063,1064],"version":"0.2.0","updated_at":"2019-01-17T11:21:10+01:00"}
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1954/suggested_hours?date=2019-01-17&since=2019-01-15&until=2019-01-17" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 756c11462e668c1968bfb9080f19a865e31ba73b6e49ee14ad6bf8c04a80f50c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1954/suggested_hours?date=2019-01-17&amp;since=2019-01-15&amp;until=2019-01-17
Accept: application/json
Content-Type: application/json
Authorization: Bearer 756c11462e668c1968bfb9080f19a865e31ba73b6e49ee14ad6bf8c04a80f50c
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
[{"id":179,"owner":{"id":1595,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":1870,"date":"2019-01-17","to":"2019-01-17T14:51:08+01:00","from":"2019-01-17T11:21:08+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T11:21:08+01:00","suggested_entry_ids":[1047,1048],"version":"0.2.0","updated_at":"2019-01-17T11:21:08+01:00"},{"id":180,"owner":{"id":1595,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":1870,"date":"2019-01-15","to":"2019-01-17T14:51:08+01:00","from":"2019-01-17T11:21:08+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T11:21:08+01:00","suggested_entry_ids":[1049],"version":"0.2.0","updated_at":"2019-01-17T11:21:08+01:00"}]
```


## suggested hour ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1955/suggested_hours?date=2019-01-17&suggested_hour_ids=181" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2d83af8600482962879627bc5046bbe45d409bb694be571808665764709ca08f" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1955/suggested_hours?date=2019-01-17&amp;suggested_hour_ids=181
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2d83af8600482962879627bc5046bbe45d409bb694be571808665764709ca08f
```

#### Parameters

```json
date: 2019-01-17
suggested_hour_ids: 181
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
[{"id":181,"owner":{"id":1596,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":1871,"date":"2019-01-17","to":"2019-01-17T14:51:08+01:00","from":"2019-01-17T11:21:08+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T11:21:08+01:00","suggested_entry_ids":[1051,1052],"version":"0.2.0","updated_at":"2019-01-17T11:21:08+01:00"}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1956/suggested_hours/183" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4a5af620ba286f98c013e41a3c5524b4dd26bd5a0855cdd2f6f6a4ceb6ac3b69" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/1956/suggested_hours/183
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4a5af620ba286f98c013e41a3c5524b4dd26bd5a0855cdd2f6f6a4ceb6ac3b69
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
{"id":183,"owner":{"id":1597,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":1872,"date":"2019-01-17","to":"2019-01-17T14:51:09+01:00","from":"2019-01-17T11:21:09+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"dismissed","source":"prediction","created_at":"2019-01-17T11:21:09+01:00","suggested_entry_ids":[1055,1056],"version":"0.2.0","updated_at":"2019-01-17T11:21:09+01:00"}
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1957/suggested_hours/decline" -d '{"suggested_hour_ids":[185]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b4a6f1eafb51a9b323776da3a0c1e3c26b38ca28ad87b9a440c70cd6f5964726" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/decline`

```plaintext
PUT /1.1/1957/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer b4a6f1eafb51a9b323776da3a0c1e3c26b38ca28ad87b9a440c70cd6f5964726
```

#### Parameters


```json
{"suggested_hour_ids":[185]}
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
curl -g "https://api.timelyapp.com/1.1/1953/suggested_hours?date=2019-01-15" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 675da7030fc81c608f252f427b964eb7471908b1ab67cff33ee7d0cdffdbc123" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/1953/suggested_hours?date=2019-01-15
Accept: application/json
Content-Type: application/json
Authorization: Bearer 675da7030fc81c608f252f427b964eb7471908b1ab67cff33ee7d0cdffdbc123
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
[{"id":178,"owner":{"id":1594,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":1869,"date":"2019-01-15","to":"2019-01-17T14:51:08+01:00","from":"2019-01-17T11:21:08+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-17T11:21:08+01:00","suggested_entry_ids":[1045],"version":"0.2.0","updated_at":"2019-01-17T11:21:08+01:00"}]
```


# Training Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/1965/training_entries" -d '{"training_entries":{"entries":[{"entry_id":1070,"project_id":1880}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c83ca632f45e27ff2edc5654babd6d4c74e38ebc03d49affe43ba47c08bcc7ea" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/1965/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer c83ca632f45e27ff2edc5654babd6d4c74e38ebc03d49affe43ba47c08bcc7ea
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":1070,"project_id":1880}]}}
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
curl -g "https://api.timelyapp.com/1.1/1964/training_entries?date=2019-01-17" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ba15dfc047c266fc56322737b690d34c485f17928e4bb09a41b7470e9074b294" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/training_entries`

```plaintext
GET /1.1/1964/training_entries?date=2019-01-17
Accept: application/json
Content-Type: application/json
Authorization: Bearer ba15dfc047c266fc56322737b690d34c485f17928e4bb09a41b7470e9074b294
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
[{"id":1067,"type":"macOS","uid":"024eabd3-c956-4c0e-aa78-e2896b943e3e","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":"2019-01-17T10:00:00+01:00","to":"2019-01-17T12:00:00+01:00","entry_type":null,"duration":{"hours":2,"minutes":0,"seconds":0,"formatted":"02:00","total_hours":2.0,"total_seconds":7200,"total_minutes":120},"at":"2019-01-17T10:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null,"score":0.8},{"id":1068,"type":"macOS","uid":"024eabd3-c956-4c0e-aa78-e2896b943e3e","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-17","from":"2019-01-17T14:00:00+01:00","to":"2019-01-17T15:00:00+01:00","entry_type":null,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60},"at":"2019-01-17T14:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null,"score":0.6}]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/1966/training_entries" -d '{"training_entries":{"entries":[{"entry_id":1072,"project_id":1881},{"entry_id":1071,"project_id":1881}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 86058a8393e419fee15141ad62c95ab393d5bb080cffa1a2d5b5e4aa816ea8da" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/1966/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 86058a8393e419fee15141ad62c95ab393d5bb080cffa1a2d5b5e4aa816ea8da
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":1072,"project_id":1881},{"entry_id":1071,"project_id":1881}]}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/1977/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3da5bd059b502812e709c480ad6a6ffbd2d2b7867e1c5419adeb8036773a7823" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1977/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3da5bd059b502812e709c480ad6a6ffbd2d2b7867e1c5419adeb8036773a7823
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
curl "https://api.timelyapp.com/1.2/private/accounts/1979/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 287f71406da2e4ceaa3b1cfc00af011c824592991f5d32460427305a007871b6" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1979/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 287f71406da2e4ceaa3b1cfc00af011c824592991f5d32460427305a007871b6
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
curl "https://api.timelyapp.com/1.2/private/accounts/1976/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d9731c627ff058615ea5979f754388fa29a3ce1fb872e3d0be1dcb41e8d8bd71" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1976/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer d9731c627ff058615ea5979f754388fa29a3ce1fb872e3d0be1dcb41e8d8bd71
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
{"id":1976,"name":"Timely","from":"Web","max_users":0,"max_projects":0,"num_users":2,"num_projects":0,"plan_id":28,"plan_name":"Essential","next_charge":"2019-02-17","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1547720475,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"essential","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTAzOTg4NzYsInYiOjAsImlhdCI6MTU0NzcyMDQ3NiwiZCI6eyJ1c2VyX2lkIjoiNDU1MiIsImFjY291bnRfaWQiOiIxOTc2IiwidXNlcl90eXBlIjoibm9ybWFsIiwidWlkIjoiN2YzZGU1MmJlNDNhNzU2YTc3M2M1Y2FkMGViZGYyOWUifX0.T0l-blO1i3szntafwSNM4WnDrjjEeM3Dxlv8GY1-Gxs"}
```


## upgrade account plan to solo


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1975/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b12a9d5f6b3f90d430b972cce0d3485d62c8c99258aa0f00e5a95892a4ff0645" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1975/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer b12a9d5f6b3f90d430b972cce0d3485d62c8c99258aa0f00e5a95892a4ff0645
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
{"id":1975,"name":"Timely","from":"Web","max_users":1,"max_projects":3,"num_users":2,"num_projects":0,"plan_id":34,"plan_name":"Solo","next_charge":"2019-02-17","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1547720475,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"solo_v1","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTAzOTg4NzUsInYiOjAsImlhdCI6MTU0NzcyMDQ3NSwiZCI6eyJ1c2VyX2lkIjoiNDU1MCIsImFjY291bnRfaWQiOiIxOTc1IiwidXNlcl90eXBlIjoibm9ybWFsIiwidWlkIjoiN2NiMTQyNWUzMjdjOWFmZTg1MDRiNzUzYjgwM2QxY2UifX0.HPjV8uHLpvgC0XbDlG0TwUXSnc2BzIqR-P4wisNTwLI"}
```


## upgrade for duplicate appstore_transaction_id


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/1981/upgrade" -d '{"account":{"next_charge":"2019-02-17","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 275f78c675148ce1985481f7d2946d712d099235ec2aa5f5868526013d6676c6" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/1981/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 275f78c675148ce1985481f7d2946d712d099235ec2aa5f5868526013d6676c6
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
[{"user_id":4305,"property":"has_seen_calendar_day","value":"yes","updated_at":"2019-01-17T11:20:42+01:00"},{"user_id":4305,"property":"has_seen_calendar_week","value":"no","updated_at":"2019-01-17T11:20:42+01:00"}]
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
[{"user_id":4304,"property":"has_seen_calendar_week","value":"yes","updated_at":"2019-01-17T11:20:41+01:00"}]
```


# Users



## Search all users with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/1973/users/search?q=Gil+Gutkowski" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer faedce7912b17b7fe2b35bc60dfe2cac551faff7a95695e49591ea9f7b3e7639" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/search`

```plaintext
GET /1.1/1973/users/search?q=Gil+Gutkowski
Accept: application/json
Content-Type: application/json
Authorization: Bearer faedce7912b17b7fe2b35bc60dfe2cac551faff7a95695e49591ea9f7b3e7639
```

#### Parameters

```json
q: Gil Gutkowski
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
[{"id":4527,"email":"earleen.stracke@gmail.com","name":"Gil Gutkowski","active":false,"external_id":null,"avatar":{"large":"https://www.gravatar.com/avatar/bc8cfa18c06dd99de90c804b13ff9b6d?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200","medium":"https://www.gravatar.com/avatar/bc8cfa18c06dd99de90c804b13ff9b6d?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","small":"https://www.gravatar.com/avatar/bc8cfa18c06dd99de90c804b13ff9b6d?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"},"updated_at":1547720474}]
```


