# Projects
Projects are used to group your [Sites](#sites).
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication)</aside>


## Get
Lists all projects of your account.

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
### HTTP Request

`GET https://platform-api.productsup.io/platform/v1/projects`

### Response fields
Field | Type | Description
------ | -------- | --------------
id | Integer | Internal ID
name | String | Name of the project
created_at | Date | Date of creation

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

The data to insert has to be provided as a JSON-Object
### Request fields
Field | Type | Description
------ | -------- | --------------
name | String | Name of the project

`ID` and `created_at` have to be empty, otherwise the values get overwritten, or the request may result in an error.

## Delete
### HTTP Request

`DELETE https://platform-api.productsup.io/platform/v1/projects/125`

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