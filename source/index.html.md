---
title: API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---




# Introduction

Welcome to XRM/MP API.

## Environments

* **LIVE** `api.fantasticservices.com`  
* **STAGE** `middlepoint-dev.1dxr.com`
* **DEV** `middlepoint-dev.1dxr.com`

In this document `{base URL}` is used as a palceholder for current environment.

## Versioning

Version is added after `{base URL}` (latest version 2).

Example

`api.fantasticservices.com/v2`  

In this document `{version}` is used as a palceholder for selected version.

## Namespaces

Namespace is added after `{version}` (latest version 2).

* **CLIENT USER** `/client`  
* **PRO USER** `/unit`
* **GLOBAL FOR SYSTEM** `/shared`

Example

`api.fantasticservices.com/v2/client/`

In this document namespace is included in examples.


## Applications identifying tokens

To access API all request must include identifying token header field

`X-Client-Token: token`

<aside class="notice">
You must replace <code>token</code> with your personal API token.
</aside>

## Profile identifying tokens

To access profile specific data request must include identifying token header field

`X-Client-Profile: id`

<aside class="notice">
You must replace <code>id</code> with your personal profile id.
</aside>


## Authentication

To access user specific data request should include header field

`Authorization: Bearer token`

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
`method` | *string* | Request type.<br><br>*<b>POST</b> - write data to server (create/update)*<br>*<b>GET</b> - read data from server*<br>*<b>DELETE</b> - delete data on server*
`path` | *string* | Path to resource to access
`params` | *object* | Paramaters for the request
`data` | *object* | Data to post to server

### `params`

Parameter | Type   | Default | Description
-------- | ---------- | ---- | -------
`expand` | *string* | *none* | Attributes to return as full objects. Names can be listed separated by a comma.<br><br> Keywords:<br><br>all - *expands all first level attributes*<br>all.all - *expands all second level attributes*<br>attribute.all - *expands all attributes child elements*
`fields` | *array* | *all* | Attributes to receive in response
`exclude_fields` | *array* | *none* | Attributes to exclude from response


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
          "debug_message": "postal_code missing."
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
          "debug_message": null
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
        "phone_number": "072313123123",
        "email": "test@test.com",
        "password": "1234",
        "referal_code": "JOHND1234B",
        "oauth_id": "EAAEo0IpvAQcBAK1gy3VjCJPZCp6vidasdvEvEtxmO0gjFFjtz3jd8omEuhVhg3Y3ZAzIjSLQVMMZBaWwIZBRY9U8B7XZCFvGpledf38DPUTfeHNA2PCZALtPFTjXYFD1aPeB6IK4oo8dJWAIMAcpKPmFATTtXABljEA02jIDExTAp5brMUuNLMQlQr48ISRhbNy4hbKyI6plbO6ZCd1iHJ9kxd09PfpiwcZD",
        "profile_id": 911980962150668,
        "social_login_provider_id": 1,
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
            "token": "1cjkidhfqoihoufu18j0ncoy0jl7eu0d4ge1kslggp4outkh",
            "create_time": 1429863734,
            "expire_time": 1429906934
          }
        }
      ],
      "success": [
        {
          "code": 2010,
          "message": "Succesful register",
          "debug_message": "no errors"
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

To create account all required fields must be sent (except anymous accounts which need only the right `type_id`). For social sign in set the correct `type_id` and `social_login_provider_id`, pass the needed additional parameters for the social provider as `oauth_id`, `profile_id` etc. Missing details from social sign in must be collected from user to satisfy required fields.

`"path": "register"`

### Request parameters

Parameter | Type | Description
-------- | ----- | -------
`title_id`<br>*required* | *integer* | Selected title `id` from `user_titles`
`first_name`<br>*required* | *string* | User's first name (no special characters allowed)
`last_name`<br>*required* | *string* | User's last name (no special characters allowed)
`phone_number`<br>*required* | *integer* | User's phone number validated for the region (UK/AUS/USA etc.)
`email`<br>*required* | *string* | User's email with validated structure (e.g. xxxx@xxx.xxx)
`referal_code`<br>*optional* | *string* | Referal code from another user
`oauth_id`<br>*optional* | *string* | Facebook oauth string for sign in
`profile_id`<br>*optional* | *string* | Facebook profile id
`social_login_provider`<br>*optional* | *integer* | Social login provider `id`.<br><br>*<b>1</b> - Facebook*
`type_id`<br>*optional* | *integer* | Type of registration`id`.<br><br>*<b>1</b> - Generic (register form)*<br>*<b>2</b> - Social (Facebook)*<br>*<b>3</b> - Anonymous*

### `params`

Parameter | Type | Description
-------- | ----- | -------
`return_user`<br>*optional, default <b>false</b>* | *boolean* | Request type.<br><br>`POST` - *write data to server (create/update)*<br>`GET` - *read data from server*<br>`DELETE` - *delete data on server*

### Response parameters

Parameter | Type | Description
-------- | ----- | -------
`token `<br>*required* | *integer* | Your session id. Use for `Authorization` header.


# Checklists

```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/checklists/1?expand=all \
--header 'x-client-token: YOUR_API_TOKEN' \
--header 'authorization: YOUR_AUTH_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "display_location": 1,
  "required": true,
  "categories": [
    {
      "id": 25,
      "checklist_id": 1,
      "sort": 100,
      "title": "Client specific requirements",
      "items": [
        {
          "id": 15,
          "category_id": 25,
          "sort": 100,
          "group": 1,
          "title": "Clean your car",
          "required": true
        }
      ]
    }
  ],
  "answers": [
    {
      "id": 3,
      "checklist_id": 1,
      "item_id": 26,
      "answer": 1,
      "note": null
    }
  ]
}
```

This endpoint retrieves full checklist object.

### HTTP Request

`GET https://{base URL}/{version}/checklists/{checklist_id}?expand=all`

### Object attributes

Attribute | Type | Description
--------- | -----| -------------------
`id` | *integer* | Object identifier
`display_location` | *integer* | Points where checklist will be used<br><br>1 - *start of the day*<br>2 - *before checkin*<br>3 - *after checkout*
`required` | *boolean* | Is the item required to be answered
`categories` | [*<a href="#checklists-categories">object</a>*] | Groups checklist questions into sections
`categories.id` | *integer* | Object identifier
`categories.checklist_id` | *integer* | Parent object identifier
`categories.sort` | *integer* | Determines sort position
`categories.title` | *string* | Display title of section for the category
`categories.items` | [*<a href="#checklists-categories-items">object</a>*] | The questions for the category
`categories.item.id` | *integer* | Object identifier
`categories.item.category_id` | *integer* | Parent object identifier
`categories.item.sort` | *integer* | Determines sort position
`categories.item.group` | *integer* | Items can be part of a group. Answers apply to the whole group.
`categories.item.title` | *string* | Display title of question item.
`categories.item.required ` | *boolean* | Is user required to anaswer this question.
`answers` | [*<a href="#checklists-answers">object</a>*] | Checklist answer
`answers.id` | *integer* | Object identifier
`answers.checklist_id` | *integer* | Parent object identifier
`answers.item_id` | *integer* | Checklist question item for this answer.
`answers.answer ` | *integer* | User answer to the question<br><br>0 - *no answer*<br>1 - *confirmed*<br>2 - *declined*
`answers.note ` | *string* | Note for decline.

<aside class="success">
Checklists may be global or related to a job.
</aside>


## /checklists

```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/checklists/1 \
--header 'x-client-token: YOUR_API_TOKEN' \
--header 'authorization: YOUR_AUTH_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "display_location": 1,
  "required": true,
  "categories": [
    25,
    28,
    29
  ],
  "answers": [
    3,
    6
  ]
}
```

This endpoint retrieves checklist object.

### HTTP Request

`GET https://{base URL}/{version}/checklists/{checklist_id}`

### Object attributes

Attribute | Type | Description
--------- | -----| -------------------
`id` | *integer* | Object identifier
`checklist_id` | *integer* | Parent object identifier
`display_location` | *integer* | Points where checklist will be used<br><br>1 - *start of the day*<br>2 - *before checkin*<br>3 - *after checkout*
`required` | *boolean* | Is the item required to be answered
`categories` | [*<a href="#checklists-categories">object</a>*] | Groups checklist questions into sections
`answers` | [*<a href="#checklists-answers">object</a>*] | Checklist answer

<aside class="success">
Checklists may be global or related to a job.
</aside>

## /checklists/categories


```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/checklists/1/categories/25 \
--header 'x-client-token: YOUR_API_TOKEN' \
--header 'authorization: YOUR_AUTH_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
  "id": 25,
  "checklist_id": 1,
  "sort": 100,
  "title": "Client specific requirements",
  "items": [
    1,
    2,
    9
  ]
}
```

This endpoint retrieves checklist category object.

### HTTP Request

`GET https://{base URL}/{version}/checklists/{checklist_id}/categories/{category_id}`

### Object attributes

Attribute | Type | Description
--------- | -----| -------------------
`id` | *integer* | Object identifier
`checklist_id` | *integer* | Parent object identifier
`sort` | *integer* | Determines sort position
`title` | *string* | Display title of section for the category
`items` | [*<a href="#checklists-categories-items">object</a>*] | The questions for the category

## /checklists/categories/items


```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/checklists/1/categories/25/items/15 \
--header 'x-client-token: YOUR_API_TOKEN' \
--header 'authorization: YOUR_AUTH_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
  "id": 15,
  "category_id": 25,
  "sort": 100,
  "group": 1,
  "title": "Clean your car",
  "required": true
}
```

This endpoint retrieves checklist category item object.

### HTTP Request

`GET https://{base URL}/{version}/checklists/{checklist_id}/categories/{category_id}/items/{item_id}`

### Object attributes

Attribute | Type | Description
--------- | -----| -------------------
`id` | *integer* | Object identifier
`category_id` | *integer* | Parent object identifier
`sort` | *integer* | Determines sort position
`group` | *integer* | Items can be part of a group. Answers apply to the whole group.
`title` | *string* | Display title of question item.
`required ` | *boolean* | Is user required to anaswer this question.

## /checklists/answers


```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/checklists/1/answers/3 \
--header 'x-client-token: YOUR_API_TOKEN' \
--header 'authorization: YOUR_AUTH_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
  "id": 3,
  "checklist_id": 1,
  "item_id": 26,
  "answer": 1,
  "note": null
}
```

This endpoint retrieves checklist answer object.

### HTTP Request

`GET https://{base URL}/{version}/checklists/{checklist_id}/answers/{answer_id}`

### Object attributes

Attribute | Type | Description
--------- | -----| -------------------
`id` | *integer* | Object identifier
`checklist_id` | *integer* | Parent object identifier
`item_id` | *integer* | Checklist question item for this answer.
`answer ` | *integer* | User answer to the question<br><br>0 - *no answer*<br>1 - *confirmed*<br>2 - *declined*
`note ` | *string* | Note for decline.
