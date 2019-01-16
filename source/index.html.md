---
title: Timely Internal API doc
language_tabs:
  - json: JSON
  - shell: cURL
---

Use Timely API to integrate with your apps

Timely API helps you integrate your application with Timely. Following are the list of API’s available. For any help or support email support@timelyapp.com
# AppObjects



## create calendar


### Request

#### Endpoint

```plaintext
PUT /1.1/apps/186/objects/186
Accept: application/json
Content-Type: application/json
Authorization: Bearer e888337bca75cd46b9634ba01a1d9f2c9f41048bcc3cfcb506f47c2c50422286
```

`PUT /1.1/apps/:app_id/objects/:id`

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70344374509620}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-16T13:33:01+01:00","auto_import":true,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-16T13:33:01+01:00","auto_import":false,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```



```shell
curl "https://api.timelyapp.com/1.1/apps/186/objects/186" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70344374509620}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e888337bca75cd46b9634ba01a1d9f2c9f41048bcc3cfcb506f47c2c50422286" \
	-H "Cookie: "
```
## delete calendar


### Request

#### Endpoint

```plaintext
PUT /1.1/apps/188/objects/188
Accept: application/json
Content-Type: application/json
Authorization: Bearer ba1f2e66213b275e12407800d0f4c4dc274367114b1098f120f1405666718470
```

`PUT /1.1/apps/:app_id/objects/:id`

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70344301959880}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-16T13:33:01+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":false},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```



```shell
curl "https://api.timelyapp.com/1.1/apps/188/objects/188" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70344301959880}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ba1f2e66213b275e12407800d0f4c4dc274367114b1098f120f1405666718470" \
	-H "Cookie: "
```
## list objects


### Request

#### Endpoint

```plaintext
GET /1.1/apps/184/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3bb30598d081801754e6b2d790d22e4979d0cf76fcdbce889dc0622555083a07
```

`GET /1.1/apps/:app_id/objects`

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



```shell
curl -g "https://api.timelyapp.com/1.1/apps/184/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3bb30598d081801754e6b2d790d22e4979d0cf76fcdbce889dc0622555083a07" \
	-H "Cookie: "
```
## list objects


### Request

#### Endpoint

```plaintext
GET /1.1/apps/185/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer cca38cc2066eb384cc4fcad8f8cea25c85e3c08fd994e67b2e0faced2295e303
```

`GET /1.1/apps/:app_id/objects`

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



```shell
curl -g "https://api.timelyapp.com/1.1/apps/185/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer cca38cc2066eb384cc4fcad8f8cea25c85e3c08fd994e67b2e0faced2295e303" \
	-H "Cookie: "
```
## update calendar


### Request

#### Endpoint

```plaintext
PUT /1.1/apps/187/objects/187
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2c8106c31d938d271b806d6d38cc21ade849c922c6d65a82cf2c8daba727c1d5
```

`PUT /1.1/apps/:app_id/objects/:id`

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70344375305120}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-16T13:33:01+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-16T13:33:01+01:00","auto_import":true,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```



```shell
curl "https://api.timelyapp.com/1.1/apps/187/objects/187" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70344375305120}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2c8106c31d938d271b806d6d38cc21ade849c922c6d65a82cf2c8daba727c1d5" \
	-H "Cookie: "
```
# Apps



## delete connected app


### Request

#### Endpoint

```plaintext
DELETE /1.1/apps/414/connected/206
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9a1157111e5aa5fc11a1b8a77de0d5de0890ea99c8e6c1a7b05d5d29e430b32a
```

`DELETE /1.1/apps/:app_id/connected/:id`

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



```shell
curl "https://api.timelyapp.com/1.1/apps/414/connected/206" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9a1157111e5aa5fc11a1b8a77de0d5de0890ea99c8e6c1a7b05d5d29e430b32a" \
	-H "Cookie: "
```
## list apps


### Request

#### Endpoint

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer 46344cee0a42ac1d58298db3663de397e038cf09d89c8e96b60c949f393e0130
```

`GET /1.1/apps`

#### Parameters


None known.


### Response

```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```


```json
[{"app_id":400,"id":"google_calendar","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-16T13:33:01+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Google Calendar entries.","provider":"Google","provider_url":"https://calendar.google.com","screenshots":["screenshots/google_calendar/screenshot1.png"],"logo_path":"apps_logo/google_calendar.png","authorize_url":"/auth/google_calendar/authorize","connected_apps_url":"/apps/400/connected"},{"app_id":401,"id":"office365","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-16T13:33:01+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Office 365 entries.","provider":"Microsoft","provider_url":"https://products.office.com/en-us/business/explore-office-365-for-business","screenshots":["screenshots/office365/screenshot1.png"],"logo_path":"apps_logo/office365.png","authorize_url":"/auth/office365/authorize","connected_apps_url":"/apps/401/connected"},{"app_id":402,"id":"gmail","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-16T13:33:01+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"See exactly how much time you spend managing your Gmail each day. All the emails you send in a day will automatically appear in your private Memory timeline for easy reference.","provider":"Google","provider_url":"https://gmail.com/","screenshots":["screenshots/gmail/screenshot1.png"],"logo_path":"apps_logo/gmail.png","authorize_url":"/auth/gmail/authorize","connected_apps_url":"/apps/402/connected"},{"app_id":403,"id":"moves_app","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":1,"connected_integrations_count":1,"first_created_at":"2019-01-14T13:33:01+01:00","last_imported_at":"2019-01-15T13:33:01+01:00","platforms":["ios","android"],"summary":"Track off-site meetings, travel for work and the time you spend in the office every day. Essential for on-the-go professionals who need to record where they’ve been and for how long.","provider":"Facebook","provider_url":"https://moves-app.com/","screenshots":["screenshots/moves_app/screenshot1.png","screenshots/moves_app/screenshot2.png"],"logo_path":"apps_logo/moves_app.png","authorize_url":"/auth/moves_app/authorize","connected_apps_url":"/apps/403/connected"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/apps" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 46344cee0a42ac1d58298db3663de397e038cf09d89c8e96b60c949f393e0130" \
	-H "Cookie: "
```
## list connected apps


### Request

#### Endpoint

```plaintext
GET /1.1/apps/404/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer aff5f695d43b9e946637334ae8500a6ac088e6fed2ee0a97e25e066ef0903c46
```

`GET /1.1/apps/:app_id/connected`

#### Parameters


None known.


### Response

```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```


```json
[{"id":194,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-16T13:33:01+01:00","updated_at":"2019-01-16T13:33:01+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":true,"objects_type":"calendars","objects_url":"/1.1/apps/194/objects"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/apps/404/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer aff5f695d43b9e946637334ae8500a6ac088e6fed2ee0a97e25e066ef0903c46" \
	-H "Cookie: "
```
## list connected apps


### Request

#### Endpoint

```plaintext
GET /1.1/apps/410/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 390b3086a1fabf018480bd5f916c0d3b524f542191adc6e2a4fd67806c6a1a8b
```

`GET /1.1/apps/:app_id/connected`

#### Parameters


None known.


### Response

```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```


```json
[{"id":201,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-16T13:33:02+01:00","updated_at":"2019-01-16T13:33:02+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":false}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/apps/410/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 390b3086a1fabf018480bd5f916c0d3b524f542191adc6e2a4fd67806c6a1a8b" \
	-H "Cookie: "
```
# BudgetRecurrences



## month recurrence list


### Request

#### Endpoint

```plaintext
GET /1.1/865/projects/758/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 48045355777fd692414f30561a28325465fabfd94f644ab858bd586a014272ba
```

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

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



```shell
curl -g "https://api.timelyapp.com/1.1/865/projects/758/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 48045355777fd692414f30561a28325465fabfd94f644ab858bd586a014272ba" \
	-H "Cookie: "
```
## month recurrence list


### Request

#### Endpoint

```plaintext
GET /1.1/866/projects/759/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer c580a349b959db3435cc3098b6de61993fef5a142bd4509998e41b55931fac41
```

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

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



```shell
curl -g "https://api.timelyapp.com/1.1/866/projects/759/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c580a349b959db3435cc3098b6de61993fef5a142bd4509998e41b55931fac41" \
	-H "Cookie: "
```
## week recurrence list


### Request

#### Endpoint

```plaintext
GET /1.1/863/projects/756/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer c4414f8213790338a762d2252f50b4977c7c9df1ab979eff87697342996ca909
```

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

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



```shell
curl -g "https://api.timelyapp.com/1.1/863/projects/756/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c4414f8213790338a762d2252f50b4977c7c9df1ab979eff87697342996ca909" \
	-H "Cookie: "
```
## week recurrence list


### Request

#### Endpoint

```plaintext
GET /1.1/864/projects/757/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer d884809d394def153fab7d7a2a29999701fc2e9894de047206bce4fd390b4df9
```

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

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



```shell
curl -g "https://api.timelyapp.com/1.1/864/projects/757/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d884809d394def153fab7d7a2a29999701fc2e9894de047206bce4fd390b4df9" \
	-H "Cookie: "
```
# Discard Entries



## create


### Request

#### Endpoint

```plaintext
POST /1.1/872/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 78842cfa06acef74c53c348f5bdbd59dfcabb6b8f8b9bcb622ce8d2867767798
```

`POST /1.1/:account_id/suggested_entries/discard`

#### Parameters


```json
{"discard_entries":{"entry_ids":[481]}}
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



```shell
curl "https://api.timelyapp.com/1.1/872/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[481]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 78842cfa06acef74c53c348f5bdbd59dfcabb6b8f8b9bcb622ce8d2867767798" \
	-H "Cookie: "
```
## index


### Request

#### Endpoint

```plaintext
GET /1.1/871/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer 757c3668900d14ab4207113578182b355a3ed1154c5629add81f78601487f803
```

`GET /1.1/:account_id/suggested_entries/discarded`

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
[{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-16","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[480],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","projects":[],"importance":0.8,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/871/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 757c3668900d14ab4207113578182b355a3ed1154c5629add81f78601487f803" \
	-H "Cookie: "
```
## remove


### Request

#### Endpoint

```plaintext
DELETE /1.1/873/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7fd4e5ab45af5c42f9ae8d76f7a8505587b01dc51b292b518e147c0734877add
```

`DELETE /1.1/:account_id/suggested_entries/discard`

#### Parameters


```json
{"discard_entries":{"entry_ids":[484]}}
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



```shell
curl "https://api.timelyapp.com/1.1/873/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[484]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7fd4e5ab45af5c42f9ae8d76f7a8505587b01dc51b292b518e147c0734877add" \
	-H "Cookie: "
```
# Duration



## duration


### Request

#### Endpoint

```plaintext
GET /1.1/entries/durations?entry_ids=485%2C486
Accept: application/json
Content-Type: application/json
Authorization: Bearer b9846daf7896887d7d78ec3f3e78849a0b38a094d756ff40126989ade898e3e8
```

`GET /1.1/entries/durations`

#### Parameters


```json
entry_ids: 485,486
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



```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=485%2C486" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b9846daf7896887d7d78ec3f3e78849a0b38a094d756ff40126989ade898e3e8" \
	-H "Cookie: "
```
## duration


### Request

#### Endpoint

```plaintext
GET /1.1/entries/durations?entry_ids=487%2C488
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7572dfcf17050f83217854809b4f9ba0f18a0d85ee92a9d852a5e3ed1ca10eb9
```

`GET /1.1/entries/durations`

#### Parameters


```json
entry_ids: 487,488
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



```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=487%2C488" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7572dfcf17050f83217854809b4f9ba0f18a0d85ee92a9d852a5e3ed1ca10eb9" \
	-H "Cookie: "
```
## duration


### Request

#### Endpoint

```plaintext
GET /1.1/entries/durations?entry_ids=489%2C490
Accept: application/json
Content-Type: application/json
Authorization: Bearer f3de32a92a16b18dc27beab21f00335ea5ef0b1033f7bd538509c10382474e56
```

`GET /1.1/entries/durations`

#### Parameters


```json
entry_ids: 489,490
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



```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=489%2C490" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f3de32a92a16b18dc27beab21f00335ea5ef0b1033f7bd538509c10382474e56" \
	-H "Cookie: "
```
# Entries



## update deleted


### Request

#### Endpoint

```plaintext
DELETE /1.1/entries/502
Accept: application/json
Content-Type: application/json
Authorization: Bearer 72257442699cb8e36ad1774b9cdb4618d594a4c98b4c5714d74fc35772d4ccbe
```

`DELETE /1.1/entries/:id`

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



```shell
curl "https://api.timelyapp.com/1.1/entries/502" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 72257442699cb8e36ad1774b9cdb4618d594a4c98b4c5714d74fc35772d4ccbe" \
	-H "Cookie: "
```
## with date


### Request

#### Endpoint

```plaintext
GET /1.1/entries?date=2019-01-18
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2bd8b463be14dc70afa0583c09d285fd998ecdbe4bca24cf3659e7332ec9bc5c
```

`GET /1.1/entries`

#### Parameters


```json
date: 2019-01-18
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
[{"id":496,"type":"google_calendar","uid":"916bf5b8-1b50-4838-8213-3a7de61af8f7","title":"Meeting","note":"Discuss about future","description":"13:33 - 17:03 • Discuss about future","date":"2019-01-18","from":"2019-01-16T13:33:10+01:00","to":"2019-01-16T17:03:10+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-16T13:33:10+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/entries?date=2019-01-18" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2bd8b463be14dc70afa0583c09d285fd998ecdbe4bca24cf3659e7332ec9bc5c" \
	-H "Cookie: "
```
## with default params


### Request

#### Endpoint

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 847e5d4c86ca1809a4f6505c6eead488d80ede98762e9a50863808e33db2c065
```

`GET /1.1/entries`

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
[{"id":491,"type":"macOS","uid":"916bf5b8-1b50-4838-8213-3a7de61af8f7","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-16","from":"2019-01-16T13:33:09+01:00","to":"2019-01-16T17:03:09+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-16T13:33:09+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null},{"id":492,"type":"google_calendar","uid":"916bf5b8-1b50-4838-8213-3a7de61af8f7","title":"Meeting","note":"Discuss about future","description":"13:33 - 17:03 • Discuss about future","date":"2019-01-16","from":"2019-01-16T13:33:09+01:00","to":"2019-01-16T17:03:09+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-16T13:33:09+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 847e5d4c86ca1809a4f6505c6eead488d80ede98762e9a50863808e33db2c065" \
	-H "Cookie: "
```
## with entry_ids


### Request

#### Endpoint

```plaintext
GET /1.1/entries?entry_ids=497%2C499
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8688bbb467ca82c26807effc6acbeb89dc915ea6ae1d686bb6c86b50fbbad0a4
```

`GET /1.1/entries`

#### Parameters


```json
entry_ids: 497,499
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
[{"id":497,"type":"macOS","uid":"916bf5b8-1b50-4838-8213-3a7de61af8f7","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-16","from":"2019-01-16T13:33:10+01:00","to":"2019-01-16T17:03:10+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-16T13:33:10+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null},{"id":499,"type":"google_calendar","uid":"916bf5b8-1b50-4838-8213-3a7de61af8f7","title":"Meeting","note":"Discuss about future","description":"13:33 - 17:03 • Discuss about future","date":"2019-01-18","from":"2019-01-16T13:33:10+01:00","to":"2019-01-16T17:03:10+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-16T13:33:10+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=497%2C499" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8688bbb467ca82c26807effc6acbeb89dc915ea6ae1d686bb6c86b50fbbad0a4" \
	-H "Cookie: "
```
# Events



## hour with id


### Request

#### Endpoint

```plaintext
GET /1.1/894/events/789
Accept: application/json
Content-Type: application/json
Authorization: Bearer bcdb708b8aa966afed4ce54007d1175f4a0e1eb1349f950078d63d2b28b59815
```

`GET /1.1/:account_id/events/:id`

#### Parameters


None known.


### Response

```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```


```json
{"id":789,"uid":"45cfd5ba-17cb-4a08-81c3-592339d66232","user":{"id":2061,"email":"quentin@timelyapp.com","name":"Quintin Duponde","active":false,"day_view_onboarded":true,"memory_onboarded":true,"created_at":1547641994,"updated_at":1547641994,"default_hour_rate":0.0,"last_received_memories_date":null,"sign_in_count":null,"external_id":null},"project":{"id":777,"active":true,"account_id":894,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":587,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547641994,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"labels":[]},"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"estimated_duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"cost":{"fractional":17500,"formatted":"$175.00","amount":175.0},"estimated_cost":{"fractional":20000,"formatted":"$200.00","amount":200.0},"day":"2019-01-16","note":"Notes for testing with some random #hash in it.","sequence":1,"estimated":false,"timer_state":"default","timer_started_on":0,"timer_stopped_on":0,"label_ids":[],"user_ids":[],"updated_at":1547641994,"created_at":1547641994,"created_from":"Web","updated_from":"Web","billed":false,"to":"2019-01-16T17:03:14+01:00","from":"2019-01-16T13:33:14+01:00","deleted":false,"hour_rate":50.0,"hour_rate_in_cents":5000.0,"creator_id":null,"updater_id":null,"external_id":null,"entry_ids":[],"suggestion_id":null}
```



```shell
curl -g "https://api.timelyapp.com/1.1/894/events/789" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bcdb708b8aa966afed4ce54007d1175f4a0e1eb1349f950078d63d2b28b59815" \
	-H "Cookie: "
```
## not found


### Request

#### Endpoint

```plaintext
GET /1.1/895/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer d6d29a062460b1f07fab2131e6d62a516da0021ade082574bdd2b593b949139e
```

`GET /1.1/:account_id/events/:id`

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



```shell
curl -g "https://api.timelyapp.com/1.1/895/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d6d29a062460b1f07fab2131e6d62a516da0021ade082574bdd2b593b949139e" \
	-H "Cookie: "
```
# Plans



## plans for appstore


### Request

#### Endpoint

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1c3414e2bfe3af3909c3f27a3be6c4db37cc2abfd2ada09e7b78ad62e284eb2d
```

`GET /1.2/private/plans`

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



```shell
curl -g "https://api.timelyapp.com/1.2/private/plans" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1c3414e2bfe3af3909c3f27a3be6c4db37cc2abfd2ada09e7b78ad62e284eb2d" \
	-H "Cookie: "
```
## plans for playstore


### Request

#### Endpoint

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 82001a95e3b8e69bca739770a3d9e268071d58fb9b903a2ca10a592de0f3dd87
```

`GET /1.2/private/plans`

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



```shell
curl -g "https://api.timelyapp.com/1.2/private/plans" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 82001a95e3b8e69bca739770a3d9e268071d58fb9b903a2ca10a592de0f3dd87" \
	-H "Cookie: "
```
# ProjectSubscriptions



## create project subscribers


### Request

#### Endpoint

```plaintext
POST /1.1/905/projects/788/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer a5c91e300b3147484c9352fd39ac317476992a222e8a6f9db85ac993d23b9cef
```

`POST /1.1/:account_id/projects/:project_id/subscribe`

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



```shell
curl "https://api.timelyapp.com/1.1/905/projects/788/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a5c91e300b3147484c9352fd39ac317476992a222e8a6f9db85ac993d23b9cef" \
	-H "Cookie: "
```
## delete project subscribers


### Request

#### Endpoint

```plaintext
DELETE /1.1/906/projects/789/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 11df77856e8ea23632e9f95e6a16c56424947d81d11fc78708388ac00ffdd575
```

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

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



```shell
curl "https://api.timelyapp.com/1.1/906/projects/789/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 11df77856e8ea23632e9f95e6a16c56424947d81d11fc78708388ac00ffdd575" \
	-H "Cookie: "
```
## list subscribed users


### Request

#### Endpoint

```plaintext
GET /1.1/902/projects/785/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer 90c4b6519ee3d812f23b7c5dc437020c97ceb24075dcaabf90e13d8dc8e00082
```

`GET /1.1/:account_id/projects/:project_id/subscribers`

#### Parameters


None known.


### Response

```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```


```json
[{"id":2077,"email":"quentin@timelyapp.com","name":"Quintin Duponde","avatar":{"timeline":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_timeline.jpg&s=","medium_retina":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","medium":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium.jpg&s="}}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/902/projects/785/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 90c4b6519ee3d812f23b7c5dc437020c97ceb24075dcaabf90e13d8dc8e00082" \
	-H "Cookie: "
```
## show project subscription


### Request

#### Endpoint

```plaintext
GET /1.1/903/projects/786/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0b053706aa560fa964646e9737c57237e17862850b3825588e4d85edea76f9e2
```

`GET /1.1/:account_id/projects/:project_id/subscription`

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



```shell
curl -g "https://api.timelyapp.com/1.1/903/projects/786/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0b053706aa560fa964646e9737c57237e17862850b3825588e4d85edea76f9e2" \
	-H "Cookie: "
```
## show project subscription


### Request

#### Endpoint

```plaintext
GET /1.1/904/projects/787/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer b94927fdb114f6f1fecd74cd4eec829921a1d5f0b618be417ee1d95b591bc554
```

`GET /1.1/:account_id/projects/:project_id/subscription`

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



```shell
curl -g "https://api.timelyapp.com/1.1/904/projects/787/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b94927fdb114f6f1fecd74cd4eec829921a1d5f0b618be417ee1d95b591bc554" \
	-H "Cookie: "
```
# Projects



## Search all projects with query


### Request

#### Endpoint

```plaintext
GET /1.1/917/projects/search?q=Millie
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5bf6577e4376850e43449bc66c83a18580d59e8032c0368cd141d34dcfb7b88f
```

`GET /1.1/:account_id/projects/search`

#### Parameters


```json
q: Millie
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
[{"id":811,"name":"Millie","color":"67a3bc","active":true,"client":{"id":610,"name":"Timely","active":true,"external_id":null}}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/917/projects/search?q=Millie" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5bf6577e4376850e43449bc66c83a18580d59e8032c0368cd141d34dcfb7b88f" \
	-H "Cookie: "
```
## active


### Request

#### Endpoint

```plaintext
GET /1.1/915/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer ac77050e9a3ed669fd711f44504382d7e870b5b02c24cafacf684994d0c6232e
```

`GET /1.1/:account_id/projects`

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
[{"id":802,"active":true,"account_id":915,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":608,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547641999,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2103,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/915/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ac77050e9a3ed669fd711f44504382d7e870b5b02c24cafacf684994d0c6232e" \
	-H "Cookie: "
```
## all


### Request

#### Endpoint

```plaintext
GET /1.1/914/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8ba8eba85a684dfdc9ad8fb1bfb9a49466c80debdc55cc50dd5a33605a81b47c
```

`GET /1.1/:account_id/projects`

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
[{"id":800,"active":true,"account_id":914,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":607,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547641999,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2101,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]},{"id":801,"active":false,"account_id":914,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":607,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547641999,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2101,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/914/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8ba8eba85a684dfdc9ad8fb1bfb9a49466c80debdc55cc50dd5a33605a81b47c" \
	-H "Cookie: "
```
## archived


### Request

#### Endpoint

```plaintext
GET /1.1/916/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer 937821e9b594a84f78071362650af03045d4189644b387bd338b5d76259a076e
```

`GET /1.1/:account_id/projects`

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
[{"id":805,"active":false,"account_id":916,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":609,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547641999,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2105,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/916/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 937821e9b594a84f78071362650af03045d4189644b387bd338b5d76259a076e" \
	-H "Cookie: "
```
## create project


### Request

#### Endpoint

```plaintext
POST /1.1/922/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4c4a680a79ecc8f99184bfa641edb5549525b7b9497084dba3bc364189e5ef5a
```

`POST /1.1/:account_id/projects`

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":615,"budget_type":"M","budget":300,"users":[{"user_id":2117}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
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
{"id":829,"active":true,"account_id":922,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":615,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642001,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2117,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```



```shell
curl "https://api.timelyapp.com/1.1/922/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":615,"budget_type":"M","budget":300,"users":[{"user_id":2117}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4c4a680a79ecc8f99184bfa641edb5549525b7b9497084dba3bc364189e5ef5a" \
	-H "Cookie: "
```
## create project


### Request

#### Endpoint

```plaintext
POST /1.1/919/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer a8309642c1db60885afb823443738290acf80446e0e1351c7768ab94dc393e5d
```

`POST /1.1/:account_id/projects`

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":612,"users":[{"user_id":2111}],"labels":[{"label_id":415},{"label_id":416,"budget":0,"required":false}]}}
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
{"id":826,"active":true,"account_id":919,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":612,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642000,"label_ids":[415,416],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2111,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":415,"budget":null,"required":false},{"label_id":416,"budget":0,"required":false}]}
```



```shell
curl "https://api.timelyapp.com/1.1/919/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":612,"users":[{"user_id":2111}],"labels":[{"label_id":415},{"label_id":416,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a8309642c1db60885afb823443738290acf80446e0e1351c7768ab94dc393e5d" \
	-H "Cookie: "
```
## create project


### Request

#### Endpoint

```plaintext
POST /1.1/920/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5a99fc2cab51ce2ac1198b3346b23ab52d31a3b848ca37a377656e39ae942e73
```

`POST /1.1/:account_id/projects`

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":613,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":2113}],"labels":[{"label_id":417,"budget":100,"required":false},{"label_id":418,"budget":200,"required":true}]}}
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
{"id":827,"active":true,"account_id":920,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":613,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642000,"label_ids":[417,418],"required_label_ids":[418],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2113,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":417,"budget":100,"required":false},{"label_id":418,"budget":200,"required":true}]}
```



```shell
curl "https://api.timelyapp.com/1.1/920/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":613,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":2113}],"labels":[{"label_id":417,"budget":100,"required":false},{"label_id":418,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5a99fc2cab51ce2ac1198b3346b23ab52d31a3b848ca37a377656e39ae942e73" \
	-H "Cookie: "
```
## create project


### Request

#### Endpoint

```plaintext
POST /1.1/921/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer b2756b1dd8d048e02363d199f0669f1e95a65d67a7986b272c6abfc6932a5b84
```

`POST /1.1/:account_id/projects`

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":614,"budget_type":"M","budget":300,"users":[{"user_id":2115}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
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
{"id":828,"active":true,"account_id":921,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":614,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642000,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2115,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```



```shell
curl "https://api.timelyapp.com/1.1/921/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":614,"budget_type":"M","budget":300,"users":[{"user_id":2115}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b2756b1dd8d048e02363d199f0669f1e95a65d67a7986b272c6abfc6932a5b84" \
	-H "Cookie: "
```
## mine with projects


### Request

#### Endpoint

```plaintext
GET /1.1/912/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 054957ed702f2052e77a7d2027b75babdc3b50f3347d3824212369e37effd517
```

`GET /1.1/:account_id/projects`

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
[{"id":796,"active":true,"account_id":912,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":605,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547641998,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":2097,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/912/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 054957ed702f2052e77a7d2027b75babdc3b50f3347d3824212369e37effd517" \
	-H "Cookie: "
```
## mine without projects


### Request

#### Endpoint

```plaintext
GET /1.1/913/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7e9a8fa517f5ec97800e2df32516b14eb7bd6a478262205e91cf5b0b17e74fae
```

`GET /1.1/:account_id/projects`

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



```shell
curl -g "https://api.timelyapp.com/1.1/913/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7e9a8fa517f5ec97800e2df32516b14eb7bd6a478262205e91cf5b0b17e74fae" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/932/projects/839
Accept: application/json
Content-Type: application/json
Authorization: Bearer 47a39bbc969fdc68e3c02224a3874986167eb6107ba43906c73b230094fa4cb2
```

`PUT /1.1/:account_id/projects/:id`

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
{"id":839,"active":true,"account_id":932,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":625,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642003,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```



```shell
curl "https://api.timelyapp.com/1.1/932/projects/839" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 47a39bbc969fdc68e3c02224a3874986167eb6107ba43906c73b230094fa4cb2" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/923/projects/830
Accept: application/json
Content-Type: application/json
Authorization: Bearer 52362dd602700d7c83e2b7c76859de473739b9d78247e8dcdd3dc1d9ed11d3ee
```

`PUT /1.1/:account_id/projects/:id`

#### Parameters


```json
{"project":{"labels":[{"label_id":419},{"label_id":420,"budget":0,"required":false}]}}
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
{"id":830,"active":true,"account_id":923,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":616,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642001,"label_ids":[419,420],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":419,"budget":null,"required":false},{"label_id":420,"budget":0,"required":false}]}
```



```shell
curl "https://api.timelyapp.com/1.1/923/projects/830" -d '{"project":{"labels":[{"label_id":419},{"label_id":420,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 52362dd602700d7c83e2b7c76859de473739b9d78247e8dcdd3dc1d9ed11d3ee" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/924/projects/831
Accept: application/json
Content-Type: application/json
Authorization: Bearer 494eb14fc665ac1b38569fce4363cc51a0f69a14d8224eaee60894213a92fa4e
```

`PUT /1.1/:account_id/projects/:id`

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":421,"budget":100,"required":true},{"label_id":422,"budget":100,"required":true}]}}
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
{"id":831,"active":true,"account_id":924,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":617,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642001,"label_ids":[421,422],"required_label_ids":[421,422],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":200,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":421,"budget":100,"required":true},{"label_id":422,"budget":100,"required":true}]}
```



```shell
curl "https://api.timelyapp.com/1.1/924/projects/831" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":421,"budget":100,"required":true},{"label_id":422,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 494eb14fc665ac1b38569fce4363cc51a0f69a14d8224eaee60894213a92fa4e" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/925/projects/832
Accept: application/json
Content-Type: application/json
Authorization: Bearer 85104437910224140e67a5c0a93bd954017b9c0bdf341b0882f05aecca7da27a
```

`PUT /1.1/:account_id/projects/:id`

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":423,"budget":100,"required":true},{"label_id":424,"budget":100,"required":true},{"label_id":425,"budget":200,"required":true}]}}
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
{"id":832,"active":true,"account_id":925,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":618,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642002,"label_ids":[423,424,425],"required_label_ids":[423,424,425],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":423,"budget":100,"required":true},{"label_id":424,"budget":100,"required":true},{"label_id":425,"budget":200,"required":true}]}
```



```shell
curl "https://api.timelyapp.com/1.1/925/projects/832" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":423,"budget":100,"required":true},{"label_id":424,"budget":100,"required":true},{"label_id":425,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 85104437910224140e67a5c0a93bd954017b9c0bdf341b0882f05aecca7da27a" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/926/projects/833
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1eec01e283c6dbb4d45c3b3c845d09d04ebf151ea8c3bbc1983ca36844bc380b
```

`PUT /1.1/:account_id/projects/:id`

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":428,"budget":400,"required":true}]}}
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
{"id":833,"active":true,"account_id":926,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":619,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642002,"label_ids":[428],"required_label_ids":[428],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":428,"budget":400,"required":true}]}
```



```shell
curl "https://api.timelyapp.com/1.1/926/projects/833" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":428,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1eec01e283c6dbb4d45c3b3c845d09d04ebf151ea8c3bbc1983ca36844bc380b" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/927/projects/834
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3f9410ded9afb72f1da83d17a86f529818d5fcd182e49e6959ec658f22e129c2
```

`PUT /1.1/:account_id/projects/:id`

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
{"id":834,"active":true,"account_id":927,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":620,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642002,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[]}
```



```shell
curl "https://api.timelyapp.com/1.1/927/projects/834" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3f9410ded9afb72f1da83d17a86f529818d5fcd182e49e6959ec658f22e129c2" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/928/projects/835
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3c60c74e84be1e95c54bcecaec11b49bd51deb22f52ca81bf06b4260bfccc4ad
```

`PUT /1.1/:account_id/projects/:id`

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
{"id":835,"active":true,"account_id":928,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":621,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642002,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```



```shell
curl "https://api.timelyapp.com/1.1/928/projects/835" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3c60c74e84be1e95c54bcecaec11b49bd51deb22f52ca81bf06b4260bfccc4ad" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/929/projects/836
Accept: application/json
Content-Type: application/json
Authorization: Bearer 687bddd01f772573e88ee3cc7be4ce56e5827a9ee8ada39fe0ef67f495a51100
```

`PUT /1.1/:account_id/projects/:id`

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
{"id":836,"active":true,"account_id":929,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":622,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1547642003,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```



```shell
curl "https://api.timelyapp.com/1.1/929/projects/836" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 687bddd01f772573e88ee3cc7be4ce56e5827a9ee8ada39fe0ef67f495a51100" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/930/projects/837
Accept: application/json
Content-Type: application/json
Authorization: Bearer a4d5d2b7d554f31300727829938ccb43a77a487660b73c1b0efc959bd2c57793
```

`PUT /1.1/:account_id/projects/:id`

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



```shell
curl "https://api.timelyapp.com/1.1/930/projects/837" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a4d5d2b7d554f31300727829938ccb43a77a487660b73c1b0efc959bd2c57793" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/931/projects/838
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5f9573d8abb44a2bfe78c785276e05a98f9ef6ab255264296f67a700f7de237a
```

`PUT /1.1/:account_id/projects/:id`

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



```shell
curl "https://api.timelyapp.com/1.1/931/projects/838" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5f9573d8abb44a2bfe78c785276e05a98f9ef6ab255264296f67a700f7de237a" \
	-H "Cookie: "
```
# Suggested Entries



## index


### Request

#### Endpoint

```plaintext
GET /1.1/934/suggested_entries?date=2019-01-16
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1881403ad2a4b35fe6e6b8c1a8556bcf3569b1efb0c2e34ecd5f08b8ca40925e
```

`GET /1.1/:account_id/suggested_entries`

#### Parameters


```json
date: 2019-01-16
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
[{"title":"Meeting","note":"Discuss about future","date":"2019-01-16","from":null,"to":null,"description":"14:00 - 15:00 • Discuss about future","entry_ids":[503],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","projects":[],"importance":0,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60}},{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-16","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[504,505],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","projects":[{"project_id":841,"accuracy":0.8,"count":2}],"importance":0.8,"duration":{"hours":7,"minutes":0,"seconds":0,"formatted":"07:00","total_hours":7.0,"total_seconds":25200,"total_minutes":420}},{"title":"Congratulations on winning $100000","note":"You won $100000, share your netbanking details","date":"2019-01-16","from":null,"to":null,"description":" • You won $100000, share your netbanking details","entry_ids":[506],"icon_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","icon_fallback_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","projects":[{"project_id":841,"accuracy":0.8,"count":1}],"importance":0,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/934/suggested_entries?date=2019-01-16" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1881403ad2a4b35fe6e6b8c1a8556bcf3569b1efb0c2e34ecd5f08b8ca40925e" \
	-H "Cookie: "
```
## update


### Request

#### Endpoint

```plaintext
PUT /1.1/935/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 38f13e1657c44139e0be6efc7f122c9fe5148c0a342472d287f48662839d23c5
```

`PUT /1.1/:account_id/suggested_entries`

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":508,"project_id":843}]}}
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



```shell
curl "https://api.timelyapp.com/1.1/935/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":508,"project_id":843}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 38f13e1657c44139e0be6efc7f122c9fe5148c0a342472d287f48662839d23c5" \
	-H "Cookie: "
```
# Suggested Hours



## default


### Request

#### Endpoint

```plaintext
GET /1.1/936/suggested_hours?date=2019-01-16
Accept: application/json
Content-Type: application/json
Authorization: Bearer d4e1a9cd272b8dd1ca907e1ddbf392fd05c6e0e2b115ea46cafe1ab9805583a1
```

`GET /1.1/:account_id/suggested_hours`

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
[{"id":63,"owner":{"id":585,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":844,"date":"2019-01-16","to":"2019-01-16T17:03:24+01:00","from":"2019-01-16T13:33:24+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-16T13:33:24+01:00","suggested_entry_ids":[511,512],"version":"0.2.0","updated_at":"2019-01-16T13:33:24+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/936/suggested_hours?date=2019-01-16" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d4e1a9cd272b8dd1ca907e1ddbf392fd05c6e0e2b115ea46cafe1ab9805583a1" \
	-H "Cookie: "
```
## show


### Request

#### Endpoint

```plaintext
GET /1.1/942/suggested_hours/75
Accept: application/json
Content-Type: application/json
Authorization: Bearer d7774f893905ebf56f07850ffc3fbee4903c4831c1c416514daebcb31e88ecf2
```

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

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
{"id":75,"owner":{"id":591,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":850,"date":"2019-01-16","to":"2019-01-16T17:03:26+01:00","from":"2019-01-16T13:33:26+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-16T13:33:26+01:00","suggested_entry_ids":[535,536],"version":"0.2.0","updated_at":"2019-01-16T13:33:26+01:00"}
```



```shell
curl -g "https://api.timelyapp.com/1.1/942/suggested_hours/75" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d7774f893905ebf56f07850ffc3fbee4903c4831c1c416514daebcb31e88ecf2" \
	-H "Cookie: "
```
## since and until


### Request

#### Endpoint

```plaintext
GET /1.1/938/suggested_hours?date=2019-01-16&amp;since=2019-01-14&amp;until=2019-01-16
Accept: application/json
Content-Type: application/json
Authorization: Bearer e9866c6c32dbe083d41b5a80dc61e73e27263a5c4eddc36fe3b846e20f43e8df
```

`GET /1.1/:account_id/suggested_hours`

#### Parameters


```json
date: 2019-01-16
since: 2019-01-14
until: 2019-01-16
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
[{"id":67,"owner":{"id":587,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":846,"date":"2019-01-16","to":"2019-01-16T17:03:25+01:00","from":"2019-01-16T13:33:25+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-16T13:33:25+01:00","suggested_entry_ids":[519,520],"version":"0.2.0","updated_at":"2019-01-16T13:33:25+01:00"},{"id":68,"owner":{"id":587,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":846,"date":"2019-01-14","to":"2019-01-16T17:03:25+01:00","from":"2019-01-16T13:33:25+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-16T13:33:25+01:00","suggested_entry_ids":[521],"version":"0.2.0","updated_at":"2019-01-16T13:33:25+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/938/suggested_hours?date=2019-01-16&since=2019-01-14&until=2019-01-16" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e9866c6c32dbe083d41b5a80dc61e73e27263a5c4eddc36fe3b846e20f43e8df" \
	-H "Cookie: "
```
## suggested hour ids


### Request

#### Endpoint

```plaintext
GET /1.1/939/suggested_hours?date=2019-01-16&amp;suggested_hour_ids=69
Accept: application/json
Content-Type: application/json
Authorization: Bearer 181caccf830735059a88380be8d7e3856c4e63db1e93bdbfa5a90cd1013f937c
```

`GET /1.1/:account_id/suggested_hours`

#### Parameters


```json
date: 2019-01-16
suggested_hour_ids: 69
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
[{"id":69,"owner":{"id":588,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":847,"date":"2019-01-16","to":"2019-01-16T17:03:25+01:00","from":"2019-01-16T13:33:25+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-16T13:33:25+01:00","suggested_entry_ids":[523,524],"version":"0.2.0","updated_at":"2019-01-16T13:33:25+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/939/suggested_hours?date=2019-01-16&suggested_hour_ids=69" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 181caccf830735059a88380be8d7e3856c4e63db1e93bdbfa5a90cd1013f937c" \
	-H "Cookie: "
```
## update


### Request

#### Endpoint

```plaintext
PUT /1.1/940/suggested_hours/71
Accept: application/json
Content-Type: application/json
Authorization: Bearer d3a5b273b89c46f16b428b23e88b6eec0a6f56574ae8a4b95867c0650913de97
```

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

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
{"id":71,"owner":{"id":589,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":848,"date":"2019-01-16","to":"2019-01-16T17:03:26+01:00","from":"2019-01-16T13:33:26+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"dismissed","source":"prediction","created_at":"2019-01-16T13:33:26+01:00","suggested_entry_ids":[527,528],"version":"0.2.0","updated_at":"2019-01-16T13:33:26+01:00"}
```



```shell
curl "https://api.timelyapp.com/1.1/940/suggested_hours/71" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d3a5b273b89c46f16b428b23e88b6eec0a6f56574ae8a4b95867c0650913de97" \
	-H "Cookie: "
```
## update


### Request

#### Endpoint

```plaintext
PUT /1.1/941/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4a64c86e486dcc0a4dfac11581dbaa1e4aa23b4f67816d953e738d9471af8855
```

`PUT /1.1/:account_id/suggested_hours/decline`

#### Parameters


```json
{"suggested_hour_ids":[73]}
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



```shell
curl "https://api.timelyapp.com/1.1/941/suggested_hours/decline" -d '{"suggested_hour_ids":[73]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4a64c86e486dcc0a4dfac11581dbaa1e4aa23b4f67816d953e738d9471af8855" \
	-H "Cookie: "
```
## with date


### Request

#### Endpoint

```plaintext
GET /1.1/937/suggested_hours?date=2019-01-14
Accept: application/json
Content-Type: application/json
Authorization: Bearer dd0be903752f2aa7744a0ac615613c3976c165ce4197c0453638303655bb08f2
```

`GET /1.1/:account_id/suggested_hours`

#### Parameters


```json
date: 2019-01-14
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
[{"id":66,"owner":{"id":586,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":845,"date":"2019-01-14","to":"2019-01-16T17:03:25+01:00","from":"2019-01-16T13:33:25+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-16T13:33:25+01:00","suggested_entry_ids":[517],"version":"0.2.0","updated_at":"2019-01-16T13:33:25+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/937/suggested_hours?date=2019-01-14" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer dd0be903752f2aa7744a0ac615613c3976c165ce4197c0453638303655bb08f2" \
	-H "Cookie: "
```
# Training Entries



## create


### Request

#### Endpoint

```plaintext
POST /1.1/949/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer fa89d7e46961dcffed5d73177fa004336546677b041de8af256837941817383f
```

`POST /1.1/:account_id/training_entries`

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":542,"project_id":856}]}}
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



```shell
curl "https://api.timelyapp.com/1.1/949/training_entries" -d '{"training_entries":{"entries":[{"entry_id":542,"project_id":856}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fa89d7e46961dcffed5d73177fa004336546677b041de8af256837941817383f" \
	-H "Cookie: "
```
## list


### Request

#### Endpoint

```plaintext
GET /1.1/948/training_entries?date=2019-01-16
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7254e028e21fbe03ad22d70907be1882b824e90db04a5eb4753ece3d915189cf
```

`GET /1.1/:account_id/training_entries`

#### Parameters


```json
date: 2019-01-16
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
[{"id":539,"type":"macOS","uid":"916bf5b8-1b50-4838-8213-3a7de61af8f7","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-16","from":"2019-01-16T10:00:00+01:00","to":"2019-01-16T12:00:00+01:00","entry_type":null,"duration":{"hours":2,"minutes":0,"seconds":0,"formatted":"02:00","total_hours":2.0,"total_seconds":7200,"total_minutes":120},"at":"2019-01-16T10:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null,"score":0.8},{"id":540,"type":"macOS","uid":"916bf5b8-1b50-4838-8213-3a7de61af8f7","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-16","from":"2019-01-16T14:00:00+01:00","to":"2019-01-16T15:00:00+01:00","entry_type":null,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60},"at":"2019-01-16T14:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/assets/timeline_app_logos/default-ec843823aa8fa1357fc233024c47d3f11adcd237244768bcc7bb9672b77bd8ac.png","url":null,"score":0.6}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/948/training_entries?date=2019-01-16" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7254e028e21fbe03ad22d70907be1882b824e90db04a5eb4753ece3d915189cf" \
	-H "Cookie: "
```
## update


### Request

#### Endpoint

```plaintext
POST /1.1/950/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 50d98e782f8be0da431026c864a7a63ad15a65aa59e1f4645dc76ebd385e2f19
```

`POST /1.1/:account_id/training_entries`

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":544,"project_id":857},{"entry_id":543,"project_id":857}]}}
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



```shell
curl "https://api.timelyapp.com/1.1/950/training_entries" -d '{"training_entries":{"entries":[{"entry_id":544,"project_id":857},{"entry_id":543,"project_id":857}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 50d98e782f8be0da431026c864a7a63ad15a65aa59e1f4645dc76ebd385e2f19" \
	-H "Cookie: "
```
# Upgrade



## upgrade account plan from web account


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/961/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer b26375efbff5f4ab1888b23bb2e962f02aceb979173aae9eba670c6932384f8e
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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



```shell
curl "https://api.timelyapp.com/1.2/private/accounts/961/upgrade" -d '{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b26375efbff5f4ab1888b23bb2e962f02aceb979173aae9eba670c6932384f8e" \
	-H "Cookie: "
```
## upgrade account plan from web account


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/963/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2a2bca0705db0cf633049403dd3a71d991b3c8693a31f72461e4b31d0b8eaf11
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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



```shell
curl "https://api.timelyapp.com/1.2/private/accounts/963/upgrade" -d '{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2a2bca0705db0cf633049403dd3a71d991b3c8693a31f72461e4b31d0b8eaf11" \
	-H "Cookie: "
```
## upgrade account plan to essential


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/960/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer abfd0a69c9e5eff6104f396dc839016cfd25bbca045d2cea2074606ec7f76a4c
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
{"id":960,"name":"Timely","from":"Web","max_users":0,"max_projects":0,"num_users":2,"num_projects":0,"plan_id":28,"plan_name":"Essential","next_charge":"2019-02-16","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1547642012,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"essential","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTAzMjA0MTIsInYiOjAsImlhdCI6MTU0NzY0MjAxMiwiZCI6eyJ1c2VyX2lkIjoiMjIxNiIsImFjY291bnRfaWQiOiI5NjAiLCJ1c2VyX3R5cGUiOiJub3JtYWwiLCJ1aWQiOiJlMjBjMmJkMTZkMjVlY2I3MjEwNjY4ZTAwN2VjOGM5OSJ9fQ.vO3YCIqYqq4t-HxatsE6wO1bq0e0Mm_-C2VVJ8nQWb8"}
```



```shell
curl "https://api.timelyapp.com/1.2/private/accounts/960/upgrade" -d '{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer abfd0a69c9e5eff6104f396dc839016cfd25bbca045d2cea2074606ec7f76a4c" \
	-H "Cookie: "
```
## upgrade account plan to solo


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/959/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 27509d05d6955d9d5ab27ad1fdf0dfeb64689d89358e652cf0cc18d41959b7a8
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
{"id":959,"name":"Timely","from":"Web","max_users":1,"max_projects":3,"num_users":2,"num_projects":0,"plan_id":34,"plan_name":"Solo","next_charge":"2019-02-16","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1547642012,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"solo_v1","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTAzMjA0MTIsInYiOjAsImlhdCI6MTU0NzY0MjAxMiwiZCI6eyJ1c2VyX2lkIjoiMjIxNCIsImFjY291bnRfaWQiOiI5NTkiLCJ1c2VyX3R5cGUiOiJub3JtYWwiLCJ1aWQiOiI0NDhiMGQzZDJkOTk2NDZmZTYyMTg0NTMyMmEwOTMxYSJ9fQ.D23-ki1Pt3iXzUJO8GhMCSUQUmged3lJYAnCTpTbCd4"}
```



```shell
curl "https://api.timelyapp.com/1.2/private/accounts/959/upgrade" -d '{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 27509d05d6955d9d5ab27ad1fdf0dfeb64689d89358e652cf0cc18d41959b7a8" \
	-H "Cookie: "
```
## upgrade for duplicate appstore_transaction_id


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/965/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 276c6bc4fa6b7fc1e093807fc9ef1b89e1c018e0174e331ea78e88498f20e816
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}
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



```shell
curl "https://api.timelyapp.com/1.2/private/accounts/965/upgrade" -d '{"account":{"next_charge":"2019-02-16","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 276c6bc4fa6b7fc1e093807fc9ef1b89e1c018e0174e331ea78e88498f20e816" \
	-H "Cookie: "
```
# User Onboarding



## create or update properties


### Request

#### Endpoint

```plaintext
PUT /user_onboarding
Accept: application/json
Content-Type: application/json
```

`PUT /user_onboarding`

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
[{"user_id":1969,"property":"has_seen_calendar_day","value":"yes","updated_at":"2019-01-16T13:32:59+01:00"},{"user_id":1969,"property":"has_seen_calendar_week","value":"no","updated_at":"2019-01-16T13:32:59+01:00"}]
```



```shell
curl "https://api.timelyapp.com/user_onboarding" -d '{"user_onboarding":{"user_onboarding_properties":[{"property":"has_seen_calendar_day","value":"yes"},{"property":"has_seen_calendar_week","value":"no"}]}}' -X PUT \
	-H "Host: app.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Cookie: "
```
## list properties


### Request

#### Endpoint

```plaintext
GET /user_onboarding
Accept: application/json
Content-Type: application/json
```

`GET /user_onboarding`

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
[{"user_id":1968,"property":"has_seen_calendar_week","value":"yes","updated_at":"2019-01-16T13:32:59+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/user_onboarding" -X GET \
	-H "Host: app.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Cookie: "
```
# Users



## Search all users with query


### Request

#### Endpoint

```plaintext
GET /1.1/957/users/search?q=Sonja+Kohler+MD
Accept: application/json
Content-Type: application/json
Authorization: Bearer b11bad89397fa839044105096f18e9a6af04608d9c42b2a79516b8adeb436382
```

`GET /1.1/:account_id/users/search`

#### Parameters


```json
q: Sonja Kohler MD
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
[{"id":2196,"email":"mitsue_dach@gmail.com","name":"Sonja Kohler MD","active":false,"external_id":null,"avatar":{"large":"https://www.gravatar.com/avatar/d12e3ea0f3388521a26e62f8db44e41e?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200","medium":"https://www.gravatar.com/avatar/d12e3ea0f3388521a26e62f8db44e41e?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","small":"https://www.gravatar.com/avatar/d12e3ea0f3388521a26e62f8db44e41e?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"},"updated_at":1547642011}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/957/users/search?q=Sonja+Kohler+MD" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b11bad89397fa839044105096f18e9a6af04608d9c42b2a79516b8adeb436382" \
	-H "Cookie: "
```
