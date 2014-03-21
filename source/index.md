---
title: St. Baldrick's Foundation API Reference

language_tabs:
  - shell
  - ruby

toc_footers:
 - <a href='#'>Sign Up for a Developer Key</a>
 - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>
---

# Introduction

Welcome to the St. Baldrick's Foundation API! You can use our API to access St. Baldrick's Foundation API endpoints, which can get, create, and update information on various events, teams, participants, fundraisers, donations, etc.

We have language bindings in shell and Ruby. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](http://github.com/tripit/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```ruby
require 'sbf'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.stbaldricks.org/v2"
  -H "Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

The St. Baldrick's Foundation uses API keys to allow access to the API. You can register a new SBF API key at our [developer portal](http://example.com/developers).

SBF expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace `meowmeowmeow` with your personal API key.
</aside>

# Participants

## Participant Shape

Participants represent an individual (represented by a Profile) that is participating at an event. The most common form of participant is a "shavee", but other types include "organizer", "lead organizer", "treasurer", "lead tresurer", "team captain", "barber", "barber coordinator", "volunteer", and "registrar".

## Get Participant

```ruby
require 'sbf'

api = SBF::APIClient.authorize!('meowmeowmeow')
api.participants.get
```

```shell
curl "http://api.stbaldricks.org/v2/participants"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json

{
  "id": 2,
  "event": {"content": "event hash"},
  "is_barber": false,
  "is_shavee": true
}

```

This endpoint retrieves one unique participant.

### HTTP Request

`GET https://api.stbaldricks.org/v2/participant`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_event | false | If set to true, the result will also include the event.
include_profile | false | If set to true, the result will also include the profile.
include_team | false | If set to true, the result will also include the team.
id |  | The ID of the participant to retrieve

<aside class="success">
Remember — a happy user is an authenticated user!
</aside>

# Errors

The Kittn API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The kitten requested is hidden for administrators only
404 | Not Found -- The specified kitten could not be found
405 | Method Not Allowed -- You tried to access a kitten with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
410 | Gone -- The kitten requested has been removed from our servers
418 | I'm a teapot
429 | Too Many Requests -- You're requesting too many kittens! Slown down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
