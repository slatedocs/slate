---
title: EventHero API Reference

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the EventHero API!

This API documentation page is created from [EventHero API Docs repository](https://github.com/eventhero/api-docs).
Feel free to log Issues or submit Pull Requests with improvements.

# Endpoint

`https://app.eventhero.io/api/registrations`

# Authentication

To authenticate API requests, event organizers (customers of EventHero) need to create an access key for an event and communicate the access key to developers accessing API.
Access keys are event specific, and perform dual function: authentication of the caller of API, and authorization of the caller to access a particular event.

Access key needs to be passed in HTTP Authorization header using Bearer scheme: `Authorization: Bearer <your access key>`

> Example API call with authorization header:

```shell
curl "https://app.eventhero.io/api/registrations" \
  -H "Authorization: Bearer <your access key>" \
  ...
```

# Media Types and Versioning

EventHero API uses different content types for versioning.
Currently the v1 version of the API accepts only `application/vnd.eventhero.registrations.v1+json` media type.
When calling API endpoints the HTTP requests need to include the following Content-Type header:
`Content-Type: application/vnd.eventhero.registrations.v1+json`

> Example API call with an acceptable Content-Type header:

```shell
curl "https://app.eventhero.io/api/registrations" \
  -H "Content-Type: application/vnd.eventhero.registrations.v1+json" \
  ...
```

Please note that incompatible media types (e.g. `application/json`) will be rejected with HTTP 415 error code.

# Requests

## Registration Confirmed

> Given the following JSON body in `reg_confirmed.json` file

```json
{
  "type": "registration.confirmed",
  "data": {
    "ref": "reg:1",
    "type": {
      "id": "rt:234",
      "name": "General Admission"
    },
    "event": {
      "name": "My Event",
      "url": "http://eventbrite.com/..."
    },
    "registrant": {
      "first_name": "Lindsey",
      "last_name": "Tessmer",
      "job_title": "QA",
      "company": "Redargyle",
      "phone": "(585) 412-2153",
      "email": "lindsey@redargyle.com",
      "address": {
        "street_address": "2220 Sylvania Avenue",
        "extended_address": "#33",
        "locality": "Knoxville",
        "region": "TN",
        "postal_code": "37920",
        "country": "USA"
      }
    },
    "answers": [
      {
        "question": { "label": "What is your T-shirt size?" },
        "answer": "XXL"
      }
    ]
  }
}
```

```shell
cat reg_confirmed.json > curl -i -X POST -d @- \
  -H 'Content-Type: application/vnd.eventhero.registrations.v1+json' \
  -H 'Authorization: Bearer <ACCESS_KEY>' \
  https://app.eventhero.io/api/registrations
```

> The above command returns HTTP 200 success and JSON structure like this:

```json
{
  "status": 200,
}
```
<aside class="success">
Remember — to replace &lt;ACCESS_KEY&gt; with your event access key!
</aside>

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

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

