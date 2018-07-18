---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

The Kardia Pro API is a component of the Kardia Pro suite. It’s intended purpose is to securely transmit ECG recordings captured by Kardia Mobile users to a third party platform or application. ECG recordings can be transmitted in PDF format, or as JSON data files to be aggregated and consumed by the third party. Kardia Pro uses a REST based protocol to connect and exchange information with third party applications.

Features include:

- Participant creation
- Code generation for participant
- Callback registration for status changes and events
- ECG recording retrieval

# How it Works

Kardia Pro facilitates a connection between a clinician’s Kardia Pro account and their selected patients. Patients are provisioned with a unique code that connects their Kardia application specifically to their clinician or service and allows all ECG recordings captured via Kardia Mobile to be accessible to the clinician via the Kardia Pro application or API. ECGs sent through the API are made available to the clinician within their native application or platform.

# Authentication

```shell
curl -H 'Authorization=77D8AF75-629C-4A2A-9A08-260D33546ADF' \
  https://us-kardia-production.alivecor.com/e/v1/recordings/0dc851e0acff
```

Requests made to the API are protected by sending your API key in the Authorization header. Requests not properly authenticated will return a 401 error code. API keys are delivered after entering an enterprise agreement.

All API requests must be made over HTTPS, or they will fail

# Participants

## Create Team Participant


> Example Request

```json
{
  "customParticipantID": "AC001",
  "firstName": "Jon",
  "lastName": "Snow",
  "email": "jsnow@example.com",
  "phone": "555-555-5555",
  "dob": "1970-07-21",
  "sex": 1
}
```

> Example Response

```json
{
  "customParticipantID": "AC001",
  "firstName": "Jon",
  "lastName": "Snow",
  "email": "jsnow@example.com",
  "phone": "555-555-5555",
  "dob": "1970-07-21",
  "sex": 1
}
```

Patients are represented in the Kardia Pro system as team participants. To create a participant send a HTTP POST request to /e/v1/participants.

### Resource
POST /e/v1/participants

### Authorization
OAuth 2.0 bearer token.

### Post Parameters
Name | Type | Description
--------- | ------- | -----------
customParticipantID | string | **Required** external identifier from outside the AliveCor system
firstName | string | **Required** participant’s first name
lastName | string | **Required** participant’s last name
email | string | **Optional** participant’s email
phone | string | **Optional** participant’s mobile phone number
dob | string | **Optional** participant’s date of birth
sex | int | **Optional** ISO/IEC5218 representation of sex

### Returns
HTTP Status Code | Reason
------------- | ------
200 | Success
400 | Bad request
409 | Cannot create a participant with a duplicate `customParticipantId`

# Users

## Create User

> Example Request

```json
{
  "connection_code": "string",
  "country_code": "string",
  "email": "string",
  "password": "string"
}
```

> Example Response

```json
{
  "user_token": "string"
}
```

Create a Kardia mobile user.

### Resource
POST /e/v1/user

### Authorization
OAuth 2.0 bearer token.

### Post Parameters
Name | Type | Description
--------- | ------- | -----------
connection_code | string | **Optional** generated connection code
country_code | string | **Required** ISO 3166-1 Alpha-2 country code
email | string | **Required** user's email
password | string | **Required** user's password

### Returns
HTTP Status Code | Reason
------------- | ------
201 | User created
400 | Couldn't create user

# Codes

## Generate Connection Code

> Example Request

```json
{
  "customParticipantID" : "AC001",
  "templateID" : "7uhcmvtlb87c4n5nyx1qq9ur7"
}
```

> Example Response

```json
{
  "code" : "LQYP-MSAK-NPJR"
}
```

Generates a new connection code for a given participant. To create a new connection code send a HTTP POST request to /e/v1/code.

### Resource
POST /e/v1/code

### Authorization
OAuth 2.0 bearer token.

### Post Parameters
Name | Type | Description
--------- | ------- | -----------
customParticipantID | string | **Required** participant’s external identifier
templateID | string | **Required** AliveCor supplied connection template identifier

### Returns
HTTP Status Code | Reason
------------- | ------
200 | Success
400 | Bad request

## Redeem Code

> Example Request

```json
{
  "connection_code" : "AC001",
  "user_token": ""
}
```

Redeems a code and creates a connection between the team and the user.

### Resource
POST /e/v1/connection

### Authorization
OAuth 2.0 bearer token.

### Post Parameters
Name | Type | Description
--------- | ------- | -----------
connectionCode | string | **Required** generated connection code
user_token | string | **Required** the token representing the user

### Returns
HTTP Status Code | Reason
------------- | ------
200 | Connection created
400 | Couldn't create connection

## Disconnect Code

> Example Request

```json
{
  "customParticipantID" : "AC001"
}
```

> Example Response

```json
{
  "customParticipantID" : "AC001"
}
```

Removes a connection for the given participant.

### Resource
POST /e/v1/disconnection

### Authorization
OAuth 2.0 bearer token.

### Post Parameters
Name | Type | Description
--------- | ------- | -----------
customParticipantID | string | **Required** participant’s external identifier

### Returns
HTTP Status Code | Reason
------------- | ------
200 | Success
400 | Bad request

# Recordings

## Get Recording

> Example Request

```json
{
  "recording-id": "123123"
}
```

> Example Response

```json
{
  "afibDetected": true,
  "customParticipantID": "string",
  "data": {
    "frequency": 0,
    "mains_freq": 0,
    "samples": {
      "lead_I": [
        0
      ]
    }
  },
  "duration": 0,
  "heartRate": 0,
  "id": "string",
  "noiseDetected": true,
  "normalDetected": true,
  "recordedAt": "string"
}
```

Get the full recording with ECG sample data for any `recordingId`.

## Get Recording PDF

> Example Request

```json
{
  "recording-id": "123123"
}
```

Get the PDF rendering for any `recordingId`.

### Post Parameters
Name | Type | Description
--------- | ------- | -----------
recording-id | string | **Required** unique id for a recording

### Returns
HTTP Status Code | Reason
------------- | ------
200 | Success with file
404 | Failed to find PDF for given `recording-id`

# Event Callback

## GET callback

> Issue a HTTP GET request to view a previously set callback URL.

```shell
curl ​-​X GET \
--​header ​'Authorization: Bearer YOUR-ACCESS-TOKEN'​ \
'https://us-kardia-production.alivecor.com/e/v1/callback'
```

> Example Response

```json
{
  ​"url"​:​ ​"http://example.com/callback"
}
```

Get registered URL for event callbacks

### Returns
HTTP Status Code | Reason
------------- | ------
200 | Success
400 | Bad request

## PUT callback

> To setup the event callback URL send a PUT request

```shell
curl ​-​X PUT \
--​header ​'Authorization: Bearer YOUR-ACCESS-TOKEN'​ \
-​d ​'{ "url": "http://example.com/callback"}'​ \
'https://us-kardia-production.alivecor.com/e/v1/callback'
```

> You'll receive a 200 HTTP status code with the following response.

```json
{
  ​"url"​:​ ​"http://example.com/callback"
}
```

The Kardia Pro API will notify a URL of your choice via HTTP POST with information about events that occur as Kardia Pro processes patient connections and EKG recordings. The event callback can be used to monitor new patient connections and identify when EKG recordings occur.

### Returns
HTTP Status Code | Reason
------------- | ------
200 | Success
400 | Bad request

<aside class="success">
Once the <code>/callbackURL</code> is set, the following types of callbacks can happen.
</aside>

## POST callback

### Connection established

A `POST` is made to the `/callbackURL` with an empty body.

### Participant connected

A participant successfully connected with a code.

A `POST` is made to the `/callbackURL` in the format:

`
{
  "eventType": "participantConnected",
  "customParticipantId": "string"
}
`

### Participant disconnected

A participant has disconnected from a code-established connection.

A `POST` is made to the `/callbackURL` in the format:

`
{
  "eventType": "participantDisconnected",
  "customParticipantId": "string"
}
`

### New recording created

A participant has created a recording.

A `POST` is made to the `/callbackURL` in the format:

`
{
  "eventType": "newRecording",
  "customParticipantId": "string"
}
`

