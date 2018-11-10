# For Platform Customers

The customers of Quintype platform can use below APIs for subscriptions in Accesstype.


## POST Preview a subscription for logged in user

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "content-type: application/json" https://sketches.quintype.com/api/v1/api/v1/members/me/subscriptions/preview -d '{
  "subscription": {
    "subscription_plan_id": "11",
    "coupon_code": "NEWYEAR",
    "payment": {
        "payment_type": "razorpay",
        "amount_cents": "99900",
        "amount_currency": "INR"
    },
    "metadata":  {
        "full-name": "hello",
        "email": "hello@quintype.com"
    },
    "start_timestamp": "2017-09-21 00:00:00"
  },
  "name": "Ben"
}
'
```
```shell--response
  {
    "subscription": {
        "id": null,
        "subscriber_id": 8302,
        "subscription_plan_id": 11,
        "created_at": null,
        "updated_at": null,
        "assets": [],
        "start_timestamp": "2218-09-29T19:54:02.833Z",
        "end_timestamp": "2318-09-29T19:54:02.833Z",
        "deleted_at": null,
        "payment_id": null,
        "metadata": {
          "full-name": "hello",
          "email": "hello@quintype.com"
        },
        "external_id": null,
        "trial_period_length": null,
        "trial_period_unit": null,
        "code": null,
        "discount_detail": {},
        "coupon_code_id": null,
        "campaign_id": null,
        "plan_amount_cents": 50000,
        "plan_amount_currency": "INR",
        "duration_unit": "lifetime",
        "duration_length": 1,
        "plan_name": "life time ",
        "plan_description": "life time ",
        "group_name": "prod test 30 aug",
        "group_description": "prod test 30 aug",
        "subscription_type": "standard",
        "plan_occurrence": "One Time",
        "subscription_attempt_id": null,
        "renewal_reminder_sent_date": null,
        "dynamic_assets": {},
        "subscription_group_id": 2313,
        "preferred_identity": {
            "provider": "email",
            "value": "biswajit+29@quintype.com"
        },
        "active": false,
        "payment_amount": "0.00",
        "payment_amount_cents": 0,
        "payment_amount_currency": "USD",
        "payment_type": "manual",
        "payment_token": null,
        "renewable": false,
        "status": "pending",
        "expired": false,
        "coupon_code": "NEWYEAR,
        "campaign_name": null,
        "campaign_subscription": false,
        "recurring": false,
        "cancelled_at": null,
        "next_payment_due_date": null,
        "cancelled": false,
        "in_grace_period": false
    },
    "attempt_token": "SSLvhLBEWiMxcEiMKgHxATpJ",
    "external_reference_id": null
}
```

It returns a preview for a Subscription, without creating a new subscription.
For a successful subscription, it also return an `attempt_token`.

An `attempt_token` is the identifier of a subscription attempt. It should be sent back with [create-subscription](#post-create-subscription-for-logged-in-user) api.

We highly recommend use of this API before accepting payment form a user.



## POST Create Subscription for logged in user

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" -X POST http://sketches.quintype.com/api/v1/members/me/subscriptions -d '{
  "subscription": {
    "subscription_plan_id": "11",
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
  "attempt_token": "fo4bMWjP6N5vtVySNtiAUNBQ",
  "name": "Ben"
}'
```
```shell--response
{
    "subscription": {
        "next_payment_due_date": null,
        "subscription-display": "digital-3",
        "deleted_at": null,
        "campaign_name": null,
        "payment_amount_currency": "INR",
        "campaign_subscription": false,
        "campaign_id": null,
        "start_timestamp": "2019-06-05T10:16:58.901Z",
        "assets": [
            {
                "title": "public",
                "metadata": {},
                "type": "site"
            }
        ],
        "end_timestamp": "2019-09-05T10:16:58.901Z",
        "payment_amount": "299.00",
        "subscriber-id": 8478,
        "discount_detail": {},
        "duration_length": 3,
        "dynamic_assets": {},
        "trial_period_length": null,
        "group_description": "Digital",
        "renewable": false,
        "subscription_attempt_id": 3121,
        "subscription_group_id": 24,
        "coupon_code": "NEWYEAR",
        "recurring": false,
        "payment_type": "manual",
        "cancelled": false,
        "payment_token": null,
        "updated_at": "2018-09-05T11:58:19.988Z",
        "coupon_code_id": null,
        "subscription-status": "inactive",
        "subscribed-till": "2019-09-05",
        "plan_amount_cents": 29900,
        "status": "pending",
        "group_name": "digital",
        "external_id": null,
        "active": false,
        "id": 12158,
        "plan_occurrence": "One Time",
        "in_grace_period": false,
        "code": null,
        "preferred_identity": {
            "provider": "email",
            "value": "ace333@quintype.com"
        },
        "plan_amount_currency": "INR",
        "expired": false,
        "payment_id": 12132,
        "plan_name": "digital-3",
        "subscription_plan_id": 11,
        "duration_unit": "months",
        "trial_period_unit": null,
        "subscription_type": "standard",
        "subscription-plan": null,
        "plan_description": null,
        "cancelled_at": null,
        "payment-id": 12132,
        "metadata": {
          "full-name": "hello",
          "email": "hello@quintype.com"
        },
        "renewal_reminder_sent_date": null,
        "created_at": "2018-09-05T11:58:19.906Z",
        "subscriber_id": 8478,
        "payment_amount_cents": 29900
    }
}
```

This API can be used to create a subscription.

Here `attempt_token` is the token received from [preview](#post-preview-a-subscription-for-logged-in-user).

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.


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

## POST Renew a subscription for logged in user

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
    }
}
'
```
```shell--response
```
This API can be used to preview a subscription when user is not logged in.

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


## POST Create Wallet

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" -X POST http://sketches.quintype.com/api/v1/members/me/subscriber-wallets -d '{
  "subscriber_wallet": {
        "provider": "simpl",
        "metadata": {
            "token": "thenashfsdfvyurn8g9w85gjf"
        }
    }
}'

```
```shell--response
 {
  "subscriber_wallet": {
    "provider": "simpl",
    "metadata": {
      "token": "thenashfsdfvyurn8g9w85gjf"
      }
    }
  }
```

This API can be used to add/update wallets for a user.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.

## GET List Wallets

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" http://sketches.quintype.com/api/v1/members/me/subscriber-wallets

```

```shell--response
{
  "subscriber_wallets": ["paytm"]
}

```

This API can be used to get wallets for a user.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.

## DELETE Wallets

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" http://sketches.quintype.com/api/v1/members/me/subscriber-wallets -X DELETE

```

This API can be used to delete all wallets of a user.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.


## Get prices of Assets

```shell--request
curl -X GET 'http://sketches.quintype.com/api/v1/asset/<asset-type>/pricing-plans?id=123456'
```

```shell--response
{
    "pricing_plans": [
        {
            "id": 1071,
            "price_cents": 1400,
            "price_currency": "INR",
            "duration_length": 1,
            "duration_unit": "lifetime"
        },
        {
            "id": 1959,
            "price_cents": 1000,
            "price_currency": "INR",
            "duration_length": 1,
            "duration_unit": "months"
        }
    ]
}
```
This API returns the prices of a story or a collection when sold individually.


|Parameter|Type|Occurrence|Description|
|---  |---  |---  |---  |
|`/<asset-type>/`|string|1|The type of asset that is being purchased. Valid Values for Quintype CMS `story`,`collection`|
|`id`|string|1|The identifier of the story or collection that is being purchased.|
|`collection_id[]`|string|0 or many|The identifier of the collection that the story belongs to. Used when the value of `/<asset-type>/` is `story`.|


## GET Access details

```shell--request
 curl -H "X-QT-AUTH: <your-auth-token>" -X GET 'http://sketches.quintype.com/api/v1/stories/<story-id>/access-data'
```

```shell--response
 {
    "access-data": {
        "name": "subtype"
    }
 }
```

This API can be used to get access details of any story for a user.

It returns 403 if the story is not accessible to user, else 200.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.





