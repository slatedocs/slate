# Profile Webhooks

Profile webhook subscription is a mechanism that will allow you to receive notifications to your servers whenever various events happen in relation to different resources created under a specific ***profile***.

Before proceeding, make sure the endpoint where you intend to receive webhooks satisfies the following requirements:

* Has a valid domain name (IPs are disallowed)
* Listens to HTTPS requests on port `443`
* Has a valid HTTPS certificate signed by a trusted Certificate Authority - CA (self-signed or expired certificates are not accepted)
* Does not include any query arguments in the URL

`https://webhooks.example.com/balance-change` is a valid URL; `http://webhooks.example.com:8080/hook.php?type=balance` is not.

You can have multiple subscriptions per event type though be mindful you will receive duplicate callbacks, one for each subscription. Find out more about webhook events [here](#webhook-events).

If you will be dealing with multiple profiles in your integration, check out [***application webhooks***](#application-webhooks). You will have to subscribe only once and you will receive updates concerning all resources that were created in your application.


**There are two ways you can manage profile webhooks:**

* via API (read more below) 
* via user interface (go to your <a href="https://transferwise.com/user/settings#webhooks" target="_blank">settings page</a>)

## Create

Create a profile subscription.

### URL validation

**Our system will validate the requested delivery URL before creating a subscription.**
 
A test notification will be sent to the URL and if a `2xx`-series HTTP response is not received then the creation 
request will be rejected with error code `INVALID_CALLBACK_URL`.

Your notification endpoint must be ready to respond to the test notification.
Test notifications can be distinguished by the presence of an HTTP request header.
See the section [Event HTTP requests](#webhook-events-event-http-requests) for more information on request headers.


> Example Request:

```shell
curl -X POST "https://api.transferwise.com/v3/profiles/{profileId}/subscriptions" \
  -H "Authorization: Bearer <your user token>" \
  -H "Content-Type: application/json" \
  -d '{
       "name": "Webhook Subscription #1",
       "trigger_on": "transfers#state-change",
       "delivery": {
         "version": "2.0.0",
         "url": "https://your.webhook.url/12345"
         }
      }'
```

> Example Response:

```json
{
    "id": "72195556-e5cb-495e-a010-b37a4f2a3043", 
    "name": "Webhook Subscription #1",
    "delivery": {
        "version": "2.0.0",
        "url": "https://your.webhook.url/12345" 
    },
    "trigger_on": "transfers#state-change", 
    "scope": {
        "domain": "profile", 
        "id": "<profile ID>"
    },
    "created_by": {
        "type": "user",
        "id": "<your user ID>"
    },
    "created_at": "2008-09-15T15:53:00Z"
}
```

### Request

**`POST https://api.transferwise.com/v3/profiles/{profileId}/subscriptions`**

`profileId` - ID of the profile you are subscribing to. 

All fields listed below are required for creating a webhook subscription.

Field                     | Description                                                             | Format
---------                 | -------                                                                 | -----------
name                      | A custom name for your webhook to ease with identification              | Text
trigger_on                | [Choose from a list of available events](#webhook-events) | Text
delivery.version          | The event representation semantic                                       | Text
delivery.url              | Required. The URL where your server will be listening for events.       | Text


### Response

Field                     | Description                                                             | Format
---------                 | -------                                                                 | -----------
id                        | UUID that uniquely identifies the subscription                          | Text
name                      | A custom name for your webhook to ease with identification              | Text
trigger_on                | `transfers#state-change`, `transfers#active-cases` or `balances#credit` | Text
delivery.version          | The event representation semantic                                       | Text
delivery.url              | Required. The URL where your server will be listening for events.       | Text
scope.domain              | Scope of this subscription, always "profile" in this case               | Text
scope.id                  | Profile ID used to create this subscription                             | Text
created\_by.type          | Creator type. Always user in this case                                  | Text
created\_by.id            | User id of the creator                                                  | Text
created\_at               | Timestamp of when the subscription was created                          | Text

## Delete

Deletes a subscription by its identifier.

> Example Request:

```shell
curl -X DELETE "https://api.transferwise.com/v3/profiles/{profileId}/subscriptions/{id}" \
  -H "Authorization: Bearer <your user token>"
```

> Example Response:

```json

```

### Request

**`DELETE https://api.transferwise.com/v3/profiles/{profileId}/subscriptions/{id}`**


## Get by ID

Retrieves a subscription by its identifier.

> Example Request:

```shell
curl -X GET "https://api.transferwise.com/v3/profiles/{profileId}/subscriptions/{id}" \
  -H "Authorization: Bearer <your user token>"
```

> Example Response:

```json
{
    "id": "f215f353-35fd-405b-b27f-4fd603c905ed", 
    "name": "Webhook Subscription #1",
    "delivery": {
        "version": "2.0.0",
        "url": "https://your.webhook.url/12345" 
    },
    "trigger_on": "balances#credit", 
    "scope": {
        "domain": "profile", 
        "id": "<profile ID>"
    },
    "created_by": {
        "type": "user",
        "id": "<your user ID>"
    },
    "created_at": "2008-09-15T15:53:00Z"
}
```

### Request

**`GET https://api.transferwise.com/v3/profiles/{profileId}/subscriptions/{id}`**


## List

List all your subscriptions

> Example Request:

```shell
curl -X GET "https://api.transferwise.com/v3/profiles/{profileId}/subscriptions" \
  -H "Authorization: Bearer <your user token>"
```

> Example Response:

```json
[
  {
    "id": "e889e085-3677-4110-be26-3e9160ac9f25",
    "name": "#1 subscription",
    "delivery": {
      "version": "2.0.0",
      "url": "https://your.webhook.url/12345"
    },
    "trigger_on": "transfers#state-change",
    "created_by": {
      "type": "user",
      "id": "<your user ID>"
    },
    "scope": {
      "domain": "profile",
      "id": "<profile ID>"
    }
  },
  {
    "id": "eabeb3f5-c134-4a1c-99e2-86a1163daf1b",
    "name": "#2 subscription",
    "delivery": {
      "version": "2.0.0",
      "url": "https://your.webhook.url/12345"
    },
    "trigger_on": "transfers#state-change",
    "created_by": {
      "type": "user",
      "id": "<your user ID>"
    },
    "scope": {
      "domain": "profile",
      "id": "<profile ID>"
    }
  }
]
```

### Request

**`GET https://api.transferwise.com/v3/profiles/{profileId}/subscriptions`**
