---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Magpie API! You can use our API to to retrieve information on your organisation and generate user specific recommendations
based on various inputs.

Requests are made in the context of a user taking actions that trigger the API calls and not at an administrator level.
The API uses the JSON-RPC protocol. There is a client-side library available too as a way to speed up and simplify integration.


# Authentication

> Request Payload:

```shell
{
    "id":    "99850fed-cf9c-4b15-9b5c-e901beb29cc5",
    "email": "wile@acme.com",
    "name":  "Wile E.",
}

```


Both server-side and client-side use [JSON Web Tokens](https://jwt.io/introduction/) (JWT). This will require some server-side code in both cases.
There are off-the-shelf [libraries](https://jwt.io/#libraries) available for many languages. The JWT will be signed and encrypted.

An api key, secret key and organisation will be provided. These will be used to identify and authorise the requester.

The payload format is as follows

Name | Type | Notes
--------- | ------- | -----------
id | String | Max ? chars. Any format. No personal information.
email | String, Optional | Max ? chars.
name | String, Optional | Max ? chars.


`Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImI4MWkyY25hb3BmMDAyZ205bmJnIiwiZW1haWwiOiJ3aWxlQGFjbWUuY29tIiwibmFtZSI6IldpbGUgRS4iLCJvcmdhbmlzYXRpb24iOiJmaWx0ZXJlZCJ9.ywk-tC9tBkI3QABXHrFJArsRa2FYHSyLDbJ25GeDeDU`

<aside class="notice">
You must replace <code>5dc78bab-4988-4a15-96a2-9eb084fba6f6</code> with your personal API key.
Your token should be encrypted with the provided secret key.
</aside>

# Profile

## Update

```shell
curl --data-binary '{"id":"10","method":"profile.Update","params":{"function":5,"sector":8,"seniority":1}, "jsonrpc": "2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImI4MWkyY25hb3BmMDAyZ205bmJnIiwiZW1haWwiOiJ3aWxlQGFjbWUuY29tIiwibmFtZSI6IldpbGUgRS4iLCJvcmdhbmlzYXRpb24iOiJmaWx0ZXJlZCJ9.ywk-tC9tBkI3QABXHrFJArsRa2FYHSyLDbJ25GeDeDU'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"function": 5,
		"sector": 8,
		"seniority": 1
	},
	"id": "10"
}
```

Updates the given user’s profile data. Acts as a create in case there is no data associated with the use identifier.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Default | Description
--------- | ------- | -----------
function | integer | the user’s function input identifier
sector | integer | the user’s sector input identifier
seniority | integer | the user’s seniority input identifier

<aside class="success">
Returns — Profile Model - the user’s updated profile data
</aside>

## Get a Specific Kitten

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete
