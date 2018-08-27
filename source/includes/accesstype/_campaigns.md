# Campaigns

## LIST all Campaigns

```shell--request
$ curl -H "X-SUBAUTH: <your-auth-token>" https://www.accesstype.com/api/v1/campaigns.json
```
```shell--response
{
  "campaigns": [{
    "id": 25,
    "account_id": 2,
    "target_amount_cents": 10000000,
    "target_amount_currency": "INR",
    "subscription_group_id": 1,
    "name": "Life On The Border And The Unheared stories",
    "description": "Soldiers at the border have become a staple source of news for mainstream media. But how much do we know about life at the border for those who call it home? In one of the villages along the LoC, a crippling disease is preventing people from getting Aadhaar cards.",
    "created_at": "2018-04-09T05:28:22.746Z",
    "updated_at": "2018-04-09T05:28:22.746Z",
    "deleted_at": null,
    "goal_reached": false,
    "enabled": true,
    "metadata": [],
    "collected_amount": "0.00",
    "collected_amount_cents": 0,
    "collected_amount_currency": "INR",
    "collected_amount_percentage": 0,
    "target_amount": "100000.00",
    "subscription_plans": [{
      "id": 10,
      "subscription_group_id": 1,
      "duration_length": 3,
      "price_cents": 34900,
      "price_currency": "INR",
      "additional_assets": [],
      "created_at": "2017-09-04T09:05:06.047Z",
      "updated_at": "2017-09-04T09:05:06.047Z",
      "duration_unit": "months",
      "description": null,
      "title": "print-3",
      "max_trial_period_length": null,
      "max_trial_period_unit": null,
      "recurring": false,
      "metadata": {},
      "assets": [],
      "display_assets": []
    }]
  }]
}
```

This API will list out all campaigns that are set up for the account.

## GET a Campaign

```shell--request
$ curl -H "X-SUBAUTH: <your-auth-token>" https://www.accesstype.com/api/v1/campaigns/<campaign-id>.json
```
```shell--response
{
  "campaign": {
    "id": 1,
    "target_amount_cents": 10000000,
    "target_amount_currency": "INR",
    "subscription_group_id": 1,
    "name": "Life On The Border And The Unheared stories",
    "description": "Soldiers at the border have become a staple source of news for mainstream media. But how much do we know about life at the border for those who call it home? In one of the villages along the LoC, a crippling disease is preventing people from getting Aadhaar cards.",
    "created_at": "2018-04-09T05:28:22.746Z",
    "updated_at": "2018-04-09T05:28:22.746Z",
    "deleted_at": null,
    "goal_reached": false,
    "enabled": true,
    "metadata": [],
    "collected_amount": "0.00",
    "collected_amount_cents": 0,
    "collected_amount_currency": "INR",
    "collected_amount_percentage": 0,
    "target_amount": "100000.00",
    "subscription_plans": [{
      "id": 23,
      "subscription_group_id": 25,
      "duration_length": 3,
      "price_cents": 34900,
      "price_currency": "INR",
      "additional_assets": [],
      "created_at": "2017-09-04T09:05:06.047Z",
      "updated_at": "2017-09-04T09:05:06.047Z",
      "duration_unit": "months",
      "description": null,
      "title": "print-3",
      "max_trial_period_length": null,
      "max_trial_period_unit": null,
      "recurring": false,
      "metadata": {}
      "assets": [],
      "display_assets": []
    }]
  }
}

```


This will fetch details of a specific campaign.

## POST Preview a Patron Subscription

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/preview.json -d '{
  "subscription": {
    "subscription_plan_id": "11",
    "campaign_id": "1",
    "coupon_code": "NEWYEAR",
    "metadata":  {
        "full-name": "hello",
        "email": "hello@quintype.com"
    },
    "payment": {
        "payment_type": "razorpay"
    },
    "start_timestamp": "2018-07-24 00:00:00"
  },
  "alternate_provider": "email",
  "alternate_identity": "hey@quintype.com",
  "name": "Ben"
}'
```
```shell--response
```

It returns a preview for a Patron of a Campaign, without creating a Patron for a Campaign.

The `campaign_id` field must be sent in the request for the request to be identified as a Patron Subscription Attempt.

For a successful preview attempt, it returns an `attempt_token`.

An `attempt_token` is the identifier of a subscription attempt. It should be sent back with [create subscription](#post-create-a-patron-subscription) api to mark an attempt as success.

This API must be used before accepting payment from a potential patron.

One can pass the value for `payment.payment_type` as `razorpay_recurring` when making the preview API call to get `external_reference_id` and `attempt_token` in response.

## POST Create a Patron Subscription

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json -d '{
  "subscription": {
    "subscription_plan_id": "11",
    "campaign_id": "1",
    "coupon_code": "NEWYEAR",
    "payment": {
        "payment_type": "razorpay",
        "payment_token": "pay_test_8tNiqdiajurOkj",
        "amount_cents": "99900",
        "amount_currency": "INR"
    },
    "metadata":  {
        "full-name": "hello",
        "email": "hello@quintype.com"
    },
    "start_timestamp": "2017-09-21 00:00:00"
  },
  "alternate_provider": "email",
  "alternate_identity": "hey@quintype.com",
  "attempt_token": "fo4bMWjP6N5vtVySNtiAUNBQ",
  "name": "Ben"
}'
```
```shell--response
```

This API can be used to create a Patron Subscription.

The `campaign_id` field must be sent in the request for the request to be identified as a Patron Subscription Creation.

Here `attempt_token` is the token received from [preview](#post-preview-a-patron-subscription).

It returns a Subscription Object in response.
