# Projects

## Get All Projects

```http
GET /api/v2/projects/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [{
        "id": 1936,
        "slug": "project-test",
        "application": 1280,
        "archived": false,
        "name": "Project Test",
        "creator": "geoff+demo@sdelements.com",
        "description": "API Project",
        "tags": [],
        "created": "2015-04-15T19:30:04.132712Z",
        "updated": "2015-04-15T19:57:15.042353Z"
    }]
}
```
This endpoint retrieves a list of Project resources.

## Get a Specific Project

```http
GET /api/v2/projects/1936/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": 1936,
    "slug": "api-test",
    "application": 1280,
    "archived": false,
    "name": "API Test",
    "creator": "geoff+demo@sdelements.com",
    "description": "API Project",
    "tags": [],
    "created": "2015-04-15T19:30:04.132712Z",
    "updated": "2015-04-15T19:57:15.042353Z"
}
```

This endpoint retrieves a single Project resource, as specified by the id parameter.

**HTTP Request:**

`GET /projects/{id}/`

**URL Parameters:**

Parameter | Description
--------- | -----------
id        | The id of the Project to retrieve



## Create a New Project

```http
POST /api/v2/projects/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"

{
    "application": 1280,
    "name":"API Test"
}

```

```http
HTTP/1.1 200 OK
Content-Type: application/json


{
    "id": 1936,
    "slug": "api-test",
    "application": 1280,
    "archived": false,
    "name": "API Test",
    "creator": "geoff+demo@sdelements.com",
    "description": "API Project",
    "tags": [],
    "created": "2015-04-15T19:30:04.132712Z",
    "updated": "2015-04-15T19:57:15.042353Z"
}
```

Fields | Required | Description
-------|----------|-------------
name | Yes | The name of the new project
application | Yes | The ID of the application the project belongs to
