---
title: EventHero API Reference

toc\_footers:
  - \~<a href='#'>\~Sign Up for a Developer Key\~</a>\~
  - \~<a href='https://github.com/tripit/slate'>\~Documentation Powered by Slate\~</a>\~

includes:
  - errors

search: true
---

# Introduction

## Send your participant data to EventHero for on-site management and event analytics

### Simple Integration with Your Event Registration System

Your EventHero account has the ability to receive changes from your registration system whenever a change occurs to your event.  

For a complete list of current registration system integrations, see our [Partner Directory](http://eventhero.io/partners/).

If your registration system is not listed contact us - or connect it yourself using our API.

This API documentation page is created from the [EventHero API Docs repository](https://github.com/eventhero/api-docs).

Feel free to log Issues or submit Pull Requests with improvements.

Unable to implement webhooks? Do you already have a REST API and would prefer we poll that for changes? [Contact us.](http://eventhero.io/contact)

# Endpoint

`https://app.eventhero.io/api/registrations`

# Authentication

To authenticate API requests, event organizers (customers of EventHero) need to create an access key for an event and communicate the access key to developers accessing API.

Access keys are event specific, and perform dual function: authentication of the caller of the API, and authorization of the caller to access a particular event.

Access key needs to be passed in the HTTP Authorization header using Bearer scheme: `Authorization: Bearer <ACCESS_KEY>`

> Example API call with authorization header:

\`\`\`shell
curl "https://app.eventhero.io/api/registrations" \\
  -H "Authorization: Bearer \<ACCESS\_KEY\>" \\
  ...
\`\`\`
\~\~ <aside class="notice">
\~\~ Remember — to replace &lt;ACCESS\_KEY&gt; with your event access key!
\~\~ </aside>

# Versioning and Media Types

EventHero API uses different content types for versioning.

Currently the v1 version of the API accepts only `application/vnd.eventhero.registrations.v1+json` media type.

When calling API endpoints the HTTP requests need to include the following Content-Type header:
`Content-Type: application/vnd.eventhero.registrations.v1+json`

> Example API call with an acceptable Content-Type header:

\`\`\`shell
curl "https://app.eventhero.io/api/registrations" \\
  -H "Content-Type: application/vnd.eventhero.registrations.v1+json" \\
  ...
\`\`\`

Please note that incompatible media types (e.g. `application/json`) will be rejected with HTTP 415 error code.

# Registration Confirmed Activity

## Request Structure

> Given the following JSON body in `reg_confirmed.json` file

\`\`\`json
\{
  "type": "registration.confirmed",
  "data": \{
\'' "ref": "reg:1",
\'' "type": {
\''   "id": "rt:234",
\''   "name": "General Admission"
\'' },
\'' "event": {
\''   "name": "My Event",
\''   "url": "http://eventbrite.com/..."
\'' },
\'' "registrant": {
\''   "first\_name": "Lindsey",
\''   "last\_name": "Tessmer",
\''   "job\_title": "QA",
\''   "company": "Redargyle",
\''   "phone": "(585) 412-2153",
\''   "email": "lindsey@redargyle.com",
\''   "address": {
\''     "street\_address": "2220 Sylvania Avenue",
\''     "extended\_address": "#33",
\''     "locality": "Knoxville",
\''     "region": "TN",
\''     "postal\_code": "37920",
\''     "country": "USA"
\''   }
\'' },
\'' "answers": [
\''   {
\''     "question": { "label": "What is your T-shirt size?" },
\''     "answer": "XXL"
\''   }
\'' ]
  }
}
\`\`\`

\`\`\`shell
cat reg\_confirmed.json \> curl -i -X POST -d @- \\
  -H 'Content-Type: application/vnd.eventhero.registrations.v1+json' \\
  -H 'Authorization: Bearer \<ACCESS\_KEY\>' \\
  https://app.eventhero.io/api/registrations
\`\`\`

> The above command returns HTTP 200 success and JSON structure like this:

\`\`\`json
\{
  "status": 200
}
\`\`\`

Key | Example | Description
--- | ------- | -----------
type      | "registration.confirmed" | Name of the activity
data |  | Object that contains information on the activity
data.ref | None | Registration reference. Should be unique across all registrations for this event. You may use identifiers in your system as the ref value.
data.type | Object | Object representing [Registration Type]
data.event | Object | Object representing [Event]
data.registrant | Object | Object representing [Registrant]

### Registration Type

Key | Example | Description
--- | ------- | -----------
ref | "123" | ID representing registration type
name | "General Admission" | Name for the registration type

### Event

Key | Example | Description
--- | ------- | -----------
url | "http://example.com/my-event" | URL for the source event
name | "My Event" | Name for the event

### Registrant

Key | Example | Description
--- | ------- | -----------
first\_name | "Lindsey" | |
last\_name | "Tessmer" |  |
job\_title | "QA" | |
company | "Redargyle" | |
phone | "(585) 412-2153" | |
email | "lindsey@redargyle.com" | |
address | Object | Object representing address of the registrant |
address.street\_address | "2220 Sylvania Avenue" | |
address.extended\_address | "#33" | |
address.locality | "Knoxville" | |
address.region | "TN" | |
address.postal\_code | "37920" | |
address.country | "USA" | |


### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
\--------- | ------- | -----------
include\_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

## Get a Specific Kitten

\`\`\`ruby
require 'kittn'

api = Kittn\::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
\`\`\`

\`\`\`python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
\`\`\`

\`\`\`shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
\`\`\`

\`\`\`javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
\`\`\`

> The above command returns JSON structured like this:

\`\`\`json
\{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
\`\`\`

This endpoint retrieves a specific kitten.

\~\~ <aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
\--------- | -----------
ID | The ID of the kitten to retrieve