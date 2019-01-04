---
title: Timely Internal API doc
language_tabs:
  - json: JSON
  - shell: cURL
---

Use Timely API to integrate with your apps
# AppObjects



## create calendar


### Request

#### Endpoint

```plaintext
PUT /1.1/apps/1173/objects/1173
Accept: application/json
Content-Type: application/json
Authorization: Bearer f292234740d2fb260d06c243bd97841ec2bc713281afe35c07ba4954d64e6659
```

`PUT /1.1/apps/:app_id/objects/:id`

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70307886040700}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-04T12:54:59+01:00","auto_import":true,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-04T12:54:59+01:00","auto_import":false,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```



```shell
curl "https://api.timelyapp.com/1.1/apps/1173/objects/1173" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70307886040700}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f292234740d2fb260d06c243bd97841ec2bc713281afe35c07ba4954d64e6659" \
	-H "Cookie: "
```
## delete calendar


### Request

#### Endpoint

```plaintext
PUT /1.1/apps/1175/objects/1175
Accept: application/json
Content-Type: application/json
Authorization: Bearer d8e5144aeaa67ce19978ca5e1a0b991a08fdae4aa4f60177c012ca576fb1bc70
```

`PUT /1.1/apps/:app_id/objects/:id`

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70307904436340}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-04T12:54:59+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":false},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```



```shell
curl "https://api.timelyapp.com/1.1/apps/1175/objects/1175" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70307904436340}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d8e5144aeaa67ce19978ca5e1a0b991a08fdae4aa4f60177c012ca576fb1bc70" \
	-H "Cookie: "
```
## list objects


### Request

#### Endpoint

```plaintext
GET /1.1/apps/1171/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 83ef3682db0ce5778e748f4aa369c5f5d65795722daa1066bb2930210aa82d9d
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
curl -g "https://api.timelyapp.com/1.1/apps/1171/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 83ef3682db0ce5778e748f4aa369c5f5d65795722daa1066bb2930210aa82d9d" \
	-H "Cookie: "
```
## list objects


### Request

#### Endpoint

```plaintext
GET /1.1/apps/1172/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 38bfa1b7cef7e3bff043275febde3a4e00c5c09b40c431776faf49693b1b9126
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
curl -g "https://api.timelyapp.com/1.1/apps/1172/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 38bfa1b7cef7e3bff043275febde3a4e00c5c09b40c431776faf49693b1b9126" \
	-H "Cookie: "
```
## update calendar


### Request

#### Endpoint

```plaintext
PUT /1.1/apps/1174/objects/1174
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7d0d71ea5501a5fa0b770b613794e4204b24715ccb0aef26399da911a8e708ed
```

`PUT /1.1/apps/:app_id/objects/:id`

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70307907286440}}
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
[{"object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","name":"Fixtures","etag":"\"1482740512308000\"","integrated":true,"updated_at":"2019-01-04T12:54:59+01:00","auto_import":false,"project_id":1},{"object_id":"anup@timelyapp.com","name":"anup@timelyapp.com","etag":"\"1457979055759000\"","integrated":true,"updated_at":"2019-01-04T12:54:59+01:00","auto_import":true,"project_id":2},{"object_id":"timelyapp.com_3qaj6ftsa591l17r3hgra4hn08@group.calendar.google.com","name":"Calendar Sync Test","etag":"\"1457979057839000\"","integrated":false},{"object_id":"timelyapp.com_5q9rqm0eqi68rb1r101o3bv1jo@group.calendar.google.com","name":"Timely Trials","etag":"\"1457979060008000\"","integrated":false},{"object_id":"timelyapp.com_uhbt0atpl6irjbcugvs1kee5j4@group.calendar.google.com","name":"Calendar Sync II","etag":"\"1457979061137000\"","integrated":false},{"object_id":"timelyapp.com_hhm9t83jh3rkdn6ni429g1tc4o@group.calendar.google.com","name":"Calendar integration","etag":"\"1469680526663000\"","integrated":false},{"object_id":"timelyapp.com_7veb7perd2p238atf210cps1n8@group.calendar.google.com","name":"Calendar Sync III","etag":"\"1457979056819000\"","integrated":false}]
```



```shell
curl "https://api.timelyapp.com/1.1/apps/1174/objects/1174" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70307907286440}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7d0d71ea5501a5fa0b770b613794e4204b24715ccb0aef26399da911a8e708ed" \
	-H "Cookie: "
```
# Apps



## delete connected app


### Request

#### Endpoint

```plaintext
DELETE /1.1/apps/1556/connected/1193
Accept: application/json
Content-Type: application/json
Authorization: Bearer d13d35c2a5dc189cac7e08111187740e1196607784567e0285c1b87c76589178
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
curl "https://api.timelyapp.com/1.1/apps/1556/connected/1193" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d13d35c2a5dc189cac7e08111187740e1196607784567e0285c1b87c76589178" \
	-H "Cookie: "
```
## list apps


### Request

#### Endpoint

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer bde07aeb043de9fa34227304a3076c02b8ccfa0dc284afb5696688bd3c1b6d79
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
[{"app_id":1542,"id":"google_calendar","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-04T12:54:59+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Google Calendar entries.","provider":"Google","provider_url":"https://calendar.google.com","screenshots":["screenshots/google_calendar/screenshot1.png"],"logo_path":"apps_logo/google_calendar.png","authorize_url":"/auth/google_calendar/authorize","connected_apps_url":"/apps/1542/connected"},{"app_id":1543,"id":"office365","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-04T12:54:59+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"Auto-import recurring, multi-day and full-day calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Office 365 entries.","provider":"Microsoft","provider_url":"https://products.office.com/en-us/business/explore-office-365-for-business","screenshots":["screenshots/office365/screenshot1.png"],"logo_path":"apps_logo/office365.png","authorize_url":"/auth/office365/authorize","connected_apps_url":"/apps/1543/connected"},{"app_id":1544,"id":"gmail","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":0,"connected_integrations_count":1,"first_created_at":"2019-01-04T12:54:59+01:00","last_imported_at":null,"platforms":["ios","android"],"summary":"See exactly how much time you spend managing your Gmail each day. All the emails you send in a day will automatically appear in your private Memory timeline for easy reference.","provider":"Google","provider_url":"https://gmail.com/","screenshots":["screenshots/gmail/screenshot1.png"],"logo_path":"apps_logo/gmail.png","authorize_url":"/auth/gmail/authorize","connected_apps_url":"/apps/1544/connected"},{"app_id":1545,"id":"moves_app","display_name":"Display name","description":"Get all your calendar events imported directly into Timely as\n    planned time.","layout":"list","integrated":true,"disconnected_integrations_count":1,"connected_integrations_count":1,"first_created_at":"2019-01-02T12:54:59+01:00","last_imported_at":"2019-01-03T12:54:59+01:00","platforms":["ios","android"],"summary":"Track off-site meetings, travel for work and the time you spend in the office every day. Essential for on-the-go professionals who need to record where they’ve been and for how long.","provider":"Facebook","provider_url":"https://moves-app.com/","screenshots":["screenshots/moves_app/screenshot1.png","screenshots/moves_app/screenshot2.png"],"logo_path":"apps_logo/moves_app.png","authorize_url":"/auth/moves_app/authorize","connected_apps_url":"/apps/1545/connected"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/apps" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bde07aeb043de9fa34227304a3076c02b8ccfa0dc284afb5696688bd3c1b6d79" \
	-H "Cookie: "
```
## list connected apps


### Request

#### Endpoint

```plaintext
GET /1.1/apps/1546/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer 118e6994e9e7e01ad4c40484606864cbf50df0a3d409bfa457ac216526c6f454
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
[{"id":1181,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-04T12:55:00+01:00","updated_at":"2019-01-04T12:55:00+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":true,"objects_type":"calendars","objects_url":"/1.1/apps/1181/objects"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/apps/1546/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 118e6994e9e7e01ad4c40484606864cbf50df0a3d409bfa457ac216526c6f454" \
	-H "Cookie: "
```
## list connected apps


### Request

#### Endpoint

```plaintext
GET /1.1/apps/1552/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer a9d51463e54176546e6c765205105fc7ba4503fb5d3fe5a4f4b75003b764cf23
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
[{"id":1188,"name":"Tom Hardy","email":"tom@timelyapp.com","active":true,"created_at":"2019-01-04T12:55:00+01:00","updated_at":"2019-01-04T12:55:00+01:00","last_imported_at":null,"disconnected":false,"disconnected_reason":null,"objects":false}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/apps/1552/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a9d51463e54176546e6c765205105fc7ba4503fb5d3fe5a4f4b75003b764cf23" \
	-H "Cookie: "
```
# BudgetRecurrences



## month recurrence list


### Request

#### Endpoint

```plaintext
GET /1.1/5889/projects/4691/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer ce464780d73230fc09297db014a297f8b36326ea12199c1ef0dad76d2f88f973
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
curl -g "https://api.timelyapp.com/1.1/5889/projects/4691/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ce464780d73230fc09297db014a297f8b36326ea12199c1ef0dad76d2f88f973" \
	-H "Cookie: "
```
## month recurrence list


### Request

#### Endpoint

```plaintext
GET /1.1/5890/projects/4692/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 55662ac217982f5b9dfdd90cf645e738e27ed3a19bfcb4cd057170d0f59e4be8
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
curl -g "https://api.timelyapp.com/1.1/5890/projects/4692/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 55662ac217982f5b9dfdd90cf645e738e27ed3a19bfcb4cd057170d0f59e4be8" \
	-H "Cookie: "
```
## week recurrence list


### Request

#### Endpoint

```plaintext
GET /1.1/5887/projects/4689/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer e10c07722047806452c2c72b394c011e7a5f4cb21c7d7f2cc19f62066a69b7b7
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
curl -g "https://api.timelyapp.com/1.1/5887/projects/4689/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e10c07722047806452c2c72b394c011e7a5f4cb21c7d7f2cc19f62066a69b7b7" \
	-H "Cookie: "
```
## week recurrence list


### Request

#### Endpoint

```plaintext
GET /1.1/5888/projects/4690/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 99eaccf538e6a624bf0395c0c67e9270d55b396e5bc1fe39a59bc80346f92290
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
curl -g "https://api.timelyapp.com/1.1/5888/projects/4690/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 99eaccf538e6a624bf0395c0c67e9270d55b396e5bc1fe39a59bc80346f92290" \
	-H "Cookie: "
```
# Discard Entries



## create


### Request

#### Endpoint

```plaintext
POST /1.1/5895/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 97c3b81e603ba38800e9c8162881efad81ca0344b7ced18c9d38121fb83dc2fc
```

`POST /1.1/:account_id/suggested_entries/discard`

#### Parameters


```json
{"discard_entries":{"entry_ids":[1375]}}
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
curl "https://api.timelyapp.com/1.1/5895/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[1375]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 97c3b81e603ba38800e9c8162881efad81ca0344b7ced18c9d38121fb83dc2fc" \
	-H "Cookie: "
```
## index


### Request

#### Endpoint

```plaintext
GET /1.1/5894/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2c7a89c16d29f71982d5643368e4ff0b6556c6ed23653a69f29cbb66e93579b5
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
[{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-04","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[1374],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/timeline_app_logos/macvim.png","projects":[],"importance":0.8,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5894/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2c7a89c16d29f71982d5643368e4ff0b6556c6ed23653a69f29cbb66e93579b5" \
	-H "Cookie: "
```
## remove


### Request

#### Endpoint

```plaintext
DELETE /1.1/5896/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5c5ba8574128df1bc3867d3ca7dd767f5b5f65d9b1219f9373531f65354ae501
```

`DELETE /1.1/:account_id/suggested_entries/discard`

#### Parameters


```json
{"discard_entries":{"entry_ids":[1378]}}
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
curl "https://api.timelyapp.com/1.1/5896/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[1378]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5c5ba8574128df1bc3867d3ca7dd767f5b5f65d9b1219f9373531f65354ae501" \
	-H "Cookie: "
```
# Duration



## duration


### Request

#### Endpoint

```plaintext
GET /1.1/entries/durations?entry_ids=1379%2C1380
Accept: application/json
Content-Type: application/json
Authorization: Bearer f5ebdfae9ea24835d6ed7ebfbaedd6c0023e570b3b2ecded05033059fadc6224
```

`GET /1.1/entries/durations`

#### Parameters


```json
entry_ids: 1379,1380
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=1379%2C1380" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f5ebdfae9ea24835d6ed7ebfbaedd6c0023e570b3b2ecded05033059fadc6224" \
	-H "Cookie: "
```
## duration


### Request

#### Endpoint

```plaintext
GET /1.1/entries/durations?entry_ids=1381%2C1382
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8f20974c0ed67676ab6c811a19293a0d75088b317475d69b423d3ec648b019a3
```

`GET /1.1/entries/durations`

#### Parameters


```json
entry_ids: 1381,1382
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=1381%2C1382" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8f20974c0ed67676ab6c811a19293a0d75088b317475d69b423d3ec648b019a3" \
	-H "Cookie: "
```
## duration


### Request

#### Endpoint

```plaintext
GET /1.1/entries/durations?entry_ids=1383%2C1384
Accept: application/json
Content-Type: application/json
Authorization: Bearer a1f54fb5a76533a77f7f75d25d8b9ca0c31ed6adc742ff52088125d4c4f7cc1e
```

`GET /1.1/entries/durations`

#### Parameters


```json
entry_ids: 1383,1384
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
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=1383%2C1384" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a1f54fb5a76533a77f7f75d25d8b9ca0c31ed6adc742ff52088125d4c4f7cc1e" \
	-H "Cookie: "
```
# Entries



## update deleted


### Request

#### Endpoint

```plaintext
DELETE /1.1/entries/1396
Accept: application/json
Content-Type: application/json
Authorization: Bearer 82b714b3e617e09a976ada190b91f0b6d05fa02fd1674580c73ea6c3267bf625
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
curl "https://api.timelyapp.com/1.1/entries/1396" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 82b714b3e617e09a976ada190b91f0b6d05fa02fd1674580c73ea6c3267bf625" \
	-H "Cookie: "
```
## with date


### Request

#### Endpoint

```plaintext
GET /1.1/entries?date=2019-01-06
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8de7d5178279c8fd7fc6d3cafef1d1a1b45b26edb08e094ed15ead0100e9dfb8
```

`GET /1.1/entries`

#### Parameters


```json
date: 2019-01-06
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
[{"id":1390,"type":"google_calendar","uid":"1b627e20-02ce-4dc4-bcf2-394eb34d600f","title":"Meeting","note":"Discuss about future","description":"12:55 - 16:25 • Discuss about future","date":"2019-01-06","from":"2019-01-04T12:55:08+01:00","to":"2019-01-04T16:25:08+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-04T12:55:08+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/entries?date=2019-01-06" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8de7d5178279c8fd7fc6d3cafef1d1a1b45b26edb08e094ed15ead0100e9dfb8" \
	-H "Cookie: "
```
## with default params


### Request

#### Endpoint

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 067637c07be6b37c0b9871b1ad838690372fa8fd7bb3f4752d90ec33fbb59a93
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
[{"id":1385,"type":"macOS","uid":"1b627e20-02ce-4dc4-bcf2-394eb34d600f","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-04","from":"2019-01-04T12:55:06+01:00","to":"2019-01-04T16:25:06+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-04T12:55:06+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/timeline_app_logos/macvim.png","url":null},{"id":1386,"type":"google_calendar","uid":"1b627e20-02ce-4dc4-bcf2-394eb34d600f","title":"Meeting","note":"Discuss about future","description":"12:55 - 16:25 • Discuss about future","date":"2019-01-04","from":"2019-01-04T12:55:06+01:00","to":"2019-01-04T16:25:06+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-04T12:55:06+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 067637c07be6b37c0b9871b1ad838690372fa8fd7bb3f4752d90ec33fbb59a93" \
	-H "Cookie: "
```
## with entry_ids


### Request

#### Endpoint

```plaintext
GET /1.1/entries?entry_ids=1391%2C1393
Accept: application/json
Content-Type: application/json
Authorization: Bearer a0e544d9f82b5962ee64cf5eab3677b42fc6d1d3023bd38db17db76ac3aa834b
```

`GET /1.1/entries`

#### Parameters


```json
entry_ids: 1391,1393
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
[{"id":1391,"type":"macOS","uid":"1b627e20-02ce-4dc4-bcf2-394eb34d600f","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-04","from":"2019-01-04T12:55:08+01:00","to":"2019-01-04T16:25:08+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-04T12:55:08+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/timeline_app_logos/macvim.png","url":null},{"id":1393,"type":"google_calendar","uid":"1b627e20-02ce-4dc4-bcf2-394eb34d600f","title":"Meeting","note":"Discuss about future","description":"12:55 - 16:25 • Discuss about future","date":"2019-01-06","from":"2019-01-04T12:55:08+01:00","to":"2019-01-04T16:25:08+01:00","entry_type":null,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"at":"2019-01-04T12:55:08+01:00","extra_attributes":[],"icon":"google_calendar.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","url":null}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=1391%2C1393" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer a0e544d9f82b5962ee64cf5eab3677b42fc6d1d3023bd38db17db76ac3aa834b" \
	-H "Cookie: "
```
# Events



## hour with id


### Request

#### Endpoint

```plaintext
GET /1.1/5913/events/5782
Accept: application/json
Content-Type: application/json
Authorization: Bearer 32006901b258eb8c54a9bbf5c1cba3f982cc5d5c068e9dac9044276d0388bad6
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
{"id":5782,"uid":"38a78222-df9e-4aa2-91d5-2ce443a00298","user":{"id":13833,"email":"quentin@timelyapp.com","name":"Quintin Duponde","active":false,"day_view_onboarded":true,"memory_onboarded":true,"created_at":1546602912,"updated_at":1546602912,"default_hour_rate":0.0,"last_received_memories_date":null,"sign_in_count":null,"external_id":null},"project":{"id":4705,"active":true,"account_id":5913,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3504,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602912,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"labels":[]},"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"estimated_duration":{"hours":4,"minutes":0,"seconds":0,"formatted":"04:00","total_hours":4.0,"total_seconds":14400,"total_minutes":240},"cost":{"fractional":17500,"formatted":"$175.00","amount":175.0},"estimated_cost":{"fractional":20000,"formatted":"$200.00","amount":200.0},"day":"2019-01-04","note":"Notes for testing with some random #hash in it.","sequence":1,"estimated":false,"timer_state":"default","timer_started_on":0,"timer_stopped_on":0,"label_ids":[],"user_ids":[],"updated_at":1546602912,"created_at":1546602912,"created_from":"Web","updated_from":"Web","billed":false,"to":"2019-01-04T16:25:12+01:00","from":"2019-01-04T12:55:12+01:00","deleted":false,"hour_rate":50.0,"hour_rate_in_cents":5000.0,"creator_id":null,"updater_id":null,"external_id":null,"entry_ids":[],"suggestion_id":null}
```



```shell
curl -g "https://api.timelyapp.com/1.1/5913/events/5782" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 32006901b258eb8c54a9bbf5c1cba3f982cc5d5c068e9dac9044276d0388bad6" \
	-H "Cookie: "
```
## not found


### Request

#### Endpoint

```plaintext
GET /1.1/5914/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer fcb16187309e012832233bb13891ffa9f1b8c0932271c4260916adbe93e8256d
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
curl -g "https://api.timelyapp.com/1.1/5914/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fcb16187309e012832233bb13891ffa9f1b8c0932271c4260916adbe93e8256d" \
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
Authorization: Bearer e3d6f600bdb984fbb5ecc32e40e6471d75e48f778b3314cbb189f904791b13a9
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
	-H "Authorization: Bearer e3d6f600bdb984fbb5ecc32e40e6471d75e48f778b3314cbb189f904791b13a9" \
	-H "Cookie: "
```
## plans for playstore


### Request

#### Endpoint

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer 69cb02cd7c5ffc27c08d6026315030a3be344237be5e838694e37644edf00204
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
	-H "Authorization: Bearer 69cb02cd7c5ffc27c08d6026315030a3be344237be5e838694e37644edf00204" \
	-H "Cookie: "
```
# ProjectSubscriptions



## create project subscribers


### Request

#### Endpoint

```plaintext
POST /1.1/5924/projects/4716/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer c12cc53cd4c2b0f21c8e146711e5523bb639dee10aeaea2c20373c45c0fc35bc
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
curl "https://api.timelyapp.com/1.1/5924/projects/4716/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c12cc53cd4c2b0f21c8e146711e5523bb639dee10aeaea2c20373c45c0fc35bc" \
	-H "Cookie: "
```
## delete project subscribers


### Request

#### Endpoint

```plaintext
DELETE /1.1/5925/projects/4717/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer fe0cd1a244a281a7269120c651c64fc81016cf87709d6e86c4ab59c5e21eccc2
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
curl "https://api.timelyapp.com/1.1/5925/projects/4717/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fe0cd1a244a281a7269120c651c64fc81016cf87709d6e86c4ab59c5e21eccc2" \
	-H "Cookie: "
```
## list subscribed users


### Request

#### Endpoint

```plaintext
GET /1.1/5921/projects/4713/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer 32c34ee7934bd73c042f19db58f80c242bc2d68b226a1d1e92d57ea832b2bed9
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
[{"id":13849,"email":"quentin@timelyapp.com","name":"Quintin Duponde","avatar":{"timeline":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_timeline.jpg&s=","medium_retina":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","medium":"https://www.gravatar.com/avatar/341d68b864aca41aadfc9d9ec221e0c1?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium.jpg&s="}}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5921/projects/4713/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 32c34ee7934bd73c042f19db58f80c242bc2d68b226a1d1e92d57ea832b2bed9" \
	-H "Cookie: "
```
## show project subscription


### Request

#### Endpoint

```plaintext
GET /1.1/5922/projects/4714/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 796625db6ade3151d7716c2d2c2ca42d830811b752fd4275c2c950af763ec21d
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
curl -g "https://api.timelyapp.com/1.1/5922/projects/4714/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 796625db6ade3151d7716c2d2c2ca42d830811b752fd4275c2c950af763ec21d" \
	-H "Cookie: "
```
## show project subscription


### Request

#### Endpoint

```plaintext
GET /1.1/5923/projects/4715/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer d21618549a938b1ee81adb5df35177f51b18ed00b31429cb7ff5bed320de1529
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
curl -g "https://api.timelyapp.com/1.1/5923/projects/4715/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d21618549a938b1ee81adb5df35177f51b18ed00b31429cb7ff5bed320de1529" \
	-H "Cookie: "
```
# Projects



## Search all projects with query


### Request

#### Endpoint

```plaintext
GET /1.1/5936/projects/search?q=Lily
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2f4518764d8a9d2cedae575b3b463fcd07a3d6542ded22abc6bef6d5837be241
```

`GET /1.1/:account_id/projects/search`

#### Parameters


```json
q: Lily
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
[{"id":4735,"name":"Lily","color":"67a3bc","active":true,"client":{"id":3527,"name":"Timely","active":true,"external_id":null}}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5936/projects/search?q=Lily" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2f4518764d8a9d2cedae575b3b463fcd07a3d6542ded22abc6bef6d5837be241" \
	-H "Cookie: "
```
## active


### Request

#### Endpoint

```plaintext
GET /1.1/5934/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer e7d3ef70d355a07ac7db0401fdb352c4b3776bb52c3aff2fccd925ba14c57a0f
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
[{"id":4730,"active":true,"account_id":5934,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3525,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602918,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13875,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5934/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer e7d3ef70d355a07ac7db0401fdb352c4b3776bb52c3aff2fccd925ba14c57a0f" \
	-H "Cookie: "
```
## all


### Request

#### Endpoint

```plaintext
GET /1.1/5933/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5b0fbcf7b7484f1afc3829d84891ed751df06b295d930f6286557a36a1f6841c
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
[{"id":4728,"active":true,"account_id":5933,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3524,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602917,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13873,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]},{"id":4729,"active":false,"account_id":5933,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3524,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602917,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13873,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5933/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5b0fbcf7b7484f1afc3829d84891ed751df06b295d930f6286557a36a1f6841c" \
	-H "Cookie: "
```
## archived


### Request

#### Endpoint

```plaintext
GET /1.1/5935/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer f6b2efd6a6f39346e11ae744e0f2c2389896e5a0b5b9b48d33fe670300dad588
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
[{"id":4733,"active":false,"account_id":5935,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3526,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602918,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13877,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5935/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f6b2efd6a6f39346e11ae744e0f2c2389896e5a0b5b9b48d33fe670300dad588" \
	-H "Cookie: "
```
## create project


### Request

#### Endpoint

```plaintext
POST /1.1/5941/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 976c4d3f96f054b068567763c322dfbc1f22503b1dec7f8ec9d2d0377bb60054
```

`POST /1.1/:account_id/projects`

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":3532,"budget_type":"M","budget":300,"users":[{"user_id":13889}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
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
{"id":4757,"active":true,"account_id":5941,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3532,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602920,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13889,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```



```shell
curl "https://api.timelyapp.com/1.1/5941/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":3532,"budget_type":"M","budget":300,"users":[{"user_id":13889}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 976c4d3f96f054b068567763c322dfbc1f22503b1dec7f8ec9d2d0377bb60054" \
	-H "Cookie: "
```
## create project


### Request

#### Endpoint

```plaintext
POST /1.1/5938/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3b7c16e8f0de9fbefc404e56505ccc311a6d2510ba85d0684766ea72816f06ee
```

`POST /1.1/:account_id/projects`

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":3529,"users":[{"user_id":13883}],"labels":[{"label_id":3592},{"label_id":3593,"budget":0,"required":false}]}}
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
{"id":4754,"active":true,"account_id":5938,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3529,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602919,"label_ids":[3592,3593],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":0,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13883,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":3592,"budget":null,"required":false},{"label_id":3593,"budget":0,"required":false}]}
```



```shell
curl "https://api.timelyapp.com/1.1/5938/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":3529,"users":[{"user_id":13883}],"labels":[{"label_id":3592},{"label_id":3593,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3b7c16e8f0de9fbefc404e56505ccc311a6d2510ba85d0684766ea72816f06ee" \
	-H "Cookie: "
```
## create project


### Request

#### Endpoint

```plaintext
POST /1.1/5939/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 5935a5b5a49f4e80728f9618a75d6819fc20f44ec3e2d48cc03cc0f18b8868d7
```

`POST /1.1/:account_id/projects`

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":3530,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":13885}],"labels":[{"label_id":3594,"budget":100,"required":false},{"label_id":3595,"budget":200,"required":true}]}}
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
{"id":4755,"active":true,"account_id":5939,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3530,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602919,"label_ids":[3594,3595],"required_label_ids":[3595],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13885,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":3594,"budget":100,"required":false},{"label_id":3595,"budget":200,"required":true}]}
```



```shell
curl "https://api.timelyapp.com/1.1/5939/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":3530,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":13885}],"labels":[{"label_id":3594,"budget":100,"required":false},{"label_id":3595,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 5935a5b5a49f4e80728f9618a75d6819fc20f44ec3e2d48cc03cc0f18b8868d7" \
	-H "Cookie: "
```
## create project


### Request

#### Endpoint

```plaintext
POST /1.1/5940/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 561547221659aea5f0b665df072a0efb48a20a607d219b6d05e7a7f699bcdd8d
```

`POST /1.1/:account_id/projects`

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":3531,"budget_type":"M","budget":300,"users":[{"user_id":13887}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
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
{"id":4756,"active":true,"account_id":5940,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3531,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602919,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13887,"hour_rate":50.0,"hour_rate_in_cents":5000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```



```shell
curl "https://api.timelyapp.com/1.1/5940/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":3531,"budget_type":"M","budget":300,"users":[{"user_id":13887}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 561547221659aea5f0b665df072a0efb48a20a607d219b6d05e7a7f699bcdd8d" \
	-H "Cookie: "
```
## mine with projects


### Request

#### Endpoint

```plaintext
GET /1.1/5931/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 05c7569f075338b1925140f7017d897916a01fa3bef4bc476a7be24366e7afb6
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
[{"id":4724,"active":true,"account_id":5931,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3522,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602917,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[{"user_id":13869,"hour_rate":100.0,"hour_rate_in_cents":10000.0}],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"labels":[]}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5931/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 05c7569f075338b1925140f7017d897916a01fa3bef4bc476a7be24366e7afb6" \
	-H "Cookie: "
```
## mine without projects


### Request

#### Endpoint

```plaintext
GET /1.1/5932/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 893aaaa3998a2d2a97fb6fcbdb6c4367f8af22dee8560adfbf05f231ae828e87
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
curl -g "https://api.timelyapp.com/1.1/5932/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 893aaaa3998a2d2a97fb6fcbdb6c4367f8af22dee8560adfbf05f231ae828e87" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5951/projects/4767
Accept: application/json
Content-Type: application/json
Authorization: Bearer be5d049669c520c0d77d62db0734f35d8fe99d07def1c46afd01b74d0f6cfeea
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
{"id":4767,"active":true,"account_id":5951,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3542,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602923,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```



```shell
curl "https://api.timelyapp.com/1.1/5951/projects/4767" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer be5d049669c520c0d77d62db0734f35d8fe99d07def1c46afd01b74d0f6cfeea" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5942/projects/4758
Accept: application/json
Content-Type: application/json
Authorization: Bearer 65c5e9fb7f6ba58e542e9629d206e6f73e3e604205710af0f7f0599e12eb9e1a
```

`PUT /1.1/:account_id/projects/:id`

#### Parameters


```json
{"project":{"labels":[{"label_id":3596},{"label_id":3597,"budget":0,"required":false}]}}
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
{"id":4758,"active":true,"account_id":5942,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3533,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602920,"label_ids":[3596,3597],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":3596,"budget":null,"required":false},{"label_id":3597,"budget":0,"required":false}]}
```



```shell
curl "https://api.timelyapp.com/1.1/5942/projects/4758" -d '{"project":{"labels":[{"label_id":3596},{"label_id":3597,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 65c5e9fb7f6ba58e542e9629d206e6f73e3e604205710af0f7f0599e12eb9e1a" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5943/projects/4759
Accept: application/json
Content-Type: application/json
Authorization: Bearer 360bed104ab6ac4151866ccc9393ae9b175cb9f84b4f500416c412538724e24f
```

`PUT /1.1/:account_id/projects/:id`

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":3598,"budget":100,"required":true},{"label_id":3599,"budget":100,"required":true}]}}
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
{"id":4759,"active":true,"account_id":5943,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3534,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602920,"label_ids":[3598,3599],"required_label_ids":[3598,3599],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":200,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":3598,"budget":100,"required":true},{"label_id":3599,"budget":100,"required":true}]}
```



```shell
curl "https://api.timelyapp.com/1.1/5943/projects/4759" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":3598,"budget":100,"required":true},{"label_id":3599,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 360bed104ab6ac4151866ccc9393ae9b175cb9f84b4f500416c412538724e24f" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5944/projects/4760
Accept: application/json
Content-Type: application/json
Authorization: Bearer 33d4c7ada78a60619f78f9684b673f79258ae1c806f9eb7d2647404426680e1c
```

`PUT /1.1/:account_id/projects/:id`

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":3600,"budget":100,"required":true},{"label_id":3601,"budget":100,"required":true},{"label_id":3602,"budget":200,"required":true}]}}
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
{"id":4760,"active":true,"account_id":5944,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3535,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602921,"label_ids":[3600,3601,3602],"required_label_ids":[3600,3601,3602],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":3600,"budget":100,"required":true},{"label_id":3601,"budget":100,"required":true},{"label_id":3602,"budget":200,"required":true}]}
```



```shell
curl "https://api.timelyapp.com/1.1/5944/projects/4760" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":3600,"budget":100,"required":true},{"label_id":3601,"budget":100,"required":true},{"label_id":3602,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 33d4c7ada78a60619f78f9684b673f79258ae1c806f9eb7d2647404426680e1c" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5945/projects/4761
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7be12bb17ad78c0609ca8f5bde76e89c8e01cd01398ebeca83e27ca7b63002d2
```

`PUT /1.1/:account_id/projects/:id`

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":3605,"budget":400,"required":true}]}}
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
{"id":4761,"active":true,"account_id":5945,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3536,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602921,"label_ids":[3605],"required_label_ids":[3605],"team_ids":[],"external_id":null,"budget_scope":"tag","budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[{"label_id":3605,"budget":400,"required":true}]}
```



```shell
curl "https://api.timelyapp.com/1.1/5945/projects/4761" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":3605,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7be12bb17ad78c0609ca8f5bde76e89c8e01cd01398ebeca83e27ca7b63002d2" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5946/projects/4762
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1e5efba6ab749743bc502aa95d4b4ac1f44822bf2ff8b21be874dd39616b7c6e
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
{"id":4762,"active":true,"account_id":5946,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3537,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602921,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":400,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[]}
```



```shell
curl "https://api.timelyapp.com/1.1/5946/projects/4762" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1e5efba6ab749743bc502aa95d4b4ac1f44822bf2ff8b21be874dd39616b7c6e" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5947/projects/4763
Accept: application/json
Content-Type: application/json
Authorization: Bearer 01b4c85e2c338ea5ef78ba48fb6a454c6195c91e8d9ad3fe1979c4d23a20eba6
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
{"id":4763,"active":true,"account_id":5947,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3538,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602922,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date","days_count":365}}
```



```shell
curl "https://api.timelyapp.com/1.1/5947/projects/4763" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 01b4c85e2c338ea5ef78ba48fb6a454c6195c91e8d9ad3fe1979c4d23a20eba6" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5948/projects/4764
Accept: application/json
Content-Type: application/json
Authorization: Bearer fbc04fbfddcc15a1be64d3af6c9174e10b103bf7f1f800730bc90bf94cfffbf0
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
{"id":4764,"active":true,"account_id":5948,"name":"Timely","color":"67a3bc","rate_type":"project","client":{"id":3539,"name":"Timely","active":true,"external_id":null},"billable":true,"updated_at":1546602922,"label_ids":[],"required_label_ids":[],"team_ids":[],"external_id":null,"budget_scope":null,"budget":300,"budget_type":"M","hour_rate":50.0,"hour_rate_in_cents":5000.0,"users":[],"cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"estimated_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"estimated_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"billed_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"billed_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"unbilled_cost":{"fractional":0,"formatted":"$0.00","amount":0.0},"unbilled_duration":{"hours":0,"minutes":0,"seconds":0,"formatted":"00:00","total_hours":0.0,"total_seconds":0,"total_minutes":0},"first_logged_on":null,"last_logged_on":null,"labels":[],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":null,"recur_until":"archived","days_count":0}}
```



```shell
curl "https://api.timelyapp.com/1.1/5948/projects/4764" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fbc04fbfddcc15a1be64d3af6c9174e10b103bf7f1f800730bc90bf94cfffbf0" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5949/projects/4765
Accept: application/json
Content-Type: application/json
Authorization: Bearer 4ca6e6347e34c012d6351c5a6353ca14fd5d6a1ef30c76c19f418254645ff4f6
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
curl "https://api.timelyapp.com/1.1/5949/projects/4765" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 4ca6e6347e34c012d6351c5a6353ca14fd5d6a1ef30c76c19f418254645ff4f6" \
	-H "Cookie: "
```
## update project


### Request

#### Endpoint

```plaintext
PUT /1.1/5950/projects/4766
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8b0473111885dc448d03baff98c0ed41389c58d56b31920d9429478b63e46f84
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
curl "https://api.timelyapp.com/1.1/5950/projects/4766" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8b0473111885dc448d03baff98c0ed41389c58d56b31920d9429478b63e46f84" \
	-H "Cookie: "
```
# Suggested Entries



## index


### Request

#### Endpoint

```plaintext
GET /1.1/5953/suggested_entries?date=2019-01-04
Accept: application/json
Content-Type: application/json
Authorization: Bearer 10c0df353966c928435dd4814e114e0609480dd70ef819a106f23b98728a1e66
```

`GET /1.1/:account_id/suggested_entries`

#### Parameters


```json
date: 2019-01-04
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
[{"title":"Meeting","note":"Discuss about future","date":"2019-01-04","from":null,"to":null,"description":"14:00 - 15:00 • Discuss about future","entry_ids":[1397],"icon_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","icon_fallback_url":"/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png","projects":[],"importance":0,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60}},{"title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-04","from":null,"to":null,"description":"hour.rb (~/code/github/timely/app/models) - VIM1","entry_ids":[1398,1399],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/timeline_app_logos/macvim.png","projects":[{"project_id":4769,"accuracy":0.8,"count":2}],"importance":0.8,"duration":{"hours":7,"minutes":0,"seconds":0,"formatted":"07:00","total_hours":7.0,"total_seconds":25200,"total_minutes":420}},{"title":"Congratulations on winning $100000","note":"You won $100000, share your netbanking details","date":"2019-01-04","from":null,"to":null,"description":" • You won $100000, share your netbanking details","entry_ids":[1400],"icon_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","icon_fallback_url":"/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png","projects":[{"project_id":4769,"accuracy":0.8,"count":1}],"importance":0,"duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210}}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5953/suggested_entries?date=2019-01-04" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 10c0df353966c928435dd4814e114e0609480dd70ef819a106f23b98728a1e66" \
	-H "Cookie: "
```
## update


### Request

#### Endpoint

```plaintext
PUT /1.1/5954/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer f2ca8219755dd02af1cb75974fe05cabc6556f0ff49099f30e8b0839fea387db
```

`PUT /1.1/:account_id/suggested_entries`

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":1402,"project_id":4771}]}}
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
curl "https://api.timelyapp.com/1.1/5954/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":1402,"project_id":4771}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f2ca8219755dd02af1cb75974fe05cabc6556f0ff49099f30e8b0839fea387db" \
	-H "Cookie: "
```
# Suggested Hours



## default


### Request

#### Endpoint

```plaintext
GET /1.1/5955/suggested_hours?date=2019-01-04
Accept: application/json
Content-Type: application/json
Authorization: Bearer 708ef3c67fb031c1a71fa324e7f60e539d72dd1322e233a2c8a2cdb6272c9395
```

`GET /1.1/:account_id/suggested_hours`

#### Parameters


```json
date: 2019-01-04
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
[{"id":359,"owner":{"id":2343,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":4772,"date":"2019-01-04","to":"2019-01-04T16:25:24+01:00","from":"2019-01-04T12:55:24+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-04T12:55:24+01:00","suggested_entry_ids":[1405,1406],"version":"0.2.0","updated_at":"2019-01-04T12:55:24+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5955/suggested_hours?date=2019-01-04" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 708ef3c67fb031c1a71fa324e7f60e539d72dd1322e233a2c8a2cdb6272c9395" \
	-H "Cookie: "
```
## show


### Request

#### Endpoint

```plaintext
GET /1.1/5961/suggested_hours/371
Accept: application/json
Content-Type: application/json
Authorization: Bearer d796e7f7b94df204d97564dc3dc3e5bc3ec20eb46090932caaaf3ec98d5e0364
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
{"id":371,"owner":{"id":2349,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":4778,"date":"2019-01-04","to":"2019-01-04T16:25:27+01:00","from":"2019-01-04T12:55:27+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-04T12:55:27+01:00","suggested_entry_ids":[1429,1430],"version":"0.2.0","updated_at":"2019-01-04T12:55:27+01:00"}
```



```shell
curl -g "https://api.timelyapp.com/1.1/5961/suggested_hours/371" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d796e7f7b94df204d97564dc3dc3e5bc3ec20eb46090932caaaf3ec98d5e0364" \
	-H "Cookie: "
```
## since and until


### Request

#### Endpoint

```plaintext
GET /1.1/5957/suggested_hours?date=2019-01-04&amp;since=2019-01-02&amp;until=2019-01-04
Accept: application/json
Content-Type: application/json
Authorization: Bearer c6cd510f21bc8348b573aa9a8bfc13b6ac14902323f6167e1c8a3d9546d7be8b
```

`GET /1.1/:account_id/suggested_hours`

#### Parameters


```json
date: 2019-01-04
since: 2019-01-02
until: 2019-01-04
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
[{"id":363,"owner":{"id":2345,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":4774,"date":"2019-01-04","to":"2019-01-04T16:25:25+01:00","from":"2019-01-04T12:55:25+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-04T12:55:25+01:00","suggested_entry_ids":[1413,1414],"version":"0.2.0","updated_at":"2019-01-04T12:55:25+01:00"},{"id":364,"owner":{"id":2345,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":4774,"date":"2019-01-02","to":"2019-01-04T16:25:25+01:00","from":"2019-01-04T12:55:25+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-04T12:55:25+01:00","suggested_entry_ids":[1415],"version":"0.2.0","updated_at":"2019-01-04T12:55:25+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5957/suggested_hours?date=2019-01-04&since=2019-01-02&until=2019-01-04" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c6cd510f21bc8348b573aa9a8bfc13b6ac14902323f6167e1c8a3d9546d7be8b" \
	-H "Cookie: "
```
## suggested hour ids


### Request

#### Endpoint

```plaintext
GET /1.1/5958/suggested_hours?date=2019-01-04&amp;suggested_hour_ids=365
Accept: application/json
Content-Type: application/json
Authorization: Bearer bd23db0407842f4e524c96b4849a99cca9c0346ad50e4b4753aef2ec19c37fd2
```

`GET /1.1/:account_id/suggested_hours`

#### Parameters


```json
date: 2019-01-04
suggested_hour_ids: 365
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
[{"id":365,"owner":{"id":2346,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":4775,"date":"2019-01-04","to":"2019-01-04T16:25:25+01:00","from":"2019-01-04T12:55:25+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-04T12:55:25+01:00","suggested_entry_ids":[1417,1418],"version":"0.2.0","updated_at":"2019-01-04T12:55:25+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5958/suggested_hours?date=2019-01-04&suggested_hour_ids=365" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer bd23db0407842f4e524c96b4849a99cca9c0346ad50e4b4753aef2ec19c37fd2" \
	-H "Cookie: "
```
## update


### Request

#### Endpoint

```plaintext
PUT /1.1/5959/suggested_hours/367
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1879362f27b86461d810c83a1afc3d816613e4366ef3364d659b04ed3ff25550
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
{"id":367,"owner":{"id":2347,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":4776,"date":"2019-01-04","to":"2019-01-04T16:25:26+01:00","from":"2019-01-04T12:55:26+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"dismissed","source":"prediction","created_at":"2019-01-04T12:55:26+01:00","suggested_entry_ids":[1421,1422],"version":"0.2.0","updated_at":"2019-01-04T12:55:26+01:00"}
```



```shell
curl "https://api.timelyapp.com/1.1/5959/suggested_hours/367" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1879362f27b86461d810c83a1afc3d816613e4366ef3364d659b04ed3ff25550" \
	-H "Cookie: "
```
## update


### Request

#### Endpoint

```plaintext
PUT /1.1/5960/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7f6d11f173ac03278c8499e1e36e53267e3d2f607fc0229243f973cdf71c9328
```

`PUT /1.1/:account_id/suggested_hours/decline`

#### Parameters


```json
{"suggested_hour_ids":[369]}
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
curl "https://api.timelyapp.com/1.1/5960/suggested_hours/decline" -d '{"suggested_hour_ids":[369]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7f6d11f173ac03278c8499e1e36e53267e3d2f607fc0229243f973cdf71c9328" \
	-H "Cookie: "
```
## with date


### Request

#### Endpoint

```plaintext
GET /1.1/5956/suggested_hours?date=2019-01-02
Accept: application/json
Content-Type: application/json
Authorization: Bearer 3c03c7ad475816f34237db904789a09b711d49a9d2a8b104fd5445a3c9072d80
```

`GET /1.1/:account_id/suggested_hours`

#### Parameters


```json
date: 2019-01-02
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
[{"id":362,"owner":{"id":2344,"email":"notifications@timelyapp.com","name":"Timely","avatar":{"timeline":"/assets/timely_user_avatar_timeline.png","medium_retina":"/assets/timely_user_avatar_medium_retina.png","medium":"/assets/timely_user_avatar_medium.png"}},"project_id":4773,"date":"2019-01-02","to":"2019-01-04T16:25:25+01:00","from":"2019-01-04T12:55:25+01:00","note":"Notes for testing with some random #hash in it.","duration":{"hours":3,"minutes":30,"seconds":0,"formatted":"03:30","total_hours":3.5,"total_seconds":12600,"total_minutes":210},"status":"pending","source":"prediction","created_at":"2019-01-04T12:55:25+01:00","suggested_entry_ids":[1411],"version":"0.2.0","updated_at":"2019-01-04T12:55:25+01:00"}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5956/suggested_hours?date=2019-01-02" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 3c03c7ad475816f34237db904789a09b711d49a9d2a8b104fd5445a3c9072d80" \
	-H "Cookie: "
```
# Training Entries



## create


### Request

#### Endpoint

```plaintext
POST /1.1/5968/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer d78a11f011cf4a2291229154109698863dd787e7cc9f1be25d8dc7f6d7fbc03c
```

`POST /1.1/:account_id/training_entries`

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":1436,"project_id":4784}]}}
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
curl "https://api.timelyapp.com/1.1/5968/training_entries" -d '{"training_entries":{"entries":[{"entry_id":1436,"project_id":4784}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer d78a11f011cf4a2291229154109698863dd787e7cc9f1be25d8dc7f6d7fbc03c" \
	-H "Cookie: "
```
## list


### Request

#### Endpoint

```plaintext
GET /1.1/5967/training_entries?date=2019-01-04
Accept: application/json
Content-Type: application/json
Authorization: Bearer 95a7a09fac819fcca2fa16dc9b7fb0f1479faf6d6a970ef39de1ef43cf4adcb5
```

`GET /1.1/:account_id/training_entries`

#### Parameters


```json
date: 2019-01-04
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
[{"id":1433,"type":"macOS","uid":"1b627e20-02ce-4dc4-bcf2-394eb34d600f","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-04","from":"2019-01-04T10:00:00+01:00","to":"2019-01-04T12:00:00+01:00","entry_type":null,"duration":{"hours":2,"minutes":0,"seconds":0,"formatted":"02:00","total_hours":2.0,"total_seconds":7200,"total_minutes":120},"at":"2019-01-04T10:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/timeline_app_logos/macvim.png","url":null,"score":0.8},{"id":1434,"type":"macOS","uid":"1b627e20-02ce-4dc4-bcf2-394eb34d600f","title":"MacVim","note":"hour.rb (~/code/github/timely/app/models) - VIM1","description":"hour.rb (~/code/github/timely/app/models) - VIM1","date":"2019-01-04","from":"2019-01-04T14:00:00+01:00","to":"2019-01-04T15:00:00+01:00","entry_type":null,"duration":{"hours":1,"minutes":0,"seconds":0,"formatted":"01:00","total_hours":1.0,"total_seconds":3600,"total_minutes":60},"at":"2019-01-04T14:00:00+01:00","extra_attributes":[{"name":"application","value":"MacVim"},{"name":"detail","value":""}],"icon":"mac_vim.png","color":"rgba(86,210,255,0.30)","sub_entries":[],"icon_url":"/timeline_app_logos/macvim.png","icon_fallback_url":"/timeline_app_logos/macvim.png","url":null,"score":0.6}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5967/training_entries?date=2019-01-04" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 95a7a09fac819fcca2fa16dc9b7fb0f1479faf6d6a970ef39de1ef43cf4adcb5" \
	-H "Cookie: "
```
## update


### Request

#### Endpoint

```plaintext
POST /1.1/5969/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 26fa068d7dc9408d412f0b415af21676c296706f27b80952f5ee59a92355e3d8
```

`POST /1.1/:account_id/training_entries`

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":1438,"project_id":4785},{"entry_id":1437,"project_id":4785}]}}
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
curl "https://api.timelyapp.com/1.1/5969/training_entries" -d '{"training_entries":{"entries":[{"entry_id":1438,"project_id":4785},{"entry_id":1437,"project_id":4785}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 26fa068d7dc9408d412f0b415af21676c296706f27b80952f5ee59a92355e3d8" \
	-H "Cookie: "
```
# Upgrade



## upgrade account plan from web account


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/5980/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 429c5faf74aac1e582da373145e92bc178df7a3cd23d59652a11e905992660fc
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/5980/upgrade" -d '{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 429c5faf74aac1e582da373145e92bc178df7a3cd23d59652a11e905992660fc" \
	-H "Cookie: "
```
## upgrade account plan from web account


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/5982/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 492ff2522d382418d255ebb568d8638aa1484dbdfa4652b306abba793b5e08dd
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/5982/upgrade" -d '{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 492ff2522d382418d255ebb568d8638aa1484dbdfa4652b306abba793b5e08dd" \
	-H "Cookie: "
```
## upgrade account plan to essential


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/5979/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 691868a73a4bec92b01ed112bd3615f518235dff6ad90b3b9ed7a5473cf9bcc8
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
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
{"id":5979,"name":"Timely","from":"Web","max_users":0,"max_projects":0,"num_users":2,"num_projects":0,"plan_id":28,"plan_name":"Essential","next_charge":"2019-02-04","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1546602933,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"essential","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDkyODEzMzMsInYiOjAsImlhdCI6MTU0NjYwMjkzMywiZCI6eyJ1c2VyX2lkIjoiMTM5ODgiLCJhY2NvdW50X2lkIjoiNTk3OSIsInVzZXJfdHlwZSI6Im5vcm1hbCIsInVpZCI6ImFmMmJmOWEzMTBmZWJlMmQ4OGQ2YTk3MDg5ZWExM2I0In19.2MeYZzFppAdmX4yZC7GR9ndEddDkC_CVLYmqQ6pGqCg"}
```



```shell
curl "https://api.timelyapp.com/1.2/private/accounts/5979/upgrade" -d '{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 691868a73a4bec92b01ed112bd3615f518235dff6ad90b3b9ed7a5473cf9bcc8" \
	-H "Cookie: "
```
## upgrade account plan to solo


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/5978/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 543c098fd86c4764f2405db9ad05e03d1e586d411c937452826bc5d8bc57a32d
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
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
{"id":5978,"name":"Timely","from":"Web","max_users":1,"max_projects":3,"num_users":2,"num_projects":0,"plan_id":34,"plan_name":"Solo","next_charge":"2019-02-04","currency":{"id":"usd","name":"United States Dollar","iso_code":"USD","symbol":"$","symbol_first":true},"start_of_week":0,"beta":false,"created_at":1546602933,"payment_mode":"appstore","paid":false,"company_size":"10-49","color":"44505e","logo":{"large_retina":"/assets/account_thumbs/account_large_retina.png","medium_retina":"/assets/account_thumbs/account_medium_retina.png","small_retina":"/assets/account_thumbs/account_small_retina.png"},"capacity":{"hours":40.0,"minutes":0.0,"seconds":0.0,"formatted":"40:00","total_hours":40.0,"total_seconds":144000.0,"total_minutes":2400.0},"plan_code":"solo_v1","appstore_transaction_id":"some-appstore-id","expired":false,"trial":true,"days_to_end_trial":31,"features":[{"name":"control","days":-1},{"name":"memories","days":-1},{"name":"billing","days":-1},{"name":"project_labels","days":-1},{"name":"teams","days":-1},{"name":"recurring_budget","days":-1}],"firebase_url":"https://shining-fire-1562.firebaseio.com/","firebase_auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDkyODEzMzMsInYiOjAsImlhdCI6MTU0NjYwMjkzMywiZCI6eyJ1c2VyX2lkIjoiMTM5ODYiLCJhY2NvdW50X2lkIjoiNTk3OCIsInVzZXJfdHlwZSI6Im5vcm1hbCIsInVpZCI6IjUwZmJmMDllMGEzZTkwZmE4OGRiMzgzMWJjYjM2YzUyIn19.f3h4UAuVyTykcwrgS3rTNVb-v5yvxiG5X87kXJigXJ8"}
```



```shell
curl "https://api.timelyapp.com/1.2/private/accounts/5978/upgrade" -d '{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 543c098fd86c4764f2405db9ad05e03d1e586d411c937452826bc5d8bc57a32d" \
	-H "Cookie: "
```
## upgrade for duplicate appstore_transaction_id


### Request

#### Endpoint

```plaintext
POST /1.2/private/accounts/5984/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer 063c20f5863e699789f1a39ee244cc6853466219b95cb80dd0718f485ad127f6
```

`POST /1.2/private/accounts/:account_id/upgrade`

#### Parameters


```json
{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}
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
curl "https://api.timelyapp.com/1.2/private/accounts/5984/upgrade" -d '{"account":{"next_charge":"2019-02-04","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 063c20f5863e699789f1a39ee244cc6853466219b95cb80dd0718f485ad127f6" \
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
[{"user_id":13751,"property":"has_seen_calendar_day","value":"yes","updated_at":"2019-01-04T12:54:57+01:00"},{"user_id":13751,"property":"has_seen_calendar_week","value":"no","updated_at":"2019-01-04T12:54:57+01:00"}]
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
[{"user_id":13750,"property":"has_seen_calendar_week","value":"yes","updated_at":"2019-01-04T12:54:56+01:00"}]
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
GET /1.1/5976/users/search?q=Brandy+Schmeler
Accept: application/json
Content-Type: application/json
Authorization: Bearer 62e30a9383820c8b351ed76020a8b41929265ab440762864849c37a4abaa919a
```

`GET /1.1/:account_id/users/search`

#### Parameters


```json
q: Brandy Schmeler
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
[{"id":13962,"email":"cindy_lehner@hotmail.com","name":"Brandy Schmeler","active":false,"external_id":null,"avatar":{"large":"https://www.gravatar.com/avatar/e2c15e8d04e699eb9b2b4ef915424e2a?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_large_retina.jpg&s=200","medium":"https://www.gravatar.com/avatar/e2c15e8d04e699eb9b2b4ef915424e2a?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_medium_retina.jpg&s=50","small":"https://www.gravatar.com/avatar/e2c15e8d04e699eb9b2b4ef915424e2a?d=https%3A%2F%2Fapp.timelyapp.com%2Fassets%2Fthumbs%2Fuser_small_retina.jpg&s=25"},"updated_at":1546602932}]
```



```shell
curl -g "https://api.timelyapp.com/1.1/5976/users/search?q=Brandy+Schmeler" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 62e30a9383820c8b351ed76020a8b41929265ab440762864849c37a4abaa919a" \
	-H "Cookie: "
```
