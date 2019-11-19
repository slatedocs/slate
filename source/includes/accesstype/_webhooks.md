# Webhooks

Accesstype has the ability to inform third party system by webhook calls that it makes to any third party systems.

## How to Setup Accesstype webhooks

1. Login to Accesstype and go to Settings > Outgoing webhooks > Add Webhook
2. Enter the URL that you would like Accesstype to make a POST call to.
3. Optionally enter a `Secret` in case you wish to verify and segregate the calls made from Accesstype. [Click here](#verify-webhooks-sent-by-accesstype) for more info on how to verify Accesstype webhooks.
4. Check the `Active` checkbox. This is useful to activate the webhook when Accesstype automatically disables in case of failures.
5. Select one or more events for which for which you would want the webhook call to be made, and press save.

## How Accesstype Outgoing Webhooks work
```json
{
  "event": "subscription.created",
  "event_timestamp": "2019-06-16T14:04:39.836Z",
  "data": {
    "subscriber": {
      "id": 1087,
      "name": null,
      "created_at": "2019-08-14T09:43:57.557Z",
      "updated_at": "2019-08-14T09:43:57.557Z",
      "metadata": null,
      "cumulative_end_timestamps": {
          "standard_subscriptions_cumulative_end_timestamp": "2019-09-14T09:43:57.801Z",
          "campaign_subscriptions_cumulative_end_timestamp": "2020-04-14T09:45:02.183Z"
      },
      "subscriber_identities": [
          {
              "provider": "email",
              "value": "foo@example.com"
          },
          {
              "provider": "quintype",
              "value": "123"
          }
      ]
    },
    "expires_in_days": 30,
    "id": 213,
    "subscriber_id": 234,
    "subscription_plan_id": 26,
    "created_at": "2019-06-16T14:04:39.836Z",
    "updated_at": "2019-06-16T14:04:39.836Z",
    "assets": [
      {
        "title": "Monthly magazines",
        "metadata": {},
        "type": "static"
      },
      {
        "title": "All exclusive reportage content",
        "metadata": {
          "access_level": 400
        },
        "type": "story"
      },
      {
        "title": "All paid stories",
        "metadata": {
          "access_level": 300
        },
        "type": "story"
      }
    ],
    "start_timestamp": "2019-06-16T14:04:39.836Z",
    "end_timestamp": "2049-06-16T14:04:39.836Z",
    "deleted_at": null,
    "payment_id": 213,
    "metadata": {
      "full-name": "Damon Fritsch",
      "email": "blakemcglynn@west.io",
      "mobile-or-contact-number": "504.901.7100"
    },
    "external_id": null,
    "trial_period_length": null,
    "trial_period_unit": null,
    "campaign_id": null,
    "plan_amount_cents": 999900,
    "plan_amount_currency": "INR",
    "duration_unit": "years",
    "duration_length": 30,
    "plan_name": "Gold-lifetime-30-years",
    "plan_description": null,
    "group_name": "Gold",
    "group_description": "Silver + Access to Exclusive Reportage + Monthly round-up magazines",
    "subscription_type": "standard",
    "plan_occurrence": "One Time",
    "subscription_attempt_id": 224,
    "renewal_reminder_sent_date": null,
    "dynamic_assets": [
      {
        "id": "df46ab654bfaa0067f928dd3247710e8",
        "title": "A Summer Bird-Cage",
        "slug": "voluptatem_quaerat"
      }
    ],
    "coupon_discount_id": null,
    "subscription_group_id": 7,
    "preferred_identity": {
      "provider": "email",
      "value": "blakemcglynn@west.io"
    },
    "active": true,
    "payment_amount": "0.00",
    "payment_amount_cents": 0,
    "payment_amount_currency": "USD",
    "payment_type": "manual",
    "payment_token": null,
    "renewable": true,
    "status": "active",
    "expired": false,
    "coupon_code": null,
    "campaign_name": null,
    "campaign_subscription": false,
    "recurring": false,
    "cancelled_at": null,
    "next_payment_due_date": null,
    "cancelled": false,
    "in_grace_period": false,
    "invoices": [
      {
        "id": 210,
        "sequenced_invoice_number": "",
        "base_price": "9999",
        "amount_cents": 0,
        "amount_currency": "USD",
        "created_at": "2019-07-16T14:04:49.847Z",
        "amount_after_discount_before_tax": "9999",
        "discount_details": {},
        "invoice_taxes": {},
        "round_off": "9999",
        "external_payment_id": null,
        "downloadable": false
      }
    ],
    "subscriber_name": "Damon Fritsch",
    "discount_detail": {},
    "referrer": null
  }
}
```
* Once the webhooks are set up, Accesstype makes a POST API call to the webhook URLs specified, as and when the event(s) occur.
* The Webhook request body contains the Event Name and the Subscription Object.
* When the third party system receives the request, it is advised to return back a success response (200, 201, 2xx).
* In case the external system responds will a failure (non 2xx), then Accesstype will send an email to the Admins and Owners of the Accesstype account along with the payload and will also retry making the webhook call every hour. Accesstype will discontinue retrying the webhook call when it receives a success response or after 24 retries, whichever is earlier.
* If the failures continue to persist, Accesstype will disable the webhook.
* The disabled webhook can then be re-activated in the dashboard by going to Accesstype.com > Settings > Outgoing Webhooks > Activate.
**Note:** Accesstype server waits for 10 seconds to open a connection with the destination server and 5 seconds to receive a response form it.


## Description of events

|Event name|Applicability|Description|
|-|-|-|
|subscription.expiry|One-time and Recurring Subscriptions|Triggered when a one-time-subscription has expired or a recurring subscription which was cancelled, has come to an end.|
|subscription.cancellation|One-time and Recurring Subscriptions|Triggered when a one-time or a recurring subscription is cancelled.|
|subscription.renewal|Recurring Subscriptions|Triggered when a recurring subscription is successfully renewed for the subsequent cycle.|
|subscription.creation|One-time and Recurring Subscriptions|Triggered when a new subscription is created.|
|subscription.entered_grace_period|Recurring Subscriptions|Triggered when the payment is pending for a recurring subscription, and is not yet renewed. Note: When a payment is due for a recurring subscription, Accesstype waits for the payment for a grace period of 5 days before it marks the subscription as expired. During this grace period, the subscriber continues to gain access to the content.|
|subscription.activated|One-time and Recurring subscriptions|Triggered when a subscription which was created in the `Pending` state, becomes `Active`.|
|subscription.expiry_reminder|One-time Subscriptions|Triggered as per the Number of Days Before Subscription Expiry in the webhooks dashboard|
|subscriber.creation|-NA-|Triggered when a new Subscriber is created in Accesstype.|


## Verify Webhooks sent by Accesstype

```ruby
signature = request.headers['X-AT-Signature']
digest = OpenSSL::Digest.new('sha256')
secret = "foobar" # the secret that you have set in dashboard of Accesstype
message = request.body.read
digest = OpenSSL::HMAC.hexdigest(digest, secret, message)
ActiveSupport::SecurityUtils.secure_compare(digest, signature)
```

This section is useful when the Outgoing Webhooks feature is enabled in Accesstype dashboard under Accesstype > Settings > Outgoing Webhooks and if the field `Secret` has a value setup in the webhook.

Each webhook request will include a base64-encoded `X-AT-Signature` in the header, which is generated using the `Secret` that is setup in the Accesstype dashboard.

To verify that the request came from Accesstype, the HMAC `digest` must be computed according to an algorithm and compared with the value in the `X-AT-Signature` header. If they match, then you can be sure that the webhook was sent from Accesstype.

An example of the algorithm for signature verification is seen here in Rails.
