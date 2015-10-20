# Webhooks

## Introduction

Webhooks or callback URLs allow you to define URLs on your server that notifications should be sent to. Notifications are sent for specific events, as defined in the “Supported Event” section below.

You can be managed in two ways:

* By logging into your account via the web browser
* By using the Webhooks API

*Required permisions*

To manage webhooks, either with the API or the web browser, you must have “Manage Users and Organization Settings” permissions for your organization

*Managing Webhooks from the web browser*

To manage webhooks using the web browser:
1. Log into your account.
2. Go to your organizations profile page. You can access this either from the organizations menu, or by clicking your organization name at the top left of the page.
3. Click the Settings button (Cog wheel with an arrow pointing down)
4. Click “Manage Webhooks” from the drop down menu that appears

*Managing Webhooks from the API*

You can use the Webhooks API described below to update or delete your callback URLs programatically.

The webhooks api endpoint is https://app.beyonic.com/api/webhooks

## Supported events

The following events are supported

Event | Description | Object returned in data
--------- | -------- | ----------------------
payment.status.changed | Triggered any time a payment changes status. | Payment object
collection.received | Triggered any time a collection (an incoming payment) is received from a customer | Collection object

## Notification body format

> Sample Response (JSON):

```json
{
    "hook": {
			    "id": 53,
			    "created": "2015-08-01T16:56:29Z",
			    "updated": "2015-08-01T16:56:29Z",
			    "event": "payment.status.changed",
			    "target": "https://my.callback.url/",
			    "user": 42
			},
	"data": {
				"id": 2314, 
			    "organization": 1, 
			    "amount": "30", 
			    "currency": "UGX",
			    "payment_type": "money",
			    "metadata": {"id": 1234, "name": "Lucy"}, 
			    "description": "Per diem payment", 
			    "phone_nos": ["+256772781923"], 
			    "state": "completed", 
			    "last_error": null,
			    "rejected_reason": null,
			    "rejected_by": null,
			    "rejected_time": null,
			    "cancelled_reason": null,
			    "cancelled_by": null,
			    "cancelled_time": null, 
			    "created": "2014-11-22T20:57:04.017Z",
			    "author": 15,
			    "modified": "2014-11-22T20:57:04.018Z",
			    "updated_by": null,
			    "start_date": "2014-11-22T20:57:04.018Z"
			}
}
```

When an event is triggered, a JSON post will be sent to the URL that subscribed to the webhook. The JSON post body will include the following information:

Parameter | Description 
--------- | --------
hook | A JSON representation of a webhook object. See the see webhook section below.
data | A JSON representation of the object that triggered the event. This is different for each event. See the 'Supported events' section above.

## Creating a new webhook

> Sample Request:

```shell
curl http://app.beyonic.com/api/webhooks -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900" \
-d "payment.status.changed" \
-d target="https://my.callback.url/"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

hook = Beyonic::Webhook.create(
    event: "payment.status.changed",
    target: "https://my.callback.url/"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

Beyonic_Webhook::create(array(
  "event" => "payment.status.changed",
  "target" => "https://my.callback.url/"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

hook = beyonic.Webhook.create(event='payment.status.changed',
							  target='https://my.callback.url/'
							  )

```

> Sample Response (JSON)

```json
{
    "id": 53,
    "created": "2015-08-01T16:56:29Z",
    "updated": "2015-08-01T16:56:29Z",
    "event": "payment.status.changed",
    "target": "https://my.callback.url/",
    "user": 42
}
```

To create a new webhook, make a POST to the endpoint above, with the attributes below.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
event | Yes | String | 'payment.status.changed' | Must be a supported event
target | Yes | String | 'https://my.callback.url/"' | Must be an https URL


**Responses**

* If successful, a JSON representation of the new webhook object will be returned.

## Retrieving a single webhook

> Sample Request:

```shell
curl https://app.beyonic.com/api/webhooks/23 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

hook = Beyonic::Webhook.get(23)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$hook = Beyonic_Webhook::get(23);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

hook = beyonic.Webhook.get(23)

```

> Sample Response (JSON)

```json
{
    "id": 23,
    "created": "2015-08-01T16:56:29Z",
    "updated": "2015-08-01T16:56:29Z",
    "event": "payment.status.changed",
    "target": "https://my.callback.url/",
    "user": 42
}
```

To retrieve a single webhook object, provide the webhook id and a webhook object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 23 | The id of the webhook you want to retrieve

## Listing all webhooks

> Sample Request:

```shell
curl https://app.beyonic.com/api/webhooks -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

hooks = Beyonic::Webhook.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$hooks = Beyonic_Webhook::getAll();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

hooks = beyonic.Webhook.list()

```

> Sample Response (JSON)

```json
{
    "count": 4,
    "next": "http://localhost:8000/api/webhooks?offset=10",
    "previous": null,
    "results": [
        {
            "id": 50,
            "created": "2015-08-01T16:43:43Z",
            "updated": "2015-08-01T17:05:38Z",
            "event": "payment.status.changed",
            "target": "https://mysite.com/callbacks/payment/saved/1",
            "user": 42
        },
        {
            "id": 52,
            "created": "2015-08-01T16:43:43Z",
            "updated": "2015-08-01T17:05:38Z",
            "event": "payment.status.changed",
            "target": "https://mysite.com/callbacks/payment/saved",
            "user": 42
        },
        {
            "id": 53,
            "created": "2015-08-01T16:56:29Z",
            "updated": "2015-08-01T16:56:29Z",
            "event": "payment.status.changed",
            "target": "https://my.callback.url/",
            "user": 42
        },
        {
            "id": 55,
            "created": "2015-08-01T16:56:29Z",
            "updated": "2015-08-01T16:56:29Z",
            "event": "payment.status.changed",
            "target": "https://google.com",
            "user": 42
        }
    ]
}
```
       
To retrieve a list of all webhooks, make a GET request to the webhooks endpoint. This will return a list of webhooks objects.

## Updating a webhook

> Sample Request:

```shell
ccurl http://app.beyonic.com/api/webhooks/1 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900" \
-d event="payment.status.changed" \
-d target="https://my.callback.url/" \
-X PUT
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

hook = Beyonic::Webhook.get(1)
hook.target = 'https://my.callback.url/'
hook.save()
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$hook = Beyonic_Webhook::get(1);
$hook->target = 'https://my.callback.url/';
$hook->save();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

hook = beyonic.Webhook.get(1)
hook.target = 'https://my.callback.url/'
hook.save()

```

> Sample Response (JSON)

```json
{
    "id": 1,
    "created": "2015-08-01T16:56:29Z",
    "updated": "2015-08-01T16:56:29Z",
    "event": "payment.status.changed",
    "target": "https://my.callback.url/",
    "user": 42
}
```

To update a webhook, make a PUT request to the specific webhook’s endpoint, identified by its Id.

## Deleting a webhook

> Sample Request:

```shell
curl http://app.beyonic.com/api/webhooks/1 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900" -X DELETE
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

Beyonic::Webhook.delete(1)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

Beyonic_Webhook::delete( 11 );
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

beyonic.Webhook.delete(11)

```

To delete a webhook, make a DELETE request to the specific webhook’s endpoint, identified by its Id.