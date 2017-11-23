# Subscriptions

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
     "payment_type":"manual"
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

{
    "subscription": {
      "id": 322,
      "subscriber_id": 311,
      "subscription_plan_id": 11,
      "created_at": "2017-10-31T16:56:08.949Z",
      "updated_at": "2017-10-31T16:56:08.949Z",
      "assets": [
          {
              "type": "site"
          }
      ],
      "start_timestamp": "2017-09-21T00:00:00.000Z",
      "end_timestamp": "2017-12-21T00:00:00.000Z",
      "deleted_at": null,
      "payment_id": 322,
      "metadata": {
          "full-name": "hello",
          "email": "hello@quintype.com"
      },
      "external_id": null,
      "trial_period_length": null,
      "trial_period_unit": null,
      "coupon_code": "",
      "subscription_group_id": 6,
      "preferred_identity": {
          "provider": "email",
          "value": "hello@quintype.com"
      },
      "group_name": "abroad",
      "plan_name": "abroad-3",
      "duration_length": 3,
      "duration_unit": "months",
      "subscription_type": "individual",
      "active": true,
      "payment_amount": "999.00",
      "payment_type": "razorpay"
    }
}
```

This API can be used to create a subscription.
Here `payment-type` can be one of `razorpay`, `razorpay_recurring`, `androidpay`, `androidpay_recurring`.

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
