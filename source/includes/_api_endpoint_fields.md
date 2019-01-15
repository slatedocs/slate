## Fields

Use this endpoint to work with Mautic's contact/company fields.

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

// Get contact field context:
$fieldApi = $api->newApi("contactFields", $auth, $apiUrl);

// Or use 'companyFields' for company fields:
$fieldApi = $api->newApi("companyFields", $auth, $apiUrl);
```

### Get Field
```php
<?php

//...
$field = $fieldApi->get($id);
```
```json
{  
  "field":{  
    "isPublished":true,
    "dateAdded":"2016-11-10T13:02:52+00:00",
    "createdBy":1,
    "createdByUser":"John Doe",
    "dateModified":null,
    "modifiedBy":null,
    "modifiedByUser":null,
    "id":165,
    "label":"API test field",
    "alias":"api_test_field11",
    "type":"text",
    "group":null,
    "order":36,
    "object":"lead",
    "defaultValue":null,
    "isRequired":false,
    "isPubliclyUpdatable":false,
    "isUniqueIdentifier":0,
    "properties":[]
  }
}
```
Get an individual field by ID.

#### HTTP Request

`GET /fields/contact/ID` or `GET /fields/company/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Field Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the field
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the field should be published
publishDown|datetime/null|Date/time the field should be un published
dateAdded|datetime|Date/time field was created
createdBy|int|ID of the user that created the field
createdByUser|string|Name of the user that created the field
dateModified|datetime/null|Date/time field was last modified
modifiedBy|int|ID of the user that last modified the field
modifiedByUser|string|Name of the user that last modified the field
label|string|Name of the field
alias|string|Unique alias of the field used in the form field name attributes
description|string/null|Description of the field
type|string|Field type
group|string|Groupd of the fields where the field belongs 
order|int|Order number of the field
object|string|Which object use the field. Contact (lead) or Company.
defaultValue|string|Default value of the field.
isRequired|boolean|True if the field is required.
isPubliclyUpdatable|boolean|True if the field value can be changed from public requests. The tracking pixel query for example.
isUniqueIdentifier|boolean|True if the field is unique identifier and so the contacts should merge if the value of this field is the same.
properties|array|Field options if the field type needs some. 

### List Contact Fields

```php
<?php

//...
$fields = $fieldApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{  
  "total":71,
  "fields":[  
    {  
      "isPublished":true,
      "dateAdded":"2016-10-12T11:31:13+00:00",
      "createdBy":1,
      "createdByUser":"John Doe",
      "dateModified":"2016-10-12T11:31:30+00:00",
      "modifiedBy":1,
      "modifiedByUser":"John Doe",
      "id":100,
      "label":"Multiselect test",
      "alias":"multiselect_test",
      "type":"multiselect",
      "group":"core",
      "order":3,
      "object":"lead",
      "defaultValue":null,
      "isRequired":false,
      "isPubliclyUpdatable":false,
      "isUniqueIdentifier":false,
      "properties":{  
        "list":[  
          {  
            "label":"PHP",
            "value":"php"
          },
          {  
            "label":"JS",
            "value":"js"
          },
          {  
            "label":"English",
            "value":"en"
          }
        ]
      }
    },
    [...]
  ]
}
```

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

#### HTTP Request

`GET /fields/contact` or `GET /fields/company`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Field Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the field
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the field should be published
publishDown|datetime/null|Date/time the field should be un published
dateAdded|datetime|Date/time field was created
createdBy|int|ID of the user that created the field
createdByUser|string|Name of the user that created the field
dateModified|datetime/null|Date/time field was last modified
modifiedBy|int|ID of the user that last modified the field
modifiedByUser|string|Name of the user that last modified the field
label|string|Name of the field
alias|string|Unique alias of the field used in the form field name attributes
description|string/null|Description of the field
type|string|Field type
group|string|Groupd of the fields where the field belongs 
order|int|Order number of the field
object|string|Which object use the field. Contact (lead) or Company.
defaultValue|string|Default value of the field.
isRequired|boolean|True if the field is required.
isPubliclyUpdatable|boolean|True if the field value can be changed from public requests. The tracking pixel query for example.
isUniqueIdentifier|boolean|True if the field is unique identifier and so the contacts should merge if the value of this field is the same.
properties|array|Field options if the field type needs some. 

### Create Field
```php
<?php 

$data = array(
    'label' => 'API test field',
    'type' => 'text',
);

$field = $fieldApi->create($data);
```
**Multiselect Field**
```php
<?php

$data = array(
    'label' => 'API test field',
    'type' => 'multiselect',
    'isPubliclyUpdatable' => true,
    'properties' => array(
       'list' => array(
          array(
            'label' => 'label 1',
            'value' => 'value 1'
          ),
          array(
            'label' => 'label 2',
            'value' => 'value 2'
          )
        )
    )
);

$field = $fieldApi->create($data);

Create a new field.

#### HTTP Request

`POST /fields/contact/new` or `POST /fields/company/new`

**Post Parameters**

Name|Description
----|-----------
label|string|Name of the field
alias|string|Unique alias of the field used in the form field name attributes
description|string/null|Description of the field
type|string|Field type
group|string|Groupd of the fields where the field belongs 
order|int|Order number of the field
object|string|Which object use the field. Contact (lead) or Company.
defaultValue|string|Default value of the field.
isRequired|boolean|True if the field is required.
isPubliclyUpdatable|boolean|True if the field value can be changed from public requests. The tracking pixel query for example.
isUniqueIdentifier|boolean|True if the field is unique identifier and so the contacts should merge if the value of this field is the same.
properties|array|Field options if the field type needs some. 

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Field](#get-field).

### Edit Field
```php
<?php

$id   = 1;
$data = array(
    'label' => 'API test field',
    'type' => 'text',
);

// Create new a field of ID 1 is not found?
$createIfNotFound = true;

$field = $fieldApi->edit($id, $data, $createIfNotFound);
```
Edit a new field. Field that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a field if the given ID does not exist and clears all the field infieldation, adds the infieldation from the request.
**PATCH** fails if the field with the given ID does not exist and updates the field field values with the values field the request.

#### HTTP Request

To edit a field and return a 404 if the field is not found:

`PATCH /fields/contact/ID/edit` or `PATCH /fields/company/ID/edit`

To edit a field and create a new one if the field is not found:

`PUT /fields/contact/ID/edit` or `PUT /fields/company/ID/edit`

**Post Parameters**

Name|Description
----|-----------
label|string|Name of the field
alias|string|Unique alias of the field used in the form field name attributes
description|string/null|Description of the field
type|string|Field type
group|string|Groupd of the fields where the field belongs 
order|int|Order number of the field
object|string|Which object use the field. Contact (lead) or Company.
defaultValue|string|Default value of the field.
isRequired|boolean|True if the field is required.
isPubliclyUpdatable|boolean|True if the field value can be changed from public requests. The tracking pixel query for example.
isUniqueIdentifier|boolean|True if the field is unique identifier and so the contacts should merge if the value of this field is the same.
properties|array|Field options if the field type needs some. 

#### Response

If `PUT`, the expected response code is `200` if the field was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Field](#get-field).

### Delete Field
```php
<?php

$field = $fieldApi->delete($id);
```
Delete a field.

#### HTTP Request

`DELETE /fields/contact/ID/delete` or `DELETE /fields/company/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Field](#get-field).
