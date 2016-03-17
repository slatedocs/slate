---
title: API Reference

language_tabs:
  - ruby

toc_footers:
  - <a href='https://incidentreport-120.herokuapp.com'>InstaPort Home</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the [InstaPort](https://incidentreport-120.herokuapp.com) API! You can use our API to access API endpoints, which can get information on incidents or users in our database.

We have language bindings in Ruby! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This API documentation page was created with [Slate](https://github.com/tripit/slate).

# Authentication

Our current MVP allows full access to all of the end points and thus does not require any Authentication.  We will update this section of the documents once our authentication component is complete.

# Incidents

## Get All Incidents

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
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

## Get a Specific Incident

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
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

## Edit a Specific Incident


> Sending the following curl command:

> curl -X PUT --data 
'incident[title]=A
&incident[location]=B
&incident[comments]=C
&incident[severity]=1
&incident[incident_type]=D
&incident[groups]=E' 
http://www.incidentreport-120.herokuapp.com/incidents/{INCIDENT ID NUMBER}.json 

> returns an object similar to the following JSON

```json
{"id":INCIDENT ID NUMBER,
"title":"A",
"location":"B",
"severity":1,
"incident_type":"D",
"comments":"C",
"user":"Demo User",
"groups":"E",
"status":0,
"reported_by":null,
"assigned_to":null,
"created_at":"2016-03-17T20:35:00.068Z",
"updated_at":"2016-03-17T20:35:00.068Z"}
```

This endpoint edits a specified incident.

### HTTP Request

`PUT http://incidentreport-120.herokuapp.com/incidents/{incident id}.json`

### Form Data

Key | Value
--------- | -----------
incident[title] | string
incident[location] | string
incident[comments] | text
incident[severity] | integer between 1-4
incident[incident_type] | string
incident[groups] | string
_method | 'patch'

## Create a New Incident


> Sending the following curl command:

> curl --data 
'incident[title]=A
&incident[location]=B
&incident[comments]=C
&incident[severity]=1
&incident[incident_type]=D
&incident[groups]=E' 
http://www.incidentreport-120.herokuapp.com/incidents.json 

> returns an object similar to the following JSON

```json
{"id":1,
"title":"A",
"location":"B",
"severity":1,
"incident_type":"D",
"comments":"C",
"user":"Demo User",
"groups":"E",
"status":0,
"reported_by":null,
"assigned_to":null,
"created_at":"2016-03-17T20:35:00.068Z",
"updated_at":"2016-03-17T20:35:00.068Z"}
```

This endpoint creates a new incident. 


### HTTP Request

`POST http://incidentreport-120.herokuapp.com/incidents.json`

### Form Data

Key | Value
--------- | -----------
incident[title] | string
incident[location] | string
incident[comments] | text
incident[severity] | integer between 1-4
incident[incident_type] | string
incident[groups] | string


# Users

## Create a New User

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
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
