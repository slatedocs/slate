# Webhook events

Events are messages that will be sent to your server as HTTP `POST` requests if you create a webhook subscription for
the type of event and a relevant resource you have access to is updated. 
Events will not contain any personally identifiable information.

For example, an event may describe a change in the status of a transfer you have made.

To acknowledge that you have successfully processed an event, make sure your server answers with a `2xx`-series HTTP status
code within 5 seconds. Otherwise, we will consider the delivery attempt as having failed and will later try to resend the
message.

We will attempt to redeliver messages at increasing intervals over a two week period. We will try at most 25 times to do this.


## Event HTTP requests

Event HTTP request bodies have a type-specific structure.
Events using version 2 of our type schema will contain a common base structure with additional event-specific details.
Each event type is described in detail later in this section.

Event HTTP requests also contain the following custom headers:


### Signature header `X-Signature`

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
> TransferWise public key for sandbox environment:

```
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwpb91cEYuyJNQepZAVfP
ZIlPZfNUefH+n6w9SW3fykqKu938cR7WadQv87oF2VuT+fDt7kqeRziTmPSUhqPU
ys/V2Q1rlfJuXbE+Gga37t7zwd0egQ+KyOEHQOpcTwKmtZ81ieGHynAQzsn1We3j
wt760MsCPJ7GMT141ByQM+yW1Bx+4SG3IGjXWyqOWrcXsxAvIXkpUD/jK/L958Cg
nZEgz0BSEh0QxYLITnW1lLokSx/dTianWPFEhMC9BgijempgNXHNfcVirg1lPSyg
z7KqoKUN0oHqWLr2U1A+7kqrl6O2nx3CKs1bj1hToT1+p4kcMoHXA7kA+VBLUpEs
VwIDAQAB
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

Each outgoing webhook request is signed.
Although event payloads do not contain any sensitive information, you may want to
verify if the request is coming from TransferWise (however this is optional).
We advise you not to process any requests where signature appears to be forged.

Each `POST` request includes the `X-Signature` header, which contains the message-specific signature.


### Delivery ID header `X-Delivery-Id`

Each outgoing notification is assigned a unique delivery UUID.


### Test notification header `X-Test-Notification`

This header is present with the value `true` if the notification is a test message.

Test messages can be sent to verify callback URLs when subscriptions are being set up.


## Event payload

> Basic event payload:

```json
{
  "data": {},
  "subscription_id": "db463333-3333-3333-3333-185d1ee81585",
  "event_type": "...",
  "schema_version": "2.0.0",
  "sent_at": "2019-10-14T12:43:37Z"
}
```

All events share same high-level payload structure.
Depending on the `event_type`, the only object that differs between events is `data`.

Field           | Description                                     | Format
---------       | -------                                         | -----------
data            | Object with information about updated resource  | Object
subscription_id | ID of the subscription that triggered the event | UUID
event_type      | Type of event, which defines `data` object      | Integer
schema_version  | The event representation semantic version       | String
sent_at         | Timestamp when update happened                  | Timestamp


## Transfer status change event

> Example event:

```json
{
  "data": {
    "resource": {
      "id": 99330022,
      "profile_id": 11121314,
      "account_id": 1514131211,
      "type": "transfer"
    },
    "current_state": "processing",
    "previous_state": "incoming_payment_waiting",
    "occurred_at": "2019-10-14T12:43:37Z"
  },
  "subscription_id": "db463333-3333-3333-3333-185d1ee81585",
  "event_type": "transfers#state-change",
  "schema_version": "2.0.0",
  "sent_at": "2019-10-14T12:43:37Z"
}
```

Event type: `transfers#state-change`

This event will be triggered every time a transfer's status is updated. Each event contains a timestamp.
As we do not guarantee the order of events, please use `data.occured_at` to reconcile the order. 

If you would like to subscribe to transfer state change events, please use `transfers#state-change`
when creating your subscription.

### Schema version `2.0.0` (latest)

Field                       | Description                                   | Format
---------                   | -------                                       | -----------
data.resource.id            | ID of the transfer that got updated           | String
data.resource.profile_id    | ID of the profile that owns the transfer      | Integer
data.resourceI.account_id   | ID of transfer's recipient                    | Integer
data.resource.type          | Type of the resource that was updated         | String
data.current_state          | Newly acquired state of the resource, possible values are same as [transfer statuses](#payouts-guide-track-transfer-status) | String
data.previous_state         | Previous state of the resource, possible values are same as [transfer statuses](#payouts-guide-track-transfer-status) | String
data.occured_at             | Timestamp when the update happened            | Timestamp


## Transfer issue event

> Example event:

```json
{
  "data": {
    "resource": {
      "id": 99330022,
      "profile_id": 11121314,
      "account_id": 1514131211,
      "type": "transfer"
    },
    "active_cases": ["deposit_amount_less_invoice"]
  },
  "subscription_id": "db463333-3333-3333-3333-185d1ee81585",
  "event_type": "transfers#active-cases",
  "schema_version": "2.0.0",
  "sent_at": "2019-10-14T12:43:37Z"
}
```

Event type: `transfers#active-cases`

This event will be triggered every time a transfer's list of active issues is updated.
Issues indicate potential problems with transfer processing. 

If you would like to subscribe to transfer active issue events, please use `transfers#active-cases` when creating
your subscription.

### Schema version `2.0.0` (latest)

Field                       | Description                                   | Format
---------                   | -------                                       | -----------
data.resource.id            | ID of the transfer that got updated           | String
data.resource.profile_id    | ID of the profile that owns the transfer      | Integer
data.resourceI.account_id   | ID of transfer's recipient                    | Integer
data.resource.type          | Type of the resource that was updated         | String
data.active_cases           | List of ongoing issues related to the transfer| String


## Balance deposit event

> Example event:

```json
{
  "data": {
    "resource": {
      "id": 99887766,
      "type": "balance-account",
      "profile_id": 11121314
    },
    "amount": 50.00,
    "currency": "EUR",
    "transaction_type": "credit",
    "post_transaction_balance_amount": 150,
    "occurred_at": "2019-10-14T12:43:37Z"
  },
  "subscription_id": "db463333-3333-3333-3333-185d1ee81585",
  "event_type": "balances#credit",
  "schema_version": "2.0.0",
  "sent_at": "2019-10-14T12:43:37Z"
}
```

Event type: `balances#credit`

This event will be triggered every time a balance account is credited.

Please note: This event is not currently delivered to application subscriptions.

If you would like to subscribe to balance credit events, please use `balances#credit` when creating your subscription.

**Schema version `2.0.0` (latest)**

Field                     | Description                                         | Format
---------                 | -------                                             | -----------
subscriptionId            | ID of subscription that triggers this notification  | String
profileId                 | ID of the profile that owns the balance             | Integer
amount                    | Deposit amount                                      | Decimal
currency                  | Currency of the balance that got updated            | String
eventType                 | Type of update                                      | String
