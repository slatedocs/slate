# Channel History
 
With the channel history, you can get information on the last exports of a channel

## Get
To list the history, you can 

```php
<?php
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey(\Productsup\Platform\Site\Reference::REFERENCE_SITE);
$reference->setValue(123); // site id
$channelService = new \Productsup\Service\Channels($client);
$channelService->setReference($reference);
$channels = $channelService->get(321,'history');

/*
result will look like this:
Array
(
    [0] => Productsup\Platform\Channel Object
        (
            [id] => 2116
            [site_id] => 368693
            [name] => Criteo DE
            [export_name] => FusePump Criteo
            [history] => Array
                (
                    [0] => Array
                        (
                            [id] => 25190
                            [site_id] => 368693
                            [site_channel_id] => 2116
                            [export_time] => 2015-08-27 16:22:57
                            [export_start] => 2015-08-27 16:22:55
                            [product_count] => 20562
                            [product_count_now] => 20562
                            [product_count_previous] => 0
                            [process_status] => 0
                            [pid] => 55df182bde8e8
                            [product_count_new] => 0
                            [product_count_modified] => 0
                            [product_count_deleted] => 0
                            [product_count_unchanged] => 0
                            [uploaded] => 0
                        )

                    [1] => Array
                        (
                            [id] => 25163
                            [site_id] => 368693
                            [site_channel_id] => 2116
                            [export_time] => 2015-08-27 15:48:03
                            [export_start] => 2015-08-27 15:48:02
                            [product_count] => 20562
                            [product_count_now] => 20562
                            [product_count_previous] => 0
                            [process_status] => 0
                            [pid] => 55df10f8c89d2
                            [product_count_new] => 0
                            [product_count_modified] => 0
                            [product_count_deleted] => 0
                            [product_count_unchanged] => 0
                            [uploaded] => 0
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

`GET https://platform-api.productsup.io/platform/v1/sites/123/channels`

`GET https://platform-api.productsup.io/platform/v1/sites/123/channels/321`

### Response fields
Field | Type | Description
------ | -------- | --------------
id | Integer | Internal ID
site_id | String | ID of the referenced site
name | String | Name of the export you provided while creating the channel
export_name | String | Generic name of the export in the productsup system
history | Array | see [History](#sites)


## Create
To create a new site, you can use a POST request (or the insert method).

```shell
 curl 
    -d '{"title":"test"}' 
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