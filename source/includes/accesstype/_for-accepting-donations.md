# For Accepting Donations

The below APIs can be used in all the cases when the identity of the user can be ignored.
For example, if you want to accept pure donations and not manage access of any digital content.

All these APIs are safe to call from the front end JS.

## POST Preview a subscription without login

```shell--request
curl -H "content-type: application/json" https://sketches.quintype.com/api/access/v1/subscription-without-login/preview -d '{
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

It returns a preview for a Subscription, without creating a new subscription.
For a successful subscription, it also return an `attempt_token`.

An `attempt_token` is the identifier of a subscription attempt. It should be sent back along with subscription creation API.
We highly recommend use of this API before accepting payment form a user.


## POST Create Subscription without login

```shell--request
curl -H "content-type: application/json" https://sketches.quintype.com/api/access/v1/subscription-without-login -d '{
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

Here `attempt_token` is the token received from [preview](#post-preview-a-subscription-without-login).

This API is safe to call from the front end JS, where it will read session-cookie to determine the current user. Backend callers can use X-QT-AUTH for the same purpose.