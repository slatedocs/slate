# Application Webhooks

Application webhook subscription is a mechanism that will allow you to receive notifications to your servers whenever various events happen in relation to different resources created by an ***application***.

Before proceeding, make sure the endpoint where you intend to receive webhooks satisfies the following requirements:

* Has a valid domain name (IP addresses are disallowed)
* Listens to HTTPS requests on port `443`
* Has a valid HTTPS certificate signed by a trusted Certificate Authority - CA (self-signed or expired certificates are not accepted)
* Does not include any query arguments in the URL

`https://webhooks.example.com/balance-change` is a valid URL; `http://webhooks.example.com:8080/hook.php?type=balance` is not.

You can have multiple subscriptions per event type though be mindful you will receive duplicate callbacks, one for each subscription. Find out more about webhook events [here](#webhook-events).

<aside class="notice">
Please note that you have to use a client level token to access application subscription resources.
</aside>

## Client token

### Request

**`POST https://api.sandbox.transferwise.tech/oauth/token`**

Use Basic Authentication with your api-client-id/api-client-secret as username/pwd and also use the header `Content-Type: application/x-www-form-urlencoded`.


Field                 | Description                                   | Format
---------             | -------                                       | -----------
grant_type            | "client_credentials"                          | Text

### Response

Field                 | Description                                   | Format
---------             | -------                                       | -----------
access_token          | Access token to be used when creating an application subscription. Valid for 12 hours. | uuid
token_type            | "bearer"                                      | Text
expires_in            | Expiry time in seconds                        | Integer
scope                 |                                               | Text


## Create


> Example Request:

```shell
curl -X POST "https://api.transferwise.com/v3/applications/{clientKey}/subscriptions" \
  -H "Authorization: Bearer <your client level token>" \
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
        "domain": "application", 
        "id": "<your client key>"
    },
    "created_by": {
        "type": "application",
        "id": "<your client ID>", //clientId and key are not always the same
    },
    "created_at": "2019-10-10T13:55:57Z"
}
```

### Request

**`POST https://api.transferwise.com/v3/applications/{clientKey}/subscriptions`**

`{clientKey}` can be received upon obtaining client credentials from our tech support.

All fields listed below are required for creating a webhook subscription.

Field                     | Description                                                       | Format
---------                 | -------                                                           | -----------
name                      | A custom name for your webhook to ease with identification        | Text
trigger_on                | [Choose from a list of available events](#webhook-events)         | Text
delivery.version          | The event representation semantic version                         | Text
delivery.url              | Required. The URL where your server will be listening for events. | Text


### Response

Field                     | Description                                                             | Format
---------                 | -------                                                                 | -----------
id                        | UUID that uniquely identifies the subscription                          | Text
name                      | A custom name for your webhook to ease with identification              | Text
trigger_on                | `transfers#state-change`, `transfers#active-cases` or `balances#credit` | Text
delivery.version          | The event representation semantic version                                       | Text
delivery.url              | The URL where your server will be listening for events.       | Text
scope.domain              | Scope of this subscription, always "application" in this case           | Text
scope.id                  | Client key used to create this subscription                             | Text
created\_by.type          | Creator type. Always application in this case                           | Text
created\_by.id            | Client ID of the creator. Not always the same as the client key         | Text
created\_at               | Timestamp of when the subscription was created                          | Text

## Delete

Deletes a subscription by its identifier.

> Example Request:

```shell
curl -X DELETE "https://api.transferwise.com/v3/applications/{clientKey}/subscriptions/{id}" \
  -H "Authorization: Bearer <your client level token>"
```

> Example Response:

```json

```

### Request

**`DELETE https://api.transferwise.com/v3/applications/{clientKey}/subscriptions/{id}`**


## Get by id

Retrieves a subscription by its identifier.

> Example Request:

```shell
curl -X GET "https://api.transferwise.com/v3/applications/{clientKey}/subscriptions/{id}" \
  -H "Authorization: Bearer <your client level token>"
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
        "domain": "application", 
        "id": "<your client key>"
    },
    "created_by": {
        "type": "application",
        "id": "<your client ID>", //clientId and key are not always the same
    },
    "created_at": "2008-09-15T15:53:00+00:00Z",
}
```

### Request

**`GET https://api.transferwise.com/v3/applications/{clientKey}/subscriptions/{id}`**


## List

List all your subscriptions

> Example Request:

```shell
curl -X GET "https://api.transferwise.com/v3/applications/{clientKey}/subscriptions" \
  -H "Authorization: Bearer <your client level token>"
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
      "type": "application",
      "id": "<your client ID>"
    },
    "scope": {
      "domain": "application",
      "id": "<your client key>"
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
      "type": "application",
      "id": "<your client ID>"
    },
    "scope": {
      "domain": "application",
      "id": "<your client key>"
    }
  }
]
```

### Request

**`GET https://api.transferwise.com/v3/applications/{clientKey}/subscriptions`**
