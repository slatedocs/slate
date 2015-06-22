# Applications

## Get All Applications

```http
GET /api/v2/applications/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [{
        "id": 1,
        "business_unit": 1,
        "name": "Application Test",
        "created": "2015-04-15T20:27:24.396442Z",
        "updated": "2015-04-15T20:27:24.389957Z",
        "priority": "0-none",
        "slug": "application-test"
    }]
}
```
This endpoint retrieves a list of application objects.

**HTTP Request:** `GET http://example.com/api/v2/applications`

---

### Include & Expand Options


```http
GET /api/v2/applications/?include=projects HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [{
        "id": 3,
        "business_unit": 1,
        "name": "Application Test",
        "created": "2015-04-15T20:27:24.396442Z",
        "updated": "2015-04-15T20:27:24.389957Z",
        "priority": "0-none",
        "slug": "application-test",
        "projects": [
            {"name": "Project 1", "slug": "project-1"},
            {"name": "Project 2", "slug": "project-2"}
        ]
    }]
}
```


```http
GET /api/v2/applications/?expand=business_units HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [{
        "id": 3,
        "business_unit":  {
            "id": 1,
            "name": "Business Unit 1",
            "slug": "business-unit-1"
        },
        "name": "Application Test",
        "created": "2015-04-15T20:27:24.396442Z",
        "updated": "2015-04-15T20:27:24.389957Z",
        "priority": "0-none",
        "slug": "application-test"
    }]
}
```
See the [Include and Expand Options](#include-&-expand-options) section for a fuller discussion on their functionality.

Include

Field | Description
------|------------------------------
projects | something ehre

Expand

Field | Description
------|------------------------------
business_unit | The business unit the application belongs to

## Get a Specific Application

```http
POST /api/v2/applications/:3 HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"



```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [{
        "id": 3,
        "business_unit": 1,
        "name": "Application Test",
        "created": "2015-04-15T20:27:24.396442Z",
        "updated": "2015-04-15T20:27:24.389957Z",
        "priority": "0-none",
        "slug": "application-test"
    }]
}
```

This endpoint retrieves a single application resource, as specified by the id parameter.

**HTTP Request:** `GET http://example.com/application/:{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the application to retrieve



## Create a New Application

```http
POST /api/v2/applications/?expand=business_units HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"

{
    "name":"API Test"
}

```

```http
HTTP/1.1 200 OK
Content-Type: application/json


{
    "results": [{
        "id": 3,
        "business_unit": 1,
        "name": "API Test",
        "created": "2015-04-15T20:27:24.396442Z",
        "updated": "2015-04-15T20:27:24.389957Z",
        "priority": "0-none",
        "slug": "api-test"
    }]
}
```

**HTTP Request:** `POST /api/v2/applications/`

Fields | Required| Description
-------|----------|-------------
name | Yes | The name of the new application
business_unit| Yes |The ID of the business unit the application belongs to


## Edit an Application


```http
POST /api/v2/applications/1/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"

{
    "name": "Edit Test",
    "business_unit": 2
}

```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [{
        "id": 1,
        "business_unit": 2,
        "name": "Edit Test",
        "created": "2015-06-18T19:27:14.860536Z",
        "updated": "2015-06-18T21:00:03.827952Z",
        "priority": "0-none",
        "slug": "api-test"
    }]
}
```

Edit a single application.  The application to edit is identified by the id.


Fields | Required | Description
-------|----------|---------------
id | Yes | The id of the application to edit must be submitted in the request
name | No | The name of the application can be changed to any other string
business unit|  No| This can be edited by setting the business unit id
priority| No| The three options are: '0-none', '1-high', '2-medium', '3-low'

**HTTP Request:** `PUT https://example.com/api/v2/applications/{id}`
