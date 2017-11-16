# Projects
Projects are used to group your [Sites](#sites).
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication)</aside>

## Get
Lists all or one projects of your account.

For both requests the response looks identical. Except when request a specific project it will just list the one project.

```php
<?php
$projectService = new Productsup\Service\Projects($Client);
$projects = $projectService->get();
print_r($projects);

/*
result will look like this:
Array
(
    [0] => Productsup\Platform\Project Object
        (
            [id] => 1
            [name] => default project
            [created_at] => 2013-03-21 12:47:57
        )
    ...
)

```

```shell
# requesting a list of all your projects
curl https://platform-api.productsup.io/platform/v1/projects
```

```shell
# requesting one of projects
curl https://platform-api.productsup.io/platform/v1/projects/1
```

```shell    
response: 
{
    "success": true,
    "Projects": [{
                "id": "1",
                "name": "default project",
                "created_at": "2013-03-21 12:47:57",
                "links": [...]
            }, 
            ...
    ]
}
```
### HTTP Request - All projects for your account

`GET https://platform-api.productsup.io/platform/v1/projects`

### <a name="project-request-by-id"></a> HTTP Request - Get a project by it's identifier

`GET https://platform-api.productsup.io/platform/v1/projects/<projectId>`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
projectId | integer | Project to list

### Response fields
Field | Type | Description
------ | -------- | --------------
status | boolean | Indicates request status
projects | array | List of [projects](#project-response-project)

#### <a name="project-response-project"></a> Project fields
Field | Type | Description
--- | --- | ---
id | integer | Internal ID
name | string | Name of the project
created_at | date | Date of creation
links | array | List of [relevant resources](#project-response-links)

#### <a name="project-response-links"></a> Links fields and values
Name | Description
--- | ---
self | Link to the [project detail endpoint](#project-request-by-id)
sites | Link to a [list of sites belonging to the project](#sites-request-by-project)

## Create
To create a new project, you can use a POST request (or the insert method).

```shell
 curl 
    -d '{"name":"test project"}' 
    https://platform-api.productsup.io/platform/v1/projects


# result:
{
    "success": true,
    "Sites": [{
        "id": 125,
        "name": "test project",
        "created_at": "2015-07-30 12:54:52",
        "links": [...]
    }]
}
```

```php
<?php
$projectService = new Productsup\Service\Projects($Client);
$project = new Productsup\Platform\Project();
$project->name = "test project";
$projectService->insert($project);
print_r($result); 
/**
result:
Productsup\Platform\Project Object
        (
            [id] => 125
            [name] => test project
            [created_at] => 2015-07-30 12:54:52
        )
*/
```

### HTTP Request

`POST https://platform-api.productsup.io/platform/v1/projects`

#### HTTP headers
Name | Value
--- | ---
Content-Type | application/json

The data to be inserted has to be provided as a JSON-Object.

### Request body fields
Field | Type | Description
------ | -------- | --------------
name | String | Name of the project

`ID` and `created_at` have to be empty, otherwise the values get overwritten, or the request may result in an error.

### Response fields
Field | Type | Description
------ | -------- | --------------
status | boolean | Indicates request status
Sites | array | Details of the [created project](#project-response-project)

#### Project fields
See [project fields](#project-response-project)

#### Links fields and values
See [link fields](#project-response-links)

## Delete
### HTTP Request

`DELETE https://platform-api.productsup.io/platform/v1/projects/<projectId>`

### URL parameters
Field | Type | Description
--- | --- | ---
projectId | integer | Project to delete

### Response body fields
Field | Type | Description
--- | --- | ---
success | boolean | Indicates the success of the action

```shell
curl -X DELETE https://platform-api.productsup.io/platform/v1/projects/125
# response:
{"success":true}
```

```php
<?php
$SitesService = new Productsup\Service\Projects($Client);
$result = $siteService->delete(125); // id fetched from API
// result is true, if the delete was successful
```
