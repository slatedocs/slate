## Campaigns
Use this endpoint to obtain details on Mautic's campaigns.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth    = new ApiAuth();
$auth        = $initAuth->newAuth($settings);
$apiUrl      = "https://your-mautic.com";
$api         = new MauticApi();
$campaignApi = $api->newApi("campaigns", $auth, $apiUrl);
```

### Get Campaign
```php
<?php

//...
$campaign = $campaignApi->get($id);
```
```json
{
    "campaign": {
        "id": 3,
        "name": "Email A/B Test",
        "description": null,
        "isPublished": true,
        "publishUp": null,
        "publishDown": null,
        "dateAdded": "2015-07-15T15:06:02-05:00",
        "createdBy": 1,
        "createdByUser": "Joe Smith",
        "dateModified": "2015-07-20T13:11:56-05:00",
        "modifiedBy": 1,
        "modifiedByUser": "Joe Smith",
        "category": null,
        "events": {
            "28": {
                "id": 28,
                "type": "lead.changepoints",
                "eventType": "action",
                "name": "Adjust lead points",
                "description": null,
                "order": 1,
                "properties": {
                  "points": 20
                },
                "triggerDate": null,
                "triggerInterval": 1,
                "triggerIntervalUnit": "d",
                "triggerMode": "immediate",
                "children": [],
                "parent": null,
                "decisionPath": null
            }
        }
    }
}
```
Get an individual campaign by ID.

#### HTTP Request

`GET /campaigns/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Campaign Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the campaign
name|string|Name of the campaign
description|string/null|Description of the campaign
alias|string|Used to generate the URL for the campaign
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the campaign should be published
publishDown|datetime/null|Date/time the campaign should be un published
dateAdded|datetime|Date/time campaign was created
createdBy|int|ID of the user that created the campaign
createdByUser|string|Name of the user that created the campaign
dateModified|datetime/null|Date/time campaign was last modified
modifiedBy|int|ID of the user that last modified the campaign
modifiedByUser|string|Name of the user that last modified the campaign
events|array|Array of Event entities for the campaign. See below.

**Event Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the event
name|string|Name of the event
description|string|Optional description for the event
type|string|Type of event
eventType|string|"action" or "decision"
order|int|Order in relation to the other events (used for levels)
properties|object|Configured properties for the event
triggerMode|string|"immediate", "interval" or "date"
triggerDate|datetime/null|Date/time of when the event should trigger if triggerMode is "date"
triggerInterval|int/null|Interval for when the event should trigger
triggerIntervalUnit|string|Interval unit for when the event should trigger. Options are i = minutes, h = hours, d = days, m = months, y = years
children|array|Array of this event's children ,
parent|object/null|This event's parent
decisionPath|string/null|If the event is connected into an action, this will be "no" for the non-decision path or "yes" for the actively followed path.

### List Campaigns
```php
<?php
// ...

$campaigns = $campaignApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
    "total": 1,
    "campaigns": {
        "3": {
            "id": 3,
            "name": "Welcome Campaign",
            "description": null,
            "isPublished": true,
            "publishUp": null,
            "publishDown": null,
            "dateAdded": "2015-07-15T15:06:02-05:00",
            "createdBy": 1,
            "createdByUser": "Joe Smith",
            "dateModified": "2015-07-20T13:11:56-05:00",
            "modifiedBy": 1,
            "modifiedByUser": "Joe Smith",
            "category": null,
            "events": {
                "22": {
                    "id": 22,
                    "type": "email.send",
                    "eventType": "action",
                    "name": "Send welcome email",
                    "description": null,
                    "order": 1,
                    "properties": {
                        "email": 1
                    },
                    "triggerMode": "immediate",
                    "triggerDate": null,
                    "triggerInterval": null,
                    "triggerIntervalUnit": null,
                    "children": [],
                    "parent": null,
                    "decisionPath": null
                },
                "28": {
                    "id": 28,
                    "type": "lead.changepoints",
                    "eventType": "action",
                    "name": "Adjust lead points",
                    "description": null,
                    "order": 2,
                    "properties": {
                        "points": 20
                    },
                    "triggerMode": "immediate",                
                    "triggerDate": null,
                    "triggerInterval": null,
                    "triggerIntervalUnit": null,
                    "children": [],
                    "parent": null,
                    "decisionPath": null
                }
            }
        }
    }
}
```
#### HTTP Request

`GET /campaigns`

**Query Parameters**

Name|Description
----|-----------
search|String or search command to filter entities by.
start|Starting row for the entities returned. Defaults to 0.
limit|Limit number of entities to return. Defaults to the system configuration for pagination (30).
orderBy|Column to sort by. Can use any column listed in the response.
orderByDir|Sort direction: asc or desc.
published|Only return currently published entities.
minimal|Return only array of entities without additional lists in it.

#### Response

`Expected Response Code: 200`

See JSON code example.

**Properties**

Same as [Get Campaign](#get-campaign).


### List Campaign Contacts

This endpoint is basically an alias for the stats endpoint with 'campaign_leads' table and campaign_id specified. Other parameters are the same as in the stats endpoint.

```php
<?php
// ...

$response = $campaignApi->getContacts($campaignId, $start, $limit, $order, $where);
```
```json
{  
  "total":"1",
  "contacts":[  
    {  
      "campaign_id":"311",
      "lead_id":"3126",
      "date_added":"2017-01-25 15:11:10",
      "manually_removed":"0",
      "manually_added":"1"
    }
  ]
}
```
#### HTTP Request

`GET /campaigns/ID/contacts`

**Query Parameters**

#### Response

`Expected Response Code: 200`

See JSON code example.


### Create Campaign
```php
<?php

$data = array(
    'name'        => 'Campaign A',
    'description' => 'This is my first campaign created via API.',
    'isPublished' => 1
);

$campaign = $campaignApi->create($data);
```
Create a new campaign. To see more advanced example with campaing events and so on, see the unit tests.

#### HTTP Request

`POST /campaigns/new`

**Post Parameters**

Name|Description
----|-----------
name|Campaign name is the only required field
alias|string|Used to generate the URL for the campaign
description|A description of the campaign.
isPublished|A value of 0 or 1

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Campaign](#get-campaign).



### Clone A Campaign
```php
<?php

$camnpaignId = 12;

$campaign = $campaignApi->cloneCampaign($campaignId);
```
Clone an existing campaign. To see more advanced example with campaign events and so on, see the unit tests.

#### HTTP Request

`POST /campaigns/clone/CAMPAIGN_ID`

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Campaign](#get-campaign).


### Edit Campaign
```php
<?php

$id   = 1;
$data = array(
    'name'        => 'New campaign name',
    'isPublished' => 0
);

// Create new a campaign of ID 1 is not found?
$createIfNotFound = true;

$campaign = $campaignApi->edit($id, $data, $createIfNotFound);
```
Edit a new campaign. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a campaign if the given ID does not exist and clears all the campaign information, adds the information from the request.
**PATCH** fails if the campaign with the given ID does not exist and updates the campaign field values with the values form the request.

#### HTTP Request

To edit a campaign and return a 404 if the campaign is not found:

`PATCH /campaigns/ID/edit`

To edit a campaign and create a new one if the campaign is not found:

`PUT /campaigns/ID/edit`

**Post Parameters**

Name|Description
----|-----------
name|Campaign name is the only required field
alias|Name alias generated automatically if not set
description|A description of the campaign.
isPublished|A value of 0 or 1

#### Response

If `PUT`, the expected response code is `200` if the campaign was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Campaign](#get-campaign).

### Delete Campaign
```php
<?php

$campaign = $campaignApi->delete($id);
```
Delete a campaign.

#### HTTP Request

`DELETE /campaigns/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Campaign](#get-campaign).

### Add Contact to a Campaign

```php
<?php

//...
$response = $campaignApi->addContact($campaignId, $contactId);
if (!isset($response['success'])) {
    // handle error
}
```
```json
{
    "success": true
}
```

Manually add a contact to a specific campaign.

#### HTTP Request

`POST /campaigns/CAMPAIGN_ID/contact/CONTACT_ID/add`

#### Response

`Expected Response Code: 200`

See JSON code example.


### Remove Contact from a Campaign

```php
<?php

//...
$response = $listApi->removeContact($campaignId, $contactId);
if (!isset($response['success'])) {
    // handle error
}
```
```json
{
    "success": true
}
```

Manually remove a contact from a specific campaign.

#### HTTP Request

`POST /campaigns/CAMPAIGN_ID/contact/CONTACT_ID/remove`

#### Response

`Expected Response Code: 200`

See JSON code example.
