# Webhooks

**NB! Please note this version of webhooks is now **_deprecated_**. You can use (profile webhooks) or (application webhooks) instead.

There's two ways you can manage webhooks:

* via API (read more below)
* via user interface (go to your <a href="https://transferwise.com/user/settings#webhooks" target="_blank">settings page</a>)

For the data that will be sent to your server see [events section.](#webhooks-events)

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

## Delete

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

Delete a subscription.

## Events

Events are messages that will be sent to your server as HTTP `POST` requests.
They will not contain any personally identifiable information.

To acknowledge that you have successfully processed an event, make sure your server answers with the HTTP status code `200`
within 5s. Otherwise, we will consider the delivery attempt as having failed and will later try to resend the message.

We will attempt to redeliver messages at increasing intervals over a two week period. We will try at most 25 times to do this.


### Signature header

> TransferWise public key for production environment:

```
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvO8vXV+JksBzZAY6GhSO
XdoTCfhXaaiZ+qAbtaDBiu2AGkGVpmEygFmWP4Li9m5+Ni85BhVvZOodM9epgW3F
bA5Q1SexvAF1PPjX4JpMstak/QhAgl1qMSqEevL8cmUeTgcMuVWCJmlge9h7B1CS
D4rtlimGZozG39rUBDg6Qt2K+P4wBfLblL0k4C4YUdLnpGYEDIth+i8XsRpFlogx
CAFyH9+knYsDbR43UJ9shtc42Ybd40Afihj8KnYKXzchyQ42aC8aZ/h5hyZ28yVy
Oj3Vos0VdBIs/gAyJ/4yyQFCXYte64I7ssrlbGRaco4nKF3HmaNhxwyKyJafz19e
HwIDAQAB
```

> How to verify signatures (in Java):

```java
public boolean verifySignature(String encodedPublicKey, String signature, String payload) {
  X509EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(Base64.getMimeDecoder().decode(encodedPublicKey));
  KeyFactory keyFactory = KeyFactory.getInstance("RSA");
  PublicKey publicKey = keyFactory.generatePublic(publicKeySpec);
  
  Signature sign = Signature.getInstance("SHA1WithRSA");
  sign.initVerify(publicKey);
  sign.update(payload.getBytes());
  
  byte[] signatureBytes = Base64.getDecoder().decode(signature);
  
  return sign.verify(signatureBytes);
}
```

Each outgoing webhook request is signed. Whilst event payloads do not contain any sensitive information, you may want to
verify if the request is coming from TransferWise (however this is optional).
We advise you not to process any requests where signature appears to be forged.

Each `POST` request includes `X-Signature` header, which contains a signature.


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
  "resourceId": {transferId},
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

Event will be triggered every time balance is credited.

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
subscriptionId            | ID of subscription that triggers this notification | String
profileId                 | ID of the profile that owns the balance       | Integer
amount                    | Deposit amount                                | Decimal
currency                  | Currency of the balance that got updated      | String
eventType                 | Type of update                                | String
