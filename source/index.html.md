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

# Checklists

## /checklists


```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/checklists/1 \
--header 'authorization: 5dc54yuch5sabfxr90d46hcifv1pdt59f1s3q0jzxinjl5y1' \
--header 'x-client-token: ffx0jW6rwE1VeE4F53ElyfuSbII92rfhEBFgf4wpmoZkP58bJGtkkIu15g9Z0end'
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
`categories` | *<a href="#checklists-categories">object</a>* | Groups checklist questions into sections
`answers` | *<a href="#checklists-answers">object</a>* | Checklist answer

<aside class="success">
Checklists may be global or related to a job.
</aside>

## /checklists/categories


```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/checklists/1/categories/25 \
--header 'authorization: 5dc54yuch5sabfxr90d46hcifv1pdt59f1s3q0jzxinjl5y1' \
--header 'x-client-token: ffx0jW6rwE1VeE4F53ElyfuSbII92rfhEBFgf4wpmoZkP58bJGtkkIu15g9Z0end'
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
`items` | *<a href="#checklists-categories-items">object</a>* | The questions for the category

## /checklists/categories/items


```shell
curl --request GET \
--url https://api.fantasticservices.com/v2/checklists/1/categories/25/items/15 \
--header 'authorization: 5dc54yuch5sabfxr90d46hcifv1pdt59f1s3q0jzxinjl5y1' \
--header 'x-client-token: ffx0jW6rwE1VeE4F53ElyfuSbII92rfhEBFgf4wpmoZkP58bJGtkkIu15g9Z0end'
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
--header 'authorization: 5dc54yuch5sabfxr90d46hcifv1pdt59f1s3q0jzxinjl5y1' \
--header 'x-client-token: ffx0jW6rwE1VeE4F53ElyfuSbII92rfhEBFgf4wpmoZkP58bJGtkkIu15g9Z0end'
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
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