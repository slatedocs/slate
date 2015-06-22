---
title: API Reference

language_tabs:
    - shell

toc_footers:
- <a href='https://github.com/sdelements'> Visit us on Github </a>

includes:
 - errors

search: true
---



# Introduction

Welcome to SD Elements API(v2)! Our API provides RESTful HTTP access to a large part of the functionality of SD Elements.

SD Elements's API documentation page was created with [Slate](http://github.com/tripit/slate)

### Resources

The most common types of resources obtained from this API are *Collections* and *Elements*.  A collection resource represents the set of all objects of one type (such as "projects" or "applicatoins").An element resource represents an individual member of a collection.  Each element consists of a set of name/value pairs.


### API Format

API results are currently returned in XML and JSON formats.  It is advised to use the JSON format only.Specify the JSON format by including the HTTP header in all requests:


`Content-type: application-json`

## Include & Expand Options

Some endpoints allow users to *include* or *expand* certain objects included in the response object.

* **Include**: Used to add a specific field to an element, or collection of elements. *For example, we may wish to receive a collection of projects that are within an application element.  Since projects are normally not a field of the applications element, we can include projects in our request to see it as a field.*

`/?include={field_to_include}`

* **Expand**: Used to expand a given field of an element into a nested element with more information. *For example, by default, an application element contains the id of the business unit to which it belongs.  If we wish to retreive more information about the business unit, we would expand the business unit field get more information.*

`/?expand={field_to_expand}`

**It is possible to include and expand more than one field simultaneously.**

`/?include={field1},{field2}&expand={field3},{field4}`




# Authentication

> To authorize, use this code:


```shell
# With your shell, you can just pass the correct header with each request
curl "api_endpoint_here"
    -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```

> Make sure to replace `xxxxxxxxxxxxxxxxxxxxx` with your API key.

`Authorization: Token xxxxxxxxxxxxxxxxxxxxx`

<aside class="notice">
Replace <code>xxxxxxxxxxxxxxxxxxxxx</code> with your personal APIv2 token.
</aside>

A token can be generated as follows:

* Go to the menu option in the top right of SD Elements: <your name>/API Settings
* Select the APIv2 tab and click on the Generate Token Button.
* The token will be displayed **only once**.





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







# Tasks


## Get all tasks of a project



```shell
curl "http://example.com/api/v2/projects/1/tasks/"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```
> The above command returns JSON structured like this:

```json
{
    "results": [{
        "id": "1-T2",
        "task_id": "T2",
        "url": "http://example.com/bunits/new-business-unit/.../tasks/phase/requirements/1-T2",
        "title": "Secure forgotten password",
        "description": "Insecure forgotten password and password reset...",
        "priority": 8,
        "phase": "Requirements",
        "ad_hoc": false,
        "relevant": true,
        "accepted": true,
        "assigned_to": [],
        "updated": "2015-06-16T19:37:44.710100Z",
        "library_task_created": "2015-06-16T19:36:57.863684Z",
        "library_task_updated": "2015-06-16T19:36:57.836874Z",
        "verification_status": null,
        "status": "TODO",
        "note_count": 0,
        "artifact_proxy": null
    }]
}

```


Will return a list of tasks associated with the project having id "project_id".

### HTTP Request

`GET /api/v2/projects/{project_id}/tasks/`


## - Include & Expand Options

```shell
curl "http://example.com/api/v2/projects/1/tasks/?include=problem"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```

> The above command returns JSON structured like this:


```json
{
    "results": [{
        "id": "1-T2",
        "task_id": "T2",
        "url": "http://example.com/bunits/new-business-unit/.../tasks/phase/requirements/1-T2",
        "title": "Secure forgotten password",
        "description": "Insecure forgotten password and password reset mechanisms...",
        "priority": 8,
        "phase": "Requirements",
        "ad_hoc": false,
        "relevant": true,
        "accepted": true,
        "status": "TODO",
        "problem": {
            "id": "P526",
            "title": "P526: Weak Password Recovery Mechanism for Forgotten Password",
            "content": "It is common for an application..."
        }
    }]
}
```

> Notice how the "problem" field, previously not included in the response object, is now included.

The following parameters may be [included](#include-&-expand-options) in the tasks request:

* tags
* related
* problem
* how_tos


```shell
curl "http://example.com/api/v2/projects/1/tasks/?include=problem&expand=status"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```

> The above command returns JSON structured like this:


```json
{
    "results": [{
        "id": "1-T2",
        "task_id": "T2",
        "url": "http://example.com/bunits/new-business-unit/.../tasks/phase/requirements/1-T2",
        "title": "Secure forgotten password",
        "description": "Insecure forgotten password and password reset mechanisms ...",
        "priority": 8,
        "phase": "Requirements",
        "ad_hoc": false,
        "relevant": true,
        "accepted": true,
        "status": {
            "meaning": "TODO",
            "icon": "clock-o",
            "name": "Incomplete",
            "slug": "TODO"
        },
        "problem": {
            "id": "P526",
            "title": "P526: Weak Password Recovery Mechanism for Forgotten Password",
            "content": "It is common for an application..."
        }
    }]
}

```

The following parameters may be [expanded](#include-&-expand-options) in the tasks request:

* status
* description







# Help

If you have any questions/feedback regarding the SD Elements APIv2, please reach out to us.  *We're here to help.*

SD Elements Support: support@sdelements.com


