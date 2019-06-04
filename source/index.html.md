---
title: LumahealthHQ API Reference

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Welcome to Lumahealth's REST Service API!

# Authentication

## Signup

See [users > signup](#post-signup)

## Login

See [users > login](#post-login-4)

# Paginating and sorting

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
http://localhost:8002/api/activities/?q=xyz \
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

# admin

## Post dedupe/facility

`POST` /api/admin/dedupe/facility

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/admin/dedupe/facility?q=xyz \
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

## Post dedupe/patient

`POST` /api/admin/dedupe/patient

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/admin/dedupe/patient?q=xyz \
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

## Post dedupe/provider

`POST` /api/admin/dedupe/provider

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/admin/dedupe/provider?q=xyz \
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

## Post reload-patients

`POST` /api/admin/reload-patients

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/admin/reload-patients?q=xyz \
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

## Post shorten

`POST` /api/admin/shorten

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/admin/shorten?q=xyz \
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

# appointments

## Get appointments

`GET` /api/appointments/

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/?q=xyz \
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

## Post appointment

`POST` /api/appointments/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/appointments/?q=xyz \
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

`GET` /api/appointments/:id

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/:id?q=xyz \
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

`PUT` /api/appointments/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/appointments/:id?q=xyz \
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

`DELETE` /api/appointments/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/appointments/:id?q=xyz \
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

## Put cancel

`PUT` /api/appointments/:id/cancel

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/appointments/:id/cancel?q=xyz \
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

## Put confirm

`PUT` /api/appointments/:id/confirm

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/appointments/:id/confirm?q=xyz \
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

## Get crudList

`GET` /api/appointments/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/crudList?q=xyz \
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

## Get getByPatientId

`GET` /api/appointments/getByPatientId/:id

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/getByPatientId/:id?q=xyz \
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

## Get reports/find

`GET` /api/appointments/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/reports/find?q=xyz \
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

## Get reports/summary

`GET` /api/appointments/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/reports/summary?q=xyz \
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

## Get reports/xls

`GET` /api/appointments/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/appointments/reports/xls?q=xyz \
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
http://localhost:8002/api/appointmentTypes/?q=xyz \
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

## Post appointmentType

`POST` /api/appointmentTypes/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/appointmentTypes/?q=xyz \
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

`PUT` /api/appointmentTypes/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/appointmentTypes/:id?q=xyz \
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

## Get by id

`GET` /api/appointmentTypes/:id

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/:id?q=xyz \
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

## Delete by id

`DELETE` /api/appointmentTypes/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/appointmentTypes/:id?q=xyz \
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

## Get crudList

`GET` /api/appointmentTypes/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/crudList?q=xyz \
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

## Get hidden

`GET` /api/appointmentTypes/hidden

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/hidden?q=xyz \
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

`GET` /api/appointmentTypes/search

```shell
#shell command:
curl \
http://localhost:8002/api/appointmentTypes/search?q=xyz \
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

# availabilities

## Put availability

`PUT` /api/availabilities/

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/availabilities/?q=xyz \
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

## Post availability

`POST` /api/availabilities/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/availabilities/?q=xyz \
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

## Get availabilities

`GET` /api/availabilities/

```shell
#shell command:
curl \
http://localhost:8002/api/availabilities/?q=xyz \
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

## Get by id

`GET` /api/availabilities/:id

```shell
#shell command:
curl \
http://localhost:8002/api/availabilities/:id?q=xyz \
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

## Put book

`PUT` /api/availabilities/:id/book

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/availabilities/:id/book?q=xyz \
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

## Post book

`POST` /api/availabilities/book/:id

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/availabilities/book/:id?q=xyz \
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

## Get freebusy

`GET` /api/availabilities/freebusy

```shell
#shell command:
curl \
http://localhost:8002/api/availabilities/freebusy?q=xyz \
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

# billing

## Get billing

`GET` /api/billing/

```shell
#shell command:
curl \
http://localhost:8002/api/billing/?q=xyz \
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

## Get subscriptions

`GET` /api/billing/:id/subscriptions

```shell
#shell command:
curl \
http://localhost:8002/api/billing/:id/subscriptions?q=xyz \
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

## Get charges/last-status

`GET` /api/billing/charges/last-status

```shell
#shell command:
curl \
http://localhost:8002/api/billing/charges/last-status?q=xyz \
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

## Get charges/last-status

`GET` /api/billing/charges/last-status/:id

```shell
#shell command:
curl \
http://localhost:8002/api/billing/charges/last-status/:id?q=xyz \
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

## Get charges/success-count

`GET` /api/billing/charges/success-count

```shell
#shell command:
curl \
http://localhost:8002/api/billing/charges/success-count?q=xyz \
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

# broadcasts

## Get broadcasts

`GET` /api/broadcasts/

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/?q=xyz \
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

## Post broadcast

`POST` /api/broadcasts/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/broadcasts/?q=xyz \
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

## Delete by id

`DELETE` /api/broadcasts/:id

```shell
#shell command:
curl -X DELETE \
http://localhost:8002/api/broadcasts/:id?q=xyz \
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

## Put by id

`PUT` /api/broadcasts/:id

```shell
#shell command:
curl -X PUT \
http://localhost:8002/api/broadcasts/:id?q=xyz \
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

## Get by id

`GET` /api/broadcasts/:id

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/:id?q=xyz \
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

## Get xls

`GET` /api/broadcasts/:id/xls

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/:id/xls?q=xyz \
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

## Post bulk/action

`POST` /api/broadcasts/bulk/action

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/broadcasts/bulk/action?q=xyz \
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

## Get count

`GET` /api/broadcasts/count

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/count?q=xyz \
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

## Get patients

`GET` /api/broadcasts/patients

```shell
#shell command:
curl \
http://localhost:8002/api/broadcasts/patients?q=xyz \
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

# callback

## Get email/offers

`GET` /api/callback/email/offers

```shell
#shell command:
curl \
http://localhost:8002/api/callback/email/offers?q=xyz \
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

## Get email/reminders

`GET` /api/callback/email/reminders

```shell
#shell command:
curl \
http://localhost:8002/api/callback/email/reminders?q=xyz \
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

## Post email/sendgrid

`POST` /api/callback/email/sendgrid

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/email/sendgrid?q=xyz \
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

## Post integrators/auth

`POST` /api/callback/integrators/:integrator/auth/:userId/:secret/:integratorId?

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/integrators/:integrator/auth/:userId/:secret/:integratorId??q=xyz \
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
:integrator | xxx
:userId | xxx
:secret | xxx
:integratorId? | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:integrator | xxx
:userId | xxx
:secret | xxx
:integratorId? | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post mi7/ack

`POST` /api/callback/mi7/ack/:apikey/:systemid/:messageid

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/mi7/ack/:apikey/:systemid/:messageid?q=xyz \
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
:apikey | xxx
:systemid | xxx
:messageid | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:apikey | xxx
:systemid | xxx
:messageid | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post mi7/from

`POST` /api/callback/mi7/from/:apikey/:systemid

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/mi7/from/:apikey/:systemid?q=xyz \
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
:apikey | xxx
:systemid | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:apikey | xxx
:systemid | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get mi7/to

`GET` /api/callback/mi7/to/:apikey/:systemid

```shell
#shell command:
curl \
http://localhost:8002/api/callback/mi7/to/:apikey/:systemid?q=xyz \
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
:apikey | xxx
:systemid | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get plivo/sms/reminders

`GET` /api/callback/plivo/sms/reminders

```shell
#shell command:
curl \
http://localhost:8002/api/callback/plivo/sms/reminders?q=xyz \
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

## Post practicefusion/auth

`POST` /api/callback/practicefusion/auth/:userId/:secret

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/practicefusion/auth/:userId/:secret?q=xyz \
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
:userId | xxx
:secret | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:userId | xxx
:secret | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Get practicefusion/textcode

`GET` /api/callback/practicefusion/textcode

```shell
#shell command:
curl \
http://localhost:8002/api/callback/practicefusion/textcode?q=xyz \
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

## Post slack

`POST` /api/callback/slack/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/slack/?q=xyz \
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

## Get sms/offers

`GET` /api/callback/sms/offers

```shell
#shell command:
curl \
http://localhost:8002/api/callback/sms/offers?q=xyz \
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

## Get sms/referrals

`GET` /api/callback/sms/referrals

```shell
#shell command:
curl \
http://localhost:8002/api/callback/sms/referrals?q=xyz \
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

## Get sms/reminders

`GET` /api/callback/sms/reminders

```shell
#shell command:
curl \
http://localhost:8002/api/callback/sms/reminders?q=xyz \
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

## Post status

`POST` /api/callback/status/:vendor

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/status/:vendor?q=xyz \
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
:vendor | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Request body param | Description 
-------------- | ----------- 
:vendor | xxx

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post stripe/charges

`POST` /api/callback/stripe/charges

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/callback/stripe/charges?q=xyz \
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

## Get voice/offers

`GET` /api/callback/voice/offers

```shell
#shell command:
curl \
http://localhost:8002/api/callback/voice/offers?q=xyz \
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

## Get voice/referrals

`GET` /api/callback/voice/referrals

```shell
#shell command:
curl \
http://localhost:8002/api/callback/voice/referrals?q=xyz \
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

## Get voice/reminders

`GET` /api/callback/voice/reminders

```shell
#shell command:
curl \
http://localhost:8002/api/callback/voice/reminders?q=xyz \
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

## Get all

`GET` /api/chatActivities/all

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/all?q=xyz \
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

## Get mentions

`GET` /api/chatActivities/mentions

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/mentions?q=xyz \
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

## Get presence

`GET` /api/chatActivities/presence

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/presence?q=xyz \
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

## Get unread

`GET` /api/chatActivities/unread

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/unread?q=xyz \
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

## Get unread/patients

`GET` /api/chatActivities/unread/patients

```shell
#shell command:
curl \
http://localhost:8002/api/chatActivities/unread/patients?q=xyz \
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

## Get customWebStyles

`GET` /api/customWebStyles/

```shell
#shell command:
curl \
http://localhost:8002/api/customWebStyles/?q=xyz \
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

## Get by id

`GET` /api/customWebStyles/:id

```shell
#shell command:
curl \
http://localhost:8002/api/customWebStyles/:id?q=xyz \
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

## Get publish

`GET` /api/customWebStyles/:id/publish

```shell
#shell command:
curl \
http://localhost:8002/api/customWebStyles/:id/publish?q=xyz \
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

## Get github/reviews

`GET` /api/deploymentWebhooks/github/:username/reviews

```shell
#shell command:
curl \
http://localhost:8002/api/deploymentWebhooks/github/:username/reviews?q=xyz \
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

## Get docs

`GET` /api/docs/

```shell
#shell command:
curl \
http://localhost:8002/api/docs/?q=xyz \
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

`GET` /api/facilities/:id

```shell
#shell command:
curl \
http://localhost:8002/api/facilities/:id?q=xyz \
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

## Get hidden

`GET` /api/facilities/hidden

```shell
#shell command:
curl \
http://localhost:8002/api/facilities/hidden?q=xyz \
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

`GET` /api/facilities/search

```shell
#shell command:
curl \
http://localhost:8002/api/facilities/search?q=xyz \
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

## Get negative

`GET` /api/feedbackResponses/negative/:id

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/negative/:id?q=xyz \
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

## Get positive

`GET` /api/feedbackResponses/positive/:id

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/positive/:id?q=xyz \
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

## Get promoters|detractors

`GET` /api/feedbackResponses/promoters|detractors

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/promoters|detractors?q=xyz \
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

## Get reports/clicks

`GET` /api/feedbackResponses/reports/clicks

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/clicks?q=xyz \
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

## Get reports/detractors

`GET` /api/feedbackResponses/reports/detractors

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/detractors?q=xyz \
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

## Get reports/find

`GET` /api/feedbackResponses/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/find?q=xyz \
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

## Get reports/findAll

`GET` /api/feedbackResponses/reports/findAll

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/findAll?q=xyz \
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

## Get reports/npsscore

`GET` /api/feedbackResponses/reports/npsscore

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/npsscore?q=xyz \
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

## Get reports/npsscores

`GET` /api/feedbackResponses/reports/npsscores

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/npsscores?q=xyz \
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

## Get reports/promoters

`GET` /api/feedbackResponses/reports/promoters

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/promoters?q=xyz \
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

## Get reports/summary

`GET` /api/feedbackResponses/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/summary?q=xyz \
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

## Get reports/xls

`GET` /api/feedbackResponses/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/feedbackResponses/reports/xls?q=xyz \
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

## Get by id

`GET` /api/fileUploads/:id

```shell
#shell command:
curl \
http://localhost:8002/api/fileUploads/:id?q=xyz \
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

## Get binary

`GET` /api/fileUploads/:id/binary

```shell
#shell command:
curl \
http://localhost:8002/api/fileUploads/:id/binary?q=xyz \
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

## Get file

`GET` /api/fileUploads/:id/file

```shell
#shell command:
curl \
http://localhost:8002/api/fileUploads/:id/file?q=xyz \
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

## Get thumbnail

`GET` /api/fileUploads/:id/thumbnail

```shell
#shell command:
curl \
http://localhost:8002/api/fileUploads/:id/thumbnail?q=xyz \
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

## Get followups

`GET` /api/followups/

```shell
#shell command:
curl \
http://localhost:8002/api/followups/?q=xyz \
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

## Get by id

`GET` /api/followups/:id

```shell
#shell command:
curl \
http://localhost:8002/api/followups/:id?q=xyz \
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

## Get groups

`GET` /api/followups/groups

```shell
#shell command:
curl \
http://localhost:8002/api/followups/groups?q=xyz \
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

`GET` /api/groups/:id

```shell
#shell command:
curl \
http://localhost:8002/api/groups/:id?q=xyz \
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

## Get invites

`GET` /api/groups/:id/invites

```shell
#shell command:
curl \
http://localhost:8002/api/groups/:id/invites?q=xyz \
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

## Get public/get-invite

`GET` /api/groups/public/get-invite

```shell
#shell command:
curl \
http://localhost:8002/api/groups/public/get-invite?q=xyz \
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

## Get users

`GET` /api/groups/users/:id

```shell
#shell command:
curl \
http://localhost:8002/api/groups/users/:id?q=xyz \
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
http://localhost:8002/api/hl7messages/?q=xyz \
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

## Get by id

`GET` /api/insurances/:id

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/:id?q=xyz \
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

## Get coverage

`GET` /api/insurances/:id/coverage

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/:id/coverage?q=xyz \
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

## Get payers

`GET` /api/insurances/payers

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/payers?q=xyz \
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

## Get payers

`GET` /api/insurances/payers/:id

```shell
#shell command:
curl \
http://localhost:8002/api/insurances/payers/:id?q=xyz \
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

## Get by id

`GET` /api/integratorClients/:id

```shell
#shell command:
curl \
http://localhost:8002/api/integratorClients/:id?q=xyz \
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

## Get integrators

`GET` /api/integrators/

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/?q=xyz \
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

## Get by id

`GET` /api/integrators/:id

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/:id?q=xyz \
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

## Get admin

`GET` /api/integrators/admin

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/admin?q=xyz \
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

## Get configuration

`GET` /api/integrators/configuration

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/configuration?q=xyz \
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

## Get configuration

`GET` /api/integrators/configuration/:integrator

```shell
#shell command:
curl \
http://localhost:8002/api/integrators/configuration/:integrator?q=xyz \
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

## Get reports/xls

`GET` /api/messages-errors/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/messages-errors/reports/xls?q=xyz \
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

`GET` /api/messages/:id

```shell
#shell command:
curl \
http://localhost:8002/api/messages/:id?q=xyz \
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

## Get crudList

`GET` /api/messages/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/messages/crudList?q=xyz \
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

## Get offers

`GET` /api/offers/

```shell
#shell command:
curl \
http://localhost:8002/api/offers/?q=xyz \
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

## Get by id

`GET` /api/offers/:id

```shell
#shell command:
curl \
http://localhost:8002/api/offers/:id?q=xyz \
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

## Get waitlists

`GET` /api/offers/:id/waitlists

```shell
#shell command:
curl \
http://localhost:8002/api/offers/:id/waitlists?q=xyz \
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

## Get crudList

`GET` /api/offers/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/offers/crudList?q=xyz \
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

## Get findByPatientId

`GET` /api/offers/findByPatientId/:id

```shell
#shell command:
curl \
http://localhost:8002/api/offers/findByPatientId/:id?q=xyz \
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

## Get reports/find

`GET` /api/offers/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/offers/reports/find?q=xyz \
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

## Get reports/summary

`GET` /api/offers/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/offers/reports/summary?q=xyz \
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

## Get by id

`GET` /api/organizations/:id

```shell
#shell command:
curl \
http://localhost:8002/api/organizations/:id?q=xyz \
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

## Get access

`GET` /api/organizations/:id/access

```shell
#shell command:
curl \
http://localhost:8002/api/organizations/:id/access?q=xyz \
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

## Get users

`GET` /api/organizations/:id/users

```shell
#shell command:
curl \
http://localhost:8002/api/organizations/:id/users?q=xyz \
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

## Get by id

`GET` /api/patientForms/:id

```shell
#shell command:
curl \
http://localhost:8002/api/patientForms/:id?q=xyz \
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

## Get pdf

`GET` /api/patientForms/:id/pdf

```shell
#shell command:
curl \
http://localhost:8002/api/patientForms/:id/pdf?q=xyz \
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

## Get by id

`GET` /api/patientFormTemplates/:id

```shell
#shell command:
curl \
http://localhost:8002/api/patientFormTemplates/:id?q=xyz \
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

## Get patientMessageTemplates

`GET` /api/patientMessageTemplates/

```shell
#shell command:
curl \
http://localhost:8002/api/patientMessageTemplates/?q=xyz \
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

## Get by id

`GET` /api/patientMessageTemplates/:id

```shell
#shell command:
curl \
http://localhost:8002/api/patientMessageTemplates/:id?q=xyz \
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

## Get patients

`GET` /api/patients/

```shell
#shell command:
curl \
http://localhost:8002/api/patients/?q=xyz \
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

## Get by id

`GET` /api/patients/:id

```shell
#shell command:
curl \
http://localhost:8002/api/patients/:id?q=xyz \
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

## Get doNotContact

`GET` /api/patients/:id/doNotContact

```shell
#shell command:
curl \
http://localhost:8002/api/patients/:id/doNotContact?q=xyz \
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

## Get journey

`GET` /api/patients/:id/journey

```shell
#shell command:
curl \
http://localhost:8002/api/patients/:id/journey?q=xyz \
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

## Get provider

`GET` /api/patients/:id/provider

```shell
#shell command:
curl \
http://localhost:8002/api/patients/:id/provider?q=xyz \
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

## Get crudList

`GET` /api/patients/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/patients/crudList?q=xyz \
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

## Get recent

`GET` /api/patients/recent

```shell
#shell command:
curl \
http://localhost:8002/api/patients/recent?q=xyz \
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

## Get reports

`GET` /api/patients/reports

```shell
#shell command:
curl \
http://localhost:8002/api/patients/reports?q=xyz \
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

## Get reports/do-not-contact/xls

`GET` /api/patients/reports/do-not-contact/xls

```shell
#shell command:
curl \
http://localhost:8002/api/patients/reports/do-not-contact/xls?q=xyz \
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

`GET` /api/patients/search

```shell
#shell command:
curl \
http://localhost:8002/api/patients/search?q=xyz \
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

## Get providers

`GET` /api/providers/

```shell
#shell command:
curl \
http://localhost:8002/api/providers/?q=xyz \
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

## Get by id

`GET` /api/providers/:id

```shell
#shell command:
curl \
http://localhost:8002/api/providers/:id?q=xyz \
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

## Get waitlists

`GET` /api/providers/:id/waitlists

```shell
#shell command:
curl \
http://localhost:8002/api/providers/:id/waitlists?q=xyz \
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

## Get crudList

`GET` /api/providers/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/providers/crudList?q=xyz \
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

## Get hidden

`GET` /api/providers/hidden

```shell
#shell command:
curl \
http://localhost:8002/api/providers/hidden?q=xyz \
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

## Get npi/search

`GET` /api/providers/npi/search

```shell
#shell command:
curl \
http://localhost:8002/api/providers/npi/search?q=xyz \
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

## Get referring

`GET` /api/providers/referring

```shell
#shell command:
curl \
http://localhost:8002/api/providers/referring?q=xyz \
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

## Get referring/referrals

`GET` /api/providers/referring/:id/referrals

```shell
#shell command:
curl \
http://localhost:8002/api/providers/referring/:id/referrals?q=xyz \
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

## Get search

`GET` /api/providers/search

```shell
#shell command:
curl \
http://localhost:8002/api/providers/search?q=xyz \
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

## Post referral

`POST` /api/referrals/

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/referrals/?q=xyz \
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

`GET` /api/referrals/:id

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/:id?q=xyz \
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

## Put by id

`PUT` /api/referrals/:id

```shell
#shell command:
curl -X PUT \
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

## Get count

`GET` /api/referrals/count

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/count?q=xyz \
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

## Get crudList

`GET` /api/referrals/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/crudList?q=xyz \
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

## Get reports/find

`GET` /api/referrals/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/reports/find?q=xyz \
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

## Get reports/summary

`GET` /api/referrals/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/reports/summary?q=xyz \
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

## Get reports/xls

`GET` /api/referrals/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/reports/xls?q=xyz \
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

`GET` /api/referrals/search

```shell
#shell command:
curl \
http://localhost:8002/api/referrals/search?q=xyz \
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

`GET` /api/reminders/:id

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/:id?q=xyz \
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

## Get crudList

`GET` /api/reminders/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/crudList?q=xyz \
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

## Get findByApptId

`GET` /api/reminders/findByApptId/:id

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/findByApptId/:id?q=xyz \
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

## Get findByPatientId

`GET` /api/reminders/findByPatientId/:id

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/findByPatientId/:id?q=xyz \
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

## Get reports/find

`GET` /api/reminders/reports/find

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/reports/find?q=xyz \
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

## Get reports/summary

`GET` /api/reminders/reports/summary

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/reports/summary?q=xyz \
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

## Get reports/xls

`GET` /api/reminders/reports/xls

```shell
#shell command:
curl \
http://localhost:8002/api/reminders/reports/xls?q=xyz \
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

## Get availabilities/count

`GET` /api/scheduler/availabilities/count

```shell
#shell command:
curl \
http://localhost:8002/api/scheduler/availabilities/count?q=xyz \
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

## Get by id

`GET` /api/settings/:id

```shell
#shell command:
curl \
http://localhost:8002/api/settings/:id?q=xyz \
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

## Get services

`GET` /api/status/services/:serviceName

```shell
#shell command:
curl \
http://localhost:8002/api/status/services/:serviceName?q=xyz \
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

## Get uploads

`GET` /api/uploads/

```shell
#shell command:
curl \
http://localhost:8002/api/uploads/?q=xyz \
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

## Get by id

`GET` /api/uploads/:id

```shell
#shell command:
curl \
http://localhost:8002/api/uploads/:id?q=xyz \
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

## Get users

`GET` /api/users/

```shell
#shell command:
curl \
http://localhost:8002/api/users/?q=xyz \
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

## Get by id

`GET` /api/users/:id

```shell
#shell command:
curl \
http://localhost:8002/api/users/:id?q=xyz \
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

## Get groupInvites

`GET` /api/users/:id/groupInvites

```shell
#shell command:
curl \
http://localhost:8002/api/users/:id/groupInvites?q=xyz \
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

## Get resetPasswordLink

`GET` /api/users/:id/resetPasswordLink

```shell
#shell command:
curl \
http://localhost:8002/api/users/:id/resetPasswordLink?q=xyz \
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

## Post admin

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

> The above command returns JSON of a [User type](#user), containing the access token: 

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
:token | xxx

Request headers | Description 
-------------- | ----------- 
x-access-token | JWT auth access token

Response body param | Description 
-------------- | ----------- 
xxx | yyy

## Post signup

`POST` /api/users/signup

```shell
#shell command:
curl -X POST \
http://localhost:8002/api/users/signup?q=xyz \
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

`GET` /api/waitlists/:id

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/:id?q=xyz \
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

## Get cancelOffer

`GET` /api/waitlists/cancelOffer/:id

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/cancelOffer/:id?q=xyz \
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

## Get confirmOffer

`GET` /api/waitlists/confirmOffer/:id

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/confirmOffer/:id?q=xyz \
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

## Get count

`GET` /api/waitlists/count

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/count?q=xyz \
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

## Get crudList

`GET` /api/waitlists/crudList

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/crudList?q=xyz \
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

## Get declineOffer

`GET` /api/waitlists/declineOffer/:id

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/declineOffer/:id?q=xyz \
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

## Get filter

`GET` /api/waitlists/filter

```shell
#shell command:
curl \
http://localhost:8002/api/waitlists/filter?q=xyz \
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

## Get user

`GET` /api/widgets/user

```shell
#shell command:
curl \
http://localhost:8002/api/widgets/user?q=xyz \
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

# Types

## AppointmentType

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
name|Type: String, Required: yes
description|Type: String, Required: no
duration|Type: Number, Required: no
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
visible|Type: Boolean, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
deleted|Type: Number, Required: yes
setting|Type: ObjectID, Required: no, Referencing: [Setting](#setting)
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Appointment

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
provider|Type: ObjectID, Required: no, Referencing: [User](#user)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
type|Type: ObjectID, Required: no, Referencing: [AppointmentType](#appointmenttype)
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
source|Type: String, Required: yes, Possible values: ["sync","manual"]
statusSource|Type: String, Required: no, Possible values: ["integrator","reminder","ui","waitlist"]
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
secondaryExternalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
secondaryExternalId.value|Type: String, Required: no
status|Type: String, Required: yes, Possible values: ["unconfirmed","confirmed","cancelled"]
statusReason|Type: String, Required: no, Possible values: [null,"noshow","arrived","by-offer"]
notes|Type: String, Required: no
date|Type: Date, Required: yes
endDate|Type: Date, Required: no
duration|Type: Number, Required: no
stats.counters.remindersSent|Type: Number, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
integratorUpdateResults.status|Type: String, Required: no, Possible values: ["success","failure","pending"]
integratorUpdateResults.error|Type: String, Required: no
external.createdAt|Type: Date, Required: no
external.updatedAt|Type: Date, Required: no
cancelledAt|Type: Date, Required: no
confirmedAt|Type: Date, Required: no
createdFromReferral|Type: ObjectID, Required: no, Referencing: [Referral](#referral)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Appointment

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
provider|Type: ObjectID, Required: no, Referencing: [User](#user)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
type|Type: ObjectID, Required: no, Referencing: [AppointmentType](#appointmenttype)
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
source|Type: String, Required: yes, Possible values: ["sync","manual"]
statusSource|Type: String, Required: no, Possible values: ["integrator","reminder","ui","waitlist"]
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
secondaryExternalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
secondaryExternalId.value|Type: String, Required: no
status|Type: String, Required: yes, Possible values: ["unconfirmed","confirmed","cancelled"]
statusReason|Type: String, Required: no, Possible values: [null,"noshow","arrived","by-offer"]
notes|Type: String, Required: no
date|Type: Date, Required: yes
endDate|Type: Date, Required: no
duration|Type: Number, Required: no
stats.counters.remindersSent|Type: Number, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
integratorUpdateResults.status|Type: String, Required: no, Possible values: ["success","failure","pending"]
integratorUpdateResults.error|Type: String, Required: no
external.createdAt|Type: Date, Required: no
external.updatedAt|Type: Date, Required: no
cancelledAt|Type: Date, Required: no
confirmedAt|Type: Date, Required: no
createdFromReferral|Type: ObjectID, Required: no, Referencing: [Referral](#referral)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Availability

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
date|Type: Date, Required: yes
endDate|Type: Date, Required: no
duration|Type: Number, Required: yes
status|Type: String, Required: yes, Possible values: ["available","booked-pending","offered","booked","booked-by-integrator","booked-by-offer","expired"]
source|Type: String, Required: yes, Possible values: ["appointment-cancellation","ui","referral","integrator"]
createdFromAppointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
usedForAppointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
filters.appointmentTypes|Type: Array, Required: no
filters.facilities|Type: Array, Required: no
filters.providers|Type: Array, Required: no
appointmentType|Type: ObjectID, Required: no, Referencing: [AppointmentType](#appointmenttype)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
provider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Broadcast

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
message|Type: String, Required: yes
patients|Type: Array, Required: no
filterResults|Type: undefined, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
approvedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
declinedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
sentAt|Type: Date, Required: no
sendAt|Type: Date, Required: no
status|Type: String, Required: no, Possible values: ["pending","scheduled","accepted","declined","expired","failed","skipped"]
declinedReason|Type: String, Required: no
deleted|Type: Number, Required: yes
upload|Type: ObjectID, Required: no, Referencing: [Upload](#upload)
title|Type: String, Required: no
filters|Type: Mixed, Required: no
createdFromBroadcast|Type: ObjectID, Required: no, Referencing: [Broadcast](#broadcast)
patientMessageTemplate|Type: ObjectID, Required: no, Referencing: [PatientMessageTemplate](#patientmessagetemplate)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Broadcast

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
message|Type: String, Required: yes
patients|Type: Array, Required: no
filterResults|Type: undefined, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
approvedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
declinedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
sentAt|Type: Date, Required: no
sendAt|Type: Date, Required: no
status|Type: String, Required: no, Possible values: ["pending","scheduled","accepted","declined","expired","failed","skipped"]
declinedReason|Type: String, Required: no
deleted|Type: Number, Required: yes
upload|Type: ObjectID, Required: no, Referencing: [Upload](#upload)
title|Type: String, Required: no
filters|Type: Mixed, Required: no
createdFromBroadcast|Type: ObjectID, Required: no, Referencing: [Broadcast](#broadcast)
patientMessageTemplate|Type: ObjectID, Required: no, Referencing: [PatientMessageTemplate](#patientmessagetemplate)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## ChatActivity

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
to|Type: ObjectID, Required: no, Referencing: [User](#user)
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
lastMessage|Type: ObjectID, Required: yes, Referencing: [Message](#message)
unreadMessages|Type: Number, Required: yes
status|Type: String, Required: no, Possible values: ["pending","closed","assigned"]
assignee|Type: ObjectID, Required: no, Referencing: [User](#user)
previousAssignee|Type: ObjectID, Required: no, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Diagnosis

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
icd10|Type: String, Required: no
icd9|Type: String, Required: no
description|Type: String, Required: no
date|Type: Date, Required: no
endDate|Type: Date, Required: no
appointment|Type: Mixed, Required: no, Referencing: [Appointment](#appointment)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Diagnosis

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
icd10|Type: String, Required: no
icd9|Type: String, Required: no
description|Type: String, Required: no
date|Type: Date, Required: no
endDate|Type: Date, Required: no
appointment|Type: Mixed, Required: no, Referencing: [Appointment](#appointment)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Facility

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
name|Type: String, Required: yes
alternativeName|Type: String, Required: no
phonetic|Type: String, Required: no
address|Type: String, Required: yes
city|Type: String, Required: yes
state|Type: String, Required: yes
country|Type: String, Required: yes
postcode|Type: String, Required: yes
phone|Type: String, Required: no
alternativePhone|Type: String, Required: no
visible|Type: Boolean, Required: yes
integrator|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
externalId.value|Type: String, Required: no
setting|Type: ObjectID, Required: no, Referencing: [Setting](#setting)
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
deleted|Type: Number, Required: yes
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## FeedbackResponse

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
provider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
response.type|Type: String, Required: yes, Possible values: ["npsscore","positive-click","negative-click"]
response.value|Type: Mixed, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## FeedbackResponse

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
provider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
response.type|Type: String, Required: yes, Possible values: ["npsscore","positive-click","negative-click"]
response.value|Type: Mixed, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## FileMapping

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
integrator|Type: String, Required: yes, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
type|Type: String, Required: yes, Possible values: ["appointment","patient","referral"]
mapping|Type: Mixed, Required: yes
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## FileUpload

Attribute|Description
----|----
bucket|Type: String, Required: no
awsId|Type: String, Required: no
name|Type: String, Required: yes
extension|Type: String, Required: yes
contentType|Type: String, Required: yes
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Followup

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
title|Type: String, Required: no
model|Type: String, Required: yes, Possible values: ["recall","appointment","referral","message","offer","waitlist","feedbackResponse","diagnosis","procedure"]
operation|Type: String, Required: yes, Possible values: ["created","deleted","updated"]
filters|Type: undefined, Required: no
action|Type: String, Required: yes, Possible values: ["send-message","alert-staff","start-bot","https-webhook"]
actionAt|Type: Number, Required: yes
actionAtAnchor|Type: String, Required: yes, Possible values: ["operation","object-date"]
webhook|Type: String, Required: no
bot|Type: String, Required: no, Possible values: ["bot:followup","bot:referral","bot:jenna"]
template|Type: String, Required: yes
type|Type: String, Required: yes
group|Type: String, Required: no
secure|Type: Boolean, Required: yes
forceCommunicationAs|Type: String, Required: no, Possible values: ["none","sms","voice"]
delay|Type: Number, Required: no
stats.counters.actionMatched|Type: Number, Required: no
enabled|Type: Boolean, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## GroupInvite

Attribute|Description
----|----
group|Type: ObjectID, Required: yes, Referencing: [Group](#group)
invitedUser|Type: ObjectID, Required: no, Referencing: [User](#user)
userId|Type: ObjectID, Required: no, Referencing: [User](#user)
email|Type: String, Required: yes
url|Type: String, Required: no
roles|Type: Array, Required: no
user|Type: ObjectID, Required: no, Referencing: [User](#user)
status|Type: String, Required: yes, Possible values: ["pending","accepted","declined","expired"]
invitesSent|Type: Number, Required: no
sentAt|Type: Date, Required: no
token|Type: String, Required: yes
expiresAt|Type: Date, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: no, Referencing: [User](#user)
deleted|Type: Number, Required: no
updatedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Group

Attribute|Description
----|----
name|Type: String, Required: yes
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
type|Type: String, Required: no, Possible values: ["user","system"]
users|Type: Array, Required: no
facilities|Type: Array, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
deleted|Type: Number, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Group

Attribute|Description
----|----
name|Type: String, Required: yes
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
type|Type: String, Required: no, Possible values: ["user","system"]
users|Type: Array, Required: no
facilities|Type: Array, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
deleted|Type: Number, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## hl7messages

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
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
sender|Type: String, Required: no
senderName|Type: String, Required: no
patient|Type: ObjectID, Required: no, Referencing: [User](#user)
recipient|Type: ObjectID, Required: yes, Referencing: [User](#user)
recipientType|Type: String, Required: yes, Possible values: ["staff","patient","doctor"]
channel|Type: String, Required: yes, Possible values: ["sms","email","voice","chat","fax"]
contact|Type: String, Required: no
template|Type: String, Required: yes
context|Type: Mixed, Required: no
callbackQueue|Type: String, Required: no
status|Type: String, Required: no, Possible values: ["sent","received","delivered","undelivered"]
statusReason|Type: String, Required: no
ref|Type: String, Required: yes, Possible values: ["reminder","appointment-offer","waitlist","waitlist-offer","generic","feedback-reminder","feedback","stop","referral-reminder","referral-followup","broadcast","chat","chat-notification","pin-verification","followup","bot:followup","referral-redirect","form-reminder"]
refId|Type: ObjectID, Required: no
cbUrl|Type: String, Required: no
secure|Type: Boolean, Required: no
visibility|Type: String, Required: yes, Possible values: ["public","private","internal"]
text|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Insurance

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
planName|Type: String, Required: no
memberName|Type: String, Required: yes
memberNumber|Type: String, Required: no
insuranceGroupName|Type: String, Required: no
url|Type: String, Required: no
urlBack|Type: String, Required: no
fileUpload|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
fileUploadBack|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
active|Type: Boolean, Required: yes
status|Type: String, Required: no, Possible values: ["archived","active"]
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
payerId|Type: String, Required: no
verification.status|Type: String, Required: no, Possible values: ["unknown","active","inactive"]
verification.updatedAt|Type: Date, Required: no
verification.requestedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
verification.lookupResults|Type: Mixed, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## IntegratorClient

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
name|Type: String, Required: yes
version|Type: String, Required: no
secret|Type: String, Required: yes
enabled|Type: Boolean, Required: yes
status|Type: String, Required: yes, Possible values: ["connected","disconnected","needs-heartbeat"]
state|Type: String, Required: yes, Possible values: ["uninstalled","installed","updating"]
lastHeartbeat|Type: Date, Required: no
lastRecycleAttempt|Type: Date, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## integrator

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
type|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
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

## Logins

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## MessageError

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
type|Type: String, Required: yes, Possible values: ["reminder","appointment-offer","waitlist","waitlist-offer","generic","feedback-reminder","feedback","stop","referral-reminder","referral-followup","broadcast","chat","chat-notification","pin-verification","followup","bot:followup","referral-redirect","form-reminder"]
message|Type: ObjectID, Required: no, Referencing: [Message](#message)
error|Type: String, Required: yes
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
patient|Type: ObjectID, Required: no, Referencing: [User](#user)
waitlist|Type: ObjectID, Required: no, Referencing: [Waitlist](#waitlist)
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: no
channel|Type: String, Required: no, Possible values: ["sms","email","voice","inapp","chat","fax"]
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## MessageRequest

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
sender|Type: String, Required: no
senderName|Type: String, Required: no
patient|Type: ObjectID, Required: no, Referencing: [User](#user)
recipient|Type: ObjectID, Required: yes, Referencing: [User](#user)
recipientType|Type: String, Required: yes, Possible values: ["staff","patient","doctor"]
channel|Type: String, Required: no, Possible values: ["sms","email","voice","inapp","chat","fax"]
contact|Type: String, Required: no
template|Type: String, Required: yes
context|Type: Mixed, Required: no
callbackQueue|Type: String, Required: no
status|Type: String, Required: no, Possible values: ["sent","received","delivered","undelivered"]
statusReason|Type: String, Required: no
ref|Type: String, Required: yes, Possible values: ["reminder","appointment-offer","waitlist","waitlist-offer","generic","feedback-reminder","feedback","stop","referral-reminder","referral-followup","broadcast","chat","chat-notification","pin-verification","followup","bot:followup","referral-redirect","form-reminder"]
refId|Type: ObjectID, Required: no
cbUrl|Type: String, Required: no
secure|Type: Boolean, Required: no
visibility|Type: String, Required: yes, Possible values: ["public","private","internal"]
text|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## MessageTemplate

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
key|Type: String, Required: yes
language|Type: String, Required: yes, Possible values: ["es","en","vi","am","fa","ko","ru","zh-t","zh-s","zh","pt","ar"]
template|Type: String, Required: yes
layout|Type: String, Required: no
subject|Type: String, Required: no
title|Type: String, Required: no
type|Type: Array, Required: no
answers|Type: undefined, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Message

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
patient|Type: ObjectID, Required: no, Referencing: [User](#user)
key|Type: String, Required: no
from|Type: String, Required: no
to|Type: String, Required: no
type|Type: String, Required: yes, Possible values: ["inbound","outbound"]
ref|Type: String, Required: yes, Possible values: ["reminder","appointment-offer","waitlist","waitlist-offer","generic","feedback-reminder","feedback","stop","referral-reminder","referral-followup","broadcast","chat","chat-notification","pin-verification","followup","bot:followup","referral-redirect","form-reminder"]
refId|Type: ObjectID, Required: no
status|Type: String, Required: no, Possible values: ["sent","delivered","undelivered","pending","received"]
statusReason|Type: String, Required: no
channel|Type: String, Required: yes, Possible values: ["sms","email","voice","inapp","chat","fax"]
text|Type: String, Required: yes
classification|Type: String, Required: no, Possible values: ["positive","negative","irregular","recognized-keywords","unclassified"]
externalId.source|Type: String, Required: no, Possible values: ["mandrill","twilio","nexmo","sendgrid","plivo","bandwidth"]
externalId.value|Type: String, Required: no
secure|Type: Boolean, Required: yes
visibility|Type: String, Required: yes, Possible values: ["public","private","internal"]
file|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
media.url|Type: String, Required: no
media.contentType|Type: String, Required: no
stats.timers.elapsedReplyTime|Type: Number, Required: no
retry.from|Type: ObjectID, Required: no, Referencing: [Message](#message)
retry.count|Type: Number, Required: no
retry.required|Type: Mixed, Required: no
deleted|Type: Number, Required: no
createdAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
mentions|Type: undefined, Required: no
recipient|Type: ObjectID, Required: no, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Message

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
patient|Type: ObjectID, Required: no, Referencing: [User](#user)
key|Type: String, Required: no
from|Type: String, Required: no
to|Type: String, Required: no
type|Type: String, Required: yes, Possible values: ["inbound","outbound"]
ref|Type: String, Required: yes, Possible values: ["reminder","appointment-offer","waitlist","waitlist-offer","generic","feedback-reminder","feedback","stop","referral-reminder","referral-followup","broadcast","chat","chat-notification","pin-verification","followup","bot:followup","referral-redirect","form-reminder"]
refId|Type: ObjectID, Required: no
status|Type: String, Required: no, Possible values: ["sent","delivered","undelivered","pending","received"]
statusReason|Type: String, Required: no
channel|Type: String, Required: yes, Possible values: ["sms","email","voice","inapp","chat","fax"]
text|Type: String, Required: yes
classification|Type: String, Required: no, Possible values: ["positive","negative","irregular","recognized-keywords","unclassified"]
externalId.source|Type: String, Required: no, Possible values: ["mandrill","twilio","nexmo","sendgrid","plivo","bandwidth"]
externalId.value|Type: String, Required: no
secure|Type: Boolean, Required: yes
visibility|Type: String, Required: yes, Possible values: ["public","private","internal"]
file|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
media.url|Type: String, Required: no
media.contentType|Type: String, Required: no
stats.timers.elapsedReplyTime|Type: Number, Required: no
retry.from|Type: ObjectID, Required: no, Referencing: [Message](#message)
retry.count|Type: Number, Required: no
retry.required|Type: Mixed, Required: no
deleted|Type: Number, Required: no
createdAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
mentions|Type: undefined, Required: no
recipient|Type: ObjectID, Required: no, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Notification

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
to|Type: ObjectID, Required: no, Referencing: [User](#user)
message|Type: String, Required: yes
read|Type: Number, Required: yes
data.patient|Type: ObjectID, Required: no, Referencing: [User](#user)
data.appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
data.offer|Type: ObjectID, Required: no, Referencing: [Offer](#offer)
data.referral|Type: ObjectID, Required: no, Referencing: [Referral](#referral)
data.broadcast|Type: ObjectID, Required: no, Referencing: [Broadcast](#broadcast)
template|Type: String, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Offer

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
provider|Type: ObjectID, Required: no, Referencing: [User](#user)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
date|Type: Date, Required: no
duration|Type: Number, Required: no
waitlists|Type: Array, Required: no
appointmentType|Type: Array, Required: no
source|Type: String, Required: yes, Possible values: ["cancellation","manual","find-open-spots","self-scheduling","reschedule"]
status|Type: String, Required: yes, Possible values: ["in-progress","patient-found","patient-not-found","cancelled"]
integratorCreationResults.status|Type: String, Required: no, Possible values: ["success","failure","pending"]
integratorCreationResults.errors|Type: String, Required: no
approvedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
declinedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
currentWaitlist|Type: Number, Required: yes
expireAt|Type: Date, Required: no
patientFoundAt|Type: Date, Required: no
patientFound|Type: ObjectID, Required: no, Referencing: [Patient](#patient)
estimatedCompletionAt|Type: Date, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
shadowAppointment|Type: String, Required: no
availability|Type: ObjectID, Required: no, Referencing: [Availability](#availability)
protocol|Type: String, Required: no, Possible values: ["serial","parallel"]
deleted|Type: Number, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Offer

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
provider|Type: ObjectID, Required: no, Referencing: [User](#user)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
date|Type: Date, Required: no
duration|Type: Number, Required: no
waitlists|Type: Array, Required: no
appointmentType|Type: Array, Required: no
source|Type: String, Required: yes, Possible values: ["cancellation","manual","find-open-spots","self-scheduling","reschedule"]
status|Type: String, Required: yes, Possible values: ["in-progress","patient-found","patient-not-found","cancelled"]
integratorCreationResults.status|Type: String, Required: no, Possible values: ["success","failure","pending"]
integratorCreationResults.errors|Type: String, Required: no
approvedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
declinedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
currentWaitlist|Type: Number, Required: yes
expireAt|Type: Date, Required: no
patientFoundAt|Type: Date, Required: no
patientFound|Type: ObjectID, Required: no, Referencing: [Patient](#patient)
estimatedCompletionAt|Type: Date, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
shadowAppointment|Type: String, Required: no
availability|Type: ObjectID, Required: no, Referencing: [Availability](#availability)
protocol|Type: String, Required: no, Possible values: ["serial","parallel"]
deleted|Type: Number, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## OrganizationUsers

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
organization|Type: ObjectID, Required: yes, Referencing: [Organization](#organization)
organizationUser|Type: ObjectID, Required: yes, Referencing: [User](#user)
invitedUser|Type: ObjectID, Required: yes, Referencing: [User](#user)
impersonatedUser|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: yes
updatedAt|Type: Date, Required: yes
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Organization

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
name|Type: String, Required: yes
description|Type: String, Required: no
users|Type: Array, Required: no
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## OutboundMessageRequest

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
sender|Type: String, Required: no
senderName|Type: String, Required: no
patient|Type: ObjectID, Required: no, Referencing: [User](#user)
recipient|Type: ObjectID, Required: yes, Referencing: [User](#user)
recipientType|Type: String, Required: yes, Possible values: ["staff","patient","doctor"]
channel|Type: String, Required: yes, Possible values: ["sms","email","voice","inapp","chat","fax"]
contact|Type: String, Required: no
template|Type: String, Required: yes
context|Type: Mixed, Required: no
callbackQueue|Type: String, Required: no
status|Type: String, Required: no, Possible values: ["sent","received","delivered","undelivered"]
statusReason|Type: String, Required: no
ref|Type: String, Required: yes, Possible values: ["reminder","appointment-offer","waitlist","waitlist-offer","generic","feedback-reminder","feedback","stop","referral-reminder","referral-followup","broadcast","chat","chat-notification","pin-verification","followup","bot:followup","referral-redirect","form-reminder"]
refId|Type: ObjectID, Required: no
cbUrl|Type: String, Required: no
secure|Type: Boolean, Required: no
visibility|Type: String, Required: yes, Possible values: ["public","private","internal"]
text|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## PatientFormTemplate

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
externalId.source|Type: String, Required: no, Possible values: ["docusign","hellosign","surveymonkey","luma"]
externalId.value|Type: String, Required: no
title|Type: String, Required: no
insurance.enabled|Type: Boolean, Required: no
insurance.required|Type: Mixed, Required: no
reminder.enabled|Type: Boolean, Required: no
reminder.required|Type: Mixed, Required: no
active|Type: Boolean, Required: no
url|Type: String, Required: no
tag|Type: String, Required: no
template|Type: Mixed, Required: no
integratorMapping|Type: undefined, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## PatientForm

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
fileUpload|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
patientFormTemplate|Type: ObjectID, Required: yes, Referencing: [PatientFormTemplate](#patientformtemplate)
responses|Type: Mixed, Required: no
answers|Type: Mixed, Required: no
status|Type: String, Required: no, Possible values: ["started","completed"]
duration|Type: Number, Required: no
url|Type: String, Required: no
integratorUpdateResults.status|Type: String, Required: no, Possible values: ["success","failure","pending"]
integratorUpdateResults.error|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## patientMessageTemplate

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
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
isSubscribed|Type: Boolean, Required: no
subscriber|Type: ObjectID, Required: yes, Referencing: [User](#user)
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Patient

Attribute|Description
----|----
preferedLanguage|Type: String, Required: no
stats.counters.messagesSentToPatient|Type: Number, Required: no
stats.counters.confirmedAppointments|Type: Number, Required: no
stats.counters.cancelledAppointments|Type: Number, Required: no
stats.counters.offersSent|Type: Number, Required: no
stats.counters.offersAccepted|Type: Number, Required: no
stats.counters.appointmentOffersReplied|Type: Number, Required: no
stats.average.appointmentOfferReplyTime|Type: Number, Required: no
lastProcessedAt|Type: Date, Required: no
source|Type: String, Required: no, Possible values: ["widget","integrator","ui","referring-provider"]
mergedInto|Type: ObjectID, Required: no, Referencing: [Patient](#patient)
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
subscribers|Type: undefined, Required: no
outboundContact|Type: undefined, Required: no
_id|Type: ObjectID, Required: no
name|Type: String, Required: no
firstname|Type: String, Required: no
lastname|Type: String, Required: no
middlename|Type: String, Required: no
email|Type: String, Required: no
password|Type: String, Required: no
passwordHashAlgorithm|Type: String, Required: no, Possible values: ["md5","sha256","sha512","bcrypt"]
passwordUpdatedAt|Type: Date, Required: no
safeId|Type: String, Required: no
resetPasswordToken|Type: String, Required: no
resetPasswordExpires|Type: Date, Required: no
type|Type: String, Required: yes, Possible values: ["doctor","staff","patient"]
roles|Type: Array, Required: no
organization|Type: ObjectID, Required: no, Referencing: [Organization](#organization)
contact|Type: undefined, Required: no
doNotContact|Type: Boolean, Required: yes
doNotContactMessage|Type: ObjectID, Required: no, Referencing: [Message](#message)
groups|Type: Array, Required: no
stripeCustomerId|Type: String, Required: no
stripeSubscriptionId|Type: String, Required: no
salesforceId|Type: String, Required: no
salesforceData.provisioning|Type: Array, Required: no
salesforceData.respectProvisioning|Type: Boolean, Required: no
salesforceData.lifeline|Type: String, Required: no, Possible values: ["trial","converted","active","churn"]
salesforceData.mrr|Type: Number, Required: no
salesforceData.renewalDate|Type: Date, Required: no
salesforceData.providers|Type: Number, Required: no
salesforceData.specialty|Type: String, Required: no
salesforceData.referralTrialLimit|Type: Number, Required: no
salesforceData.recordType|Type: String, Required: no
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
lastLogin|Type: Date, Required: no
token|Type: String, Required: yes
active|Type: Number, Required: yes
master|Type: Boolean, Required: no
language|Type: String, Required: no
user|Type: ObjectID, Required: no, Referencing: [User](#user)
setting|Type: ObjectID, Required: no, Referencing: [Setting](#setting)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
externalId.value|Type: String, Required: no
secondaryExternalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
secondaryExternalId.value|Type: String, Required: no
dateOfBirth.year|Type: Number, Required: no
dateOfBirth.month|Type: Number, Required: no
dateOfBirth.day|Type: Number, Required: no
dateOfBirth.required|Type: Mixed, Required: no
address|Type: String, Required: no
city|Type: String, Required: no
state|Type: String, Required: no
country|Type: String, Required: yes
postcode|Type: String, Required: no
gender|Type: String, Required: yes, Possible values: ["male","female","unknown","nonbinary"]
passwordResetRequired|Type: Boolean, Required: no
twoFactorAuthSecret.key|Type: String, Required: no
twoFactorAuthSecret.period|Type: Number, Required: no
twoFactorAuthSecret.enabled|Type: Boolean, Required: no
twoFactorAuthSecret.backupCodes|Type: Array, Required: no
twoFactorAuthSecret.required|Type: Mixed, Required: no
allowedIps|Type: Array, Required: no
stats.oldestAppointment|Type: Date, Required: no
avatar|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
__v|Type: Number, Required: no
__t|Type: String, Required: no

## Procedures

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
cpt|Type: String, Required: yes
date|Type: Date, Required: no
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Procedures

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
cpt|Type: String, Required: yes
date|Type: Date, Required: no
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Provider

Attribute|Description
----|----
deptCode|Type: String, Required: no
phonetic|Type: String, Required: no
isReferringProvider|Type: Boolean, Required: no
visible|Type: Boolean, Required: yes
npi|Type: Number, Required: no
source|Type: String, Required: no, Possible values: ["upload","patient-referral-form","ui","integrator"]
createdBy|Type: ObjectID, Required: no, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
biography|Type: String, Required: no
biographyUrl|Type: String, Required: no
headshot|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
_id|Type: ObjectID, Required: no
name|Type: String, Required: no
firstname|Type: String, Required: no
lastname|Type: String, Required: no
middlename|Type: String, Required: no
email|Type: String, Required: no
password|Type: String, Required: no
passwordHashAlgorithm|Type: String, Required: no, Possible values: ["md5","sha256","sha512","bcrypt"]
passwordUpdatedAt|Type: Date, Required: no
safeId|Type: String, Required: no
resetPasswordToken|Type: String, Required: no
resetPasswordExpires|Type: Date, Required: no
type|Type: String, Required: yes, Possible values: ["doctor","staff","patient"]
roles|Type: Array, Required: no
organization|Type: ObjectID, Required: no, Referencing: [Organization](#organization)
contact|Type: undefined, Required: no
doNotContact|Type: Boolean, Required: yes
doNotContactMessage|Type: ObjectID, Required: no, Referencing: [Message](#message)
groups|Type: Array, Required: no
stripeCustomerId|Type: String, Required: no
stripeSubscriptionId|Type: String, Required: no
salesforceId|Type: String, Required: no
salesforceData.provisioning|Type: Array, Required: no
salesforceData.respectProvisioning|Type: Boolean, Required: no
salesforceData.lifeline|Type: String, Required: no, Possible values: ["trial","converted","active","churn"]
salesforceData.mrr|Type: Number, Required: no
salesforceData.renewalDate|Type: Date, Required: no
salesforceData.providers|Type: Number, Required: no
salesforceData.specialty|Type: String, Required: no
salesforceData.referralTrialLimit|Type: Number, Required: no
salesforceData.recordType|Type: String, Required: no
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
lastLogin|Type: Date, Required: no
token|Type: String, Required: yes
active|Type: Number, Required: yes
master|Type: Boolean, Required: no
language|Type: String, Required: no
user|Type: ObjectID, Required: no, Referencing: [User](#user)
setting|Type: ObjectID, Required: no, Referencing: [Setting](#setting)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
externalId.value|Type: String, Required: no
secondaryExternalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
secondaryExternalId.value|Type: String, Required: no
dateOfBirth.year|Type: Number, Required: no
dateOfBirth.month|Type: Number, Required: no
dateOfBirth.day|Type: Number, Required: no
dateOfBirth.required|Type: Mixed, Required: no
address|Type: String, Required: no
city|Type: String, Required: no
state|Type: String, Required: no
country|Type: String, Required: yes
postcode|Type: String, Required: no
gender|Type: String, Required: yes, Possible values: ["male","female","unknown","nonbinary"]
passwordResetRequired|Type: Boolean, Required: no
twoFactorAuthSecret.key|Type: String, Required: no
twoFactorAuthSecret.period|Type: Number, Required: no
twoFactorAuthSecret.enabled|Type: Boolean, Required: no
twoFactorAuthSecret.backupCodes|Type: Array, Required: no
twoFactorAuthSecret.required|Type: Mixed, Required: no
allowedIps|Type: Array, Required: no
stats.oldestAppointment|Type: Date, Required: no
avatar|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
__v|Type: Number, Required: no
__t|Type: String, Required: no

## Provider

Attribute|Description
----|----
deptCode|Type: String, Required: no
phonetic|Type: String, Required: no
isReferringProvider|Type: Boolean, Required: no
visible|Type: Boolean, Required: yes
npi|Type: Number, Required: no
source|Type: String, Required: no, Possible values: ["upload","patient-referral-form","ui","integrator"]
createdBy|Type: ObjectID, Required: no, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
biography|Type: String, Required: no
biographyUrl|Type: String, Required: no
headshot|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
_id|Type: ObjectID, Required: no
name|Type: String, Required: no
firstname|Type: String, Required: no
lastname|Type: String, Required: no
middlename|Type: String, Required: no
email|Type: String, Required: no
password|Type: String, Required: no
passwordHashAlgorithm|Type: String, Required: no, Possible values: ["md5","sha256","sha512","bcrypt"]
passwordUpdatedAt|Type: Date, Required: no
safeId|Type: String, Required: no
resetPasswordToken|Type: String, Required: no
resetPasswordExpires|Type: Date, Required: no
type|Type: String, Required: yes, Possible values: ["doctor","staff","patient"]
roles|Type: Array, Required: no
organization|Type: ObjectID, Required: no, Referencing: [Organization](#organization)
contact|Type: undefined, Required: no
doNotContact|Type: Boolean, Required: yes
doNotContactMessage|Type: ObjectID, Required: no, Referencing: [Message](#message)
groups|Type: Array, Required: no
stripeCustomerId|Type: String, Required: no
stripeSubscriptionId|Type: String, Required: no
salesforceId|Type: String, Required: no
salesforceData.provisioning|Type: Array, Required: no
salesforceData.respectProvisioning|Type: Boolean, Required: no
salesforceData.lifeline|Type: String, Required: no, Possible values: ["trial","converted","active","churn"]
salesforceData.mrr|Type: Number, Required: no
salesforceData.renewalDate|Type: Date, Required: no
salesforceData.providers|Type: Number, Required: no
salesforceData.specialty|Type: String, Required: no
salesforceData.referralTrialLimit|Type: Number, Required: no
salesforceData.recordType|Type: String, Required: no
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
lastLogin|Type: Date, Required: no
token|Type: String, Required: yes
active|Type: Number, Required: yes
master|Type: Boolean, Required: no
language|Type: String, Required: no
user|Type: ObjectID, Required: no, Referencing: [User](#user)
setting|Type: ObjectID, Required: no, Referencing: [Setting](#setting)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
externalId.value|Type: String, Required: no
secondaryExternalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
secondaryExternalId.value|Type: String, Required: no
dateOfBirth.year|Type: Number, Required: no
dateOfBirth.month|Type: Number, Required: no
dateOfBirth.day|Type: Number, Required: no
dateOfBirth.required|Type: Mixed, Required: no
address|Type: String, Required: no
city|Type: String, Required: no
state|Type: String, Required: no
country|Type: String, Required: yes
postcode|Type: String, Required: no
gender|Type: String, Required: yes, Possible values: ["male","female","unknown","nonbinary"]
passwordResetRequired|Type: Boolean, Required: no
twoFactorAuthSecret.key|Type: String, Required: no
twoFactorAuthSecret.period|Type: Number, Required: no
twoFactorAuthSecret.enabled|Type: Boolean, Required: no
twoFactorAuthSecret.backupCodes|Type: Array, Required: no
twoFactorAuthSecret.required|Type: Mixed, Required: no
allowedIps|Type: Array, Required: no
stats.oldestAppointment|Type: Date, Required: no
avatar|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
__v|Type: Number, Required: no
__t|Type: String, Required: no

## Recalls

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
provider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
type|Type: ObjectID, Required: no, Referencing: [AppointmentType](#appointmenttype)
date|Type: Date, Required: yes
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
status|Type: String, Required: yes, Possible values: ["pending","scheduled"]
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Recalls

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes
updatedBy|Type: ObjectID, Required: yes
patient|Type: ObjectID, Required: yes, Referencing: [Patient](#patient)
provider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
type|Type: ObjectID, Required: no, Referencing: [AppointmentType](#appointmenttype)
date|Type: Date, Required: yes
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
status|Type: String, Required: yes, Possible values: ["pending","scheduled"]
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Referral

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
provider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
referringProviderId|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
referringProvider|Type: String, Required: no
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
source|Type: String, Required: no, Possible values: ["upload","patient-referral-form","ui","integrator"]
status|Type: String, Required: yes, Possible values: ["active","called","called-late","scheduled","scheduled-late","incomplete","expired","cancelled","pending","closed"]
fileUploads|Type: Array, Required: no
startOn|Type: Date, Required: yes
expireAt|Type: Date, Required: yes
attempt|Type: Number, Required: yes
lastAttemptSentAt|Type: Date, Required: no
calledAt|Type: Date, Required: no
acceptedAt|Type: Date, Required: no
scheduledAt|Type: Date, Required: no
notes|Type: String, Required: no
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
customerNotes|Type: String, Required: no
reason|Type: String, Required: no
scheduledByAppointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
scheduledByOffer|Type: ObjectID, Required: no, Referencing: [Offer](#offer)
processedReferralFollowup|Type: String, Required: no, Possible values: ["pending","skipped","failed","success"]
upload|Type: ObjectID, Required: no, Referencing: [Upload](#upload)
faxUrl|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Referral

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
provider|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
referringProviderId|Type: ObjectID, Required: no, Referencing: [Provider](#provider)
referringProvider|Type: String, Required: no
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
source|Type: String, Required: no, Possible values: ["upload","patient-referral-form","ui","integrator"]
status|Type: String, Required: yes, Possible values: ["active","called","called-late","scheduled","scheduled-late","incomplete","expired","cancelled","pending","closed"]
fileUploads|Type: Array, Required: no
startOn|Type: Date, Required: yes
expireAt|Type: Date, Required: yes
attempt|Type: Number, Required: yes
lastAttemptSentAt|Type: Date, Required: no
calledAt|Type: Date, Required: no
acceptedAt|Type: Date, Required: no
scheduledAt|Type: Date, Required: no
notes|Type: String, Required: no
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
externalId.value|Type: String, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: yes
customerNotes|Type: String, Required: no
reason|Type: String, Required: no
scheduledByAppointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
scheduledByOffer|Type: ObjectID, Required: no, Referencing: [Offer](#offer)
processedReferralFollowup|Type: String, Required: no, Possible values: ["pending","skipped","failed","success"]
upload|Type: ObjectID, Required: no, Referencing: [Upload](#upload)
faxUrl|Type: String, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Reminder

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
provider|Type: ObjectID, Required: no, Referencing: [User](#user)
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
referral|Type: ObjectID, Required: no, Referencing: [Referral](#referral)
recall|Type: ObjectID, Required: no, Referencing: [Recall](#recall)
followup|Type: ObjectID, Required: no, Referencing: [Followup](#followup)
followupOperation|Type: String, Required: no, Possible values: ["created","deleted","updated"]
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
patientForm|Type: ObjectID, Required: no, Referencing: [PatientForm](#patientform)
message|Type: Mixed, Required: no
type|Type: String, Required: yes, Possible values: ["appointment","feedback","referral","followup","patient-form"]
externalId.source|Type: String, Required: no, Possible values: ["mandrill","twilio","nexmo","sendgrid","plivo"]
externalId.value|Type: String, Required: no
sendAt|Type: Date, Required: yes
sentAt|Type: Date, Required: no
contact|Type: Array, Required: no
messageTemplate|Type: String, Required: no
status|Type: String, Required: yes, Possible values: ["scheduled","pending","queued","sent","confirmed","emailOpened","skipped","failed","delivered"]
statusReason|Type: String, Required: no
replied|Type: Number, Required: no
repliedMessage|Type: String, Required: no
originalRepliedMessage|Type: String, Required: no
repliedTime|Type: Date, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
deleted|Type: Number, Required: yes
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Reminder

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
provider|Type: ObjectID, Required: no, Referencing: [User](#user)
appointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
referral|Type: ObjectID, Required: no, Referencing: [Referral](#referral)
recall|Type: ObjectID, Required: no, Referencing: [Recall](#recall)
followup|Type: ObjectID, Required: no, Referencing: [Followup](#followup)
followupOperation|Type: String, Required: no, Possible values: ["created","deleted","updated"]
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
patientForm|Type: ObjectID, Required: no, Referencing: [PatientForm](#patientform)
message|Type: Mixed, Required: no
type|Type: String, Required: yes, Possible values: ["appointment","feedback","referral","followup","patient-form"]
externalId.source|Type: String, Required: no, Possible values: ["mandrill","twilio","nexmo","sendgrid","plivo"]
externalId.value|Type: String, Required: no
sendAt|Type: Date, Required: yes
sentAt|Type: Date, Required: no
contact|Type: Array, Required: no
messageTemplate|Type: String, Required: no
status|Type: String, Required: yes, Possible values: ["scheduled","pending","queued","sent","confirmed","emailOpened","skipped","failed","delivered"]
statusReason|Type: String, Required: no
replied|Type: Number, Required: no
repliedMessage|Type: String, Required: no
originalRepliedMessage|Type: String, Required: no
repliedTime|Type: Date, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
deleted|Type: Number, Required: yes
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Setting

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
refId|Type: ObjectID, Required: no
ref|Type: String, Required: yes, Possible values: ["user","provider","facility","appointment-type","integrator"]
settings.welcome.currentStep|Type: Number, Required: no
settings.welcome.termsAgreementDate|Type: Date, Required: no
settings.labs.enabled|Type: Boolean, Required: no
settings.communication.useFacilityPhoneAsFromNumber|Type: Boolean, Required: no
settings.communication.useFacilityAlternativePhoneAsFromNumber|Type: Boolean, Required: no
settings.communication.unsubscribedMessages|Type: Array, Required: no
settings.communication.blockedContacts|Type: Array, Required: no
settings.communication.limitedContacts|Type: Array, Required: no
settings.communication.expirePatientData.enabled|Type: Boolean, Required: no
settings.communication.expirePatientData.maxAgeInDays|Type: Number, Required: no
settings.communication.urlReplacers|Type: undefined, Required: no
settings.timezone|Type: String, Required: yes
settings.scheduler.enabled|Type: Boolean, Required: no
settings.scheduler.daysAheadToShowAvailability|Type: Number, Required: no
settings.scheduler.maxDaysToShow|Type: Number, Required: no
settings.scheduler.providerAvailabilityFilter|Type: undefined, Required: no
settings.scheduler.maxAvailablitiesToRender|Type: Number, Required: no
settings.scheduler.patientAddress.required|Type: Boolean, Required: no
settings.scheduler.patientAddress.visible|Type: Boolean, Required: yes
settings.scheduler.reschedulerRespectsSchedulerRules|Type: Boolean, Required: no
settings.referral.enabled|Type: Boolean, Required: no
settings.referral.attempts|Type: Number, Required: no
settings.referral.interval|Type: Number, Required: no
settings.referral.schedulableWindow.earliest|Type: Number, Required: no
settings.referral.schedulableWindow.latest|Type: Number, Required: no
settings.referral.sendReferralFax|Type: Boolean, Required: no
settings.referral.sendReferralFaxStatus.scheduled|Type: Boolean, Required: no
settings.referral.sendReferralFaxStatus.cancelled|Type: Boolean, Required: no
settings.referral.sendReferralFaxStatus.incomplete|Type: Boolean, Required: no
settings.referral.sendReferralEmail|Type: Boolean, Required: no
settings.reminder.multipleRemindersPerDay|Type: String, Required: no, Possible values: ["onlySendEarliest","multipleRemindersPerDay"]
settings.reminder.schedule|Type: Array, Required: no
settings.reminder.enabled|Type: Boolean, Required: no
settings.reminder.onConfirmation|Type: String, Required: no, Possible values: ["skipFurtherReminders","keepLastReminder"]
settings.reminder.repliesForLastReminder|Type: String, Required: yes, Possible values: ["allowed","confirmationOnly","none"]
settings.reminder.replies|Type: String, Required: yes, Possible values: ["allowed","confirmationOnly","none"]
settings.reminder.enabledChannels|Type: Array, Required: no
settings.reminder.treatCancellationsAsNoShows|Type: Number, Required: yes
settings.reminder.offerToJoinWaitlistOnCancellation|Type: String, Required: yes, Possible values: ["disabled","from-reminder","from-integrator","from-both"]
settings.reminder.schedulableWindow.earliest|Type: Number, Required: no
settings.reminder.schedulableWindow.latest|Type: Number, Required: no
settings.reminder.allowSelfSchedule|Type: Boolean, Required: no
settings.reminder.rescheduleSundayToSaturday|Type: Boolean, Required: no
settings.reminder.forceVoiceCallsForSmsNonResponders|Type: Boolean, Required: no
settings.reminder.cancelOrConfirmAllAppointmentsInDay|Type: Boolean, Required: no
settings.reminder.allowConfirmAfterCancel|Type: Boolean, Required: no
settings.reminder.allowCancelAfterConfirm|Type: Boolean, Required: no
settings.reminder.strictConfirmCancelTextHandling|Type: Boolean, Required: no
settings.reminder.disableCatchupReminders|Type: Boolean, Required: no
settings.cancellation.enabled|Type: Boolean, Required: no
settings.cancellation.expiration|Type: Number, Required: no
settings.cancellation.processAppointmentTypes|Type: Boolean, Required: no
settings.cancellation.requireFrontOfficeAcceptance|Type: Boolean, Required: no
settings.cancellation.shadowAppointment.enabled|Type: Boolean, Required: no
settings.cancellation.allowDoubleBooks|Type: Boolean, Required: no
settings.cancellation.maxDaysAheadsToProcessCancellation|Type: Number, Required: no
settings.cancellation.minMinutesAheadsToProcessCancellation|Type: Number, Required: no
settings.cancellation.spotsDiscovery.enabled|Type: Boolean, Required: no
settings.cancellation.spotsDiscovery.maxSpots|Type: Number, Required: no
settings.cancellation.spotsDiscovery.hoursAhead|Type: Number, Required: no
settings.cancellation.autoAddToWaitlist.enabled|Type: Boolean, Required: no
settings.cancellation.autoAddToWaitlist.daysAhead|Type: Number, Required: no
settings.cancellation.sendYouveBeenAddedMessage|Type: Boolean, Required: no
settings.cancellation.skipOfferBasedOnLastSentOffer|Type: Boolean, Required: no
settings.cancellation.maxOffersPerWaitlist|Type: Number, Required: no
settings.cancellation.protocol|Type: String, Required: no, Possible values: ["serial","parallel"]
settings.cancellation.offerToJoinDuration|Type: Number, Required: no
settings.cancellation.autoCreateWaitlists|Type: Boolean, Required: yes
settings.cancellation.delayOffers.enabled|Type: Boolean, Required: no
settings.cancellation.delayOffers.until|Type: String, Required: no
settings.cancellation.cancelFutureAppointment|Type: Boolean, Required: no
settings.cancellation.requireFutureAppointment|Type: Boolean, Required: no
settings.appointment.duration|Type: Number, Required: no
settings.feedback.multipleRemindersPerDay|Type: String, Required: no, Possible values: ["onlySendEarliest","multipleRemindersPerDay"]
settings.feedback.enabled|Type: Boolean, Required: no
settings.feedback.promoter.type|Type: String, Required: no, Possible values: ["facebook","yelp","patientfusion","betterdoctor","zocdoc","google","generic","healthgrades","ratemds"]
settings.feedback.promoter.url|Type: String, Required: no
settings.feedback.promoterUrls|Type: undefined, Required: no
settings.feedback.detractor.type|Type: String, Required: no, Possible values: ["google"]
settings.feedback.detractor.url|Type: String, Required: no
settings.feedback.detractorUrls|Type: undefined, Required: no
settings.feedback.schedule|Type: Number, Required: no
settings.feedback.interval.enabled|Type: Boolean, Required: no
settings.feedback.interval.value|Type: Number, Required: no
settings.feedback.limit.enabled|Type: Boolean, Required: no
settings.feedback.limit.value|Type: Number, Required: no
settings.feedback.allowFeedbackForPastAppointments|Type: Boolean, Required: yes
settings.feedback.forceMessageTime.enabled|Type: Boolean, Required: no
settings.feedback.forceMessageTime.until|Type: String, Required: no
settings.followup.enabled|Type: Boolean, Required: no
settings.integrator.requireLock|Type: Boolean, Required: no
settings.integrator.syncWindow.earliest|Type: Number, Required: yes
settings.integrator.syncWindow.latest|Type: Number, Required: yes
settings.integrator.writeDataToIntegrator.createAppointments|Type: Boolean, Required: no
settings.integrator.writeDataToIntegrator.updateStatus|Type: Boolean, Required: no
settings.integrator.writeDataToIntegrator.updatePatientDemographics|Type: Boolean, Required: no
settings.integrator.writeDataToIntegrator.flushPatientMessageHistory|Type: Boolean, Required: no
settings.integrator.frequency|Type: Number, Required: yes
settings.integrator.enforceProviderDeltaCheck|Type: Boolean, Required: no
settings.integrator.enforceAppointmentDeltaCheck|Type: Boolean, Required: no
settings.integrator.syncProcedures|Type: Boolean, Required: no
settings.integrator.syncDiagnoses|Type: Boolean, Required: no
settings.integrator.syncReferrals|Type: Boolean, Required: no
settings.integrator.verifySlotIsOpenBeforeAppointmentCreation|Type: Boolean, Required: no
settings.integrator.verifyWhitespaceIsOpenBeforeAppointmentCreation|Type: Boolean, Required: no
settings.patients.maxTokenAge|Type: Number, Required: no
settings.patients.loginLookupInIntegrator|Type: Boolean, Required: no
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## Upload

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
integrator|Type: String, Required: yes, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner"]
type|Type: String, Required: yes, Possible values: ["appointment","patient","referral"]
mapping|Type: ObjectID, Required: no, Referencing: [FileMapping](#filemapping)
content|Type: Mixed, Required: no
status|Type: String, Required: yes, Possible values: ["unmapped","pending","processing","completed","failed"]
results.noContactPatients|Type: Array, Required: no
results.recordsSkipped|Type: Number, Required: no
results.patientsSkipped|Type: Number, Required: no
results.patientsCreated|Type: Array, Required: no
results.patientsUpdated|Type: Array, Required: no
results.facilitiesCreated|Type: Array, Required: no
results.errors|Type: undefined, Required: no
resultsDescription|Type: String, Required: no
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
deleted|Type: Number, Required: no
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

## User

Attribute|Description
----|----
_id|Type: ObjectID, Required: no
name|Type: String, Required: no
firstname|Type: String, Required: no
lastname|Type: String, Required: no
middlename|Type: String, Required: no
email|Type: String, Required: no
password|Type: String, Required: no
passwordHashAlgorithm|Type: String, Required: no, Possible values: ["md5","sha256","sha512","bcrypt"]
passwordUpdatedAt|Type: Date, Required: no
safeId|Type: String, Required: no
resetPasswordToken|Type: String, Required: no
resetPasswordExpires|Type: Date, Required: no
type|Type: String, Required: yes, Possible values: ["doctor","staff","patient"]
roles|Type: Array, Required: no
organization|Type: ObjectID, Required: no, Referencing: [Organization](#organization)
contact|Type: undefined, Required: no
doNotContact|Type: Boolean, Required: yes
doNotContactMessage|Type: ObjectID, Required: no, Referencing: [Message](#message)
groups|Type: Array, Required: no
stripeCustomerId|Type: String, Required: no
stripeSubscriptionId|Type: String, Required: no
salesforceId|Type: String, Required: no
salesforceData.provisioning|Type: Array, Required: no
salesforceData.respectProvisioning|Type: Boolean, Required: no
salesforceData.lifeline|Type: String, Required: no, Possible values: ["trial","converted","active","churn"]
salesforceData.mrr|Type: Number, Required: no
salesforceData.renewalDate|Type: Date, Required: no
salesforceData.providers|Type: Number, Required: no
salesforceData.specialty|Type: String, Required: no
salesforceData.referralTrialLimit|Type: Number, Required: no
salesforceData.recordType|Type: String, Required: no
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
lastLogin|Type: Date, Required: no
token|Type: String, Required: yes
active|Type: Number, Required: yes
master|Type: Boolean, Required: no
language|Type: String, Required: no
user|Type: ObjectID, Required: no, Referencing: [User](#user)
setting|Type: ObjectID, Required: no, Referencing: [Setting](#setting)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
externalId.value|Type: String, Required: no
secondaryExternalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
secondaryExternalId.value|Type: String, Required: no
dateOfBirth.year|Type: Number, Required: no
dateOfBirth.month|Type: Number, Required: no
dateOfBirth.day|Type: Number, Required: no
dateOfBirth.required|Type: Mixed, Required: no
address|Type: String, Required: no
city|Type: String, Required: no
state|Type: String, Required: no
country|Type: String, Required: yes
postcode|Type: String, Required: no
gender|Type: String, Required: yes, Possible values: ["male","female","unknown","nonbinary"]
passwordResetRequired|Type: Boolean, Required: no
twoFactorAuthSecret.key|Type: String, Required: no
twoFactorAuthSecret.period|Type: Number, Required: no
twoFactorAuthSecret.enabled|Type: Boolean, Required: no
twoFactorAuthSecret.backupCodes|Type: Array, Required: no
twoFactorAuthSecret.required|Type: Mixed, Required: no
allowedIps|Type: Array, Required: no
stats.oldestAppointment|Type: Date, Required: no
avatar|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
__v|Type: Number, Required: no
__t|Type: String, Required: no

## User

Attribute|Description
----|----
_id|Type: ObjectID, Required: no
name|Type: String, Required: no
firstname|Type: String, Required: no
lastname|Type: String, Required: no
middlename|Type: String, Required: no
email|Type: String, Required: no
password|Type: String, Required: no
passwordHashAlgorithm|Type: String, Required: no, Possible values: ["md5","sha256","sha512","bcrypt"]
passwordUpdatedAt|Type: Date, Required: no
safeId|Type: String, Required: no
resetPasswordToken|Type: String, Required: no
resetPasswordExpires|Type: Date, Required: no
type|Type: String, Required: yes, Possible values: ["doctor","staff","patient"]
roles|Type: Array, Required: no
organization|Type: ObjectID, Required: no, Referencing: [Organization](#organization)
contact|Type: undefined, Required: no
doNotContact|Type: Boolean, Required: yes
doNotContactMessage|Type: ObjectID, Required: no, Referencing: [Message](#message)
groups|Type: Array, Required: no
stripeCustomerId|Type: String, Required: no
stripeSubscriptionId|Type: String, Required: no
salesforceId|Type: String, Required: no
salesforceData.provisioning|Type: Array, Required: no
salesforceData.respectProvisioning|Type: Boolean, Required: no
salesforceData.lifeline|Type: String, Required: no, Possible values: ["trial","converted","active","churn"]
salesforceData.mrr|Type: Number, Required: no
salesforceData.renewalDate|Type: Date, Required: no
salesforceData.providers|Type: Number, Required: no
salesforceData.specialty|Type: String, Required: no
salesforceData.referralTrialLimit|Type: Number, Required: no
salesforceData.recordType|Type: String, Required: no
deleted|Type: Number, Required: yes
createdAt|Type: Date, Required: no
updatedAt|Type: Date, Required: no
lastLogin|Type: Date, Required: no
token|Type: String, Required: yes
active|Type: Number, Required: yes
master|Type: Boolean, Required: no
language|Type: String, Required: no
user|Type: ObjectID, Required: no, Referencing: [User](#user)
setting|Type: ObjectID, Required: no, Referencing: [Setting](#setting)
externalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
externalId.value|Type: String, Required: no
secondaryExternalId.source|Type: String, Required: no, Possible values: ["gcalendar","successehs","drchrono","dentrix","webpt","theraoffice","mi7","practicefusion","advancedmd","acomrapidpm","kareo","nextech","mwtherapy","clinicient","carecloud","eclinicalmobile","duxware","labretriever","optimispt","referral","recall","allscriptspm","lytec","brightree","fullslate","nuemd","centricityps","officeally","greenwayintergy","compulink","adspm","dsnpm","lumamock","medicalmastermind","meditouch","healthnautica","ezemrx","hl7","amazingcharts","greenwayprimesuite","raintree","athenahealth","revflow","eclinicalworks10e","hl7pickup","mindbody","eclinicalworkssql","nextgen","practiceperfect","avimark","clinix","keymedical","mdoffice","webedoctor","emapm","medinformatix","imsgo","emds","allscriptsunity","medevolve","caretracker","clearpractice","valant","micromd","systemedx","medicalmaster","athenamdp","gmed","roche","onetouch","somnoware","managementplus","lumacare","nextechfhir","curemd","epic","phoenixortho","ezderm","ggastromobile","epicconfirmationpickup","cerner","sms","voice","email","none"]
secondaryExternalId.value|Type: String, Required: no
dateOfBirth.year|Type: Number, Required: no
dateOfBirth.month|Type: Number, Required: no
dateOfBirth.day|Type: Number, Required: no
dateOfBirth.required|Type: Mixed, Required: no
address|Type: String, Required: no
city|Type: String, Required: no
state|Type: String, Required: no
country|Type: String, Required: yes
postcode|Type: String, Required: no
gender|Type: String, Required: yes, Possible values: ["male","female","unknown","nonbinary"]
passwordResetRequired|Type: Boolean, Required: no
twoFactorAuthSecret.key|Type: String, Required: no
twoFactorAuthSecret.period|Type: Number, Required: no
twoFactorAuthSecret.enabled|Type: Boolean, Required: no
twoFactorAuthSecret.backupCodes|Type: Array, Required: no
twoFactorAuthSecret.required|Type: Mixed, Required: no
allowedIps|Type: Array, Required: no
stats.oldestAppointment|Type: Date, Required: no
avatar|Type: ObjectID, Required: no, Referencing: [FileUpload](#fileupload)
__v|Type: Number, Required: no
__t|Type: String, Required: no

## Waitlist

Attribute|Description
----|----
user|Type: ObjectID, Required: yes, Referencing: [User](#user)
patient|Type: ObjectID, Required: yes, Referencing: [User](#user)
provider|Type: Array, Required: no
facility|Type: ObjectID, Required: no, Referencing: [Facility](#facility)
appointmentType|Type: Array, Required: no
offer|Type: ObjectID, Required: no, Referencing: [Offer](#offer)
department|Type: String, Required: no
status|Type: String, Required: yes, Possible values: ["waiting","in-flight","offered","confirming","accepted","pending","declined"]
bookedBy|Type: String, Required: yes, Possible values: ["provider","department","patient","auto"]
createdFromAppointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
futureAppointment|Type: ObjectID, Required: no, Referencing: [Appointment](#appointment)
futureAppointmentBestMatch|Type: Boolean, Required: no
duration|Type: Number, Required: no
holdUntil|Type: Date, Required: no
expireAt|Type: Date, Required: no
createdAt|Type: Date, Required: no
notes|Type: String, Required: no
preferredDays|Type: Array, Required: no
preferredTime|Type: String, Required: no, Possible values: ["before-lunch","after-lunch","anytime"]
stats.counters.offersSent|Type: Number, Required: no
updatedAt|Type: Date, Required: no
deleted|Type: Number, Required: yes
createdBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
updatedBy|Type: ObjectID, Required: yes, Referencing: [User](#user)
approvedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
declinedBy|Type: ObjectID, Required: no, Referencing: [User](#user)
_id|Type: ObjectID, Required: no
__v|Type: Number, Required: no

