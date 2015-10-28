---
title: ManageBac API


language_tabs:
  - ruby

toc_footers:
 
includes:

search: true
---
  
<h1 id="managebac">
  ManageBac
  <img src="/images/logo-1.png" alt="" height="36">
</h1>


The ManageBac API should be implemented in a RESTful style using JSON over HTTP. Based on REST principles, four HTTP methods are used: GET, POST, PUT and DELETE.

The purpose of this API is to allow for integration with 3rd party databases to automate the creation or update of users (students or parents) including assigning students into their classes.

# Authentication & Authorisation

API requests can be made via HTTPS between the 3rd party database and ManageBac. All requests on the API can be authenticated to the subdomain with a unique product API token using HTTP Basic Access Authentication.

The API token can be generated manually via Settings > Integrations. Please ensure that you enable API integration for the specific year levels and provide accurate mapping to the default Homeroom Advisor and Year group. You can optionally indicate year level labels as they appear in your main SIS.  

![MB integration](/images/mb_integration_public_api.png)


# Requests

Every request to the ManageBac API should be assumed to be in JSON format.

```
    GET   curl -G -d "auth_token=5c73d0b53d9c7b547ea4033794b9f34d" https://{school subdomain}.managebac.com/api/users/

    POST  curl -i -H "auth_token:5c73d0b53d9c7b547ea4033794b9f34d" -H "Content-Type: application/json" -X POST -d '{"user":{"foo":"bar"}}' https://{school subdomain}.managebac.com/api/users/
```

# Responses

If a request fails, the error can be returned as an HTTP status code from the range 400 - 599. Successful requests return a status code of 200 or 201.


<table class="data-grid">
<tr><th>Response</th><th>Reason</th></tr>
<tr><td>HTTP/1.1 200 OK</td><td>A successful request</td></tr>
<tr><td>HTTP/1.1 201 Created</td><td>The request created a new record (i.e. a new user has been logged on ManageBac and an account has been provisioned)</td></tr>
<tr><td>HTTP/1.1 401 Not authorized</td><td>An authentication token was not provided or was incorrect.</td></tr>
<tr><td>HTTP/1.1 404 Not Found</td><td>The requested record doesn't exist, or the authenticated user doesn't have access to the record.</td></tr>
<tr><td>HTTP/1.1 400 Bad Request</td><td>If we PUT or POST a resource with invalid JSON.</td></tr>
<tr><td>HTTP/1.1 500 Internal Server Error</td><td>An error occurred while processing a request.</td></tr>
</table>


# Users Data Reference

## User Model

This is the most common type of request to automate creation of new user accounts.​

For example, when a new student applies to the school, they are admitted on [OpenApply](http://openapply.com/ "OpenApply") and marked as Enrolled. At that point, we must have a way to create their account on ManageBac. 

> Below is the reference for the User Model process

``` json
{
  "user": {
    "type": "student",
    "first_name": "Chloe",
    "last_name": "Epelbaum",
    "nickname": "CMac",
    "other_name": "Cb",
    "email": "chloe@eduvo.com",
    "gender": "Femail",
    "birthday": "17.03.1999",
    "mobile_phone_number": "+1-123-456-78-91",
    "language": "English",
    "street_address": "Baker Street",
    "street_address_ii": "b12 f10",
    "phone_number": "+1-123-456-78-90",
    "city": "Alvin",
    "state": "Texas",
    "zipcode": "77590-77592",
    "country": "US",
    "profile_photo": "https://managebac.com/uploads/.../photo.gif",
    "password": "123456",
    "student_id": "#12345",
    "year_label": "11",
    "national_id": "#0987654",
    "salutation": "Mrs.",
    "title": "Developer",
    "work_state": "Eduvo",
    "work_email": "edudeveloper@work.em",
    "work_postal_code": "77590-77592",
    "work_country": "US",
    "work_phone": "+1-234-567-89-00",
    "work_fax": "+1-234-567-89-00",
    "work_address_ii": "b12",
    "work_city": "Alvin",
    "employer": "Eduvo inc.",
    "work_address": "Flover str",
    "language1": "English",
    "language2": "French",
    "language3": "German",
    "language4": "Spanish",
    "nationality1": "Australian",
    "nationality2": "Canadian",
    "nationality3": "German",
    "nationality4": "British",
    "welcome_email": "Yes",
    "parents_ids": "10835017, 10847302",
    "children_ids": "10544210, 10544211",
    "homeroom_advisor": "10545261"
  }
}
```


###Required Fields:

| Field  | Type  | Description |
| ------------- | ------------- | -------|
| type  | string | The request is either sent from either a Student / Parent / Advisor |
| student_id  | string| The student's id, required only for students  |
| first_name | string| The user's first name |
| last_name | string| The user's last name |
| email | string| The user's email |
| gender | string| The user's gender|


###Optional Fields:

|Field | Type | Description |
|---------------| ----------------| ------- |
|ib_group_id |integer| The user's ID of IB Group|
|country | string| The user's country |
|state | string| The user's state |
|city | string| The user's city |
|zipcode| string| The user's zipcode |
|street_address| string| The user's current street adress|
|streeet_address_ii | string| The user's additional street address|
|mobile_phone_number| string| The user's mobile phone number |
|welcome_email| string| options: Yes or No |
|children_ids| array of integers| This is relevant for parent users only (can be have more than one id)|
|parents_ids | array of integers| This is relevant for student users only (can have more than one id)|
|homeroom_advisor| string | The user_id or email for the advisor or admin |
|nickname| string| The user's nickname |
|other_name| string| The user's other name|
|birthday|string| The user's birthday|
|language|string| The user's language|
|password|string| The user's account password|
|year_label|string| The year the student is in|
|national_id|string| The user's national id|
|language1 |string| The user's first language|
|language2 |string| The user's second language|
|language3 |string| The user's third language|
|language4 |string| The user's fourth language|
|nationality1 |string | The user's first nationality|
|nationality2 |string | The user's second nationality|
|nationality3 |string | The user's third nationality|
|nationality4 |string | The user's fourth nationality|
|profile_photo|string | The user's photo|

## New User Creation

POST /api/users

Creates a new user on ManageBac.

> Example request for a student:

```
POST /api/users
```

``` json
{
  "users": {
            "type": "student",
            "city": "Austin",
            "nationality1": "United states",
            "phone_number": "",
            "attendance_start_date": "2014-08-01",
            "program": "IB DP",
            "class_year": 13,
            "nationality2": "Germany",
            "birthday": "1997-04-01",
            "parents_ids": [
                10752668,
                10752669
            ],
            "language1": "English",
            "openapply_student_id": null,
            "first_name": "Chloe",
            "mobile_phone_number": "+852 9301 5831",
            "nationality3": null,
            "student_id": "10015",
            "gender": "Female",
            "state": "",
            "language2": null,
            "last_name": "Epelbaum",
            "street_address_ii": null,
            "nationality4": null,
            "nickname": "",
            "zipcode": "",
            "language3": null,
            "email": "chloe@eduvo.com",
            "id": 10752610,
            "national_id": "",
            "language": "en",
            "street_address": "Flat 10B, 68 Mount Davis Rd.",
            "country": "HK",
            "language4": null,
            "openapply_parent_id": null
        }
    }
{
  "user": {
    "type": "student",
    "first_name": "Henry",
    "last_name": "Epelbaum",
    "nickname": "Henny",
    "other_name": "Hen",
    "email": "henryep@eduvo.com",
    "student_id": "#12345890",
    "gender": "Male",
    "birthday": "17.03.1999",
    "mobile_phone_number": "+1-123-456-78-91",
    "language": "English",
    "street_address": "Baker Street",
    "street_address_ii": "b12 f10",
    "phone_number": "+1-123-456-78-90",
    "city": "Alvin",
    "state": "Texas",
    "zipcode": "77590-77592",
    "country": "US",
    "password": "123456",
    "year_label": "Grade 11",
    "national_id": "#0987654",
    "language1": "English",
    "language2": "French",
    "language3": "Spanish",
    "language4": "German",
    "nationality1": "Australia",
    "nationality2": "Germany",
    "nationality3": "France",
    "nationality4": "Spain",
    "welcome_email": "Yes",
    "parents_ids": [10835017, 10847302],
    "homeroom_advisor": "10545261"
  }
}



```
Note: "year_label" - a year label in your database, should be configured on Settings/Integration/Public API page. It is related to MB IB Group and
homeroom advisor mapping.

> Example request for a parent:

``` json
{
  "user": {
    "type": "parent",
    "first_name": "Adrienne",
    "last_name": "Epelbaum",
    "nickname": "AMac",
    "other_name": "Addie",
    "email": "adrienne@eduvo.com",
    "gender": "Female",
    "birthday": "19.06.1969",
    "mobile_phone_number": "+1-123-456-78-91",
    "language": "English",
    "street_address": "Baker Street",
    "street_address_ii": "b12 f10",
    "phone_number": "+1-123-456-78-90",
    "city": "Alvin",
    "state": "Texas",
    "zipcode": "77590-77592",
    "country": "US",
    "password": "123456",
    "salutation": "Mrs.",
    "title": "Developer",
    "work_state": "Texus",
    "work_email": "aebaum@work.em",
    "work_postal_code": "77590-77592",
    "work_country": "US",
    "work_phone": "+1-234-567-89-00",
    "work_fax": "+1-234-567-89-00",
    "work_address_ii": "b12",
    "work_city": "Alvin",
    "employer": "Eduvo inc.",
    "work_address": "Flover str",
    "language1": "English",
    "language2": "Spanish",
    "language3": "German",
    "language4": "French",
    "nationality1": "Canada",
    "nationality2": "USA",
    "nationality3": "Spain",
    "nationality4": "Germany",
    "welcome_email": "Yes",
    "children_ids": "10544210, 10544211"
  }
}

```

> Example request for teacher/advisor:

``` json

{
  "user": {
    "type": "advisor",
    "first_name": "Risa",
    "last_name": "Aoki",
    "nickname": "RMac",
    "other_name": "Ri-si",
    "email": "risaaoki@eduvo.com",
    "gender": "Female",
    "birthday": "12.07.1989",
    "mobile_phone_number": "+1-123-456-78-91",
    "language": "English",
    "street_address": "Baker Street",
    "street_address_ii": "b12 f10",
    "phone_number": "+1-123-456-78-90",
    "city": "Alvin",
    "state": "Texas",
    "zipcode": "77590-77592",
    "country": "US",
    "password": "123456",
    "language1": "English",
    "language2": "French",
    "language3": "Chinese",
    "language4": "Japanese",
    "nationality1": "Canada",
    "nationality2": "Britian",
    "nationality3": "Japan",
    "nationality4": "China",
    "welcome_email": "Yes"
  }
}

```

> Example response to create a user account:

```bash
HTTP/1.1 200 OK
```

``` json
{
 "status": "Success",
 "user_id": "10565703"
}

```

> Example response with incorrect input data:

```bash
HTTP/1.1 400 Bad Request
```

``` json
{
 "status": "Error",
 "errors": "Invalid user data: Email has already been taken, Student ID must be unique."
}

```

## Retrieve Users

GET /api/users

Retrieves all users with basic information. This includes User ID,  which can be used to access individual user information.


> Retrieve All Users

```bash
 Get/api/users
```

``` json
{
  "users": [
        {
            "type": "Students",
            "city": "Austin",
            "nationality1": "United states",
            "phone_number": "",
            "attendance_start_date": "2014-08-01",
            "program": "IB DP",
            "class_year": 13,
            "nationality2": "Germany",
            "birthday": "1997-04-01",
            "parents_ids": [
                10752668,
                10752669
            ],
            "language1": "English",
            "profile_photo": "https://managebac.com/uploads/.../photo.gif",
            "openapply_student_id": null,
            "first_name": "Chloe",
            "mobile_phone_number": "+852 9301 5831",
            "nationality3": null,
            "student_id": "10015",
            "gender": "Female",
            "state": "",
            "language2": null,
            "last_name": "Epelbaum",
            "street_address_ii": null,
            "nationality4": null,
            "nickname": "",
            "zipcode": "",
            "language3": null,
            "email": "chloe@eduvo.com",
            "id": 10752610,
            "national_id": "",
            "language": "en",
            "street_address": "Flat 10B, 68 Mount Davis Rd.",
            "country": "HK",
            "language4": null,
            "openapply_parent_id": null
        }
    ]
}
```

<p>GET /api/users/{user_id}</p>
Retrieves a specifc user.


> Retrieves a specific user

```
GET /api/users/{user_id}
```

```json
{
    "user": {
        "type": "Students",
        "city": "Austin",
        "nationality1": "United states",
        "phone_number": "",
        "attendance_start_date": "2014-08-01",
        "program": "IB DP",
        "class_year": 13,
        "nationality2": "Germany",
        "birthday": "1997-04-01",
        "parents_ids": [
            10752668,
            10752669
        ],
        "language1": "English",
        "profile_photo": "https://managebac.com/uploads/.../photo.gif",
        "openapply_parent_id": null,
        "first_name": "Chloe",
        "mobile_phone_number": "+852 9301 5831",
        "nationality3": null,
        "student_id": "10015",
        "gender": "Female",
        "state": "",
        "language2": null,
        "last_name": "Epelbaum",
        "street_address_ii": null,
        "nationality4": null,
        "nickname": "",
        "zipcode": "",
        "language3": null,
        "email": "chloe@eduvo.com",
        "openapply_student_id": null,
        "id": 10752610,
        "national_id": "",
        "language": "en",
        "street_address": "Flat 10B, 68 Mount Davis Rd.",
        "country": "HK",
        "language4": null
    }
}
```

GET /api/users/?type={ Student | Parent | Teacher(Advisor)}
Retrieves a set of users with a specific type.

> Retrieves a set of users with a specific user type.

```
GET /api/users/?type={ Student | Parent | Teacher(Advisor)}
```

``` json
{
    "users": [
        {
            "type": "Parents",
            "city": "Austin",
            "work_address_ii": null,
            "nationality1": null,
            "phone_number": "+852 2396 6840",
            "employer": "",
            "work_fax": "",
            "nationality2": null,
            "birthday": null,
            "language1": null,
            "salutation": "Mrs.",
            "first_name": "Adrienne",
            "mobile_phone_number": "+65.9301.5833",
            "work_city": "",
            "nationality3": null,
            "openapply_parent_id": null,
            "gender": "Female",
            "state": "",
            "work_email": "",
            "language2": null,
            "last_name": "Epelbaum",
            "street_address_ii": null,
            "work_state": "",
            "nationality4": null,
            "child_ids": [
                10752610,
                10752659,
                10752675
            ],
            "nickname": "",
            "profile_photo": "https://managebac.com/uploads/.../photo.gif",
            "zipcode": "",
            "work_phone": "",
            "language3": null,
            "email": "adrienne@eduvo.com",
            "work_postal_code": "",
            "id": 10752668,
            "national_id": null,
            "language": "en",
            "street_address": "Flat 10B, 68 Mount Davis Road",
            "country": "HK",
            "work_address": "",
            "language4": null,
            "openapply_student_id": null,
            "work_country": "US",
            "title": ""
        }
    ]
}
```

## Update Users

<p>PUT /api/users/{user_id}</p>

Updates student information using the <a>{user_id}</a> as the key.

> Example of updating student information and assigning the student to multiple classes.:


```
PUT /api/users/{user_id}
```

``` json
{
    "user": {
        "type": "Student",
        "city": "Austin",
        "nationality1": "United states",
        "phone_number": "",
        "attendance_start_date": "2014-08-01",
        "program": "IB DP",
        "class_year": 13,
        "nationality2": "Germany",
        "birthday": "1997-04-01",
        "parents_ids": [
            10752668,
            10752669
        ],
        "language1": "English",
        "openapply_parent_id": null,
        "first_name": "Chloe",
        "mobile_phone_number": "+852 9301 5831",
        "nationality3": null,
        "student_id": "10015",
        "gender": "Female",
        "state": "",
        "language2": null,
        "last_name": "Epelbaum",
        "street_address_ii": null,
        "nationality4": null,
        "nickname": "",
        "zipcode": "",
        "language3": null,
        "email": "chloe@eduvo.com",
        "openapply_student_id": null,
        "id": 10752610,
        "national_id": "",
        "language": "en",
        "street_address": "Flat 10B, 68 Mount Davis Rd.",
        "country": "HK",
        "language4": null
    }
}
```



> Example response to update a user account:

```
HTTP/1.1 200 OK
```

``` json
{
 "status": "Successfully updated."
}
```

> Example response with incorrect input data:

```
HTTP/1.1 400 Bad Request
```

``` json
{
 "status": "Error",
 "errors": "User parameters are invalid"
}
```

## Groups Data Reference

### Retrieve IB Groups

GET /api/ib_groups

Retrieves the school's IB Groups’ basic information. This includes `ib_group_id`, which should be used in the API functions below.​

> IB Groups' basic information

```
GET /api/ib_groups
```

``` json
{
    "ib_groups": [
        {
            "program": "diploma",
            "uniq_id": null,
            "name": "IB Diploma Class of 2015 (Grade 12)",
            "grade": "Grade 12",
            "id": 10209272
        },
        {
            "program": "diploma",
            "uniq_id": null,
            "name": "IB Diploma Class of 2016 (Grade 11)",
            "grade": "Grade 11",
            "id": 10209273
        },
        {
            "program": "myp",
            "uniq_id": null,
            "name": "IB MYP Class of 2015 (Grade 10)",
            "grade": "Grade 10",
            "id": 10253828
        },
        {
            "program": "myp",
            "uniq_id": null,
            "name": "IB MYP Class of 2016 (Grade 9)",
            "grade": "Grade 9",
            "id": 10209274
        },
        {
            "program": "myp",
            "uniq_id": null,
            "name": "IB MYP Class of 2017 (Grade 8)",
            "grade": "Grade 8",
            "id": 10209275
        },
        {
            "program": "myp",
            "uniq_id": null,
            "name": "IB MYP Class of 2018 (Grade 7)",
            "grade": "Grade 7",
            "id": 10209276
        },
        {
            "program": "myp",
            "uniq_id": null,
            "name": "IB MYP Class of 2019 (Grade 6)",
            "grade": "Grade 6",
            "id": 10209277
        },
        {
            "program": "pyp",
            "uniq_id": null,
            "name": "System PYP IB Group Grade 5 (Grade 5)",
            "grade": "Grade 5",
            "id": 10251393
        },
        {
            "program": "pyp",
            "uniq_id": null,
            "name": "System PYP IB Group Grade 4 (Grade 4)",
            "grade": "Grade 4",
            "id": 10251392
        },
        {
            "program": "pyp",
            "uniq_id": null,
            "name": "System PYP IB Group Grade 3 (Grade 3)",
            "grade": "Grade 3",
            "id": 10209285
        },
        {
            "program": "pyp",
            "uniq_id": null,
            "name": "System PYP IB Group Grade 2 (Grade 2)",
            "grade": "Grade 2",
            "id": 10218383
        },
        {
            "program": "pyp",
            "uniq_id": null,
            "name": "System PYP IB Group Grade 1 (Grade 1)",
            "grade": "Grade 1",
            "id": 10212272
        },
        {
            "program": "pyp",
            "uniq_id": null,
            "name": "System PYP IB Group Grade 0 (Kindergarten)",
            "grade": "Kindergarten",
            "id": 10210354
        },
        {
            "program": "pyp",
            "uniq_id": null,
            "name": "System PYP IB Group Grade -1 (Pre-K4)",
            "grade": "Pre-K4",
            "id": 10210353
        },
        {
            "program": "pyp",
            "uniq_id": null,
            "name": "System PYP IB Group Grade -2 (Pre-K3)",
            "grade": "Pre-K3",
            "id": 10251391
        }
    ]
}

```

### Retrieves List of IB Group students

<p>GET /api/groups/{ib_group_id}/members</p>

> Retrieves list of IB Group students​

```
GET /api/groups/{ib_group_id}/members
```

``` 
{
    "members": [
        {
            "type": "Students",
            "city": "Austin",
            "nationality1": "United states",
            "phone_number": "",
            "attendance_start_date": "2014-08-01",
            "program": "IB DP",
            "class_year": 13,
            "nationality2": "Germany",
            "birthday": "1997-04-01",
            "parents_ids": [
                10752668,
                10752669
            ],
            "language1": "English",
            "profile_photo": "https://managebac.com/uploads/.../photo.gif",
            "first_name": "Chloe",
            "mobile_phone_number": "+852 9301 5831",
            "nationality3": null,
            "openapply_parent_id": null,
            "student_id": "10015",
            "gender": "Female",
            "state": "",
            "language2": null,
            "last_name": "Epelbaum",
            "street_address_ii": null,
            "nationality4": null,
            "nickname": "",
            "zipcode": "",
            "language3": null,
            "email": "chloe@eduvo.com",
            "id": 10752610,
            "national_id": "",
            "language": "en",
            "street_address": "Flat 10B, 68 Mount Davis Rd.",
            "country": "HK",
            "language4": null,
            "openapply_student_id": null
        }
    ]
}

```

## Add members to IB Group

<p>POST /api/groups/{ib_group_id}/add_members</p>
Adds users to the specific group using Users IDs.

> Adds users to the specific group using the Users IDs.

```
POST /api/groups/{ib_group_id}/add_members
```

``` json
{
 "users": [10752610]
}
```

> Example response to update a user account:

```
HTTP/1.1 200 OK
```

``` json
{
 "status": "Successfully added."
}
```

> Example response with incorrect input data:

```
HTTP/1.1 400 Bad Request
```

``` json
{
  "status": "Error",
  "errors": "Student not found."
}
```

## Remove members from the IB Group


<p>PUT /api/groups/{ib_group_id}/remove_members</p>
Removes students from the specific IB group using the Users IDs.

> Removes students from the specific IB group using the Users IDs.

```
PUT /api/groups/{ib_group_id}/remove_members
```

``` json
{
  "users": [10752610]
}
```

> Example response to update a user account:

```
HTTP/1.1 200 OK
```

``` json
{
  "status": "Successfully removed."
}
```

> Example response with incorrect input data:

```
HTTP/1.1 400 Bad Request
```

``` json
{
  "status": "Error",
  "errors": "Student not found."
}
```

## Class Model

### Retrieve Classes

GET /api/classes

Retrieves all Classes with basic information.
Note: By default, classes are sorted alphabetically by name if they can't be sorted by subject group.

> All classes with basic information

```
GET /api/classes
```

``` json
{
    "classes": [
        {
            "uniq_id": "",
            "name": "IB PYP Homeroom A (Kindergarten)",
            "grade": "Kindergarten",
            "class_type": "IB Primary Years",
            "id": 10225060
        },
        {
            "uniq_id": "",
            "name": "IB PYP Hippos (Grade 1)",
            "grade": "Grade 1",
            "class_type": "IB Primary Years",
            "id": 10212271
        },
        {
            "uniq_id": "IPC3",
            "name": "PS IPC Homeroom 2 (Grade 2)",
            "grade": "Grade 2",
            "class_type": "Primary School",
            "id": 10247452
        },
        {
            "uniq_id": "",
            "name": "IB PYP Homeroom (Grade 3)",
            "grade": "Grade 3",
            "class_type": "IB Primary Years",
            "id": 10209284
        },
        {
            "uniq_id": "PYPPE3",
            "name": "IB PYP Physical Education (Grade 3)",
            "grade": "Grade 3",
            "class_type": "IB Primary Years",
            "id": 10247450
        },
        {
            "uniq_id": "",
            "name": "IB PYP Visual Arts (Grade 3)",
            "grade": "Grade 3",
            "class_type": "IB Primary Years",
            "id": 10209718
        },
        {
            "uniq_id": "",
            "name": "IB MYP Extended Honors Math (Grade 6)",
            "grade": "Grade 6",
            "class_type": "IB Middle Years",
            "id": 10250978
        },
        {
            "uniq_id": "",
            "name": "IB MYP Basic Music Composition  (Grade 7)",
            "grade": "Grade 7",
            "class_type": "IB Middle Years",
            "id": 10251079
        },
        {
            "uniq_id": "",
            "name": "IB MYP Physical Education (Grade 8)",
            "grade": "Grade 8",
            "class_type": "IB Middle Years",
            "id": 10277629
        },
        {
            "uniq_id": "MYC8Spanish",
            "name": "MS Spanish (Grade 8)",
            "grade": "Grade 8",
            "class_type": "Middle School",
            "id": 10247451
        },
        {
            "uniq_id": "MYP8PE14",
            "name": "IB MYP Boot Camp (Grade 9)",
            "grade": "Grade 9",
            "class_type": "IB Middle Years",
            "id": 10251070
        },
        {
            "uniq_id": "MYP7Tec14",
            "name": "IB MYP Building iPhone Apps (Grade 9)",
            "grade": "Grade 9",
            "class_type": "IB Middle Years",
            "id": 10251072
        },
        {
            "uniq_id": "MYPHmnties14",
            "name": "IB MYP Humanities (Grade 9)",
            "grade": "Grade 9",
            "class_type": "IB Middle Years",
            "id": 10251061
        },
        {
            "uniq_id": "MYP5Mat14",
            "name": "IB MYP Mathematics (Grade 9)",
            "grade": "Grade 9",
            "class_type": "IB Middle Years",
            "id": 10251065
        },
        {
            "uniq_id": "MYP6Art14",
            "name": "IB MYP Painting (Grade 9)",
            "grade": "Grade 9",
            "class_type": "IB Middle Years",
            "id": 10251068
        },
        {
            "uniq_id": "MYP4Sci14",
            "name": "IB MYP Physical Sciences (Grade 9)",
            "grade": "Grade 9",
            "class_type": "IB Middle Years",
            "id": 10251063
        },
        {
            "uniq_id": "MYP3Hum14",
            "name": "IB MYP US History (Grade 9)",
            "grade": "Grade 9",
            "class_type": "IB Middle Years",
            "id": 10251060
        },
        {
            "uniq_id": "MYP1Eng14",
            "name": "IB MYP World Literature (Grade 9)",
            "grade": "Grade 9",
            "class_type": "IB Middle Years",
            "id": 10251056
        },
        {
            "uniq_id": "MYP Sci14",
            "name": "IB MYP Chemistry (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251062
        },
        {
            "uniq_id": "",
            "name": "IB MYP Chinese Phases 3, 4 (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10255503
        },
        {
            "uniq_id": "MYPDrmArt14",
            "name": "IB MYP Dramatic Arts (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251066
        },
        {
            "uniq_id": "MYP Eco14",
            "name": "IB MYP Economics (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251058
        },
        {
            "uniq_id": "",
            "name": "IB MYP English (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10250976
        },
        {
            "uniq_id": "MYP Eng14",
            "name": "IB MYP English World Lit (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251055
        },
        {
            "uniq_id": "MYP His14",
            "name": "IB MYP History (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251059
        },
        {
            "uniq_id": "MYP JP14",
            "name": "IB MYP Japanese Phase 3 (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251057
        },
        {
            "uniq_id": "MYP Math14",
            "name": "IB MYP Mathematics (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251064
        },
        {
            "uniq_id": "",
            "name": "IB MYP Physical Education (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10250977
        },
        {
            "uniq_id": "MYP Tech14",
            "name": "IB MYP Technology (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251071
        },
        {
            "uniq_id": "MYP Art14",
            "name": "IB MYP Visual Arts (Grade 10)",
            "grade": "Grade 10",
            "class_type": "IB Middle Years",
            "id": 10251067
        },
        {
            "uniq_id": "IGCSE10Maths",
            "name": "HS Mathematics (Pre-IB Grade 10)",
            "grade": "Grade 10",
            "class_type": "High School",
            "id": 10209303
        },
        {
            "uniq_id": "DP4CheHL",
            "name": "IB DP Chemistry HL (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10247437
        },
        {
            "uniq_id": "",
            "name": "IB DP Chemistry (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216809
        },
        {
            "uniq_id": "DP2ManSL",
            "name": "IB DP Chinese SL B (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10247435
        },
        {
            "uniq_id": "",
            "name": "IB DP Chinese SL B (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216811
        },
        {
            "uniq_id": "DP1EngSL",
            "name": "IB DP English A HL (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10247434
        },
        {
            "uniq_id": "",
            "name": "IB DP English A Literature (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216810
        },
        {
            "uniq_id": "",
            "name": "IB DP English HL B (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10223438
        },
        {
            "uniq_id": "DP3HisHL",
            "name": "IB DP History HL (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10247436
        },
        {
            "uniq_id": "Hist\\11",
            "name": "IB DP History (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216814
        },
        {
            "uniq_id": "DP5MatSL",
            "name": "IB DP Mathematics SL (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10247438
        },
        {
            "uniq_id": "",
            "name": "IB DP Mathematics (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216817
        },
        {
            "uniq_id": "DP6MusHL",
            "name": "IB DP Music HL (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10247439
        },
        {
            "uniq_id": "",
            "name": "IB DP Orchestra (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216818
        },
        {
            "uniq_id": "",
            "name": "IB DP Philosophy (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216815
        },
        {
            "uniq_id": "",
            "name": "IB DP Physics SL (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216816
        },
        {
            "uniq_id": "",
            "name": "IB DP Spanish SL ab initio (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216813
        },
        {
            "uniq_id": "DP7ToK",
            "name": "IB DP Theory of Knowledge (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10247440
        },
        {
            "uniq_id": "",
            "name": "IB DP Theory of Knowledge (Grade 11)",
            "grade": "Grade 11",
            "class_type": "IB Diploma",
            "id": 10216819
        },
        {
            "uniq_id": "DP Sci",
            "name": "IB DP Biology (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10209292
        },
        {
            "uniq_id": "",
            "name": "IB DP Chinese B (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10216808
        },
        {
            "uniq_id": "DP Econ HL",
            "name": "IB DP Economics HL (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10209290
        },
        {
            "uniq_id": "DP Eng A Lit",
            "name": "IB DP English Literature HL/SL (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10209288
        },
        {
            "uniq_id": "",
            "name": "IB DP Environmental Systems & Societies (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10228318
        },
        {
            "uniq_id": "IB DP Envi",
            "name": "IB DP Humanties (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10209310
        },
        {
            "uniq_id": "",
            "name": "IB DP Mathematics (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10209312
        },
        {
            "uniq_id": "IB DP Music",
            "name": "IB DP Orchestra (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10209309
        },
        {
            "uniq_id": "DP TOK",
            "name": "IB DP Theory of Knowledge (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10209294
        },
        {
            "uniq_id": "",
            "name": "IB DP Visual Arts (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10244819
        },
        {
            "uniq_id": "DP Hist HL",
            "name": "IB DP World History  (Grade 12)",
            "grade": "Grade 12",
            "class_type": "IB Diploma",
            "id": 10209291
        },
        {
            "uniq_id": "FSHSBW",
            "name": "HS Basket Weaving (Grade 12)",
            "grade": "Grade 12",
            "class_type": "High School",
            "id": 10209305
        },
        {
            "uniq_id": "FSHSO",
            "name": "HS Oceanography (Grade 12)",
            "grade": "Grade 12",
            "class_type": "High School",
            "id": 10209304
        }
    ]
}

```

## Retrieve Classes' members​

<p>GET /api/groups/{class_id}/members</p>
Retrieves the List of Class students.

> List of Class students.

```
GET /api/groups/{class_id}/members
```

``` json
{
    "members": [
        {
            "type": "Students",
            "city": "Austin",
            "nationality1": "United states",
            "phone_number": "",
            "attendance_start_date": "2014-08-01",
            "program": "IB DP",
            "class_year": 13,
            "nationality2": "Germany",
            "birthday": "1997-04-01",
            "parents_ids": [
                10752668,
                10752669
            ],
            "language1": "English",
            "first_name": "Chloe",
            "mobile_phone_number": "+852 9301 5831",
            "nationality3": null,
            "openapply_parent_id": null,
            "student_id": "10015",
            "gender": "Female",
            "state": "",
            "language2": null,
            "last_name": "Epelbaum",
            "street_address_ii": null,
            "nationality4": null,
            "nickname": "",
            "zipcode": "",
            "language3": null,
            "email": "chloe@eduvo.com",
            "id": 10752610,
            "national_id": "",
            "language": "en",
            "street_address": "Flat 10B, 68 Mount Davis Rd.",
            "country": "HK",
            "language4": null,
            "openapply_student_id": null
        }
    ]
}
```

## Add members to Class

<p>POST /api/groups/{class_id}/add_members</p>
Adds users to the specific class using the Users IDs.


> Adds users to the specific class

```
POST /api/groups/{class_id}/add_members
```

``` json
{
  "users": [10558121, 10558126]
}
```

> Example response to update a user account:

```
HTTP/1.1 200 OK
```

``` json
{
  "status": "Successfully added."
}
```

> Example response with incorrect input data:

```
HTTP/1.1 400 Bad Request
```

``` json
{
  "status": "Error",
  "errors": "Student not found."
}
```

## Remove members from Class​

<p>PUT /api/groups/{class_id}/remove_members</p>
Removes users from a specific class using the User IDs.

> Removes users from a specific class

```
PUT /api/groups/{class_id}/remove_members
```

``` json
{
  "users": [10558121, 10558126]
}
```

> Example response to update a user account:

```
HTTP/1.1 200 OK
```

``` json
{
  "status": "Successfully removed."
}
```

> Example response with incorrect input data:

```
HTTP/1.1 400 Bad Request
```

``` json
{
  "status": "Error",
  "errors": "Student not found."
}
```

