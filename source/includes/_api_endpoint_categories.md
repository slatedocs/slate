## Categories
Use this endpoint to obtain details on Mautic's categories or to manipulate category memberships.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth    = new ApiAuth();
$auth        = $initAuth->newAuth($settings);
$apiUrl      = "https://your-mautic.com";
$api         = new MauticApi();
$categoryApi = $api->newApi("categories", $auth, $apiUrl);
```

### Get Category
```php
<?php

//...
$category = $categoryApi->get($id);
```
```json
{  
  "category":{  
    "id":221,
    "title":"test",
    "alias":"test4",
    "description":null,
    "color":null,
    "bundle":"asset"
  }
}
```
Get an individual category by ID.

#### HTTP Request

`GET /categories/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Category Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the category
isPublished|boolean|Whether the category is published
dateAdded|datetime|Date/time category was created
createdBy|int|ID of the user that created the category
createdByUser|string|Name of the user that created the category
dateModified|datetime/null|Date/time category was last modified
modifiedBy|int|ID of the user that last modified the category
modifiedByUser|string|Name of the user that last modified the category
title|string|The category title
alias|string|The category alias
description|string|The category description
color|string|The category color
bundle|string|The bundle where the category will be available

### List Contact Categories

```php
<?php

//...
$categories = $categoryApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{  
  "total":8,
  "categories":[  
    {  
      "id":1,
      "title":"Bold",
      "alias":"bold",
      "description":null,
      "color":"b36262",
      "bundle":"point"
    },
    [...]
  ]
}
```
Returns a list of contact categories available to the user. This list is not filterable.

#### HTTP Request

`GET /categories`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Category Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the category
isPublished|boolean|Whether the category is published
dateAdded|datetime|Date/time category was created
createdBy|int|ID of the user that created the category
createdByUser|string|Name of the user that created the category
dateModified|datetime/null|Date/time category was last modified
modifiedBy|int|ID of the user that last modified the category
modifiedByUser|string|Name of the user that last modified the category
title|string|The category title
alias|string|The category alias
description|string|The category description
color|string|The category color
bundle|string|The bundle where the category will be available

### Create Category
```php
<?php 

$data = array(
    'categoryname' => 'test',
    'categoryemail' => 'test@category.com',
    'categorycity' => 'Raleigh',
);

$category = $categoryApi->create($data);
```
Create a new category.

#### HTTP Request

`POST /categories/new`

**Post Parameters**

Name|Description
----|-----------
title|string|The category title
bundle|string|The bundle where the category will be available

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Category](#get-category).

### Edit Category
```php
<?php

$id   = 1;
$data = array(
    'title' => 'test',
    'bundle' => 'asset'
);

// Create new a category of ID 1 is not found?
$createIfNotFound = true;

$category = $categoryApi->edit($id, $data, $createIfNotFound);
```
Edit a new category. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a category if the given ID does not exist and clears all the category information, adds the information from the request.
**PATCH** fails if the category with the given ID does not exist and updates the category field values with the values form the request.

#### HTTP Request

To edit a category and return a 404 if the category is not found:

`PATCH /categories/ID/edit`

To edit a category and create a new one if the category is not found:

`PUT /categories/ID/edit`

**Post Parameters**

Name|Description
----|-----------
title|string|The category title
bundle|string|The bundle where the category will be available

#### Response

If `PUT`, the expected response code is `200` if the category was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Category](#get-category).

### Delete Category
```php
<?php

$category = $categoryApi->delete($id);
```
Delete a category.

#### HTTP Request

`DELETE /categories/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Category](#get-category).

### Assign a Category

To assign a category to an entity simply set `category = [ID]` to the payload. For example this is how a category 123 can be asssigned to a new Asset:

```php
$data = array(
    'title' => 'PDF sent as a API request',
    'storageLocation' => 'remote',
    'file' => 'https://www.mautic.org/media/logos/logo/Mautic_Logo_DB.pdf'
    'category' => 123
);

$asset = $assetApi->create($data);
```

The category must exist in the Mautic instance and the entity must support categories,
