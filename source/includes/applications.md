# Applications

## Get All Applications

```shell
curl "http://example.com/api/v2/applications"
  -H "Token xxxxxxxxxxxxxxxxxxxxx"
```
> The above command returns JSON structured like this:

```json
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
This endpoint retrieves all application objects.

### HTTP Request

`GET http://example.com/api/v2/applications`



## - Include Options

```shell
curl "http://example.com/api/v2/application/?include=projects"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```

> The above command returns JSON structured like this:

```json
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

The following fields may be [included](#include-&-expand-options) in the applications request:

* projects

Notice how a list of project objects, which were previously not included in the applications request, are now embedded in the returned application objects.

### HTTP Request

`GET http://example.com/api/v2/application/?include=projects`



## - Expand Options

```shell
curl "http://example.com/api/v2/application/?expand=business_units"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```

> The above command returns JSON structured like this:

```json
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

The following fields may be [expanded](#include-&-expand-options) in the applications request:

* business_unit

### HTTP Request

`GET http://example.com/api/v2/application/?expand=business_unit`


## Get a Specific Application

```shell
curl "http://example.com/api/v2/application/:3"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```

> The above command returns JSON structured like this:

```json
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

This endpoint retrieves a single application, as specified by the id parameter.

### HTTP Request

`GET http://example.com/application/:{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the application to retrieve



## Create a New Application

```shell
curl –X POST -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx" -H
"Content-type: application/json"
"https://example.com/api/v2/applications/" --data '{"name":"API Test"}'
```

> The above command returns JSON structured like this:

```json
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

### HTTP Request

`POST /api/v2/applications/`

Fields | Required| Description
-------|----------|-------------
name | Yes | The name of the new application
business_unit| Yes |The ID of the business unit the application belongs to


## Edit an Application


```shell
curl –X PUT -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx" -H
"Content-type: application/json"
"https://example.com/api/v2/applications/1/" --data '{"name":"Edit Test", "business_unit":2}'
```

> The above command returns JSON structured like this:

```json
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

### HTTP Request

`PUT https://example.com/api/v2/applications/{id}`
