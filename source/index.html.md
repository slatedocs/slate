---
title: Runnity Documentations Reference

language_tabs:
  - http

includes:
  - errors

search: true
---

# Introduction

Welcome to the Runnity documentation! You can use our API to access Runnity API endpoints, which can get information on various runs, events etc. in our database.

In the left side, you have URL description. And in the right side, you have the resppnse.

# Authentication

## Login to API (Private)

`POST /login`

```http
POST /login HTTP/1.1
User-Agent: MyClient/1.0.0
Host: api.runnity.com
Content-Type: application/json
```
```json
{
  "user": "username",
  "password": "password"
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/json
```
```json
{
  "userLevel": "user",
  "token": "HEjeFWfowifwhi3852nkdshit3"
}
```

```http
HTTP/1.1 402 KO
Content-Type: application/json
```
```json
{
  "error": {
      "code": "402",
      "message": "Invalid username or password"
  }
}
```

### PARAMETERS

Parameters    | Required  | Type   | Description
--------------|-----------|--------|-------------
user          | YES       | String | User login
password      | YES       | String | User password

### ATTRIBUTES

Attribute     | Type   | Description
--------------|--------|--------------
userLevel     | String | User level access rights
token         | String | User's token

The possibilities for `userLevel` for now are:

* admin
* user

## Logout (Private)

`GET /logout`

Destroy token session. No JSON returned

## Login URL - Third party apps (Private)

`GET login/<token>`

```json
{
  "error": {
    "code": 401,
    "message": "Invalid token"
  }
}
```

```json
{
  "userLevel": "admin"
}
```

This URL required a token that user has to ask before. We avoid to ask for username and password directly in URL, because they can be interpreted by hackers.

<aside class="warning">
  Do not user yet, this need to be improved.
</aside>

# Runs

## Create a new run (Private)[POST]

`POST /run/new`

```http
POST /run/new HTTP/1.1
User-Agent: MyClient/1.0.0
Host: api.runnity.com
Content-Type: application/json
```
```json
{
  "started_at": "2016-02-15",
  "src_latitude": 45.754189,
  "src_longitude": 4.840339,
  "dest_latitude": 45.754189,
  "dest_longitude": 4.840339
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/json
```
```json
{
  "id": 1
}
```

### PARAMETERS

Parameters      | Required  | Type     | Description
----------------|-----------|----------|-------------
started_at      | YES       | Datetime | Exact date run creation
src_latitude    | YES       | Double   | User current latitude
src_longitude   | YES       | Double   | User current longitude
dest_latitude   | NO        | Double   | User destination
dest_longitude  | NO        | Double   | User destination

### ATTRIBUTES

Attibutes     | Type     | Description
--------------|----------|----------------
id            | String   | New run id

You don't have to specify a start point.

## Update a run (Private)

`PUT /run/update`

```http
PUT /run/update HTTP/1.1
User-Agent: MyClient/1.0.0
Host: api.runnity.com
Content-Type: application/json
```
```json
{
  "id": "2016-02-15",
  "latitude": 45.754189,
  "longitude": 4.840339,
  "speed": 10
}
```

### PARAMETERS

Parameters      | Required  | Type     | Description
----------------|-----------|----------|-------------
id              | YES       | Integer  | Run to update
latitude        | YES       | Double   | Current position
longtitude      | YES       | Double   | Current position
speed           | NO        | Short    | Current speed
updated_at      | YES       | Datetime | Datetime of the recorded update

# Events

You can create a run event. With this option, you have to choose a date that event will start
, a location, you can or not specify a destination location. And of course, you can invite your friends into this run.
Event can be public or private.

<aside class="notice">
  If event is public, everyone can participate to your event.
</aside>

<aside class="warning">
  Documentation is not complete, wait until update before using this.
</aside>

## Create events (Private)

`POST /event/new`

```http
POST /event/new HTTP/1.1
User-Agent: MyClient/1.0.0
Host: api.runnity.com
Content-Type: application/json
```

```json
{
  "success": {
    "code": 202,
    "message": "Event created"
  }
}
```

### PARAMETERS

Parameters        | Required  | Type    | Description
------------------|-----------|---------|-------------
name              | YES       | String  |
date              | YES       | Date    |
time              | YES       | Time    |
private           | YES       | Bool    |
src_latitude      | YES       | Double  |
src_longtitude    | YES       | Double  |
dest_latitude     | NO        | Double  |
dest_longtitude   | NO        | Double  |

## Get events (Private)

`GET /event/:id`

```http
POST /event/list HTTP/1.1
User-Agent: MyClient/1.0.0
Host: api.runnity.com
Content-Type: application/json
```

```json
{
    "comeUp": [{
        "id": 1,
        "private": false,
        "name": "name",
        "date": "2015-10-24",
        "time": "18:00",
        "latitude": 43.14352,
        "longtitude": 3.34142,
        "participants": [
          "Jean-Paul",
          "Jason",
          "Christophe"
        ], // List of participants ({Array.<String>}, may be {Array.<Object>})
        "status": <String>, // passed, current or come up
        "isCreator": ""
    }],
    "passed": [{
        "id": 1, // Event Id
        "private": <Bool>, // Event display
        "name": <String>, // Event name
        "date": <Date>, // Event date
        "hour": <Time>, // Event time
        "latitude": <Double>, // Latitude of start position
        "longtitude": <Double>, // Longtitude of start position
        "participants": [<String>] // List of participants ({Array.<String>}, may be {Array.<Object>})
        "status": <String>, // passed, current or come up
        "isCreator": <Boolean>, // true yes, false no
    }],
    "current": [{
        "_id": <Int>, // Event Id
        "private": <Bool>, // Event display
        "name": <String>, // Event name
        "date": <Date>, // Event date
        "hour": <Time>, // Event time
        "latitude": <Double>, // Latitude of start position
        "longtitude": <Double>, // Longtitude of start position
        "participants": [<String>] // List of participants ({Array.<String>}, may be {Array.<Object>})
        "status": <String>, // passed, current or come up
        "isCreator": <Boolean>, // true yes, false no
    }]
}
```

Parameters        | Required  | Type    | Description
------------------|-----------|---------|----------
id                | YES       | String  | Event id

<aside class="warning">
  Documentation is not complete, wait until update before using this.
  Someone need to correct this...
</aside>

# Models

## User Model

`User model`

```javascript
  exports.example = function(req, res) {

  var User = require('path_to_model');

  var user = new User({
      firstname = ...;
      lastname = ...;
      ...;
  });

  user.save(function(err) {
    if (err) return next(err);
    res.send(error_msg);
  });
  res.send(success_msg);
  };
```

### PARAMETERS

Parameters      | Required  | Type     | Description
----------------|-----------|----------|-------------
create_at       | YES       | Datetime | Register date
logged_at       | YES       | Datetime | Last connexion date
enable          | YES       | boolean  | account activation & ban
email           | YES       | String   | User mail
phone           | NO        | String   | User phone
ranking         | NO        | String   | User ranking "beginner, intermediaire, confirm or professional"
firstname       | NO        | String   | User firstname
lastname        | NO        | String   | User lastname
birthday        | NO        | String   | User birthday
address         | NO        | String   | User adress
city            | NO        | String   | User city
postal_code     | NO        | String   | User postal code
token           | YES       | String   | User token
role            | YES       | String   | role "user"

## Pro Model

`Pro model`

### PARAMETERS
Parameters      | Required  | Type     | Description
----------------|-----------|----------|-------------
create_at       | YES       | Datetime | Register date
logged_at       | YES       | Datetime | Last connexion date
enable          | YES       | boolean  | account activation & ban
email           | YES       | String   | Pro mail
phone           | NO        | String   | Pro phone
society         | YES       | String   | Society name
address         | NO        | String   | Pro adress
city            | NO        | String   | Pro city
postal_code     | NO        | String   | Pro postal code
token           | YES       | String   | Pro token
role            | YES       | String   | role "pro"


<aside class="notice">
    Token generator : sha512(logged_at + firstname + id)
</aside>