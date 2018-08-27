# Subscription Gifts

## POST Create a Subscription for gifting

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscription_gifts.json -d '{
  "name": "Adam",
  "recipient_subscriber": {
    "recipient_identity_provider": "email",
    "recipient_identity": "somefriend@foo.com"
  },
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
        "full-name": "somefriend",
        "email": "somefriend@foo.com"
    },
    "start_timestamp": "2017-09-21 00:00:00"
  },
  "alternate_provider": "email",
  "alternate_identity": "hey@quintype.com"
}'
```
```shell--response
```

This API can be used to create a subscription and gift it to a `recipient_subscriber`.
`recipient_subscriber` details are required.
It returns a Subscription Object in response

## LIST Subscriptions gifted by a user

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscription_gifts.json

```
```shell--response
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