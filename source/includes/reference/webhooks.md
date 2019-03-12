# Webhooks

## Create

> Example Request:

```shell
curl -X POST https://api.transferwise.com/v1/subscriptions/ \
  -H "Authorization: Bearer <your api token>" \
  -H "Content-Type: application/json" \
  -d '{
       "name": "Webhook Subscription #1",
       "channel_id": "WEBHOOK",
       "callback_url": "<URL of your server>",
       "profile_id": <ID of the profile you want to receive notifications from>,
       "enabled_notifications": ["transfers", "balance"]
      }'
```

> Example Response:

```json
{
  "id": "abcde123-abcd-abcd-abcd-abcde1234567",
  "name": "Webhook Subscription #1",
  "channel_id": "WEBHOOK",
  "user_id": "TW::<your user ID>",
  "status": "ENABLED",
  "created_on": "2019-03-10T09:32:15.663Z",
  "url": "<URL of your server>",
  "profile_id": <ID of the profile you want to receive notifications from>,
  "enabled_notifications": [
    "balance",
    "transfers"
  ]
}
```

Webhook subscription is a mechanism that will allow you to receive notifications to your servers whenever your transfers and/or balance get updated. Before proceeding, please make sure your server does the following:
* listens to HTTPS requests on port 443
* has a valid domain name and URL
* has a valid SSL certificate (self-signed certificates are not allowed)

Currently we are delivering all notifications and `enabled_notifications` criteria will not be taken into account.

**NB! Please note this feature is not available in sandbox environment.**

### Request

**`POST https://api.transferwise.com/v1/subscriptions`**

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
name                      | Custom name of your webhook                   | String
channel_id                | ID of the channel through which you're receiving notifications, always equal to `WEBHOOK`                                  | String
callback_url              | URL of your server                          | String
profile_id                | ID of the profile you want to receive notifications from | Integer
enabled_notifications     | List of resources you would like to receive notifications about  | [String]

### Response

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
id                        | Subscription ID                               | UUID
name                      | Custom name of your webhook                   | String
channel_id                | ID of the channel through which you're receiving notifications, always equal to `WEBHOOK`                                  | String
user_id                   | Your user ID                                  | Integer
status                    | Status of the subscription                    | String
created_on                | Timestamp when subscription was created       | Timestamp
url              | URL of your server                          | String
profile_id                | ID of the profile you want to receive notifications from | Integer
enabled_notifications     | List of resources you would like to receive notifications about | [String]

## List

> Example Request:

```shell
curl -X GET https://api.transferwise.com/v1/subscriptions?channelId=webhook \
  -H "Authorization: Bearer <your api token>"
```

> Example Response:

```json
[
  {
    "id": "abcde123-abcd-abcd-abcd-abcde1234567",
    "name": "Webhook Subscription #1",
    "channel_id": "WEBHOOK",
    "user_id": "TW::<your user ID>",
    "status": "ENABLED",
    "created_on": "2019-03-10T09:32:15.663Z",
    "url": "<URL of your server>",
    "profile_id": <ID of the profile you want to receive notifications from>,
    "enabled_notifications": [
      "balance"
    ]
  },
  {
    "id": "abcde123-abcd-abcd-abcd-abcde1234568",
    "name": "Webhook Subscription #2",
    "channel_id": "WEBHOOK",
    "user_id": "TW::<your user ID>",
    "status": "ENABLED",
    "created_on": "2019-03-11T09:32:15.663Z",
    "url": "<URL of your server>",
    "profile_id": <ID of the profile you want to receive notifications from>,
    "enabled_notifications": [
      "transfers"
    ]
  }
]
```

List all created webhook subscriptions.

### Response

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
id                        | Subscription ID                               | UUID
name                      | Custom name of your webhook                   | String
channel_id                | ID of the channel through which you're receiving notifications, always equal to `WEBHOOK`                                  | String
user_id                   | Your user ID                                  | Integer
status                    | Status of the subscription                    | String
created_on                | Timestamp when subscription was created       | Timestamp
url              | URL of your server                          | String
profile_id                | ID of the profile you want to receive notifications from | Integer
enabled_notifications     | List of resources you would like to receive notifications about | [String]

## Get by ID

> Example Request:

```shell
curl -X GET https://api.transferwise.com/v1/subscriptions/{subscriptionId}/ \
  -H "Authorization: Bearer <your api token>"
```

> Example Response:

```json
{
  "id": "abcde123-abcd-abcd-abcd-abcde1234567",
  "name": "Webhook Subscription #1",
  "channel_id": "WEBHOOK",
  "user_id": "TW::<your user ID>",
  "status": "ENABLED",
  "created_on": "2019-03-10T09:32:15.663Z",
  "url": "<URL of your server>",
  "profile_id": <ID of the profile you want to receive notifications from>,
  "enabled_notifications": [
    "balance",
    "transfers"
  ]
}
```

Get subscription information by ID.

### Response

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
id                        | Subscription ID                               | UUID
name                      | Custom name of your webhook                   | String
channel_id                | ID of the channel through which you're receiving notifications, always equal to `WEBHOOK`                                  | String
user_id                   | Your user ID                                  | Integer
status                    | Status of the subscription                    | String
created_on                | Timestamp when subscription was created       | Date
url              | URL of your server                          | String
profile_id                | ID of the profile you want to receive notifications from | Integer
enabled_notifications     | List of resources you would like to receive notifications about | [String]

## Deactivate

> Example Request:

```shell
curl -X DELETE https://api.transferwise.com/v1/subscriptions/{subscriptionId}/ \
  -H "Authorization: Bearer <your api token>"
```

> Example Response:

```shell
{
}
```

Deactivate a subscription.

# Events

Events will not contain any personally identifiable information.

In case first delivery attempt fails, we will try to resend it 3 times consequently.

## Test event

> Example Request:

```shell
curl -X POST https://api.transferwise.com/v1/webhooks/ping \
  -H "Authorization: Bearer <your api token>" \
  -H "Content-Type: application/json" \
  -d '{
       "callback_url": "<URL of your server>"
      }'
```

> Example Response:

```json
{
  "status": "SUCCESS",
  "code": 200,
  "elapsed": 228
}
```

You can trigger a test event to be delivered to your server to check the connection between systems.

### Request

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
callback_url              | URL of your server                            | String

### Response

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
status                    | Status of test notification delivery          | String
code                      | HTTP status code we have received from your server | Integer
elapsed                   | Time taken to deliver notification, in ms     | Integer

## Transfer status change event

> Example event:

```json
{
  "subscriptionId": "abcde123-abcd-abcd-abcd-abcde1234567",
  "profileId": 123456,
  "resourceId": 1000,
  "status": "outgoing_payment_sent",
  "eventTime": 1481713589566
}
```

### Event

Event will be triggered every time transfer status is updated.

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
subscriptionId            | ID of subscription that triggers this notification | String
profileId                 | ID of the profile that owns the resource      | Integer
resourceId                | ID of the resource that got updated           | Integer
status                    | New status of the resource, possible values are same as [transfer statuses](#transferwise-payouts-guide-track-transfer-status)               | String
eventTime                 | Timestamp when update happened                | Timestamp

## Balance deposit event

> Example event:

```json
{
  "subscriptionId": "abcde123-abcd-abcd-abcd-abcde1234567",
  "profileId": 123456,
  "amount": 1000,
  "currency": "GBP",
  "eventType": "balance-deposit-received"
}
```
### Event

Event will be triggered every time balance is debited.

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
subscriptionId            | ID of subscription that triggers this notification | String
profileId                 | ID of the profile that owns the balance       | Integer
amount                    | Deposit amount                                | Integer
currency                  | Currency of the balance that got updated      | String
eventType                 | Type of update                                | String
