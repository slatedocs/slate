# Subscriptions

Subscription plan and Payment information is required to create a subscription for a user.
`payment-type` can be one of `razorpay`, `razorpay_recurring`, `androidpay`, `androidpay_recurring`.
It can also be set to `manual` to create subscriptions not involving payments.

## LIST Subscriptions for a user

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json


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
      "renewable": true,
      "coupon_code_id": 6,
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

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/preview.json -d '{
    "subscription": {
        "alternate_provider": "email",
        "alternate_identity": "hey@quintype.com",
        "subscription_type": "standard",
        "subscription_plan_id": 2118,
        "coupon_code": "UAT",
        "payment": {
            "payment_type": "razorpay",
            "amount_cents": 14400,
            "amount_currency": "INR"
        },
        "metadata": {
            "mobile_number": "7639817688"
        }
    },
    "fingerprint": ""
}'
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
        "subscription_attempt_id": null,
        "subscription_group_id": 2197,
        "coupon_code": "UAT",
        "recurring": false,
        "payment_type": "preview",
        "cancelled": false,
        "payment_token": null,
        "updated_at": null,
        "coupon_code_id": 82,
        "plan_amount_cents": 18000,
        "status": "pending",
        "group_name": "Unlimited",
        "external_id": null,
        "active": false,
        "id": null,
        "plan_occurrence": "One Time",
        "in_grace_period": false,
        "code": null,
        "preferred_identity": {
            "provider": "email",
            "value": "vamsi@quintype.com"
        },
        "plan_amount_currency": "INR",
        "expired": false,
        "payment_id": null,
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
        "created_at": null,
        "subscriber_id": 9311,
        "payment_amount_cents": 14400
    },
    "attempt_token": "WnwxA2AVrE3xqcDUqrSb3sNm",
    "external_reference_id": null
}
```

It returns a preview for a Subscription, without creating a new subscription.
For a successful subscription, it also return an `attempt_token`.

An `attempt_token` is the identifier of a subscription attempt. It should be sent back with [create subscription](#post-create-a-subscription) api to mark an attempt as success.

This API must be used before accepting payment from a user.

One can pass the value for `payment.payment_type` as `razorpay_recurring` when making the preview API call to get `external_reference_id` and `attempt_token` in response.

## POST Create a Subscription

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json -d '{
    "subscription": {
        "subscription_type": "standard",
        "subscription_plan_id": 2118,
        "coupon_code": "UAT",
        "payment": {
            "payment_type": "razorpay",
            "amount_cents": 14400,
            "amount_currency": "INR",
            "payment_token": "pay_BWpQWQcLLK3L37"
        },
        "metadata": {
            "mobile_number": "7639817688"
        }
    },
    "alternate_provider": "email",
    "alternate_identity": "hey@quintype.com",
    "attempt_token": "WnwxA2AVrE3xqcDUqrSb3sNm"
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

Here `attempt_token` is the token received from [preview](#post-preview-a-subscription).

Use `campaign_id` optional field to create subscription for specific campaign.

It returns a Subscription Object in response

## PATCH update attributes

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -X PATCH -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<id>.json -d '{
  "subscription": {
    "metadata":  {
        "full-name": "hello-world",
        "email": "hello@quintype.com"
    }
  }
}'
```
```shell--response
```

This API can be used to update the attributes for a subscription of a subscriber

## PATCH bulk update attributes

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -X PATCH -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions.json -d '{
  "metadata":  {
    "full-name": "hello-world",
    "email": "hello@quintype.com"
  }
}'
```
```shell--response
```

This API can be used to update the attributes of **all** active subscriptions of a subscriber

## DELETE a subscription

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -X "DELETE" -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<subscription-id>.json
```
```shell--response
```

This API can be used to delete a subscription(THIS API WILL BE DEPRECATED SOON IN FAVOUR OF CANCEL Subscription API)

## CANCEL a subscription

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -X "PUT" -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<subscription-id>/cancel.json
```
```shell--response
```

This API can be used to cancel a subscription

## POST renew a subscription

```shell--request
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
```shell--response
```

This API can be used to renew any renewable subscription.
Subscriptions to recurring-plans are not renewable.
The new subscription starts immediately or at the end of active subscription.

One can use the optional `metadata` field to set it different from that of the existing subsription. If not passed, it is set to be same as existing subscription.

It returns a Subscription Object in response


# Recurring Subscriptions

In order to register a recurring subscription with some providers (such as razorpay), it is mandatory to register a subscription upstream.

## POST register a recurring subscription

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -X POST -H "Content-Type: application/json" https://www.accesstype.com/api/v1/subscription_plans/<subscription-plan-id>/external_subscription_token.json -d '{
  "type": "razorpay",
  "attempt_token": "fo4bMWjP6N5vtVySNtiAUNBQ"
}'

{
  "subscription": {
    "id": "sub_8tQNd3qURQJiK5"
  }
}
```
```shell--response
```

`attempt_token` is optional param and must be sent if the external subscription is not to start immediately.

**NOTE**:- This API will soon be deprecated, as the same can now be achieved by [preview API](#post-preview-a-subscription).
