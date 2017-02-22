---
title: API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors
  - warnings
  - successes

search: true
---




# Introduction

Welcome to XRM/MP API.

## Environments

* *LIVE - <b>api.fantasticservices.com*</b>
* *STAGE - <b>middlepoint-stg.1dxr.com*</b>
* *DEV - <b>middlepoint-dev.1dxr.com*</b>

In this document `{base URL}` is used as a palceholder for current environment.

## Versioning

Version is added after `{base URL}` (latest version 2).

Example:

<b>*api.fantasticservices.com/v2*</b>

In this document `{version}` is used as a palceholder for selected version.

## Namespaces

Namespace is added after `{version}`.

* *CLIENT USER - <b>/client</b>*
* *PRO USER - <b>/unit</b>*
* *GLOBAL FOR SYSTEM - <b>/shared</b>*

Example:

<b>*api.fantasticservices.com/v2/client*</b>

In this document namespace is included in examples.


## Applications identifying tokens

To access API all request must include identifying token header field.

`X-Application: token`

<aside class="notice">
You must replace <code>token</code> with your personal APP token.
</aside>

## Profile identifying tokens

To access profile specific data request should include identifying profile header field.

`X-Profile: id`

<aside class="notice">
You must replace <code>id</code> with your personal profile id.
</aside>


## Authentication

To access user specific data request should include authorization header field.

`Authorization: token`

<aside class="notice">
You must replace <code>token</code> with your personal authorization token.
</aside>




# Communication Protocol

## Request

```shell
curl --request POST \
  --url https://api.fantasticservices.com/v2/client/resources \
  --header 'content-type: application/json' \
  --header 'Authorization: YOUR_AUTH_TOKEN_HERE' \
  --header 'X-Profile: YOUR_PROFILE_ID_HERE' \
  --header 'X-Application: YOUR_APP_TOKEN_HERE' \
  --data '
{
  "requests": [
    {
      "method": "GET",
      "path": "addresses",
      "params": null,
      "data": null
    }
  ]
}
'
```


All requests to the API are POST `https://{base URL}/{version}/{namespace}/resources` endpoint and contain field `requests` holding array of request objects.

### Request object parameters

Parameter | Type | Description
-------- | ----- | -------
`method`<br>*required* | *string* | Request type.<br><br>*<b>POST</b> - write data to server (create/update)*<br>*<b>GET</b> - read data from server*<br>*<b>DELETE</b> - delete data on server*
`path`<br>*required* | *string* | Path to resource to access
`params`<br>*optional* | *object* | Paramaters for the request
`data`<br>*optional* | *object* | Data to post to server

### `params`

Parameter | Type   | Default | Description
-------- | ---------- | ---- | -------
`expand` | *string* | *none* | Attributes to return as full objects. Names can be listed separated by a comma.<br><br> Keywords:<br><br>all - *expands all first level attributes*<br>all.all - *expands all second level attributes*<br>attribute.all - *expands all attributes child elements*
`fields` | *array* | *all* | Attributes to receive in response
`exclude_fields` | *array* | *none* | Attributes to exclude from response
`include_fields` | *array* | *none* | Attributes to add to response which are not returned by default


## Response


> JSON response structured

```json
{
  "responses": [
    {
      "data": [],
      "success": [
        {
          "code": 1020,
          "message": "Address created.",
          "debug_message": "postal_code missing.",
          "debug_id": 213124
        }
      ]
    }
  ],
  "meta": {
    "db_version": 25,
    "latest_build": 27
  }
}
```

Contains field `responses` holding array of response objects.


### Response object parameters

Parameter | Type | Description
--------- | ---- | -----------
`data` | *array* | Array of data objects returned in the result of the request
`success`, `warning`, `error` | *array* | Messages with information for the request
`meta` | *object* | Parametercontaining information for the system.


Also has field `meta` containing system information

### `meta`

Parameter | Type | Description
--------- | ---- | -----------
`db_version` | *integer* | Version of database model
`latest_build` | *integer* | Latest application build release


## Read

```shell
curl --request POST \
  --url https://api.fantasticservices.com/v2/client/resources \
  --header 'content-type: application/json' \
  --header 'X-Profile: YOUR_PROFILE_ID_HERE' \
  --header 'X-Application: YOUR_APP_TOKEN_HERE' \
  --data '
{
  "requests": [
    {
      "method": "GET",
      "path": "services/1"
    }
  ]
}
'
```

> The above command returns JSON structured like this:

```json
{
  "responses": [
    {
      "data": [
        {
          "id": 1,
          "sort": 100,
          "title": "Cleaning",
          "description": "Free up more time for you and your family. The skilled cleaning experts will take care of your home.",
          "short_description": "One-off cleaning",
          "keywords": [
            "clean",
            "one-off",
            "fantastic"
          ],
          "list_image": null,
          "phone": "02034044444",
          "choice_views": [
            338,
            339,
            340,
            341,
            342
          ],
          "updated_at": 1459492785
        }
      ]
    }
  ],
  "meta": {
    "db_version": 25,
    "latest_build": 27
  }
}
```

Read data by using `metohd: GET` and specifying `path` to resource you want to access. Get object by id with suffix `/{id}`

`"path": "services"`


## Create/Update

```shell
curl --request POST \
  --url https://api.fantasticservices.com/v2/client/resources \
  --header 'content-type: application/json' \
  --header 'Authorization: YOUR_AUTH_TOKEN_HERE' \
  --header 'X-Profile: YOUR_PROFILE_ID_HERE' \
  --header 'X-Application: YOUR_APP_TOKEN_HERE' \
  --data '
{
  "requests": [
    {
      "method": "POST",
      "path": "addresses",
      "data": {
        "address_line_1": "9 Apt.",
        "address_line_2": "24 Red Lion Street",
        "postcode": "SW12 2TN",
        "lat": 51.604903,
        "lng": -0.457022
      }
    }
  ]
}
'
```

> The above request success response is:

```json
{
  "responses": [
    {
      "data": [
        {
          "id": 255,
          "address_line_1": "9 Apt.",
          "address_line_2": "24 Red Lion Street",
          "postcode": "SW12 2TN",
          "lat": 51.604903,
          "lng": -0.457022
        }
      ]
    }
  ],
  "meta": {
    "db_version": 25,
    "latest_build": 27
  }
}
```


Create objects by using `metohd: POST` and specifying `path` to resource you want to create. Add suffix `/{id}` to update existing objects.

`"path": "addresses"`

If operation is successful created/updated object is returned.

## Delete

```shell
curl --request POST \
  --url https://api.fantasticservices.com/v2/client/resources \
  --header 'content-type: application/json' \
  --header 'Authorization: YOUR_AUTH_TOKEN_HERE' \
  --header 'X-Profile: YOUR_PROFILE_ID_HERE' \
  --header 'X-Application: YOUR_APP_TOKEN_HERE' \
  --data '
{
  "requests": [
    {
      "method": "DELETE",
      "path": "addresses/255"
    }
  ]
}
'
```

> The above request success response is:

```json
{
  "responses": [
    {
      "sucess": [
        {
          "code": 1021,
          "message": "Address deleted.",
          "debug_message": null,
          "debug_id": 213124
        }
      ]
    }
  ],
  "meta": {
    "db_version": 25,
    "latest_build": 27
  }
}
```

Delete objects by using `metohd: DELETE` and specifying `path` and `/{id}` suffix for object to delete.

`"path": "addresses"`

If object is deleted successfully `"succuess"` is returned.

# Account

## Register

```shell
curl --request POST \
  --url https://api.fantasticservices.com/v2/client/resources \
  --header 'content-type: application/json' \
  --header 'X-Profile: YOUR_PROFILE_ID_HERE' \
  --header 'X-Application: YOUR_APP_TOKEN_HERE' \
  --data '
{
  "requests": [
    {
      "method": "POST",
      "path": "register",
      "data": {
        "title_id": 1,
        "first_name": "Nikolay",
        "last_name": "Georgiev",
        "phone": "072313123123",
        "email": "test@test.com",
        "password": "1234",
        "referral_code": "JOHND1234B",
        "social": {
          "oauth_id": "EAAEo0IpvAQcBAK1gy3VjCJPZCp6vidasdvEvEtxmO0gjFFjtz3jd8omEuhVhg3Y3ZAzIjSLQVMMZBaWwIZBRY9U8B7XZCFvGpledf38DPUTfeHNA2PCZALtPFTjXYFD1aPeB6IK4oo8dJWAIMAcpKPmFATTtXABljEA02jIDExTAp5brMUuNLMQlQr48ISRhbNy4hbKyI6plbO6ZCd1iHJ9kxd09PfpiwcZD",
          "profile_id": 911980962150668,
          "social_provider_id": 1
        },
        "type_id": 1
      }
    }
  ]
}
'
```

> The above request success response is:

```json
{
  "responses": [
    {
      "data": [
        {
          "login": {
            "sid": "1cjkidhfqoihoufu18j0ncoy0jl7eu0d4ge1kslggp4outkh",
            "create_time": 1429863734,
            "expire_time": 1429906934
          }
        }
      ],
      "success": [
        {
          "code": 2010,
          "message": "Succesful register",
          "debug_message": null,
          "debug_id": null
        }
      ]
    }
  ],
  "meta": {
    "db_version": 25,
    "latest_build": 27
  }
}
```

To create account all required fields must be sent (except anonymous accounts which need only the right `type_id`). For social sign in set the correct `type_id` and fields in `social` object (they vary for different social medias). Missing details from social sign in must be collected from user to satisfy required fields.

`"path": "register"`

### Request parameters

Parameter | Type | Description
-------- | ----- | -------
`title_id`<br>*required* | *integer* | Selected title `id` from `user_titles`
`first_name`<br>*required* | *string* | User's first name (no special characters allowed)
`last_name`<br>*required* | *string* | User's last name (no special characters allowed)
`phone`<br>*required* | *integer* | User's phone number validated for the region (UK/AUS/USA etc.)
`email`<br>*required* | *string* | User's email with validated structure (e.g. xxxx@xxx.xxx)
`referral_code`<br>*optional* | *string* | Referral code from another user
`social.oauth_id`<br>*optional* | *string* | Facebook oauth string for sign in
`social.profile_id`<br>*optional* | *string* | Facebook profile id
`social.social_provider_id`<br>*optional* | *integer* | Social login provider `id`.<br><br>*<b>1</b> - Facebook*
`type_id`<br>*optional* | *integer* | Type of registration`id`.<br><br>*<b>1</b> - Generic (register form)*<br>*<b>2</b> - Social (Facebook)*<br>*<b>3</b> - Anonymous*

### `params`

Parameter | Type | Description
-------- | ----- | -------
`return_user`<br>*optional, default <b>false</b>* | *boolean* | Return user object with phone object.

### Response parameters

Parameter | Type | Description
-------- | ----- | -------
`login.sid `<br>*required* | *integer* | Your session id. Use for `Authorization` header.


<aside class="success">
Code for successful registration: 2010.
</aside>

<aside class="warning">
Error codes for registration: 4010 - 4020.
</aside>
