---
title: go.screver.com API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - http

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

This is initial go.screver.com API v1 Documentation. 

# Authentication

> To get an access token, send the following request:

```http
POST /oauth/v2/token HTTP/1.1
Content-Type: multipart/form-data
Host: https://go.screver.com

client_id: "clientid"
client_secret: "clientsecret"
grant_type: "client_credentials"
```

> Make sure to replace `clientid` and `clientsecret` with your OAuth client id and secret.

> The above command returns JSON structured like this:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "token_type": "Bearer",
  "access_token": "u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3",
  "expires_in": 3600
}
```

go.screver.com uses a token to allow access to the API. 
An OAuth client credentials request is used to obtain a token. 
[Contact us](https://www.go.screver.com/contact-us) to get your OAuth `client id` and `client secret`. 
The token can be used for the number of seconds returned in the `expires_in` field.

`Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3`

<aside class="notice">
You must replace <code>u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3</code> with the access token you received from the OAuth request.
</aside>

# Surveys

## Get list of surveys

> Return list of survey with base data.

```http
POST /api/v1/surveys?limit=20 HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

> The above request returns the following response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "resources": [],
  "total": 20,
}
```

### Query Parameters

Parameter | Type | Description
--------- | ------- | -----------
skip |number| A count of skip items for pagination.
limit |number| A count of returned items in response.


## Get specific survey
> This endpoint returns specific survey by ID.

```http
POST /api/v1/surveys/5d0b985960a1da78cf8f4a57 HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

```json
{ 
  "_id": "5d0b985960a1da78cf8f4a57",
  "translation": { "en": true, "de": false, "ru": false },
  "translationLockName": { "en": false, "de": false, "ru": false },
  "translationLockDescription": { "en": false, "de": false, "ru": false },
  "active": false,
  "publicAccess": false,
  "statusBar": false,
  "totalCompleted": 0,
  "totalInvites": 0,
  "totalResults": 0,
  "name": { "en": "repellat" },
  "description": { en: "consequuntur" },
  "urlName": "central-infrastructure-executive-0-21992383820050887",
  "team":
   { "_id": "5d0b985960a1da78cf8f4a56",
     "name": "nam0.5542454230424971" },
  "company":
   { "_id": "5d0b985960a1da78cf8f4a52",
     "name": "sit0.12733301483837445",
     "urlName": "dynamic-interactions-developer-0-8158430400596939" },
  "startDate": "2019-06-20T14:29:45.524Z",
  "endDate": "2019-06-30T14:29:45.525Z",
  "completeMsg": { "en": "quasi" },
  "createdAt": "2019-06-20T14:29:45.538Z",
  "updatedAt": "2019-06-20T14:29:45.538Z",
  
  }
```

# Questions
## Get specific question
This endpoint returns specific question.

# Survey Results
## Delete specific survey result


