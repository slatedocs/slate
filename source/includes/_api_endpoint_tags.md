## Tags
Use this endpoint to obtain details on Mautic's tags. Implemented in Mautic 2.12.0.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth        = new ApiAuth();
$auth            = $initAuth->newAuth($settings);
$apiUrl          = "https://your-mautic.com";
$api             = new MauticApi();
$tagApi = $api->newApi("tags", $auth, $apiUrl);
```

### Get Tag
```php
<?php

//...
$tag = $tagApi->get($id);
```
```json
{  
    "tag": {
        "id": 34,
        "tag": "tagA",
    }
}
```
Get an individual tag by ID.

#### HTTP Request

`GET /tags/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Tag Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the tag
tag|string|Title of the tag

### List Tags
```php
<?php
// ...

$tags = $tagApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{  
    "total":1,
    "tags":[  
        {
            "id": 34,
            "tag": "tagA",
        }
    ]
}
```
#### HTTP Request

`GET /tags`

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

Same as [Get Tag](#get-tag).

### Create Tag
```php
<?php

$data = array(
    'tag' => 'Tag A',
);

$tag = $tagApi->create($data);
```
Create a new tag.

#### HTTP Request

`POST /tags/new`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the tag
tag|string|Title of the tag

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Tag](#get-tag).

### Edit Tag
```php
<?php

$id   = 1;
$data = array(
    'tag' => 'Tag B',
);

// Create new a tag of ID 1 is not found?
$createIfNotFound = true;

$tag = $tagApi->edit($id, $data, $createIfNotFound);
```
Edit a new tag. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a tag if the given ID does not exist and clears all the tag information, adds the information from the request.
**PATCH** fails if the tag with the given ID does not exist and updates the tag field values with the values form the request.

#### HTTP Request

To edit a tag and return a 404 if the tag is not found:

`PATCH /tags/ID/edit`

To edit a tag and create a new one if the tag is not found:

`PUT /tags/ID/edit`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the tag
tag|string|Title of the tag

#### Response

If `PUT`, the expected response code is `200` if the tag was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Tag](#get-tag).

### Delete Tag
```php
<?php

$tag = $tagApi->delete($id);
```
Delete a tag.

#### HTTP Request

`DELETE /tags/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Tag](#get-tag).
