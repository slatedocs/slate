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

This is initial go.screver.com API documentation. 

# Authentication

> To get an access token, send the following request:

```shell
curl --insecure --user 'clientid:clientsecret' 'https://go.screver.com/oauth/token' --data 'grant_type=client_credentials'
```

> Make sure to replace `clientid` and `clientsecret` with your OAuth client id and secret.

> The above command returns structure like this:

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

```json
{
  "token_type": "Bearer",
  "access_token": "u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3"
}
```

To allow access to the API use access token.
An OAuth client credentials request is used to obtain a token. 
To get your OAuth `client id` and `client secret` please contact us. 
The token can be used 24h.

`Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3`

<aside class="notice">
You must replace <code>u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3</code> with the access token you received from the OAuth request.
</aside>

# Surveys

## Get list of surveys with base data.

```http
GET /api/v2/surveys?limit=5 HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

> The above request returns the following response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

```json
{
  "resources": [
    { 
      "_id": "5d0b985960a1da78cf8f4a57",
      "name": { "en": "repellat" },
      "description": { "en": "consequuntur" },
      "urlName": "repellat",
      "startDate": "2019-06-20T14:29:45.524Z",
      "endDate": "2019-06-30T14:29:45.525Z",
      "createdAt": "2019-06-20T14:29:45.538Z",
      "updatedAt": "2019-06-20T14:29:45.538Z"
    },
    { 
       "_id": "5d0b9859a1da78cf8f4a58",
       "name": { "en": "qwerty" },
       "description": { "en": "sdf32324324" },
       "urlName": "qwerty",
       "startDate": "2019-06-20T14:29:45.524Z",
       "endDate": "2019-06-30T14:29:45.525Z",
       "createdAt": "2019-06-20T14:29:45.538Z",
       "updatedAt": "2019-06-20T14:29:45.538Z"
    },
    {
      "_id": "5d0b985960a1da78cf8f4a59",
      "name": { "en": "testname" },
      "description": { "en": "consequuntur324" },
      "urlName": "testname",
      "startDate": "2019-06-20T14:29:45.524Z",
      "endDate": "2019-06-30T14:29:45.525Z",
      "createdAt": "2019-06-20T14:29:45.538Z",
      "updatedAt": "2019-06-20T14:29:45.538Z"
    },
    { 
      "_id": "5d0b985960a1da78cf8f4a60",
      "name": { "en": "bar" },
      "description": { "en": "bar" },
      "urlName": "bar desc",
      "startDate": "2019-06-20T14:29:45.524Z",
      "endDate": "2019-06-30T14:29:45.525Z",
      "createdAt": "2019-06-20T14:29:45.538Z",
      "updatedAt": "2019-06-20T14:29:45.538Z"
    },
    { 
      "_id": "5d0b985960a1da78cf8f4a61",
      "name": { "en": "foo" },
      "description": { "en": "foo desc" },
      "urlName": "foo",
      "startDate": "2019-06-20T14:29:45.524Z",
      "endDate": "2019-06-30T14:29:45.525Z",
      "createdAt": "2019-06-20T14:29:45.538Z",
      "updatedAt": "2019-06-20T14:29:45.538Z"
    }
  ],
  "total": 20
}
```

### Query Parameters

Parameter | Type | Description | Default | Required
--------- | ------- | ----------- | ----- | -------- |
skip |number| Count of skipped items for pagination.| 10 | No |
limit|number| Count of returned items in response.| 10 | Yes |
sort|string| Sort parameter - name, createdAt, updatedAt | createdAt | No|

## Get specific survey by ID with all related data.

```http
GET /api/v2/surveys/5d0b985960a1da78cf8f4a57 HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

> The above request returns the following response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

```json
{ 
  "_id": "5d0b985960a1da78cf8f4a57",
  "name": { "en": "repellat" },
  "description": { "en": "consequuntur" },
  "urlName": "repellat",
  "startDate": "2019-06-20T14:29:45.524Z",
  "endDate": "2019-06-30T14:29:45.525Z",
  "createdAt": "2019-06-20T14:29:45.538Z",
  "updatedAt": "2019-06-20T14:29:45.538Z",
  "surveySections": 
    [
      {
        "_id":"5d1086759513bd03ca00a579",
        "name": { "en": "fugiat" }, 
        "survey": "5d1086759513bd03ca00a578", 
        "createdBy": "5d1086759513bd03ca00a575", 
        "updatedBy":"5d1086759513bd03ca00a575",
        "surveyItems": [
          {
            "_id": "5d1086759513bd03ca00a57a",
            "type": "question",
            "required": false, 
            "survey": "5d1086759513bd03ca00a578",
            "surveySection": "5d1086759513bd03ca00a579", 
            "question": {
              "_id": "5d1086759513bd03ca00a57b",
              "linearScale": { "from": 1, "to": 5, "icon": "smiley" },
              "type": "linearScale",
              "name": { "en": "cupiditate" },
              "createdBy": "5d1086759513bd03ca00a575",
              "updatedBy": "5d1086759513bd03ca00a575"
            }
          }
        ]
      }
    ]
}
```

### Query Parameters

Parameter | Type | Description | Required |
--------- | ------- | ----------- | -------- |
id |objectId| ObjectId of specific survey.| Yes |

# Questions
## Get specific question by ID.

```http
GET /api/v2/questions/5d0b985960a1da78cf8f4a57 HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

> The above request returns the following response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

```json
{ 
  "_id": "5d10840f5b4ca0038509890c",
  "name": { "en": "iste" },
  "linearScale": { "from":  1, "to":  5 },
  "createdAt": "2019-06-24T08:04:31.303Z",
  "updatedAt": "2019-06-24T08:04:31.303Z"
}
```

# Survey Results
## Delete specific survey result.
> Delete survey result by user ID or contact email which stored in survey result meta data.

```http
DELETE /api/v2/survey-results/remove-one HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

```json
{
  "userId": "123123"
}
```

> The above request returns the following response:

```http
HTTP/1.1 204 No content
```

### Query Parameters

Parameter | Type | Description | Required |
--------- | ------- | ----------- | -------- |
userId |objectId| ObjectId of specific survey.| No |
email |string| Email of contact.| No |

## Delete survey result by id
> Delete survey result by ID

```http
DELETE /api/v2/survey-results/5d10840f5b4ca0038509890c HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

> The above request returns the following response:

```http
HTTP/1.1 204 No content
```

## Delete survey results by array of ids
> Delete survey results by array of ids

```http
DELETE /api/v2/survey-results/remove-array HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

```json
{
  "idsArray": [ "5d10840f5b4ca0038509890c", "5d10840f5b4ca0038509465r", "5d10840f5b4ca0038509978x" ]
}
```

> The above request returns the following response:

```http
HTTP/1.1 204 No content
```

### Query Parameters

Parameter | Type | Description | Required |
--------- | ------- | ----------- | -------- |
idsArray |array| Array of ObjectIds.| Yes |

## Delete survey results by meta
> Delete survey results by user ID or contact email which stored in survey result meta data.

```http
DELETE /api/v2/survey-results/remove-by-meta HTTP/1.1
Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3
Content-Type: application/json
Host: https://go.screver.com
```

```json
{
  "userId": "123123"
}
```

> The above request returns the following response:

```http
HTTP/1.1 204 No content
```

### Query Parameters

Parameter | Type | Description | Required |
--------- | ------- | ----------- | -------- |
userId |objectId| ObjectId of specific survey.| No |
email |string| Email of contact.| No |
