---

title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ - shell - ruby - python - javascript - java

toc_footers: - <a href='mailto:info@springverify.com'>Email us for access</a>

includes: - errors

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

var raw = JSON.stringify({
  email: "jackhym23@gmail.com",
  password: "999999999",
});

var requestOptions = {
  method: "POST",
  headers: myHeaders,
  body: raw,
  redirect: "follow",
};

fetch("https://api-dev.in.springverify.com/v1/auth/login", requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.log("error", error));
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
        "uan_number": "XXXXX",
        "phone" : "+91XXXXX",
        "employeeId": "xxx",
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
    consentUrl is required from the clients side and image/pdf document containing the consent of the candidate.
  </aside>

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
        "employee_id": "412",
        "uan_number": "xx-xx-xx",
        "employee_id": "xx"
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
            preferred_verification_method: "Physical",
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
        "doc_url": "www.google.com"
    },
    "send_candidate_consent_email": false
}'
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

> Response looks like this

```json
{
  "link": "https://dev-portal.in.springverify.com/candidate/bgv?token=<Auth_Token>",
  "status": 200
}
```

GET Background Verification (BGV) form's url. Candidate or HR can fill and submit this form for starting a verification of the candidate's information.

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

> Response looks like this

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

> Response looks like this

```json
{
  "message": "Employment saved",
  "response": ["1d20-21f1-13cd-13df"] //uuids
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

> example response

```json
{
  "message": "Education data saved",
  "listOfUploadedDocs": ["10", "masters", "doctorate"],
  "listOfNotUploadedDocs": ["bachelor"],
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
    "preferred_verification_method: "Physical",
    "city": "Bengaluru",
    "state": "Karnataka",
    "is_candidate_available": true,
    "point_of_contact" :{
        "number":"+91892001010",
        "type": "FRIEND"
    }
}'
```

> Response looks like

```json
{
  "message": "Address saved",
  "uuid": ["457b4cce-f5a8-494e-901e-42959b74395e"]
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

<b>Preferred Verification Method</b>

The key preferred_verification_method can be used (optional) to indicate what method of verification is preferred. Values are:

1. PHYSICAL
2. POSTAL
3. DIGITAL

If not provided, we will decide on the verification method.

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

This API is used to get candidates in bulk. You can provide multiple candidates in array.

  <aside type="notice">
    Use the token which was returned from add candidate API.
  </aside>

### Status mapping for Candidate (overall) level Verification

| Integer | Status             | API ENUM          |
| ------- | ------------------ | ----------------- |
| 0       | In Progress        | inProgress        |
| 1       | Verified           | verified          |
| 2       | Candidate Added    | candidateAdded    |
| 3       | Awaiting Input     | awaitingInput     |
| 4       | Processing         | processing        |
| 5       | Discrepancy        | discrepancy       |
| 6       | Unable To Verify   | unableToVerify    |
| 7       | Insufficient info  | inSufficiency     |
| 8       | Closed             | closed            |
| 9       | On Hold            | onHold            |
| 10      | Cancelled          | cancelled         |
| 11      | Consent Missing    | consentMissing    |
| 12      | Insufficient Funds | insufficientFunds |

### Status mapping for Check (id, employment etc) level Verification

| Integer | Status                     | API ENUM         |
| ------- | -------------------------- | ---------------- |
| -2      | Completed with Discrepancy | discrepancy      |
| -1      | Insufficiency              | insufficiency    |
| 0       | In progress                | processing       |
| 1       | Completed                  | unable_to_verify |
| 2       | Unable To Verify           | verified         |
| 3       | Awaiting Input             | awaiting_input   |
| 4       | In Progress                | in_progress      |
| 5       | On Hold                    | on_hold          |
| 6       | Closed                     | closed           |
| 6       | Not Applicable             | not_applicable   |
| 8       | Cancelled                  | cancelled        |
| 9       | Form submitted             | form_submitted   |
| 10      | Verified Auto              | verified_auto    |

> Example Response (with all possible fields)

```json
[
  {
    "id": 1038,
    "uuid": "d1379de6-10fb-4e18-abad-abdf6f44a12d",
    "email": "cemepa7794@academail.net",
    "alternate_email": null,
    "name": "yisoyip",
    "type": null,
    "created_at": "2020-08-17T07:58:39.000Z",
    "updated_at": "2020-08-19T05:13:29.000Z",
    "ongrid_id": null,
    "gender": 2,
    "deleted_at": null,
    "dob": null,
    "father_name": null,
    "email_reject_type": "NA",
    "user_id": 2,
    "whatsapp_update": false,
    "bgv_slack_notification_shared": false,
    "company_candidate_mapping": {
      "id": 1035,
      "uuid": "24729b97-46e3-4786-8f04-42f14d8a60cc",
      "company_id": 2,
      "candidate_id": 1038,
      "employee_id": "76767867",
      "phone_number": "+918976353535",
      "country_code": "IN",
      "alt_phone_number": "+918973635352",
      "alt_country_code": "IN",
      "resume": "",
      "category_id": null,
      "candidate_ids": "564",
      "work_experience": null,
      "education": "551",
      "address": "571",
      "history": null,
      "refcheck": null,
      "worldcheck": null,
      "creditcheck": null,
      "drugscheck": null,
      "typeform_url": null,
      "signrequest_url": null,
      "status": "verified",
      "signedrequest_status": 1,
      "springverify_signature": null,
      "consent_letter_url": null,
      "consent_added_at": null,
      "spring_candidate_ip": null,
      "form_filled": null,
      "candidate_added_by": 2,
      "form_filled_by": null,
      "consent_added_by": null,
      "who_fills_form": 2,
      "past_jobs": null,
      "springscan_id": "5f3a3c04eb6b480014a6b65e",
      "uan_number": null,
      "candidate_form": {
        "id": 1058,
        "uuid": "36f37423-03fc-4e97-a84e-ce4a97c56759",
        "row_id": 1035,
        "check_type": "1,7,8,6",
        "status": 0,
        "selected_identity_type": 1
      }
    },
    "user": {
      "id": 2,
      "uuid": "dde7c7ff-1d81-45a9-9e24-e8ad2077d4f1",
      "name": "Jack",
      "username": null,
      "email": "jackhym23@gmail.com",
      "access_level": 5,
      "mobile": "",
      "status": 1,
      "auth_key": null,
      "password_reset_token": null,
      "customer_id": "cust_Dq8sAd6hp3KLxu",
      "email_reject_type": "NA",
      "designation": "super admin"
    },
    "candidate_company_category_mappings": [],
    "candidate_user_category_mapping": null,
    "candidates_metadata": [
      {
        "id": 789,
        "uuid": "1ba00f04-5195-4e17-a4a0-dcb80a178d2e",
        "candidate_id": "d1379de6-10fb-4e18-abad-abdf6f44a12d",
        "type": "PHONENUMBER",
        "belongs_to": "CANDIDATE",
        "data": "+918973635352"
      }
    ],
    "candidates_addresses": [
      {
        "id": 571,
        "uuid": "97b0fdab-9340-43ae-8277-5e1c45e8795b",
        "candidate_id": 1038,
        "address_candidate_name": "yisoyip",
        "provider_request_id": null,
        "provider_postal_request_id": null,
        "idfy_request_id": null,
        "provider_type": null,
        "order_number": null,
        "sv_postal_id": null,
        "address_id": null,
        "type": "Permanent Address",
        "data": "",
        "status": "unable_to_verify",
        "qc_check_log_id": "5fd1bd58b6e0bf0012445724",
        "created_at": "2020-08-18T14:57:42.000Z",
        "requested_at": "2020-08-25",
        "completed_at": "2020-12-10",
        "address_1": "sdfdsgrehe",
        "address_2": "",
        "city": "tryretetre",
        "state": "vccxvxvx",
        "zipcode": 123456,
        "country": "India",
        "landmark": "",
        "reports": "{\"address_candidate_name\":\"sfdfsdfs\",\"address_candidate_name_status\":\"-2\",\"address\":\"sfsdfsd\",\"address_status\":\"1\",\"city\":null,\"city_status\":\"0\",\"state\":null,\"state_status\":\"0\",\"zipcode\":null,\"zipcode_status\":\"0\",\"ownership_status\":null,\"ownership_status_status\":\"0\",\"staying_since\":null,\"staying_since_status\":\"0\",\"address_type\":null,\"address_type_status\":\"0\",\"geo_point\":{\"latitude\":null,\"longitude\":null},\"verification_type\":\"PHYSICAL\",\"respondent\":[{\"respondent_name\":null,\"respondent_relationship\":null,\"respondent_email\":null,\"respondent_phone\":null}],\"result\":\"\",\"postal\":{}}",
        "document_type": "Driving Licence",
        "is_candidate_available": 1,
        "relation_name": null,
        "address_information": "{}",
        "gmap_address_info": null,
        "ops_status_uuid": "c19f2cb3-d82d-4951-854c-52a80ef28e80",
        "is_file_migrated": 0,
        "address_type": null,
        "currently_reside": null,
        "length_of_stay": null,
        "is_current_permanent_same": null,
        "preferred_verification_method": "PHYSICAL",
        "files": [
          {
            "id": 3739,
            "uuid": "8f83e2f0-155b-46dd-94bf-8d5b048d0cc4",
            "related_uuid": "97b0fdab-9340-43ae-8277-5e1c45e8795b",
            "document_url": "https://springverify-assets-id.s3.amazonaws.com/yisoyip-1598447176025-1038-Driving-Licence.pdf",
            "is_default": 0,
            "is_verified": 0,
            "show_in_report": 1,
            "relation_id": null,
            "active": null
          }
        ]
      }
    ],
    "candidates_ids": [
      {
        "id": 564,
        "uuid": "725be610-c196-46fb-b278-99e4f4d21b75",
        "candidate_id": 1038,
        "type_old": null,
        "type": 2,
        "identity_candidate_name": "yisoyip",
        "data": "{\"files\":[\"https://springverify-assets-id.s3.amazonaws.com/yisoyip-identity-info-1598342165435-1038-Pan.jpg\"]}",
        "parsed_data": null,
        "status": "verified",
        "qc_check_log_id": "5fd1bd2fb6e0bf0012445720",
        "created_at": "2020-08-25T13:26:05.000Z",
        "ongrid_document_id": null,
        "ongrid_request_id": null,
        "identity_number": "FGSPS5178C",
        "ongrid_reports": null,
        "father_name": "SREENATH",
        "dob": "1990-07-10",
        "completed_at": "2020-12-10T00:00:00.000Z",
        "comments": "",
        "report": "{\"identity_name\":\"\",\"identity_name_status\":\"0\",\"identity_number\":\"\",\"identity_number_status\":\"0\",\"father_name\":\"\",\"father_name_status\":\"0\",\"dob\":\"\",\"dob_status\":\"0\"}",
        "requested_at": "2020-12-10T00:00:00.000Z",
        "added_to_report_at": null,
        "ops_status_uuid": "909d94f8-0872-49db-a47e-076615c0baeb",
        "isGovernmentVerificationSuccess": -1,
        "isIdVerified": -1,
        "isFrontNotShared": -1,
        "is_migrated": 0,
        "files": [
          {
            "id": 3714,
            "uuid": "16266f10-f7c2-4702-b553-14e837412817",
            "related_uuid": "725be610-c196-46fb-b278-99e4f4d21b75",
            "document_url": "https://springverify-assets-id.s3.amazonaws.com/yisoyip-identity-info-1598342165435-1038-Pan.jpg",
            "is_default": 1,
            "is_verified": 0,
            "show_in_report": 1,
            "relation_id": null,
            "active": null
          }
        ]
      }
    ],
    "candidates_educations": [
      {
        "id": 551,
        "uuid": "22fd7e9b-d52d-41eb-90bc-9b61f91e2b26",
        "candidate_id": 1038,
        "candidates_education": null,
        "education_candidate_name": "yisoyip",
        "institute_name": "F",
        "specialization": "",
        "authority": "",
        "type": "NO_EDUCATION",
        "course_type": null,
        "data": null,
        "document_type": null,
        "status": "discrepancy",
        "qc_check_log_id": "5fd1bdc0b6e0bf001244572f",
        "created_at": "2020-08-18T15:13:24.000Z",
        "ongrid_request_id": null,
        "issue_date": null,
        "registrationNumber": "",
        "ongrid_document_id": null,
        "ongrid_reports": "{\"respondent_name\":\"\",\"respondent_designation\":\"\",\"respondent_email\":\"\",\"respondent_phone\":\"\",\"comments\":\"\",\"verification_type\":\"None\",\"verification_source\":\"None\",\"currently_studying_here\":0,\"currently_studying_here_status\":\"0\",\"education_candidate_name\":\"sdfsdfsdf\",\"education_candidate_name_status\":\"2\",\"start_date\":null,\"start_date_status\":\"0\",\"degree\":\"sdfsdfsd\",\"degree_status\":\"0\",\"year_of_passing\":null,\"year_of_passing_status\":\"0\",\"grade\":null,\"grade_status\":\"0\",\"course_name\":null,\"course_name_status\":\"0\",\"course_type\":null,\"course_type_status\":\"0\",\"name_of_boarduniversity\":\"sfdsfsdfs\",\"name_of_boarduniversity_status\":\"1\",\"name_of_institute\":\"sdsfsdfs\",\"name_of_institute_status\":\"1\",\"registration_number\":null,\"registration_number_status\":\"0\"}",
        "start_date": null,
        "currently_studying_here": 0,
        "passing_year": null,
        "verification_type": null,
        "verification_source": null,
        "requested_at": "2020-12-10",
        "completed_at": "2020-12-10",
        "final_result": "",
        "ops_status_uuid": "N/A",
        "is_file_migrated": 0,
        "degree": "",
        "files": []
      }
    ],
    "candidate_histories": [
      {
        "id": 4743,
        "uuid": "a9b0a1e1-5a77-4e38-b6ca-c0e4f1b87333",
        "candidate_id": 6300,
        "address_id": 5722,
        "comments": "No adverse records found.",
        "completion_date": "2019-09-16",
        "created_at": "2020-08-20T16:09:01.000Z",
        "status": "verified",
        "qc_check_log_id": "60599c34705e150011402c23",
        "file_url": null,
        "verify_ids": null,
        "store_data": null,
        "final_data": null,
        "algo_type": 11,
        "requested_at": "2019-09-09",
        "added_to_report_at": "2020-08-20T12:51:22.000Z",
        "ops_status_uuid": "N/A",
        "is_file_migrated": 0,
        "files": [
          {
            "id": 40360,
            "uuid": "8f591a3b-821a-4abd-8554-28bc98ab9f83",
            "related_uuid": "a9b0a1e1-5a77-4e38-b6ca-c0e4f1b87333",
            "document_url": "https://springverify-assets-id.s3.amazonaws.com/Ashok-Sundarrao-Jogdand-1597920009053-6300-history-verify-0.pdf",
            "is_default": 0,
            "is_verified": 1,
            "show_in_report": 1,
            "relation_id": null,
            "active": null
          }
        ]
      }
    ],
    "candidates_creditchecks": [
      {
        "id": 79,
        "uuid": "98f213a2-cdfa-4cbb-8028-655389e6351f",
        "candidate_id": "4119a48d-b3f8-4e07-9dd9-d4414c70e01b",
        "name": "Ashok Sundarrao Jogdand",
        "pan_number": "BKMPA3164J",
        "dob": "1995-03-05",
        "address": "Sr. #-22/5/1, Lane #-1, Krantiveer Nagar, Near Sancheti School, Thergaon Road, Dange Chowk, Near Sancheti School, Tiger Gym Lane, , Pune, Maharashtra, 411035",
        "credit_score": 8,
        "loan_score": 720,
        "status": 1,
        "qc_check_log_id": "6059a04a7a4bba001182824b",
        "comments": "test",
        "requested_date": null,
        "completed_date": "2021-03-23",
        "created_at": "2021-03-23T07:43:39.000Z",
        "files": [],
        "insufficiencyTime": 0,
        "onHold": 0,
        "elapsedTime": 1,
        "effectiveTATTime": 1
      }
    ],
    "candidates_employments": [
      {
        "id": 497,
        "uuid": "a5ad238b-f417-4ab0-8dff-c9ca3a3827eb",
        "candidate_id": 1038,
        "emp_candidate_name": "yisoyip",
        "company_name": "xcvxbdfdgsf",
        "company_data": null,
        "status": "unable_to_verify",
        "qc_check_log_id": null,
        "created_at": "2020-08-18T15:44:39.000Z",
        "designation": "SFE",
        "employee_id": "535433",
        "location": "dfdsgfdhtee",
        "start_date": "",
        "currently_here": 0,
        "end_date": "",
        "verification_type": null,
        "completion_date": "2020-12-10",
        "ongrid_request_id": null,
        "ongrid_document_id": null,
        "document_type": "SalarySlip",
        "ongrid_reports": "{\"name\":\"Yivaj92035\",\"name_status\":\"2\",\"company_name\":null,\"company_name_status\":\"0\",\"designation\":null,\"designation_status\":\"0\",\"employee_id\":null,\"employee_id_status\":\"0\",\"working_city\":null,\"working_city_status\":\"0\",\"joining_date\":null,\"joining_date_status\":\"0\",\"last_working_date\":null,\"last_working_date_status\":\"0\",\"currently_here\":null,\"currently_here_status\":\"0\",\"rm_name\":null,\"rm_name_status\":\"0\",\"rm_email\":null,\"rm_email_status\":\"0\",\"rm_phone\":null,\"rm_phone_status\":\"0\",\"reason_for_leaving\":null,\"reason_for_leaving_status\":\"0\",\"annual_compensation\":null,\"annual_compensation_status\":\"0\",\"annual_compensation_type\":null,\"comments\":\"\",\"respondent_name\":\"\",\"respondent_designation\":\"\",\"respondent_email\":\"\",\"respondent_phone\":\"\"}",
        "hr_name": "",
        "hr_phone": null,
        "hr_email": null,
        "rm_name": "",
        "rm_email": null,
        "rm_phone": null,
        "recommend_hire": null,
        "left_comment": "",
        "compensation": "",
        "requested_at": "2020-12-10T00:00:00.000Z",
        "compensation_type": null,
        "initiated_to_vs": null,
        "ops_status_uuid": "N/A",
        "is_file_migrated": 0,
        "country": "India",
        "files": [
          {
            "id": 3711,
            "uuid": "8c42c6b3-f235-493d-abf4-9a2c5995a303",
            "related_uuid": "a5ad238b-f417-4ab0-8dff-c9ca3a3827eb",
            "document_url": "https://springverify-assets-id.s3.amazonaws.com/yisoyip-xcvxbdfdgsf-1598013946721-1038-SalarySlip.png",
            "is_default": 0,
            "is_verified": 0,
            "show_in_report": 1,
            "relation_id": null,
            "active": null
          },
          {
            "id": 3716,
            "uuid": "72906916-c094-474a-9e7e-72b0e1edbff3",
            "related_uuid": "a5ad238b-f417-4ab0-8dff-c9ca3a3827eb",
            "document_url": "https://springverify-assets-id.s3.amazonaws.com/yisoyip-1598423104397-1038-verify-report-SalarySlip.png",
            "is_default": 0,
            "is_verified": 1,
            "show_in_report": 1,
            "relation_id": null,
            "active": null
          }
        ]
      }
    ],
    "candidate_histories": [
      {
        "id": 123,
        "uuid": "1e10a301-632a-4b27-9251-b3d370c59257",
        "candidate_id": 1038,
        "address_id": 571,
        "comments": "",
        "completion_date": null,
        "created_at": "2020-08-25T13:29:22.000Z",
        "status": "processing",
        "qc_check_log_id": null,
        "file_url": null,
        "verify_ids": null,
        "store_data": null,
        "final_data": null,
        "algo_type": 11,
        "requested_at": null,
        "added_to_report_at": null,
        "ops_status_uuid": "909d94f8-0872-49db-a47e-076615c0baeb",
        "is_file_migrated": 0,
        "files": []
      }
    ],
    "report_url": "https://api-dev-sa.in.springverify.com/candidate/report/pdf?candidate_id=1038&token="
  }
]
```

# Get All Candidates

```shell
curl --location --request GET 'https://api-dev.in.springverify.com/v1/candidate/candidates?limit=20&page=2' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamFja2h5bTIzQGdtYWlsLmNvbSIsImNvbXBhbnlJZCI6MiwidXNlcklkIjoyLCJjb21wYW55TmFtZSI6Im15ZmFrZWljbyB0ZXN0aW5nIiwiYWNjZXNzTGV2ZWwiOjV9LCJpYXQiOjE1OTQ5ODQ2OTcsImV4cCI6MTU5ODU4NDY5N30.eGrdMRasVlpp1xwcVTuiGfwDCujty22ULUxRynmeal0'
```

API to fetch all candidates uploaded by the Company, in a sorted fashion. Sorting is based on action taken on candidate

  <aside type="notice">
  limit and page are optional. If not provided, either, default values are limit 10 and page 0
  </aside>

> Response looks like

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
