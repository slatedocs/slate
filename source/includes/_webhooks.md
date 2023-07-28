# Webhooks

Webhooks allow you to be notified of events that happen on your Affinity instance. For example, your app can be notified when a list is created, a field value is updated, a person is deleted, and more. These events will fire immediately after the corresponding action takes place.

## The Webhook Subscription Resource

> Example Response

```json
{
  "id": 1234,
  "webhook_url": "https://hooks.example.com/webhook",
  "subscriptions": [
    "list.created",
    "person.created",
    "organization.created",
    "opportunity.created"
  ],
  "disabled": false,
  "created_by": 5678
}
```

Each webhook subscription object has a unique `id`. It also has a `webhook_url` and `subscriptions` associated with it.

| Attribute     | Type     | Description                                                                                                                                                                                                           |
| ------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id            | integer  | The unique identifier of the webhook subscription object.                                                                                                                                                             |
| webhook_url   | string   | The URL to which the webhooks are sent to.                                                                                                                                                                            |
| subscriptions | string[] | An array of webhook events that are enabled for that endpoint. An empty array indicates subscription to all webhook events. See [below](#supported-webhook-events) for the complete list of supported webhook events. |
| disabled      | boolean  | If the subscription is disabled, this is true. Otherwise, this is false by default. A subscription may be disabled manually via API or automatically if we are not able to process it.                                |
| created_by    | integer  | The unique identifier of the user who created the webhook subscription.                                                                                                                                               |

## Supported Webhook Events

> Example Responses

```json
{
  "type": "list_entry.created",
  "body": {
    "id": 388,
    "list_id": 26,
    "creator_id": 38603,
    "entity_id": 38706,
    "entity_type": 0,
    "created_at": "2021-09-08T09:55:50.321-07:00",
    "entity": {
      "id": 70796737,
      "type": 0,
      "first_name": "John",
      "last_name": "Doe",
      "primary_email": "john@affinity.co",
      "emails": ["john@affinity.co"]
    }
  },
  "sent_at": 1631120151
}
```

| Object Type  | Events                                                                                        |
| ------------ | --------------------------------------------------------------------------------------------- |
| List         | `list.created`, `list.updated`, `list.deleted`                                                |
| List Entry   | `list_entry.created`, `list_entry.deleted`                                                    |
| Note         | `note.created`, `note.updated`, `note.deleted`                                                |
| Field        | `field.created`, `field.updated`, `field.deleted`                                             |
| Field Value  | `field_value.created`, `field_value.updated`, `field_value.deleted`                           |
| Person       | `person.created`, `person.updated`, `person.deleted`                                          |
| Organization | `organization.created`, `organization.updated`, `organization.deleted`, `organization.merged` |
| Opportunity  | `opportunity.created`, `opportunity.updated`, `opportunity.deleted`                           |
| Entity File  | `file.created`, `file.deleted`                                                                |
| Reminder     | `reminder.created`, `reminder.updated`, `reminder.deleted`                                    |

The Field Value webhook events do not include enrichment events; updates to enrichment field values are not supported.

<aside class="notice">
  <h6>Note</h6>
  <ul>
    <li>Examples of our webhook responses can be found in the <a href="https://support.affinity.co/hc/en-us/articles/4413976035085-Webhook-Responses">Help Center</a>.</li>
    <li>Field webhooks are not fired for Crunchbase fields.</li>
    <li>Field value webhooks are fired with `null` values for Crunchbase fields.</li>
  </ul>
</aside>

## Get All Webhook Subscriptions

> Example Request

```shell
curl "https://api.affinity.co/webhook" -u :$APIKEY
```

> Example Response

```json
[
  {
    "id": 1234,
    "webhook_url": "https://hooks.example.com/webhook-create",
    "subscriptions": [
      "list.created",
      "person.created",
      "organization.created",
      "opportunity.created"
    ],
    "disabled": false,
    "created_by": 5678
  },
  {
    "id": 2345,
    "webhook_url": "https://hooks.example.com/webhook-all",
    "subscriptions": [],
    "disabled": true,
    "created_by": 5678
  }
]
```

`GET /webhook`

Returns all of your organization's webhook subscriptions.

## Get a Specific Webhook Subscription

> Example Request

```shell
curl "https://api.affinity.co/webhook/1234" -u :$APIKEY
```

> Example Response

```json
{
  "id": 1234,
  "webhook_url": "https://hooks.example.com/webhook",
  "subscriptions": [
    "list.created",
    "person.created",
    "organization.created",
    "opportunity.created"
  ],
  "disabled": false,
  "created_by": 5678
}
```

`GET /webhook/{webhook_subscription_id}`

Gets the details for a specific webhook subscription given the specified `webhook_subscription_id`.

### Path Parameters

| Parameter               | Type    | Required | Description                                                           |
| ----------------------- | ------- | -------- | --------------------------------------------------------------------- |
| webhook_subscription_id | integer | true     | The unique ID of the webhook subscription that needs to be retrieved. |

### Returns

The webhook subscription object corresponding to the `webhook_subscription_id`.

## Create a New Webhook Subscription

> Example Request

```shell
curl -X POST "https://api.affinity.co/webhook/subscribe" \
  -u :$APIKEY \
  -d webhook_url="https://hooks.example.com/webhook"
```

> Example Response

```json
{
  "id": 1234,
  "webhook_url": "https://hooks.example.com/webhook",
  "subscriptions": [],
  "disabled": false,
  "created_by": 5678
}
```

`POST /webhook/subscribe`

Creates a new webhook subscription with the supplied parameters. If the endpoint returns an invalid response, the webhook creation will fail.

### Payload Parameters

| Parameter     | Type     | Required | Description                                                                                                                                                                                                                                          |
| ------------- | -------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webhook_url   | string   | true     | The URL to which the webhooks will be sent to.                                                                                                                                                                                                       |
| subscriptions | string[] | false    | An array of webhook events that will be enabled for that endpoint. Leave out this parameter or pass an empty array to subscribe to all webhook events. You can find the complete list of supported webhook events [here](#supported-webhook-events). |

### Returns

The webhook subscription object that was just created from this successful request per organization.

<aside class="notice">
  <h6>Note</h6>
  <p>There is a limit of three webhook subscriptions per Affinity instance.</p>
</aside>

## Update a Webhook Subscription

> Example Request

```shell
curl "https://api.affinity.co/webhook/1234" \
  -u :$APIKEY \
  -d webhook_url="https://hooks.example.com/webhook" \
  -d disabled=true \
  -X "PUT"
```

> Example Response

```json
{
  "id": 1234,
  "webhook_url": "https://hooks.example.com/webhook",
  "subscriptions": [],
  "disabled": true,
  "created_by": 5678
}
```

`PUT /webhook/{webhook_subscription_id}`

Update webhook subscription with the supplied parameters. A webhook subscription can only be updated by its creator. If the endpoint returns an invalid response, the webhook update will fail.

### Payload Parameters

| Parameter     | Type     | Required | Description                                                                                                                                                                                                                                          |
| ------------- | -------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webhook_url   | string   | false    | The URL to which the webhooks will be sent to.                                                                                                                                                                                                       |
| subscriptions | string[] | false    | An array of webhook events that will be enabled for that endpoint. Leave out this parameter or pass an empty array to subscribe to all webhook events. You can find the complete list of supported webhook events [here](#supported-webhook-events). |
| disabled      | boolean  | false    | Change the status of a subscription. To enable a subscription, provide the value as `false`. Otherwise, provide the value as `true.`                                                                                                                 |

### Returns

The webhook subscription object that was just updated from this successful request.

## Delete a Specific Webhook Subscription

> Example Request

```shell
curl "https://api.affinity.co/webhook/1234" \
  -u :$APIKEY \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /webhook/{webhook_subscription_id}`

Deletes a webhook subscription with a specified `webhook_subscription_id`. A webhook subscription can only be deleted by its creator, or an admin.

### Path Parameters

| Parameter               | Type    | Required | Description                                                         |
| ----------------------- | ------- | -------- | ------------------------------------------------------------------- |
| webhook_subscription_id | integer | true     | The unique ID of the webhook subscription that needs to be deleted. |

### Returns

`{success: true}`.
