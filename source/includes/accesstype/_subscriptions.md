# Subscriptions

Subscription plan and Payment information is required to create a subscription for a user.
`payment-type` can be one of `razorpay`, `razorpay_recurring`, `androidpay`, `androidpay_recurring`.
It can also be set to `manual` to create subscriptions not involving payments.

## LIST Subscriptions for a user

```shell
$ curl -H "X-SUBAUTH: <auth-token>" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json

{
 "subscriptions":[
  {
     "id":713,
     "subscriber_id":453,
     "subscription_plan_id":16,
     "created_at":"2017-10-30T10:55:42.201Z",
     "updated_at":"2017-10-30T10:55:42.201Z",
     "assets":[
        {
            "metadata":{},
            "title":"public",
            "type":"site"
        }
     ],
     "start_timestamp":"2017-10-30T10:55:42.176Z",
     "end_timestamp":"2017-11-13T10:55:42.176Z",
     "deleted_at":null,
     "payment_id":668,
     "metadata":{
        "Name":"Sample User",
        "Address":"Sample add",
        "Phone Number":"1111111111"
     },
     "external_id":null,
     "trial_period_length":null,
     "trial_period_unit":null,
     "coupon_code":null,
     "subscription_group_id":21,
     "preferred_identity":{
        "provider":"email",
        "value":"sample@gmail.com"
     },
     "group_name":"Sub Group 1",
     "plan_name":"Sub Plan 1",
     "duration_length":2,
     "duration_unit":"weeks",
     "subscription_type":"individual",
     "active":true,
     "payment_amount":"0.00",
     "payment_type":"manual",
     "renewable": true,
     "coupon_code_id" : 6,
     "discount_detail": {
        "code": "TEST20",
        "discount_type": "percent",
        "title": "Test coupon gives 20 percent off",
        "value": 20.0,
        "discounted_price_cents": 8000.0,
        "price_cents": 10000,
        "price_currency": "USD"
      }
    }
  ]
}
```

This API will list out all the subscriptions for a user.
In order to get only active subscriptions, param `active_only=true` can be used.

## POST Preview a Subscription

```shell
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/preview.json -d '{
  "subscription": {
    "subscription_plan_id": "11",
    "coupon_code": "NEWYEAR",
    "metadata":  {
        "full-name": "hello",
        "email": "hello@quintype.com"
    },
    "start_timestamp": "2017-09-21 00:00:00"
  },
  "alternate_provider": "email",
  "alternate_identity": "hey@quintype.com"
}'
```

It returns a preview for a Subscription, without creating a new subscription.
For a successful subscription, it also return an `attempt_token`.

An `attempt_token` is the identifier of a subscription attempt. It should be sent back with [create subscription](#post-create-a-subscription) api to mark an attempt as success.

We highly recommend use of this API before accepting payment form a user.


## POST Create a Subscription

```shell
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
  "attempt_token": "fo4bMWjP6N5vtVySNtiAUNBQ"
}'
```

This API can be used to create a subscription.

Here `attempt_token` is the token received from [preview](#post-preview-a-subscription).

Use `campaign_id` optional field to create subscription for specific campaign.

It returns a Subscription Object in response

## PATCH update attributes

```shell
curl -H "X-SUBAUTH: <auth-token>" -X PATCH -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<id>.json -d '{
  "subscription": {
    "metadata":  {
        "full-name": "hello-world",
        "email": "hello@quintype.com"
    }
  }
}'
```

This API can be used to update the attributes for a subscription of a subscriber

## PATCH bulk update attributes

```shell
curl -H "X-SUBAUTH: <auth-token>" -X PATCH -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json -d '{
  "metadata":  {
    "full-name": "hello-world",
    "email": "hello@quintype.com"
  }
}'
```

This API can be used to update the attributes of **all** active subscriptions of a subscriber

## DELETE a subscription

```shell
curl -H "X-SUBAUTH: <auth-token>" -X "DELETE" -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<subscription-id>.json
```

This API can be used to delete a subscription

## POST renew a subscription

```shell
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<subscription_id>/renewals.json -d '{
  "subscription": {
    "coupon_code": "",
    "payment": {
        "payment_type": "razorpay",
        "payment_token": "pay_test_8tNiqdiajurOkj",
        "amount_cents": "99900",
        "amount_currency": "INR"
    }
  },
  "alternate_provider": "email",
  "alternate_identity": "hey@quintype.com"
}'
```

This API can be used to renew any renewable subscription.
Subscriptions to recurring-plans are not renewable.
The new subscription starts immediately or at the end of active subscription.

One can use the optional `metadata` field to set it different from that of the existing subsription. If not passed, it is set to be same as existing subscription.

It returns a Subscription Object in response


# Recurring Subscriptions

In order to register a recurring subscription with some providers (such as razorpay), it is mandatory to register a subscription upstream.

## POST register a recurring subscription

```shell
curl -H "X-SUBAUTH: <auth-token>" -X POST -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscription_plans/<subscription-plan-id>/external_subscription_token.json -d '{
  "type": "razorpay",
  "provider": "email",
  "identity": "foo@bar.com"
}'

{
  "subscription": {
    "id": "sub_8tQNd3qURQJiK5"
  }
}
```

`provider` and `identity` are optional params and should be sent if the external subscription is not to start immediately.
