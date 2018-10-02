---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the eRS Cloud API! You can use our API to access eRS Cloud API endpoints, which can get information on various resources, projects and bookings in our database.

We have language bindings in Shell! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "https://www.eresourcescheduler.cloud/rest/v1/resources"
  -H "Authorization: Bearer <provided_authentication_token>"
```

> Make sure to replace `provided_authentication_token` with your API key.

eRS Cloud uses API keys to allow access to the API. You can register a new eRS Cloud API key at [Authentication Tokens](https://www.eresourcescheduler.cloud/#/profile).

eRS Cloud expects an API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer B8x5Vj1O65r6wnoV`

<aside class="notice">
You must replace <code>B8x5Vj1O65r6wnoV</code> with your personal API key.
</aside>

# Resources Types

## Get All Resource Types

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resourcetype"
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Employee",
    "isHuman": true,
    "fields": [
      {
        "name": "First Name",
        "type": "TEXT",
        "code": "first_name"
      }, {
        "name": "Last Name",
        "type": "TEXT",
        "code": "last_name",
      }, {
        "name": "Team",
        "type": "DDSS",
        "code": "team",
        "options": [{
          "id": 1,
          "name": "Developer"
        }, {
          "id": 2,
          "name": "Tester"
        }]
      }
    ]
  }
]
```

This endpoint retrieves all Resource Types.

### HTTP Request

`GET https://app.eresourcescheduler.cloud/rest/v1/resourcetype`


## Get a Specific Resource Type

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resourcetype/1"
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Employee",
  "isHuman": true,
  "fields": [
    {
      "name": "First Name",
      "type": "TEXT",
      "code": "first_name"
    }, {
      "name": "Last Name",
      "type": "TEXT",
      "code": "last_name",
    }, {
      "name": "Team",
      "type": "DDSS",
      "code": "team",
      "options": [{
        "id": 1,
        "name": "Developer"
      }, {
        "id": 2,
        "name": "Tester"
      }]
    }
  ]
}
```

This endpoint retrieves a resource type.

### HTTP Request

`GET https://app.eresourcescheduler.cloud/rest/v1/resourcetype/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the resource type to retrieve


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

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
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

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
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

