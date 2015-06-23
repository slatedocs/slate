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
This endpoint retrieves a list of Application resources.


### Query Parameters

The following parameters may be used to filter the application resources in the response.

Parameter | Description | Example
----------|-------------------|----------
name | Returns application resource with specified name | "/?name=My%20New%20App"
priority | Returns a list of application resources with specified priority | "/?priority=0-none"
created | Returns a list of application resources created on the specified date | "/?created="
updated | Returns a list of application resources updated on the specified date
ordering | Returns a list of application resources ordered by the specified field. | "/?ordering=name"

---

### Expand Parameters

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
Expand Parameters allow you to request detailed information for specific resource fields.

See the [Expand Parameters](#expand-parameters) section for more details.

Parameter     | Description
--------------|------------------------------
business_unit | expands the business unit field in the application response object

---



### Include Parameters

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

Include Parameters allow you to request related resources.

See the [Include Parameters](#include-parameters) section for more details.

Parameter | Description
----------|---------------
projects  | includes a list of projects contained associated with an application


## Get a Specific Application

```http
GET /api/v2/applications/3 HTTP/1.1
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
        "slug": "application-test"
    }]
}
```

This endpoint retrieves a single application resource, as specified by the id parameter.

**`GET /applications/{application_id}`**

### URL Parameters

Parameter | Description
--------- | -----------
application_id | The id of the application to retrieve



## Create a New Application

```http
POST /api/v2/applications/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"

{
    "business_unit": 1,
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

Fields | Required | Description
-------|----------|-------------
name | Yes | The name of the new application
business_unit | Yes | The ID of the business unit the application belongs to


## Update an Application


```http
PUT /api/v2/applications/1/ HTTP/1.1
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

Update a single application by specifying a new name and new business unit. The application to update is identified by the id.

**`PUT /api/v2/applications/{application_id}/`**

### URL Parameters

Parameter| Description
---------|------------------
application_id | The id of the application to edit must be submitted in the request

### Payload

Fields | Required | Description
-------|----------|---------------
name | No | The name of the application can be changed to any other string
business_unit |  No | This can be edited by setting the business unit id
priority | No | The three options are: '0-none', '1-high', '2-medium', '3-low'



## Delete an Application

```http
DELETE /api/v2/applications/1/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"

```

```http
HTTP/1.1 200 OK
Content-Type: application/json
```

This endpoint deletes a single application resource, as specified by the id parameter.

**`DELETE /applications/{application_id}/`**

### URL Parameters

Parameter | Description
--------- | -----------
application_id | The id of the application to retrieve
