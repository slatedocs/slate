## Segments
Use this endpoint to obtain details on Mautic's contact segments or to manipulate contact memberships.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth   = new ApiAuth();
$auth       = $initAuth->newAuth($settings);
$apiUrl     = "https://your-mautic.com";
$api        = new MauticApi();
$segmentApi = $api->newApi("segments", $auth, $apiUrl);
```

### Get Segment
```php
<?php

//...
$segment = $segmentApi->get($id);
```
```json
    "list": {
        "id": 47,
        "isPublished": 1,
        "dateAdded": "2015-07-21T12:27:12-05:00",
        "createdBy": 1,
        "createdByUser": "Joe Smith",
        "dateModified": "2015-07-21T14:12:03-05:00",
        "modifiedBy": 1,
        "modifiedByUser": "Joe Smith",
        "category": null,
        "name": "Segment A",
        "alias": "segment-a",
        "description": "This is my first segment created via API.",
        "filters": [
          {
            "glue": "and",
            "field": "city",
            "type": "text",
            "filter": "Prague",
            "display": null,
            "operator": "=",
          }
        ],
        "isGlobal": true
    }
```
Get an individual segment by ID.

#### HTTP Request

`GET /segments/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Segment Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the segment
isPublished|boolean|Whether the segment is published
dateAdded|datetime|Date/time segment was created
createdBy|int|ID of the user that created the segment
createdByUser|string|Name of the user that created the segment
dateModified|datetime/null|Date/time segment was last modified
modifiedBy|int|ID of the user that last modified the segment
modifiedByUser|string|Name of the user that last modified the segment
category|object/null|Object with the category details
name|string|Segment name
alias|string|Segment alias
description|string|Segment description
filters|array|Smart filters for the segment. See filter properties bellow
isGlobal|boolean|Whether the segment is global. 0 means only the author will see it.

**Segment Filter Properties**

Name|Type|Description
----|----|-----------
glue|string|How to glue the filters to others. Possible values: `and`, `or`
field|string|Alias of the contact or company field to based the filter on
object|string|Object which have the field. Possible values: 'lead' (for contacts), `company`
type|string|Type of the field. Possible values: 'boolean', `date` (format `Y-m-d`), `datetime` (format `Y-m-d H:i:s`), `email`, `country`, `locale`, `lookup`, `number`, `tel`, `region`, `select`, `multiselect`, `text`, `textarea`, `time`, `timezone`, `url`
operator|string|Operator used for matching the values. Possible values: '=', `!=`, `empty`, `!empty`, `like`, `!like`, `regexp`, `!regexp`, `startsWith`, `endsWith`, `contains`

### List Contact Segments

```php
<?php

//...
$segments = $segmentApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
  "total": 13,
  "lists": [
    {
        "id": 47,
        "isPublished": 1,
        "dateAdded": "2015-07-21T12:27:12-05:00",
        "createdBy": 1,
        "createdByUser": "Joe Smith",
        "dateModified": "2015-07-21T14:12:03-05:00",
        "modifiedBy": 1,
        "modifiedByUser": "Joe Smith",
        "category": null,
        "name": "Segment A",
        "alias": "segment-a",
        "description": "This is my first segment created via API.",
        "filters": [
          {
            "glue": "and",
            "field": "city",
            "type": "text",
            "filter": "Prague",
            "display": null,
            "operator": "=",
          }
        ],
        "isGlobal": true
    },
    ...
  ]
}
```
Returns a list of contact segments available to the user. This list is not filterable.

#### HTTP Request

`GET /segments`

**Query Parameters**

Name|Description
----|-----------
search|String or search command to filter entities by.
start|Starting row for the entities returned. Defaults to 0.
limit|Limit number of entities to return. Defaults to the system configuration for pagination (30).
orderBy|Column to sort by. Can use any column listed in the response.
orderByDir|Sort direction: asc or desc.
publishedOnly|Only return currently published entities.

#### Response

`Expected Response Code: 200`

See JSON code example.

**Segment Properties**

Name|Type|Description
----|----|-----------
total|int|Count of all segments
id|int|ID of the segment
isPublished|boolean|Whether the segment is published
dateAdded|datetime|Date/time segment was created
createdBy|int|ID of the user that created the segment
createdByUser|string|Name of the user that created the segment
dateModified|datetime/null|Date/time segment was last modified
modifiedBy|int|ID of the user that last modified the segment
modifiedByUser|string|Name of the user that last modified the segment
category|object/null|Object with the category details
name|string|Segment name
alias|string|Segment alias
description|string|Segment description
filters|array|Smart filters for the segment. See filter properties bellow
isGlobal|boolean|Whether the segment is global. 0 means only the author will see it.

**Segment Filter Properties**

Name|Type|Description
----|----|-----------
glue|string|How to glue the filters to others. Possible values: `and`, `or`
field|string|Alias of the contact or company field to based the filter on
object|string|Object which have the field. Possible values: 'lead' (for contacts), `company`
type|string|Type of the field. Possible values: 'boolean', `date` (format `Y-m-d`), `datetime` (format `Y-m-d H:i:s`), `email`, `country`, `locale`, `lookup`, `number`, `tel`, `region`, `select`, `multiselect`, `text`, `textarea`, `time`, `timezone`, `url`
operator|string|Operator used for matching the values. Possible values: '=', `!=`, `empty`, `!empty`, `like`, `!like`, `regexp`, `!regexp`, `startsWith`, `endsWith`, `contains`

### Create Segment
```php
<?php

$data = array(
    'name'        => 'Segment A',
    'alias'       => 'segment-a',
    'description' => 'This is my first segment created via API.',
    'isPublished' => 1,
    'filters' => array(
        array(
            'glue' => 'and',
            'field' => 'email',
            'object' => 'lead',
            'type' => 'email',
            'filter' => '*@gmail.com',
            'operator' => 'like',
        ),
    ),
);

$segment = $segmentApi->create($data);
```
Create a new segment.

#### HTTP Request

`POST /segments/new`

**Post Parameters**

Name|Description
----|-----------
name|Segment name is the only required field
alias|Name alias generated automatically if not set
description|A description of the segment.
isPublished|A value of 0 or 1
isGlobal|boolean|Whether the segment is global. 0 means only the author will see it.
filters|array|Array of filters. See possible properties bellow.

**Segment Filter Properties**

Name|Type|Description
----|----|-----------
glue|string|How to glue the filters to others. Possible values: `and`, `or`
field|string|Alias of the contact or company field to based the filter on
object|string|Object which have the field. Possible values: 'lead' (for contacts), `company`
type|string|Type of the field. Possible values: 'boolean', `date` (format `Y-m-d`), `datetime` (format `Y-m-d H:i:s`), `email`, `country`, `locale`, `lookup`, `number`, `tel`, `region`, `select`, `multiselect`, `text`, `textarea`, `time`, `timezone`, `url`
operator|string|Operator used for matching the values. Possible values: '=', `!=`, `empty`, `!empty`, `like`, `!like`, `regexp`, `!regexp`, `startsWith`, `endsWith`, `contains`

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Segment](#get-segment).

### Edit Segment
```php
<?php

$id   = 1;
$data = array(
    'name'        => 'New segment name',
    'isPublished' => 0
);

// Create new a segment of ID 1 is not found?
$createIfNotFound = true;

$segment = $segmentApi->edit($id, $data, $createIfNotFound);
```
Edit a new segment. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a segment if the given ID does not exist and clears all the segment information, adds the information from the request.
**PATCH** fails if the segment with the given ID does not exist and updates the segment field values with the values form the request.

#### HTTP Request

To edit a segment and return a 404 if the segment is not found:

`PATCH /segments/ID/edit`

To edit a segment and create a new one if the segment is not found:

`PUT /segments/ID/edit`

**Post Parameters**

Name|Description
----|-----------
name|Segment name is the only required field
alias|Name alias generated automatically if not set
description|A description of the segment.
isPublished|A value of 0 or 1
isGlobal|boolean|Whether the segment is global. 0 means only the author will see it.
filters|array|Array of filters. See possible properties bellow.

**Segment Filter Properties**

Name|Type|Description
----|----|-----------
glue|string|How to glue the filters to others. Possible values: `and`, `or`
field|string|Alias of the contact or company field to based the filter on
object|string|Object which have the field. Possible values: 'lead' (for contacts), `company`
type|string|Type of the field. Possible values: 'boolean', `date` (format `Y-m-d`), `datetime` (format `Y-m-d H:i:s`), `email`, `country`, `locale`, `lookup`, `number`, `tel`, `region`, `select`, `multiselect`, `text`, `textarea`, `time`, `timezone`, `url`
operator|string|Operator used for matching the values. Possible values: '=', `!=`, `empty`, `!empty`, `like`, `!like`, `regexp`, `!regexp`, `startsWith`, `endsWith`, `contains`

#### Response

If `PUT`, the expected response code is `200` if the segment was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Segment](#get-segment).

### Delete Segment
```php
<?php

$segment = $segmentApi->delete($id);
```
Delete a segment.

#### HTTP Request

`DELETE /segments/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Segment](#get-segment).


### Add Contact to a Segment

```php
<?php

//...
$response = $segmentApi->addContact($segmentId, $contactId);
if (!isset($response['success'])) {
    // handle error
}
```
```json
{
    "success": true
}
```

Manually add a contact to a specific segment.

#### HTTP Request

`POST /segments/SEGMENT_ID/contact/CONTACT_ID/add`

#### Response

`Expected Response Code: 200`

See JSON code example.


### Add Contacts to a Segment

```php
<?php

//...
$contactIds = ['ids'=>[ 1, 45, 39]];
$response = $segmentApi->addContact($segmentId, $contactIds);
if (!isset($response['success'])) {
    // handle error
}
```
```json
{
     "success":true,
     "details":{
        "1" :{"success":true},
        "45":{"success":true},
        "39":{"success":false}
     }
}
```

Manually add contacts to a specific segment.

#### HTTP Request

`POST /segments/SEGMENT_ID/contacts/add`

#### Response

`Expected Response Code: 200`

See JSON code example.


### Remove Contact from a Segment

```php
<?php

//...
$response = $segmentApi->removeContact($segmentId, $contactId);
if (!isset($response['success'])) {
    // handle error
}
```
```json
{
    "success": true
}
```

Manually remove a contact to a specific segment.

#### HTTP Request

`POST /segments/SEGMENT_ID/contact/CONTACT_ID/remove`

#### Response

`Expected Response Code: 200`

See JSON code example.
