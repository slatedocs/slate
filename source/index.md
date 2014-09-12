---
title: RubiconMD API

language_tabs:
  - shell

toc_footers:
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

<aside class="warning">
The requests presented on this API documentation are being made to the **staging server**.
Here is the list of the possible servers:
</aside>

Server |  URL
--------- | -----------
**Sandbox:** | `http://demo.rubiconmd.com`
**Production:** | `https://www.rubiconmd.com` 

# Authentication

> To get your access token, use this code. <br>
> Make sure to replace `XXXXXX` and `YYYYYY` with your API information. <br>
> Also, make sure you are introducing valid specialist credentials.

```shell
# Just a standard HTTP Request
curl -i https://rubiconmd.com/api/v1/oauth/token
 -F grant_type="password"
 -F email="SpecialistEmail"
 -F password="SpecialistPassword"
 -F client_id="XXXXXX"
 -F client_secret="YYYYYY"
```

> Which will return:

```json
[
  {
    "access_token": "AAAAAA",
    "token_type": "bearer",
    "expires_in": 7200
  }
]
```



RubiconMD uses keys to allow access to the API. You can ask [Michael](mailto: michael@rubiconmd.com?Subject=Rubicon%20API%20Keys) for a new one.
RubiconMD uses basically OAuth2 type authentication. So once you are authorized, you will get an access token.

RubiconMD API expects for the access token you will recieve to be included in all API requests to the server, being this snippet the first parameter in each petition.

`?access_token="AAAAAA"`

<aside class="notice">
All access_tokens expire in two hours. You will then have to ask for another one so you can keep on using the API.
</aside>

# Case Referrals

## Get All Case Referrals for an User

```shell
curl https://rubiconmd.com/api/v1/referrals?access_token="AAAAAA"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 37,
    "state": "accepted",
    "question": "Does this look deadly?"
  },
  {
    "id": 22,
    "state": "need_pcp_reply",
    "question": "Is this Lupus?"
  }
]
```

This endpoint retrieves all the case referrals for the authenticated user.

### HTTP Request

`GET https://rubiconmd.com/api/v1/referrals?access_token="AAAAAA"`

### Query Optional Parameters

Parameter |  Description
--------- | -----------
state | Gets pending cases with a particular state.
limit | Retrieves the specific number of cases you pass it.

**States:** assigned, accepted, declined, awaiting_review, need_specialist_reply, need_pcp_reply, closed

**limit:** Integer number.


## Get a Specific Case Referral

```shell
curl https://rubiconmd.com/api/v1/referrals/57?access_token="AAAAAA"
```

> The above command returns JSON structured like this:

```json
{
  "id": 57,
  "state": "accepted",
  "question": "Is this normal?",
  "created_at": "2014-07-15T15:33:44.220-04:00",
  "updated_at": "2014-07-15T15:45:56.440-04:00",
  "assigned_on": "2014-07-15T15:33:46.774-04:00",
  "accepted_on": "2014-07-15T15:45:56.430-04:00",
  "patient_age": 18,
  "patient_gender": "Female",
  "differential_diagnosis": "This is my Differential Diagnosis.",
  "medical_history": "A long one.",
  "medications": "None that you should know.",
  "symptoms": "Feels bad.",
  "labs": "Cholesterol levels are fine."
}
```

This endpoint will return the JSON data about a specific case.

<aside class="notice">
 Make sure to replace `CASE_ID` with the actual ID of the case you want to look up.
</aside>


### HTTP Request

`GET https://rubiconmd.com/api/v1/referrals/CASE_ID?access_token="AAAAAA"`

### URL Parameters

Parameter | Description
--------- | -----------
CASE_ID | The ID of the case to retrieve


## Accept / Reject a Specific Case 

```shell
curl https://rubiconmd.com/api/v1/referrals/57/reject?access_token="AAAAAA"
```

> The above command returns JSON structured like this:

```json
{
  "id": 57,
  "state": "declined",
  "question": "Is this normal?",
  "created_at": "2014-07-15T15:33:44.220-04:00",
  "updated_at": "2014-07-15T15:45:56.440-04:00",
  "assigned_on": "2014-07-15T15:33:46.774-04:00",
  "accepted_on": "2014-07-15T15:45:56.430-04:00",
  "patient_age": 18,
  "patient_gender": "Female",
  "differential_diagnosis": "This is my Differential Diagnosis.",
  "medical_history": "A long one.",
  "medications": "None that you should know.",
  "symptoms": "Feels bad.",
  "labs": "Cholesterol levels are fine."
}
```

This endpoint allows you to accept or turn down a specific case.

<aside class="success">
When you accept/reject a case, a successful call will return the JSON data about the case.
</aside>
<aside class="warning">
An unsuccessful call will return a **402** and an error message:
`{"error":"This case could not be accepted at this time."}
</aside>

### HTTP Request

`GET https://rubiconmd.com/api/v1/rubiconmdeferrals/CASE_ID/ACTION?access_token="AAAAAA"`

### URL Parameters

Parameter |  Description
--------- | -----------
CASE_ID | The ID of the case to retrieve
ACTION | Accepts or rejects a case.

**Actions:** accept, reject

# Case Responses

## Get All Responses for a Specific Case

```shell
curl https://rubiconmd.com/api/v1/referrals/63/responses?access_token="AAAAAA"
```

> The above command returns JSON structured like this, these are examples of both pcp and specialist responses:

```json
[
  {
    "id": 17,
    "case_id": 63,
    "user_id": 12,
    "body": "This is where you put the specialist text response.",
    "created_at": "2014-04-12T14:11:38.554-04:00",
    "purpose": "specialist_opinion",
    "need_reply": true
  },
  {
  "id": 18,
  "case_id": 63,
  "user_id": 22,
  "body": "This is a pcp response.",
  "created_at": "2014-04-12T14:19:33.554-04:00",
  "purpose": "pcp_reply",
  "need_reply": false
  }
]
```

This endpoint retrieves all the responses for a specific case.

### HTTP Request

`GET https://rubiconmd.com/api/v1/referrals/CASE_ID/responses?access_token="AAAAAA"`

### URL Parameters

Parameter |  Description
--------- | -----------
CASE_ID | The ID of the case to retrieve

## Get A Specific Response from a Case

```shell
curl https://rubiconmd.com/api/v1/referrals/63/responses/17?access_token="AAAAAA"
```

>The above command returns JSON like this:

```json
{  
  "id":17,
  "case_id":63,
  "user_id":12,
  "body":"This is where you put the specialist text response.",
  "created_at":"2014-04-12T14:11:38.554-04:00",
  "purpose":"specialist_opinion",
  "need_reply":true
}
```

This allows you to recieve a specific response from a specific case.

### HTTP Request

`GET https://rubiconmd.com/api/v1/referrals/CASE_ID/responses/RESPONSE_ID?access_token="AAAAAA"`

### URL Parameters

Parameter |  Description
--------- | -----------
CASE_ID | The ID of the case to retrieve
RESPONSE_ID | The ID of the specific response you want to get

## Post a Response

```shell
curl -X POST
  -H "Content-Type: application/json"
  -d '{"response":{"body":"This is where you put the specialist text response.","purpose":"specialist_opinion","need_reply":"true"}}' "https://rubiconmd.com/api/v1/referrals/63/responses?access_token=AAAAAA"
```

>The above command returns JSON like this:

```json
{
  "id":17,
  "case_id":63,
  "user_id":12,
  "body":"This is where you put the specialist text response.",
  "created_at":"2014-04-12T14:11:38.554-04:00",
  "purpose":"specialist_opinion",
  "need_reply":true
}
```

This allows you post a response in a specific case (as a specialist). It also returns your response.

### HTTP Request

`POST https://rubiconmd.com/api/v1/referrals/CASE_ID/responses/ {"response": {"body": TEXT, "purpose": "specialist_opinion", "need_reply": BOOLEAN} }`

### URL Parameters

Parameter |  Description
--------- | -----------
CASE_ID | The ID of the case you want to respond to
body | TEXT field with your response
purpose | "specialist_opinion" , it cannot be changed
need_reply | BOOLEAN field , depending on your need of the PCP to reply to your response

<aside class="notice">
 The app you are building should always be reporting **purpose** as "specialist_opinion".
</aside>

<!-- 
 ##
 ##
 ## USER INFO
 ##
 ##
-->

# Users

##User Information

```shell
curl https://rubiconmd.com/api/v1/users/me?access_token="AAAAAA"
```
> The above command returns JSON structured like this:

```json
{
   "id":12,
   "is_specialist":true,
   "first_name":"Franklin",
   "last_name":"McAwesome",
   "role":"medical_doctor",
   "email":"awesome_specialist@rubiconmd.com",
   "organization":"Health Medical Clinic",
   "country":"United States",
   "specialties":[
      {
         "specialty":{
            "id":17,
            "name":"Electrophysiology",
            "category":"Cardiology"
         }
      },
      {
         "specialty":{
            "id":24,
            "name":"HIV",
            "category":"Infectious Diseases"
         }
      },
      {
         "specialty":{
            "id":31,
            "name":"Hand surgery",
            "category":"Orthopedic Surgery"
         }
      }
   ]
}
```

Want to get information about the user you just logged in? This is your endpoint.

### HTTP Request

`GET https://rubiconmd.com/api/v1/users/me?access_token="AAAAAA"`

##Creating Users

```shell
curl -X POST
  -H "Content-Type: application/json"
  -d '{"user":{"email": "awesome_specialist@rubiconmd.com", "first_name": "Franklin", "last_name": "McAwesome", "role": "medical_doctor"}}' "https://rubiconmd.com/api/v1/users?access_token=AAAAAA"
```
> The above command returns JSON structured like this:

```json
{
   "first_name":"Franklin",
   "last_name":"McAwesome",
   "email":"awesome_specialist@rubiconmd.com",
   "role":"medical_doctor"
}
```

This allows you to create a new provider for your organization.

### HTTP Request

`POST https://rubiconmd.com/api/v1/users/ {"user": {"email": TEXT, "first_name": TEXT, "last_name": TEXT, "role": ROLE} }`

### URL Parameters 

Parameter |  Description
--------- | -----------
email | The e-mail from the user you are creating.
first_name | First name of the user.
last_name | Last name of the user.
role | User's role. Roles are limited to the following values: 'medical_doctor' , 'physician_assistant' , 'registered_nurse' , 'nurse_practitioner'

##Registering User Devices

```shell
curl -X POST
  -H "Content-Type: application/json"
  -d '{"device":{"token":"thisIsTheDeviceToken"}}' "https://rubiconmd.com/api/v1/user_devices?access_token=AAAAAA"
```
> The above command returns JSON structured like this:

```json
{
   "user_id":"11",
   "token":"thisIsTheDeviceToken"
}
```

This endpoint is intended to register Apple devices so the user can receive push notifications.

### HTTP Request

`POST https://rubiconmd.com/api/v1/user_devices/ { "device": { "token": STRING } }`

### URL Parameters 

Parameter |  Description
--------- | -----------
token | The device token you get when you register the device for push notifications.









