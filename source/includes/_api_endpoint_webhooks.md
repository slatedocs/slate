## Webhooks
Use this endpoint to obtain details on Mautic's webhooks. Implemented in Mautic 2.8.0.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth        = new ApiAuth();
$auth            = $initAuth->newAuth($settings);
$apiUrl          = "https://your-mautic.com";
$api             = new MauticApi();
$webhookApi      = $api->newApi("webhooks", $auth, $apiUrl);
```

### Get Webhook
```php
<?php

//...
$webhook = $webhookApi->get($id);
```
```json
{
  "hook": {
    "isPublished": false,
    "dateAdded": "2017-06-07T08:54:46+00:00",
    "dateModified": "2017-06-09T07:16:23+00:00",
    "createdBy": 1,
    "createdByUser": "John Doe",
    "modifiedBy": null,
    "modifiedByUser": " ",
    "id": 31,
    "name": "test",
    "description": "Created via API",
    "webhookUrl": "https:\/\/johndoe.com",
    "secret": "webhookSecretKey",
    "eventsOrderbyDir": "DESC",
    "category": {
      "createdByUser": "John Doe",
      "modifiedByUser": "John Doe",
      "id": 1,
      "title": "Important",
      "alias": "important",
      "description": null,
      "color": null,
      "bundle": "Webhook"
    },
    "triggers": [
      "mautic.lead_post_delete",
      "mautic.lead_points_change",
      "mautic.lead_post_save_new",
      "mautic.lead_post_save_update"
    ]
  }
}
```
Get an individual webhook by ID.

#### HTTP Request

`GET /hooks/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Webhook Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the webhook
name|string|Title of the webhook
description|string|Description of the webhook
webhookUrl|string|Url to send the webhook payload to
secret|string|Secret key used for authenticity verification
eventsOrderbyDir| Order direction for queued events in one webhook. Can be "DESC" or "ASC"
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the webhook should be published
publishDown|datetime/null|Date/time the webhook should be un published
dateAdded|datetime|Date/time webhook was created
createdBy|int|ID of the user that created the webhook
createdByUser|string|Name of the user that created the webhook
dateModified|datetime/null|Date/time webhook was last modified
modifiedBy|int|ID of the user that last modified the webhook
modifiedByUser|string|Name of the user that last modified the webhook
category|null/object|Category
triggers|array|List of triggers available in Mautic

### List Webhooks
```php
<?php
// ...

$webhooks = $webhookApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
  "total": 1,
  "hooks": {
    "31": {
      "isPublished": false,
      "dateAdded": "2017-06-07T08:54:46+00:00",
      "dateModified": "2017-06-09T07:16:23+00:00",
      "createdBy": 1,
      "createdByUser": "John Doe",
      "modifiedBy": null,
      "modifiedByUser": " ",
      "id": 31,
      "name": "Deleted contact",
      "description": "Notify me when a contact is deleted",
      "webhookUrl": "https:\/\/johndoe.com",
      "secret": "webhookSecretKey",
      "eventsOrderbyDir": "DESC",
      "category": null,
      "triggers": [
        "mautic.lead_post_delete",
      ]
    }
  }
}
```
#### HTTP Request

`GET /hooks`

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

Same as [Get Webhook](#get-webhook).

### Create Webhook
```php
<?php

$data = array(
    'name' => 'test',
    'description' => 'Created via API',
    'webhookUrl' => 'http://some.url',
    'secret': 'webhookSecretKey',
    'eventsOrderbyDir' => "ASC",
    'triggers' => array(
        'mautic.lead_post_save_update',
        'mautic.lead_post_save_new',
    )
);

$webhook = $webhookApi->create($data);
```
Create a new webhook.

#### HTTP Request

`POST /hooks/new`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the webhook
name|string|Title of the webhook
description|string|Description of the webhook
webhookUrl|string|URL to send the webhook payload to
secret|string|(Optional) Secret key used for authenticity verification
eventsOrderbyDir| Order direction for queued events in one webhook. Can be "DESC" or "ASC"
isPublished|bool|Published state

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Webhook](#get-webhook).

### Edit Webhook
```php
<?php

$id   = 1;
$data = array(
    'name' => 'Rename webhook 1 to this',
);

// Create new a webhook of ID 1 is not found?
$createIfNotFound = true;

$webhook = $webhookApi->edit($id, $data, $createIfNotFound);
```
Edit a new webhook. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a webhook if the given ID does not exist and clears all the webhook information, adds the information from the request.
**PATCH** fails if the webhook with the given ID does not exist and updates the webhook field values with the values form the request.

#### HTTP Request

To edit a webhook and return a 404 if the webhook is not found:

`PATCH /hooks/ID/edit`

To edit a webhook and create a new one if the webhook is not found:

`PUT /hooks/ID/edit`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the webhook
name|string|Title of the webhook
description|string|Description of the webhook
webhookUrl|string|Url to send the webhook payload to
secret|string|Secret key used for authenticity verification
eventsOrderbyDir| Order direction for queued events in one webhook. Can be "DESC" or "ASC"
isPublished|bool|Published state

#### Response

If `PUT`, the expected response code is `200` if the webhook was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Webhook](#get-webhook).

### Delete Webhook
```php
<?php

$webhook = $webhookApi->delete($id);
```
Delete a webhook.

#### HTTP Request

`DELETE /hooks/ID/delete`

#### Response

`Expected Response Code: 200`

Same as [Get Webhook](#get-webhook).

### List available webhook triggers
```php
<?php

$webhook = $webhookApi->getTriggers();
```
List webhook triggers

#### HTTP Request

`GET /hooks/triggers`

#### Response

`Expected Response Code: 200`

```json
{
  "triggers": {
    "mautic.lead_post_delete": {
      "label": "Contact Delete Event",
      "description": "mautic.lead.webhook.event.lead.deleted_desc"
    },
    "mautic.lead_points_change": {
      "label": "Contact Point Change (Increase \/ Decrease) Event",
      "description": "mautic.lead.webhook.event.lead.points_desc"
    },
    "mautic.lead_post_save_update": {
      "label": "Contact Updated Event",
      "description": "mautic.lead.webhook.event.lead.update_desc"
    },
    "mautic.email_on_open": {
      "label": "Email Open Event",
      "description": "mautic.email.webhook.event.open_desc"
    },
    "mautic.form_on_submit": {
      "label": "Form Submit Event",
      "description": "mautic.form.webhook.event.form.submit_desc"
    },
    "mautic.lead_post_save_new": {
      "label": "New Contact Event",
      "description": "mautic.lead.webhook.event.lead.new_desc"
    },
    "mautic.page_on_hit": {
      "label": "Page Hit Event",
      "description": "mautic.page.webhook.event.hit_desc"
    }
  }
}
