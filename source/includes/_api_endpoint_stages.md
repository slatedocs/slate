## Stages
Use this endpoint to obtain details on Mautic's contact stages.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$stageApi = $api->newApi("stages", $auth, $apiUrl);
```

### Get Stage
```php
<?php

//...
$stage = $stageApi->get($id);
```
```json
    "stage": {
        "id": 47,
        "isPublished": 1,
        "dateAdded": "2015-07-21T12:27:12-05:00",
        "createdBy": 1,
        "createdByUser": "Joe Smith",
        "dateModified": "2015-07-21T14:12:03-05:00",
        "modifiedBy": 1,
        "modifiedByUser": "Joe Smith",
        "name": "Stage A",
        "category": null,
        "description": "This is my first stage created via API.",
        "weight": 0,
        "publishUp": "2015-07-21T14:12:03-05:00",
        "publishDown": "2015-07-21T14:12:03-05:00"
    }
```
Get an individual stage by ID.

#### HTTP Request

`GET /stages/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Stage Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the stage
isPublished|boolean|Whether the stage is published
dateAdded|datetime|Date/time stage was created
createdBy|int|ID of the user that created the stage
createdByUser|string|Name of the user that created the stage
dateModified|datetime/null|Date/time stage was last modified
modifiedBy|int|ID of the user that last modified the stage
modifiedByUser|string|Name of the user that last modified the stage
name|string|Stage name
category|int|Stage category ID
description|string|Stage description
weight|int|Stage's weight
publishUp|datetime|Date/time stage should be published
publishDown|datetime|Date/time stage should be unpublished


### List Contact Stages

```php
<?php

//...
$stages = $stageApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
  "total": 4,
  "stages": [
    {
        "id": 47,
        "isPublished": 1,
        "dateAdded": "2015-07-21T12:27:12-05:00",
        "createdBy": 1,
        "createdByUser": "Joe Smith",
        "dateModified": "2015-07-21T14:12:03-05:00",
        "modifiedBy": 1,
        "modifiedByUser": "Joe Smith",
        "name": "Stage A",
        "category": null,
        "description": "This is my first stage created via API.",
        "weight": 0,
        "publishUp": "2015-07-21T14:12:03-05:00",
        "publishDown": "2015-07-21T14:12:03-05:00"
    },
    ...
  ]
}
```

#### HTTP Request

`GET /stages`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Stage Properties**

Name|Type|Description
----|----|-----------
total|int|Count of all stages
id|int|ID of the stage
isPublished|boolean|Whether the stage is published
dateAdded|datetime|Date/time stage was created
createdBy|int|ID of the user that created the stage
createdByUser|string|Name of the user that created the stage
dateModified|datetime/null|Date/time stage was last modified
modifiedBy|int|ID of the user that last modified the stage
modifiedByUser|string|Name of the user that last modified the stage
name|string|Stage name
category|int|Stage category ID
description|string|Stage description
weight|int|Stage's weight
publishUp|datetime|Date/time stage should be published
publishDown|datetime|Date/time stage should be unpublished

### Create Stage
```php
<?php 

$data = array(
    'name'        => 'Stage A',
    'weight'      => 5,
    'description' => 'This is my first stage created via API.',
    'isPublished' => 1
);

$stage = $stageApi->create($data);
```
Create a new stage.

#### HTTP Request

`POST /stages/new`

**Post Parameters**

Name|Description
----|-----------
name|Stage name is the only required field
weight|int|Stage's weight
description|A description of the stage.
isPublished|A value of 0 or 1

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Stage](#get-stage).

### Edit Stage
```php
<?php

$id   = 1;
$data = array(
    'name'        => 'New stage name',
    'isPublished' => 0
);

// Create new a stage of ID 1 is not found?
$createIfNotFound = true;

$stage = $stageApi->edit($id, $data, $createIfNotFound);
```
Edit a new stage. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a stage if the given ID does not exist and clears all the stage information, adds the information from the request.
**PATCH** fails if the stage with the given ID does not exist and updates the stage field values with the values form the request.

#### HTTP Request

To edit a stage and return a 404 if the stage is not found:

`PATCH /stages/ID/edit`

To edit a stage and create a new one if the stage is not found:

`PUT /stages/ID/edit`

**Post Parameters**

Name|Description
----|-----------
name|Stage name is the only required field
alias|Name alias generated automatically if not set
description|A description of the stage.
isPublished|A value of 0 or 1
weight|int|Stage's weight

#### Response

If `PUT`, the expected response code is `200` if the stage was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Stage](#get-stage).

### Delete Stage
```php
<?php

$stage = $stageApi->delete($id);
```
Delete a stage.

#### HTTP Request

`DELETE /stages/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Stage](#get-stage).

### Add Contact to a Stage

```php
<?php

//...
$response = $stageApi->addContact($stageId, $contactId);
if (!isset($response['success'])) {
    // handle error
}
```
```json
{
    "success": true
}
```

Manually add a contact to a specific stage.

#### HTTP Request

`POST /stages/STAGE_ID/contact/CONTACT_ID/add`

#### Response

`Expected Response Code: 200`

See JSON code example.


### Remove Contact from a Stage

```php
<?php

//...
$response = $stageApi->removeContact($stageId, $contactId);
if (!isset($response['success'])) {
    // handle error
}
```
```json
{
    "success": true
}
```

Manually remove a contact from a specific stage.

#### HTTP Request

`POST /stages/STAGE_ID/contact/CONTACT_ID/remove`

#### Response

`Expected Response Code: 200`

See JSON code example.
