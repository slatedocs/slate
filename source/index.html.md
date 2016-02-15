---
title: API Reference

language_tabs:
  - json

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Runnity API! You can use our API to access Runnity API endpoints, which can get information on various runs, events etc. in our database.

In the left side, you have URL description. And in the right side, you have returned JSON.

# Authentication

## Log in URL (Private)[GET]

`http://api.runnity.com/login/<token>`
> Error JSON:

```json
{
  "error": {
    "code": 401,
    "message": "Invalid token"
  }
}
```

> Valid JSON:

```json
{
  "userLevel": "admin"
}
```

This URL required a token that user has to ask before. We avoid to ask for username and password directly in URL, because they can be interpreted by hackers.

The possibilities for `userLevel` for now are:

  * admin
  * user

<aside class="notice">
When user change their password. We'll generate automatically a new token.
</aside>

## Log out (Private)[GET]

`http://api.runnity.com/logout`

Destroy token session. No JSON returned

# Runs

When you create a run, it's immediatly. You don't have to specify a start point,
hour, and you can't invite your friends in this solo run.

## Create a new run (Private)[POST]

`http://api.runnity.com/run/new?param=...[&param=...]`

Param         | Required  | Default | Type
--------------|-----------|---------|-----
id            | YES       | HASH    | String
latitude      | YES       | NULL    | Double
longtitude    | YES       | NULL    | Double
deslatitude   | NO        | NULL    | Double
deslongtitude | NO        | NULL    | Double

> Error JSON:

> Valid JSON:

## Update a run (Private)[PUT]

`http://api.runnity.com/run/update?param=...[&param=...]`

Param         | Required  | Default | Type
--------------|-----------|---------|-----
id            | YES       | HASH    | String
latitude      | YES       | NULL    | Double
longtitude    | YES       | NULL    | Double
deslatitude   | NO        | NULL    | Double
deslongtitude | NO        | NULL    | Double
speed         | YES       | 0       | Int

> Error JSON:

> Valid JSON:

# Events

You can create a run event. With this option, you have to choose a date that event will start
, a location, you can or not specify a destination location. And of course, you can invite your friends into this run.
Event can be public or private.

<aside class="notice">
If event is public, everyone can participate to your event.
</aside>
<aside class="warning">
If event is public, everyone can participate to your event.
</aside>

## Create events (Private)[POST]

`http://api.runnity.com/event/new?param=...[&param=...]`

Param         | Required  | Default | Type
--------------|-----------|---------|-----
id            | YES       | HASH    | String
name          | YES       | NULL    | String
date          | YES       | Current | Date
time          | YES       | Current | Time
private       | YES       | true    | Bool
latitude      | YES       | NULL    | Double
longtitude    | YES       | NULL    | Double
deslatitude   | NO        | NULL    | Double
deslongtitude | NO        | NULL    | Double


> Eror JSON:

```json
{
  "error": {
    "code": 303,
    "message": "Missing parameters"
  }
}
```

> Valid JSON:

```json
{
  "success": {
    "code": 202,
    "message": "Event created"
  }
}
```

## Get events (Private)[GET]

`http://api.runnity.com/event/list?param=...[&param=...]`

Param         | Required  | Default | Type
--------------|-----------|---------|-----
id            | YES       | HASH    | String
name          | NO        | NULL    | String
date          | NO        | Current | Date
time          | NO        | Current | Time
private       | NO        | true    | Bool
latitude      | NO        | NULL    | Double
longtitude    | NO        | NULL    | Double
deslatitude   | NO        | NULL    | Double
deslongtitude | NO        | NULL    | Double

> Error JSON:

```json
{
  "error": {
    "code": 404,
    "message": "Events not found"
  }
}
```

> Valid JSON:

```json
{
    "comeUp": [{
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
    }],
    "passed": [{
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
