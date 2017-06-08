## Confirm a customer

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "confirmation_token": "256120"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/confirm
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.confirm({CUSTOMER_ID}, {
  confirmation_token: '256120'
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "6d7c3d91-e0b3-4dc0-9a9d-a60c686f3dbd",
  "phone_number": "+14185800893",
  "country_code": "CA",
  "email": null,
  "first_name": null,
  "last_name": null,
  "time_zone": "UTC",
  "unsubscribed": false,
  "billing_address": {
    "id": "4d49da45-f6e2-4524-80a9-ee0cd9aa364b",
    "type": "BillingAddress",
    "street1": null,
    "street2": null,
    "city": null,
    "state": null,
    "country": null,
    "zip": null,
    "lat": null,
    "lng": null,
    "url": "https://api.dirtylemon.com/l/fddb4c",
    "created_at": "2017-05-16T16:01:14.299Z",
    "updated_at": "2017-05-16T16:01:14.329Z"
  },
  "shipping_address": {
    "id": "9e20e302-28e5-4599-9b98-6ff47bdb37d5",
    "type": "ShippingAddress",
    "street1": null,
    "street2": null,
    "city": null,
    "state": null,
    "country": null,
    "zip": null,
    "lat": null,
    "lng": null,
    "url": "https://api.dirtylemon.com/l/2168a4",
    "created_at": "2017-05-16T16:01:14.284Z",
    "updated_at": "2017-05-16T16:01:14.317Z"
  },
  "card": {
    "exp_month": null,
    "exp_year": null,
    "last4": null,
    "url": "https://api.dirtylemon.com/l/76b9a5"
  },
  "confirmation_token": "368582",
  "confirmed_at": "2017-05-16T16:03:22.798Z",
  "created_at": "2017-05-16T16:01:14.237Z",
  "updated_at": "2017-05-16T16:03:22.804Z"
}
```

This endpoint confirms a customer's phone number:

  - Promotes the customer's `unconfirmed_phone_number` to `phone_number`

<aside class="notice">
  <ul>
    <li>This will fail if the customer is already confirmed.</li>
    <li>This will fail if the customer doesn't have an `unconfirmed_phone_number`</li>
  </ul>
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/confirm`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation_token | yes | Token generated on customer creation |

### Returns

A customer object.
