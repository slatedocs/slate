# Sites

Sites are the smallest entity, below projects and have one data source and may have several exports/channels
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication).</aside>


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
curl https://platform-api.productsup.io/platform/v2/sites

# requesting a list of all your sites within one project
curl https://platform-api.productsup.io/platform/v2/projects/321/sites

# requesting sites by tag
curl https://platform-api.productsup.io/platform/v2/sites/tagname:tagValue

# requesting one site by its ID
curl https://platform-api.productsup.io/platform/v2/sites/123


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
### HTTP Request - All sites for your account
`GET https://platform-api.productsup.io/platform/v2/sites`

### <a name="sites-request-by-project"></a> HTTP Request - All sites for a specific project
`GET https://platform-api.productsup.io/platform/v2/projects/<projectId>/sites`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
projectId | integer | Project to list sites for

### HTTP Request - Get a site by it's tag
`GET https://platform-api.productsup.io/platform/v2/sites/<tagName>:<tagValue>`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
tagName | string | Name of the tag for the site
tagValue | string | Value of the tag for the site

### <a name="sites-request-by-id"></a> HTTP Request - Get a site by it's identifier
`GET https://platform-api.productsup.io/platform/v2/sites/<siteId>`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
siteID | integer | Site to list

### <a name="sites-response"></a> Response fields
Field | Type | Description
------ | -------- | --------------
status | boolean | Indicates request status
Sites | array | List of [sites](#sites-response-site)

#### <a name="sites-response-site"></a> Site fields
Field | Type | Description
------ | -------- | --------------
id | integer | Site identifier
title | string | Name of the site
created_at | date | Date of creation
project_id | integer | Identifier of the project this site belongs to
import_schedule | string | Import schedule
links | array | List of [relevant resources](#sites-response-links)

#### <a name="sites-response-links"></a> Links fields and values
Name | Description
--- | ---
self | Link to [current site detail](#sites-request-by-id)
tags | Link to a list of tags belonging to the site
project | Link to [project](#project-request-by-id)

## Create
To create a new site, you can use a POST request (or the insert method).

```shell
 curl
    -d '{"title":"example site","reference":"myReferenceKey:myReference1234"}'
    https://platform-api.productsup.io/platform/v2/projects/321/sites


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
$SitesService = new \Productsup\Service\Sites($Client);
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

`POST https://platform-api.productsup.io/platform/v2/sites`

`POST https://platform-api.productsup.io/platform/v2/projects/<projectId>/sites`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
projectId | integer | Project under which to add the site. Required unless set in request body.

#### HTTP headers
Name | Value
--- | ---
Content-Type | application/json

The data to be inserted has to be provided as a JSON-Object.

#### Request body fields
Field | Type | Description
------ | -------- | --------------
title | string | Name of the site
reference | string | Textual site reference, consisting of tagName and tagValue
project_id | integer | Project under which to add the site. Required unless provided in URL.

`ID` and `created_at` have to be empty, otherwise the values get overwritten, or the request may result in an error.

### Response fields
See [response fields](#sites-response)

#### <a name="sites-response-site"></a> Site fields
See [site fields](#sites-response-site)

#### <a name="sites-response-links"></a> Links fields and values
See [link fields](#sites-response-links)

## Edit
To edit an existing site, you can use a PUT request as follows:

```shell
 curl
    -d '{"id": "1", "project_id": "1", "title":"My test site", "import_schedule": "TZ=Europe/Berlin\nH 2,6,19,22 * * 2,4,6"}'
    https://platform-api.productsup.io/platform/v2/projects/1/sites/1


# result:
{
    "success": true,
    "Sites": [{
	    "id": "1",
	    "title": "My test site",
	    "created_at": "2015-07-30 12:54:52",
	    "project_id": "1",
	    "import_schedule": "TZ=Europe\/Berlin\nH 2,6,19,22 * * 2,4,6\nH * * * *",
	    "created_at": "2015-07-30 12:54:52",
	    "links": [...]
    }]
}
```

### HTTP Request

`PUT https://platform-api.productsup.io/platform/v2/sites/<siteId>`

`PUT https://platform-api.productsup.io/platform/v2/projects/<projectId>/sites/<siteId>`

#### URL parameters
Field | Type | Description
------ | -------- | --------------
projectId | integer | Project under which to edit the site.
siteId | integer | Existing site that is being edited.

#### HTTP headers
Name | Value
--- | ---
Content-Type | application/json

The data to be inserted has to be provided as a JSON-Object.

#### Request body fields
Field | Type | Description
------ | -------- | --------------
id | integer | Existing site that will be edited.
project_id | integer | Project under which to edit the site.
title | string | Name of the site
import_schedule | string | A cron entry that sets the scheduling for data import.

### Response fields
See [response fields](#sites-response)

#### <a name="sites-response-site"></a> Site fields
See [site fields](#sites-response-site)

#### <a name="sites-response-links"></a> Links fields and values
See [link fields](#sites-response-links)

## Delete
### HTTP Request

`DELETE https://platform-api.productsup.io/platform/v2/sites/<siteId>`

#### URL parameters
Field | Type | Description
--- | --- | ---
siteId | integer | Site to delete

### Response body fields
Field | Type | Description
--- | --- | ---
success | boolean | Indicates the success of the action

```shell
curl -X DELETE https://platform-api.productsup.io/platform/v2/sites/125
# response:
{"success":true}
```

```php
<?php
$SitesService = new Productsup\Service\Sites($Client);
$result = $siteService->delete(125); // id fetched from API
// result is true, if the delete was successful
```
