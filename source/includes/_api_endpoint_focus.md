## Focus
Use this endpoint to obtain details on Mautic's Focus Items

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth         = new ApiAuth();
$auth             = $initAuth->newAuth($settings);
$apiUrl           = "https://your-mautic.com";
$api              = new MauticApi();
$focusApi = $api->newApi("focus", $auth, $apiUrl);
```

### Get Focus Item
```php
<?php

//...
$focus = $focusApi->get($id);
```
```json
{  
    "focus":{  
        "isPublished":true,
        "dateAdded":"2016-06-20T11:26:51+00:00",
        "createdBy":1,
        "createdByUser":"John Doe",
        "dateModified":"2016-08-08T16:36:27+00:00",
        "modifiedBy":1,
        "modifiedByUser":"John Doe",
        "category":null,
        "publishUp":null,
        "publishDown":null,
        "id":1,
        "name":"Focus Bar",
        "type":"notice",
        "website":"",
        "htmlMode":"0",
        "html":"<div><strong style=\"color:red\">your html code</strong></div>",
        "css":".mf-bar-collapser {border-radius: 0 !important}",
        "properties": {
                    "bar": {
                        "allow_hide": 1,
                        "sticky": 1,
                        "size": "large",
                        "placement": "top"
                        },  
                    "modal": {
                        "placement": "top"
                        },         
                     "notification": {
                        "placement": "top"
                        },       
                     "colors": {
                        "primary": "27184e"
                        },
                     "content": {
                        "headline": "",
                        "tagline": "",
                        "link_text": "",
                        "link_url": "",
                        "font": "Arial, Helvetica, sans-serif'"
                        },
                      "animate":"1",
                      "link_activation":"1",
                      "when":"immediately",
                      "frequency":"everypage",
                      "stop_after_conversion":"1"
                      "form":""
                    }
     
    }
}
```
Get an individual Focus by ID.

#### HTTP Request

`GET /focus/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**focus Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the focus
name|string|Name of the focus
description|string/null|Description of the focus
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the focus should be published
publishDown|datetime/null|Date/time the focus should be un published
dateAdded|datetime|Date/time focus was created
createdBy|int|ID of the user that created the focus
createdByUser|string|Name of the user that created the focus
dateModified|datetime/null|Date/time focus was last modified
modifiedBy|int|ID of the user that last modified the focus
modifiedByUser|string|Name of the user that last modified the focus

### List focus
```php
<?php
// ...

$focus = $focusApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{  
    "total":30,
    "focus": [
    {  
           "isPublished":true,
           "dateAdded":"2016-06-20T11:26:51+00:00",
           "createdBy":1,
           "createdByUser":"John Doe",
           "dateModified":"2016-08-08T16:36:27+00:00",
           "modifiedBy":1,
           "modifiedByUser":"John Doe",
           "category":null,
           "publishUp":null,
           "publishDown":null,
           "id":1,
           "name":"Focus Bar",
           "type":"notice",
           "website":"",
           "htmlMode":"0",
           "html":"<div><strong style=\"color:red\">your html code</strong></div>",
           "css":".mf-bar-collapser {border-radius: 0 !important}",
           "properties": {
                       "bar": {
                           "allow_hide": 1,
                           "sticky": 1,
                           "size": "large",
                           "placement": "top"
                           },  
                       "modal": {
                           "placement": "top"
                           },         
                        "notification": {
                           "placement": "top"
                           },       
                        "colors": {
                           "primary": "27184e"
                           },
                        "content": {
                           "headline": "",
                           "tagline": "",
                           "link_text": "",
                           "link_url": "",
                           "font": "Arial, Helvetica, sans-serif'"
                           },
                         "animate":"1",
                         "link_activation":"1",
                         "when":"immediately",
                         "frequency":"everypage",
                         "stop_after_conversion":"1"
                         "form":""
                       }
        
       }
     ]
}
```
#### HTTP Request

`GET /focus`

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

Same as [Get Focus Item](#get-focus-item).

### Create Focus Item
```php
<?php 

$data = array(
    'name'        => 'Focus Item',
    'isPublished' => 1
);

$focus = $focusApi->create($data);
```
Create a new focus.

#### HTTP Request

`POST /focus/new`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the focus
name|string|Name of the focus
description|string/null|Description of the focus
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the focus should be published
publishDown|datetime/null|Date/time the focus should be un published
dateAdded|datetime|Date/time focus was created
createdBy|int|ID of the user that created the focus
createdByUser|string|Name of the user that created the focus
dateModified|datetime/null|Date/time focus was last modified
modifiedBy|int|ID of the user that last modified the focus
modifiedByUser|string|Name of the user that last modified the focus

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Focus Item](#get-focus-item).

### Edit focus
```php
<?php

$id   = 1;
$data = array(
    'name'        => 'New focus name',
    'isPublished' => 0
);

// Create new a focus of ID 1 is not found?
$createIfNotFound = true;

$focus = $focusApi->edit($id, $data, $createIfNotFound);
```
Edit a new focus. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a focus if the given ID does not exist and clears all the focus item information, adds the information from the request.
**PATCH** fails if thefocus with the given ID does not exist and updates the focus field values with the values form the request.

#### HTTP Request

To edit a focus and return a 404 if the focus is not found:

`PATCH /focus/ID/edit`

To edit a focus and create a new one if the focus is not found:

`PUT /focus/ID/edit`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the focus
name|string|Name of the focus
description|string/null|Description of the focus
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the focus should be published
publishDown|datetime/null|Date/time the focus should be un published
dateAdded|datetime|Date/time focus was created
createdBy|int|ID of the user that created the focus
createdByUser|string|Name of the user that created the focus
dateModified|datetime/null|Date/time focus was last modified
modifiedBy|int|ID of the user that last modified the focus
modifiedByUser|string|Name of the user that last modified the focus

#### Response

If `PUT`, the expected response code is `200` if the focus was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Focus Item](#get-focus-item).

### Delete focus
```php
<?php

$focus = $focusApi->delete($id);
```
Delete a focus.

#### HTTP Request

`DELETE /focus/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Focus Item](#get-focus-item).
