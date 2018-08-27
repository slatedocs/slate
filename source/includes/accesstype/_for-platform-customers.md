# For Platform Customers

The customers of Quintype platform can use below APIs for subscriptions in Accesstype.

## POST Preview subscription

```shell--request
curl -H "content-type: application/json" https://sketches.quintype.com/api/v1/subscription/preview -d '{
    "member": {
      "email": "example@gmail.com"
    },
    "subscription": {
        "accesstype-plan-id": 7,
        "coupon-code": "",
        "metadata": {
          "city": "Bangalore",
          "state": "Karnataka",
          "house": "Old Airport Road, Murugeshpallya, Bangalore",
          "street": "Old Airport Road, Murugeshpallya, Bangalore",
          "landmark": "Karnataka",
          "pincode": "560017",
          "mobile": "8129612361"
         }
    }}
'
```
```shell--response
```

It returns a preview for a Subscription, without creating a new subscription.
For a successful subscription, it also return an `attempt_token`.

An `attempt_token` is the identifier of a subscription attempt. It should be sent back with [register & subscribe](#post-register-and-subscribe-a-user) api or [subscribe without login](#post-subscribe-without-login) api to mark an attempt as success.

We highly recommend use of this API before accepting payment form a user.

## POST Register And Subscribe a user

```shell--request
curl -H "X-QT-AUTH: sample-auth" -H "Content-Type: application/json" http://sketches.quintype.com/api/v1/register-and-subscribe -d '{
   "member": {
        "email": "ace33@quintype.com",
        "username": "ace 33",
        "password": "password",
        "name": "ace 33",
        "dont-login": false
    },
    "options": {
        "gateway-name": "razorpay"
    },
    "payment": {
        "attributes": {
            "currency": "INR",
            "amount": 100,
            "payment-type": "Razorpay",
            "gateway-payment-id": "pay_123trt465",
            "attributes": ""
        }
    },
    "subscription": {
        "accesstype-plan-id": 4,
        "metadata": {
          "city": "Bangalore",
          "state": "Karnataka",
          "house": "Old Airport Road, Murugeshpallya, Bangalore",
          "street": "Old Airport Road, Murugeshpallya, Bangalore",
          "landmark": "Karnataka",
          "pincode": "560017",
          "mobile": "8129612361"
         }

    },
    "attempt-token": "attempt-token"}
'

```
```shell--response
```

Registers a member and creates subscription in Accesstype. It returns X-QT-AUTH in response headers.

`gateway-name` can be any valid payment-type supported by Accesstype.

`accesstype-plan-id` is the Id of plan in Accesstype.

`attempt-token` can be fetched using [preview](#post-preview-subscription) api. This is an optional parameter but we advice you to use it for better tracking of transactions.



## POST Subscribe Without Login

```shell--request
curl -H "Content-Type: application/json" http://sketches.quintype.com/api/v1/subscribe-without-login?email=example@gmail.com -d '{
    "options": {
        "gateway-name": "razorpay"
    },
    "payment": {
        "attributes": {
            "currency": "INR",
            "amount": 100,
            "payment-type": "Razorpay",
            "gateway-payment-id": "pay_123trt465",
            "attributes": ""
        }
    },
    "subscription": {
        "accesstype-plan-id": 4,
        "currency": "INR",
        "amount": 100,
        "metadata": {
          "city": "Bangalore",
          "state": "Karnataka",
          "house": "Old Airport Road, Murugeshpallya, Bangalore",
          "street": "Old Airport Road, Murugeshpallya, Bangalore",
          "landmark": "Karnataka",
          "pincode": "560017",
          "mobile": "8129612361"
         }

    },
    "attempt-token": "attempt-token"}
'

```
```shell--response
```

It create subscription for a already registered user.
`gateway-name` can be any valid payment-type suppored by Accesstype.

`accesstype-plan-id` is the Id of plan in Accesstype

`attempt-token` can be fetched using [preview](#post-preview-subscription) api. This is an optional parameter but we advice you to use it for better tracking of transactions.


## LIST All subscriptions of a user

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" http://sketches.quintype.com/api/v1/members/me/subscriptions


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
     "renewable": true
    }
  ]
}
```

It gives all subscriptions for a user.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.

## LIST All Assets accessible to user

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" http://sketches.quintype.com/api/v1/members/me/assets

```

```shell--response
{
   "assets":[
      {
       "metadata":{},
       "title":"public",
       "type":"site"
      }
   ]
}

```

It gives all assets accessible to a user.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.

## PATCH Update a subscription

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" -X PATCH http://sketches.quintype.com/api/v1/members/me/subscriptions/<id> -d '{
  "metadata":  {
    "full-name": "hello-world",
    "email": "hello@quintype.com"
  }
}'

```

```shell--response
```
It updates a subscription for user.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.

## PATCH Update all subscriptions

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" -X PATCH http://sketches.quintype.com/api/v1/members/me/subscriptions -d '{
  "metadata":  {
    "full-name": "hello-world",
    "email": "hello@quintype.com"
  }
}'

```

```shell--response
```

It bulk updates **all** subscriptions for user.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.

## POST Renew a subscription

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" -X POST http://sketches.quintype.com/api/v1/members/me/subscriptions/<id>/renewals -d '{
  "coupon_code": "",
  "payment": {
      "payment_type": "razorpay",
      "payment_token": "pay_test_8tNiqdiajurOkj",
      "amount_cents": "99900",
      "amount_currency": "INR"
  }
}'

```
```shell--response
```

This API can be used to renew any renewable subscription.

One can use the optional `metadata` field to set it different from that of the existing subsription. If not passed, it is set to be same as existing subscription.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.



