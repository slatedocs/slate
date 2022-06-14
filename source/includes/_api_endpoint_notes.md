## Notes
Use this endpoint to obtain details on Mautic's contact notes.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$noteApi  = $api->newApi("notes", $auth, $apiUrl);
```

### Get Note
```php
<?php

//...
$note = $noteApi->get($id);
```
```json
{  
  "note":{  
    "id":39,
    "text":"Contact note created via API request",
    "type":"general",
    "dateTime":null,
    "lead":{  
      "id":1405,
      "points":0,
      "color":null,
      "fields":{  
        "core":{  
          "firstname":{  
            "id":"2",
            "label":"First Name",
            "alias":"firstname",
            "type":"text",
            "group":"core",
            "field_order":"42",
            "object":"lead",
            "value":"Note API test"
          },
          "lastname":{  
            "id":"3",
            "label":"Last Name",
            "alias":"lastname",
            "type":"text",
            "group":"core",
            "field_order":"44",
            "object":"lead",
            "value":null
          },
          [...]
        },
      }
    }
  }
}
```
Get an individual note by ID.

#### HTTP Request

`GET /notes/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Note Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the note
lead|array|data of the contact
text|string|Note text
type|string|Note type
datetime|datetime|Date and time related to the note.


### List Contact Notes

```php
<?php

//...
$notes = $noteApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{  
  "total":24,
  "notes":[  
    {  
      "id":1,
      "text":"A test note",
      "type":"general",
      "dateTime":"2016-06-14T18:07:00+00:00",
      "lead":{  
        "id":1,
        "points":0,
        "color":null,
        "fields":[]
      }
    },
    [...]
  ]
}
```

#### HTTP Request

`GET /notes`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Note Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the note
lead|array|data of the contact
text|string|Note text
type|string|Note type
datetime|datetime|Date and time related to the note.

### Create Note
```php
<?php 

$contactID = 1;

$data = array(
    'lead' => $contactID,
    'text' => 'Note A',
    'type' => 'general',
);

$note = $noteApi->create($data);
```
Create a new note.

#### HTTP Request

`POST /notes/new`

**Post Parameters**

Name|Description
----|-----------
text|string|Note text
type|string|Note type
datetime|datetime|Date and time related to the note.

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Note](#get-note).

### Edit Note
```php
<?php

$id   = 1;
$data = array(
    'text' => 'Note B',
    'type' => 'general',
);

// Create new a note of ID 1 is not found?
$createIfNotFound = true;

$note = $noteApi->edit($id, $data, $createIfNotFound);
```
Edit a new note. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a note if the given ID does not exist and clears all the note information, adds the information from the request.
**PATCH** fails if the note with the given ID does not exist and updates the note field values with the values form the request.

#### HTTP Request

To edit a note and return a 404 if the note is not found:

`PATCH /notes/ID/edit`

To edit a note and create a new one if the note is not found:

`PUT /notes/ID/edit`

**Post Parameters**

Name|Description
----|-----------
text|string|Note text
type|string|Note type
datetime|datetime|Date and time related to the note.

#### Response

If `PUT`, the expected response code is `200` if the note was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Note](#get-note).

### Delete Note
```php
<?php

$note = $noteApi->delete($id);
```
Delete a note.

#### HTTP Request

`DELETE /notes/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Note](#get-note).
