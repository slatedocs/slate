## Contacts
Use this endpoint to manipulate and obtain details on Mautic's contacts.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth   = new ApiAuth();
$auth       = $initAuth->newAuth($settings);
$apiUrl     = "https://your-mautic.com";
$api        = new MauticApi();
$contactApi = $api->newApi("contacts", $auth, $apiUrl);
```

### Get Contact
```php
<?php

//...
$contact = $contactApi->get($id);
```
```json
    "contact": {
        "id": 47,
        "dateAdded": "2015-07-21T12:27:12-05:00",
        "createdBy": 1,
        "createdByUser": "Joe Smith",
        "dateModified": "2015-07-21T14:12:03-05:00",
        "modifiedBy": 1,
        "modifiedByUser": "Joe Smith",
        "owner": {
            "id": 1,
            "username": "joesmith",
            "firstName": "Joe",
            "lastName": "Smith"
        },
        "points": 10,
        "lastActive": "2015-07-21T14:19:37-05:00",
        "dateIdentified": "2015-07-21T12:27:12-05:00",
        "color": "ab5959",
        "ipAddresses": {
            "111.111.111.111": {
                "ipAddress": "111.111.111.111",
                "ipDetails": {
                    "city": "",
                    "region": "",
                    "country": "",
                    "latitude": "",
                    "longitude": "",
                    "isp": "",
                    "organization": "",
                    "timezone": ""
                }
            }
        },
        "fields": {
            "core": {
                "title": {
                    "id": "1",
                    "label": "Title",
                    "alias": "title",
                    "type": "lookup",
                    "group": "core",
                    "value": "Mr"
                },
                "firstname": {
                    "id": "2",
                    "label": "First Name",
                    "alias": "firstname",
                    "type": "text",
                    "group": "core",
                    "value": "Jim"
                },
                
                "...": {
                    "..." : "..."
                }
                
            },
            "social": {
                "twitter": {
                    "id": "17",
                    "label": "Twitter",
                    "alias": "twitter",
                    "type": "text",
                    "group": "social",
                    "value": "jimcontact"
                },
                
                "...": {
                    "..." : "..."
                }
                
            },
            "personal": [],
            "professional": [],
            "all": {
                "title": "Mr",
                "firstname": "Jim",
                "twitter": "jimcontact",
                
                "...": "..."
            }
        }
    }
```
Get an individual contact by ID.

#### HTTP Request

`GET /contacts/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Contact Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the contact
dateAdded|datetime|Date/time contact was created
createdBy|int|ID of the user that created the contact
createdByUser|string|Name of the user that created the contact
dateModified|datetime/null|Date/time contact was last modified
modifiedBy|int|ID of the user that last modified the contact
modifiedByUser|string|Name of the user that last modified the contact
owner|object|User object that owns the contact.
points|int|Contact's current number of points
lastActive|datetime/null|Date/time for when the contact was last recorded as active
dateIdentified|datetime/null|Date/time when the contact identified themselves
color|string|Hex value given to contact from Point Trigger definitions based on the number of points the contact has been awarded
ipAddresses|array|Array of IPs currently associated with this contact
fields|array|Array of all contact fields with data grouped by field group. See JSON code example for format. This array includes an "all" key that includes an single level array of fieldAlias => contactValue pairs.

### List Contacts
```php
<?php

//...
$contacts = $contactApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
    "total": "1",
    "contacts": [
        {
            "id": 47,
            "isPublished": true,
            "dateAdded": "2015-07-21T12:27:12-05:00",
            "createdBy": 1,
            "createdByUser": "Joe Smith",
            "dateModified": "2015-07-21T14:12:03-05:00",
            "modifiedBy": 1,
            "modifiedByUser": "Joe Smith",
            "owner": {
                "id": 1,
                "username": "joesmith",
                "firstName": "Joe",
                "lastName": "Smith"
            },
            "points": 10,
            "lastActive": "2015-07-21T14:19:37-05:00",
            "dateIdentified": "2015-07-21T12:27:12-05:00",
            "color": "ab5959",
            "ipAddresses": {
                "111.111.111.111": {
                    "ipAddress": "111.111.111.111",
                    "ipDetails": {
                        "city": "",
                        "region": "",
                        "country": "",
                        "latitude": "",
                        "longitude": "",
                        "isp": "",
                        "organization": "",
                        "timezone": ""
                    }
                }
            },
            "fields": {
                "core": {
                    "title": {
                        "id": "1",
                        "label": "Title",
                        "alias": "title",
                        "type": "lookup",
                        "group": "core",
                        "value": "Mr"
                    },
                    "firstname": {
                        "id": "2",
                        "label": "First Name",
                        "alias": "firstname",
                        "type": "text",
                        "group": "core",
                        "value": "Jim"
                    },
                    
                    "...": {
                        "..." : "..."
                    }
                },
                "social": {
                    "twitter": {
                        "id": "17",
                        "label": "Twitter",
                        "alias": "twitter",
                        "type": "text",
                        "group": "social",
                        "value": "jimcontact"
                    },
                    
                    "...": {
                        "..." : "..."
                    }
                },
                "personal": [],
                "professional": [],
                "all": {
                    "title": "Mr",
                    "firstname": "Jim",
                    "twitter": "jimcontact",
                    
                    "...": "..."    
                }
            }
        }
    ]
}
```
Get a list of contacts.

#### HTTP Request

`GET /contacts`

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

Same as [Get Contact](#get-contact).

### Create Contact
```php
<?php 

$data = array(
    'firstname' => 'Jim',
    'lastname'  => 'Contact',
    'email'     => 'jim@his-site.com',
    'ipAddress' => $_SERVER['REMOTE_ADDR'],
    'overwriteWithBlank' => true,
);

$contact = $contactApi->create($data);
```
Create a new contact.

#### HTTP Request

`POST /contacts/new`

**Post Parameters**

Name|Description
----|-----------
*|Any contact field alias can be posted as a parameter.  For example, firstname, lastname, email, etc.
ipAddress|IP address to associate with the contact
lastActive|Date/time in UTC; preferablly in the format of Y-m-d H:m:i but if that format fails, the string will be sent through PHP's strtotime then formatted
owner|ID of a Mautic user to assign this contact to
overwriteWithBlank|If true, then empty values are set to fields. Otherwise empty values are skipped

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Contact](#get-contact).

### Edit Contact
```php
<?php

$id   = 1;
$data = array(
    'email'     => 'jim-new-address@his-site.com',
    'ipAddress' => $_SERVER['REMOTE_ADDR'],    
);

// Create new a contact of ID 1 is not found?
$createIfNotFound = true;

$contact = $contactApi->edit($id, $data, $createIfNotFound);
```
Edit a new contact.  Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a contact if the given ID does not exist and clears all the contact information, adds the information from the request.
**PATCH** fails if the contact with the given ID does not exist and updates the contact field values with the values form the request.

#### HTTP Request

To edit a contact and return a 404 if the contact is not found:

`PATCH /contacts/ID/edit`

To edit a contact and create a new one if the contact is not found:

`PUT /contacts/ID/edit`

**Post Parameters**

Name|Description
----|-----------
*|Any contact field alias can be posted as a parameter.  For example, firstname, lastname, email, etc.
ipAddress|IP address to associate with the contact
lastActive|Date/time in UTC; preferably in the format of Y-m-d H:m:i but if that format fails, the string will be sent through PHP's strtotime then formatted
owner|ID of a Mautic user to assign this contact to
overwriteWithBlank|If true, then empty values are set to fields. Otherwise empty values are skipped

#### Response

If `PUT`, the expected response code is `200` if the contact was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Contact](#get-contact).

### Delete Contact
```php
<?php

$contact = $contactApi->delete($id);
```
Delete a contact.

#### HTTP Request

`DELETE /contacts/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Contact](#get-contact).

### Add Do Not Contact
```php
<?php

$data = array(
     'eventname' => 'Score via api',
     'actionname' => 'Adding',
 );
$contactApi->addDnc($contactId, $channel, $reason, $channelId, $comments);
```

Add a contact to DNC list

#### HTTP Request

To add Do Not Contact entry to a contact:

`PATCH /contacts/ID/dnc/add/CHANNEL`

** Data Parameters (optional) **
Name|Description
----|-----------
channel|Channel of DNC. For example 'email', 'sms'... Default is email.
reason|Int value of the reason. Use Contacts constants: Contacts::UNSUBSCRIBED, Contacts::BOUNCED, Contacts::MANUAL. Default is Manual
channelId|ID of the entity which was the reason for unsubscription
comments|A text describing details of DNC entry

#### Response

Same as [Get Contact](#get-contact).

### Remove from Do Not Contact
```php
<?php
$contactApi->addDnc($contactId, $channel);
```

Remove a contact from DNC list

#### HTTP Request

To remove Do Not Contact entry from a contact:

`PATCH /contacts/ID/dnc/remove/CHANNEL`

** Data Parameters (optional) **
Name|Description
----|-----------
channel|Channel of DNC. For example 'email', 'sms'... Default is email.

#### Response

Same as [Get Contact](#get-contact).

### Add Points
```php
<?php

$data = array(
	 'eventname' => 'Score via api',
	 'actionname' => 'Adding',
 );
$contactApi->addPoints($contactId, $pointDelta, $data);
```

Add lead points

#### HTTP Request

To add points to a contact and return a 404 if the lead is not found:

`PATCH /contacts/ID/points/plus/POINTS`

** Data Parameters (optional) **
Name|Description
----|-----------
eventname|Name of the event
actionname|Name of the action

#### Response

`Expected Response Code: 200`
```json
{
    "success": true
}
```

### Subtract Points
```php
<?php

$data = array(
	 'eventname' => 'Score via api',
	 'actionname' => 'Subtracting',
 );
$contactApi->subtractPoints($contactId, $pointDelta, $data);
```
Subtract lead points

#### HTTP Request

To subtract points to a contact and return a 404 if the lead is not found:

`PATCH /contacts/ID/points/minus/POINTS`

** Data Parameters (optional) **
Name|Description
----|-----------
eventname|Name of the event
actionname|Name of the action

#### Response

`Expected Response Code: 200`
```json
{
    "success": true
}
```

### List Available Owners
```php
<?php

$owners = $contactApi->getOwners();
```
```json
[
  {
    "id": 1,
    "firstName": "Joe",
    "lastName": "Smith"
  },
  {
    "id": 2,
    "firstName": "Jane",
    "lastName": "Smith"
  }
]
```
Get a list of owners that can be used to assign contacts to when creating/editing.

#### HTTP Request

`GET /contacts/list/owners`

#### Response

`Expected Response Code: 200`

**Owner Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the Mautic user
firstName|string|First name of the Mautic user
lastName|string|Last name of the Mautic user

### List Available Fields
```php
<?php

$fields = $contactApi->getFieldList();
```
```json
{
    "1": {
        "id": 1,
        "label": "Title",
        "alias": "title",
        "type": "lookup",
        "group": "core",
        "order": 1
    },
    "2": {
        "id": 2,
        "label": "First Name",
        "alias": "firstname",
        "type": "text",
        "group": "core",
        "order": 2
    },
    "3": {
        "id": 3,
        "label": "Last Name",
        "alias": "lastname",
        "type": "text",
        "group": "core",
        "order": 3
    },
    
    "...": {
        "..." : "..."
    }
}
```
Get a list of available contact fields including custom ones.

#### HTTP Request

`GET /contacts/list/fields`

#### Response

`Expected Response Code: 200`

**Field Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the field
label|string|Field label
alias|string|Field alias used as the column name in the database
type|string|Type of field.  I.e. text, lookup, etc
group|string|Group the field belongs to
order|int|Field order

### List Contact Notes
```php
<?php

$notes = $contactApi->getContactNotes($id, $searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
    "total": 1,
    "notes": [
        {
              "id": 1,
              "text": "<p>Jim is super cool!</p>",
              "type": "general",
              "dateTime": "2015-07-23T13:14:00-05:00"
        }
    ]
}
```
Get a list of notes for a specific contact.

#### HTTP Request

`GET /contacts/ID/notes`

**Query Parameters**

Name|Description
----|-----------
search|String or search command to filter entities by.
start|Starting row for the entities returned. Defaults to 0.
limit|Limit number of entities to return. Defaults to the system configuration for pagination (30).
orderBy|Column to sort by. Can use any column listed in the response.
orderByDir|Sort direction: asc or desc.

#### Response

`Expected response code: 200`

**Note Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the note
text|string|Body of the note
type|string|Type of note. Options are "general", "email", "call", "meeting"
dateTime|datetime|Date/time string of when the note was created.

### Get Segment Memberships
```php
<?php

$segments = $contactApi->getContactSegments($id);
```
```json
{
    "total": 1,
    "segments": {
        "3": {
            "id": 3,
            "name": "New Contacts",
            "alias": "newcontacts"
        }
    }
}
```
Get a list of contact segments the contact is a member of.

#### HTTP Request

`GET /contacts/ID/segments`

#### Response

`Expected response code: 200`

**List Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the list
name|string|Name of the list
alias|string|Alias of the list used with search commands.
dateAdded|datetime|Date/time string for when the contact was added to the list
manuallyAdded|bool|True if the contact was manually added to the list versus being added by a filter
manuallyRemoved|bool|True if the contact was manually removed from the list even though the list's filter is a match

### Change List Memberships

See [Segements](#segments).


### Get Campaign Memberships
```php
<?php

$segments = $contactApi->getContactCampaigns($id);
```
```json
{
    "total": 1,
    "campaigns": {
        "1": {
            "id": 1,
            "name": "Welcome Campaign",
            "dateAdded": "2015-07-21T14:11:47-05:00",
            "manuallyRemoved": false,
            "manuallyAdded": false,
            "list_membership": [
                3
            ]            
        }
    }
}
```
Get a list of campaigns the contact is a member of.

#### HTTP Request

`GET /contacts/ID/campaigns`

#### Response

`Expected response code: 200`

**List Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the campaign
name|string|Name of the campaign
dateAdded|datetime|Date/time string for when the contact was added to the campaign
manuallyAdded|bool|True if the contact was manually added to the campaign versus being added by a contact list
manuallyRemoved|bool|True if the contact was manually removed from the campaign when the contact's list is assigned to the campaign
listMembership|array|Array of contact list IDs this contact belongs to that is also associated with this campaign

### Change Campaign Memberships

See [Campaigns](#campaigns).

### Get Contact Events
```php
<?php

$segments = $contactApi->getEvents($id, $search, $includeEvents, $excludeEvents, $orderBy, $orderByDir, $page);
```
**Query Parameters**

Name|Description
----|-----------
filters[search]|String or search command to filter events by.
filters[includeEvents][]|Array of event types to include.
filters[excludeEvents][]|Array of event types to exclude.
orderBy|Column to sort by. Can use any column listed in the response.
orderByDir|Sort direction: asc or desc.
page|What page number to load

```json
{  
  "events":[  
    {  
      "event":"lead.identified",
      "icon":"fa-user",
      "eventType":"Contact identified",
      "eventPriority":-4,
      "timestamp":"2016-06-09T21:39:08+00:00",
      "featured":true
    }
  ],
  "filters":{  
    "search":"",
    "includeEvents":[  
      "lead.identified"
    ],
    "excludeEvents":[]
  },
  "order":[  
    "",
    "ASC"
  ],
  "types":{  
    "lead.ipadded":"Accessed from IP",
    "asset.download":"Asset downloaded",
    "campaign.event":"Campaign action triggered",
    "lead.create":"Contact created",
    "lead.identified":"Contact identified",
    "lead.donotcontact":"Do not contact",
    "email.read":"Email read",
    "email.sent":"Email sent",
    "email.failed":"Failed",
    "form.submitted":"Form submitted",
    "page.hit":"Page hit",
    "point.gained":"Point gained",
    "stage.changed":"Stage changed",
    "lead.utmtagsadded":"UTM tags recorded",
    "page.videohit":"Video View Event"
  },
  "total":1,
  "page":1,
  "limit":25,
  "maxPages":1
}
```
Get a list of contact events the contact created.

#### HTTP Request

`GET /contacts/ID/events`

#### Response

`Expected response code: 200`

**List Properties**

Name|Type|Description
----|----|-----------
events|array|List of events
event|string|ID of the event type
icon|string|Icon class from FontAwesome
eventType|string|Human name of the event
eventPriority|string|Priority of the event
timestamp|timestamp|Date and time when the event was created
featured|bool|Flag whether the event is featured
filters|array|Filters used in the query
order|array|Ordering used in the query
types|array|Array of available event types
total|int|Total number of events in the request
page|int|Current page number
limit|int|Limit of events per page
maxPages|int|How many pages of events are there
