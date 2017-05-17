## Create a customer

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "unconfirmed_phone_number": "1 333-333-333"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.create({
  unconfirmed_phone_number: "+14185800893",
  first_name: "Philippe",
  last_name: "Dionne",
  email: "dionne.phil@gmail.com"
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "6d7c3d91-e0b3-4dc0-9a9d-a60c686f3dbd",
  "unconfirmed_phone_number": "+14185800893",
  "country_code": "CA",
  "email": "dionne.phil@gmail.com",
  "first_name": "Philippe",
  "last_name": "Dionne",
  "time_zone": "UTC",
  "shipping_rate": 0,
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
  "confirmed_at": null,
  "created_at": "2017-05-16T16:01:14.237Z",
  "updated_at": "2017-05-16T16:01:15.079Z"
}
```

With `confirmation`:

  - Creates an unconfirmed customer
  - Generates a confirmation token valid for 30 minutes
  - Fires a `verification` event

Without `confirmation`:

  - Creates a confirmed customer


### HTTP Request

`POST https://api.dirtylemon.com/v1/customers`

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation | no | Wether or not to perform the confirmation flow. Default to `true` |
| unconfirmed_phone_number | yes | Unique phone number |
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.
