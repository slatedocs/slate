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

[![Run in Postman](https://run.pstmn.io/button.svg)](https://www.getpostman.com/collections/87c12d8a47528cde952c)

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

# Add Candidate Details

```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/candidate/information' \
--header 'Content-Type: application/json' \
--data-raw '{
    "candidate_uuid": "da67740b-3c7e-4cb3-95df-32555e12304c",
    "basic_details": {
        "full_name": "John Doe",
        "employee_id": "412"
    },
    "contact_details": {
        "email": "karan.ahuja@springrole.com",
        "alternate_email": "john.doe@personal.com",
        "phone_number": "+919999999999",
        "alternate_phone_number": "+918888888888",
        "whatsapp_update": false
    },
    "id_check": [
        {
            "id_type": "ind_pan",
            "front_doc_url": "<image_url>",
            "back_doc_url": "<image_url>"
        }
    ],
    "employment_check": {
        "no_of_previous_jobs": 1,
        "data": [
            {
                "company_name": "Testone",
                "employee_id": "567888",
                "city": "Delhi",
                "country": "India",
                "designation": "Dev",
                "currently_working": false,
                "reason": "Test",
                "duration": {
                    "start_date": "2008-04-09",
                    "end_date": "2012-06-06",
                    "currently_working": false
                },
                "doc_type": "ExperienceLetter",
                "proof_doc": [
                    "<image_url>",
                    "<image_url>"
                ],
                "hr_info": {
                    "full_name": "Testing",
                    "email": "Test@gmail.com",
                    "phone_number": "+919658447556"
                },
                "manager_info": {
                    "full_name": "Testone",
                    "email": "Test@gmail.com",
                    "phone_number": "+918954914334"
                }
            }
        ]
    },
    "education_check": [
        {
            "education_level": "Professional Course",
            "degree_type": "Part Time",
            "university_name": "Tedt",
            "registration_number": "66445666",
            "degree": "Test",
            "areas_of_study": "Testtest",
            "dates_attended": {
                "start_date": "02/2013",
                "end_date": "05/2016"
            },
            "grade_sheet": ["<image_url>"],
            "certificate":  "<image_url>"
        }
    ],
    "address_check": {
        "permanent_address": {
            "house_no": "Tccycfyyd",
            "colony": "Iggihiihi",
            "rented": "false",
            "landmark": "Uffififiiffiififufuf",
            "pincode": "560030",
            "country": "India",
            "city": "Bengaluru ",
            "state": "Karnataka",
            "latitude": "",
            "longitude": "",
            "staying_period": "3 years",
            "is_current_permanent_same": true,
            "is_candidate_available": true,
            "other_full_name": "",
            "relation": "",
            "other_relation": "",
            "relative_country_code": "+91",
            "relative_phone_number": "",
            "other_phone_number": "+91",
            "doc_type": "Passport",
            "other_doc": "",
            "front_doc_url":  "<image_url>",
            "back_doc_url":  "<image_url>",
            "front_pdf": true,
            "back_pdf": false,
            "single_doc": false,
            "gmap_address_info": {
                "lat": null,
                "lng": null,
                "full_address": null,
                "place_id": null
            },
            "absence_contact_details": {
                "full_name": null,
                "relation": null,
                "phone_number": null
            }
        },
        "current_address": {
            "house_no": "Tccycfyyd",
            "colony": "Iggihiihi",
            "rented": "false",
            "landmark": "Uffififiiffiififufuf",
            "pincode": "560030",
            "country": "India",
            "city": "Bengaluru ",
            "state": "Karnataka",
            "latitude": "",
            "longitude": "",
            "staying_period": "3 years",
            "is_current_permanent_same": true,
            "is_candidate_available": true,
            "other_full_name": "",
            "relation": "",
            "other_relation": "",
            "relative_country_code": "+91",
            "relative_phone_number": "",
            "other_phone_number": "+91",
            "doc_type": "Passport",
            "other_doc": "",
            "front_doc_url":  "<image_url>",
            "back_doc_url": "<image_url>",
            "front_pdf": true,
            "back_pdf": false,
            "single_doc": false,
            "gmap_address_info": {
                "lat": null,
                "lng": null,
                "full_address": null,
                "place_id": null
            },
            "absence_contact_details": {
                "full_name": null,
                "relation": null,
                "phone_number": null
            }
        }
    },
    "consent": {
        "docUrl": "www.google.com"
    },
    "send_candidate_consent_email": false
}'
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n    \"candidate_uuid\": \"da67740b-3c7e-4cb3-95df-32555e12304c\",\n    \"basic_details\": {\n        \"full_name\": \"John Doe\",\n        \"employee_id\": \"412\"\n    },\n    \"contact_details\": {\n        \"email\": \"karan.ahuja@springrole.com\",\n        \"alternate_email\": \"john.doe@personal.com\",\n        \"phone_number\": \"+919999999999\",\n        \"alternate_phone_number\": \"+918888888888\",\n        \"whatsapp_update\": false\n    },\n    \"id_check\": [\n        {\n            \"id_type\": \"ind_pan\",\n            \"front_doc_url\": \"<image_url>\",\n            \"back_doc_url\": \"<image_url>\"\n        }\n    ],\n    \"employment_check\": {\n        \"no_of_previous_jobs\": 1,\n        \"data\": [\n            {\n                \"company_name\": \"Testone\",\n                \"employee_id\": \"567888\",\n                \"city\": \"Delhi\",\n                \"country\": \"India\",\n                \"designation\": \"Dev\",\n                \"currently_working\": false,\n                \"reason\": \"Test\",\n                \"duration\": {\n                    \"start_date\": \"2008-04-09\",\n                    \"end_date\": \"2012-06-06\",\n                    \"currently_working\": false\n                },\n                \"doc_type\": \"ExperienceLetter\",\n                \"proof_doc\": [\n                    \"<image_url>\",\n                    \"<image_url>\"\n                ],\n                \"hr_info\": {\n                    \"full_name\": \"Testing\",\n                    \"email\": \"Test@gmail.com\",\n                    \"phone_number\": \"+919658447556\"\n                },\n                \"manager_info\": {\n                    \"full_name\": \"Testone\",\n                    \"email\": \"Test@gmail.com\",\n                    \"phone_number\": \"+918954914334\"\n                }\n            }\n        ]\n    },\n    \"education_check\": [\n        {\n            \"education_level\": \"Professional Course\",\n            \"degree_type\": \"Part Time\",\n            \"university_name\": \"Tedt\",\n            \"registration_number\": \"66445666\",\n            \"degree\": \"Test\",\n            \"areas_of_study\": \"Testtest\",\n            \"dates_attended\": {\n                \"start_date\": \"02/2013\",\n                \"end_date\": \"05/2016\"\n            },\n            \"grade_sheet\": [\"<image_url>\"],\n            \"certificate\":  \"<image_url>\"\n        }\n    ],\n    \"address_check\": {\n        \"permanent_address\": {\n            \"house_no\": \"Tccycfyyd\",\n            \"colony\": \"Iggihiihi\",\n            \"rented\": \"false\",\n            \"landmark\": \"Uffififiiffiififufuf\",\n            \"pincode\": \"560030\",\n            \"country\": \"India\",\n            \"city\": \"Bengaluru \",\n            \"state\": \"Karnataka\",\n            \"latitude\": \"\",\n            \"longitude\": \"\",\n            \"staying_period\": \"3 years\",\n            \"is_current_permanent_same\": true,\n            \"is_candidate_available\": true,\n            \"other_full_name\": \"\",\n            \"relation\": \"\",\n            \"other_relation\": \"\",\n            \"relative_country_code\": \"+91\",\n            \"relative_phone_number\": \"\",\n            \"other_phone_number\": \"+91\",\n            \"doc_type\": \"Passport\",\n            \"other_doc\": \"\",\n            \"front_doc_url\":  \"<image_url>\",\n            \"back_doc_url\":  \"<image_url>\",\n            \"front_pdf\": true,\n            \"back_pdf\": false,\n            \"single_doc\": false,\n            \"gmap_address_info\": {\n                \"lat\": null,\n                \"lng\": null,\n                \"full_address\": null,\n                \"place_id\": null\n            },\n            \"absence_contact_details\": {\n                \"full_name\": null,\n                \"relation\": null,\n                \"phone_number\": null\n            }\n        },\n        \"current_address\": {\n            \"house_no\": \"Tccycfyyd\",\n            \"colony\": \"Iggihiihi\",\n            \"rented\": \"false\",\n            \"landmark\": \"Uffififiiffiififufuf\",\n            \"pincode\": \"560030\",\n            \"country\": \"India\",\n            \"city\": \"Bengaluru \",\n            \"state\": \"Karnataka\",\n            \"latitude\": \"\",\n            \"longitude\": \"\",\n            \"staying_period\": \"3 years\",\n            \"is_current_permanent_same\": true,\n            \"is_candidate_available\": true,\n            \"other_full_name\": \"\",\n            \"relation\": \"\",\n            \"other_relation\": \"\",\n            \"relative_country_code\": \"+91\",\n            \"relative_phone_number\": \"\",\n            \"other_phone_number\": \"+91\",\n            \"doc_type\": \"Passport\",\n            \"other_doc\": \"\",\n            \"front_doc_url\":  \"<image_url>\",\n            \"back_doc_url\": \"<image_url>\",\n            \"front_pdf\": true,\n            \"back_pdf\": false,\n            \"single_doc\": false,\n            \"gmap_address_info\": {\n                \"lat\": null,\n                \"lng\": null,\n                \"full_address\": null,\n                \"place_id\": null\n            },\n            \"absence_contact_details\": {\n                \"full_name\": null,\n                \"relation\": null,\n                \"phone_number\": null\n            }\n        }\n    },\n    \"consent\": {\n        \"docUrl\": \"www.google.com\"\n    },\n    \"send_candidate_consent_email\": false\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/candidate/information")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .build();
Response response = client.newCall(request).execute();
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/candidate/information"

payload = "{\n    \"candidate_uuid\": \"da67740b-3c7e-4cb3-95df-32555e12304c\",\n    \"basic_details\": {\n        \"full_name\": \"John Doe\",\n        \"employee_id\": \"412\"\n    },\n    \"contact_details\": {\n        \"email\": \"karan.ahuja@springrole.com\",\n        \"alternate_email\": \"john.doe@personal.com\",\n        \"phone_number\": \"+919999999999\",\n        \"alternate_phone_number\": \"+918888888888\",\n        \"whatsapp_update\": false\n    },\n    \"id_check\": [\n        {\n            \"id_type\": \"ind_pan\",\n            \"front_doc_url\": \"<image_url>\",\n            \"back_doc_url\": \"<image_url>\"\n        }\n    ],\n    \"employment_check\": {\n        \"no_of_previous_jobs\": 1,\n        \"data\": [\n            {\n                \"company_name\": \"Testone\",\n                \"employee_id\": \"567888\",\n                \"city\": \"Delhi\",\n                \"country\": \"India\",\n                \"designation\": \"Dev\",\n                \"currently_working\": false,\n                \"reason\": \"Test\",\n                \"duration\": {\n                    \"start_date\": \"2008-04-09\",\n                    \"end_date\": \"2012-06-06\",\n                    \"currently_working\": false\n                },\n                \"doc_type\": \"ExperienceLetter\",\n                \"proof_doc\": [\n                    \"<image_url>\",\n                    \"<image_url>\"\n                ],\n                \"hr_info\": {\n                    \"full_name\": \"Testing\",\n                    \"email\": \"Test@gmail.com\",\n                    \"phone_number\": \"+919658447556\"\n                },\n                \"manager_info\": {\n                    \"full_name\": \"Testone\",\n                    \"email\": \"Test@gmail.com\",\n                    \"phone_number\": \"+918954914334\"\n                }\n            }\n        ]\n    },\n    \"education_check\": [\n        {\n            \"education_level\": \"Professional Course\",\n            \"degree_type\": \"Part Time\",\n            \"university_name\": \"Tedt\",\n            \"registration_number\": \"66445666\",\n            \"degree\": \"Test\",\n            \"areas_of_study\": \"Testtest\",\n            \"dates_attended\": {\n                \"start_date\": \"02/2013\",\n                \"end_date\": \"05/2016\"\n            },\n            \"grade_sheet\": [\"<image_url>\"],\n            \"certificate\":  \"<image_url>\"\n        }\n    ],\n    \"address_check\": {\n        \"permanent_address\": {\n            \"house_no\": \"Tccycfyyd\",\n            \"colony\": \"Iggihiihi\",\n            \"rented\": \"false\",\n            \"landmark\": \"Uffififiiffiififufuf\",\n            \"pincode\": \"560030\",\n            \"country\": \"India\",\n            \"city\": \"Bengaluru \",\n            \"state\": \"Karnataka\",\n            \"latitude\": \"\",\n            \"longitude\": \"\",\n            \"staying_period\": \"3 years\",\n            \"is_current_permanent_same\": true,\n            \"is_candidate_available\": true,\n            \"other_full_name\": \"\",\n            \"relation\": \"\",\n            \"other_relation\": \"\",\n            \"relative_country_code\": \"+91\",\n            \"relative_phone_number\": \"\",\n            \"other_phone_number\": \"+91\",\n            \"doc_type\": \"Passport\",\n            \"other_doc\": \"\",\n            \"front_doc_url\":  \"<image_url>\",\n            \"back_doc_url\":  \"<image_url>\",\n            \"front_pdf\": true,\n            \"back_pdf\": false,\n            \"single_doc\": false,\n            \"gmap_address_info\": {\n                \"lat\": null,\n                \"lng\": null,\n                \"full_address\": null,\n                \"place_id\": null\n            },\n            \"absence_contact_details\": {\n                \"full_name\": null,\n                \"relation\": null,\n                \"phone_number\": null\n            }\n        },\n        \"current_address\": {\n            \"house_no\": \"Tccycfyyd\",\n            \"colony\": \"Iggihiihi\",\n            \"rented\": \"false\",\n            \"landmark\": \"Uffififiiffiififufuf\",\n            \"pincode\": \"560030\",\n            \"country\": \"India\",\n            \"city\": \"Bengaluru \",\n            \"state\": \"Karnataka\",\n            \"latitude\": \"\",\n            \"longitude\": \"\",\n            \"staying_period\": \"3 years\",\n            \"is_current_permanent_same\": true,\n            \"is_candidate_available\": true,\n            \"other_full_name\": \"\",\n            \"relation\": \"\",\n            \"other_relation\": \"\",\n            \"relative_country_code\": \"+91\",\n            \"relative_phone_number\": \"\",\n            \"other_phone_number\": \"+91\",\n            \"doc_type\": \"Passport\",\n            \"other_doc\": \"\",\n            \"front_doc_url\":  \"<image_url>\",\n            \"back_doc_url\": \"<image_url>\",\n            \"front_pdf\": true,\n            \"back_pdf\": false,\n            \"single_doc\": false,\n            \"gmap_address_info\": {\n                \"lat\": null,\n                \"lng\": null,\n                \"full_address\": null,\n                \"place_id\": null\n            },\n            \"absence_contact_details\": {\n                \"full_name\": null,\n                \"relation\": null,\n                \"phone_number\": null\n            }\n        }\n    },\n    \"consent\": {\n        \"docUrl\": \"www.google.com\"\n    },\n    \"send_candidate_consent_email\": false\n}"
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"candidate_uuid":"da67740b-3c7e-4cb3-95df-32555e12304c","basic_details":{"full_name":"John Doe","employee_id":"412"},"contact_details":{"email":"karan.ahuja@springrole.com","alternate_email":"john.doe@personal.com","phone_number":"+919999999999","alternate_phone_number":"+918888888888","whatsapp_update":false},"id_check":[{"id_type":"ind_pan","front_doc_url":"<image_url>","back_doc_url":"<image_url>"}],"employment_check":{"no_of_previous_jobs":1,"data":[{"company_name":"Testone","employee_id":"567888","city":"Delhi","country":"India","designation":"Dev","currently_working":false,"reason":"Test","duration":{"start_date":"2008-04-09","end_date":"2012-06-06","currently_working":false},"doc_type":"ExperienceLetter","proof_doc":["<image_url>","<image_url>"],"hr_info":{"full_name":"Testing","email":"Test@gmail.com","phone_number":"+919658447556"},"manager_info":{"full_name":"Testone","email":"Test@gmail.com","phone_number":"+918954914334"}}]},"education_check":[{"education_level":"Professional Course","degree_type":"Part Time","university_name":"Tedt","registration_number":"66445666","degree":"Test","areas_of_study":"Testtest","dates_attended":{"start_date":"02/2013","end_date":"05/2016"},"grade_sheet":["<image_url>"],"certificate":"<image_url>"}],"address_check":{"permanent_address":{"house_no":"Tccycfyyd","colony":"Iggihiihi","rented":"false","landmark":"Uffififiiffiififufuf","pincode":"560030","country":"India","city":"Bengaluru ","state":"Karnataka","latitude":"","longitude":"","staying_period":"3 years","is_current_permanent_same":true,"is_candidate_available":true,"other_full_name":"","relation":"","other_relation":"","relative_country_code":"+91","relative_phone_number":"","other_phone_number":"+91","doc_type":"Passport","other_doc":"","front_doc_url":"<image_url>","back_doc_url":"<image_url>","front_pdf":true,"back_pdf":false,"single_doc":false,"gmap_address_info":{"lat":null,"lng":null,"full_address":null,"place_id":null},"absence_contact_details":{"full_name":null,"relation":null,"phone_number":null}},"current_address":{"house_no":"Tccycfyyd","colony":"Iggihiihi","rented":"false","landmark":"Uffififiiffiififufuf","pincode":"560030","country":"India","city":"Bengaluru ","state":"Karnataka","latitude":"","longitude":"","staying_period":"3 years","is_current_permanent_same":true,"is_candidate_available":true,"other_full_name":"","relation":"","other_relation":"","relative_country_code":"+91","relative_phone_number":"","other_phone_number":"+91","doc_type":"Passport","other_doc":"","front_doc_url":"<image_url>","back_doc_url":"<image_url>","front_pdf":true,"back_pdf":false,"single_doc":false,"gmap_address_info":{"lat":null,"lng":null,"full_address":null,"place_id":null},"absence_contact_details":{"full_name":null,"relation":null,"phone_number":null}}},"consent":{"docUrl":"www.google.com"},"send_candidate_consent_email":false});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/candidate/information", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/candidate/information")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request.body = "{\n    \"candidate_uuid\": \"da67740b-3c7e-4cb3-95df-32555e12304c\",\n    \"basic_details\": {\n        \"full_name\": \"John Doe\",\n        \"employee_id\": \"412\"\n    },\n    \"contact_details\": {\n        \"email\": \"karan.ahuja@springrole.com\",\n        \"alternate_email\": \"john.doe@personal.com\",\n        \"phone_number\": \"+919999999999\",\n        \"alternate_phone_number\": \"+918888888888\",\n        \"whatsapp_update\": false\n    },\n    \"id_check\": [\n        {\n            \"id_type\": \"ind_pan\",\n            \"front_doc_url\": \"<image_url>\",\n            \"back_doc_url\": \"<image_url>\"\n        }\n    ],\n    \"employment_check\": {\n        \"no_of_previous_jobs\": 1,\n        \"data\": [\n            {\n                \"company_name\": \"Testone\",\n                \"employee_id\": \"567888\",\n                \"city\": \"Delhi\",\n                \"country\": \"India\",\n                \"designation\": \"Dev\",\n                \"currently_working\": false,\n                \"reason\": \"Test\",\n                \"duration\": {\n                    \"start_date\": \"2008-04-09\",\n                    \"end_date\": \"2012-06-06\",\n                    \"currently_working\": false\n                },\n                \"doc_type\": \"ExperienceLetter\",\n                \"proof_doc\": [\n                    \"<image_url>\",\n                    \"<image_url>\"\n                ],\n                \"hr_info\": {\n                    \"full_name\": \"Testing\",\n                    \"email\": \"Test@gmail.com\",\n                    \"phone_number\": \"+919658447556\"\n                },\n                \"manager_info\": {\n                    \"full_name\": \"Testone\",\n                    \"email\": \"Test@gmail.com\",\n                    \"phone_number\": \"+918954914334\"\n                }\n            }\n        ]\n    },\n    \"education_check\": [\n        {\n            \"education_level\": \"Professional Course\",\n            \"degree_type\": \"Part Time\",\n            \"university_name\": \"Tedt\",\n            \"registration_number\": \"66445666\",\n            \"degree\": \"Test\",\n            \"areas_of_study\": \"Testtest\",\n            \"dates_attended\": {\n                \"start_date\": \"02/2013\",\n                \"end_date\": \"05/2016\"\n            },\n            \"grade_sheet\": [\"<image_url>\"],\n            \"certificate\":  \"<image_url>\"\n        }\n    ],\n    \"address_check\": {\n        \"permanent_address\": {\n            \"house_no\": \"Tccycfyyd\",\n            \"colony\": \"Iggihiihi\",\n            \"rented\": \"false\",\n            \"landmark\": \"Uffififiiffiififufuf\",\n            \"pincode\": \"560030\",\n            \"country\": \"India\",\n            \"city\": \"Bengaluru \",\n            \"state\": \"Karnataka\",\n            \"latitude\": \"\",\n            \"longitude\": \"\",\n            \"staying_period\": \"3 years\",\n            \"is_current_permanent_same\": true,\n            \"is_candidate_available\": true,\n            \"other_full_name\": \"\",\n            \"relation\": \"\",\n            \"other_relation\": \"\",\n            \"relative_country_code\": \"+91\",\n            \"relative_phone_number\": \"\",\n            \"other_phone_number\": \"+91\",\n            \"doc_type\": \"Passport\",\n            \"other_doc\": \"\",\n            \"front_doc_url\":  \"<image_url>\",\n            \"back_doc_url\":  \"<image_url>\",\n            \"front_pdf\": true,\n            \"back_pdf\": false,\n            \"single_doc\": false,\n            \"gmap_address_info\": {\n                \"lat\": null,\n                \"lng\": null,\n                \"full_address\": null,\n                \"place_id\": null\n            },\n            \"absence_contact_details\": {\n                \"full_name\": null,\n                \"relation\": null,\n                \"phone_number\": null\n            }\n        },\n        \"current_address\": {\n            \"house_no\": \"Tccycfyyd\",\n            \"colony\": \"Iggihiihi\",\n            \"rented\": \"false\",\n            \"landmark\": \"Uffififiiffiififufuf\",\n            \"pincode\": \"560030\",\n            \"country\": \"India\",\n            \"city\": \"Bengaluru \",\n            \"state\": \"Karnataka\",\n            \"latitude\": \"\",\n            \"longitude\": \"\",\n            \"staying_period\": \"3 years\",\n            \"is_current_permanent_same\": true,\n            \"is_candidate_available\": true,\n            \"other_full_name\": \"\",\n            \"relation\": \"\",\n            \"other_relation\": \"\",\n            \"relative_country_code\": \"+91\",\n            \"relative_phone_number\": \"\",\n            \"other_phone_number\": \"+91\",\n            \"doc_type\": \"Passport\",\n            \"other_doc\": \"\",\n            \"front_doc_url\":  \"<image_url>\",\n            \"back_doc_url\": \"<image_url>\",\n            \"front_pdf\": true,\n            \"back_pdf\": false,\n            \"single_doc\": false,\n            \"gmap_address_info\": {\n                \"lat\": null,\n                \"lng\": null,\n                \"full_address\": null,\n                \"place_id\": null\n            },\n            \"absence_contact_details\": {\n                \"full_name\": null,\n                \"relation\": null,\n                \"phone_number\": null\n            }\n        }\n    },\n    \"consent\": {\n        \"docUrl\": \"www.google.com\"\n    },\n    \"send_candidate_consent_email\": false\n}"

response = https.request(request)
puts response.read_body
```



POST API to provide all the relevant information of the candidate for verification. Recommended, if you want to send bulk data programmatically or directly integrate this API in your product.

Alternatively, you can use [Get Background Verification URL](https://docs-bgv.springverify.com/#get-background-verification-url) to generate a form URL for the candidate. 

<aside type="notice">
Auth Token of company login is needed in headers
</aside>

Mandatory fields:

1. candidate_uuid (from add or get candidate API)
2. basic_details.full_name
3. contact_details.email (if consent has to be sent on candidate's email)

all other fields are non-mandatory. Its advisable to send as much information as possible , with at least the document links for a successful verification.

- For types of <b>Employment</b> fields click [here](https://docs-bgv.springverify.com/#add-employment)
- For types of <b>Education</b> fields click [here](https://docs-bgv.springverify.com/#add-education)
- For types of <b>ID</b> fields click [here](https://docs-bgv.springverify.com/#identity-verification)
- For types of <b>Address</b> fields click [here](https://docs-bgv.springverify.com/#add-address)

<aside type="success">
<b>send_candidate_consent_email</b> field is used to send e-mail to candidate for consent on background verification, in case a consent url is not provided
while adding the candidate or in consent.doc_url. You should send send_candidate_consent_email as TRUE in such scenario.
</aside>

<aside type="notice">
Please make sure to send at-least the doc URLs for a successful verification process
</aside>


# Get Background Verification URL

```shell
curl --location --request GET 'https://api-dev.in.springverify.com/v1/candidate/backgroundVerificationUrl' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ2MzU2MjIsImV4cCI6MTU5ODIzNTYyMn0.tYKb4l911veWQ0JW2sONfkU-aflfLgtDL0P0Ff79PHw' \
--header 'Content-Type: application/json' \
--data-raw '{
    "candidateId": <Integer ID>
}'
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/candidate/backgroundVerificationUrl")
  .method("GET", null)
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ2MzU2MjIsImV4cCI6MTU5ODIzNTYyMn0.tYKb4l911veWQ0JW2sONfkU-aflfLgtDL0P0Ff79PHw")
  .addHeader("Content-Type", "application/json")
  .build();
Response response = client.newCall(request).execute();
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/candidate/backgroundVerificationUrl"

payload = "{\n    \"candidateId\": 958\n}"
headers = {
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ2MzU2MjIsImV4cCI6MTU5ODIzNTYyMn0.tYKb4l911veWQ0JW2sONfkU-aflfLgtDL0P0Ff79PHw',
  'Content-Type': 'application/json'
}

response = requests.request("GET", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ2MzU2MjIsImV4cCI6MTU5ODIzNTYyMn0.tYKb4l911veWQ0JW2sONfkU-aflfLgtDL0P0Ff79PHw");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({"candidateId":958});

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/candidate/backgroundVerificationUrl", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/candidate/backgroundVerificationUrl")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ2MzU2MjIsImV4cCI6MTU5ODIzNTYyMn0.tYKb4l911veWQ0JW2sONfkU-aflfLgtDL0P0Ff79PHw"
request["Content-Type"] = "application/json"
request.body = "{\n    \"candidateId\": 958\n}"

response = https.request(request)
puts response.read_body
```

>Response looks like this

```json
{
    "link": "https://dev-portal.in.springverify.com/candidate/bgv?token=<Auth_Token>",
    "status": 200
}
```

GET  Background Verification (BGV) form's url. Candidate or HR can fill and submit this form for starting a verification of the candidate's information. 

We will do the verification and update statuses for the same via dashboard and email.

<aside class="success">
   Use the Company's (Login) token to generate BGV URL. 
</aside>

<aside class="notice">
  API is useful if you would like to generate a <b>UI form</b> on the fly, to be filled by HR or by the candidate.
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

1. Driving License (ind_driving_license)
2. Passport (ind_passport)
3. Voter ID (ind_voter_id)
4. PAN (ind_pan)

# Add Employment
```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/documents/employment' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM' \
--data-raw '{
    "employments" : [
        {
            "document_type": "ExperienceLetter",
			"companyName": "ABC",
            "designation": "1",
            "currentlyHere": "true",
            "startDate": "25/11/19",
            "employee_id": "cxz102",
            "location": "New Delhi",
            "country": "India",
            "employmentLinks" : [
                "https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"
            ],
            "verifications" : [
                {
                    "type": "HR",
                    "number": "+91829102833"
                },
                {
                    "type": "REPORTINGMANAGER",
                    "email": "reporting@manager.com"
                }
            ]
        }
    ]
}'
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM");

var raw = JSON.stringify({"employments":[{"document_type":"ExperienceLetter","companyName":"ABC","designation":"1","currentlyHere":"true","startDate":"25/11/19","employee_id":"cxz102","location":"New Delhi","country":"India","employmentLinks":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"],"verifications":[{"type":"HR","number":"+91829102833"},{"type":"REPORTINGMANAGER","email":"reporting@manager.com"}]}]});

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
RequestBody body = RequestBody.create(mediaType, "{\n    \"employments\" : [\n        {\n            \"document_type\": \"ExperienceLetter\",\n\t\t\t\"companyName\": \"ABC\",\n            \"designation\": \"1\",\n            \"currentlyHere\": \"true\",\n            \"startDate\": \"25/11/19\",\n            \"employee_id\": \"cxz102\",\n            \"location\": \"New Delhi\",\n            \"country\": \"India\",\n            \"employmentLinks\" : [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ],\n            \"verifications\" : [\n                {\n                    \"type\": \"HR\",\n                    \"number\": \"+91829102833\"\n                },\n                {\n                    \"type\": \"REPORTINGMANAGER\",\n                    \"email\": \"reporting@manager.com\"\n                }\n            ]\n        }\n    ]\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/documents/employment")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM")
  .build();
Response response = client.newCall(request).execute();
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/documents/employment"

payload = "{\n    \"employments\" : [\n        {\n            \"document_type\": \"ExperienceLetter\",\n\t\t\t\"companyName\": \"ABC\",\n            \"designation\": \"1\",\n            \"currentlyHere\": \"true\",\n            \"startDate\": \"25/11/19\",\n            \"employee_id\": \"cxz102\",\n            \"location\": \"New Delhi\",\n            \"country\": \"India\",\n            \"employmentLinks\" : [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ],\n            \"verifications\" : [\n                {\n                    \"type\": \"HR\",\n                    \"number\": \"+91829102833\"\n                },\n                {\n                    \"type\": \"REPORTINGMANAGER\",\n                    \"email\": \"reporting@manager.com\"\n                }\n            ]\n        }\n    ]\n}"
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM'
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
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM"
request.body = "{\n    \"employments\" : [\n        {\n            \"document_type\": \"ExperienceLetter\",\n\t\t\t\"companyName\": \"ABC\",\n            \"designation\": \"1\",\n            \"currentlyHere\": \"true\",\n            \"startDate\": \"25/11/19\",\n            \"employee_id\": \"cxz102\",\n            \"location\": \"New Delhi\",\n            \"country\": \"India\",\n            \"employmentLinks\" : [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ],\n            \"verifications\" : [\n                {\n                    \"type\": \"HR\",\n                    \"number\": \"+91829102833\"\n                },\n                {\n                    \"type\": \"REPORTINGMANAGER\",\n                    \"email\": \"reporting@manager.com\"\n                }\n            ]\n        }\n    ]\n}"

response = https.request(request)
puts response.read_body
```

>Response looks like this

```json
{
    "message": "Employment saved",
    "response": [
        "1d20-21f1-13cd-13df"
    ] //uuids
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

<aside class="notice">
  For verification purposes, at least the <b>employmentLinks</b> to document should be sent in the API.
</aside>

# Add Education

```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/documents/education' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM' \
--data-raw '{
    "education": {
        "10": {
            "course_type": "10th",
            "institute_name": "tomorrow highland'\''s school",
            "registration_number": "123xyz",
            "start_date": "24/08/1991",
            "issue_date": "1992",
            "links": [
              <urls>
            ]
        },
        "12": {
            "course_type": "10th",
            "institute_name": "tomorrow highland'\''s school",
            "registration_number": "123xyz",
            "start_date": "24/08/1992",
            "issue_date": "1993",
            "links": [
              <urls>
            ]
        },
        "bachelor": {
            "course_type": "bachelor",
            "institute_name": "tomorrow highland'\''s college",
            "registration_number": "123xyz",
            "start_date": "24/08/1993",
            "issue_date": "1995",
            "degree": "UG",
            "links": [
                <urls>
            ]
        },
        "masters": {
            "course_type": "masters",
            "institute_name": "tomorrow highland'\''s college",
            "registration_number": "123xyz",
            "start_date": "24/08/1995",
            "issue_date": "1997",
            "links": [
              <urls>
            ]
        },
        "doctorate": {
            "course_type": "doctorate",
            "institute_name": "tomorrow highland'\''s college",
            "registration_number": "123xyz",
            "start_date": "24/08/1998",
            "issue_date": "1999",
            "links": [
              <urls>
            ]
        }
    }
}'
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n    \"education\": {\n        \"10\": {\n            \"course_type\": \"10th\",\n            \"institute_name\": \"tomorrow highland's school\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1991\",\n            \"issue_date\": \"1992\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        },\n        \"12\": {\n            \"course_type\": \"10th\",\n            \"institute_name\": \"tomorrow highland's school\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1992\",\n            \"issue_date\": \"1993\",\n            \"links\": []\n        },\n        \"bachelor\": {\n            \"course_type\": \"bachelor\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1993\",\n            \"issue_date\": \"1995\",\n            \"degree\": \"UG\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        },\n        \"masters\": {\n            \"course_type\": \"masters\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1995\",\n            \"issue_date\": \"1997\",\n            \"links\": [\n                \"https://thumbor.forbes.com/thumbor/711x426/https://specials-images.forbesimg.com/dam/imageserve/673357300/960x0.jpg?fit=scale\"\n            ]\n        },\n        \"doctorate\": {\n            \"course_type\": \"doctorate\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1998\",\n            \"issue_date\": \"1999\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        }\n    }\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/documents/education")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM")
  .build();
Response response = client.newCall(request).execute();
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM");

var raw = JSON.stringify({"education":{"10":{"course_type":"10th","institute_name":"tomorrow highland's school","registration_number":"123xyz","start_date":"24/08/1991","issue_date":"1992","links":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"]},"12":{"course_type":"10th","institute_name":"tomorrow highland's school","registration_number":"123xyz","start_date":"24/08/1992","issue_date":"1993","links":[]},"bachelor":{"course_type":"bachelor","institute_name":"tomorrow highland's college","registration_number":"123xyz","start_date":"24/08/1993","issue_date":"1995","degree":"UG","links":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"]},"masters":{"course_type":"masters","institute_name":"tomorrow highland's college","registration_number":"123xyz","start_date":"24/08/1995","issue_date":"1997","links":["https://thumbor.forbes.com/thumbor/711x426/https://specials-images.forbesimg.com/dam/imageserve/673357300/960x0.jpg?fit=scale"]},"doctorate":{"course_type":"doctorate","institute_name":"tomorrow highland's college","registration_number":"123xyz","start_date":"24/08/1998","issue_date":"1999","links":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front","https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"]}}});

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
import http.client
import mimetypes
conn = http.client.HTTPSConnection("api-dev.in.springverify.com")
payload = "{\n    \"education\": {\n        \"10\": {\n            \"course_type\": \"10th\",\n            \"institute_name\": \"tomorrow highland's school\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1991\",\n            \"issue_date\": \"1992\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        },\n        \"12\": {\n            \"course_type\": \"10th\",\n            \"institute_name\": \"tomorrow highland's school\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1992\",\n            \"issue_date\": \"1993\",\n            \"links\": []\n        },\n        \"bachelor\": {\n            \"course_type\": \"bachelor\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1993\",\n            \"issue_date\": \"1995\",\n            \"degree\": \"UG\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        },\n        \"masters\": {\n            \"course_type\": \"masters\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1995\",\n            \"issue_date\": \"1997\",\n            \"links\": [\n                \"https://thumbor.forbes.com/thumbor/711x426/https://specials-images.forbesimg.com/dam/imageserve/673357300/960x0.jpg?fit=scale\"\n            ]\n        },\n        \"doctorate\": {\n            \"course_type\": \"doctorate\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1998\",\n            \"issue_date\": \"1999\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        }\n    }\n}"
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM'
}
conn.request("POST", "/v1/documents/education", payload, headers)
res = conn.getresponse()
data = res.read()
print(data.decode("utf-8"))
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/documents/education")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM"
request.body = "{\n    \"education\": {\n        \"10\": {\n            \"course_type\": \"10th\",\n            \"institute_name\": \"tomorrow highland's school\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1991\",\n            \"issue_date\": \"1992\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        },\n        \"12\": {\n            \"course_type\": \"10th\",\n            \"institute_name\": \"tomorrow highland's school\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1992\",\n            \"issue_date\": \"1993\",\n            \"links\": []\n        },\n        \"bachelor\": {\n            \"course_type\": \"bachelor\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1993\",\n            \"issue_date\": \"1995\",\n            \"degree\": \"UG\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        },\n        \"masters\": {\n            \"course_type\": \"masters\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1995\",\n            \"issue_date\": \"1997\",\n            \"links\": [\n                \"https://thumbor.forbes.com/thumbor/711x426/https://specials-images.forbesimg.com/dam/imageserve/673357300/960x0.jpg?fit=scale\"\n            ]\n        },\n        \"doctorate\": {\n            \"course_type\": \"doctorate\",\n            \"institute_name\": \"tomorrow highland's college\",\n            \"registration_number\": \"123xyz\",\n            \"start_date\": \"24/08/1998\",\n            \"issue_date\": \"1999\",\n            \"links\": [\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\",\n                \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n            ]\n        }\n    }\n}"

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

# Add Address

```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/documents/address' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM' \
--data-raw '{
    "isPermanent" : false,
    "addressLinks": [
        "https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"
    ],
    "docType": "Driving License",
    "is_current_permanent_same": true,
    "currently_reside": "YES",
    "address_type": "Own / Parents",
    "landmark": "Temple",
    "zipcode": "560095",
    "country": "India",
    "length_of_stay": "10 years",
    "city": "Bengaluru",
    "state": "Karnataka",
    "is_candidate_available": true,
    "point_of_contact" :{
        "number":"+91892001010",
        "type": "FRIEND"
    }
}'
```

```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\n    \"isPermanent\" : false,\n    \"addressLinks\": [\n        \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n    ],\n    \"docType\": \"Driving License\",\n    \"is_current_permanent_same\": true,\n    \"currently_reside\": \"YES\",\n    \"address_type\": \"Own / Parents\",\n    \"landmark\": \"Temple\",\n    \"zipcode\": \"560095\",\n    \"country\": \"India\",\n    \"length_of_stay\": \"10 years\",\n    \"city\": \"Bengaluru\",\n    \"state\": \"Karnataka\",\n    \"is_candidate_available\": true,\n    \"point_of_contact\" :{\n        \"number\":\"+91892001010\",\n        \"type\": \"FRIEND\"\n    }\n}");
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/documents/address")
  .method("POST", body)
  .addHeader("Content-Type", "application/json")
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM")
  .build();
Response response = client.newCall(request).execute();
```

```python
import requests

url = "https://api-dev.in.springverify.com/v1/documents/address"

payload = "{\n    \"isPermanent\" : false,\n    \"addressLinks\": [\n        \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n    ],\n    \"docType\": \"Driving License\",\n    \"is_current_permanent_same\": true,\n    \"currently_reside\": \"YES\",\n    \"address_type\": \"Own / Parents\",\n    \"landmark\": \"Temple\",\n    \"zipcode\": \"560095\",\n    \"country\": \"India\",\n    \"length_of_stay\": \"10 years\",\n    \"city\": \"Bengaluru\",\n    \"state\": \"Karnataka\",\n    \"is_candidate_available\": true,\n    \"point_of_contact\" :{\n        \"number\":\"+91892001010\",\n        \"type\": \"FRIEND\"\n    }\n}"
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM'
}

response = requests.request("POST", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```

```javascript
var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM");

var raw = JSON.stringify({"isPermanent":false,"addressLinks":["https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front"],"docType":"Driving License","is_current_permanent_same":true,"currently_reside":"YES","address_type":"Own / Parents","landmark":"Temple","zipcode":"560095","country":"India","length_of_stay":"10 years","city":"Bengaluru","state":"Karnataka","is_candidate_available":true,"point_of_contact":{"number":"+91892001010","type":"FRIEND"}});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://api-dev.in.springverify.com/v1/documents/address", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));
```

```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/documents/address")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNhbmRpZGF0ZUlkIjo5NzksImNvbXBhbnlJZCI6Miwicm9sZSI6ImNhbmRpZGF0ZSIsImVtYWlsIjpudWxsLCJjb21wYW55TmFtZSI6bnVsbCwiY29tcGFueUxvZ29VcmwiOm51bGwsImFjY2Vzc0xldmVsIjpudWxsLCJ1c2VySWQiOm51bGwsImZvcm1GaWxsZWRCeSI6bnVsbH0sImlhdCI6MTU5NDg5MDI1MX0.olJF36gE50i5-iAmtjNCGyMPJZQ5xjOWOWVusMTuKCM"
request.body = "{\n    \"isPermanent\" : false,\n    \"addressLinks\": [\n        \"https://springverify-assets-id.s3.amazonaws.com/323/ind_driving_license-front\"\n    ],\n    \"docType\": \"Driving License\",\n    \"is_current_permanent_same\": true,\n    \"currently_reside\": \"YES\",\n    \"address_type\": \"Own / Parents\",\n    \"landmark\": \"Temple\",\n    \"zipcode\": \"560095\",\n    \"country\": \"India\",\n    \"length_of_stay\": \"10 years\",\n    \"city\": \"Bengaluru\",\n    \"state\": \"Karnataka\",\n    \"is_candidate_available\": true,\n    \"point_of_contact\" :{\n        \"number\":\"+91892001010\",\n        \"type\": \"FRIEND\"\n    }\n}"

response = https.request(request)
puts response.read_body
```

>Response looks like

```json
{
    "message": "Address saved",
    "uuid": [
        "457b4cce-f5a8-494e-901e-42959b74395e"
    ]
}
```

API to upload candidate's address information for verification.

<aside class="notice">
  For verification purposes, at least the <b>addressLinks</b> to document should be sent in the API.
</aside>

Point of contact type can be:

1. FRIEND
2. FATHER
3. MOTHER
4. TENANT
5. FAMILY
6. CANDIDATE

Address Type can be:

1. Own / Parents
2. Rented

<aside class="notice">
  Company/Candidate can leverage is_candidate_available to set availability of the candidate at home between <b>9am - 5pm</b>
</aside>

# Get Candidate

```shell
curl --location --request POST 'https://api-dev.in.springverify.com/v1/candidate/fetch' \
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

# Get All Candidates

```shell
curl --location --request GET 'https://api-dev.in.springverify.com/v1/candidate/candidates?limit=20&page=2' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ5ODQ2OTcsImV4cCI6MTU5ODU4NDY5N30.eGrdMRasVlpp1xwcVTuiGfwDCujty22ULUxRynmeal0'
```
```java
OkHttpClient client = new OkHttpClient().newBuilder()
  .build();
Request request = new Request.Builder()
  .url("https://api-dev.in.springverify.com/v1/candidate/candidates?limit=20&page=2")
  .method("GET", null)
  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ5ODQ2OTcsImV4cCI6MTU5ODU4NDY5N30.eGrdMRasVlpp1xwcVTuiGfwDCujty22ULUxRynmeal0")
  .build();
Response response = client.newCall(request).execute();
```
```javascript
var settings = {
  "url": "https://api-dev.in.springverify.com/v1/candidate/candidates?limit=20&page=2",
  "method": "GET",
  "timeout": 0,
  "headers": {
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ5ODQ2OTcsImV4cCI6MTU5ODU4NDY5N30.eGrdMRasVlpp1xwcVTuiGfwDCujty22ULUxRynmeal0"
  },
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```
```python
import requests

url = "https://api-dev.in.springverify.com/v1/candidate/candidates?limit=20&page=2"

payload = {}
headers = {
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ5ODQ2OTcsImV4cCI6MTU5ODU4NDY5N30.eGrdMRasVlpp1xwcVTuiGfwDCujty22ULUxRynmeal0'
}

response = requests.request("GET", url, headers=headers, data = payload)

print(response.text.encode('utf8'))
```
```ruby
require "uri"
require "net/http"

url = URI("https://api-dev.in.springverify.com/v1/candidate/candidates?limit=20&page=2")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ5ODQ2OTcsImV4cCI6MTU5ODU4NDY5N30.eGrdMRasVlpp1xwcVTuiGfwDCujty22ULUxRynmeal0"

response = https.request(request)
puts response.read_body
```

API to fetch all candidates uploaded by the Company, in a sorted fashion. Sorting is based on action taken on candidate

<aside type="notice">
limit and page are optional. If not provided, either, default values are limit 10 and page 0
</aside>


>Response looks like

```json
[
  {
        "id": 931,
        "uuid": "bbbe9c76-7835-4fc2-8cde-ae7e8b6aefb6",
        "company_id": 2,
        "candidate_id": 934,
        "employee_id": "kagifo",
        "phone_number": "+919956004345",
        "country_code": "IN",
        "alt_phone_number": null,
        "alt_country_code": "IN",
        "resume": "https://springverify-assets-id.s3.amazonaws.com/934/resume",
        "category_id": null,
        "created_at": "2020-07-02T08:18:02.000Z",
        "updated_at": "2020-07-02T09:44:19.000Z",
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
        "status": 4,
        "signedrequest_status": 1,
        "springverify_signature": null,
        "consent_letter_url": "https://springverify-assets-id.s3.amazonaws.com/934/consent-letter.pdf",
        "consent_added_at": "2020-07-02T09:44:19.000Z",
        "spring_candidate_ip": null,
        "form_filled": "2020-07-02T09:44:19.000Z",
        "candidate_added_by": 2,
        "form_filled_by": 3,
        "consent_added_by": 3,
        "who_fills_form": 3,
        "past_jobs": null,
        "springscan_id": "5efd98808f0166001a1df693",
        "candidate": {
            "id": 934,
            "uuid": "7dd5d7a8-3ac9-42df-a6e3-e23897d1354e",
            "email": "kagifo7064@enmail1.com",
            "alternate_email": null,
            "name": "kagifo",
            "type": null,
            "created_at": "2020-07-02T08:18:02.000Z",
            "updated_at": "2020-07-02T09:44:19.000Z",
            "ongrid_id": null,
            "gender": 1,
            "deleted_at": null,
            "dob": null,
            "father_name": null,
            "email_reject_type": "NA",
            "user_id": 2,
            "whatsapp_update": true,
            "bgv_slack_notification_shared": false,
            "candidate_user_category_mappings": [],
            "candidate_company_category_mappings": [],
            "candidates_metadata": []
        }
    },
    ...
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

