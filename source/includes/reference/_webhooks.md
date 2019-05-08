# Webhooks

There's two ways you can manage webhooks:

* via API (read more below)
* via user interface (go to your <a href="https://transferwise.com/user/settings#webhooks" target="_blank">settings page</a>)

For the data that will be sent to your server see [events section.](#webhooks-events)

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

Webhook subscription is a mechanism that will allow you to receive notifications to your servers whenever your transfers and/or balance get updated.

Before proceeding, make sure the endpoint where you intend to receive webhooks satisfies the following requirements:

* Has a valid domain name (IP-s are not allowed)
* Listens to HTTPS requests on port `443`
* Has a valid HTTPS certificate signed by a trusted CA (self-signed or expired certificates are not accepted)
* Does not include any query arguments in the URI

`https://webhooks.example.com/balance-change` is a valid URL; `http://webhooks.example.com:8080/hook.php?type=balance` is not.

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

## Events

Events describe payload that will be sent to your server in a form of a `POST` request. They will not contain any personally identifiable information. To acknowledge succesfully processed event, make sure your server answers with a status code `200` within 5s. Otherwise, we will try to resend the notification 3 times consequently.


### Signature header

Each outgoing webhook request is signed. Whilst event payloads do not contain any sensitive information, you may want to verify if the request is coming from TransferWise (however this is optional). We advise you not to process any requests where signature appears to be forged.

Each `POST` request includes `X-Signature` header, which contains a signature. To verify it, we offer an exemplary code snippet (in Java):
```java
public boolean verifySignature(String publicKey, String signature, String payload) {
  X509EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(Base64.decode(pubicKey));
  KeyFactory keyFactory = KeyFactory.getInstance("RSA");
  PublicKey publicKey = keyFactory.generatePublic(publicKeySpec);
  
  Signature sign = Signature.getInstance("SHA1WithRSA");
  sign.initVerify(publicKey);
  
  byte[] data = payload.getBytes();
  sign.update(data);
  
  byte[] signatureBytes = Base64.decode(signature);
  
  return sign.verify(signatureBytes);
}
```

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
  "newState": "outgoing_payment_sent",
  "eventTime": 1481713589566
}
```

### Event

Event will be triggered every time transfer status is updated. Each event contains a timestamp. As we do not guarantee the order of events, please use that `eventTime` to reconcile the order. 

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
subscriptionId            | ID of subscription that triggers this notification | String
profileId                 | ID of the profile that owns the resource      | Integer
resourceId                | ID of the resource that got updated           | Integer
newState                  | New status of the resource, possible values are same as [transfer statuses](#payouts-guide-track-transfer-status)               | String
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
amount                    | Deposit amount                                | Decimal
currency                  | Currency of the balance that got updated      | String
eventType                 | Type of update                                | String
