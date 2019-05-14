# For Platform Customers

The customers of Quintype platform can use below APIs for subscriptions in Accesstype.

## POST Preview a subscription without login

```shell--request
curl -H "content-type: application/json" https://sketches.quintype.com/api/v1/members/me/subscriptions/preview-without-login -d '{
    "member": {
      "email": "example@gmail.com"
    },
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
  }
}
'
```

```shell--response
{
  "subscription": {
    "invoices": [],
    "next_payment_due_date": null,
    "deleted_at": null,
    "campaign_name": null,
    "payment_amount_currency": "INR",
    "campaign_subscription": false,
    "campaign_id": null,
    "start_timestamp": "2018-07-24T00:00:00.000Z",
    "assets": [
      {
        "title": "Asset Site Title",
        "metadata": {},
        "type": "site"
      }
    ],
    "end_timestamp": "2018-08-24T00:00:00.000Z",
    "payment_amount": "8.50",
    "discount_detail": {
      "code": "NEWYEAR",
      "discount_type": "percent",
      "title": "New Year offer",
      "value": 15,
      "discounted_price_cents": 850,
      "price_cents": 1000,
      "price_currency": "INR"
    },
    "duration_length": 1,
    "dynamic_assets": {},
    "trial_period_length": null,
    "group_description": "Subscription Group Description",
    "renewable": true,
    "subscription_attempt_id": null,
    "subscription_group_id": 4409,
    "coupon_code": "NEWYEAR",
    "recurring": false,
    "payment_type": "preview",
    "cancelled": false,
    "payment_token": null,
    "updated_at": null,
    "coupon_code_id": 81,
    "plan_amount_cents": 1000,
    "status": "expired",
    "group_name": "Test_Subscription_Group1544522619333",
    "external_id": null,
    "active": false,
    "id": null,
    "plan_occurrence": "One Time",
    "in_grace_period": false,
    "code": null,
    "preferred_identity": {
      "provider": "email",
      "value": "qa20Dec2018123234@quintype.com"
    },
    "plan_amount_currency": "INR",
    "expired": true,
    "payment_id": null,
    "plan_name": "Test ",
    "subscription_plan_id": 5594,
    "duration_unit": "months",
    "trial_period_unit": null,
    "subscription_type": "standard",
    "plan_description": "test",
    "cancelled_at": null,
    "metadata": {
      "mobile": "9844089877",
      "full-name": "hello",
      "email": "hello@quintype.com"
    },
    "renewal_reminder_sent_date": null,
    "created_at": null,
    "subscriber_id": 37104,
    "payment_amount_cents": 850
  },
  "attempt_token": "9r1Sctb2pyvocEkwhp1U5Sfq",
  "external_reference_id": null
}
```
This API can be used to preview a subscription when user is not logged in.

It returns a preview for a Subscription, without creating a new subscription.
For a successful subscription, it also return an `attempt_token`.

An `attempt_token` is the identifier of a subscription attempt. It should be sent back with [register & subscribe](#post-register-and-subscribe-a-user) api or [subscribe without login](#post-subscribe-without-login) api to mark an attempt as success.

We highly recommend use of this API before accepting payment form a user.


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
  }
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

## POST Register And Subscribe without login

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
{
    "subscription": {
        "invoices": [
            {
                "amount_after_discount_before_tax": "122.03",
                "amount_currency": "INR",
                "id": 990,
                "invoice_taxes": {
                    "SGST": {
                        "percentage": "9.0",
                        "amount": "10.98",
                        "currency": "INR"
                    },
                    "CGST": {
                        "percentage": "9.0",
                        "amount": "10.98",
                        "currency": "INR"
                    }
                },
                "amount_cents": 14400,
                "base_price": "152.54",
                "sequenced_invoice_number": "BQ/1819/SUB/167",
                "discount_details": {
                    "code": "UAT",
                    "discount_percentage": 20,
                    "discount_amount": "30.51"
                },
                "created_at": "2018-12-12T10:25:48.590Z"
            }
        ],
        "next_payment_due_date": null,
        "deleted_at": null,
        "campaign_name": null,
        "payment_amount_currency": "INR",
        "campaign_subscription": false,
        "campaign_id": null,
        "start_timestamp": "2021-08-07T11:28:46.271Z",
        "assets": [
            {
                "title": "Site",
                "metadata": {},
                "type": "site"
            },
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
            },
            {
                "title": "All Story",
                "metadata": {
                    "access_level": "999"
                },
                "type": "story"
            }
        ],
        "end_timestamp": "2021-11-07T11:28:46.271Z",
        "payment_amount": "144.00",
        "discount_detail": {
            "code": "UAT",
            "discount_type": "percent",
            "title": "UAT Trial",
            "value": 20,
            "discounted_price_cents": 14400,
            "price_cents": 18000,
            "price_currency": "INR"
        },
        "duration_length": 3,
        "dynamic_assets": {},
        "trial_period_length": null,
        "group_description": "Silver + Access to Exclusive Reportage + Monthly round-up magazines",
        "renewable": false,
        "subscription_attempt_id": 96595,
        "subscription_group_id": 2197,
        "coupon_code": "UAT",
        "recurring": false,
        "payment_type": "razorpay",
        "cancelled": false,
        "payment_token": "pay_BWpQWQcLLK3L37",
        "updated_at": "2018-12-12T10:25:48.494Z",
        "coupon_code_id": 82,
        "plan_amount_cents": 18000,
        "status": "pending",
        "group_name": "Unlimited",
        "external_id": null,
        "active": false,
        "id": 32405,
        "plan_occurrence": "One Time",
        "in_grace_period": false,
        "code": null,
        "preferred_identity": {
            "provider": "quintype",
            "value": "251933"
        },
        "plan_amount_currency": "INR",
        "expired": false,
        "payment_id": 32379,
        "plan_name": "3 months",
        "subscription_plan_id": 2118,
        "duration_unit": "months",
        "trial_period_unit": null,
        "subscription_type": "standard",
        "plan_description": "All assets ",
        "cancelled_at": null,
        "metadata": {
            "mobile_number": "7639817688"
        },
        "renewal_reminder_sent_date": null,
        "created_at": "2018-12-12T10:25:48.494Z",
        "subscriber_id": 9311,
        "payment_amount_cents": 14400
    }
}
```

Registers a member and creates subscription in Accesstype. To be used for users that have not logged in. It returns X-QT-AUTH in response headers.

`gateway-name` can be any valid payment-type supported by Accesstype.

`accesstype-plan-id` is the Id of plan in Accesstype.

`attempt-token` can be fetched using [preview](#post-preview-subscription) api. This is an optional parameter but we advice you to use it for better tracking of transactions.


## POST Create Subscription for logged in user

```shell--request
curl -H "X-QT-AUTH: <your-auth-token>" -H "Content-Type: application/json" -X POST http://sketches.quintype.com/api/v1/members/me/subscriptions -d '{
  "subscription": {
    "subscription_plan_id": "2118",
    "coupon_code": "UAT",
    "payment": {
        "payment_type": "razorpay",
        "payment_token": "pay_BWpQWQcLLK3L37",
        "amount_cents": "14400",
        "amount_currency": "INR"
    },
    "metadata":  {
        "full-name": "hello",
        "email": "hello@quintype.com"
    },
    "start_timestamp": "2018-09-21 00:00:00"
  },
  "attempt_token": "fo4bMWjP6N5vtVySNtiAUNBQ"
}'
```
```shell--response
{
    "subscription": {
        "invoices": [
            {
                "amount_after_discount_before_tax": "122.03",
                "amount_currency": "INR",
                "id": 990,
                "invoice_taxes": {
                    "SGST": {
                        "percentage": "9.0",
                        "amount": "10.98",
                        "currency": "INR"
                    },
                    "CGST": {
                        "percentage": "9.0",
                        "amount": "10.98",
                        "currency": "INR"
                    }
                },
                "amount_cents": 14400,
                "base_price": "152.54",
                "sequenced_invoice_number": "BQ/1819/SUB/167",
                "discount_details": {
                    "code": "UAT",
                    "discount_percentage": 20,
                    "discount_amount": "30.51"
                },
                "created_at": "2018-12-12T10:25:48.590Z"
            }
        ],
        "next_payment_due_date": null,
        "deleted_at": null,
        "campaign_name": null,
        "payment_amount_currency": "INR",
        "campaign_subscription": false,
        "campaign_id": null,
        "start_timestamp": "2021-08-07T11:28:46.271Z",
        "assets": [
            {
                "title": "Site",
                "metadata": {},
                "type": "site"
            },
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
            },
            {
                "title": "All Story",
                "metadata": {
                    "access_level": "999"
                },
                "type": "story"
            }
        ],
        "end_timestamp": "2021-11-07T11:28:46.271Z",
        "payment_amount": "144.00",
        "discount_detail": {
            "code": "UAT",
            "discount_type": "percent",
            "title": "UAT Trial",
            "value": 20,
            "discounted_price_cents": 14400,
            "price_cents": 18000,
            "price_currency": "INR"
        },
        "duration_length": 3,
        "dynamic_assets": {},
        "trial_period_length": null,
        "group_description": "Silver + Access to Exclusive Reportage + Monthly round-up magazines",
        "renewable": false,
        "subscription_attempt_id": 96595,
        "subscription_group_id": 2197,
        "coupon_code": "UAT",
        "recurring": false,
        "payment_type": "razorpay",
        "cancelled": false,
        "payment_token": "pay_BWpQWQcLLK3L37",
        "updated_at": "2018-12-12T10:25:48.494Z",
        "coupon_code_id": 82,
        "plan_amount_cents": 18000,
        "status": "pending",
        "group_name": "Unlimited",
        "external_id": null,
        "active": false,
        "id": 32405,
        "plan_occurrence": "One Time",
        "in_grace_period": false,
        "code": null,
        "preferred_identity": {
            "provider": "quintype",
            "value": "251933"
        },
        "plan_amount_currency": "INR",
        "expired": false,
        "payment_id": 32379,
        "plan_name": "3 months",
        "subscription_plan_id": 2118,
        "duration_unit": "months",
        "trial_period_unit": null,
        "subscription_type": "standard",
        "plan_description": "All assets ",
        "cancelled_at": null,
        "metadata": {
            "mobile_number": "7639817688"
        },
        "renewal_reminder_sent_date": null,
        "created_at": "2018-12-12T10:25:48.494Z",
        "subscriber_id": 9311,
        "payment_amount_cents": 14400
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
  "subscriptions": [
    {
      "invoices": [
        {
          "amount_after_discount_before_tax": "122.03",
          "amount_currency": "INR",
          "id": 990,
          "invoice_taxes": {
            "SGST": {
              "percentage": "9.0",
              "amount": "10.98",
              "currency": "INR"
            },
            "CGST": {
              "percentage": "9.0",
              "amount": "10.98",
              "currency": "INR"
            }
          },
          "amount_cents": 14400,
          "base_price": "152.54",
          "sequenced_invoice_number": "BQ/1819/SUB/167",
          "discount_details": {
            "code": "UAT",
            "discount_percentage": 20,
            "discount_amount": "30.51"
          },
          "created_at": "2018-12-12T10:25:48.590Z"
        }
      ],
      "id": 713,
      "subscriber_id": 453,
      "subscription_plan_id": 16,
      "created_at": "2017-10-30T10:55:42.201Z",
      "updated_at": "2017-10-30T10:55:42.201Z",
      "assets": [
        {
          "metadata": {},
          "title": "public",
          "type": "site"
        }
      ],
      "start_timestamp": "2017-10-30T10:55:42.176Z",
      "end_timestamp": "2017-11-13T10:55:42.176Z",
      "deleted_at": null,
      "payment_id": 668,
      "metadata": {
        "Name": "Sample User",
        "Address": "Sample add",
        "Phone Number": "1111111111"
      },
      "external_id": null,
      "trial_period_length": null,
      "trial_period_unit": null,
      "coupon_code": null,
      "subscription_group_id": 21,
      "preferred_identity": {
        "provider": "email",
        "value": "sample@gmail.com"
      },
      "group_name": "Sub Group 1",
      "plan_name": "Sub Plan 1",
      "duration_length": 2,
      "duration_unit": "weeks",
      "subscription_type": "individual",
      "active": true,
      "payment_amount": "0.00",
      "payment_type": "manual",
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


## GET prices of Assets

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


## GET Access details [DEPRECATED]

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

## GET Access details with metering
```shell--request

$ curl -X GET 'https://sketches.quintype.com/api/access/v1/stories/<story-id>/access'

```
```shell--response

{
  "granted": true,
  "grantReason": "METERING",
  "data": {
    "numberRemaining": 6,
    "isLoggedIn": true
  }
}

```
It is a credentialed CORS GET endpoint.

The properties in the response are:

* "granted" - boolean stating if the access to the document is granted or not.
* "grantReason" - the string of the reason for giving the access to the document, recognized reasons are either SUBSCRIBER meaning the user is fully subscribed or METERING meaning user is on metering.
* "data" - any free form data which can be used for render templating.

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user and thin-mint cookie for determining meter identity.

| Element|Occurrence|Data Type| Description |
|-|-|-|-|
|granted|Mandatory|boolean| `true`, `false` Indicates that the user is granted access to the content or not.|
|grantReason|Mandatory when `granted`=`true`|enum|The reason why access is granted to the user. `METERING` : The user was granted access as the paywall meter was consumed.`SUBSCRIBER` : The user was granted access as the user was identified as an active subscriber. |
|data.numberRemaining|optional|integer|The number of articles/stories remaining for the user to be granted access to because of the paywall meter. Appears when granted=`true` and `grantReason` = `METERING` when the paywall meter for the user was consumed.|
|data.isLoggedIn|optional|boolean|Indicates if the user was logged in or not. |

*Note* An additional query param `disable-meter=true` needs to be sent for stories behind hard paywall. Such stories will not be metered and access will be granted only to subscribers.

## POST Pingback and update meter
```shell--request

$ curl -H "Content-Type: text/plain" -X POST 'https://sketches.quintype.com/api/access/v1/stories/<story-id>/pingback -d {
  "granted": true,
  "grantReason": "METERING",
  "data": {
    "numberRemaining": 6,
    "isLoggedIn": true
  }
}'

```
```shell--response

```
It is a credentialed CORS POST endpoint to be used for the Publisher to update metering information. Call this endpoint when the Reader has started viewing the document.

This API is safe to call from the front end JS, where it will read thin-mint cookie for determining meter identity.

Important: The pingback JSON object is sent with Content-type: text/plain. This is intentional as it removes the need for a CORS preflight check.



## GET Invoice pdf download

```shell--request
 curl -H "X-QT-AUTH: <your-auth-token>" -X GET 'http://sketches.quintype.com/api/v1/members/me/subscriptions/<subscriptionId>/invoices/<invoiceId>/download'
```
```shell--response
It returns the invoice file in pdf format.
```
This API is used by publishers on the Quintype platform, to download the invoice in the pdf format.

### Invoice Template Variables

The below format considers the price inclusive of taxes.

| Name| Description |
|-|-|
| user_name                        | Name of the user in the accesstype who purchased the subscription                                                                                                                                                                                                                                                           |
| invoice_number                   | The sequence of invoice number for that account. Example: publisher_name/1, publiser_name/2                                                                                                                                                                                                                                 |
| user_email                       | Email of the user in the accesstype who purchased the subscription                                                                                                                                                                                                                                                          |
| date                             | Date of purchase of subscription. Example: 11 Dec 2018                                                                                                                                                                                                                                                                      |
| payment_method                   | Payment gateway used by the purchaser. Example: razorpay, simpl, paytm                                                                                                                                                                                                                                                      |
| recurring                        | true if it's a recurring subscription, false if it's a one time payment                                                                                                                                                                                                                                                     |
| base_price                       | Basic price is the amount receivable by the publisher from the user for the purchase of subscription minus any tax on the product.For example if 110 is the price paid by the user and 10 % if the tax specified by the admin. The base price is calculated by the following formula (110/(1+10/100)), which equals 100     |
| subscription_group_title         | The subscription group name, the subscription plan belongs to                                                                                                                                                                                                                                                               |
| subscription_plan_title          | The subscription plan name, for which the user purchases a subscription                                                                                                                                                                                                                                                     |
| subscription_plan_price          | The price of the subscription plan, specified by the admin without any discount applied                                                                                                                                                                                                                                     |
| amount_paid                      | The amount received from the user. If the user applies a discount, discount is applied on the plan amount.                                                                                                                                                                                                                  |
| discount_details                 | It's a hash with following fields code - which represents the discount code applied by the user discount_percentage - which represents the percentage of discount applied discount_amount - which represents the amount of the discount Example: {"code" => "UAT","discount_percentage" => 20,"discount_amount" => "77.97"} |
| taxes                            | It's a hash with tax objects. If multiple taxes are specified by the admin, multiple tax objects will be present in this object {"SGST" => {"percentage" => "9.0","amount" => "28.07","currency" => "INR"},  "CGST" => {"percentage" => "9.0","amount" => "28.07","currency" => "INR"} }                                    |
| subscription_end_date            | Represents the end date of the subscription                                                                                                                                                                                                                                                                                 |
| dynamic_assets                   | This is applicable for pay per asset type of subscriptions. Suppose if user purchases a storytitle, slug will be available in this field  Example: [{id: "some_asset_id", title: "Some title", slug: "/some-slug"}]                                                                                                         |
| amount_after_discount_before_tax | This amount is arrived at, when discount is applied on the base price|
|round_off|The amount that was rounded off in calculating the amount paid by the subscriber from the calculated base price, price after discount and taxes.|
