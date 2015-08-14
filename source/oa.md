---
title: OpenApply API

language_tabs:
  - ruby

toc_footers:


includes:

search: true
---

# OpenApply API  ![openapply](/images/openapply-logo-text.png)


The OpenApply (OA) Public API should be implemented in a RESTful style using JSON
over HTTP. Based on REST principles, three HTTP verbs are used: GET, POST and PUT.

The purpose of this API is to allow for integration with 3rd party databases to automate the creation or update of users including assignment into their classes.

# Authentication & Authorization

API requests can be made via HTTPS between the 3rd party database and OA. All requests on the API can be authenticated to the subdomain with a unique product API token using HTTP Basic Access Authentication.

The API token should be generated manually via Settings > Integrations. Firstly you have to enable Public API function and add API token for the integrated applications.

![API screenshot](/images/oaintegration_api.png)

> Here’s an example using curl:

``` bash
curl https://{school subdomain}.openapply.com/api/v1/students?auth_token=2a8b196ee0af6cfa3509961fb573a8a3
```

# Requests

The API request Host url is:

> Api request Host url

``` bash
https://{school subdomain}.openapply.com/api/v1
```

All the requests access resources from this API entry point with the authentication token.
For example, when accessing Student resources:

> Accessing Student resources

``` bash
GET https://{school subdomain}.openapply.com/api/v1/students? auth_token=2a8b196ee0af6cfa3509961fb573a8a3
```

# Responses

If a request fails, the error can be returned as an HTTP status code with the range 400 -
599. Successful requests return a status code of 200 or 201.

<table>
<tr><th>Response</th><th>Reason</th></tr>
<tr><td>HTTP/1.1 200 OK</td><td>A successful request.</td></tr>
<tr><td>HTTP/1.1 201 Created</td><td>The request created a new record (i.e. a new user has been logged on ManageBac and an account has been provisioned).</td></tr>
<tr><td>HTTP/1.1 401 Not authorized</td><td>An authentication token was not provided or was incorrect.</td></tr>
<tr><td>HTTP/1.1 404 Not Found</td><td>The requested record doesn't exist, or the authenticated user doesn't have access to the record.</td></tr>
<tr><td>HTTP/1.1 400 Bad Request</td><td>If we PUT or POST a resource with invalid JSON.</td></tr>
<tr><td>HTTP/1.1 500 Internal Server Error</td><td>An error occurred while processing a request.</td></tr>
</table>

# Resources Reference

### Students

### Retrieve Students:

GET students/

Return up to 1000 (default is 100) students are sorted by id. Response also includes the list of parents associated with the students in the list.

<table>
<tr><th>Parameters</th><th></th></tr>
<tr><td><b>count</b><br>(optional)</td><td>Speciﬁes the number of students to try and retrieve, up to maximum of 1000</td></tr>
<tr><td><b>since_id</b><br>(optional)</td><td>Return results with an ID greater than the speciﬁed ID.</td></tr>
<tr><td><b>since_date</b><br>(optional)</td><td>Return results with update greater than the speciﬁed date or time, e.g: 2013-09-23 or 2013-09-25 02:10:39.</td></tr>
</table>

> Example Request

``` bash
GET https://{school subdomain}.openapply.com/api/v1/students
```

> Example Response:


``` bash
HTTP/1.1 200 OK
```

```json
{
  "students": [
    {
      "id": 1,
      "name": "Chloe Epelbaum",
      "ﬁrst_name": "Chloe",
      "last_name": "Epelbaum",
      "birth_date": "1999-01-29",
      "gender": "female",
      "enrollment_year": 2013,
      "sibling_ids": [ 112, 113 ],
      "full_address": "208 California Street #880, San Francisco, 94111, United States",
      "address": "208 California Street #880",
      "address_ii": null,
      "city": "San Francisco",
      "state": null,
      "postal_code": "94111",
      "country": "United States",
      "grade": "Grade 2",
      "applicant_id": "00000004",
      "campus": "Presidio Campus",
      "tags": [ ],
      "status": "wait_listed",
      "status_changed_at": "2012-06-11T02:11:15-07:00",
      "managebac_student_id": null,
      "applied_at": "2012-05-24T02:13:33-07:00",
      "enrolled_at": "2012-06-11T02:11:15-07:00",
      "inquired_at": "2012-05-21T02:08:43-07:00"
    },
    {
      "id": 2,
      "name": "Henry Epelbaum",
      "ﬁrst_name": "Henry",
      "last_name": "Epelbaum",
      "birth_date": "1999-03-27",
      "gender": "female",
      "enrollment_year": 2013,
      "sibling_ids": [ ],
      "full_address": "208 California Street #880, San Francisco, 94111, United States",
      "address": "208 California Street #880",
      "address_ii": null,
      "city": "San Francisco",
      "state": null,
      "postal_code": "94111",
      "country": "United States",
      "grade": "Grade 2",
      "applicant_id": "00000005",
      "campus": "Presidio Campus",
      "tags": [ ],
      "status": "wait_listed",
      "status_changed_at": "2012-05-27T07:24:27-07:00",
      "managebac_student_id": null,
      "applied_at": "2012-05-27T07:24:27-07:00",
      "enrolled_at": null,
      "inquired_at": null
    },
    {
      ....
    },
    {
      ....
    }
  ]
}
```

## Retrieve Student by ID

> Retrieve Student by ID

``` bash
GET students/:id
```

Return a single student with custom fields of the application form, speciﬁed by the id parameter.

<table>
<tr><th>Parameters</th><th></th></tr>
<tr><td><b>id</b><br>(required)</td><td>The numerical ID of the desired student.</td></tr>
</table>

> Example Request

``` bash
GET https://{school subdomain}.openapply.com/api/v1/students/1
```

> Example Response:

``` bash
HTTP/1.1 200 OK
```

``` json
{
  "user": {
    "id": 1,
    "name": "Chloe Epelbaum",
    "ﬁrst_name": "Chloe",
    "last_name": "Epelbaum",
    "birth_date": "1999-01-29",
    "gender": "female",
    "enrollment_year": 2013,
    "sibling_ids": [ 112, 119 ],
    "full_address": "Jalean Sriry 1/16, Kabaru, United State",
    "address": "alean Sriry 1/16",
    "address_ii": null,
    "city": "Kabaru",
    "state": null,
    "postal_code": null,
    "country": "United States",
    "grade": "Grade 2",
    "applicant_id": "00000004",
    "campus": "Presidio Campus",
    "tags": [ ],
    "status": "wait_listed",
    "status_changed_at": "2012-05-24T02:13:33-07:00"  ,
    "managebac_student_id": null,
    "applied_at": "2012-05-24T02:13:33-07:00",
    "enrolled_at": null,
    "inquired_at": "2012-05-21T02:08:43-07:00",
    "custom_fields": {
      "preferred_name": "Big Henry",
      "place_of_birth": "Sacramento",
      "parent_guardian": [{
          "id": 4,
          "name": "Thomas Epelbaum",
          "first_name": "Thomas",
          "last_name": "Epelbaum",
          "gender": "male",
          "parent_role": "Father",
          "email": "thoma@email.com",
          "managebac_parent_id": null,
          "parent_id": "3314",
          "custom_fields": {
            "title": "CTO",
            "birth_date": "1952-07-23"
          }
        },{
          "id": 5,
          "name": "Adrienne Epelbaum",
          "first_name": "Adrienne",
          "last_name": "Epelbaum",
          "gender": "female",
          "parent_role": "Mother",
          "email": "adrienne@email.com",
          "managebac_parent_id": null,
          "parent_id": "3315",
          "custom_fields": {
            "title": "Creative Director",
            "birth_date": "1962-07-17"
          }
        }
      ]
    }
  }
}
```

## Update status of student

> Update status of student 

``` bash
PUT students/:id/status
```

Updates the status of an individual student​

<table>
<tr><th>Parameters</th><th></th></tr>
<tr><td><b>id</b><br>(required)</td><td>The numerical ID of the desired student.​</td></tr>
<tr><td><b>status</b><br>(required)</td><td>The status value is pre-defined and can be matched to the following statuses</td></tr>
</table>

> Example Request

``` bash
PUT https://{school subdomain}.openapply.com/api/v1/students/1/status
PUT Data status=Applied
```

> Response:

```
HTTP/1.1 200 OK
```

``` json
{
  "user": {
    "id": 29676,
    "name": "Chloe Epelbaum",
    "ﬁrst_name": "Chloe",
    "last_name": "Epelbaum",
    "birth_date": "1997-04-01",
    "gender": "female",
    "enrollment_year": 2014,
    "status": "applied"
  }
}
```

> If the update fails, the response will be​

```
HTTP/1.1 400 Bad Request
```

``` json
{ "errors": "Cannot update status." }
```

The status value is pre-deﬁned and can be matched to the following statuses

<table>
<tr><th>Status</th><th>Code</th></tr>
<tr><td>Pending</td><td>10</td></tr>
<tr><td>Applied</td><td>20</td></tr>
<tr><td>Admitted</td><td>30</td></tr>
<tr><td>Wait-listed</td><td>40</td></tr>
<tr><td>Declined</td><td>50</td></tr>
<tr><td>Enrolled</td><td>60</td></tr>
<tr><td>Graduated</td><td>70</td></tr>
<tr><td>Withdrawn</td><td>80</td></tr>
</table>

## Retrieve Student's Payment Information

> Retrieve Student's Payment Information

``` bash
GET students/:id/payments
```

Return payment information of a student, speciﬁed by the student id parameter.

<table>
<tr><th>Parameters</th><th></th></tr>
<tr><td><b>id</b><br>(required)</td><td>The numerical ID of the desired student.</td></tr>
</table>

> Example Request

``` bash
GET https://{school subdomain}.openapply.com/api/v1/students/1/payments
```

> Response:

```
HTTP/1.1 200 OK
```

``` json
{
  "payments": [{
      "invoice_status": "Paid",
      "type": "Application",
      "invoice_number": 500,
      "amount": "49.99",
      "issue_date": "2012-09-25",
      "due_date": "2012-10-25",
      "payment_method": "check",
      "payment_date": "2012-09-05"
    }, {
      "invoice_status": "Paid",
      "type": "Enrollment",
      "invoice_number": 521,
      "amount": "200.0",
      "issue_date": "2013-10-03",
      "due_date": "2013-11-02",
      "payment_method": "cash",
      "payment_date": "2013-10-01"
    }
  ]
}
```


