---
title: API Reference

language_tabs:
  - shell

toc_footers:
  - Questions?  partnersupport@optisom.com
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Optisom Sleep Health Platform API! As an Optisom Platform Level Partner, you can use our API endpoints to 
obtain information on users, assessments, challenges, diary entries and other information related 
to the your user's progress through the Optisom Sleep Health Program.

We have example code to query the API using Curl.  You can view code examples in the dark area to the right, 
and you can switch the programming language of the examples with the tabs in the top right.

# Authentication

As an Optisom Platform Partner, you should have been provided with an email login and a password to your Optisom Sleep Health API Service, 
which we'll refer to as "the Service" going forward.
If you do not have the email or password, please contact Partner Support at <partnersupport@optisom.com>.  
This login information is used to retrieve information that populates the headers for subsequent API calls to the Service.


## Authentication Headers Format

The authentication information should be included by the clinet in the headers of each request.  The headers follow the RFC 6750 Bearer
Token format:

```
  Access-Token: Jap0KPYbYrdbs7fuPfcN2g
  Token-Type: Bearer
  Client: 3LNndC01Qcle0NTzSZMMDg
  Expiry: 1462471387
  Uid: partner_abc@optisom.com
```


## Creating an Authentication Token

Using your email and password, you can create an authentication token by posting to the API sign_in endpoint.

`https://partner_abc.optisom.com/api/v2/auth/sign_in`

<aside class="notice">
The email, password and domain name should be replaced with the information provided to you by our partner support team.
</aside>

> Request for authentication token:

```
curl -i -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{ "email": "partner_abc@optisom.com", "password": "supersecret" }' \
  "https://partner_abc.optisom.com/api/v2/auth/sign_in"
```

> Abbreviated response:

```
> HTTP/1.1 200 OK
> Access-Token: Jap0KPYbYrdbs7fuPfcN2g
> Token-Type: Bearer
> Client: 3LNndC01Qcle0NTzSZMMDg
> Expiry: 1462471387
> Uid: partner_abc@optisom.com
> Content-Type: application/json; charset=utf-8
> Date: Thu, 21 Apr 2016 18:03:07 GMT
```

## Validating an Existing Authentication Token
Previously issued tokens can be validated through the following request:

```
curl -X GET \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Access-Token: gqhY7hJ2Nwkld0dSSkta0A" \
  -H "Token-Type: Bearer" \
  -H "Client: RKhX7t2HkzLeenVevc4mww" \
  -H "Expiry: 1462471387" \
  -H "Uid: partner_abc@optisom.com" \
  "https://partner_abc.optisom.com/api/v2/auth/validate_token"
```

## Making an Authenticated Request
To make an authenticated request, use the following format:

<aside class="notice">
The Access-Token, Client and Expiry should be replaced with the values from the response for an authenticated token request.
</aside>


```
curl -X GET \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Access-Token: gqhY7hJ2Nwkld0dSSkta0A" \
  -H "Token-Type: Bearer" \
  -H "Client: RKhX7t2HkzLeenVevc4mww" \
  -H "Expiry: 1462471387" \
  -H "Uid: partner_abc@optisom.com" \
  "https://partner_abc.optisom.com/api/v2/users/1/screenings"
```








# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

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

