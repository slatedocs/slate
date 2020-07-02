---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript
  - java

toc_footers:
  - <a href='mailto:info@springverify.com'>Email us for access</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introduction

Welcome to SpringVerify India API Documentation. The endpoints exposed in this documentation are to collect user information to verify. Example: National ID, past employments or past education etc. The first step is to login to get a JWT token. The token is then used to submit add a candidate (initiate) and then submit documents(ID, education and experience). 

The SpringVerify India API is organized around REST. Our API has predictable resource-oriented URLs, accepts form request JSON bodies, returns JSON responses, and uses standard HTTP response codes, authentication, and verbs.

<aside class="notice">
Note This documentation is intended for developers only.
</aside>

## Environment Urls

We currently have two environments, development and production. Both the environments have separate databases. During development base url of development environment must be used.

### Development:
  https://api-dev.in.springverify.com

### Production:
  https://api.in.springverify.com

## Postman

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/87c12d8a47528cde952c)

<aside class="notice">
  Please contact SpringVerify Team (info@springverify.com) to register your company. Currently there is no sign up for security reasons.
</aside>

# Login


> The response looks like this

```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/auth/login' \
--header 'Content-Type: application/json' \
--data-raw '{
	"email":"jackhym23@gmail.com",
      "password":"999999999"
}'
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/auth/login")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request.body = "{\n\t\"email\":\"jackhym23@gmail.com\",\n      \"password\":\"999999999\"\n}"

response = https.request(request)
puts response.read_body
```

```python
import http.client
import mimetypes
conn = http.client.HTTPSConnection("api-dev.in.springverify.com")
payload = "{\n\t\"email\":\"jackhym23@gmail.com\",\n      \"password\":\"999999999\"\n}"
headers = {
  'Content-Type': 'application/json'
}
conn.request("POST", "/v1/auth/login", payload, headers)
res = conn.getresponse()
data = res.read()
print(data.decode("utf-8"))
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"email":"jackhym23@gmail.com","password":"999999999"});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/auth/login", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n\t\"email\":\"jackhym23@gmail.com\",\n      \"password\":\"999999999\"\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/auth/login")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .build();
Response response = client.newCall(request).execute();
```

```json
{
  "message": "logged in successfully",
  "data": {
          "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6Mn0sImlhdCI6MTU4MjU1MjcyOCwiZXhwIjoxNTg2MTUyNzI4fQ.7zs45ogp_Rcma7sJkzNcH5cnZ6gMQK-NXZjbxDsyFJw"
  }
}
```


This API is used to login into the platform. We use Json Web Token for authentication. Please refer [here](https://jwt.io/introduction/) to know more about Json Web Token. It is used as Bearer Token in all the API's appart from login API.


<aside class="notice">
Use the JWT token in response as Authorization for all the APIs
</aside>

Use the credentials provided to your company and the Auth Token for generating JWT token


<aside class="success">
Validity - of the token is 7 days, after which new one needs to be generated
</aside>


# Add Candidates
```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/candidate' \
		--header 'Content-Type: application/json' \
		--header 'Authorization: Bearer <Token>' \
		--data-raw '{
		    "name": "Anurag Sandhu",
		    "email": "anurag.sandhu@springrole.com",
		    "consentUrl" : <consent_url>,
		    "verifications": {
		        "identity": {
		            "pan": true,
		            "drivingLicense": true,
		            "passport": true,
		            "voterId": true
		        },
		        "address": {
		            "current": false,
		            "permanent": false
		        },
		        "education": {
		            "10": true,
		            "12": true,
		            "bachelor": false,
		            "masters": true,
		            "doctorate": true
		        },
		        "workExperience": {
		            "employments": 1
		        },
		        "criminalRecord": {
		            "current": false,
		            "permanent": false
		        }
		    }
		}'
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n    \"name\": \"Anurag Sandhu\",\n    \"email\": \"anurag.sandhu@springrole.com\",\n    \"consentUrl\" : \"https://springverify-assets.s3.amazonaws.com/ccl_1574149640_332.pdf\",\n    \"verifications\": {\n        \"identity\": {\n            \"pan\": true,\n            \"drivingLicense\": true,\n            \"passport\": true,\n            \"voterId\": true\n        },\n        \"address\": {\n            \"current\": true,\n            \"permanent\": false\n        },\n        \"education\": {\n            \"10\": true,\n            \"12\": true,\n            \"bachelor\": false,\n            \"masters\": true,\n            \"doctorate\": true\n        },\n        \"workExperience\": {\n            \"employments\": 1\n        },\n        \"criminalRecord\": {\n            \"current\": true,\n            \"permanent\": false\n        }\n    }\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/candidate")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTA2NTA4MzMsImV4cCI6MTU5NDI1MDgzM30.9N-UbVrZh1894rbsmYuEUmY8CqD7jNuMWkx0KQ521XQ")
  .build();
Response response = client.newCall(request).execute();
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/candidate")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTA2NTA4MzMsImV4cCI6MTU5NDI1MDgzM30.9N-UbVrZh1894rbsmYuEUmY8CqD7jNuMWkx0KQ521XQ"
request.body = "{\n    \"name\": \"Anurag Sandhu\",\n    \"email\": \"anurag.sandhu@springrole.com\",\n    \"consentUrl\" : \"https://springverify-assets.s3.amazonaws.com/ccl_1574149640_332.pdf\",\n    \"verifications\": {\n        \"identity\": {\n            \"pan\": true,\n            \"drivingLicense\": true,\n            \"passport\": true,\n            \"voterId\": true\n        },\n        \"address\": {\n            \"current\": true,\n            \"permanent\": false\n        },\n        \"education\": {\n            \"10\": true,\n            \"12\": true,\n            \"bachelor\": false,\n            \"masters\": true,\n            \"doctorate\": true\n        },\n        \"workExperience\": {\n            \"employments\": 1\n        },\n        \"criminalRecord\": {\n            \"current\": true,\n            \"permanent\": false\n        }\n    }\n}"

response = https.request(request)
puts response.read_body
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTA2NTA4MzMsImV4cCI6MTU5NDI1MDgzM30.9N-UbVrZh1894rbsmYuEUmY8CqD7jNuMWkx0KQ521XQ");

var raw = JSON.stringify({"name":"Anurag Sandhu","email":"anurag.sandhu@springrole.com","consentUrl":"https://springverify-assets.s3.amazonaws.com/ccl_1574149640_332.pdf","verifications":{"identity":{"pan":true,"drivingLicense":true,"passport":true,"voterId":true},"address":{"current":true,"permanent":false},"education":{"10":true,"12":true,"bachelor":false,"masters":true,"doctorate":true},"workExperience":{"employments":1},"criminalRecord":{"current":true,"permanent":false}}});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/candidate", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/candidate"

payload = "{\n    \"name\": \"Anurag Sandhu\",\n    \"email\": \"anurag.sandhu@springrole.com\",\n    \"consentUrl\" : \"https://springverify-assets.s3.amazonaws.com/ccl_1574149640_332.pdf\",\n    \"verifications\": {\n        \"identity\": {\n            \"pan\": true,\n            \"drivingLicense\": true,\n            \"passport\": true,\n            \"voterId\": true\n        },\n        \"address\": {\n            \"current\": true,\n            \"permanent\": false\n        },\n        \"education\": {\n            \"10\": true,\n            \"12\": true,\n            \"bachelor\": false,\n            \"masters\": true,\n            \"doctorate\": true\n        },\n        \"workExperience\": {\n            \"employments\": 1\n        },\n        \"criminalRecord\": {\n            \"current\": true,\n            \"permanent\": false\n        }\n    }\n}"
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTA2NTA4MzMsImV4cCI6MTU5NDI1MDgzM30.9N-UbVrZh1894rbsmYuEUmY8CqD7jNuMWkx0KQ521XQ'
}

response = requests.request("POST", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```

> Response looks like this

```json
{
    "message": "Candidate registered, token shared for further communication of {Anurag Sandhu}",
    "uuid": "57e7423d-5ed0-46d9-9d6b-f96255362c40",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNjUsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODI4OTA1NDJ9.NqSLyvSicWdvSHEJcS8C3-Q1DAS4N45HtaUlO1ICT0U"
}
```

Post API to gather candidate's basic details and configuration. The configuration is decided at the company (your) end. 

The configuration sent in this api will be validated against enteries in following APIs. For example, if Pan is True, we expect candidate's PAN card in identity verification API.

<aside class="notice">
Use the uuid and token returned in the preceding APIs.
</aside>


# Identity Verification

Post API to store ID cards of the candidate. Optionally, we can do <b>OCR</b> on the uploaded document.


```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/documents/identity' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <Token>' \
--header 'Content-Type: application/json' \
--data-raw '{
"type" : "ind_voter_id",
"front" : <front_doc_url>,
"back" : <back_doc_url>,
"docs" : [ <doc_urls> ]
}'
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n\"type\" : \"ind_voter_id\",\n\"docs\" : [ \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"]\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/documents/identity")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozODEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODQ2MTY0NTR9.CYYjDgp5kmRBxtbQpFmsaP2JB46Fct4yBOOmeW27rQc")
  .build();
Response response = client.newCall(request).execute();
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozODEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODQ2MTY0NTR9.CYYjDgp5kmRBxtbQpFmsaP2JB46Fct4yBOOmeW27rQc");

var raw = JSON.stringify({"type":"ind_voter_id","docs":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"]});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/documents/identity", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/documents/identity"

payload = "{\n\"type\" : \"ind_voter_id\",\n\"docs\" : [ \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"]\n}"
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozODEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODQ2MTY0NTR9.CYYjDgp5kmRBxtbQpFmsaP2JB46Fct4yBOOmeW27rQc'
}

response = requests.request("POST", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/documents/identity")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozODEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODQ2MTY0NTR9.CYYjDgp5kmRBxtbQpFmsaP2JB46Fct4yBOOmeW27rQc"
request.body = "{\n\"type\" : \"ind_voter_id\",\n\"docs\" : [ \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"]\n}"

response = https.request(request)
puts response.read_body
```

>Response looks like this

```json
{
  "message": "identity doc uploaded succesfully",
  "data": {}
}
```


Please give the image url in this API. Use the token which was returned after add candidate API. If your image is in base64, we suggest you host it on your server. 

<aside class="success">
  If you are unable to host the image securely, please contact us.
</aside>


If you know the front and back, please send in front and back keys. If front and back are not known, please send in the docs as an array. 

If front and back are provided, we conduct OCR of the document which can be fetched using getCandidate API. Back is optional, so you can only send front of the doc.

Doc Types with keys:

1. Driving License(ind_driving_license)
2. Passport(ind_passport)
3. Voter ID(ind_voter_id)
4. PAN(ind_pan)

# Add Employment
```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/documents/employment' \
--header 'Content-Type: application/json' \
--data-raw '{
    "employments" : [
        {
            "document_type": "SalarySlip",
            "companyName": "Google",
            "designation": "Engineer",
            "currentlyHere": true,
            "startDate": "25/11/19",
            "endDate" : "25/3/20",
            "s3Links" : [
                        <link1>,
                        <link2>,
                        <link3>
            ]
        }
    ]
}'
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNzEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODMzMDYyNTh9.g8MN0IksBnPmxsOgpeIg1D2-BIkDgkCUtXR6TXZYe34");

var raw = JSON.stringify({"employments":[{"document_type":"ABC","companyName":"ABC","designation":"1","currentlyHere":"true","startDate":"25/11/19","employmentLinks":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"]}]});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/documents/employment", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n    \"employments\" : [\n        {\n            \"document_type\": \"ABC\",\n\t\t\t\"companyName\": \"ABC\",\n            \"designation\": \"1\",\n            \"currentlyHere\": \"true\",\n            \"startDate\": \"25/11/19\",\n            \"employmentLinks\" : [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        }\n    ]\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/documents/employment")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNzEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODMzMDYyNTh9.g8MN0IksBnPmxsOgpeIg1D2-BIkDgkCUtXR6TXZYe34")
  .build();
Response response = client.newCall(request).execute();
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/documents/employment"

payload = "{\n    \"employments\" : [\n        {\n            \"document_type\": \"ABC\",\n\t\t\t\"companyName\": \"ABC\",\n            \"designation\": \"1\",\n            \"currentlyHere\": \"true\",\n            \"startDate\": \"25/11/19\",\n            \"employmentLinks\" : [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        }\n    ]\n}"
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNzEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODMzMDYyNTh9.g8MN0IksBnPmxsOgpeIg1D2-BIkDgkCUtXR6TXZYe34'
}

response = requests.request("POST", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/documents/employment")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNzEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODMzMDYyNTh9.g8MN0IksBnPmxsOgpeIg1D2-BIkDgkCUtXR6TXZYe34"
request.body = "{\n    \"employments\" : [\n        {\n            \"document_type\": \"ABC\",\n\t\t\t\"companyName\": \"ABC\",\n            \"designation\": \"1\",\n            \"currentlyHere\": \"true\",\n            \"startDate\": \"25/11/19\",\n            \"employmentLinks\" : [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        }\n    ]\n}"

response = https.request(request)
puts response.read_body
```

>Response looks like this

```json
{
    "message": "Employment saved",
    "response": [
    ]
}
```

This API is used to add employment details and any relevant docs of the user. Please give the image url in this API.

<aside class="notice">
 Use the token returned from add candidate API.
</aside>

<b>Currently Supported Documents with keys</b>

1. Salary Slip (SalarySlip)
2. Experience Letter (ExperienceLetter)
3. Relieving Letter (RelievingLetter)
4. Appointment Letter (AppointmentLetter)
5. Others - eg: no specific document (Other)


# Add Education

```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/documents/education' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozMjMsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODAzODUxMjN9.dInOuPThk52E7KLh1084zpxyfcWyYQQAPYiD9b2d05w' \
--data-raw '{
    "education" : {
      "10": [
          <link>
      ],
      "12": [
          <link>,
          <link>
      ],
      "bachelor": [
          <link>
      ],
      "masters": [
        <link>
      ],
      "doctorate": [
          <link>
      ]
    }
}'
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n\t\"education\" :     {\n        \"10\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"12\": [\n        ],\n        \"bachelor\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"masters\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"doctorate\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ]\n    }\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/documents/education")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNzEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODMzMDYyNTh9.g8MN0IksBnPmxsOgpeIg1D2-BIkDgkCUtXR6TXZYe34")
  .build();
Response response = client.newCall(request).execute();
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNzEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODMzMDYyNTh9.g8MN0IksBnPmxsOgpeIg1D2-BIkDgkCUtXR6TXZYe34");

var raw = JSON.stringify({"education":{"10":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"],"12":[],"bachelor":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"],"masters":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"],"doctorate":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"]}});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/documents/education", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/documents/education"

payload = "{\n\t\"education\" :     {\n        \"10\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"12\": [\n        ],\n        \"bachelor\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"masters\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"doctorate\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ]\n    }\n}"
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNzEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODMzMDYyNTh9.g8MN0IksBnPmxsOgpeIg1D2-BIkDgkCUtXR6TXZYe34'
}

response = requests.request("POST", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/documents/education")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjozNzEsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSJ9LCJpYXQiOjE1ODMzMDYyNTh9.g8MN0IksBnPmxsOgpeIg1D2-BIkDgkCUtXR6TXZYe34"
request.body = "{\n\t\"education\" :     {\n        \"10\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"12\": [\n        ],\n        \"bachelor\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"masters\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ],\n        \"doctorate\": [\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n            \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n        ]\n    }\n}"

response = https.request(request)
puts response.read_body
```

> example response

```json
{
    "message": "Education data saved",
    "listOfUploadedDocs": [
        "10",
        "masters",
        "doctorate"
    ],
    "listOfNotUploadedDocs": [
        "bachelor"
    ],
    "ReasonForNoteUploadingDocs": "You may not have selected the config checks while creating the user with springverify",
    "Note": "Empty array of any qualification won't get inserted in the DB"
}
```

This API is used to add education details and any relevant docs of the candidate.

<aside class="notice">
 Please give the image url in this API. Use the token which was returned after add candidate API.
</aside>

<aside class="warning">
  API will reject upload of any docs that were not set True in config.
</aside>

<b>Supported Documents with Keys</b>

1. 10th class (10)
2. 12th class (12)
3. Bachelor (bachelor)
4. Masters (masters)
5. Doctorate (doctorate)

# Get Candidate

```shell
curl --location --request GET 'https://api-dev.in.springverify.com/v1/candidate/fetch' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiYW51cmFnLnNhbmRodUBzcHJpbmdyb2xlLmNvbSIsImNvbXBhbnlJZCI6Mn0sImlhdCI6MTU4MTU4MDM5NywiZXhwIjoxNTg1MTgwMzk3fQ.p4K0NefA8eOXFcCqxOYiLtnhmXM0KbqsiBuVxsUqT_o' \
--data-raw '{
        "uuid" : ["89234831-1a7a-11ea-bc81-1657eb2ddd16", "16fe0e16-61dc-431c-9f33-255ec1b01fd4"]
}'
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n\t\"uuid\" : [\"b2c147ee-c971-41f9-bd86-98b2b13f6dac\"]\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/candidate/fetch")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo2NzUsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGx9LCJpYXQiOjE1OTA2NTE3NDJ9.-1uPRImDyqRFumQKzgW5EpKexBJT4J5fCrnlgbEarWw")
  .build();
Response response = client.newCall(request).execute();
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo2NzUsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGx9LCJpYXQiOjE1OTA2NTE3NDJ9.-1uPRImDyqRFumQKzgW5EpKexBJT4J5fCrnlgbEarWw");

var raw = JSON.stringify({"uuid":["b2c147ee-c971-41f9-bd86-98b2b13f6dac"]});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/candidate/fetch", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/candidate/fetch")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo2NzUsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGx9LCJpYXQiOjE1OTA2NTE3NDJ9.-1uPRImDyqRFumQKzgW5EpKexBJT4J5fCrnlgbEarWw"
request.body = "{\n\t\"uuid\" : [\"b2c147ee-c971-41f9-bd86-98b2b13f6dac\"]\n}"

response = https.request(request)
puts response.read_body
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/candidate/fetch"

payload = "{\n\t\"uuid\" : [\"b2c147ee-c971-41f9-bd86-98b2b13f6dac\"]\n}"
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo2NzUsImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGx9LCJpYXQiOjE1OTA2NTE3NDJ9.-1uPRImDyqRFumQKzgW5EpKexBJT4J5fCrnlgbEarWw'
}

response = requests.request("POST", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```

This API is used to get candidates in bulk. You can provide multiple candidates in array.

<aside type="notice">
  Use the token which was returned from add candidate API.
</aside>


> Example Response (with all possible fields)

```json
[
        {
                "id": 279,
                "uuid": "949ec540-fa8c-42cf-afc2-41888791755e",
                "company_id": 2,
                "candidate_id": 279,
                "employee_id": "34e",
                "phone_number": "9887484784",
                "country_code": "IN",
                "alt_phone_number": "8876868796",
                "alt_country_code": "IN",
                "resume": "https://springverify-assets-id.s3.amazonaws.com/-1578307634391-b2460e4c1de616a65546.doc",
                "category_id": 16,
                "created_at": "2020-01-06T10:47:14.000Z",
                "updated_at": "2020-03-04T12:21:49.000Z",
                "deleted_at": null,
                "candidate_ids": null,
                "work_experience": null,
                "education": null,
                "address": null,
                "history": null,
                "refcheck": null,
                "worldcheck": null,
                "creditcheck": null,
                "drugscheck": null,
                "typeform_url": null,
                "signrequest_url": null,
                "status": 0,
                "signedrequest_status": 0,
                "springverify_signature": null,
                "consent_letter_url": "https://springverify-assets-id.s3.amazonaws.com/ccl_1578307806_472792.pdf",
                "consent_added_at": "2020-01-06T10:50:07.000Z",
                "spring_candidate_ip": "172.31.22.211",
                "form_filled": "2020-01-06T10:50:10.000Z",
                "candidate_added_by": 1,
                "form_filled_by": 3,
                "consent_added_by": 3,
                "who_fills_form": 1,
                "past_jobs": "1",
                "springscan_id": null,
                "candidate": {
                        "id": 279,
                        "uuid": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                        "email": "kafew45165@sammail.ws",
                        "alternate_email": "rest@gmail.com",
                        "name": "Kafew",
                        "type": null,
                        "created_at": "2020-01-06T10:47:14.000Z",
                        "updated_at": "2020-01-06T10:47:14.000Z",
                        "ongrid_id": 19961,
                        "gender": 2,
                        "deleted_at": null,
                        "dob": null,
                        "father_name": null,
                        "email_reject_type": "NA",
                        "user_id": 0,
                        "candidates_ids": [
                                {
                                        "id": 163,
                                        "uuid": "762e2e49-f1d4-482a-8fd3-de04a512f8bd",
                                        "candidate_id": 279,
                                        "type_old": null,
                                        "type": 2,
                                        "identity_candidate_name": "Kafew45165",
                                        "data": "{\"files\":[\"https:\/\/springverify-assets-id.s3.amazonaws.com\/Kafew45165-2-1578320096389-279-2.jpg\"]}",
                                        "parsed_data": "https://springverify-assets-id.s3.amazonaws.com/Kafew45165-1578307705152-279-ind_pan.jpg",
                                        "status": 2,
                                        "qc_check_log_id": null,
                                        "created_at": "2020-01-06T10:50:10.000Z",
                                        "updated_at": "2020-02-19T14:39:03.000Z",
                                        "ongrid_document_id": null,
                                        "ongrid_request_id": null,
                                        "identity_number": "FGSPS5178C",
                                        "ongrid_reports": null,
                                        "father_name": "Sreenath",
                                        "dob": "1990-07-10",
                                        "completed_at": "2020-01-05T18:30:00.000Z",
                                        "comments": "",
                                        "report": "{\"identity_name\":\"\",\"identity_name_status\":\"0\",\"identity_number\":\"\",\"identity_number_status\":\"0\",\"father_name\":\"N\/A\",\"father_name_status\":\"0\",\"dob\":\"09-9-1992\",\"dob_status\":\"1\"}",
                                        "requested_at": "2020-01-05T18:30:00.000Z",
                                        "added_to_report_at": null,
                                        "ops_status_uuid": "N/A",
                                        "isGovernmentVerificationSuccess": -1,
                                        "isIdVerified": -1,
                                        "isFrontNotShared": -1,
                                        "is_migrated": 1,
                                        "deleted_at": null
                                },
                                {
                                        "id": 166,
                                        "uuid": "4938b331-fb66-42e8-a2df-7332bc06aad8",
                                        "candidate_id": 279,
                                        "type_old": null,
                                        "type": 5,
                                        "identity_candidate_name": "Kafew45165",
                                        "data": "{\"files\":[\"https:\/\/springverify-assets-id.s3.amazonaws.com\/Kafew45165-identity_info-1578387628410-279-Voter_Id.jpg\"]}",
                                        "parsed_data": null,
                                        "status": -2,
                                        "qc_check_log_id": null,
                                        "created_at": "2020-01-07T09:00:28.000Z",
                                        "updated_at": "2020-03-04T12:30:12.000Z",
                                        "ongrid_document_id": 20262,
                                        "ongrid_request_id": 14060,
                                        "identity_number": "LBT1381581",
                                        "ongrid_reports": null,
                                        "father_name": "Balaicharan Mandal",
                                        "dob": null,
                                        "completed_at": "2020-03-03T18:30:00.000Z",
                                        "comments": "",
                                        "report": "{\"identity_name\":\"\",\"identity_name_status\":\"0\",\"identity_number\":\"\",\"identity_number_status\":\"0\",\"father_name\":\"\",\"father_name_status\":\"0\",\"dob\":null,\"dob_status\":\"0\"}",
                                        "requested_at": "2020-01-06T18:30:00.000Z",
                                        "added_to_report_at": null,
                                        "ops_status_uuid": "N/A",
                                        "isGovernmentVerificationSuccess": -1,
                                        "isIdVerified": -1,
                                        "isFrontNotShared": -1,
                                        "is_migrated": 1,
                                        "deleted_at": null
                                }
                        ],
                        "candidate_drugs": [
                                {
                                        "id": 25,
                                        "uuid": "902f7dfb-aaa8-436d-bcae-df9f775ee52c",
                                        "candidate_id": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                                        "candidate_name": "Kafew45165",
                                        "verification_type": null,
                                        "sample_type": null,
                                        "panel_type": "5 PANEL",
                                        "status": 0,
                                        "qc_check_log_id": null,
                                        "comments": null,
                                        "requested_date": null,
                                        "completed_date": null,
                                        "created_at": "2020-01-20T10:52:37.000Z",
                                        "updated_at": "2020-01-20T10:52:37.000Z",
                                        "deleted_at": null
                                }
                        ],
                        "candidates_creditchecks": [
                                {
                                        "id": 15,
                                        "uuid": "08f2024e-b5b9-44f2-ba94-52c299f17a47",
                                        "candidate_id": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                                        "name": "Kafew45165",
                                        "pan_number": "FGSPS5178C",
                                        "dob": null,
                                        "address": "TESYTHJGBJHGHJGHJ",
                                        "credit_score": null,
                                        "loan_score": null,
                                        "status": 1,
                                        "qc_check_log_id": null,
                                        "comments": "",
                                        "requested_date": null,
                                        "completed_date": "2020-03-04",
                                        "created_at": "2020-01-06T10:59:58.000Z",
                                        "updated_at": "2020-03-04T12:20:43.000Z",
                                        "deleted_at": null
                                },
                                {
                                        "id": 19,
                                        "uuid": "2e08af0e-9a7d-4084-ba26-efa351768290",
                                        "candidate_id": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                                        "name": "Kafew45165",
                                        "pan_number": "FGSPS5178C",
                                        "dob": "1990-07-10",
                                        "address": "TESYTHJGBJHGHJGHJ",
                                        "credit_score": null,
                                        "loan_score": null,
                                        "status": 0,
                                        "qc_check_log_id": null,
                                        "comments": null,
                                        "requested_date": null,
                                        "completed_date": null,
                                        "created_at": "2020-01-20T10:52:55.000Z",
                                        "updated_at": "2020-01-20T10:52:55.000Z",
                                        "deleted_at": null
                                },
                                {
                                        "id": 20,
                                        "uuid": "01870e90-0f19-4fdf-bf3d-1afd60b3c353",
                                        "candidate_id": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                                        "name": "Kafew45165",
                                        "pan_number": "FGSPS5178C",
                                        "dob": "1990-07-10",
                                        "address": "TESYTHJGBJHGHJGHJ",
                                        "credit_score": null,
                                        "loan_score": null,
                                        "status": -1,
                                        "qc_check_log_id": null,
                                        "comments": "",
                                        "requested_date": null,
                                        "completed_date": null,
                                        "created_at": "2020-01-21T11:10:32.000Z",
                                        "updated_at": "2020-01-21T11:11:13.000Z",
                                        "deleted_at": null
                                }
                        ],
                        "candidates_addresses": [
                                {
                                        "id": 184,
                                        "uuid": "d4e17b9a-5412-4774-8c50-bb4a2e98dcbb",
                                        "candidate_id": 279,
                                        "address_candidate_name": "Kafew45165",
                                        "provider_request_id": null,
                                        "provider_postal_request_id": null,
                                        "idfy_request_id": null,
                                        "provider_type": null,
                                        "order_number": null,
                                        "sv_postal_id": null,
                                        "address_id": null,
                                        "type": "Permanent Address",
                                        "data": "{\"files\":[\"https:\/\/springverify-assets-id.s3.amazonaws.com\/Kafew45165-1578307738392-279-candidate_ADDRESS_address.png\"]}",
                                        "status": 2,
                                        "qc_check_log_id": null,
                                        "created_at": "2020-01-06T10:50:10.000Z",
                                        "updated_at": "2020-05-06T11:21:49.000Z",
                                        "requested_at": "2020-01-06",
                                        "completed_at": "2020-03-04",
                                        "address_1": "TESYT",
                                        "address_2": "HJGBJHGHJGHJ",
                                        "city": "BANGLORE",
                                        "state": "karnataka",
                                        "zipcode": 560097,
                                        "country": "India",
                                        "landmark": "ergrtgrtgtrg",
                                        "reports": "{\"address_candidate_name_status\":\"0\",\"address_status\":\"0\",\"city_status\":\"0\",\"state_status\":\"0\",\"zipcode_status\":\"0\",\"address_type_status\":\"0\",\"ownership_status_status\":\"0\",\"staying_since_status\":\"0\",\"geo_point\":{\"latitude\":null,\"longitude\":null},\"verification_type\":\"\",\"completed_at\":1583260200000}",
                                        "document_type": "Voter Id",
                                        "is_candidate_available": 1,
                                        "relation_name": null,
                                        "address_information": "{\"address_type\":\"Own \/ Parents\",\"currently_reside\":\"Yes\",\"length_of_stay\":\"6 years\"}",
                                        "gmap_address_info": "{\"lat\":\"\",\"lng\":\"\",\"full_address\":\"\",\"place_id\":\"\"}",
                                        "ops_status_uuid": "N/A",
                                        "deleted_at": null,
                                        "is_file_migrated": 1,
                                        "address_type": null,
                                        "currently_reside": null,
                                        "length_of_stay": null,
                                        "other_document_type": null
                                }
                        ],
                        "candidates_educations": [
                                {
                                        "id": 160,
                                        "uuid": "6215f9ff-057c-4535-a46b-b6280a84c639",
                                        "candidate_id": 279,
                                        "education_candidate_name": "Kafew45165",
                                        "institute_name": "rweerf",
                                        "specialization": "computer science",
                                        "authority": "dit",
                                        "type": "GRADUATE",
                                        "course_type": "REGULAR",
                                        "data": "{\"files\":[\"https:\/\/springverify-assets-id.s3.amazonaws.com\/Kafew45165-1578307785420-279-candidate_EDUCATION_education.jpg\"]}",
                                        "document_type": "Degree Certificate",
                                        "status": 1,
                                        "qc_check_log_id": null,
                                        "created_at": "2020-01-06T10:50:10.000Z",
                                        "updated_at": "2020-03-04T12:35:09.000Z",
                                        "ongrid_request_id": null,
                                        "issue_date": "2020-03-02",
                                        "registrationNumber": "e4554554",
                                        "ongrid_document_id": null,
                                        "ongrid_reports": "{\"education_candidate_name_status\":\"0\",\"name_of_institute_status\":\"0\",\"name_of_boarduniversity_status\":\"0\",\"course_name_status\":\"0\",\"course_type_status\":\"0\",\"registration_number_status\":\"0\",\"start_date_status\":\"0\",\"currently_studying_here_status\":\"0\",\"grade_status\":\"0\",\"respondent_name\":\"test\",\"respondent_designation\":\"fgbfgbgfb\",\"respondent_email\":\"tehst@gmail.com\",\"respondent_phone\":\"8954914334\",\"comments\":\"hvghfgh\"}",
                                        "start_date": "February 2018",
                                        "currently_studying_here": 1,
                                        "passing_year": null,
                                        "verification_type": null,
                                        "verification_source": null,
                                        "requested_at": "2020-01-06",
                                        "completed_at": "2020-03-04",
                                        "final_result": "",
                                        "ops_status_uuid": "N/A",
                                        "deleted_at": null,
                                        "is_file_migrated": 1,
                                        "degree": null
                                }
                        ],
                        "candidates_employments": [
                                {
                                        "id": 169,
                                        "uuid": "65f81928-844f-49c1-8ed0-169fef16e580",
                                        "candidate_id": 279,
                                        "emp_candidate_name": "Kafew45165",
                                        "company_name": "testueopkv",
                                        "company_data": "{\"files\":[\"https:\/\/springverify-assets-id.s3.amazonaws.com\/Kafew45165-1578307755223-279-candidate_EMPLOYMENT_employment.png\"]}",
                                        "status": 2,
                                        "qc_check_log_id": null,
                                        "created_at": "2020-01-06T10:50:10.000Z",
                                        "updated_at": "2020-03-04T12:33:30.000Z",
                                        "designation": "tester",
                                        "employee_id": "233434",
                                        "location": "Bangalore, Karnataka, India",
                                        "start_date": "2017-03-07",
                                        "currently_here": 0,
                                        "end_date": "2019-09-09",
                                        "verification_type": null,
                                        "completion_date": "2020-03-04",
                                        "ongrid_request_id": null,
                                        "ongrid_document_id": null,
                                        "document_type": "ExperienceLetter",
                                        "ongrid_reports": "{\"name_status\":\"0\",\"company_name_status\":\"0\",\"designation_status\":\"0\",\"employee_id_status\":\"0\",\"working_city_status\":\"0\",\"joining_date_status\":\"0\",\"last_working_date_status\":\"0\",\"currently_here_status\":\"0\",\"reason_for_leaving_status\":\"0\",\"annual_compensation_status\":\"0\",\"rm_name_status\":\"0\",\"rm_email_status\":\"0\",\"rm_phone_status\":\"0\"}",
                                        "hr_name": "test",
                                        "hr_phone": "",
                                        "hr_email": "",
                                        "rm_name": "",
                                        "rm_email": "",
                                        "rm_phone": "",
                                        "recommend_hire": null,
                                        "left_comment": "",
                                        "compensation": "",
                                        "requested_at": "2020-01-05T18:30:00.000Z",
                                        "compensation_type": "",
                                        "initiated_to_vs": null,
                                        "ops_status_uuid": "N/A",
                                        "deleted_at": null,
                                        "is_file_migrated": 1
                                }
                        ],
                        "candidates_worldchecks": [
                                {
                                        "id": 31,
                                        "uuid": "0934deb9-2593-49d0-8ad9-b9b78dca9440",
                                        "candidate_id": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                                        "candidate_name": "Kafew45165",
                                        "father_name": "Sreenath",
                                        "address": "TESYTHJGBJHGHJGHJ, BANGLORE, karnataka, 560097",
                                        "dob": "1990-07-10",
                                        "verification_type": null,
                                        "status": 0,
                                        "qc_check_log_id": null,
                                        "verifier": null,
                                        "comments": null,
                                        "requested_date": null,
                                        "completed_date": null,
                                        "created_at": "2020-01-20T10:51:55.000Z",
                                        "updated_at": "2020-01-20T10:51:55.000Z",
                                        "deleted_at": null
                                }
                        ],
                        "candidate_histories": [
                                {
                                        "id": 23,
                                        "uuid": "b5b54612-c68a-4a55-b3d1-c996c9803202",
                                        "candidate_id": 279,
                                        "address_id": 184,
                                        "comments": "",
                                        "completion_date": "2020-03-04",
                                        "created_at": "2020-03-04T12:22:12.000Z",
                                        "updated_at": "2020-03-04T12:37:25.000Z",
                                        "deleted_at": null,
                                        "status": 2,
                                        "qc_check_log_id": null,
                                        "file_url": null,
                                        "verify_ids": null,
                                        "store_data": null,
                                        "final_data": null,
                                        "algo_type": 11,
                                        "requested_at": "2020-03-04",
                                        "added_to_report_at": null,
                                        "ops_status_uuid": "N/A",
                                        "is_file_migrated": 0
                                }
                        ],
                        "candidates_refchecks": [
                                {
                                        "id": 3,
                                        "uuid": "c38221f2-9257-4623-9a9a-08671fae79a4",
                                        "candidate_id": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                                        "emp_uuid": null,
                                        "name": "Kafew45165",
                                        "employer_name": "terrtg",
                                        "designation": "rtgrhrth",
                                        "verification_type": "",
                                        "verifier_name": "",
                                        "verifier_phone": "",
                                        "verifier_email": "",
                                        "verifier_designation": "",
                                        "is_verifier_working": 0,
                                        "doj": null,
                                        "lwd": null,
                                        "currently_working": null,
                                        "hr_name": "test",
                                        "hr_phone": "",
                                        "hr_email": "",
                                        "rm_name": "rthrhhtrhy",
                                        "rm_email": "trte@gmail.com",
                                        "rm_phone": "887877647",
                                        "status": 1,
                                        "qc_check_log_id": null,
                                        "comments": "",
                                        "requested_date": null,
                                        "completed_date": "2020-01-06",
                                        "created_at": "2020-01-06T11:00:21.000Z",
                                        "updated_at": "2020-01-06T11:00:21.000Z",
                                        "deleted_at": null
                                },
                                {
                                        "id": 5,
                                        "uuid": "bea817e6-2e2e-45a5-81c9-91f8ff8e6fdc",
                                        "candidate_id": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                                        "emp_uuid": null,
                                        "name": "Kafew45165",
                                        "employer_name": "",
                                        "designation": "",
                                        "verification_type": "ghnghn",
                                        "verifier_name": "ghnghn",
                                        "verifier_phone": "8984756574855",
                                        "verifier_email": "test@gmail.com",
                                        "verifier_designation": "rfgerggtr",
                                        "is_verifier_working": 1,
                                        "doj": null,
                                        "lwd": null,
                                        "currently_working": null,
                                        "hr_name": "test",
                                        "hr_phone": "",
                                        "hr_email": "",
                                        "rm_name": "",
                                        "rm_email": "",
                                        "rm_phone": "",
                                        "status": 1,
                                        "qc_check_log_id": null,
                                        "comments": "",
                                        "requested_date": null,
                                        "completed_date": "2020-01-06",
                                        "created_at": "2020-01-06T13:17:00.000Z",
                                        "updated_at": "2020-01-06T13:17:00.000Z",
                                        "deleted_at": null
                                },
                                {
                                        "id": 17,
                                        "uuid": "34292294-447f-4ce7-a628-7730c816b661",
                                        "candidate_id": "30f8f49f-947f-4efb-a779-52bf57d7abaa",
                                        "emp_uuid": null,
                                        "name": "Kafew45165",
                                        "employer_name": "",
                                        "designation": "",
                                        "verification_type": null,
                                        "verifier_name": null,
                                        "verifier_phone": "",
                                        "verifier_email": "",
                                        "verifier_designation": null,
                                        "is_verifier_working": null,
                                        "doj": null,
                                        "lwd": null,
                                        "currently_working": null,
                                        "hr_name": "test",
                                        "hr_phone": "",
                                        "hr_email": "",
                                        "rm_name": "",
                                        "rm_email": "",
                                        "rm_phone": "",

                                        "qc_check_log_id": null,
                                        "comments": null,
                                        "requested_date": null,
                                        "completed_date": null,
                                        "created_at": "2020-01-20T10:53:19.000Z",
                                        "updated_at": "2020-01-20T10:53:19.000Z",
                                        "deleted_at": null
                                }
                        ]
                }
        },
]
```

<!-- # Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

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

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete -->

