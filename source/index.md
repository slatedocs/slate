---
title: CricHQ API Reference

language_tabs:
  - ruby
  - json

toc_footers:
 - <a href='#'>Sign Up for a Developer Key</a>
 - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>
---

# Introduction

Welcome to the CricHQ API guide! You can use our API to v2 public and private API endpoints.

# Private API

The private api contains all requests that require some form of user authentication.

There are two ways to authenticate your session, either with session based authentication, or by passing in user-email and user-token values inside the headers for each request.
  
## Request Headers

Header | Description | Required
------ | ----------- | --------
X-USER-EMAIL | "test@crichq.com" | ✔
X-USER-TOKEN | BVx6vxiTr5vbt6sFbp4U | ✔
X-APP-BUILD | 41611200
X-APP-NAME | "CricHQ Next"
X-APP-SPONSOR | 1
X-APP-VERSION | "4.5.0"
X-DEVICE-MANUFACTURER | apple
X-DEVICE-MODEL | "iPhone Simulator"
X-DEVICE-OS | "7.0.3"
X-DEVICE-PLATFORM | ios

## Response Headers

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is incorrect
401 | Unauthorized -- Your API key is wrong, or you don't have access to that request
403 | Forbidden
404 | Not Found -- The specified entity could not be found
406 | Not Acceptable -- You requested a format that isn't json or message-pack
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.


## Authenticating with CricHQ's feed service

CricHQ implements cross service authentication via CBA (claim based authentication), using ClaimToken, a CricHQ open source gem for ruby.

A claim token can obtained using the URL below:
### HTTP Request

`POST [crichq_environment]/v2/private/claim_token`

<aside class="notice">
  'crichq_environment' refers to production or staging.
</aside>


### Managing a ClaimToken

Each time a request is made for a claim token it sets an internal expiration date which is encrypted. The expiration date is used across CricHQ services and you will receive a 401 response header if it has expired. It is up to the developer to maintain there user’s Claim Tokens by using an internal interval to fetch a new claim token before the current one expires.







# Public API

## Search for clubs

> The index clubs route returns JSON structured like this:

```json
{
  "total_pages": 8,
  "items": [{
    "name": "Karori Cricket Club.",
    "level": 8,
    "title": "Karori Cricket Club.",
    "subtitle": "Wellington, New Zealand",
    "id": 38826,
    "verification_level": 149,
    "owner_id": 34966,
    "lock_version": 83,
    "temporary_id": null,
    "state": 1,
    "entity_type": "Group",
    "image_thumb_url": "https://s3.amazonaws.com/crichq-development-images/groups/avatars/38826/1351023463/thumb.png"
  }, {
    "name": "Karori",
    "level": 8,
    "title": "Karori",
    "subtitle": "Wellington, New Zealand",
    "id": 484,
    "verification_level": 0,
    "owner_id": 150,
    "lock_version": 0,
    "temporary_id": "1290027249.07",
    "state": 1,
    "entity_type": "Group",
    "image_thumb_url": "/original/missing_thumb.png"
  }]
}
```
This endpoint allows you to search for visible clubs.

### HTTP Request
`GET /api/v2/public/clubs`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Ask for a specific page of results
limit | 20 | Sets the number of results per page
search[q] | "" | The query to be searched i.e. Karori


## Get a Specific Club

> The show club route returns JSON structured like this:

```json
{
  "name": "Karori Cricket Club.",
  "level": 8,
  "title": "Karori Cricket Club.",
  "subtitle": "Wellington, New Zealand",
  "id": 38826,
  "verification_level": 149,
  "owner_id": 34966,
  "lock_version": 83,
  "temporary_id": null,
  "state": 1,
  "entity_type": "Group",
  "image_thumb_url": "https://s3.amazonaws.com/crichq-development-images/groups/avatars/38826/1351023463/thumb.png"
}
```

This endpoint retrieves a specific club.

### HTTP Request
`GET /api/v2/public/clubs/:id`

### Query Parameters
None

## Get a Club's Teams

> The club teams list route returns JSON structured like this:

```json
{
  "total_pages": 8,
  "items": [{
    "title": "1",
    "subtitle": "Karori Cricket Club.",
    "id": 38016,
    "verification_level": 0,
    "owner_id": 34966,
    "lock_version": 0,
    "temporary_id": null,
    "state": 1,
    "entity_type": "Team",
    "image_thumb_url": "/original/missing_thumb.png",
    "group_id": 38826,
    "profile_feed_id": null,
    "public_url": "http://localhost:3000/groups/38826/teams/38016-1",
    "image_mini_url": "/original/missing_mini.png"
  }, {
    "title": "2",
    "subtitle": "Karori Cricket Club.",
    "id": 38018,
    "verification_level": 0,
    "owner_id": 34966,
    "lock_version": 0,
    "temporary_id": null,
    "state": 1,
    "entity_type": "Team",
    "image_thumb_url": "/original/missing_thumb.png",
    "group_id": 38826,
    "profile_feed_id": null,
    "public_url": "http://localhost:3000/groups/38826/teams/38018-2",
    "image_mini_url": "/original/missing_mini.png"
  }]
}
```
### HTTP Request
`GET /api/v2/public/clubs/38826/teams`

### Query Parameters
Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Ask for a specific page of results
limit | 20 | Sets the number of results per page
