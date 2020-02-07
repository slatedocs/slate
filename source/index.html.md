---
title: Weaver API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby

includes:
  - errors

search: true
---

# Introduction

Welcome to the Weaver API! You can use our API to access the Gateway API endpoints, which can get information on various gateways and connected devices in our database.

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways
  -H 'Authorization: Token {USER_TOKEN}'
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token {USER_TOKEN}'
}

RestClient.get('http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways', headers: headers)
```

> Make sure to replace `{USER_TOKEN}` with your API key.

Weaver uses API keys to allow access to the API. You can retrieve your Weaver API key via [the Token endpoint below](#create-user-token).

Weaver expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: {USER_TOKEN}`

<aside class="notice">
You must replace <code>{USER_TOKEN}</code> with your personal API key.
</aside>

# User Tokens

## Create User Token

```shell
curl -X POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/users/get_token \
  --data 'email={email}' \
  --data 'password={password}'
```

```ruby
require 'rest-client'

payload = {
  'email': {EMAIL},
  'password': {PASSWORD}
}

RestClient.post('http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/users/get_token', payload, headers={})
```

> The above command returns JSON structured like this:

```json
{
    "auth_token": "{USER_TOKEN}"
}
```

Create a user token with a POST request to the endpoint.

Parameter | Type | Description
--------- | ---- | -----------
email | String | Email of the user account
password | String | Password of the user account

# Gateways

## Get All Gateways

```shell
curl "http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways" \
  -H "Authorization: Token {USER_TOKEN}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": "1c366719-04ff-4b9b-b518-726b7e8fb762",
    "organization_id": 1,
    "location": "123 Main St, San Francisco CA",
    "mac_address": "00:00:00:00:00:00",
    "ip_address": "192.0.1.234",
    "status": "online",
    "created_at": "2020-01-01T12:34:56.789Z",
    "updated_at": "2020-01-01T12:34:56.789Z",
    "auth_token": "{USER_TOKEN}",
    "hardware_uuid": "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
  }
]
```

This endpoint retrieves all gateways.

### HTTP Request

`GET http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Gateway

```shell
curl -X POST \
  -H "Authorization: Token {USER_TOKEN}" \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/{gateway_id}
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

`GET http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Gateway

```shell
curl "http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/api/kittens/2"
  -X DELETE
  -H "Authorization: Token {USER_TOKEN}"
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

`DELETE http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete
