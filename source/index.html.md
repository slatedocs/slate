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

## Applications identifying tokens

To access API all request must include identifying token header field

`X-Client-Token: token`

<aside class="notice">
You must replace <code>token</code> with your personal API token.
</aside>

## Authentication

To access user specific data request should include header field

`Authorization: Bearer token`

<aside class="notice">
You must replace <code>token</code> with your personal authorization token.
</aside>




# Communication Protocol

## Read

```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/services/1 \
--header 'x-client-token: YOUR_API_TOKEN'
```

> The above command returns JSON structured like this:

```json
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
```

Get data by requesting it by resource name. Add id for specific object.

`GET https://{base URL}/{version}/services/1`


### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
`expand` | *none* | Attributes to be returned as full objects
`fields` | *all* | Attributes to receive in response
`exclude_fields` | *none* | Attributes to exclude from response



## Create/Update

```shell
curl --request POST \
--url https://api.fantasticservices.com/v2/addresses \
--header 'x-client-token: YOUR_API_TOKEN' \
--header 'authorization: YOUR_AUTH_TOKEN' \
  --data '{"address_line_1":"9 Apt.","address_line_2":"24 Red Lion Street","postcode":"SW12 2TN","lat":51.604903,"lng":-0.457022}'
```

> The above command posts JSON structured like this:

```json
{
  "address_line_1": "9 Apt.",
  "address_line_2": "24 Red Lion Street",
  "postcode": "SW12 2TN",
  "lat": 51.604903,
  "lng": -0.457022
}
```

> The above request success response is:

```json
{
  "id": 2
}
```

Create objects by posting data to the resource name. Add id to update existing objects

`POST https://{base URL}/{version}/addresses`

If operation is successful created/updated object id is returned.

## Delete

```shell
curl --request DELETE \
--url https://api.fantasticservices.com/v2/addresses/2 \
--header 'x-client-token: YOUR_API_TOKEN' \
--header 'authorization: YOUR_AUTH_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
  "id": 2
}
```

Delete objects by sending delete request with the resource name and object id

`DELETE https://{base URL}/{version}/addresses/2`

If object is deleted successfully it's id is returned.

## Batching requests

```shell
curl --request POST \
--url https://api.fantasticservices.com/v2/addresses \
--header 'x-client-token: YOUR_API_TOKEN' \
--header 'authorization: YOUR_AUTH_TOKEN' \
--data '{"requests":[{"method":"POST","path":"addresses","object":{"address_line_1":"7 Apt.","address_line_2":"27 Red Lion Street","postal":"SW14 8PT","lat":51.604903,"lng":-0.457022}},{"method":"POST","path":"addresses/27","object":{"address_line_1":"7 Apt.","address_line_2":"27 Red Lion Street"}}]}'
```

> The above command posts JSON structured like this:

```json
{
  "requests": [
    {
      "method": "POST",
      "path": "addresses",
      "object": {
        "address_line_1": "7 Apt.",
        "address_line_2": "27 Red Lion Street",
        "postal": "SW14 8PT",
        "lat": 51.604903,
        "lng": -0.457022
      }
    },
    {
      "method": "POST",
      "path": "addresses/27",
      "object": {
        "address_line_1": "7 Apt.",
        "address_line_2": "27 Red Lion Street"
      }
    }
  ]
}
```

> The above request success response is:

```json
[
  {
    "id": 28
  },
  {
    "id": 27
  }
]
```

Requests can be combined by sending array of request objects.

`POST https://{base URL}/{version}/resources`

### Post Parameters

Parameter | Type | Description
--------- | ---- | -----------
`method` | *string* | HTTP method of combined request
`path` | *string* | Resource path of combined request
`object` | *object* | Body of combined request

<aside class="notice">
Query parameters are passed as attributes to the request object e.g. `fields` is array of strings etc.
</aside>


## Response structure


> JSON response structured

```json
{
  "data": [
    {
      "objects": [
        {
          "id": 27
        }
      ],
      "success": [
        {
          "code": 1020,
          "message": "Address created."
        }
      ]
    }
  ],
  "meta": {
    "DBVersion": 25
  }
}
```

Requests can be combined by sending array of request objects.

`POST https://{base URL}/{version}/resources`

### Response attributes

Parameter | Type | Description
--------- | ---- | -----------
`data` | *array* | Array of responses of requests (one or more if batched).
`meta` | *object* | Attributes containing information for the system.
`objects` | *array* | Response data for the request
`success`, `warning`, `error` | *array* | Messages with information for the request

<aside class="notice">
Single and batched requests return the same response format.
</aside>








# Checklists

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
  "sort": 1,
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
  "sort": 1,
  "group": 1,
  "title": "Clean your car",
  "needs_confirmation": true
}
```

This endpoint retrieves checklist category item object.

### HTTP Request

`GET https://{base URL}/{version}/checklists/{checklist_id}/categories/{category_id}/items/{item_id}`

### Object attributes

Attribute | Type | Description
--------- | -----| -------------------
`id` | *integer* | Object identifier
`sort` | *integer* | Determines sort position
`group` | *integer* | Items can be part of a group. Answers apply to the whole group.
`title` | *string* | Display title of question item.
`needs_confirmation ` | *boolean* | Is user required to anaswer this question.

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
`item_id` | *integer* | Checklist question item for this answer.
`answer ` | *integer* | User answer to the question<br><br>0 - *no answer*<br>1 - *confirmed*<br>2 - *declined*
`note ` | *string* | Note for decline.
