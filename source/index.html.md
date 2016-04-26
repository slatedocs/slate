---
title: API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Optisom Sleep Health Platform API! As an Optisom Platform Level 
Partner, you can use our API endpoints to obtain information on users, assessments,
challenges, diary entries and other information related to the your user's progress 
through the Optisom Sleep Health Program.

We have example code to query the API using Curl.  You can view code examples in the dark 
area.

# Key Concepts
The Optisom Sleep Health Platform encompasses several key concepts that are necessary to 
understand how to use the system properly. 
The easiest way to contextualize these concepts is to view them from the user's experience. This 
experience is primarily made of two use cases; screening and taking sleep health 
challenges.  

A screening consists of a series of questions that survey the user's sleep health.
Based on the user's responses to these questions, a sleep health report is produced and a 
set of sleep health modules are assigned to the user.  


These modules contain tasks, in the form of challenge cards, 
that the user can undertake in order to improve their sleep health.  As a user completes
tasks, points are awarded.  These points can be used to tie the user's progress to
incentive rewards, or as a part of creating competition between users and teams.

All attributes concerning the user, screening, challenges and more are accessible through 
standard webservice API calls which responds with JSON data structures. 

As an Optisom Platform Partner, you should have been provided with an email login 
and a password to your Optisom Sleep Health API Service, which we'll refer to as "the Optisom Service" 
going forward.  If you do not have the email or password, please contact Partner Support 
at <partnersupport@optisom.com>. This information is used to obtain authentication credentials for
the Optisom Service.

# Authentication

## Authentication Headers Format

Authentication information is required for every request.  This information should be placed
in the headers of each request by the client.  The headers follow the RFC 6750 Bearer Token format:

```
  Access-Token: Jap0KPYbYrdbs7fuPfcN2g
  Token-Type: Bearer
  Client: 3LNndC01Qcle0NTzSZMMDg
  Expiry: 1462471387
  Uid: partner_abc@optisom.com
```


## Creating an Authentication Token

Using your email and password, you can create an authentication token by posting to the 
API sign_in endpoint.

`https://partner_abc.optisom.com/api/v2/auth/sign_in`

<aside class="notice">
The email, password and domain name should be replaced with the information provided 
to you by our partner support team.
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
The Access-Token, Client and Expiry should be replaced with the values from the response 
for an authenticated token request.

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

# Users
Once you have successfully authenticated against the Service, you will need to create an account on the Optisom Service
which you should associate to an account on your platform.  The Optisom Service requires an email address; if your 
service also requires email address, this is the simplest way to associate the two accounts.  

However, if your service does not use email address for user sign-in, a generic user identifier is also provided.
In this case, you will have to create a dummy email address to satisfy the account validation mechanism
on the Optisom Service.

## Creating a User Account
## Requesting a List of All Users
## Requesting a Specific User Account by Email
## Requesting a Specific User By User Identifier

# Screening
After a user account has been created, the user is then required to take a screening to determine
their current sleep health.  A screening consists of questions that can be grouped together.  
These groupings are referred to as question_groups in the API.  

## Creating a Screening for a User
A screening can be created for a user with this request

`GET https://partner_abc.optisom.com/api/v2/users{user_id}/screenings

The response will return the next question_qroup_id which can be used to request the next set of questions.

```json
{
  "screening": "API::V2::Screening",
  "meta": {
    "completed": false,
    "next_group_id": 0,
    "progress": {
      "percent_complete": 0
    }
  }
}
```

## Showing a Question Group

```json
{
  "question_group": {
    "id": 1,
    "header": "About You",
    "description": "Let's start by gathering some basic information about you.",
    "handle": "demographics",
    "questions": [
      {
        "id": 1,
        "prompt": "Gender",
        "required": true,
        "type": "select",
        "subtype": "gender",
        "position": 2,
        "default_demo_answer": null,
        "max_allowed_selections": 1,
        "min_allowed_selections": 1,
        "possible_answers": [
          {
            "value": "1",
            "content": "Male",
            "position": 1
          },
          {
            "value": "2",
            "content": "Female",
            "position": 2
          }
        ]
      },
      {
        "id": 2,
        "prompt": "Date of birth",
        "required": true,
        "type": "date",
        "subtype": "dob",
        "position": 3,
        "default_demo_answer": null,
        "max_allowed_value": "1997-11-08",
        "min_allowed_value": "1915-11-08"
      },
      {
        "id": 3,
        "prompt": "Height",
        "required": true,
        "type": "integer",
        "subtype": "height",
        "position": 4,
        "default_demo_answer": null,
        "max_allowed_value": 95,
        "min_allowed_value": 36,
        "units": "inches"
      }
    ]
  },
  "meta": {
    "progress": {
      "percent_represented": 11
    }
  }
}
```

`GET https://partner_abc.optisom.com/api/v2/users{user_id}/screenings/{screening_id}/groups/{id}`

The response will return the questions that are contained in that question group, along with 
metadata.


### Question Group

Attribute   |Type      |Description
------------|----------|------------
id          |integer   |ID for instance of object
header      |string    |Title for Question Group
description |string    |Description for Question Group
handle      |string    |human readable identifier
percent_represented|integer|Current percent complete to display to user

### Question

Attribute   |Type      |Description
------------|----------|------------
id          |integer   |ID for instance of object
prompt      |string    |Text of question
required    |boolean   |Must be answered or not
type        |string    |Format of question
max_allowed_selections|integer|Maximum number of answer values
min_allowed_selections|integer|Minimum number of answer values
units       |string|unit of measurement for question


### Possible Answers

Attribute   |Type      |Description
------------|----------|------------
value       |integer   |Numerical representation of answer choice
content     |string    |Text representation of answer choice to be displayed
position    |integer   |Order of answer choice with respect to other answer choices



<aside class="notice">
The "handle" attribute is used often in the Optisom Service as a unique, 
immutable identifier for specific objects, such as question group.

</aside>



## Submitting Answers

## Requesting Subsequent Question Groups


# Devices

# Therapies



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

