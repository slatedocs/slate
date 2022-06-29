---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Kittn API
---

# About Master EKYC

The Master EKYC provides a set of components to capture identity documents and selfie photos and videos for the purpose of identiy verification

The SDK offers a number of benefits to help you create the best identity verification experience for your customers:

- Carefully designed UI to guide your customers through the entire photo and video capture process
- Modular design to help you seamlessly integrate the photo and video capture process into your application flow
- Advanced image quality detection technology to ensure the quality of the captured images meets the requirement of the Onfido identity verification process, guaranteeing the best success rate
- Direct image upload to the Onfido service, to simplify integration


# API Reference
This is an API documentations.
## Overview
List and flow API Application
### Token authentication
- API tokens
- SDK tokens
- Mobile tokens

<aside class="success">
Remember — Request is authenticated!
</aside>

### Postman collection
You can run the Master EKYC API version 3.4 collection in Postman:
`Run in Postman` -> Automatically open Postman and import standard collection

The API version 3.4 Postman collection is at version 1.0.

In your Postman environment, you'll need to define the apiToken and baseUrl variables. See region base URLs for baseUrl options.


### Rate limits
Master EKYC's API enforces a maximum volume of requests per minute for all clients. Unless contractually agreed otherwise, the maximum rate is 400 requests per minute.

For sandbox requests, the rate limit is 30 requests per minute.

Any request over the limit will return a `429 Too Many Requests error.`

## Core resources
An applicant represents an individual who will be the subject of a check. An applicant must exist before a check can be initiated.
### Register OTP
- OTP object
- OTP verify

`POST | http://example.com/api/verify_otp`

```python
import request
api = request.request()
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require();

let api = kittn.authorize();
```

> Register OTP returns JSON structured like this:

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

|Attribute | Type| Description|
|--------- | ---|----------|
|id |string| Description of parameter|


### Register User Document
- Document object
- Check Liveness Document

`POST | http://example.com/api/check_liveness_document`

```python
import request
api = request.request()
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require();

let api = kittn.authorize();
```

> Register User Document returns JSON structured like this:

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

|Attribute | Type| Description|
|--------- | ---|----------|
|id |string| Description of parameter|


### Register User Video
- Video object
- Check liveness Video

`POST | http://example.com/api/check_liveness_video`

```python
import request
api = request.request()
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require();

let api = kittn.authorize();
```

> Register User Video returns JSON structured like this:

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

|Attribute | Type| Description|
|--------- | ---|----------|
|id |string| Description of parameter|


# Web SDK
This is Web SDK Document
## Overview
Overview of SDK 
## Getting started
Content of Web SDK Document

# Android SDK
This is Android SDK document
## Overview
Overview of Android SDK 
## Getting started
Content of Android SDK Document

# iOS SDK
This is iOS SDK document
## Overview
Overview of iOS SDK 
## Getting started
Content of iOS SDK Document
