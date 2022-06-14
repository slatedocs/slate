## Assets

Use this endpoint to obtain details on Mautic's assets. 

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$assetApi = $api->newApi("assets", $auth, $apiUrl);

```

### Get Asset
```php
<?php

//...
$asset = $assetApi->get($id);
```
```json
{
    "asset": {
        "id": 1,
        "title": "Product Whitepaper",
        "description": "Some description",
        "alias": "whitepaper",
        "language": "en",
        "isPublished": true,
        "publishUp": "2015-06-07T06:28:27+00:00",
        "publishDown": "2015-06-30T06:28:27+00:00",
        "dateAdded": "2015-06-07T06:28:27+00:00",
        "createdBy": 1,
        "createdByUser": "Joe Smith",
        "dateModified": "2015-06-010T09:30:47+00:00",
        "modifiedBy": 1,
        "modifiedByUser": "Joe Smith",
        "downloadCount": 10,
        "uniqueDownloadCount": 8,
        "revision": 1,
        "category": {
            "createdByUser": "John Doe",
            "modifiedByUser": "John Doe",
            "id": 19,
            "title": "test",
            "alias": "test",
            "description": null,
            "color": null,
            "bundle": "asset"
        },
        "extension": "pdf",
        "mime": "application/pdf",
        "size": 269128,
        "downloadUrl": "https://your-mautic.com/asset/1:whitepaper"
    }
}
```
Get an individual asset by ID.

#### HTTP Request

`GET /assets/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Asset Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the asset
title|string|Title/name of the asset
description|string/null|Description of the asset
alias|string|Used to generate the URL for the asset
language|string|Locale of the asset
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the asset should be published
publishDown|datetime/null|Date/time the asset should be un published
dateAdded|datetime|Date/time asset was created
createdBy|int|ID of the user that created the asset
createdByUser|string|Name of the user that created the asset
dateModified|datetime/null|Date/time asset was last modified
modifiedBy|int|ID of the user that last modified the asset
modifiedByUser|string|Name of the user that last modified the asset
downloadCount|int|Total number of downloads
uniqueDownloadCount|int|Unique number of downloads
revision|int|Revision version
category|object/null|Object with the category details
extension|string|Extension of the asset
mime|string|Mime type of the asset
size|int|Filesize of the asset in bytes
downloadUrl|string|Public download URL for the asset

### List Assets
```php
<?php
// ...

$assets = $assetApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
    "total": 1,
    "assets": [
        {
            "id": 1,
            "title": "Product Whitepaper",
            "description": "Some description",
            "alias": "whitepaper",
            "language": "en",
            "isPublished": true,
            "publishUp": "2015-06-07T06:28:27+00:00",
            "publishDown": "2015-06-30T06:28:27+00:00",
            "dateAdded": "2015-06-07T06:28:27+00:00",
            "createdBy": 1,
            "createdByUser": "Joe Smith",
            "dateModified": "2015-06-010T09:30:47+00:00",
            "modifiedBy": 1,
            "modifiedByUser": "Joe Smith",
            "downloadCount": 10,
            "uniqueDownloadCount": 8,
            "revision": 1,
            "category": null,
            "extension": "pdf",
            "mime": "application/pdf",
            "size": 269128,
            "downloadUrl": "https://your-mautic.com/asset/1:whitepaper"
        }
    ]
}
```
#### HTTP Request

`GET /assets`

**Query Parameters**

Name|Description
----|-----------
search|String or search command to filter entities by.
start|Starting row for the entities returned. Defaults to 0.
limit|Limit number of entities to return. Defaults to the system configuration for pagination (30).
orderBy|Column to sort by. Can use any column listed in the response.
orderByDir|Sort direction: asc or desc.
publishedOnly|Only return currently published entities.
minimal|Return only array of entities without additional lists in it.

#### Response

`Expected Response Code: 200`

See JSON code example.

**Properties**

Same as [Get Asset](#get-asset).

### Create Asset
```php
<?php 

/**
 * Local asset example
 */
// Upload a local file first
$apiContextFiles = $this->getContext('files');
$apiContextFiles->setFolder('assets');
$fileRequest = array(
    'file' => dirname(__DIR__).'/'.'mauticlogo.png'
);
$response = $apiContextFiles->create($fileRequest);

$data = array(
    'title' => 'Mautic Logo sent as a API request',
    'storageLocation' => 'local',
    'file' => $response['file']['name']
);

$asset = $assetApi->create($data);


/**
 * Remote asset example
 */
$data = array(
    'title' => 'PDF sent as a API request',
    'storageLocation' => 'remote',
    'file' => 'https://www.mautic.org/media/logos/logo/Mautic_Logo_DB.pdf'
);

$asset = $assetApi->create($data);

```
Create a new asset. There are 2 options: local or remote asset.

#### HTTP Request

`POST /assets/new`

**Post Parameters**

Name|Description
----|-----------
title|string|Asset title
storageLocation|string|Storage location can be local or remote
file|string|Either URL for remote file or file name for local file.

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Asset](#get-asset).

### Edit Asset
```php
<?php

$id   = 1;
$data = array(
    'type' => 'general',
);

// Create new a asset of ID 1 is not found?
$createIfNotFound = true;

$asset = $assetApi->edit($id, $data, $createIfNotFound);
```
Edit a new asset. Asset that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a asset if the given ID does not exist and clears all the asset information, adds the information from the request.
**PATCH** fails if the asset with the given ID does not exist and updates the asset field values with the values form the request.

#### HTTP Request

To edit a asset and return a 404 if the asset is not found:

`PATCH /assets/ID/edit`

To edit a asset and create a new one if the asset is not found:

`PUT /assets/ID/edit`

**Post Parameters**

Name|Description
----|-----------
title|string|Asset title
storageLocation|string|Storage location can be local or remote
file|string|Either URL for remote file or file name for local file.

#### Response

If `PUT`, the expected response code is `200` if the asset was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Asset](#get-asset).

### Delete Asset
```php
<?php

$asset = $assetApi->delete($id);
```
Delete a asset. In case of local storage location, the local file will be deleted as well.

#### HTTP Request

`DELETE /assets/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Asset](#get-asset).
