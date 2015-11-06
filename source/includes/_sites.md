# Sites

Sites are the smallest entity, below projects and have one data source and may have several exports/channels
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication)</aside>


## Get
To list all sites of your account, or only certain sites, you can use get.

```php
<?php
// our php client builds the urls for you, but you have to set the infos to the classes:

$siteService = new \Productsup\Service\Sites($client);

// sending the actual request
$list = $siteService->get();
print_r($list);

// or requesting it by reference/a tag:
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey('tagname');
$reference->setValue('123abc');
$list = $siteService->setReference($reference);

// or requesting the site by its id:
$list = $siteService->get(123);

/*
result will look like this:
Array
(
    [0] => Productsup\Platform\Site Object
        (
            [id] => 123
            [title] => site 1
            [created_at] => 2015-01-01 11:22:33
            [project_id] => 321
            [links:protected] => Array(...)
            [reference:protected] =>
        )
    ...
*/
```

```shell
# requesting a list of all your sites
curl https://platform-api.productsup.io/platform/v1/sites

# requesting a list of all your sites within one project
curl https://platform-api.productsup.io/platform/v1/projects/321/sites

# requesting sites by tag
curl https://platform-api.productsup.io/platform/v1/sites/tagname:tagValue

# requesting one site by its ID
curl https://platform-api.productsup.io/platform/v1/sites/123


```

```shell
response:
{
    "success": true,
    "Sites": [{
                "id": "123",
                "title": "site 1",
                "created_at": "2015-01-01 11:22:33",
                "project_id": "321",
                "links": [...]
            },
            ...
    ]
}
```
### HTTP Request

`GET https://platform-api.productsup.io/platform/v1/sites`

`GET https://platform-api.productsup.io/platform/v1/projects/321/sites`

### Response fields
Field | Type | Description
------ | -------- | --------------
id | Integer | Internal ID
title | String | Name of the site
created_at | Date | Date of creation
project_id | Integer | ID of the project this site belongs to
links | Array | Array of relevant resources


## Create
To create a new site, you can use a POST request (or the insert method).

```shell
 curl
    -d '{"title":"example site","reference":"myReferenceKey:myReference1234"}'
    https://platform-api.productsup.io/platform/v1/projects/321/sites


# result:
{
    "success": true,
    "Sites": [{
        "id": 125,
        "title": "example site",
        "created_at": "2015-07-30 12:54:52",
        "project_id": 321,
        "links": [...]
    }]
}
```

```php
<?php
$SitesService = new Productsup\Service\Sites($Client);
$project = new \Productsup\Platform\Project();
$project->id = 321;
$SitesService->setProject($project);
$siteObject = new \Productsup\Platform\Site();
$siteObject->title = 'new example site';
/* optional
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey('myReferenceKey');
$reference->setValue('myReference1234');
$siteObject->addReference($reference);
*/

$result = $SitesService->insert($siteObject);
print_r($result);
/**
result:
Productsup\Platform\Site Object
(
    [id] => 125
    [title] => new example site
    [created_at] => 2015-07-30 12:54:52
    [project_id] => 321
)

*/
```

### HTTP Request

`POST https://platform-api.productsup.io/platform/v1/projects/321/sites`

The data to insert has to be provided as a JSON-Object
### Request fields
Field | Type | Description
------ | -------- | --------------
title | String | Name of the site
project_id | Integer | ID of the project this site belongs to

`ID` and `created_at` have to be empty, otherwise the values get overwritten, or the request may result in an error.
The `project_id` may be also included in the URL, like in the example above.

## Delete
### HTTP Request

`DELETE https://platform-api.productsup.io/platform/v1/sites/125`

```shell
curl -X DELETE https://platform-api.productsup.io/platform/v1/sites/125
# response:
{"success":true}
```

```php
<?php
$SitesService = new Productsup\Service\Sites($Client);
$result = $siteService->delete(125); // id fetched from API
// result is true, if the delete was successful
```