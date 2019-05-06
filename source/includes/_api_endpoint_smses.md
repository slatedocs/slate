## Text messages
Use this endpoint to obtain details on Mautic's Text Messages (SMSes).

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$smsApi   = $api->newApi("smses", $auth, $apiUrl);
```

### Get Text message
```php
<?php

//...
$sms = $smsApi->get($id);
```
```json
{  
    "sms":{  
        "isPublished":true,
        "dateAdded":"2016-09-14T12:14:45+00:00",
        "createdBy":1,
        "createdByUser":"John Doe",
        "dateModified":null,
        "modifiedBy":null,
        "modifiedByUser":null,
        "id":1,
        "name":"Message A",
        "message":"Hello",
        "language":"en",
        "category":null,
        "publishUp":null,
        "publishDown":null,
        "sentCount":0
    }
}
```
Get an individual sms by ID.

#### HTTP Request

`GET /smses/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Text message Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the sms
name|string|Title of the sms
message|string|Message of the sms
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the sms should be published
publishDown|datetime/null|Date/time the sms should be un published
dateAdded|datetime|Date/time sms was created
createdBy|int|ID of the user that created the sms
createdByUser|string|Name of the user that created the sms
dateModified|datetime/null|Date/time sms was last modified
modifiedBy|int|ID of the user that last modified the sms
modifiedByUser|string|Name of the user that last modified the sms
language|string|Language locale of the sms
sentCount|int|How many times the SMS was sent

### List Text messages
```php
<?php
// ...

$smses = $smsApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{  
    "total":1,
    "smses":[  
        {  
            "isPublished":true,
            "dateAdded":"2016-09-14T12:14:45+00:00",
            "createdBy":1,
            "createdByUser":"John Doe",
            "dateModified":null,
            "modifiedBy":null,
            "modifiedByUser":null,
            "id":1,
            "name":"Message A",
            "message":"Hello",
            "language":"en",
            "category":null,
            "publishUp":null,
            "publishDown":null,
            "sentCount":0
        }
    ]
}
```
#### HTTP Request

`GET /smses`

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

Same as [Get Text message](#get-sms).

### Create Text message
```php
<?php 

$data = array(
    'name'        => 'Text message A',
    'message' => 'This is my first sms created via API.',
    'isPublished' => 1
);

$sms = $smsApi->create($data);
```
Create a new sms.

#### HTTP Request

`POST /smses/new`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the sms
name|string|Title of the sms
message|string|Message of the sms
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the sms should be published
publishDown|datetime/null|Date/time the sms should be un published
dateAdded|datetime|Date/time sms was created
createdBy|int|ID of the user that created the sms
createdByUser|string|Name of the user that created the sms
dateModified|datetime/null|Date/time sms was last modified
modifiedBy|int|ID of the user that last modified the sms
modifiedByUser|string|Name of the user that last modified the sms
language|string|Language locale of the sms
sentCount|int|How many times the SMS was sent

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Text message](#get-sms).

### Edit Text message
```php
<?php

$id   = 1;
$data = array(
    'name'        => 'New sms name',
    'isPublished' => 0
);

// Create new a sms of ID 1 is not found?
$createIfNotFound = true;

$sms = $smsApi->edit($id, $data, $createIfNotFound);
```
Edit a new sms. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a sms if the given ID does not exist and clears all the sms information, adds the information from the request.
**PATCH** fails if the sms with the given ID does not exist and updates the sms field values with the values form the request.

#### HTTP Request

To edit a sms and return a 404 if the sms is not found:

`PATCH /smses/ID/edit`

To edit a sms and create a new one if the sms is not found:

`PUT /smses/ID/edit`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the sms
name|string|Title of the sms
message|string|Message of the sms
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the sms should be published
publishDown|datetime/null|Date/time the sms should be un published
language|string|Language locale of the sms

#### Response

If `PUT`, the expected response code is `200` if the sms was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Text message](#get-sms).

### Delete Text message
```php
<?php

$sms = $smsApi->delete($id);
```
Delete a sms.

#### HTTP Request

`DELETE /smses/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Text message](#get-sms).

### Send SMS to Contact
```php
<?php

$sms = $smsApi->sendToContact($smsId, $contactId);
```
Send a predefined sms to existing contact.

#### HTTP Request

`GET /smses/ID/contact/CONTACT_ID/send`

#### Response

`Expected Response Code: 200`

**Properties**
```json
{
    "success": 1,
    "status": "Delivered"
}
```

