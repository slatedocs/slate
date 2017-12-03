# Subscriptions

Subscription plan and Payment information is required to create a subscription for a user.
`payment-type` can be one of `razorpay`, `razorpay_recurring`, `androidpay`, `androidpay_recurring`.
It can also be set to `manual` to create subscriptions not involving payments.

## LIST Subscriptions for a user

```shell
$ curl -H "X-SUBAUTH: <auth-token>" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json
{
 "subscriptions":[
  {
     "id":713,
     "subscriber_id":453,
     "subscription_plan_id":16,
     "created_at":"2017-10-30T10:55:42.201Z",
     "updated_at":"2017-10-30T10:55:42.201Z",
     "assets":[

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
     "renewable": true
    }
  ]
}
```

This API will list out all the subscriptions for a user.
In order to get only active subscriptions, param `active_only=true` can be used.

## POST Create a Subscription

```shell
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json -d '{
  "subscription": {
    "subscription_plan_id": "11",
    "coupon_code": "",
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
  "alternate_identity": "hey@quintype.com"
}'
```

This API can be used to create a subscription.
It returns a Subscription Object in response

## PATCH update attributes

```shell
curl -H "X-SUBAUTH: <auth-token>" -X "PATCH" -H "Content-Type: application/json" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<id>.json -d '{
  "subscription": {
    "metadata":  {
        "full-name": "hello-world",
        "email": "hello@quintype.com"
    }
  }
}`
```

This API can be used to update the attributes for a subscription of a subscriber

## PATCH bulk update attributes

```shell
curl -H "X-SUBAUTH: <auth-token>" -X "PATCH" -H "Content-Type: application/json" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json -d '{
  "metadata":  {
    "full-name": "hello-world",
    "email": "hello@quintype.com"
  }
}`
```

This API can be used to update the attributes of **all** active subscriptions of a subscriber

## DELETE a subscription

```shell
curl -H "X-SUBAUTH: <auth-token>" -X "DELETE" -H "Content-Type: application/json" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<subscription-id>.json
```

This API can be used to delete a subscription

## POST renew a subscription

```shell
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" https://subtype.quintype.com/api/v1/subscribers/<provider>/<identity>/subscription/<subscription_id>/renewals.json -d '{
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
curl -H "X-SUBAUTH: <auth-token>" https://subtype.quintype.com/api/v1/subscription_plans/<subscription-plan-id>/external_subscription_token.json?type=razorpay

{
  "subscription": {
    "id": "sub_8tQNd3qURQJiK5"
  }
}
```
