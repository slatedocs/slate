---
title: LumahealthHQ API Reference

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Welcome to Lumahealth's REST Service API!

# Authentication

TODO: comment about:
- public-methods.js
- resource-authorization.js
- default-roles.js
- owner user
- groups
- roles

## Signup

See [users > signup](#post-signup)

## Login

See [users > login](#post-login-4)

# Paging and sorting

<aside class="notice">
The query parameters bellow apply to all endpoints and all HTTP Methods.
</aside>

`GET/POST/PUT/DELETE` /api/*

In order to paginate and sort the results, you can use query parameters bellow.

```shell
#shell command:
curl http://localhost:8002/api/*?page=1&limit=10&lastId=XYZ&sort=lastName&sortBy=asc
```

Query params | Description 
-------------- | ----------- 
page | The 1-based page number to fetch
limit | Number of items in the response
lastId | The last id to be returned
sort | The attribute by which the results will be sorted
sortBy | Sort direction: either `asc` or `desc`

# activities

## Get activities

`GET` /api/activities/

```shell
#shell command:
curl \
http://localhost:8002/api/activities/?patient=X&type=Y&date=Z \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	[{
    "namespace":	"api:insurances:create",
    "action":	null,
    "patient": [{
      "id": "5d001ac40bb38f3585626b69",
      "name": "Test Test",
      "firstname": "Test",
      "lastname": "Test",
      "contact": [{ _id, active, value, type}, ...]
    }, ...],
    "facility":	null,
    "provider":	null,
    "activityContext"		[{}, ...],
    "timestamp":	"15602880255182019-06-11T21:20:25.518Z",
    "createdBy":	"5d001ac40bb38f3585626b69",
    "updatedBy":	"5d001ac40bb38f3585626b69",
    "user":	"5d001ac40bb38f3585626b69"
	}, ...]
```

Lists activities from redis. 

Authorization: x-access-token. Roles allowed: patient

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query params | Description 
-------------- | ----------- 
patient | (optional) ID of the patient whose activities should be listed. Default: session user's ID.
type | (optional) Type of the activities. Accepted types: ['appointments','availabilities','insurances', ...]
date | (optional) Date of the activities to be listed

Response body param | Description 
-------------- | ----------- 
namespace | A string used to organize the activities in redis. Accepted values: ["luma:activity:list:${userId}", "luma:activity:instance:${activityId}"]
action | Describes the action taken during the activity. Only suitable for some cases, such as `api:feedbackResponses:create`, whose `action` may be `positive` or `negative`.
patient | Patient info such as id, name, and contact.
facility | Facility info.
provider | Provider info.
acivityContext | Object containing any kind of relevant information for the activity.
timestamp | Time and date when the activity was created/updated.
createdBy | User id of the user who created the activity.
updatedBy | User id of the user who updated the activity.
user | User id of the owner account.

## Update by timestamp

`PUT` /api/activities/:timestamp

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/activities/:timestamp \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"actionTaken": true
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
    "actionTaken": true,
    "namespace":	"api:insurances:create",
    "action":	null,
    "patient": [{
      "id": "5d001ac40bb38f3585626b69",
      "name": "Test Test",
      "firstname": "Test",
      "lastname": "Test",
      "contact": [{ _id, active, value, type}, ...]
    }, ...],
    "facility":	null,
    "provider":	null,
    "activityContext"		[{}, ...],
    "timestamp":	"15602880255182019-06-11T21:20:25.518Z",
    "createdBy":	"5d001ac40bb38f3585626b69",
    "updatedBy":	"5d001ac40bb38f3585626b69",
    "user":	"5d001ac40bb38f3585626b69"
	}
```

Flags as handled the activity whose ID is the given timestamp, for the logged user.

> In redis, to see the available timestamps, run:

```
zrange "luma:activity:list:5d001ac40bb38f3585626b69" 0 -1 WITHSCORES
```

> The command above also returns many 128-bit activity IDs, which may be used again in redis:

```
get "luma:activity:instance:a17558d8ea1c39dbc0c5c78f53238faa569723aa4e7a87fbdf7c594d55bb6db50588445b886d7753262173449b1a95830ba506e0"
```

That command will output the activity, just like the REST API.

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:timestamp | Date and time when the activity happened for the logged user.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
actionTaken | true. Flags the activity as handled.

Response body param | Description 
-------------- | ----------- 
actionTaken | Flag indicating that the activity was handled.
namespace | A string used to organize the activities in redis. Accepted values: ["luma:activity:list:${userId}", "luma:activity:instance:${activityId}"]
action | Describes the action taken during the activity. Only suitable for some cases, such as `api:feedbackResponses:create`, whose `action` may be `positive` or `negative`.
patient | Patient info such as id, name, and contact.
facility | Facility info.
provider | Provider info.
acivityContext | Object containing any kind of relevant information for the activity.
timestamp | Time and date when the activity was created/updated.
createdBy | User id of the user who created the activity.
updatedBy | User id of the user who updated the activity.
user | User id of the owner account.

## Put by id

`PUT` /api/activities/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/activities/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

# appointments

## Get appointments

`GET` /api/appointments/

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/?status=unconfirmed \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"size": 1,
		"response": [
      {
        "_id": "5d001ad3f0587535a8582486",
        "patient": "5d001ac6f0587535a85823f4",
        "date": "2019-06-18T15:45:00.000Z",
        "duration": 15,
        "source": "manual",
        "status": "unconfirmed",
        "provider": "5d001ac8f0587535a8582442",
        "type": "5d001ac6f0587535a85823ce",
        "facility": "5d001ac8f0587535a8582439",
        "user": "5d001ac40bb38f3585626b69",
        "createdBy": "5d001ac40bb38f3585626b69",
        "updatedBy": "5d001ac40bb38f3585626b69",
        "endDate": "2019-06-18T16:00:00.000Z",
        "integratorUpdateResults": {
            "status": "pending"
        },
        "deleted": 0,
        "updatedAt": "2019-06-11T21:19:15.308Z",
        "createdAt": "2019-06-11T21:19:15.308Z",
        "stats": {
            "counters": {
                "remindersSent": 0
            }
        },
        "statusReason": null,
        "externalId": {
            "source": "lumamock",
            "value": "1560287955308"
        },
        "__v": 0
      }
    ],
		"page": 1,
    "totalSize": 1
	}
```

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request query Params | Example
-------------- | ----------- 
Any property of an [Appointment](#appointment) | ex.: ?status=unconfirmed&source=manual

Response body param | Description 
-------------- | ----------- 
size | Size of the current page of results.
response | Array of [Appointments](#appointment).
page | The number of the current page of results.
totalSize | Total amount of results in all pages.

## Create appointment

`POST` /api/appointments/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/appointments/ \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
        "patient": "5d001ac6f0587535a85823f4",
        "date": "2019-06-18T15:45:00.000Z",
        "duration": 15,
        "source": "manual",
        "status": "unconfirmed",
        "provider": "5d001ac8f0587535a8582442",
        "type": "5d001ac6f0587535a85823ce",
        "facility": "5d001ac8f0587535a8582439",
        "endDate": "2019-06-18T16:00:00.000Z",
        "integratorUpdateResults": {
            "status": "pending"
        },
        "stats": {
            "counters": {
                "remindersSent": 0
            }
        },
        "statusReason": null,
        "externalId": {
            "source": "lumamock",
            "value": "1560287955308"
        }
    }'
```

> The command above returns JSON of an [Appointment](#appointment).

Creates a new appointment.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body: JSON of an [Appointment](#appointment).

Response body: JSON of the [Appointment](#appointment) which as created..

## Get by id

`GET` /api/appointments/:id

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/5d001ad3f0587535a8582486 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a single JSON of an [Appointment](#appointment).

Fetches one appointment by its ObjectId.

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | The ObjectID of the desired appointment in the database.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body: a single JSON of an [Appointment](#appointment).

## Update appointment

`PUT` /api/appointments/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/appointments/5d001ad3f0587535a8582486 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
    "_id": "5d001ad3f0587535a8582486",
    "patient": "5d001ac6f0587535a85823f4",
    "date": "2019-06-18T15:45:00.000Z",
    "duration": 15,
    "source": "manual",
    "status": "unconfirmed",
    "provider": "5d001ac8f0587535a8582442",
    "type": "5d001ac6f0587535a85823ce",
    "facility": "5d001ac8f0587535a8582439",
    "user": "5d001ac40bb38f3585626b69",
    "createdBy": "5d001ac40bb38f3585626b69",
    "updatedBy": "5d001ac40bb38f3585626b69",
    "endDate": "2019-06-18T16:00:00.000Z",
    "__v": 0,
    "integratorUpdateResults": {
        "status": "pending"
    },
    "updatedAt": "2019-06-11T21:19:15.308Z",
    "createdAt": "2019-06-11T21:19:15.308Z",
    "stats": {
        "counters": {
            "remindersSent": 0
        }
    },
    "statusReason": null,
    "externalId": {
        "source": "lumamock",
        "value": "1560287955308"
    }
}'
```

> The command above returns a JSON of an [Appointment](#appointment).

Updates a single appointment by ID. The request body may include only a subset of the attributes of an [Appointment](#appointment).

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | The ObjectID of the desired appointment in the database.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body: JSON containing any subset of the attributes of an [Appointment](#appointment).

Response body: the updated [Appointment](#appointment).

## Delete by id

`DELETE` /api/appointments/:id

Soft deletes an appointment from the database.

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/appointments/5d001ad3f0587535a8582486 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"'
```

> The command above returns a JSON structured like this: 

```json-doc
{
  "_id": "5d001ad3f0587535a8582486",
  "deleted": 1
}
```

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | The ObjectID of the appointment to be deleted from the database.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
_id | The ObjectID of the appointment deleted from the database.
deleted | Flag indicating if the object was really deleted.

## Cancel appointment

`PUT` /api/appointments/:id/cancel

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/appointments/5d001ad3f0587535a8582486/cancel \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"'
```

> The command above returns a JSON of the cancelled [Appointment](#appointment).

Cancels an appointment, setting its `cancelledAt` attribute to the current date, `statusSource` to `ui`, `status` to `cancelled`.

The old `status` has to be either `confirmed` or `unconfirmed`, otherwise the operation will fail.

It clears out the integration update results by updating `integratorUpdateResults` to `pending`, so that integrator doesn't drop this status change.

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | The ObjectID of the appointment to be cancelled.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | The ObjectID of the appointment to be cancelled.

Response body: JSON of the cancelled [Appointment](#appointment).

## Confirm appointment

`PUT` /api/appointments/:id/confirm

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/appointments/5d001ad3f0587535a8582486/confirm \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"'
```

> The command above returns a JSON of the confirmed [Appointment](#appointment).

Cancels an appointment, setting its `confirmedAt` attribute to the current date, `statusSource` to `ui`, `status` to `confirmed`.

The old `status` has to be either `cancelled` or `unconfirmed`, otherwise the operation will fail.

It clears out the integration update results by updating `integratorUpdateResults` to `pending`, so that integrator doesn't drop this status change.

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | The ObjectID of the appointment to be confirmed.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | The ObjectID of the appointment to be confirmed.

Response body: JSON of the confirmed [Appointment](#appointment).

## Get crudList

`GET` /api/appointments/crudList

Same as [Get appointments](#get-appointments).

## Get by patient

`GET` /api/appointments/getByPatientId/:id

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/getByPatientId/5d001ac6f0587535a85823f6 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns an array of [Appointments](#appointment).

Fetches all the appointments of a given patient.

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | The patient's ObjectID whose appointments will be fetched

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body: an array of [Appointments](#appointment).

## Get reports/find

`GET` /api/appointments/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/reports/find?patient=5d001ac8f0587535a8582436 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "data": [
        {
            "_id": "5d001ad3f0587535a85824d7",
            "patient": {
                "_id": "5d001ac6f0587535a8582410",
                "name": "Harmony Rippin",
                "__t": "Patient",
                "dateOfBirth": {
                    "year": 1992,
                    "month": 7,
                    "day": 8
                },
                "contact": [
                    {
                        "_id": "5d001ac6f0587535a8582411",
                        "active": true,
                        "value": "Mark_Weissnat.hotmail.com@example.com",
                        "type": "email"
                    }
                ]
            },
            "date": "2019-06-13T23:15:00.000Z",
            "status": "unconfirmed",
            "provider": {
                "_id": "5d001ac8f0587535a858243f",
                "name": "Joseph Runte",
                "__t": "Provider"
            },
            "type": {
                "_id": "5d001ac6f0587535a85823cf",
                "name": "Imaging - CT Angio Vascular"
            },
            "facility": {
                "_id": "5d001ac8f0587535a8582439",
                "name": "Embarcadero Wellness"
            },
            "updatedAt": "2019-06-11T21:19:15.885Z",
            "stats": {
                "counters": {
                    "remindersSent": 0
                }
            }
        }
    ],
    "paging": {
        "totalCount": 1
    }
}
```

Searches for [appointments](#appointment) on PostgreSQL, falling back to MongoDB, and expanding all the ObjectIDs referencing foreign models to their full objects.

As to the [patient](#patient) expanded object, this endpoint includes the `contact` attribute, which is an array of the patient's active contacts. The array only includes contact channels which are enabled for the logged user (ex.: phone, email, etc).

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request query Params | Example
-------------- | ----------- 
Any property of an [Appointment](#appointment) | ex.: ?status=unconfirmed&source=manual

Response body param | Description 
-------------- | ----------- 
data | Array of [Appointments](#appointment).
paging | An object containing the property `totalCount` which brings the total amount of results in all pages.

## Get reports/summary

`GET` /api/appointments/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/reports/summary?provider=5d001ac8f0587535a8582443 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "status": [
        {
            "_id": "unconfirmed",
            "count": 3
        },
        {
            "_id": "confirmed",
            "count": 1
        },
        {
            "_id": "cancelled",
            "count": 4
        }
    ]
}
```

Groups appointments by status, including [confirmed, unconfirmed, cancelled]. Includes, by default, appointments of the last 7 days.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query params | Description 
-------------- | ----------- 
facility | Facility's ObjectID
provider | Provider's ObjectID
statusSource | Possible values: ["integrator", "reminder", "ui", "waitlist"]

Response body: array containing objects, each with a status `_id` (which may be `confirmed`, `unconfirmed` or `cancelled`) and a `count` containing the amount of appointments in such status.

## Get reports/xls

`GET` /api/appointments/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/reports/xls?provider=5d001ac8f0587535a8582443 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a XLS spreadsheet as described.

Returns a XLS spreadsheet with the following columns:

Name | Description
-------- | --------
Date | Appointment date
Facility | Facility where it's scheduled to happen
Provider | Provider assigned
Patient | Patient
Status | May be `confirmed`, `unconfirmed` or `cancelled`
Source | Possible values: ["integrator", "reminder", "ui", "waitlist"]
Appointment Type | See [Appointment](#appointment)
Last Updated | Date when the appointment was last updated
Reminders Sent | Number of appointment reminders sent
DOB | Date of Birth of the patient
Contact | Contact channel and info
Future Appointment | Future appointment info.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request query Params | Example
-------------- | ----------- 
Any property of an [Appointment](#appointment) | ex.: ?status=unconfirmed&source=manual

Response: XLS spreadsheet file.

## Get summary

`GET` /api/appointments/summary

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/summary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Post upload/dentrix

`POST` /api/appointments/upload/dentrix

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/appointments/upload/dentrix?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Post upload/referral

`POST` /api/appointments/upload/referral

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/appointments/upload/referral?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Post upload/successehs

`POST` /api/appointments/upload/successehs

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/appointments/upload/successehs?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Post upload/theraoffice

`POST` /api/appointments/upload/theraoffice

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/appointments/upload/theraoffice?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

# appointmentTypes

## Get appointmentTypes

`GET` /api/appointmentTypes/

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/?name=x&description=x \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns an array of JSONs of [AppointmentTypes](#appointmenttype)

Lists appointmentTypes which are `visible`, sorted by `name`. Does not support paging options.

Authorization: x-access-token, Roles allowed: patient and widget

Request headers | Description 
-------------- | ----------- 
name | JWT auth access token

Query.params.: all the fields of [AppointmentType](#appointmenttype). Ex.: ?externalId.value=1560287942461&name=Checkup

Response body: array of [AppointmentTypes](#appointmenttype), sorted by `name`.

## Get crudList

`GET` /api/appointmentTypes/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/crudList?page=1&limit=10&name=x&description=x \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns an array of JSONs of [AppointmentTypes](#appointmenttype)

Lists appointmentTypes which are `visible`, sorted by `name`. Supports paging options (page and limit query params).

Authorization: x-access-token, Roles allowed: patient and widget

Request headers | Description 
-------------- | ----------- 
name | JWT auth access token

Query.params.: page, limit, and all the fields of [AppointmentType](#appointmenttype). Ex.: ?externalId.value=1560287942461&name=Checkup

Response body: array of [AppointmentTypes](#appointmenttype), sorted by `name`.

## Get hidden

`GET` /api/appointmentTypes/hidden

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/hidden \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns an array of JSONs of [AppointmentTypes](#appointmenttype)

Lists appointmentTypes which are *NOT* `visible`. Supports paging options and defaults to page=1 and limit=500.

Authorization: x-access-token, Roles allowed: patient and widget

Request headers | Description 
-------------- | ----------- 
name | JWT auth access token

Query.params.: page, limit and all the fields of [AppointmentType](#appointmenttype). Ex.: ?externalId.value=1560287942461&name=Checkup

Response body: array of [AppointmentTypes](#appointmenttype) which are *NOT* `visible`.


## Get search

`GET` /api/appointmentTypes/search

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/search?name=xyz&description=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns an array of JSONs of [AppointmentTypes](#appointmenttype)

Searches for appointmentTypes which are `visible` on elasticSearch, falling back to MongoDB in case of failure.

Authorization: x-access-token, Roles allowed: patient and widget

Request headers | Description 
-------------- | ----------- 
name | JWT auth access token

Query.params.: page, limit, and all the fields of [AppointmentType](#appointmenttype). Ex.: ?externalId.value=1560287942461&name=Checkup

Response body: array of [AppointmentTypes](#appointmenttype).

## Post appointmentType

`POST` /api/appointmentTypes/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/appointmentTypes/ \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
  "name": "Checkup",
  "description": "Checkup",
  "createdBy": "5d001ac40bb38f3585626b69",
  "updatedBy": "5d001ac40bb38f3585626b69",
  "user": "5d001ac40bb38f3585626b69",
  "deleted": 0,
  "updatedAt": "2019-06-11T21:19:12.570Z",
  "createdAt": "2019-06-11T21:19:02.461Z",
  "visible": true,
  "externalId": {
    "source": "lumamock",
    "value": "1560287942461"
  },
  "setting": "5d001ac9f0587535a858244a"
}'
```

> The command above returns JSON of an [AppointmentType](#appointmenttype), with the `settings` field fetched and expanded based on the `setting` foreign key.

Creates an appointmentType.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param: JSON of an [AppointmentType](#appointmenttype).

Response body:  JSON of an [AppointmentType](#appointmenttype), with the `settings` field fetched and expanded based on the `setting` foreign key.

## Put by id

`PUT` /api/appointmentTypes/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/appointmentTypes/5d001ac6f0587535a85823d3 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
  "name": "Checkup1",
  "description": "Checkup1",
  "createdBy": "5d001ac40bb38f3585626b69",
  "updatedBy": "5d001ac40bb38f3585626b69",
  "user": "5d001ac40bb38f3585626b69",
  "deleted": 0,
  "updatedAt": "2019-06-11T21:19:12.570Z",
  "createdAt": "2019-06-11T21:19:02.461Z",
  "visible": true,
  "externalId": {
    "source": "lumamock",
    "value": "1111111111111"
  },
  "setting": "5d001ac9f0587535a858244a"
}'
```

> The command above returns JSON of an [AppointmentType](#appointmenttype), with the `settings` field fetched and expanded based on the `setting` foreign key.

Updates the given fields of an appointmentType.

Authorization: x-access-token, Roles allowed: admin

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body: any subset of attributes of an [AppointmentType](#appointmenttype).

Response body: JSON of an [AppointmentType](#appointmenttype), with the `settings` field fetched and expanded based on the `setting` foreign key.

## Get by id

`GET` /api/appointmentTypes/:id

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/5d001ac6f0587535a85823d3 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns JSON of an [AppointmentType](#appointmenttype), with the `settings` field fetched and expanded based on the `setting` foreign key.

Returns the JSON of one specific [AppointmentType](#appointmenttype) which is `visible`, fetched by the `id` path parameter. 

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body: JSON of an [AppointmentType](#appointmenttype), with the `settings` field fetched and expanded based on the `setting` foreign key.

## Delete by id

`DELETE` /api/appointmentTypes/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/appointmentTypes/5d001ac6f0587535a85823d3 \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"'
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "_id": "5d001ac6f0587535a85823d3",
    "deleted": 1
}
```

Deletes an appointmentType by its ObjectID.

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | The ObjectID of an AppointmentType to be deleted.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
_id | The ObjectID of an AppointmentType to be deleted.
deleted | Value 1 indicates that it was successfully deleted.

# availabilities

## Get availabilities

`GET` /api/availabilities/

```shell
#shell command:
curl \
http://localhost:8002/api/availabilities?provider=5d001ac8f0587535a858243f&facility=5d001ac8f0587535a858243c&appointmentType=5d001ac6f0587535a85823ca&source=ui \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON like this

```json
{
    "size": 1,
    "response": [
        { ...[Availability](#availability) },
        { ...[Availability](#availability) },
        { ...[Availability](#availability) }
    ],
    "page": 1
}
```

Lists appointment availabilities.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query params | Description 
-------------- | ----------- 
Any property of an [Availability](#availability) | ex.: ?source=ui
provider | ObjectID of a provider
facility | ObjectID of a facility
appointmentType | ObjectID of an appointmentType
source | ui

Response params | Description 
-------------- | ----------- 
size | Number of entries in the response.
response | Array of [Availabilities](#availability).
page | Page number.


## Get by id

`GET` /api/availabilities/:id

```shell
#shell command:
curl \
http://localhost:8002/api/availabilities/5d001af6f0587535a85825ac \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON of an [Availability](#availability).

Lists appointment availabilities.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query params | Description 
-------------- | ----------- 
Any property of an [Availability](#availability) | ex.: ?source=ui
provider | ObjectID of a provider
facility | ObjectID of a facility
appointmentType | ObjectID of an appointmentType
source | ui

Response body: JSON of an [Availability](#availability).

## Create availability

`POST` /api/availabilities/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/availabilities/ \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
    "date": "2019-06-13T15:00:00.000Z",
    "duration": 25,
    "user": "5d001ac40bb38f3585626b69",
    "source": "ui",
    "createdBy": "5d001ac40bb38f3585626b69",
    "updatedBy": "5d001ac40bb38f3585626b69",
    "endDate": "2019-06-13T15:15:00.000Z",
    "facility": "5d001ac8f0587535a858243c",
    "provider": "5d001ac8f0587535a858243f",
    "appointmentType": "5d001ac6f0587535a85823ca",
    "__v": 0,
    "usedForAppointment": "5d001ad3f0587535a8582477",
    "deleted": 0,
    "updatedAt": "2019-06-11T21:20:12.480Z",
    "createdAt": "2019-06-11T21:19:50.848Z",
    "externalId": {
        "source": "lumamock",
        "value": "1560287990847"
    },
    "filters": {
        "providers": [
            "5d001ac8f0587535a858243f"
        ],
        "facilities": [
            "5d001ac8f0587535a858243c"
        ],
        "appointmentTypes": [
            "5d001ac6f0587535a85823ca"
        ]
    },
    "status": "offered"
}'
```

> The command above returns a JSON of the created [Availability](#availability).

Creates an availability.

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body: JSON of an [Availability](#availability) to created.

Response body: JSON of the created [Availability](#availability).

## Update availability

`PUT` /api/availabilities/?id=5d001af6f0587535a85825ac

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/availabilities/?id=5d001af6f0587535a85825ac \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
    "date": "2019-06-13T15:00:00.000Z",
    "duration": 25,
    "user": "5d001ac40bb38f3585626b69",
    "source": "ui",
    "createdBy": "5d001ac40bb38f3585626b69",
    "updatedBy": "5d001ac40bb38f3585626b69",
    "endDate": "2019-06-13T15:15:00.000Z",
    "facility": "5d001ac8f0587535a858243c",
    "provider": "5d001ac8f0587535a858243f",
    "appointmentType": "5d001ac6f0587535a85823ca",
    "__v": 0,
    "usedForAppointment": "5d001ad3f0587535a8582477",
    "deleted": 0,
    "updatedAt": "2019-06-11T21:20:12.480Z",
    "createdAt": "2019-06-11T21:19:50.848Z",
    "externalId": {
        "source": "lumamock",
        "value": "1560287990847"
    },
    "filters": {
        "providers": [
            "5d001ac8f0587535a858243f"
        ],
        "facilities": [
            "5d001ac8f0587535a858243c"
        ],
        "appointmentTypes": [
            "5d001ac6f0587535a85823ca"
        ]
    },
    "status": "offered"
}'
```

> The command above returns a JSON of the updated [Availability](#availability).

Updates an availability.

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query param | Description
----------- | -----------
id | ObjectID of the availability to update.

Request body: JSON of an [Availability](#availability) to updated.

Response body: JSON of the updated [Availability](#availability).

## Book

`PUT` /api/availabilities/:id/book

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/availabilities/5d001af6f0587535a85825af/book?source=self-scheduling&type=5d001af6f0587535a85823aa&appointment=5d001af6f0587535a85824ab \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
    "patient": "5d001ac6f0587535a85823f6",
    "notes": "lorem ipsum",
    "filter": {
    	"appointmentType": "5d017b520bb38f3585626b73"
    }
}'
```

> The command above returns a JSON of an [Appointment](#appointment).

Books an appointment for the given availability. If an appointmentType is passed, then the availability's appointmentType will only be overriden if the user scheduler setting "forceAppointmentTypeDuration" is true. Otherwise, the operation will fail. The appointmentType defines the appointment duration. If there's a waitlist for this availability, it will be updated accordingly.


Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | ObjectID of an availability being taken.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query params | Description
------------ | -----------
source | Can be "self-scheduling", "appointment-cancellation", "ui", "referral", "integrator". See [Availability's](#availability) sources.
type | (optional) ObjectID of an appointmentType. The request body param takes precedence over this one.
appointment | (optional) ObjectID of the appointment being rescheduled.
waitlist | ObjectID of a waitlist to be updated.

Request body param | Description 
-------------- | ----------- 
patient | ObjectID of the patient booking the appointment.
notes | Appointment notes to be passed on.
filter | Object cotaining an `appointmentType`. Takes precedence over the query param.

Response body: JSON of an [Appointment](#appointment).

## Book (deprecated)

`POST` /api/availabilities/book/:id

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/availabilities/book/5d001af6f0587535a85825af?patient=5d001ac6f0587535a85823f6&source=self-scheduling&type=5d001af6f0587535a85823aa&appointment=5d001af6f0587535a85824ab \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
    "notes": "lorem ipsum",
}'
```

> The command above returns a JSON of an [Appointment](#appointment).

Books an appointment for the given availability. If an appointmentType is passed, then the availability's appointmentType will only be overriden if the user scheduler setting "forceAppointmentTypeDuration" is true. Otherwise, the operation will fail. The appointmentType defines the appointment duration. If there's a waitlist for this availability, it will be updated accordingly.


Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | ObjectID of an availability being taken.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query params | Description
------------ | -----------
patient | ObjectID of the patient booking the appointment.
source | Can be "self-scheduling", "appointment-cancellation", "ui", "referral", "integrator". See [Availability's](#availability) sources.
appointmentType | (optional) ObjectID of an appointmentType. The param in the body takes precedence over this one.
appointment | (optional) ObjectID of the appointment being rescheduled.
waitlist | ObjectID of a waitlist to be updated.

Request body param | Description 
-------------- | ----------- 
notes | Appointment notes to be passed on.

Response body: JSON of an [Appointment](#appointment).

## Get freebusy

`GET` /api/availabilities/freebusy

```shell
#shell command:
curl \
http://localhost:8002/api/availabilities/freebusy \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "size": 1,
    "page": 1,
    "response": [
        {
            "appointment": "5d001ad3f0587535a85824b5",
            "facility": "5d001ac8f0587535a8582439",
            "provider": "5d001ac8f0587535a8582441",
            "date": "2019-06-17T17:45:00.000Z",
            "duration": 15,
            "appointmentType": "5d001ac6f0587535a85823d4",
            "patients": [
                {
                    "status": "unconfirmed",
                    "_id": "5d001ac6f0587535a8582404"
                }
            ],
            "status": "unconfirmed",
            "freebusy": "busy"
        }
    ]
}
```

Fetches all availabilities, as well as all confirmed and unconfirmed appointments, match them together and displays which availabilities are busy (with appointments) and which ones are free (without appointments).

Authorization: -access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query params | Description
------------ | -----------
Any property of an [Appointment](#appointment) | ex.: ?source=sync

Response body param | Description 
-------------- | ----------- 
size | Number of items in the current page of the response
page | Current page.
response | An array of "free/busy" objects.

The `free/busy` object has the following attributes:

Attribute | Description
--------- | -----------
appointment | ObjectID of the appointment which took the availability.
facility | ObjectID of the facility.
provider | ObjectID of the provider.
date | Date and time of the availability/appointment.
duration | Duration (in minutes) of the availability/appointment.
appointmentType | ObjectID of the appointmentType.
patients | List of patients with appointments for that availability date and time, showing the appointment ObjectID and status for each patient in the array.
status | Confirmed if any patient has a confirmed appointment.
freebusy | If the patients list is empty, `free`. Otherwise, `busy`.


# billing

## Get billing

`GET` /api/billing/

```shell
#shell command:
curl \
http://localhost:8002/api/billing/ \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post billing

`POST` /api/billing/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/billing/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put billing

`PUT` /api/billing/

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/billing/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get subscriptions

`GET` /api/billing/:id/subscriptions

```shell
#shell command:
curl \
http://localhost:8002/api/billing/:id/subscriptions?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get charges/last-status

`GET` /api/billing/charges/last-status

```shell
#shell command:
curl \
http://localhost:8002/api/billing/charges/last-status?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get charges/last-status

`GET` /api/billing/charges/last-status/:id

```shell
#shell command:
curl \
http://localhost:8002/api/billing/charges/last-status/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get charges/success-count

`GET` /api/billing/charges/success-count

```shell
#shell command:
curl \
http://localhost:8002/api/billing/charges/success-count?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete subscriptions

`DELETE` /api/billing/subscriptions

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/billing/subscriptions?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post subscriptions

`POST` /api/billing/subscriptions

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/billing/subscriptions?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# broadcasts

## Get broadcasts

`GET` /api/broadcasts/

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/ \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "size": 1,
    "response": [
        {
            "_id": "5c4a104bd516aa5448cd400d",
            "user": "5c4a1036f5317251070843a6",
            "title": "Broadcast Message",
            "message": "We apologize for the inconvenience. Dr. John Doe will be out of the office and we will need to reschedule you appointment for 01/30/2019. Please call out office at at your earliest convenience.",
            "createdBy": "5c4a1036f5317251070843a6",
            "updatedBy": "5c4a1036f5317251070843a6",
            "deleted": 0,
            "status": "accepted",
            "updatedAt": "2019-01-24T19:21:47.998Z",
            "createdAt": "2019-01-24T19:21:47.998Z",
            "filterResults": [],
            "patients": [
                "5c4a1038d516aa5448cd3dba",
                "5c4a1038d516aa5448cd3dca",
                "5c4a1038d516aa5448cd3dda",
                "5c4a1038d516aa5448cd3de6",
                "5c4a1038d516aa5448cd3de6",
                "5c4a1038d516aa5448cd3dea"
            ],
            "__v": 0
        }
    ],
    "page": 1
}
```

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query params | Description
------------ | -----------
Any attributes of a [Broadcast](#broadcast) | ex.: ?title=Broadcast%20Message

Response body param | Description 
-------------- | ----------- 
size | Size of the current page of results.
response | Array of [Broadcast](#broadcast).
page | The number of the current page of results.

## Get by id

`GET` /api/broadcasts/:id

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Create broadcast

`POST` /api/broadcasts/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/broadcasts/ \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
	"facility": "5d001ac8f0587535a8582439",
	"provider": "5d001ac8f0587535a8582442",
    "appointmentType": "5d017b520bb38f3585626b73",
    "date": "2019-06-16",
    "appointments": [{
    	"appointment": "5d001ad3f0587535a858248d",
    	"patient": "5d001ac6f0587535a85823f6"
    }],
    "title": "test title",
    "upload": null,
    "message": "broadcast message",
    "patients": ["5d001ac6f0587535a85823f6"],
    "patientMessageTemplate": null,
}'
```

> The command above returns a JSON of a [Broadcast](#broadcast).

Creates a broadcast to be sent.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
message | Broadcast message.
patientMessageTemplate | (optional) ObjectID of a saved message template.
title | (optional) Broadcast message title.
upload | (optional) Upload whose patients (created or updated) will receive the broadcast message.
appointments | (optional) Array of {appointment ObjectIDs and patient's ObjectIDs} whose patients will receive a broadcast message.
facility | (optional) ObjectID of the facility to which the broadcast message will be sent.
provider | (optional) Provider's ObjectID whose patients will receive a broadcast message.
appointmentType | (optional) ObjectID of the appointmentType whose patients will receive a broadcast message.
date | (optional) Appointment date whose patients will receive a broadcast message.

Response body: JSON of a [Broadcast](#broadcast).

## Create bulk broadcast

`POST` /api/broadcasts/bulk/action

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/broadcasts/bulk/action \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
	"facility": "5d001ac8f0587535a8582439",
	"provider": "5d001ac8f0587535a8582442",
  "appointmentType": "5d017b520bb38f3585626b73",
  "date": "2019-06-16 08:00:00",
  "title": "test title",
  "message": "broadcast message",
  "status": "pending",
  "count": "2",
  "sendAt": "2019-06-18 08:00:00",
  "patientMessageTemplate": null
}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Creates bulk broadcast messages for all the patients with appointments on a certain facility, provider, appointmentType and date. It also prevents the same message from being sent twice today (regardless of the given sendAt date).

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Update broadcast

`PUT` /api/broadcasts/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/broadcasts/5d001af9f0587535a858264d \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
    "title": "Broadcast Message",
    "message": "We apologize for the inconvenience. Dr. Joseph Runte will be out of the office and we will need to reschedule you appointment for 06/13/2019. Please call out office at at your earliest convenience.",
    "createdBy": "5d001ac40bb38f3585626b68",
    "deleted": 0,
    "status": "accepted",
    "createdAt": "2019-06-11T21:19:52.387Z",
    "filterResults": [],
    "patients": [
        "5d001ac6f0587535a85823f1",
        "5d001ac6f0587535a85823f6",
        "5d001ac6f0587535a85823f6",
        "5d001ac6f0587535a8582400",
        "5d001ac6f0587535a8582410",
        "5d001ac6f0587535a8582420"
    ]
}'
```

> The command above returns a JSON of a [Broadcast](#broadcast).

Updates a broadcast.

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | ObjectID of the broadcast to be updated.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
Any attributes of a [Broadcast](#broadcast) | ex.: ?title=Broadcast%20Message

Response body: JSON of a [Broadcast](#broadcast).

## Delete broadcast

`DELETE` /api/broadcasts/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/broadcasts/5d068c2d0e9a2a14543190df \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "_id": "5d068c2d0e9a2a14543190df",
    "deleted": 1
}
```

Deletes a broadcast by id.

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | ObjectID of the broadcast to be deleted.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
_id | ObjectID of the deleted broadcast.
deleted | Flag indicating if the broadcast has been sucessfully deleted (1) or not (0).

## XLS of broadcast

`GET` /api/broadcasts/:id/xls

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/5d001af9f0587535a858264d/xls \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a XLS spreadsheet.

Returns a XLS spreadsheet file detailing all the patients of a single broadcast message. In case a patient has more than one active contact info, the system will choose the best, preferring first sms, then e-mail and lastly, voice. It searches for those info on PostgreSQL database but falls back to mongo in case of failure. The file comes with the following columns:

XLS Column | Description 
-------------- | ----------- 
Name | Patient name
Contact | Contact info (sms, email or voice).
Date of Birthiday | Self explanatory.
Next/Last Appointment	| (not used)
Appointments | Number of confirmed appointments
Cancelled Appointmentx | Number of confirmed appointments
Messages | Number of messages sent to patient

Authorization: x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | ObjectID of the broadcast whose XLS will be generated.

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

## Get count

`GET` /api/broadcasts/count

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/count?provider=5d001ac8f0587535a858243f \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a an integer number.

Returns the count of broadcasts based on the given query params of the URL, or all the broadcasts to which the user has access, in case no params are given. In only includes the non-deleted broadcasts.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query Params | Example
-------------- | ----------- 
Any property of a [Broadcast](#broadcast) | ex.: ?provider=5d001ac8f0587535a858243f

## Get patients

`GET` /api/broadcasts/patients

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/patients?status=confirmed \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
// The safeId, token and passwword fields have been changed for security reasons.
{
    "count": 1,
    "patients": [
        {
            "_id": "5d001ac6f0587535a8582414",
            "firstname": "Shania",
            "lastname": "Dicki",
            "safeId": "7f2d3e60b3935400356577e5c4198fa325d74173b3209dda",
            "token": "eyJ0eAiOiJKV1QihbGciOiIUzI1NiJ9.eyJpcMiOiIZDAwMWFjNmYwTg3NTM1YTgODI0MTQiLCleHAOjE1NjAOTI3DI4ODYsIR5cGUiOiwYXRpZ50In0.eoP2jTa5nRMbj8aAB7AuX56kBM_DlnmLwr0d2U",
            "user": "5d001ac40bb38f3585626b69",
            "password": "$2b12$sACZSPMKZonVcr5.eweoosQ15GPmyGDvsYkpXBm",
            "name": "Shania Dicki",
            "type": "patient",
            "createdBy": "5d001ac40bb38f3585626b69",
            "updatedBy": "5d001ac40bb38f3585626b69",
            "__t": "Patient",
            "ldapUser": false,
            "allowedIps": [],
            "twoFactorAuthSecret": {
                "backupCodes": []
            },
            "passwordResetRequired": false,
            "gender": "unknown",
            "country": "US",
            "dateOfBirth": {
                "year": 1957,
                "month": 6,
                "day": 24
            },
            "externalId": {
                "source": "lumamock",
                "value": "1560287942880"
            },
            "language": "en",
            "master": false,
            "active": 0,
            "lastLogin": "2019-06-11T21:19:02.882Z",
            "updatedAt": "2019-06-11T21:19:02.886Z",
            "createdAt": "2019-06-11T21:19:02.882Z",
            "deleted": 0,
            "salesforceData": {
                "lifeline": "trial",
                "respectProvisioning": false,
                "provisioning": []
            },
            "groups": [],
            "doNotContact": false,
            "contact": [
                {
                    "_id": "5d001ac6f0587535a8582415",
                    "active": true,
                    "value": "Roel98.yahoo.com@example.com",
                    "type": "email"
                }
            ],
            "roles": [
                "patient"
            ],
            "passwordUpdatedAt": "2019-06-11T21:19:02.882Z",
            "passwordHashAlgorithm": "bcrypt",
            "outboundContact": [],
            "subscribers": [],
            "lastProcessedAt": "2019-06-11T21:12:07.899Z",
            "stats": {
                "oldestAppointment": "2019-06-11T21:12:07.922Z",
                "average": {
                    "appointmentOfferReplyTime": 0
                },
                "counters": {
                    "appointmentOffersReplied": 0,
                    "offersAccepted": 0,
                    "offersSent": 0,
                    "cancelledAppointments": 0,
                    "confirmedAppointments": 0,
                    "messagesSentToPatient": 0
                }
            },
            "__v": 0,
            "appointment": {
                "_id": "5d001ad3f0587535a85824e3",
                "patient": "5d001ac6f0587535a8582414",
                "date": "2019-06-20T23:45:00.000Z",
                "duration": 15,
                "source": "manual",
                "status": "unconfirmed",
                "provider": "5d001ac8f0587535a858243f",
                "type": "5d001ac6f0587535a85823d1",
                "facility": "5d001ac8f0587535a8582439",
                "user": "5d001ac40bb38f3585626b69",
                "createdBy": "5d001ac40bb38f3585626b69",
                "updatedBy": "5d001ac40bb38f3585626b69",
                "endDate": "2019-06-21T00:00:00.000Z",
                "integratorUpdateResults": {
                    "status": "pending"
                },
                "deleted": 0,
                "updatedAt": "2019-06-11T21:19:15.958Z",
                "createdAt": "2019-06-11T21:19:15.958Z",
                "stats": {
                    "counters": {
                        "remindersSent": 0
                    }
                },
                "statusReason": null,
                "externalId": {
                    "source": "lumamock",
                    "value": "1560287955958"
                },
                "__v": 0
            }
        }
    ]
}
```

First, it counts appointments grouped by patient, matching the given query params, sorted by date, returning an array structured like this `[{ count: X, patient: {...} }]`, where X is the number of appointments for that given patient. Then, the patient objects are extracted from the previous search result and their non-deleted appointments for the last 7 days are searched and the first one is inserted into the patient object as the `appointment` field. Lastly, it returns an object with a `count` property with the amount of different patients with appointments (not the amount of appointments), and a `patients` property, containing the array of patients, each one containing his first `appointment` details. The query params are used for the first part, in order to find patients with appointments matching the params. But on the second part, those params are not considered, and the first appointment from the appointments of the last 7 days is returned.

If no query params are given, then it uses the following defaults:
- appointment `date = {$gt: new Date(moment().startOf('day'))}`
- `status: {$ne: 'cancelled'}`.

There are no default `page` and `limit` and if none are given, all the patients are returned.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Query param | Description 
-------------- | ----------- 
Any property of an [Appointment](#appointment) | ex.: ?status=confirmed

The values of the query params accept objects containing one of these three operators: `$in`, `$ne` and `$nin`.

`$in` and `$nin` accept an array of ObjectIDs referring to any [Type ref'd by an Appointment](#appointment). Ex.: `provider: { $in: [5d001ac8f0587535a858243f, 5d001ac8f0587535a858243c] }`


# callback

## Get email/offers

`GET` /api/callback/email/offers

```shell
#shell command:
curl \
http://localhost:8002/api/callback/email/offers?MessageSid=123&From=foobar@mail.com&id=johndoe@lumahealth.io&text=yes&waitlistId=5d001ad8f0587535a858255a&userId=5d001ac40bb38f3585626b69 \
-H 'Content-Type: application/json'
```

> The command above returns a JSON of a [waitlist](#waitlist): 

```json-doc
{
    "_id": "5d001ad8f0587535a858255a",
    "patient": "5d001ad4f0587535a8582526",
    "user": "5d001ac40bb38f3585626b69",
    "bookedBy": "department",
    "createdBy": "5d001ac40bb38f3585626b69",
    "updatedBy": "5d001ac40bb38f3585626b69",
    "__v": 0,
    "updatedAt": "2019-06-11T21:19:20.348Z",
    "stats": {
        "counters": {
            "offersSent": 0
        }
    },
    "preferredTime": "anytime",
    "preferredDays": [],
    "createdAt": "2019-06-11T21:19:20.348Z",
    "futureAppointmentBestMatch": false,
    "status": "waiting",
    "appointmentType": [],
    "facility": "5d001ac8f0587535a8582439",
    "provider": [
        "5d001ac8f0587535a858243f"
    ]
}
```

Callback channel invoked by twillio when an email reply is received regarding an `appointment-offer`. It publishes the message to notificationCallbackQueue (to be consumed by notification-service).

Authorization: No Auth (public method)

Query params | Description 
-------------- | ----------- 
MessageSid | Twillio SID.
From | Patient's e-mail address.
id | Sender's e-mail address.
text | Email text body. Accepted values: `yes` or `no`
waitlistId | ObjectID of the patient's [waitlist](#waitlist) position.
userId | OjectID of the sender [user](#user).

Response body: JSON of a [waitlist](#waitlist)

## Get email/reminders

`GET` /api/callback/email/reminders

```shell
#shell command:
curl \
http://localhost:8002/api/callback/email/reminders?id=johndoe@lumahealth.io&text=yes \
-H 'Content-Type: application/json'
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "message": "success"
}
```

Publishes a message like the one bellow to notificationCallbackQueue to be consumed by notification-service:

```json-doc
{
  "from": "johndoe@lumahealth.io",
  "ref": "reminder",
  "channel": "email",
  "text": "yes",
  "externalId": {
    "source": "sendgrid",
    "value": ""
  },
  "callbackCalledAt": 1561054414328
}
```

Authorization: No Auth 

Query params | Description 
-------------- | ----------- 
id | Sender's e-mail address.
text | Email text body. Accepted values: `yes` or `no`

## Post email/sendgrid

`POST` /api/callback/email/sendgrid

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/email/sendgrid \
-H 'Content-Type: application/json' \
 -d '[
    {
        "uuid": "1560287991204",
        "event": "open"
    }
]'
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "message": "ok"
}
```

Updates status of many reminders whose externalId's source is `sendgrid` and value is the given UUID. Their `updatedAt` field is also updated with the current date.

Accepts an array of `{ UUID, event }`.

The `event` may be `open`, `click`, `bounce`, `dropped`, `deferred` or `delivered`, and the reminder's status will be updated according to the following table:

event | status
----- | ------
`open` | emailOpened
`click` | emailOpened
`bounce` | failed
`dropped` | failed
`deferred` | failed
`delivered` | delivered

Authorization: No Auth

Request body param | Description 
-------------- | ----------- 
uuid | Reminder external ID value.
event | Accepted values: `open`, `click`, `bounce`, `dropped`, `deferred` or `delivered`.

## Post integrators/auth

`POST` /api/callback/integrators/:integratorType/auth/:userId/:secret/:integratorId

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/integrators/webpt/auth/5c4a1036f5317251070843a6/123456 \
-H 'Content-Type: application/json' \
-H 'hmacheadername: d5c5537e434ada12f0ad553571799894227d5f5e8d6748f0782c4e9c1ebd5800' \
 -d '{
		"authtoken": "123456"
	}'

curl -X POST \
http://localhost:8002/api/callback/integrators/epic/auth/5c4a1036f5317251070843a6/123456 \
-H 'Content-Type: application/json' \
-H 'hmacheadername: d5c5537e434ada12f0ad553571799894227d5f5e8d6748f0782c4e9c1ebd5800' \
 -d '{
    "type": "referral",
    "PatientID": "1",
    "PatientIDType": "2"
}'
```

> The command above returns an empty response with HTTP Status 200 (OK).

Updates an [integrator](#integrator)  based on the given `integratorType`, `userId` and `secret`. 

In case there is a `credentials.hmacHeader` and `credentials.hmacSecret` in the integrator's credentials, then a HMAC signature is required by integration, and a request header with the same name as what is stored in  `credentials.hmacHeader` must be passed, containing the SHA256 hash of the HMAC secret required by integraion.

If the integrator type is `webpt`, then it updated such integrator with a new auth token, by creating the following entry in redis:
- key: `webpt:credential:{{integratorId}}:cookie}`
- value: `authtoken` passed in request body.
- expiration: 120 minutes

If the integrator type is `epic` (specific to UCSF) and the request body contains a `type` param set to `referral`, a `PatientID` and `PatientIDType`, then it creates the following entry in redis:
- key: `epic:credential:{{integratorId}}:incomingreferrals`
- value: JSON string of the request body.

If the integrator type is something else, nothing is done.

Authorization: No Auth

Path parameters | Description 
-------------- | ----------- 
:integratorType | Either `webpt` or `epic`.
:userId | ObjectID of the owner [user](#user) of an [Integrator](#integrator).
:secret | [Integrator](#integrator)'s `credentials.sharedSecret`.
:integratorId | Not used.

Request headers | Description 
-------------- | ----------- 
`{{integrator.credentials.hmacHeader}}` | (optional) sha256 of an HMAC signature if required by integraion.

Request body param | Description 
-------------- | ----------- 
authtoken | Authentication token. Required if integratorType is `webpt`. Otherwise not needed.
type | Must be `referral` when integratorType is `epic`. Otherwise, not needed.
PatientID | Required when integratorType is `epic`. Otherwise, not needed.
PatientIDType | Required when integratorType is `epic`. Otherwise, not needed.

Response: empty response with HTTP Status 200 (OK).

## Post mi7/ack

`POST` /api/callback/mi7/ack/:apikey/:systemid/:messageid

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/mi7/ack/FEKiaoE58HVtBYDprkYW9iBiSAmISfVsCAgoZnq7xntKZb3LnCoPxTIsKuFuJKdh/123456/5d0c1724347d583498998b8f \
-H 'Content-Type: application/json' \
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "result": "success"
}
```

Updates an [hl7message](#hl7message) with `{ status: 'completed' }`. The `:systemId` of an integrator whose type is `mi7` is needed because its owner [user](#user) will be used to update the [hl7message](#hl7message).

Authorization: No Auth

Path parameters | Description 
-------------- | ----------- 
:apikey | Secret API key which must be passed by caller.
:systemid | MI7 Integrator's `credentials.systemId`.
:messageid | ObjectID of an [hl7message](#hl7message) to be updated.

## Post mi7/from

`POST` /api/callback/mi7/from/:apikey/:systemid

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/mi7/from/FEKiaoE58HVtBYDprkYW9iBiSAmISfVsCAgoZnq7xntKZb3LnCoPxTIsKuFuJKdh/123456 \
-H 'Content-Type: application/json' \
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "result": "success"
}
```

Creates an inbound [hl7message](#hl7message) with `{ status: 'pending' }`. The `:systemId` of an integrator whose type is `mi7` is needed because its owner [user](#user) will be used to create the [hl7message](#hl7message).


Authorization: No Auth

Path parameters | Description 
-------------- | ----------- 
:apikey | Secret API key which must be passed by caller.
:systemid | MI7 Integrator's `credentials.systemId`.

## Get mi7/to

`GET` /api/callback/mi7/to/:apikey/:systemid

```shell
#shell command:
curl \
http://localhost:8002/api/callback/mi7/to/:apikey/:systemid \
-H 'Content-Type: application/json' \
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "result": "success",
    "messages": [
        {
            "hello": "world",
            "MessageID": "5d0c1724347d583498998b8f"
        }
    ]
}
```

Updates all `pending` outbound messages to `processing`, so that they might get sent to the desired MI7 Integrator (system ID).

Authorization: No Auth

Path parameters | Description 
-------------- | ----------- 
:apikey | Secret API key which must be passed by caller.
:systemid | MI7 Integrator's `credentials.systemId`.

Response body param | Description 
-------------- | ----------- 
result | May be either `error` or `success`.
messages | array containing [HL7 Message's contents](#hl7message).

## Get plivo/sms/reminders

`GET` /api/callback/plivo/sms/reminders

```shell
#shell command:
curl \
http://localhost:8002/api/callback/plivo/sms/reminders?Text=test&MessageUUID=270c0b1a-617f-40ec-a761-312296426f1b&From=555&To=666&MediaUrl0=http://www.lumahealth.io \
-H 'Content-Type: application/json' \
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "status": "ok"
}
```

Allows plivio to notify luma of a reminder reply. If it finds a corresponding outbound message in luma (with To and From numbers switched), then it publishes the reply to `notificationCallbackQueue`, to be processed by another service such as notification-service or reminder-service.

In case the reply is an MMS message (contains a `MediaUrl0`), it is posted to luma's slack channel `#devops-inbound-mms`.

If the same message UUID is requested twice in a window of 24h, the second request will be declined.

Authorization: No Auth

Query param | Description 
-------------- | ----------- 
Text | The user's reply text.
MessageUUID | Plivio's unique ID for the message.
From | The user's phone number.
To | Luma/Plivio's reply-to number.
MediaUrl0 | Media URL in case of a MMS message.

## Post practicefusion/auth

`POST` /api/callback/practicefusion/auth/:userId/:secret

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/practicefusion/auth/5d001ac40bb38f3585626b69/123 \
-H 'Content-Type: application/json' \
 -d '{
	"authtoken": "123"
}'
```

> The command above returns an empty response with HTTP Status 200 (OK).

Sets or updates the `credentials.authToken` of a practicefusion integrator.

Authorization: No Auth

Path parameters | Description 
-------------- | ----------- 
:userId | ObjectID of the owner [User](#user) of a practicefusion integrator.
:secret | Credential's shared secret of the practicefusion integrator.

Request body param | Description 
-------------- | ----------- 
authtoken | Authentication token of a practicefusion integrator.

Response: empty with HTTP Status 200 (OK).

## Get practicefusion/textcode

`GET` /api/callback/practicefusion/textcode

```shell
#shell command:
curl \
http://localhost:8002/api/callback/practicefusion/textcode?Body=123 \
-H 'Content-Type: application/json' \
```

> The command above returns an empty response with HTTP Status 200 (OK).

Updates the `textcodeKey` in redis, for the practicefusion integrator, with the numeric textcode in the request query param named `Body`.

Authorization: No Auth

Request query param | Description 
-------------- | ----------- 
Body | Practicefusion's numeric textcode to be set or updated in redis.

Response: empty with HTTP Status 200 (OK).


## Post slack

`POST` /api/callback/slack/

```shell
#shell command:
curl -X POST \
  http://localhost:8002/api/callback/slack \
  -H 'Content-Type: application/json' \
  -H 'x-slack-request-timestamp: 1561149636348' \
  -H 'x-slack-signature: v0=nbo765wzkx2to8tzktf69wobujavurdnsd5xttv8c7wsxe4kkp3nrjnq46u4he2s' \
  -d '{
    "payload": "{ \"user\": { \"name\": \"marcelo\" }, \"actions\": [ { \"value\": \"dump\" } ], \"callback_id\":\"queue:actions:testQueueName\" }"
}'
```

> The command above returns an empty response with HTTP Status 200 (OK).

Dumps an action queue from ActiveMQ and sends a message to slack channel `#devops-queues` in case there is an error.

Authorization: No Auth

Request headers | Description 
-------------- | ----------- 
x-slack-request-timestamp | Slack request timestamp
x-slack-signature | SHA256 HMAC signature of `v0:${slackRequestTimestamp}:${req.rawBody}` using Badbot's signing secret.

Request body param | Description 
-------------- | ----------- 
payload.user.name | User name of a luma administrator.
actions | A length-1 array containing one object with a `value` property set to `dump`.
callback_id | ActiveMQ's actions queue `name` to be dumped, in the format `queue:actions:{{name}}`.

Response: empty response with HTTP Status 200 (OK).

## Get sms/offers

`GET` /api/callback/sms/offers

```shell
#shell command:
curl \
http://localhost:8002/api/callback/sms/offers?Body=yes \
-H 'Content-Type: application/json' \
```

Allows twilio to notify luma of an SMS offer reply. If it finds a corresponding outbound message in luma (with To and From numbers switched), then it publishes the reply to `notificationCallbackQueue`, to be processed by another service such as notification-service or reminder-service.

In case the reply is an MMS message (contains a `MediaUrl0`), it is posted to luma's slack channel `#devops-inbound-mms`.

If the same SmsMessageSid is requested twice in a window of 24h, the second request will be declined.

Authorization: No Auth

Query param | Description 
-------------- | ----------- 
Body | The user's reply text.
SmsMessageSid | Twilio's unique ID for the message.
From | The user's phone number.
To | Luma/Twilio's reply-to number.
MediaUrl0 | (optional) Media URL in case of a MMS message.
SmsStatus | (optional) Delivery (DLR) status. May be , `failed`, `undelivered`, `pending`.

## Get sms/referrals

`GET` /api/callback/sms/referrals

```shell
#shell command:
curl \
http://localhost:8002/api/callback/sms/referrals?Body=test&SmsMessageSid=46777491-031a-4cca-8219-e34257faedab&From=5551037&To=5551111&SmsStatus=dlrStatus&MediaUrl0= \
-H 'Content-Type: application/json'
```

> The command above returns an XML structured like this: 

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response></Response>
```

Allows twilio to notify luma of a referral-reminder reply. If it finds a corresponding outbound message in luma (with To and From numbers switched), then it publishes the reply with `ref: referral-reminder` to `notificationCallbackQueue`, to be processed by another service such as notification-service or reminder-service.

In case the reply is an MMS message (contains a `MediaUrl0`), it is posted to luma's slack channel `#devops-inbound-mms`.

If the same message UUID is requested twice in a window of 24h, the second request will be declined.

Authorization: No Auth

Query param | Description 
-------------- | ----------- 
Body | The user's reply text.
SmsMessageSid | Twilio's unique ID for the message.
From | The user's phone number.
To | Luma/Twilio's reply-to number.
MediaUrl0 | (optional) Media URL in case of a MMS message.
SmsStatus | (optional) Delivery (DLR) status. May be , `failed`, `undelivered`, `pending`.

Response body:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response></Response>
```

## Get sms/reminders

`GET` /api/callback/sms/reminders

```shell
#shell command:
curl \
http://localhost:8002/api/callback/sms/reminders?Body=test&SmsMessageSid=270c0b1a-617f-40ec-a761-312296426f1b&From=555&To=666&MediaUrl0=http://www.lumahealth.io \
-H 'Content-Type: application/json' \
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "status": "ok"
}
```

Allows twilio to notify luma of a reminder reply. If it finds a corresponding outbound message in luma (with To and From numbers switched), then it publishes the reply to `notificationCallbackQueue`, to be processed by another service such as notification-service or reminder-service.

In case the reply is an MMS message (contains a `MediaUrl0`), it is posted to luma's slack channel `#devops-inbound-mms`.

If the same SmsMessageSid is requested twice in a window of 24h, the second request will be declined.

If an `SmsStatus` is given, then the existing [reminder](#reminder) whose `externalId.value` is the same as `SmsMessageSid` and `externalId.source` is `twilio` is updated with status `delivered` (DLR).

Authorization: No Auth

Query param | Description 
-------------- | ----------- 
Body | The user's reply text.
SmsMessageSid | Twilio's unique ID for the message.
From | The user's phone number.
To | Luma/Twilio's reply-to number.
MediaUrl0 | (optional) Media URL in case of a MMS message.
SmsStatus | (optional) Delivery (DLR) status. May be `delivered`, `failed`, `undelivered`, `pending`.

## Post status

`POST` /api/callback/status/:vendor

```shell
#shell command:
curl -X POST \
  http://localhost:8002/api/callback/status/twilio \
  -H 'Content-Type: application/json' \
  -d '{
    "MessageStatus": "failed",
    "MessageSid": "5d001b1bf0587535a85827be",
    "ErrorCode": "1"
}'
```

> The command above returns `OK`.

```shell
#redis-cli
set luma:sid:twilio:5d001b1bf0587535a85827be "{\"message\":\"5d001b1bf0587535a85827be\", \"user\":\"5d001ac40bb38f3585626b69\"}"
```

> The comand above artificially creates the redis cache for testing purposes.

Updates a [message](#message)'s `status` and `statusReason` on mongo and redis cache for `plivo` or `twilio`.

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:vendor | Either `twilio` or `plivo`.

Request body from twilio | Description 
-------------- | ----------- 
MessageSid | Twilio's unique ID for the message (ObjectID).
MessageStatus | Twilio's delivery (DLR) status. May be `delivered`, `failed`, `undelivered`, `pending`.
ErrorCode | Twilio's error code which will become `statusReason`.

Request body from plivo | Description 
-------------- | ----------- 
message_uuid | Plivo's unique ID for the message (ObjectID).
message_state | Plivo's delivery (DLR) status. May be `delivered`, `failed`, `undelivered`, `pending`.
error_code | Plivo's error code which will become `statusReason`.

Response body | Response code | Reason
------------- | ------------- | ------
OK | 200 | Success.
Not Acceptable | 406 | Error retrieving, updating or removing message from mongo or redis.
Bad Request | 400 | No unique identifier provided and other errors.

## Post stripe/charges

`POST` /api/callback/stripe/charges

```shell
#shell command:
curl -X POST \
  http://localhost:8002/api/callback/stripe/charges \
  -H 'Content-Type: application/json' \
  -d '{
    "data": {
    	"object": {
    		"id": "ch_1Erm7m2eZvKYlo2CLY8OqU7C",
    		"customer": "cus_FMV3IG3IH4viwW",
        "time": "1562074462",
        "amount": 100,
        "source": {
          "id": "src_1Ermup2eZvKYlo2CQmJ6FCxS"
        }
    	}
    },
    "type": "charge.succeeded"
}'
```

> The command above returns an empty response with HTTP status 200 (OK).

Stripe webhook endpoint to allow Luma to be notified about events that happen in its Stripe account. Most transactions (creating charge or refunds, for instance) don't need webhooks because they happen synchronously, but the [Payment Intents API](https://stripe.com/docs/payments/payment-intents) with automatic confirmation and most payment methods using [Sources](https://stripe.com/docs/sources) require using webhooks, so that Luma can be notified about asynchronous changes to the status of PaymentIntent and Source objects.

Luma currently expects "charge.failed" and "charge.succeeded" events.

For "charge.succeeded" events, the system clears whatever "failed charges record" that may exist in redis for one specific payer. It also increments the "charge has happened" flag in redis.

For "charge.failed" events, the system logs the failed charge data and increments the failed charge count in redis.

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
data.object | Stripe's [charge object](https://stripe.com/docs/api/charges/object).
data.object.source | Stripe's [source object](https://stripe.com/docs/api/sources/object).

Response: empty with HTTP status 200 (OK).

## Post twilio

`POST` /api/callback/twilio/:id

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/twilio/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get voice/offers

`GET` /api/callback/voice/offers

```shell
#shell command:
curl \
http://localhost:8002/api/callback/voice/offers?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get voice/referrals

`GET` /api/callback/voice/referrals

```shell
#shell command:
curl \
http://localhost:8002/api/callback/voice/referrals?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post voice/referrals

`POST` /api/callback/voice/referrals

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/voice/referrals?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get voice/reminders

`GET` /api/callback/voice/reminders

```shell
#shell command:
curl \
http://localhost:8002/api/callback/voice/reminders?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# chatActivities

## Get chatActivities

`GET` /api/chatActivities/

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put assign

`PUT` /api/chatActivities/:id/assign

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/chatActivities/:id/assign?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put clear

`PUT` /api/chatActivities/:id/clear

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/chatActivities/:id/clear?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put close

`PUT` /api/chatActivities/:id/close

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/chatActivities/:id/close?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get all

`GET` /api/chatActivities/all

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/all?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get notifications

`GET` /api/chatActivities/notifications

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/notifications?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get mentions

`GET` /api/chatActivities/mentions

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/mentions?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get presence

`GET` /api/chatActivities/presence

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/presence?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get unread

`GET` /api/chatActivities/unread

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/unread?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get unread/patients

`GET` /api/chatActivities/unread/patients

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/unread/patients?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# contexts

## Get by refId

`GET` /api/contexts/:refId

```shell
#shell command:
curl \
http://localhost:8002/api/contexts/:refId?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:refId | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# customWebStyles

## Post customWebStyle

`POST` /api/customWebStyles/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/customWebStyles/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get customWebStyles

`GET` /api/customWebStyles/

```shell
#shell command:
curl \
http://localhost:8002/api/customWebStyles/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/customWebStyles/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/customWebStyles/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/customWebStyles/:id

```shell
#shell command:
curl \
http://localhost:8002/api/customWebStyles/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get publish

`GET` /api/customWebStyles/:id/publish

```shell
#shell command:
curl \
http://localhost:8002/api/customWebStyles/:id/publish?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put publish

`PUT` /api/customWebStyles/:id/publish

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/customWebStyles/:id/publish?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Put upload

`PUT` /api/customWebStyles/:id/upload

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/customWebStyles/:id/upload?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# demoUsers

## Post demoUser

`POST` /api/demoUsers/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/demoUsers/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get messages

`GET` /api/demoUsers/:salesforceId/messages/:messageTemplate

```shell
#shell command:
curl \
http://localhost:8002/api/demoUsers/:salesforceId/messages/:messageTemplate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:salesforceId | xxx
:messageTemplate | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post messages

`POST` /api/demoUsers/:salesforceId/messages/:messageTemplate

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/demoUsers/:salesforceId/messages/:messageTemplate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:salesforceId | xxx
:messageTemplate | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:salesforceId | xxx
:messageTemplate | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# deploymentWebhooks

## Get circle

`GET` /api/deploymentWebhooks/circle/:repoName/:branch

```shell
#shell command:
curl \
http://localhost:8002/api/deploymentWebhooks/circle/:repoName/:branch?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:repoName | xxx
:branch | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post github

`POST` /api/deploymentWebhooks/github

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/deploymentWebhooks/github?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get github/reviews

`GET` /api/deploymentWebhooks/github/:username/reviews

```shell
#shell command:
curl \
http://localhost:8002/api/deploymentWebhooks/github/:username/reviews?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:username | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# diagnoses

## Get diagnoses

`GET` /api/diagnoses/

```shell
#shell command:
curl \
http://localhost:8002/api/diagnoses/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/diagnoses/:id

```shell
#shell command:
curl \
http://localhost:8002/api/diagnoses/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Post diagnose

`POST` /api/diagnoses/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/diagnoses/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Put by id

`PUT` /api/diagnoses/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/diagnoses/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Get icd10/search

`GET` /api/diagnoses/icd10/search

```shell
#shell command:
curl \
http://localhost:8002/api/diagnoses/icd10/search?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Get icd9/search

`GET` /api/diagnoses/icd9/search

```shell
#shell command:
curl \
http://localhost:8002/api/diagnoses/icd9/search?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

# docs

## Post doc

`POST` /api/docs/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/docs/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get docs

`GET` /api/docs/

```shell
#shell command:
curl \
http://localhost:8002/api/docs/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# downtimeMessage

## Get downtimeMessage

`GET` /api/downtimeMessage/

```shell
#shell command:
curl \
http://localhost:8002/api/downtimeMessage/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# facilities

## Get facilities

`GET` /api/facilities/

```shell
#shell command:
curl \
http://localhost:8002/api/facilities/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post facility

`POST` /api/facilities/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/facilities/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/facilities/:id

```shell
#shell command:
curl \
http://localhost:8002/api/facilities/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/facilities/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/facilities/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/facilities/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/facilities/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get hidden

`GET` /api/facilities/hidden

```shell
#shell command:
curl \
http://localhost:8002/api/facilities/hidden?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get search

`GET` /api/facilities/search

```shell
#shell command:
curl \
http://localhost:8002/api/facilities/search?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# feedbackResponses

## Get feedbackResponses

`GET` /api/feedbackResponses/

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post negative

`POST` /api/feedbackResponses/negative

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/feedbackResponses/negative?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get negative

`GET` /api/feedbackResponses/negative/:id

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/negative/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post positive

`POST` /api/feedbackResponses/positive

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/feedbackResponses/positive?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get positive

`GET` /api/feedbackResponses/positive/:id

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/positive/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get promoters|detractors

`GET` /api/feedbackResponses/promoters|detractors

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/promoters|detractors?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/clicks

`GET` /api/feedbackResponses/reports/clicks

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/clicks?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/detractors

`GET` /api/feedbackResponses/reports/detractors

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/detractors?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/find

`GET` /api/feedbackResponses/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/find?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/findAll

`GET` /api/feedbackResponses/reports/findAll

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/findAll?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/npsscore

`GET` /api/feedbackResponses/reports/npsscore

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/npsscore?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/npsscores

`GET` /api/feedbackResponses/reports/npsscores

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/npsscores?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/promoters

`GET` /api/feedbackResponses/reports/promoters

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/promoters?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/summary

`GET` /api/feedbackResponses/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/summary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/xls

`GET` /api/feedbackResponses/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/xls?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post score

`POST` /api/feedbackResponses/score

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/feedbackResponses/score?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# fileMappings

## Get fileMappings

`GET` /api/fileMappings/

```shell
#shell command:
curl \
http://localhost:8002/api/fileMappings/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# fileUploads

## Post fileUpload

`POST` /api/fileUploads/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/fileUploads/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/fileUploads/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/fileUploads/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/fileUploads/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/fileUploads/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/fileUploads/:id

```shell
#shell command:
curl \
http://localhost:8002/api/fileUploads/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put binary

`PUT` /api/fileUploads/:id/binary

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/fileUploads/:id/binary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete binary

`DELETE` /api/fileUploads/:id/binary

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/fileUploads/:id/binary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get binary

`GET` /api/fileUploads/:id/binary

```shell
#shell command:
curl \
http://localhost:8002/api/fileUploads/:id/binary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get file

`GET` /api/fileUploads/:id/file

```shell
#shell command:
curl \
http://localhost:8002/api/fileUploads/:id/file?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get thumbnail

`GET` /api/fileUploads/:id/thumbnail

```shell
#shell command:
curl \
http://localhost:8002/api/fileUploads/:id/thumbnail?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post binary

`POST` /api/fileUploads/binary

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/fileUploads/binary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# followups

## Post followup

`POST` /api/followups/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/followups/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get followups

`GET` /api/followups/

```shell
#shell command:
curl \
http://localhost:8002/api/followups/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/followups/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/followups/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/followups/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/followups/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/followups/:id

```shell
#shell command:
curl \
http://localhost:8002/api/followups/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post bulk

`POST` /api/followups/bulk

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/followups/bulk?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get groups

`GET` /api/followups/groups

```shell
#shell command:
curl \
http://localhost:8002/api/followups/groups?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# groupInvites

## Get groupInvites

`GET` /api/groupInvites/

```shell
#shell command:
curl \
http://localhost:8002/api/groupInvites/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# groups

## Get groups

`GET` /api/groups/

```shell
#shell command:
curl \
http://localhost:8002/api/groups/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post group

`POST` /api/groups/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/groups/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/groups/:id

```shell
#shell command:
curl \
http://localhost:8002/api/groups/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/groups/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/groups/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/groups/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/groups/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id/user

`DELETE` /api/groups/:id/:user

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/groups/:id/:user?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx
:user | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:user | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post by id/user

`POST` /api/groups/:id/:user

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/groups/:id/:user?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx
:user | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:user | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post accept-invitation

`POST` /api/groups/:id/accept-invitation

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/groups/:id/accept-invitation?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post invite-user

`POST` /api/groups/:id/invite-user

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/groups/:id/invite-user?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get invites

`GET` /api/groups/:id/invites

```shell
#shell command:
curl \
http://localhost:8002/api/groups/:id/invites?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put accept-pending-invites

`PUT` /api/groups/accept-pending-invites

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/groups/accept-pending-invites?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get public/get-invite

`GET` /api/groups/public/get-invite

```shell
#shell command:
curl \
http://localhost:8002/api/groups/public/get-invite?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get users

`GET` /api/groups/users/:id

```shell
#shell command:
curl \
http://localhost:8002/api/groups/users/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# heartbeat

## Get by id

`GET` /api/heartbeat/:id

```shell
#shell command:
curl \
http://localhost:8002/api/heartbeat/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

# hl7messages

## Post hl7message

`POST` /api/hl7messages/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/hl7messages/ \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
	"integrator": "5c4a1054d516aa5448cd412e",
	"message": "{ \"must be\": \"a JSON string\"}"
}'
```

> The command above returns a JSON structured like this: 

```json-doc
{
    "result": "success"
}
```

Creates a message for an HL7 Integrator, with `direction` being `inbound` (facility to luma), `integratorRef` pointing to the given `integrator` param in the request body, `content` being the request `message` param in the request body, and `status`: `pending`.

Authorization: x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
integrator | HL7 Integrator's ObjectID.
message | JSON string containing a message object.

# insurances

## Get insurances

`GET` /api/insurances/

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post insurance

`POST` /api/insurances/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/insurances/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/insurances/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/insurances/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/insurances/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/insurances/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/insurances/:id

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post binary

`POST` /api/insurances/:id/binary

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/insurances/:id/binary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get coverage

`GET` /api/insurances/:id/coverage

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/:id/coverage?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post binary

`POST` /api/insurances/binary

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/insurances/binary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get payers

`GET` /api/insurances/payers

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/payers?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get payers

`GET` /api/insurances/payers/:id

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/payers/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# integratorClients

## Get integratorClients

`GET` /api/integratorClients/

```shell
#shell command:
curl \
http://localhost:8002/api/integratorClients/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post integratorClient

`POST` /api/integratorClients/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/integratorClients/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/integratorClients/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/integratorClients/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/integratorClients/:id

```shell
#shell command:
curl \
http://localhost:8002/api/integratorClients/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/integratorClients/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/integratorClients/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post login

`POST` /api/integratorClients/login

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/integratorClients/login?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# integrators

## Post integrator

`POST` /api/integrators/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/integrators/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get integrators

`GET` /api/integrators/

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/integrators/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/integrators/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/integrators/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/integrators/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/integrators/:id

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get admin

`GET` /api/integrators/admin

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/admin?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get configuration

`GET` /api/integrators/configuration

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/configuration?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get configuration

`GET` /api/integrators/configuration/:integrator

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/configuration/:integrator?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:integrator | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# messages-errors

## Get messages-errors

`GET` /api/messages-errors/

```shell
#shell command:
curl \
http://localhost:8002/api/messages-errors/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/xls

`GET` /api/messages-errors/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/messages-errors/reports/xls?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# messages

## Get messages

`GET` /api/messages/

```shell
#shell command:
curl \
http://localhost:8002/api/messages/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post message

`POST` /api/messages/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/messages/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/messages/:id

```shell
#shell command:
curl \
http://localhost:8002/api/messages/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get crudList

`GET` /api/messages/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/messages/crudList?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# messageTemplates

## Post messageTemplate

`POST` /api/messageTemplates/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/messageTemplates/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/messageTemplates/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/messageTemplates/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post by key

`POST` /api/messageTemplates/:key

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/messageTemplates/:key?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:key | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:key | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by key?

`GET` /api/messageTemplates/:key?

```shell
#shell command:
curl \
http://localhost:8002/api/messageTemplates/:key??q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:key? | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get resolve

`GET` /api/messageTemplates/:key/resolve

```shell
#shell command:
curl \
http://localhost:8002/api/messageTemplates/:key/resolve?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:key | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get list

`GET` /api/messageTemplates/list

```shell
#shell command:
curl \
http://localhost:8002/api/messageTemplates/list?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# notifications

## Get notifications

`GET` /api/notifications/

```shell
#shell command:
curl \
http://localhost:8002/api/notifications/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put clear

`PUT` /api/notifications/clear

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/notifications/clear?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# offers

## Post offer

`POST` /api/offers/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/offers/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get offers

`GET` /api/offers/

```shell
#shell command:
curl \
http://localhost:8002/api/offers/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/offers/:id

```shell
#shell command:
curl \
http://localhost:8002/api/offers/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/offers/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/offers/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post cancel

`POST` /api/offers/:id/cancel

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/offers/:id/cancel?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get waitlists

`GET` /api/offers/:id/waitlists

```shell
#shell command:
curl \
http://localhost:8002/api/offers/:id/waitlists?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get crudList

`GET` /api/offers/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/offers/crudList?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get findByPatientId

`GET` /api/offers/findByPatientId/:id

```shell
#shell command:
curl \
http://localhost:8002/api/offers/findByPatientId/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/find

`GET` /api/offers/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/offers/reports/find?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/summary

`GET` /api/offers/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/offers/reports/summary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# organizations

## Get organizations

`GET` /api/organizations/

```shell
#shell command:
curl \
http://localhost:8002/api/organizations/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post organization

`POST` /api/organizations/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/organizations/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/organizations/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/organizations/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/organizations/:id

```shell
#shell command:
curl \
http://localhost:8002/api/organizations/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/organizations/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/organizations/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get access

`GET` /api/organizations/:id/access

```shell
#shell command:
curl \
http://localhost:8002/api/organizations/:id/access?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get users

`GET` /api/organizations/:id/users

```shell
#shell command:
curl \
http://localhost:8002/api/organizations/:id/users?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post users/invite

`POST` /api/organizations/:id/users/:invitedUserId/invite

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/organizations/:id/users/:invitedUserId/invite?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx
:invitedUserId | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:invitedUserId | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post users/switch

`POST` /api/organizations/:id/users/:organizationUser/switch

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/organizations/:id/users/:organizationUser/switch?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx
:organizationUser | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:organizationUser | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put users

`PUT` /api/organizations/:id/users/:userId

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/organizations/:id/users/:userId?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx
:userId | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:userId | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# outboundReferrals

## Get outboundReferrals

`GET` /api/outboundReferrals/

```shell
#shell command:
curl \
http://localhost:8002/api/outboundReferrals/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Post outboundReferral

`POST` /api/outboundReferrals/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/outboundReferrals/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Get by id

`GET` /api/outboundReferrals/:id

```shell
#shell command:
curl \
http://localhost:8002/api/outboundReferrals/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Put by id

`PUT` /api/outboundReferrals/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/outboundReferrals/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Delete by id

`DELETE` /api/outboundReferrals/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/outboundReferrals/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

# patientForms

## Get patientForms

`GET` /api/patientForms/

```shell
#shell command:
curl \
http://localhost:8002/api/patientForms/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/patientForms/:id

```shell
#shell command:
curl \
http://localhost:8002/api/patientForms/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get medicationsearch

`GET` /api/patientForms/medicationsearch

```shell
#shell command:
curl \
http://localhost:8002/api/patientForms/medicationsearch?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Get pharmacysearch

`GET` /api/patientForms/pharmacysearch

```shell
#shell command:
curl \
http://localhost:8002/api/patientForms/pharmacysearch?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Get pdf

`GET` /api/patientForms/:id/pdf

```shell
#shell command:
curl \
http://localhost:8002/api/patientForms/:id/pdf?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post *

`POST` /api/patientForms/*

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientForms/*?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post callback/completed

`POST` /api/patientForms/callback/completed

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientForms/callback/completed?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post callback/created

`POST` /api/patientForms/callback/created

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientForms/callback/created?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post patientForm

`POST` /api/patientForms/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientForms/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/patientForms/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/patientForms/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/patientForms/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/patientForms/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Post eSignature/upload

`POST` /api/patientForms/eSignature/upload

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientForms/eSignature/upload?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

# patientFormTemplates

## Get patientFormTemplates

`GET` /api/patientFormTemplates/

```shell
#shell command:
curl \
http://localhost:8002/api/patientFormTemplates/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post patientFormTemplate

`POST` /api/patientFormTemplates/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientFormTemplates/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/patientFormTemplates/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/patientFormTemplates/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/patientFormTemplates/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/patientFormTemplates/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/patientFormTemplates/:id

```shell
#shell command:
curl \
http://localhost:8002/api/patientFormTemplates/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post callback/updated

`POST` /api/patientFormTemplates/callback/updated

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientFormTemplates/callback/updated?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# patientMessageTemplates

## Post patientMessageTemplate

`POST` /api/patientMessageTemplates/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientMessageTemplates/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get patientMessageTemplates

`GET` /api/patientMessageTemplates/

```shell
#shell command:
curl \
http://localhost:8002/api/patientMessageTemplates/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/patientMessageTemplates/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/patientMessageTemplates/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/patientMessageTemplates/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/patientMessageTemplates/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/patientMessageTemplates/:id

```shell
#shell command:
curl \
http://localhost:8002/api/patientMessageTemplates/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# patients

## Post patient

`POST` /api/patients/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get patients

`GET` /api/patients/

```shell
#shell command:
curl \
http://localhost:8002/api/patients/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/patients/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/patients/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/patients/:id

```shell
#shell command:
curl \
http://localhost:8002/api/patients/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/patients/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/patients/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get doNotContact

`GET` /api/patients/:id/doNotContact

```shell
#shell command:
curl \
http://localhost:8002/api/patients/:id/doNotContact?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post follow

`POST` /api/patients/:id/follow

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/:id/follow?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get journey

`GET` /api/patients/:id/journey

```shell
#shell command:
curl \
http://localhost:8002/api/patients/:id/journey?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get provider

`GET` /api/patients/:id/provider

```shell
#shell command:
curl \
http://localhost:8002/api/patients/:id/provider?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post reload

`POST` /api/patients/:id/reload

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/:id/reload?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post unfollow

`POST` /api/patients/:id/unfollow

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/:id/unfollow?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post verify

`POST` /api/patients/:id/verify

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/:id/verify?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get crudList

`GET` /api/patients/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/patients/crudList?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post login

`POST` /api/patients/login

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/login?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post merge

`POST` /api/patients/merge

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/merge?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post recent

`POST` /api/patients/recent

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/recent?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get recent

`GET` /api/patients/recent

```shell
#shell command:
curl \
http://localhost:8002/api/patients/recent?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports

`GET` /api/patients/reports

```shell
#shell command:
curl \
http://localhost:8002/api/patients/reports?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/do-not-contact/xls

`GET` /api/patients/reports/do-not-contact/xls

```shell
#shell command:
curl \
http://localhost:8002/api/patients/reports/do-not-contact/xls?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get search

`GET` /api/patients/search

```shell
#shell command:
curl \
http://localhost:8002/api/patients/search?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post upload

`POST` /api/patients/upload/:integrator

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patients/upload/:integrator?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:integrator | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:integrator | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# patientSubscribers

## Get patientSubscribers

`GET` /api/patientSubscribers/

```shell
#shell command:
curl \
http://localhost:8002/api/patientSubscribers/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post follow

`POST` /api/patientSubscribers/:id/follow

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientSubscribers/:id/follow?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post unfollow

`POST` /api/patientSubscribers/:id/unfollow

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/patientSubscribers/:id/unfollow?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# phoneNumbers

## Get by phone

`GET` /api/phoneNumbers/:phone

```shell
#shell command:
curl \
http://localhost:8002/api/phoneNumbers/:phone?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:phone | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# procedures

## Get procedures

`GET` /api/procedures/

```shell
#shell command:
curl \
http://localhost:8002/api/procedures/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# providers

## Post provider

`POST` /api/providers/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/providers/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get providers

`GET` /api/providers/

```shell
#shell command:
curl \
http://localhost:8002/api/providers/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/providers/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/providers/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/providers/:id

```shell
#shell command:
curl \
http://localhost:8002/api/providers/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/providers/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/providers/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put activate

`PUT` /api/providers/:id/activate

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/providers/:id/activate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Put deactivate

`PUT` /api/providers/:id/deactivate

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/providers/:id/deactivate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Get availabilities

`GET` /api/providers/:id/availabilities

```shell
#shell command:
curl \
http://localhost:8002/api/providers/:id/availabilities?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get waitlists

`GET` /api/providers/:id/waitlists

```shell
#shell command:
curl \
http://localhost:8002/api/providers/:id/waitlists?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get crudList

`GET` /api/providers/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/providers/crudList?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get hidden

`GET` /api/providers/hidden

```shell
#shell command:
curl \
http://localhost:8002/api/providers/hidden?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post login

`POST` /api/providers/login

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/providers/login?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get npi/search

`GET` /api/providers/npi/search

```shell
#shell command:
curl \
http://localhost:8002/api/providers/npi/search?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get referring

`GET` /api/providers/referring

```shell
#shell command:
curl \
http://localhost:8002/api/providers/referring?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put referring/activate

`PUT` /api/providers/referring/:id/activate

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/providers/referring/:id/activate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put referring/deactivate

`PUT` /api/providers/referring/:id/deactivate

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/providers/referring/:id/deactivate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get referring/referrals

`GET` /api/providers/referring/:id/referrals

```shell
#shell command:
curl \
http://localhost:8002/api/providers/referring/:id/referrals?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post referring/share

`POST` /api/providers/referring/:id/share

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/providers/referring/:id/share?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get rendering

`GET` /api/providers/rendering

```shell
#shell command:
curl \
http://localhost:8002/api/providers/rendering?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Get search

`GET` /api/providers/search

```shell
#shell command:
curl \
http://localhost:8002/api/providers/search?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# recalls

## Get recalls

`GET` /api/recalls/

```shell
#shell command:
curl \
http://localhost:8002/api/recalls/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post recall

`POST` /api/recalls/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/recalls/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Get by id

`GET` /api/recalls/:id

```shell
#shell command:
curl \
http://localhost:8002/api/recalls/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Response body param | Description
-------------- | -----------
xxx | yyy

## Put by id

`PUT` /api/recalls/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/recalls/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Delete by id

`DELETE` /api/recalls/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/recalls/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Path parameters | Description
-------------- | -----------
:id | xxx

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
:id | xxx

Response body param | Description
-------------- | -----------
xxx | yyy

# referrals

## Get referrals

`GET` /api/referrals/

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
[
{
        "_id": "60a59ea7f1aff8001a4663ac",
        "deleted": 0,
        "schedulableFacilities": [],
        "schedulableProviders": [],
        "source": "manual",
        "status": "active",
        "fileUploads": [],
        "attempt": 1,
        "diagnoses": [],
        "processedReferralFollowup": "pending",
        "patient": {
            "_id": "60a59e95f1aff8001a4660b7",
            "user": "60a59e9493a0d10012a1ba32",
            "type": "patient",
            "name": "Hassan DemoKunde",
            "firstname": "Hassan",
            "lastname": "DemoKunde",
            "contact": [
                {
                    "type": "email",
                    "value": "Jacinthe93.hotmail.com@example.com",
                    "active": true,
                    "archived": false,
                    "archivedReason": "none",
                    "_id": "60a59e95f1aff8001a4660b8"
                }
            ],
            "dateOfBirth": {
                "year": 1997,
                "month": 8,
                "day": 27
            }
        },
        "expireAt": "2021-05-29T23:26:31.629Z",
        "referringProvider": "Zachary DemoKoss",
        "referringProviderId": "60a59ea7f1aff8001a4663a0",
        "facility": "60a59e95f1aff8001a4660e0",
        "user": "60a59e9493a0d10012a1ba32",
        "createdBy": "60a59e9493a0d10012a1ba32",
        "updatedBy": "60a59e9493a0d10012a1ba32",
        "startOn": "2021-05-19T23:26:31.631Z",
        "createdAt": "2021-05-19T23:26:31.632Z",
        "updatedAt": "2021-05-19T23:26:40.041Z",
        "schedulableProvidersScope": [],
        "scheduleStartOn": "2021-05-19T23:26:31.632Z",
        "__v": 0,
        "lastAttemptSentAt": "2021-05-19T23:26:40.035Z",
        "reminders": [
                "_id": "60a59ea8f2660b001a7affe3",
                "deleted": 0,
                "type": "referral",
                "contact": [],
                "replied": 0,
                "partialStatus": [],
                "user": "60a59e9493a0d10012a1ba32",
                "patient": "60a59e95f1aff8001a4660b7",
                "facility": "60a59e95f1aff8001a4660e0",
                "status": "sent",
                "referral": "60a59ea7f1aff8001a4663ac",
                "sendAt": "2021-05-19T23:26:31.631Z",
                "createdBy": "60a59e9493a0d10012a1ba32",
                "updatedBy": "60a59e9493a0d10012a1ba32",
                "createdAt": "2021-05-19T23:26:32.713Z",
                "updatedAt": "2021-05-19T23:26:40.024Z",
                "__v": 0,
                "sentAt": "2021-05-19T23:26:40.011Z",
                "statusReason": ""        
        ]
    }
]
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request query Params | Example
-------------- | ----------- 
Any property of an [Referral](#referral) | ex.: ?referringProviderId=60a59ea7f1aff8001a4663a0

## Post referral

`POST` /api/referrals/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/referrals/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
    "source" : "manual",
    "status" : "active",
    "attempt" : 0,
    "diagnoses" : [],
    "processedReferralFollowup" : "pending",
    "patient" : "604afed1efb03f0013db2079",
    "expireAt" : "2021-03-22T04:41:11.613Z",
    "provider" : "604afef6efb03f0013db2343",
    "referringProviderId" : "604afef6efb03f0013db2343",
    "facility" :"604afed1efb03f0013db209b",
    "startOn" : "2021-05-19 23:18:40.829Z",
    "schedulableProviders": [],
    "scheduleStartOn": "2021-05-19T23:19:32.033Z",
    "externalId": {
        "source" : "genericfhir",
        "value" : "123456"
  }
}'
```


Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body: JSON of an [Referral](#referral).

Response body: JSON of the [Referral](#referral) which as created..

## Get by id

`GET` /api/referrals/:id

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
{
        "_id": "60a59ea7f1aff8001a4663ac",
        "deleted": 0,
        "schedulableFacilities": [],
        "schedulableProviders": [],
        "source": "manual",
        "status": "active",
        "fileUploads": [],
        "attempt": 1,
        "diagnoses": [],
        "processedReferralFollowup": "pending",
        "patient": {
            "_id": "60a59e95f1aff8001a4660b7",
            "user": "60a59e9493a0d10012a1ba32",
            "type": "patient",
            "name": "Hassan DemoKunde",
            "firstname": "Hassan",
            "lastname": "DemoKunde",
            "contact": [
                {
                    "type": "email",
                    "value": "Jacinthe93.hotmail.com@example.com",
                    "active": true,
                    "archived": false,
                    "archivedReason": "none",
                    "_id": "60a59e95f1aff8001a4660b8"
                }
            ],
            "dateOfBirth": {
                "year": 1997,
                "month": 8,
                "day": 27
            }
        },
        "expireAt": "2021-05-29T23:26:31.629Z",
        "referringProvider": "Zachary DemoKoss",
        "referringProviderId": "60a59ea7f1aff8001a4663a0",
        "facility": "60a59e95f1aff8001a4660e0",
        "user": "60a59e9493a0d10012a1ba32",
        "createdBy": "60a59e9493a0d10012a1ba32",
        "updatedBy": "60a59e9493a0d10012a1ba32",
        "startOn": "2021-05-19T23:26:31.631Z",
        "createdAt": "2021-05-19T23:26:31.632Z",
        "updatedAt": "2021-05-19T23:26:40.041Z",
        "schedulableProvidersScope": [],
        "scheduleStartOn": "2021-05-19T23:26:31.632Z",
        "__v": 0,
        "lastAttemptSentAt": "2021-05-19T23:26:40.035Z",
        "reminders": [
                "_id": "60a59ea8f2660b001a7affe3",
                "deleted": 0,
                "type": "referral",
                "contact": [],
                "replied": 0,
                "partialStatus": [],
                "user": "60a59e9493a0d10012a1ba32",
                "patient": "60a59e95f1aff8001a4660b7",
                "facility": "60a59e95f1aff8001a4660e0",
                "status": "sent",
                "referral": "60a59ea7f1aff8001a4663ac",
                "sendAt": "2021-05-19T23:26:31.631Z",
                "createdBy": "60a59e9493a0d10012a1ba32",
                "updatedBy": "60a59e9493a0d10012a1ba32",
                "createdAt": "2021-05-19T23:26:32.713Z",
                "updatedAt": "2021-05-19T23:26:40.024Z",
                "__v": 0,
                "sentAt": "2021-05-19T23:26:40.011Z",
                "statusReason": ""  
        ]
}  
```

Authorization: No Auth / x-access-token

Request query Params | Example
-------------- | ----------- 
Any property of an [Referral](#referral) | ex.: ?referringProviderId=60a59ea7f1aff8001a4663a0

## Delete by id

`DELETE` /api/referrals/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/referrals/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/referrals/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/referrals/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
        "status": "active"
    }'
```

Authorization: No Auth / x-access-token

Request body: JSON containing any subset of the attributes of an [Referral](#referral).

## Post approve

`POST` /api/referrals/:id/approve

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/referrals/:id/approve?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post reject

`POST` /api/referrals/:id/reject

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/referrals/:id/reject?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put batch

`PUT` /api/referrals/batch

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/referrals/batch?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete batch

`DELETE` /api/referrals/batch

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/referrals/batch?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get count

`GET` /api/referrals/count

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/count?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get crudList

`GET` /api/referrals/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/crudList?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/find

`GET` /api/referrals/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/reports/find?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/summary

`GET` /api/referrals/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/reports/summary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/xls

`GET` /api/referrals/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/reports/xls?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get search

`GET` /api/referrals/search

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/search?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# reminders

## Get reminders

`GET` /api/reminders/

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post reminder

`POST` /api/reminders/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/reminders/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/reminders/:id

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/reminders/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/reminders/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/reminders/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/reminders/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get crudList

`GET` /api/reminders/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/crudList?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get findByApptId

`GET` /api/reminders/findByApptId/:id

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/findByApptId/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get findByPatientId

`GET` /api/reminders/findByPatientId/:id

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/findByPatientId/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/find

`GET` /api/reminders/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/reports/find?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/summary

`GET` /api/reminders/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/reports/summary?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reports/xls

`GET` /api/reminders/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/reports/xls?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# reports

## Get periscope

`GET` /api/reports/periscope/:dashboard

```shell
#shell command:
curl \
http://localhost:8002/api/reports/periscope/:dashboard?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:dashboard | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get periscope/dashboards

`GET` /api/reports/periscope/dashboards

```shell
#shell command:
curl \
http://localhost:8002/api/reports/periscope/dashboards?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# scheduler

## Get availabilities

`GET` /api/scheduler/availabilities

```shell
#shell command:
curl \
http://localhost:8002/api/scheduler/availabilities?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get availabilities/count

`GET` /api/scheduler/availabilities/count

```shell
#shell command:
curl \
http://localhost:8002/api/scheduler/availabilities/count?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# settings

## Get settings

`GET` /api/settings/

```shell
#shell command:
curl \
http://localhost:8002/api/settings/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post setting

`POST` /api/settings/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/settings/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/settings/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/settings/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/settings/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/settings/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/settings/:id

```shell
#shell command:
curl \
http://localhost:8002/api/settings/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put subscribe

`PUT` /api/settings/:id/subscribe/:messageKey

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/settings/:id/subscribe/:messageKey?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx
:messageKey | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:messageKey | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put unsubscribe

`PUT` /api/settings/:id/unsubscribe

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/settings/:id/unsubscribe?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put unsubscribe

`PUT` /api/settings/:id/unsubscribe/:messageKey

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/settings/:id/unsubscribe/:messageKey?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx
:messageKey | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx
:messageKey | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# status

## Get status

`GET` /api/status/

```shell
#shell command:
curl \
http://localhost:8002/api/status/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get services

`GET` /api/status/services/:serviceName

```shell
#shell command:
curl \
http://localhost:8002/api/status/services/:serviceName?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:serviceName | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# tokens

## Get validate

`GET` /api/tokens/validate

```shell
#shell command:
curl \
http://localhost:8002/api/tokens/validate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post validate

`POST` /api/tokens/validate

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/tokens/validate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post zendesk

`POST` /api/tokens/zendesk

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/tokens/zendesk?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# uploads

## Post upload

`POST` /api/uploads/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/uploads/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get uploads

`GET` /api/uploads/

```shell
#shell command:
curl \
http://localhost:8002/api/uploads/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/uploads/:id

```shell
#shell command:
curl \
http://localhost:8002/api/uploads/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put mapping

`PUT` /api/uploads/:id/mapping

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/uploads/:id/mapping?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# users

## Post user

`POST` /api/users/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get users

`GET` /api/users/

```shell
#shell command:
curl \
http://localhost:8002/api/users/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/users/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/users/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/users/:id

```shell
#shell command:
curl \
http://localhost:8002/api/users/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put activate

`PUT` /api/users/:id/activate

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/users/:id/activate?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get groupInvites

`GET` /api/users/:id/groupInvites

```shell
#shell command:
curl \
http://localhost:8002/api/users/:id/groupInvites?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get resetPasswordLink

`GET` /api/users/:id/resetPasswordLink

```shell
#shell command:
curl \
http://localhost:8002/api/users/:id/resetPasswordLink?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put upload

`PUT` /api/users/:id/upload

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/users/:id/upload?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post admin

`POST` /api/users/admin

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/admin?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post admin by id

`POST` /api/users/admin/:id

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/admin/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post admin/masters

`POST` /api/users/admin/masters

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/admin/masters?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Post admin/subaccounts

`POST` /api/users/admin/subaccounts

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/admin/subaccounts?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
-d '{
"field1": "test",
"field2": {
"foo": "bar"
}
}'
```

> The above command returns JSON structured like this:

```json-doc
{
"x": "y",
"y", true,
"z": 1
}
```

Authorization: No Auth / x-access-token

Request headers | Description
-------------- | -----------
x-access-token | JWT auth access token

Request body param | Description
-------------- | -----------
| xxx

Response body param | Description
-------------- | -----------
xxx | yyy

## Post decommission

`POST` /api/users/decommission/:id

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/decommission/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post forgot-password

`POST` /api/users/forgot-password

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/forgot-password?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post login

`POST` /api/users/login

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/login \
-H 'Content-Type: application/json' \
 -d '{
    "email": "example@lumahealth.io",
    "password": "123456"
	}'
```

> The command above returns JSON of a [User type](#user), containing the access token: 

```json-doc
	{
    ...,
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1YzkyYjU1Zjg3MTAwNjQ5YWMxOTE0MGQiLCJleHAiOjE1NTk2ODM5ODczNDQsInR5cGUiOiJzdGFmZiJ9.JtVgCfAbQ_McBRi2XD2CeR31IaDZCZw4EDsnKFfh05I",
    ...
}
```

> Export the token returned: 

```shell
export TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1YzkyYjU1Zjg3MTAwNjQ5YWMxOTE0MGQiLCJleHAiOjE1NTk2ODM5ODczNDQsInR5cGUiOiJzdGFmZiJ9.JtVgCfAbQ_McBRi2XD2CeR31IaDZCZw4EDsnKFfh05I
```

<aside class="notice">
After you run the curl command, make sure to export the returned token, as exemplified by the last command in this section. It will be used by most curl commands listed in these docs.
</aside>

Authorization: No Auth (public endpoint)

Request body param | Description 
-------------- | ----------- 
email | User email associated with his account
password | User password

Response param | Description 
-------------- | ----------- 
token | Access token to be sent by authenticated users on requests to the API as the request header `x-access-token`.

## Post reset-password

`POST` /api/users/reset-password/:token

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/reset-password/:token?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:token | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:token | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get reset-password

`GET` /api/users/reset-password/:token

```shell
#shell command:
curl \
http://localhost:8002/api/users/reset-password/:token?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:token | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post signup

`POST` /api/users/signup

Creates a new master account at the root of the hiearchy. This will automatically also create a matching settings object for the user with default values.
If type is `staff` the system will also create a matching widget user, a default group, default settings, enable scheduler settings (users', facilities' and providers' settings). Also, provisioning will be imported from sales force, and a single provisioned sales force account will be created. Message templates will be created for the account, too.

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/signup \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"salesforceId": "123456789012345678",
		"sendWelcomeEmail": false, 
		"email": "test@example.com",
		"password": "xyz",
		"type": "patient",
		"updatedBy": "5e18ef045144c34cdf214b2f",
		"createdBy": "5e18ef045144c34cdf214b2f"
	}'
```

Authorization: public.

Request body param | Description 
-------------- | ----------- 
salesforceId | (required) An SFDC Id18 with a length of 18 characters
sendWelcomeEmail | (optional) Send welcome email right away (currently not working: must be false)
email | (required) The email address of the new master account
password | (required) Initial password of the user being created (patients will have it reset to a default password)
type | (required) Must be either `patient`, `doctor` or `staff`
updatedBy | ObjectID of the [User](#user) creating the new [User](#user)
createdBy | ObjectID of the [User](#user) creating the new [User](#user)

Response body param
-------------- 
The contents of a [User](#user), initially without the settings.

> The command above returns a JSON structured like this: 

```json-doc
	{
		"stats": {
			"counters": {
				"messagesSentToPatient": 0,
				"confirmedAppointments": 0,
				"cancelledAppointments": 0,
				"offersSent": 0,
				"offersAccepted": 0,
				"appointmentOffersReplied": 0
			},
			"average": {
				"appointmentOfferReplyTime": 0
			},
			"metadata": {
				"lastAppointmentAt": null
			},
			"oldestAppointment": "2020-01-14T21:37:07.948Z"
		},
		"salesforceData": {
			"provisioning": [],
			"respectProvisioning": false,
			"lifeline": "trial"
		},
		"twoFactorAuthSecret": {
			"backupCodes": []
		},
		"lastProcessedAt": "2020-01-14T21:37:07.945Z",
		"_id": "5e1e348bdb6bd71a2dec31f5",
		"passwordHashAlgorithm": "bcrypt",
		"roles": [],
		"doNotContact": false,
		"groups": [],
		"deleted": 0,
		"active": 0,
		"master": true,
		"language": "en",
		"country": "US",
		"gender": "unknown",
		"allowedIps": [],
		"ldapUser": false,
		"__t": "Patient",
		"salesforceId": "123456789012345678",
		"email": "test@example.com",
		"type": "patient",
		"createdAt": "2020-01-14T18:47:00.000Z",
		"updatedBy": "5e18ef045144c34cdf214b2f",
		"createdBy": "5e18ef045144c34cdf214b2f",
		"subscribers": [],
		"outboundContact": [],
		"passwordUpdatedAt": "2020-01-14T21:37:15.468Z",
		"contact": [],
		"updatedAt": "2020-01-14T18:47:00.000Z",
		"lastLogin": "2020-01-14T21:37:15.468Z",
		"user": "5e1e348bdb6bd71a2dec31f5",
		"token": "eyH0eZAiOiKLW1QiLDKhbHciOiJIVzJ1NiK9.eyJpc3NiPiI1ZTGlNzQ4YmRiNmJkNzFhMmRlYzMxZjUiLDJleHAiOjE1NzkyMTA2MzU3MjEsInR5cGUiOiJwYXRpZW50In0.x9sFZa1EPo0gHAJzgkalL3-CVnU94sVl5oUipe9tJjZ",
		"safeId": "1e0f8127ce6ae969d667bcc0d6523316f8f32f76d6af4a89078da2e358449c7d",
		"__v": 0
	}
```

## Put transfer

`PUT` /api/users/transfer

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/users/transfer?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put unsubscribe

`PUT` /api/users/unsubscribe

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/users/unsubscribe?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# waitlists

## Get waitlists

`GET` /api/waitlists/

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post waitlist

`POST` /api/waitlists/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/waitlists/?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get by id

`GET` /api/waitlists/:id

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Put by id

`PUT` /api/waitlists/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/waitlists/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Delete by id

`DELETE` /api/waitlists/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/waitlists/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:id | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post bulk/action

`POST` /api/waitlists/bulk/action

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/waitlists/bulk/action?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get cancelOffer

`GET` /api/waitlists/cancelOffer/:id

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/cancelOffer/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post candidates

`POST` /api/waitlists/candidates

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/waitlists/candidates?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get confirmOffer

`GET` /api/waitlists/confirmOffer/:id

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/confirmOffer/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get count

`GET` /api/waitlists/count

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/count?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get crudList

`GET` /api/waitlists/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/crudList?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get declineOffer

`GET` /api/waitlists/declineOffer/:id

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/declineOffer/:id?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:id | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get filter

`GET` /api/waitlists/filter

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/filter?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post find/count

`POST` /api/waitlists/find/count

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/waitlists/find/count?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post move/update-position

`POST` /api/waitlists/move/update-position/:providerId/:id/:replacedId

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/waitlists/move/update-position/:providerId/:id/:replacedId?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Path parameters | Description 
-------------- | ----------- 
:providerId | xxx
:id | xxx
:replacedId | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:providerId | xxx
:id | xxx
:replacedId | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get search

`GET` /api/waitlists/search

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/search?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# widgets

## Post login

`POST` /api/widgets/login

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/widgets/login?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN" \
 -d '{
		"field1": "test",
		"field2": {
			"foo": "bar"
		}
	}'
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
 | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get user

`GET` /api/widgets/user

```shell
#shell command:
curl \
http://localhost:8002/api/widgets/user?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# healthcheck

## Get healthcheck

`GET` /healthcheck

```shell
#shell command:
curl \
http://localhost:8002/healthcheck?q=xyz \
-H 'Content-Type: application/json' \
-H 'x-access-token: '"$TOKEN"
```

> The command above returns a JSON structured like this: 

```json-doc
	{
		"x": "y",
		"y", true,
		"z": 1
	}
```

Authorization: No Auth / x-access-token

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

# Types

## AppointmentType

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
name|String, required
description|String, optional
duration|Number, optional
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
visible|Boolean, required
createdAt|Date, optional
updatedAt|Date, optional
deleted|Number, required
setting|ObjectID, optional, ref: [Setting](#setting)
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Appointment

> Example

```
{
    "_id": "5d001ad3f0587535a8582486",
    "patient": "5d001ac6f0587535a85823f4",
    "date": "2019-06-18T15:45:00.000Z",
    "duration": 15,
    "source": "manual",
    "status": "unconfirmed",
    "provider": "5d001ac8f0587535a8582442",
    "type": "5d001ac6f0587535a85823ce",
    "facility": "5d001ac8f0587535a8582439",
    "user": "5d001ac40bb38f3585626b69",
    "createdBy": "5d001ac40bb38f3585626b69",
    "updatedBy": "5d001ac40bb38f3585626b69",
    "endDate": "2019-06-18T16:00:00.000Z",
    "integratorUpdateResults": {
        "status": "pending"
    },
    "deleted": 0,
    "updatedAt": "2019-06-11T21:19:15.308Z",
    "createdAt": "2019-06-11T21:19:15.308Z",
    "stats": {
        "counters": {
            "remindersSent": 0
        }
    },
    "statusReason": null,
    "externalId": {
        "source": "lumamock",
        "value": "1560287955308"
    },
    "__v": 0
}
```

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
provider|ObjectID, optional, ref: [User](#user)
facility|ObjectID, optional, ref: [Facility](#facility)
type|ObjectID, optional, ref: [AppointmentType](#appointmenttype)
patient|ObjectID, required, ref: [User](#user)
source|String, required, Possible values: ["sync", "manual"]
statusSource|String, optional, Possible values: ["integrator", "reminder", "ui", "waitlist"]
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
secondaryExternalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
secondaryExternalId.value|String, optional
status|String, required, Possible values: ["unconfirmed", "confirmed", "cancelled"]
statusReason|String, optional, Possible values: [null,"noshow", "arrived", "by-offer"]
notes|String, optional
date|Date, required
endDate|Date, optional
duration|Number, optional
stats.counters.remindersSent|Number, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
integratorUpdateResults.status|String, optional, Possible values: ["success", "failure", "pending"]
integratorUpdateResults.error|String, optional
external.createdAt|Date, optional
external.updatedAt|Date, optional
cancelledAt|Date, optional
confirmedAt|Date, optional
createdFromReferral|ObjectID, optional, ref: [Referral](#referral)
_id|ObjectID, optional
__v|Number, optional

## Appointment

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
provider|ObjectID, optional, ref: [User](#user)
facility|ObjectID, optional, ref: [Facility](#facility)
type|ObjectID, optional, ref: [AppointmentType](#appointmenttype)
patient|ObjectID, required, ref: [User](#user)
source|String, required, Possible values: ["sync", "manual"]
statusSource|String, optional, Possible values: ["integrator", "reminder", "ui", "waitlist"]
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
secondaryExternalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
secondaryExternalId.value|String, optional
status|String, required, Possible values: ["unconfirmed", "confirmed", "cancelled"]
statusReason|String, optional, Possible values: [null,"noshow", "arrived", "by-offer"]
notes|String, optional
date|Date, required
endDate|Date, optional
duration|Number, optional
stats.counters.remindersSent|Number, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
integratorUpdateResults.status|String, optional, Possible values: ["success", "failure", "pending"]
integratorUpdateResults.error|String, optional
external.createdAt|Date, optional
external.updatedAt|Date, optional
cancelledAt|Date, optional
confirmedAt|Date, optional
createdFromReferral|ObjectID, optional, ref: [Referral](#referral)
_id|ObjectID, optional
__v|Number, optional

## Availability

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
date|Date, required
endDate|Date, optional
duration|Number, required
status|String, required, Possible values: ["available", "booked-pending", "offered", "booked", "booked-by-integrator", "booked-by-offer", "expired"]
source|String, required, Possible values: ["appointment-cancellation", "ui", "referral", "integrator"]
createdFromAppointment|ObjectID, optional, ref: [Appointment](#appointment)
usedForAppointment|ObjectID, optional, ref: [Appointment](#appointment)
filters.appointmentTypes|Array, optional
filters.facilities|Array, optional
filters.providers|Array, optional
appointmentType|ObjectID, optional, ref: [AppointmentType](#appointmenttype)
facility|ObjectID, optional, ref: [Facility](#facility)
provider|ObjectID, optional, ref: [Provider](#provider)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
_id|ObjectID, optional
__v|Number, optional

## Broadcast

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
message|String, required
patients|Array, optional
filterResults|undefined, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
approvedBy|ObjectID, optional, ref: [User](#user)
declinedBy|ObjectID, optional, ref: [User](#user)
sentAt|Date, optional
sendAt|Date, optional
status|String, optional, Possible values: ["pending", "scheduled", "accepted", "declined", "expired", "failed", "skipped"]
declinedReason|String, optional
deleted|Number, required
upload|ObjectID, optional, ref: [Upload](#upload)
title|String, optional
filters|Mixed, optional
createdFromBroadcast|ObjectID, optional, ref: [Broadcast](#broadcast)
patientMessageTemplate|ObjectID, optional, ref: [PatientMessageTemplate](#patientmessagetemplate)
_id|ObjectID, optional
__v|Number, optional

## Broadcast

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
message|String, required
patients|Array, optional
filterResults|undefined, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
approvedBy|ObjectID, optional, ref: [User](#user)
declinedBy|ObjectID, optional, ref: [User](#user)
sentAt|Date, optional
sendAt|Date, optional
status|String, optional, Possible values: ["pending", "scheduled", "accepted", "declined", "expired", "failed", "skipped"]
declinedReason|String, optional
deleted|Number, required
upload|ObjectID, optional, ref: [Upload](#upload)
title|String, optional
filters|Mixed, optional
createdFromBroadcast|ObjectID, optional, ref: [Broadcast](#broadcast)
patientMessageTemplate|ObjectID, optional, ref: [PatientMessageTemplate](#patientmessagetemplate)
_id|ObjectID, optional
__v|Number, optional

## ChatActivity

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
to|ObjectID, optional, ref: [User](#user)
patient|ObjectID, required, ref: [Patient](#patient)
lastMessage|ObjectID, required, ref: [Message](#message)
unreadMessages|Number, required
status|String, optional, Possible values: ["pending", "closed", "assigned"]
assignee|ObjectID, optional, ref: [User](#user)
previousAssignee|ObjectID, optional, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## CustomWebStyle

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
description|Type: String, Required: no
url|Type: String, Required: no
styles.theme|Type: Mixed, Required: no
published|Type: Boolean, Required: no
publishedAt|Type: Date, Required: no
publishedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
createdAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Diagnosis

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
patient|ObjectID, required, ref: [Patient](#patient)
icd10|String, optional
icd9|String, optional
description|String, optional
date|Date, optional
endDate|Date, optional
appointment|Mixed, optional, ref: [Appointment](#appointment)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
_id|ObjectID, optional
__v|Number, optional

## Diagnosis

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
patient|ObjectID, required, ref: [Patient](#patient)
icd10|String, optional
icd9|String, optional
description|String, optional
date|Date, optional
endDate|Date, optional
appointment|Mixed, optional, ref: [Appointment](#appointment)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
_id|ObjectID, optional
__v|Number, optional

## Facility

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
name|String, required
alternativeName|String, optional
phonetic|String, optional
address|String, required
city|String, required
state|String, required
country|String, required
postcode|String, required
phone|String, optional
alternativePhone|String, optional
visible|Boolean, required
integrator|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
externalId.value|String, optional
setting|ObjectID, optional, ref: [Setting](#setting)
createdAt|Date, optional
updatedAt|Date, optional
deleted|Number, required
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## FeedbackResponse

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
patient|ObjectID, required, ref: [Patient](#patient)
provider|ObjectID, optional, ref: [Provider](#provider)
facility|ObjectID, optional, ref: [Facility](#facility)
appointment|ObjectID, optional, ref: [Appointment](#appointment)
response.type|String, required, Possible values: ["npsscore", "positive-click", "negative-click"]
response.value|Mixed, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
_id|ObjectID, optional
__v|Number, optional

## FeedbackResponse

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
patient|ObjectID, required, ref: [Patient](#patient)
provider|ObjectID, optional, ref: [Provider](#provider)
facility|ObjectID, optional, ref: [Facility](#facility)
appointment|ObjectID, optional, ref: [Appointment](#appointment)
response.type|String, required, Possible values: ["npsscore", "positive-click", "negative-click"]
response.value|Mixed, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
_id|ObjectID, optional
__v|Number, optional

## FileMapping

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
integrator|String, required, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
type|String, required, Possible values: ["appointment", "patient", "referral"]
mapping|Mixed, required
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
_id|ObjectID, optional
__v|Number, optional

## FileUpload

Attribute|Description
----|----
bucket|String, optional
awsId|String, optional
name|String, required
extension|String, required
contentType|String, required
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
_id|ObjectID, optional
__v|Number, optional

## Followup

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
title|String, optional
model|String, required, Possible values: ["recall", "appointment", "referral", "message", "offer", "waitlist", "feedbackResponse", "diagnosis", "procedure"]
operation|String, required, Possible values: ["created", "deleted", "updated"]
filters|undefined, optional
action|String, required, Possible values: ["send-message", "alert-staff", "start-bot", "https-webhook"]
actionAt|Number, required
actionAtAnchor|String, required, Possible values: ["operation", "object-date"]
webhook|String, optional
bot|String, optional, Possible values: ["bot:followup", "bot:referral", "bot:jenna"]
template|String, required
type|String, required
group|String, optional
secure|Boolean, required
forceCommunicationAs|String, optional, Possible values: ["none", "sms", "voice"]
delay|Number, optional
stats.counters.actionMatched|Number, optional
enabled|Boolean, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
_id|ObjectID, optional
__v|Number, optional

## GroupInvite

Attribute|Description
----|----
group|ObjectID, required, ref: [Group](#group)
invitedUser|ObjectID, optional, ref: [User](#user)
userId|ObjectID, optional, ref: [User](#user)
email|String, required
url|String, optional
roles|Array, optional
user|ObjectID, optional, ref: [User](#user)
status|String, required, Possible values: ["pending", "accepted", "declined", "expired"]
invitesSent|Number, optional
sentAt|Date, optional
token|String, required
expiresAt|Date, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, optional, ref: [User](#user)
deleted|Number, optional
updatedBy|ObjectID, optional, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Group

Attribute|Description
----|----
name|String, required
user|ObjectID, required, ref: [User](#user)
type|String, optional, Possible values: ["user", "system"]
users|Array, optional
facilities|Array, optional
createdAt|Date, optional
updatedAt|Date, optional
deleted|Number, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Group

Attribute|Description
----|----
name|String, required
user|ObjectID, required, ref: [User](#user)
type|String, optional, Possible values: ["user", "system"]
users|Array, optional
facilities|Array, optional
createdAt|Date, optional
updatedAt|Date, optional
deleted|Number, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Hl7messages

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
integratorRef|Type: ObjectID, Required: yes, Referencing: [Integrator](#integrator)
integrator|Type: String, Required: yes, Possible values: ["mi7","hl7"]
direction|Type: String, Required: yes, Possible values: ["inbound","outbound"]
content|Type: Mixed, Required: no
status|Type: String, Required: yes, Possible values: ["pending","processing","completed","failed"]
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## InboundMessageRequest

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
sender|String, optional
senderName|String, optional
patient|ObjectID, optional, ref: [User](#user)
recipient|ObjectID, required, ref: [User](#user)
recipientType|String, required, Possible values: ["staff", "patient", "doctor"]
channel|String, required, Possible values: ["sms", "email", "voice", "chat", "fax"]
contact|String, optional
template|String, required
context|Mixed, optional
callbackQueue|String, optional
status|String, optional, Possible values: ["sent", "received", "delivered", "undelivered"]
statusReason|String, optional
ref|String, required, Possible values: ["reminder", "appointment-offer", "waitlist", "waitlist-offer", "generic", "feedback-reminder", "feedback", "stop", "referral-reminder", "referral-followup", "broadcast", "chat", "chat-notification", "pin-verification", "followup", "bot:followup", "referral-redirect", "form-reminder"]
refId|ObjectID, optional
cbUrl|String, optional
secure|Boolean, optional
visibility|String, required, Possible values: ["public", "private", "internal"]
text|String, optional
_id|ObjectID, optional
__v|Number, optional

## Insurance

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
planName|String, optional
memberName|String, required
memberNumber|String, optional
insuranceGroupName|String, optional
url|String, optional
urlBack|String, optional
fileUpload|ObjectID, optional, ref: [FileUpload](#fileupload)
fileUploadBack|ObjectID, optional, ref: [FileUpload](#fileupload)
active|Boolean, required
status|String, optional, Possible values: ["archived", "active"]
patient|ObjectID, required, ref: [User](#user)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
payerId|String, optional
verification.status|String, optional, Possible values: ["unknown", "active", "inactive"]
verification.updatedAt|Date, optional
verification.requestedBy|ObjectID, optional, ref: [User](#user)
verification.lookupResults|Mixed, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
createdAt|Date, optional
updatedAt|Date, optional
_id|ObjectID, optional
__v|Number, optional

## IntegratorClient

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
name|String, required
version|String, optional
secret|String, required
enabled|Boolean, required
status|String, required, Possible values: ["connected", "disconnected", "needs-heartbeat"]
state|String, required, Possible values: ["uninstalled", "installed", "updating"]
lastHeartbeat|Date, optional
lastRecycleAttempt|Date, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
_id|ObjectID, optional
__v|Number, optional

## Integrator

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
type|Type: String, Required: no, Possible values:
["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","allmeds"]
credentials|Type: Mixed, Required: no
lastSync|Type: Date, Required: no
lastSyncStatus|Type: String, Required: no, Possible values: ["success","failure","needs-sync","in-progress"]
lastSuccessfulSync|Type: Date, Required: yes
enabled|Type: Boolean, Required: yes
deleted|Type: Number, Required: yes
integratorClient|Type: ObjectID, Required: no, Referencing: [IntegratorClient](#integratorclient)
setting|Type: ObjectID, Required: no, Referencing: [Setting](#setting)
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Intent

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
intent|Type: String, Required: yes, Possible values:
["waitlist","none","confirm-appointment","cancel-appointment","appointment-offer-accept","ignore","positive-feedback","negative-feedback","error","irregular","directions","address","reschedule"]
inboundMessage|Type: ObjectID, Required: yes, Referencing: [Message](#message)
ref|Type: String, Required: yes, Possible values:
["reminder","referral-reminder","feedback-reminder","followup","outbound-referral-reminder","form-reminder","waitlist","appointment-offer","chat-notification","pin-verification","chat","chat-audit","feedback","waitlist-offer","referral-followup","outbound-referral-outreach","referral-redirect","broadcast","generic","stop","bot:followup"]
refId|Type: ObjectID, Required: yes
key|Type: String, Required: yes
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
method|Type: String, Required: no
params|Type: Mixed, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Logins

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
_id|ObjectID, optional
__v|Number, optional

## MessageError

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
type|String, required, Possible values: ["reminder", "appointment-offer", "waitlist", "waitlist-offer", "generic", "feedback-reminder", "feedback", "stop", "referral-reminder", "referral-followup", "broadcast", "chat", "chat-notification", "pin-verification", "followup", "bot:followup", "referral-redirect", "form-reminder"]
message|ObjectID, optional, ref: [Message](#message)
error|String, required
appointment|ObjectID, optional, ref: [Appointment](#appointment)
patient|ObjectID, optional, ref: [User](#user)
waitlist|ObjectID, optional, ref: [Waitlist](#waitlist)
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, optional
channel|String, optional, Possible values: ["sms", "email", "voice", "inapp", "chat", "fax"]
_id|ObjectID, optional
__v|Number, optional

## MessageRequest

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
sender|String, optional
senderName|String, optional
patient|ObjectID, optional, ref: [User](#user)
recipient|ObjectID, required, ref: [User](#user)
recipientType|String, required, Possible values: ["staff", "patient", "doctor"]
channel|String, optional, Possible values: ["sms", "email", "voice", "inapp", "chat", "fax"]
contact|String, optional
template|String, required
context|Mixed, optional
callbackQueue|String, optional
status|String, optional, Possible values: ["sent", "received", "delivered", "undelivered"]
statusReason|String, optional
ref|String, required, Possible values: ["reminder", "appointment-offer", "waitlist", "waitlist-offer", "generic", "feedback-reminder", "feedback", "stop", "referral-reminder", "referral-followup", "broadcast", "chat", "chat-notification", "pin-verification", "followup", "bot:followup", "referral-redirect", "form-reminder"]
refId|ObjectID, optional
cbUrl|String, optional
secure|Boolean, optional
visibility|String, required, Possible values: ["public", "private", "internal"]
text|String, optional
_id|ObjectID, optional
__v|Number, optional

## MessageTemplate

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
key|String, required
language|String, required, Possible values: ["es", "en", "vi", "am", "fa", "ko", "ru", "zh-t", "zh-s", "zh", "pt", "ar"]
template|String, required
layout|String, optional
subject|String, optional
title|String, optional
type|Array, optional
answers|undefined, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, optional
_id|ObjectID, optional
__v|Number, optional

## Message

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
patient|ObjectID, optional, ref: [User](#user)
key|String, optional
from|String, optional
to|String, optional
type|String, required, Possible values: ["inbound", "outbound"]
ref|String, required, Possible values: ["reminder", "appointment-offer", "waitlist", "waitlist-offer", "generic", "feedback-reminder", "feedback", "stop", "referral-reminder", "referral-followup", "broadcast", "chat", "chat-notification", "pin-verification", "followup", "bot:followup", "referral-redirect", "form-reminder"]
refId|ObjectID, optional
status|String, optional, Possible values: ["sent", "delivered", "undelivered", "pending", "received"]
statusReason|String, optional
channel|String, required, Possible values: ["sms", "email", "voice", "inapp", "chat", "fax"]
text|String, required
classification|String, optional, Possible values: ["positive", "negative", "irregular", "recognized-keywords", "unclassified"]
externalId.source|String, optional, Possible values: ["mandrill", "twilio", "nexmo", "sendgrid", "plivo", "bandwidth"]
externalId.value|String, optional
secure|Boolean, required
visibility|String, required, Possible values: ["public", "private", "internal"]
file|ObjectID, optional, ref: [FileUpload](#fileupload)
media.url|String, optional
media.contentType|String, optional
stats.timers.elapsedReplyTime|Number, optional
retry.from|ObjectID, optional, ref: [Message](#message)
retry.count|Number, optional
retry.required|Mixed, optional
deleted|Number, optional
createdAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
mentions|undefined, optional
recipient|ObjectID, optional, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Message

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
patient|ObjectID, optional, ref: [User](#user)
key|String, optional
from|String, optional
to|String, optional
type|String, required, Possible values: ["inbound", "outbound"]
ref|String, required, Possible values: ["reminder", "appointment-offer", "waitlist", "waitlist-offer", "generic", "feedback-reminder", "feedback", "stop", "referral-reminder", "referral-followup", "broadcast", "chat", "chat-notification", "pin-verification", "followup", "bot:followup", "referral-redirect", "form-reminder"]
refId|ObjectID, optional
status|String, optional, Possible values: ["sent", "delivered", "undelivered", "pending", "received"]
statusReason|String, optional
channel|String, required, Possible values: ["sms", "email", "voice", "inapp", "chat", "fax"]
text|String, required
classification|String, optional, Possible values: ["positive", "negative", "irregular", "recognized-keywords", "unclassified"]
externalId.source|String, optional, Possible values: ["mandrill", "twilio", "nexmo", "sendgrid", "plivo", "bandwidth"]
externalId.value|String, optional
secure|Boolean, required
visibility|String, required, Possible values: ["public", "private", "internal"]
file|ObjectID, optional, ref: [FileUpload](#fileupload)
media.url|String, optional
media.contentType|String, optional
stats.timers.elapsedReplyTime|Number, optional
retry.from|ObjectID, optional, ref: [Message](#message)
retry.count|Number, optional
retry.required|Mixed, optional
deleted|Number, optional
createdAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
mentions|undefined, optional
recipient|ObjectID, optional, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## NlpTraining

Attribute|Description
----|----
key|Type: String, Required: yes
text|Type: String, Required: yes
userIntent|Type: String, Required: yes
evaluator|Type: String, Required: yes
evaluatorSlack|Type: String, Required: no
inboundMessage|Type: ObjectID, Required: no, Referencing: [Message](#message)
createdAt|Type: Date, Required: yes
updatedAt|Type: Date, Required: yes
createdBy|Type: ObjectID, Required: no, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
user|Type: ObjectID, Required: no, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Notification

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
to|ObjectID, optional, ref: [User](#user)
message|String, required
read|Number, required
data.patient|ObjectID, optional, ref: [User](#user)
data.appointment|ObjectID, optional, ref: [Appointment](#appointment)
data.offer|ObjectID, optional, ref: [Offer](#offer)
data.referral|ObjectID, optional, ref: [Referral](#referral)
data.broadcast|ObjectID, optional, ref: [Broadcast](#broadcast)
template|String, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
_id|ObjectID, optional
__v|Number, optional

## Offer

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
provider|ObjectID, optional, ref: [User](#user)
facility|ObjectID, optional, ref: [Facility](#facility)
date|Date, optional
duration|Number, optional
waitlists|Array, optional
appointmentType|Array, optional
source|String, required, Possible values: ["cancellation", "manual", "find-open-spots", "self-scheduling", "reschedule"]
status|String, required, Possible values: ["in-progress", "patient-found", "patient-not-found", "cancelled"]
integratorCreationResults.status|String, optional, Possible values: ["success", "failure", "pending"]
integratorCreationResults.errors|String, optional
approvedBy|ObjectID, optional, ref: [User](#user)
declinedBy|ObjectID, optional, ref: [User](#user)
currentWaitlist|Number, required
expireAt|Date, optional
patientFoundAt|Date, optional
patientFound|ObjectID, optional, ref: [Patient](#patient)
estimatedCompletionAt|Date, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
shadowAppointment|String, optional
availability|ObjectID, optional, ref: [Availability](#availability)
protocol|String, optional, Possible values: ["serial", "parallel"]
deleted|Number, optional
_id|ObjectID, optional
__v|Number, optional

## Offer

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
provider|ObjectID, optional, ref: [User](#user)
facility|ObjectID, optional, ref: [Facility](#facility)
date|Date, optional
duration|Number, optional
waitlists|Array, optional
appointmentType|Array, optional
source|String, required, Possible values: ["cancellation", "manual", "find-open-spots", "self-scheduling", "reschedule"]
status|String, required, Possible values: ["in-progress", "patient-found", "patient-not-found", "cancelled"]
integratorCreationResults.status|String, optional, Possible values: ["success", "failure", "pending"]
integratorCreationResults.errors|String, optional
approvedBy|ObjectID, optional, ref: [User](#user)
declinedBy|ObjectID, optional, ref: [User](#user)
currentWaitlist|Number, required
expireAt|Date, optional
patientFoundAt|Date, optional
patientFound|ObjectID, optional, ref: [Patient](#patient)
estimatedCompletionAt|Date, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
shadowAppointment|String, optional
availability|ObjectID, optional, ref: [Availability](#availability)
protocol|String, optional, Possible values: ["serial", "parallel"]
deleted|Number, optional
_id|ObjectID, optional
__v|Number, optional

## OrganizationUsers

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
organization|ObjectID, required, ref: [Organization](#organization)
organizationUser|ObjectID, required, ref: [User](#user)
invitedUser|ObjectID, required, ref: [User](#user)
impersonatedUser|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, required
updatedAt|Date, required
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Organization

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
name|String, required
description|String, optional
users|Array, optional
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## OutboundMessageRequest

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
sender|String, optional
senderName|String, optional
patient|ObjectID, optional, ref: [User](#user)
recipient|ObjectID, required, ref: [User](#user)
recipientType|String, required, Possible values: ["staff", "patient", "doctor"]
channel|String, required, Possible values: ["sms", "email", "voice", "inapp", "chat", "fax"]
contact|String, optional
template|String, required
context|Mixed, optional
callbackQueue|String, optional
status|String, optional, Possible values: ["sent", "received", "delivered", "undelivered"]
statusReason|String, optional
ref|String, required, Possible values: ["reminder", "appointment-offer", "waitlist", "waitlist-offer", "generic", "feedback-reminder", "feedback", "stop", "referral-reminder", "referral-followup", "broadcast", "chat", "chat-notification", "pin-verification", "followup", "bot:followup", "referral-redirect", "form-reminder"]
refId|ObjectID, optional
cbUrl|String, optional
secure|Boolean, optional
visibility|String, required, Possible values: ["public", "private", "internal"]
text|String, optional
_id|ObjectID, optional
__v|Number, optional

## OutboundReferral

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
provider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
renderingProvider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
appointmentType|Type: ObjectID, Required: no, Referencing: [AppointmentType](#appointmenttype)
source|Type: String, Required: no, Possible values: ["upload","ui","integrator"]
status|Type: String, Required: no, Possible values:
["active","called","scheduled","incomplete","cancelled","expired","closed"]
diagnoses|Type: Array, Required: no
attempt|Type: Number, Required: no
startOn|Type: Date, Required: yes
expireAt|Type: Date, Required: yes
lastAttemptSentAt|Type: Date, Required: no
calledAt|Type: Date, Required: no
scheduledAt|Type: Date, Required: no
notes|Type: String, Required: no
externalId.source|Type: String, Required: no, Possible values:
["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","allmeds"]
externalId.value|Type: String, Required: no
reason|Type: String, Required: no
processedReferralOutreach|Type: String, Required: no, Possible values: ["pending","skipped","failed","success"]
faxUpload|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## PatientFormTemplate

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
externalId.source|String, optional, Possible values: ["docusign", "hellosign", "surveymonkey", "luma"]
externalId.value|String, optional
title|String, optional
insurance.enabled|Boolean, optional
insurance.required|Mixed, optional
reminder.enabled|Boolean, optional
reminder.required|Mixed, optional
active|Boolean, optional
url|String, optional
tag|String, optional
template|Mixed, optional
integratorMapping|undefined, optional
_id|ObjectID, optional
__v|Number, optional

## PatientForm

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
patient|ObjectID, required, ref: [User](#user)
fileUpload|ObjectID, optional, ref: [FileUpload](#fileupload)
patientFormTemplate|ObjectID, required, ref: [PatientFormTemplate](#patientformtemplate)
responses|Mixed, optional
answers|Mixed, optional
status|String, optional, Possible values: ["started", "completed"]
duration|Number, optional
url|String, optional
integratorUpdateResults.status|String, optional, Possible values: ["success", "failure", "pending"]
integratorUpdateResults.error|String, optional
_id|ObjectID, optional
__v|Number, optional

## PatientMessageTemplate

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
language|Type: String, Required: yes, Possible values: ["es","en","vi","am","fa","ko","ru","zh-t","zh-s","zh","pt","ar"]
message|Type: String, Required: yes
name|Type: String, Required: yes
type|Type: String, Required: yes, Possible values: ["chat","broadcast"]
channel|Type: String, Required: no, Possible values: ["sms","email","voice"]
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## PatientSubscriber

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
isSubscribed|Boolean, optional
subscriber|ObjectID, required, ref: [User](#user)
patient|ObjectID, required, ref: [Patient](#patient)
_id|ObjectID, optional
__v|Number, optional

## Patient

Attribute|Description
----|----
preferedLanguage|String, optional
stats.counters.messagesSentToPatient|Number, optional
stats.counters.confirmedAppointments|Number, optional
stats.counters.cancelledAppointments|Number, optional
stats.counters.offersSent|Number, optional
stats.counters.offersAccepted|Number, optional
stats.counters.appointmentOffersReplied|Number, optional
stats.average.appointmentOfferReplyTime|Number, optional
lastProcessedAt|Date, optional
source|String, optional, Possible values: ["widget", "integrator", "ui", "referring-provider"]
mergedInto|ObjectID, optional, ref: [Patient](#patient)
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
subscribers|undefined, optional
outboundContact|undefined, optional
_id|ObjectID, optional
name|String, optional
firstname|String, optional
lastname|String, optional
middlename|String, optional
email|String, optional
password|String, optional
passwordHashAlgorithm|String, optional, Possible values: ["md5", "sha256", "sha512", "bcrypt"]
passwordUpdatedAt|Date, optional
safeId|String, optional
resetPasswordToken|String, optional
resetPasswordExpires|Date, optional
type|String, required, Possible values: ["doctor", "staff", "patient"]
roles|Array, optional
organization|ObjectID, optional, ref: [Organization](#organization)
contact|undefined, optional
doNotContact|Boolean, required
doNotContactMessage|ObjectID, optional, ref: [Message](#message)
groups|Array, optional
stripeCustomerId|String, optional
stripeSubscriptionId|String, optional
salesforceId|String, optional
salesforceData.provisioning|Array, optional
salesforceData.respectProvisioning|Boolean, optional
salesforceData.lifeline|String, optional, Possible values: ["trial", "converted", "active", "churn"]
salesforceData.mrr|Number, optional
salesforceData.renewalDate|Date, optional
salesforceData.providers|Number, optional
salesforceData.specialty|String, optional
salesforceData.referralTrialLimit|Number, optional
salesforceData.recordType|String, optional
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
lastLogin|Date, optional
token|String, required
active|Number, required
master|Boolean, optional
language|String, optional
user|ObjectID, optional, ref: [User](#user)
setting|ObjectID, optional, ref: [Setting](#setting)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
externalId.value|String, optional
secondaryExternalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
secondaryExternalId.value|String, optional
dateOfBirth.year|Number, optional
dateOfBirth.month|Number, optional
dateOfBirth.day|Number, optional
dateOfBirth.required|Mixed, optional
address|String, optional
city|String, optional
state|String, optional
country|String, required
postcode|String, optional
gender|String, required, Possible values: ["male", "female", "unknown", "nonbinary"]
passwordResetRequired|Boolean, optional
twoFactorAuthSecret.key|String, optional
twoFactorAuthSecret.period|Number, optional
twoFactorAuthSecret.enabled|Boolean, optional
twoFactorAuthSecret.backupCodes|Array, optional
twoFactorAuthSecret.required|Mixed, optional
allowedIps|Array, optional
stats.oldestAppointment|Date, optional
avatar|ObjectID, optional, ref: [FileUpload](#fileupload)
__v|Number, optional
__t|String, optional

## Procedures

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
patient|ObjectID, required, ref: [Patient](#patient)
cpt|String, required
date|Date, optional
appointment|ObjectID, optional, ref: [Appointment](#appointment)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
_id|ObjectID, optional
__v|Number, optional

## Procedures

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
patient|ObjectID, required, ref: [Patient](#patient)
cpt|String, required
date|Date, optional
appointment|ObjectID, optional, ref: [Appointment](#appointment)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
_id|ObjectID, optional
__v|Number, optional

## Provider

Attribute|Description
----|----
deptCode|String, optional
phonetic|String, optional
isReferringProvider|Boolean, optional
visible|Boolean, required
npi|Number, optional
source|String, optional, Possible values: ["upload", "patient-referral-form", "ui", "integrator"]
createdBy|ObjectID, optional, ref: [User](#user)
updatedBy|ObjectID, optional, ref: [User](#user)
biography|String, optional
biographyUrl|String, optional
headshot|ObjectID, optional, ref: [FileUpload](#fileupload)
_id|ObjectID, optional
name|String, optional
firstname|String, optional
lastname|String, optional
middlename|String, optional
email|String, optional
password|String, optional
passwordHashAlgorithm|String, optional, Possible values: ["md5", "sha256", "sha512", "bcrypt"]
passwordUpdatedAt|Date, optional
safeId|String, optional
resetPasswordToken|String, optional
resetPasswordExpires|Date, optional
type|String, required, Possible values: ["doctor", "staff", "patient"]
roles|Array, optional
organization|ObjectID, optional, ref: [Organization](#organization)
contact|undefined, optional
doNotContact|Boolean, required
doNotContactMessage|ObjectID, optional, ref: [Message](#message)
groups|Array, optional
stripeCustomerId|String, optional
stripeSubscriptionId|String, optional
salesforceId|String, optional
salesforceData.provisioning|Array, optional
salesforceData.respectProvisioning|Boolean, optional
salesforceData.lifeline|String, optional, Possible values: ["trial", "converted", "active", "churn"]
salesforceData.mrr|Number, optional
salesforceData.renewalDate|Date, optional
salesforceData.providers|Number, optional
salesforceData.specialty|String, optional
salesforceData.referralTrialLimit|Number, optional
salesforceData.recordType|String, optional
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
lastLogin|Date, optional
token|String, required
active|Number, required
master|Boolean, optional
language|String, optional
user|ObjectID, optional, ref: [User](#user)
setting|ObjectID, optional, ref: [Setting](#setting)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
externalId.value|String, optional
secondaryExternalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
secondaryExternalId.value|String, optional
dateOfBirth.year|Number, optional
dateOfBirth.month|Number, optional
dateOfBirth.day|Number, optional
dateOfBirth.required|Mixed, optional
address|String, optional
city|String, optional
state|String, optional
country|String, required
postcode|String, optional
gender|String, required, Possible values: ["male", "female", "unknown", "nonbinary"]
passwordResetRequired|Boolean, optional
twoFactorAuthSecret.key|String, optional
twoFactorAuthSecret.period|Number, optional
twoFactorAuthSecret.enabled|Boolean, optional
twoFactorAuthSecret.backupCodes|Array, optional
twoFactorAuthSecret.required|Mixed, optional
allowedIps|Array, optional
stats.oldestAppointment|Date, optional
avatar|ObjectID, optional, ref: [FileUpload](#fileupload)
__v|Number, optional
__t|String, optional

## Provider

Attribute|Description
----|----
deptCode|String, optional
phonetic|String, optional
isReferringProvider|Boolean, optional
visible|Boolean, required
npi|Number, optional
source|String, optional, Possible values: ["upload", "patient-referral-form", "ui", "integrator"]
createdBy|ObjectID, optional, ref: [User](#user)
updatedBy|ObjectID, optional, ref: [User](#user)
biography|String, optional
biographyUrl|String, optional
headshot|ObjectID, optional, ref: [FileUpload](#fileupload)
_id|ObjectID, optional
name|String, optional
firstname|String, optional
lastname|String, optional
middlename|String, optional
email|String, optional
password|String, optional
passwordHashAlgorithm|String, optional, Possible values: ["md5", "sha256", "sha512", "bcrypt"]
passwordUpdatedAt|Date, optional
safeId|String, optional
resetPasswordToken|String, optional
resetPasswordExpires|Date, optional
type|String, required, Possible values: ["doctor", "staff", "patient"]
roles|Array, optional
organization|ObjectID, optional, ref: [Organization](#organization)
contact|undefined, optional
doNotContact|Boolean, required
doNotContactMessage|ObjectID, optional, ref: [Message](#message)
groups|Array, optional
stripeCustomerId|String, optional
stripeSubscriptionId|String, optional
salesforceId|String, optional
salesforceData.provisioning|Array, optional
salesforceData.respectProvisioning|Boolean, optional
salesforceData.lifeline|String, optional, Possible values: ["trial", "converted", "active", "churn"]
salesforceData.mrr|Number, optional
salesforceData.renewalDate|Date, optional
salesforceData.providers|Number, optional
salesforceData.specialty|String, optional
salesforceData.referralTrialLimit|Number, optional
salesforceData.recordType|String, optional
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
lastLogin|Date, optional
token|String, required
active|Number, required
master|Boolean, optional
language|String, optional
user|ObjectID, optional, ref: [User](#user)
setting|ObjectID, optional, ref: [Setting](#setting)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
externalId.value|String, optional
secondaryExternalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
secondaryExternalId.value|String, optional
dateOfBirth.year|Number, optional
dateOfBirth.month|Number, optional
dateOfBirth.day|Number, optional
dateOfBirth.required|Mixed, optional
address|String, optional
city|String, optional
state|String, optional
country|String, required
postcode|String, optional
gender|String, required, Possible values: ["male", "female", "unknown", "nonbinary"]
passwordResetRequired|Boolean, optional
twoFactorAuthSecret.key|String, optional
twoFactorAuthSecret.period|Number, optional
twoFactorAuthSecret.enabled|Boolean, optional
twoFactorAuthSecret.backupCodes|Array, optional
twoFactorAuthSecret.required|Mixed, optional
allowedIps|Array, optional
stats.oldestAppointment|Date, optional
avatar|ObjectID, optional, ref: [FileUpload](#fileupload)
__v|Number, optional
__t|String, optional

## Recalls

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
patient|ObjectID, required, ref: [Patient](#patient)
provider|ObjectID, optional, ref: [Provider](#provider)
facility|ObjectID, optional, ref: [Facility](#facility)
appointment|ObjectID, optional, ref: [Appointment](#appointment)
type|ObjectID, optional, ref: [AppointmentType](#appointmenttype)
date|Date, required
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
status|String, required, Possible values: ["pending", "scheduled"]
_id|ObjectID, optional
__v|Number, optional

## Recalls

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required
updatedBy|ObjectID, required
patient|ObjectID, required, ref: [Patient](#patient)
provider|ObjectID, optional, ref: [Provider](#provider)
facility|ObjectID, optional, ref: [Facility](#facility)
appointment|ObjectID, optional, ref: [Appointment](#appointment)
type|ObjectID, optional, ref: [AppointmentType](#appointmenttype)
date|Date, required
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
status|String, required, Possible values: ["pending", "scheduled"]
_id|ObjectID, optional
__v|Number, optional

## Referral

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
facility|ObjectID, optional, ref: [Facility](#facility)
provider|ObjectID, optional, ref: [Provider](#provider)
referringProviderId|ObjectID, optional, ref: [Provider](#provider)
referringProvider|String, optional
patient|ObjectID, required, ref: [User](#user)
source|String, optional, Possible values: ["upload", "patient-referral-form", "ui", "integrator"]
status|String, required, Possible values: ["active", "called", "called-late", "scheduled", "scheduled-late", "incomplete", "expired", "cancelled", "pending", "closed"]
fileUploads|Array, optional
startOn|Date, required
expireAt|Date, required
attempt|Number, required
lastAttemptSentAt|Date, optional
calledAt|Date, optional
acceptedAt|Date, optional
scheduledAt|Date, optional
notes|String, optional
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
customerNotes|String, optional
reason|String, optional
scheduledByAppointment|ObjectID, optional, ref: [Appointment](#appointment)
scheduledByOffer|ObjectID, optional, ref: [Offer](#offer)
processedReferralFollowup|String, optional, Possible values: ["pending", "skipped", "failed", "success"]
upload|ObjectID, optional, ref: [Upload](#upload)
faxUrl|String, optional
_id|ObjectID, optional
__v|Number, optional

## Referral

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
facility|ObjectID, optional, ref: [Facility](#facility)
provider|ObjectID, optional, ref: [Provider](#provider)
referringProviderId|ObjectID, optional, ref: [Provider](#provider)
referringProvider|String, optional
patient|ObjectID, required, ref: [User](#user)
source|String, optional, Possible values: ["upload", "patient-referral-form", "ui", "integrator"]
status|String, required, Possible values: ["active", "called", "called-late", "scheduled", "scheduled-late", "incomplete", "expired", "cancelled", "pending", "closed"]
fileUploads|Array, optional
startOn|Date, required
expireAt|Date, required
attempt|Number, required
lastAttemptSentAt|Date, optional
calledAt|Date, optional
acceptedAt|Date, optional
scheduledAt|Date, optional
notes|String, optional
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
externalId.value|String, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, required
customerNotes|String, optional
reason|String, optional
scheduledByAppointment|ObjectID, optional, ref: [Appointment](#appointment)
scheduledByOffer|ObjectID, optional, ref: [Offer](#offer)
processedReferralFollowup|String, optional, Possible values: ["pending", "skipped", "failed", "success"]
upload|ObjectID, optional, ref: [Upload](#upload)
faxUrl|String, optional
_id|ObjectID, optional
__v|Number, optional

## Reminder

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
provider|ObjectID, optional, ref: [User](#user)
appointment|ObjectID, optional, ref: [Appointment](#appointment)
referral|ObjectID, optional, ref: [Referral](#referral)
recall|ObjectID, optional, ref: [Recall](#recall)
followup|ObjectID, optional, ref: [Followup](#followup)
followupOperation|String, optional, Possible values: ["created", "deleted", "updated"]
facility|ObjectID, optional, ref: [Facility](#facility)
patient|ObjectID, required, ref: [User](#user)
patientForm|ObjectID, optional, ref: [PatientForm](#patientform)
message|Mixed, optional
type|String, required, Possible values: ["appointment", "feedback", "referral", "followup", "patient-form"]
externalId.source|String, optional, Possible values: ["mandrill", "twilio", "nexmo", "sendgrid", "plivo"]
externalId.value|String, optional
sendAt|Date, required
sentAt|Date, optional
contact|Array, optional
messageTemplate|String, optional
status|String, required, Possible values: ["scheduled", "pending", "queued", "sent", "confirmed", "emailOpened", "skipped", "failed", "delivered"]
statusReason|String, optional
replied|Number, optional
repliedMessage|String, optional
originalRepliedMessage|String, optional
repliedTime|Date, optional
createdAt|Date, optional
updatedAt|Date, optional
deleted|Number, required
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Reminder

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
provider|ObjectID, optional, ref: [User](#user)
appointment|ObjectID, optional, ref: [Appointment](#appointment)
referral|ObjectID, optional, ref: [Referral](#referral)
recall|ObjectID, optional, ref: [Recall](#recall)
followup|ObjectID, optional, ref: [Followup](#followup)
followupOperation|String, optional, Possible values: ["created", "deleted", "updated"]
facility|ObjectID, optional, ref: [Facility](#facility)
patient|ObjectID, required, ref: [User](#user)
patientForm|ObjectID, optional, ref: [PatientForm](#patientform)
message|Mixed, optional
type|String, required, Possible values: ["appointment", "feedback", "referral", "followup", "patient-form"]
externalId.source|String, optional, Possible values: ["mandrill", "twilio", "nexmo", "sendgrid", "plivo"]
externalId.value|String, optional
sendAt|Date, required
sentAt|Date, optional
contact|Array, optional
messageTemplate|String, optional
status|String, required, Possible values: ["scheduled", "pending", "queued", "sent", "confirmed", "emailOpened", "skipped", "failed", "delivered"]
statusReason|String, optional
replied|Number, optional
repliedMessage|String, optional
originalRepliedMessage|String, optional
repliedTime|Date, optional
createdAt|Date, optional
updatedAt|Date, optional
deleted|Number, required
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Setting

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
refId|ObjectID, optional
ref|String, required, Possible values: ["user", "provider", "facility", "appointment-type", "integrator"]
settings.welcome.currentStep|Number, optional
settings.welcome.termsAgreementDate|Date, optional
settings.labs.enabled|Boolean, optional
settings.communication.useFacilityPhoneAsFromNumber|Boolean, optional
settings.communication.useFacilityAlternativePhoneAsFromNumber|Boolean, optional
settings.communication.unsubscribedMessages|Array, optional
settings.communication.blockedContacts|Array, optional
settings.communication.limitedContacts|Array, optional
settings.communication.expirePatientData.enabled|Boolean, optional
settings.communication.expirePatientData.maxAgeInDays|Number, optional
settings.communication.urlReplacers|undefined, optional
settings.timezone|String, required
settings.scheduler.enabled|Boolean, optional
settings.scheduler.daysAheadToShowAvailability|Number, optional
settings.scheduler.maxDaysToShow|Number, optional
settings.scheduler.providerAvailabilityFilter|undefined, optional
settings.scheduler.maxAvailablitiesToRender|Number, optional
settings.scheduler.patientAddress.required|Boolean, optional
settings.scheduler.patientAddress.visible|Boolean, required
settings.scheduler.reschedulerRespectsSchedulerRules|Boolean, optional
settings.referral.enabled|Boolean, optional
settings.referral.attempts|Number, optional
settings.referral.interval|Number, optional
settings.referral.schedulableWindow.earliest|Number, optional
settings.referral.schedulableWindow.latest|Number, optional
settings.referral.sendReferralFax|Boolean, optional
settings.referral.sendReferralFaxStatus.scheduled|Boolean, optional
settings.referral.sendReferralFaxStatus.cancelled|Boolean, optional
settings.referral.sendReferralFaxStatus.incomplete|Boolean, optional
settings.referral.sendReferralEmail|Boolean, optional
settings.reminder.multipleRemindersPerDay|String, optional, Possible values: ["onlySendEarliest", "multipleRemindersPerDay"]
settings.reminder.schedule|Array, optional
settings.reminder.enabled|Boolean, optional
settings.reminder.onConfirmation|String, optional, Possible values: ["skipFurtherReminders", "keepLastReminder"]
settings.reminder.repliesForLastReminder|String, required, Possible values: ["allowed", "confirmationOnly", "none"]
settings.reminder.replies|String, required, Possible values: ["allowed", "confirmationOnly", "none"]
settings.reminder.enabledChannels|Array, optional
settings.reminder.treatCancellationsAsNoShows|Number, required
settings.reminder.offerToJoinWaitlistOnCancellation|String, required, Possible values: ["disabled", "from-reminder", "from-integrator", "from-both"]
settings.reminder.schedulableWindow.earliest|Number, optional
settings.reminder.schedulableWindow.latest|Number, optional
settings.reminder.allowSelfSchedule|Boolean, optional
settings.reminder.rescheduleSundayToSaturday|Boolean, optional
settings.reminder.forceVoiceCallsForSmsNonResponders|Boolean, optional
settings.reminder.cancelOrConfirmAllAppointmentsInDay|Boolean, optional
settings.reminder.allowConfirmAfterCancel|Boolean, optional
settings.reminder.allowCancelAfterConfirm|Boolean, optional
settings.reminder.strictConfirmCancelTextHandling|Boolean, optional
settings.reminder.disableCatchupReminders|Boolean, optional
settings.cancellation.enabled|Boolean, optional
settings.cancellation.expiration|Number, optional
settings.cancellation.processAppointmentTypes|Boolean, optional
settings.cancellation.requireFrontOfficeAcceptance|Boolean, optional
settings.cancellation.shadowAppointment.enabled|Boolean, optional
settings.cancellation.allowDoubleBooks|Boolean, optional
settings.cancellation.maxDaysAheadsToProcessCancellation|Number, optional
settings.cancellation.minMinutesAheadsToProcessCancellation|Number, optional
settings.cancellation.spotsDiscovery.enabled|Boolean, optional
settings.cancellation.spotsDiscovery.maxSpots|Number, optional
settings.cancellation.spotsDiscovery.hoursAhead|Number, optional
settings.cancellation.autoAddToWaitlist.enabled|Boolean, optional
settings.cancellation.autoAddToWaitlist.daysAhead|Number, optional
settings.cancellation.sendYouveBeenAddedMessage|Boolean, optional
settings.cancellation.skipOfferBasedOnLastSentOffer|Boolean, optional
settings.cancellation.maxOffersPerWaitlist|Number, optional
settings.cancellation.protocol|String, optional, Possible values: ["serial", "parallel"]
settings.cancellation.offerToJoinDuration|Number, optional
settings.cancellation.autoCreateWaitlists|Boolean, required
settings.cancellation.delayOffers.enabled|Boolean, optional
settings.cancellation.delayOffers.until|String, optional
settings.cancellation.cancelFutureAppointment|Boolean, optional
settings.cancellation.requireFutureAppointment|Boolean, optional
settings.appointment.duration|Number, optional
settings.feedback.multipleRemindersPerDay|String, optional, Possible values: ["onlySendEarliest", "multipleRemindersPerDay"]
settings.feedback.enabled|Boolean, optional
settings.feedback.promoter.type|String, optional, Possible values: ["facebook", "yelp", "patientfusion", "betterdoctor", "zocdoc", "google", "generic", "healthgrades", "ratemds"]
settings.feedback.promoter.url|String, optional
settings.feedback.promoterUrls|undefined, optional
settings.feedback.detractor.type|String, optional, Possible values: ["google"]
settings.feedback.detractor.url|String, optional
settings.feedback.detractorUrls|undefined, optional
settings.feedback.schedule|Number, optional
settings.feedback.interval.enabled|Boolean, optional
settings.feedback.interval.value|Number, optional
settings.feedback.limit.enabled|Boolean, optional
settings.feedback.limit.value|Number, optional
settings.feedback.allowFeedbackForPastAppointments|Boolean, required
settings.feedback.forceMessageTime.enabled|Boolean, optional
settings.feedback.forceMessageTime.until|String, optional
settings.followup.enabled|Boolean, optional
settings.integrator.requireLock|Boolean, optional
settings.integrator.syncWindow.earliest|Number, required
settings.integrator.syncWindow.latest|Number, required
settings.integrator.writeDataToIntegrator.createAppointments|Boolean, optional
settings.integrator.writeDataToIntegrator.updateStatus|Boolean, optional
settings.integrator.writeDataToIntegrator.updatePatientDemographics|Boolean, optional
settings.integrator.writeDataToIntegrator.flushPatientMessageHistory|Boolean, optional
settings.integrator.frequency|Number, required
settings.integrator.enforceProviderDeltaCheck|Boolean, optional
settings.integrator.enforceAppointmentDeltaCheck|Boolean, optional
settings.integrator.syncProcedures|Boolean, optional
settings.integrator.syncDiagnoses|Boolean, optional
settings.integrator.syncReferrals|Boolean, optional
settings.integrator.verifySlotIsOpenBeforeAppointmentCreation|Boolean, optional
settings.integrator.verifyWhitespaceIsOpenBeforeAppointmentCreation|Boolean, optional
settings.patients.maxTokenAge|Number, optional
settings.patients.loginLookupInIntegrator|Boolean, optional
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

## Upload

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
integrator|String, required, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner"]
type|String, required, Possible values: ["appointment", "patient", "referral"]
mapping|ObjectID, optional, ref: [FileMapping](#filemapping)
content|Mixed, optional
status|String, required, Possible values: ["unmapped", "pending", "processing", "completed", "failed"]
results.noContactPatients|Array, optional
results.recordsSkipped|Number, optional
results.patientsSkipped|Number, optional
results.patientsCreated|Array, optional
results.patientsUpdated|Array, optional
results.facilitiesCreated|Array, optional
results.errors|undefined, optional
resultsDescription|String, optional
createdAt|Date, optional
updatedAt|Date, optional
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
deleted|Number, optional
_id|ObjectID, optional
__v|Number, optional

## User

Attribute|Description
----|----
_id|ObjectID, optional
name|String, optional
firstname|String, optional
lastname|String, optional
middlename|String, optional
email|String, optional
password|String, optional
passwordHashAlgorithm|String, optional, Possible values: ["md5", "sha256", "sha512", "bcrypt"]
passwordUpdatedAt|Date, optional
safeId|String, optional
resetPasswordToken|String, optional
resetPasswordExpires|Date, optional
type|String, required, Possible values: ["doctor", "staff", "patient"]
roles|Array, optional
organization|ObjectID, optional, ref: [Organization](#organization)
contact|undefined, optional
doNotContact|Boolean, required
doNotContactMessage|ObjectID, optional, ref: [Message](#message)
groups|Array, optional
stripeCustomerId|String, optional
stripeSubscriptionId|String, optional
salesforceId|String, optional
salesforceData.provisioning|Array, optional
salesforceData.respectProvisioning|Boolean, optional
salesforceData.lifeline|String, optional, Possible values: ["trial", "converted", "active", "churn"]
salesforceData.mrr|Number, optional
salesforceData.renewalDate|Date, optional
salesforceData.providers|Number, optional
salesforceData.specialty|String, optional
salesforceData.referralTrialLimit|Number, optional
salesforceData.recordType|String, optional
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
lastLogin|Date, optional
token|String, required
active|Number, required
master|Boolean, optional
language|String, optional
user|ObjectID, optional, ref: [User](#user)
setting|ObjectID, optional, ref: [Setting](#setting)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
externalId.value|String, optional
secondaryExternalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
secondaryExternalId.value|String, optional
dateOfBirth.year|Number, optional
dateOfBirth.month|Number, optional
dateOfBirth.day|Number, optional
dateOfBirth.required|Mixed, optional
address|String, optional
city|String, optional
state|String, optional
country|String, required
postcode|String, optional
gender|String, required, Possible values: ["male", "female", "unknown", "nonbinary"]
passwordResetRequired|Boolean, optional
twoFactorAuthSecret.key|String, optional
twoFactorAuthSecret.period|Number, optional
twoFactorAuthSecret.enabled|Boolean, optional
twoFactorAuthSecret.backupCodes|Array, optional
twoFactorAuthSecret.required|Mixed, optional
allowedIps|Array, optional
stats.oldestAppointment|Date, optional
avatar|ObjectID, optional, ref: [FileUpload](#fileupload)
__v|Number, optional
__t|String, optional

## User

Attribute|Description
----|----
_id|ObjectID, optional
name|String, optional
firstname|String, optional
lastname|String, optional
middlename|String, optional
email|String, optional
password|String, optional
passwordHashAlgorithm|String, optional, Possible values: ["md5", "sha256", "sha512", "bcrypt"]
passwordUpdatedAt|Date, optional
safeId|String, optional
resetPasswordToken|String, optional
resetPasswordExpires|Date, optional
type|String, required, Possible values: ["doctor", "staff", "patient"]
roles|Array, optional
organization|ObjectID, optional, ref: [Organization](#organization)
contact|undefined, optional
doNotContact|Boolean, required
doNotContactMessage|ObjectID, optional, ref: [Message](#message)
groups|Array, optional
stripeCustomerId|String, optional
stripeSubscriptionId|String, optional
salesforceId|String, optional
salesforceData.provisioning|Array, optional
salesforceData.respectProvisioning|Boolean, optional
salesforceData.lifeline|String, optional, Possible values: ["trial", "converted", "active", "churn"]
salesforceData.mrr|Number, optional
salesforceData.renewalDate|Date, optional
salesforceData.providers|Number, optional
salesforceData.specialty|String, optional
salesforceData.referralTrialLimit|Number, optional
salesforceData.recordType|String, optional
deleted|Number, required
createdAt|Date, optional
updatedAt|Date, optional
lastLogin|Date, optional
token|String, required
active|Number, required
master|Boolean, optional
language|String, optional
user|ObjectID, optional, ref: [User](#user)
setting|ObjectID, optional, ref: [Setting](#setting)
externalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
externalId.value|String, optional
secondaryExternalId.source|String, optional, Possible values: ["gcalendar", "successehs", "drchrono", "dentrix", "webpt", "theraoffice", "mi7", "practicefusion", "advancedmd", "acomrapidpm", "kareo", "nextech", "mwtherapy", "clinicient", "carecloud", "eclinicalmobile", "duxware", "labretriever", "optimispt", "referral", "recall", "allscriptspm", "lytec", "brightree", "fullslate", "nuemd", "centricityps", "officeally", "greenwayintergy", "compulink", "adspm", "dsnpm", "lumamock", "medicalmastermind", "meditouch", "healthnautica", "ezemrx", "hl7", "amazingcharts", "greenwayprimesuite", "raintree", "athenahealth", "revflow", "eclinicalworks10e", "hl7pickup", "mindbody", "eclinicalworkssql", "nextgen", "practiceperfect", "avimark", "clinix", "keymedical", "mdoffice", "webedoctor", "emapm", "medinformatix", "imsgo", "emds", "allscriptsunity", "medevolve", "caretracker", "clearpractice", "valant", "micromd", "systemedx", "medicalmaster", "athenamdp", "gmed", "roche", "onetouch", "somnoware", "managementplus", "lumacare", "nextechfhir", "curemd", "epic", "phoenixortho", "ezderm", "ggastromobile", "epicconfirmationpickup", "cerner", "sms", "voice", "email", "none"]
secondaryExternalId.value|String, optional
dateOfBirth.year|Number, optional
dateOfBirth.month|Number, optional
dateOfBirth.day|Number, optional
dateOfBirth.required|Mixed, optional
address|String, optional
city|String, optional
state|String, optional
country|String, required
postcode|String, optional
gender|String, required, Possible values: ["male", "female", "unknown", "nonbinary"]
passwordResetRequired|Boolean, optional
twoFactorAuthSecret.key|String, optional
twoFactorAuthSecret.period|Number, optional
twoFactorAuthSecret.enabled|Boolean, optional
twoFactorAuthSecret.backupCodes|Array, optional
twoFactorAuthSecret.required|Mixed, optional
allowedIps|Array, optional
stats.oldestAppointment|Date, optional
avatar|ObjectID, optional, ref: [FileUpload](#fileupload)
__v|Number, optional
__t|String, optional

## Waitlist

Attribute|Description
----|----
user|ObjectID, required, ref: [User](#user)
patient|ObjectID, required, ref: [User](#user)
provider|Array, optional
facility|ObjectID, optional, ref: [Facility](#facility)
appointmentType|Array, optional
offer|ObjectID, optional, ref: [Offer](#offer)
department|String, optional
status|String, required, Possible values: ["waiting", "in-flight", "offered", "confirming", "accepted", "pending", "declined"]
bookedBy|String, required, Possible values: ["provider", "department", "patient", "auto"]
createdFromAppointment|ObjectID, optional, ref: [Appointment](#appointment)
futureAppointment|ObjectID, optional, ref: [Appointment](#appointment)
futureAppointmentBestMatch|Boolean, optional
duration|Number, optional
holdUntil|Date, optional
expireAt|Date, optional
createdAt|Date, optional
notes|String, optional
preferredDays|Array, optional
preferredTime|String, optional, Possible values: ["before-lunch", "after-lunch", "anytime"]
stats.counters.offersSent|Number, optional
updatedAt|Date, optional
deleted|Number, required
createdBy|ObjectID, required, ref: [User](#user)
updatedBy|ObjectID, required, ref: [User](#user)
approvedBy|ObjectID, optional, ref: [User](#user)
declinedBy|ObjectID, optional, ref: [User](#user)
_id|ObjectID, optional
__v|Number, optional

# Errors

To be documented.
