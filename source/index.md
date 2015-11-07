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
The requests presented on this API documentation are for our live **production environment**. For development and testing, it is recommended to use our **sandbox environment**.
</aside>

Server |  URL
--------- | -----------
**Sandbox:** | `http://demo.rubiconmd.com`
**Production:** | `https://www.rubiconmd.com`

# Authentication

> The RubiconMD server authenticates via the use of access tokens. <br>

```shell
# Just a standard HTTP Request
  Note: Be sure to curl using http: protocol when connecting to the sandbox and https: when connecting to production. Our examples are for accessing the Production in this regard.

## User authentication not required (app has standing permissions from user)
curl -i https://rubiconmd.com/api/v1/oauth/token
 -F grant_type="standing"
 -F email="USER_EMAIL_ADDRESS"
 -F client_id="YOUR_CLIENT_ID"
 -F client_secret="YOUR_CLIENT_SECRET"

 ## User authentication required
 curl -i https://rubiconmd.com/api/v1/oauth/token
 -F grant_type="client_credentials"
 -F client_id="YOUR_CLIENT_ID"
 -F client_secret="YOUR_CLIENT_SECRET"
```

> A successful request will return:

```json
[
  {
    "access_token": "AAAAAA",
    "token_type": "bearer",
    "expires_in": 7200
  }
]
```



RubiconMD uses an OAuth2 workflow for obtaining the access tokens needed for API access.

To make an access token request, valid API keys are required. To request or cycle your API keys, please contact [Michael](mailto: michael@rubiconmd.com?Subject=Rubicon%20API%20Keys).

RubiconMD API requires a valid access token to be included within the parameters for all API requests to the server:

`?access_token="AAAAAA"`

<aside class="notice">
For security, all access_tokens expire in two hours.
</aside>

### Grant Types

`standing`: If you are making a request on behalf of a user that has granted standing access to your application (if you created the user, such permissions are granted by default), then this grant type will return an access token that will be sufficient to make requests that user to authenticate on the RubiconMD site.

`client_credentials`: This will return a token that can be used for making queries that do not require a user to be logged in. This includes OAuth2-type queries where the user authenticates on the RubiconMD site, then is redirected back to your site with a valid_access token for making API calls on the user's behalf.

# Provider Cases

Provider Cases are created by a user that is seeking a specialist response to the case.

## Get All Provider Cases

```shell
curl -i https://rubiconmd.com/api/v1/provider_cases?access_token="AAAAAA"
```

> A successful request returns the following:

```json
[
  {
    "id": 10071849,
    "state": "opened",
    "question": "Victim bleeding from pores... possibly Red Death?"
  },
  {
    "id": 888,
    "state": "assigned",
    "question": "Is it possible to have a case of Rocky Mountain Spotted Fever occur in the Appalachians and with stripes?"
  }
]
```

This endpoint retrieves all the provider case for the authenticated user.

### HTTP Request

`GET https://rubiconmd.com/api/v1/provider_cases?access_token="AAAAAA"`

### Query Optional Parameters

Parameter |  Description
--------- | -----------
state | Only returns cases of the specified state. Possible options: assigned, accepted, declined, awaiting_review, need_specialist_reply, need_pcp_reply, closed
limit | Retrieves the number of cases specified. (Must be an integer.)

## Get a Specific Provider Case

```shell
curl -i https://rubiconmd.com/api/v1/provider_cases/10071849?access_token="AAAAAA"
```

> A successful request returns the following:

```json
{
  "id": 10071849,
  "state": "accepted",
  "question": "Victim bleeding from pores... possibly Red Death?",
  "created_at": "1842-05-15T15:33:44.220-04:00",
  "updated_at": "1842-05-15T15:45:56.440-04:00",
  "assigned_on": "1842-05-15T15:33:46.774-04:00",
  "accepted_on": "1842-05-15T15:45:56.430-04:00",
  "patient_age": 33,
  "patient_gender": "Male",
  "differential_diagnosis": "If not Red Death, maybe Telltale Heart Disease?",
  "medical_history": "Lots of partying and excessive drinking.",
  "medications": "Amontillado",
  "symptoms": "convulsions, bloody sweat, seeing masked illusions.",
  "labs": null
}
```

This endpoint will return the JSON data about a specific case.

<aside class="notice">
 Make sure to replace `CASE_ID` with the actual ID of the case you want to look up.
</aside>


### HTTP Request

`GET https://rubiconmd.com/api/v1/provider_cases/CASE_ID?access_token="AAAAAA"`

### URL Parameters

Parameter | Description
--------- | -----------
CASE_ID | The ID of the case to retrieve

## Create a New Provider Case

```shell
curl -X POST
  -H "Content-Type: application/json"
  -d '{"provider_case":{"question":"Victim bleeding from pores... possibly Red Death?","patient_birthdate": "2009-01-19","patient_gender": "Male","patient_first_name":"P.","patient_middle_name":"N/A","patient_last_name":"Prospero","differential_diagnosis":"If not Red Death, maybe Telltale Heart Disease?","medical_history":"Lots of partying and excessive drinking.","medications":"Amontillado","symptoms":"convulsions, bloody sweat, seeing masked illusions.","labs":"N/A"}}' "https://rubiconmd.com/api/v1/provider_cases?access_token=AAAAAA"
```

>A successful POST request returns a JSON response:

```json
{
  "id": 10071849,
  "state": "accepted",
  "question": "Victim bleeding from pores... possibly Red Death?",
  "created_at": "1842-05-15T15:33:44.220-04:00",
  "updated_at": "1842-05-15T15:45:56.440-04:00",
  "assigned_on": "1842-05-15T15:33:46.774-04:00",
  "accepted_on": "1842-05-15T15:45:56.430-04:00",
  "patient_age": 33,
  "patient_gender": "Male",
  "differential_diagnosis": "If not Red Death, maybe Telltale Heart Disease?",
  "medical_history": "Lots of partying and excessive drinking.",
  "medications": "Amontillado",
  "symptoms": "convulsions, bloody sweat, seeing masked illusions.",
  "labs": null
}
```

### HTTP Request

`POST https://rubiconmd.com/api/v1/provider_cases/ {"provider_case": {"question": TEXT, "patient_birthdate": TEXT, "patient_gender": TEXT, "patient_first_name": TEXT, "patient_middle_name": TEXT, "patient_last_name": TEXT, "differential_diagnosis": TEXT, "medical_history": TEXT, "medications": TEXT, "symptoms": TEXT, "labs": TEXT} }`

### URL Parameters

Parameter |  Description
--------- | -----------
question | The specific question for the specialist to answer.
patient_birthdate | Patient birthdate. Must be formatted as text: "YYYY-MM-DD"
patient_gender | Patient gender. Only acceptable values are "Female",  "Male", and "Other".
patient_first_name | Patient first name.
patient_middle_name | Patient middle name.
patient_last_name | Patient last name.
differential_diagnosis | Physician thoughts/plans.
medical_history | Patient relevant prior medical history.
medications | Patient medications.
symptoms | Patient current presentation.
labs | Lab results.

# Case Referrals

Case Referrals are the de-identified cases received by a specialist. Only users that are specialists can access Case Referrals.

## Get All Case Referrals

```shell
curl -i https://rubiconmd.com/api/v1/referrals?access_token="AAAAAA"
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
curl -i https://rubiconmd.com/api/v1/referrals/57?access_token="AAAAAA"
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
curl -i https://rubiconmd.com/api/v1/referrals/57/reject?access_token="AAAAAA"
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
When a case is accepted, a successful call will return the JSON data about the case. A successful rejected case call will return: {message: "The case was successfully rejected."}
</aside>
<aside class="warning">
An unsuccessful call will return a **402** and an error message:
{"error":"This case could not be accepted at this time."}
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

## Get All Responses

```shell
curl -i https://rubiconmd.com/api/v1/referrals/63/responses?access_token="AAAAAA"

curl -i https://rubiconmd.com/api/v1/provider_cases/63/responses?access_token="AAAAAA"
```

> A successful request returns an array of JSON responses:

```json
[
  {
    "id": 17,
    "case_id": 63,
    "specialist_id": 12,
    "body": "This is where you put the specialist text response.",
    "created_at": "2014-04-12T14:11:38.554-04:00",
    "purpose": "specialist_opinion",
    "need_reply": true
  },
  {
  "id": 18,
  "case_id": 63,
  "specialist_id": null,
  "body": "This is a pcp response.",
  "created_at": "2014-04-12T14:19:33.554-04:00",
  "purpose": "pcp_reply",
  "need_reply": false
  }
]
```

Retrieves all the responses associated with a specific case.

### HTTP Request

`GET https://rubiconmd.com/api/v1/referrals/CASE_ID/responses?access_token="AAAAAA"`

or

`GET https://rubiconmd.com/api/v1/provider_cases/CASE_ID/responses?access_token="AAAAAA"`

### URL Parameters

Parameter |  Description
--------- | -----------
CASE_ID | The ID of the case to retrieve

### Response Fields

Parameter |  Description
--------- | -----------
id | ID # of response
case_id | ID # of associated case
specialist_id | ID # of specialist that made the response (if user was a provider, this value will be nil)
body | The text of the response
created_at | Time response was created
purpose | Either 'pcp_comment' or 'specialist_reply'
need_reply | Boolean value dictating whether or not creator needed a reply to the response

## Get a Specific Response

```shell
curl -i https://rubiconmd.com/api/v1/referrals/63/responses/17?access_token="AAAAAA"

curl -i https://rubiconmd.com/api/v1/provider_cases/63/responses/17?access_token="AAAAAA"
```

>The above command returns JSON like this:

```json
{
  "id":17,
  "case_id":63,
  "specialist_id":12,
  "body":"This is where you put the specialist text response.",
  "created_at":"2014-04-12T14:11:38.554-04:00",
  "purpose":"specialist_opinion",
  "need_reply":true
}
```

Lookup a specific response by the response's ID.

### HTTP Request

`GET https://rubiconmd.com/api/v1/referrals/CASE_ID/responses/RESPONSE_ID?access_token="AAAAAA"`

or

`GET https://rubiconmd.com/api/v1/provider_cases/CASE_ID/responses/RESPONSE_ID?access_token="AAAAAA"`

### URL Parameters

Parameter |  Description
--------- | -----------
CASE_ID | The ID of the case to retrieve
RESPONSE_ID | The ID of the specific response you want to get

## Post a Response

```shell
curl -X POST
  -H "Content-Type: application/json"
  -d '{"response":{"body":"This is where you put the text of the response.","purpose":"specialist_opinion","need_reply":"true"}}' "https://rubiconmd.com/api/v1/referrals/63/responses?access_token=AAAAAA"

curl -X POST
  -H "Content-Type: application/json"
  -d '{"response":{"body":"This is where you put the text of the response.","purpose":"pcp_comment","need_reply":"true"}}' "https://rubiconmd.com/api/v1/provider_cases/63/responses?access_token=AAAAAA"
```

>A successful POST request returns a JSON response:

```json
{
  "id": 17,
  "case_id": 63,
  "specialist_id": 12,
  "body": "This is where you put the text of the response.",
  "created_at": "2014-04-12T14:11:38.554-04:00",
  "purpose": "pcp_comment",
  "need_reply": true
}
```

This allows you post a response in a specific case (as a specialist). It also returns your response.

### HTTP Request

`POST https://rubiconmd.com/api/v1/referrals/CASE_ID/responses/ {"response": {"body": TEXT, "purpose": "specialist_opinion", "need_reply": BOOLEAN} }`

or

`POST https://rubiconmd.com/api/v1/provider_cases/CASE_ID/responses/ {"response": {"body": TEXT, "purpose": "pcp_comment", "need_reply": BOOLEAN} }`

### URL Parameters

Parameter |  Description
--------- | -----------
CASE_ID | The ID of the case you want to respond to
body | TEXT field with your response
purpose | "specialist_opinion" or "pcp_comment"
need_reply | BOOLEAN field, set to true if a reply is required from the provider/specialist

<aside class="notice">
The server will return an "unprocessable entity" HTTP response if the purpose does not match the user type (e.g., the user is a provider but the purpose is "specialist_reply").
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
curl -i https://rubiconmd.com/api/v1/users/me?access_token="AAAAAA"
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

# iFrame

##iFrame URL calls

In order to call certain pages of our site through an iFrame, you must first obtain a user token.  It's a two-step process.

1. Get a user token by curling the token endpoint with the access token.
2. Append the user token along with user info in the url.

<aside class="notice">
User tokens are one-time/single use only.
</aside>

##Obtaining a user token

To get a user token, curl the endpoint with the access token.

```shell
curl -i https://rubiconmd.com/api/v1/users/token?access_token="AAAAAA"
```

> A successful request will return:

```json
[
  {
    "user_token": "AAAAAA",
    "created_at": -1302048000,
    "expires_in": 300
  }
]
```

### HTTP Request

`GET https://rubiconmd.com/api/v1/users/token?access_token="AAAAAA"`

##Auto-login & Display case

Pass users' username, user token, and case id parameters into the URL.

### HTTP Request

`GET https://rubiconmd.com/pcp_iframe?user_username=EMAIL&user_token=TOKEN&case_id=CASE_ID`

### URL Parameters

Parameter |  Description
--------- | -----------
email | The e-mail of the user you are logging in.
user_token | Single-use user token.
case_id | The ID of the case you want to see.

<aside class="notice">
If you send the user to the iframe with an invalid token the user will be asked to login.  No errors will be raised.
</aside>
