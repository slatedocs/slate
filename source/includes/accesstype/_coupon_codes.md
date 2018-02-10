# Coupon codes

## GET discount details for a subscription plan

```shell
$ curl -H "X-SUBAUTH: <auth-token>" https://www.accesstype.com/api/v1/subscription_plans/<subscription-plan-id>/coupon_codes/<code>/validate.json

{
  "discount_details": {
    "code": "TEST100",
    "discount_type": "amount",
    "title": "test-100",
    "value": 1000,
    "discounted_price_cents": 28900,
    "price_cents": 29900,
    "price_currency": "INR"
  },
  "message": "Applied successfully"
}

```

It returns discount details for a active coupon code.
