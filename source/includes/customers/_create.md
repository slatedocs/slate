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
  email: "philippe@dirtylemon.com"
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "6547bfaf-9cd9-43bf-abf5-6e3fd22df2a2",
  "reference": "9559c5",
  "unconfirmed_phone_number": "+14185800893",
  "country_code": "CA",
  "email": "philippe@dirtylemon.com",
  "first_name": "Philippe",
  "last_name": "Dionne",
  "time_zone": "UTC",
  "unsubscribed": false,
  "billing_address": {
    "id": "64084e6a-6a5c-436f-8888-971eef7c04c0",
    "type": "BillingAddress",
    "street1": null,
    "street2": null,
    "city": null,
    "state": null,
    "country": null,
    "zip": null,
    "lat": null,
    "lng": null,
    "url": "http://localhost:5000/l/c4766493",
    "created_at": "2017-08-08T13:50:47.884Z",
    "updated_at": "2017-08-08T13:50:47.884Z"
  },
  "shipping_address": {
    "id": "4530fad5-c939-4a59-be3a-9467c1b389bf",
    "type": "ShippingAddress",
    "street1": null,
    "street2": null,
    "city": null,
    "state": null,
    "country": null,
    "zip": null,
    "lat": null,
    "lng": null,
    "url": "http://localhost:5000/l/1cb4d262",
    "created_at": "2017-08-08T13:50:47.881Z",
    "updated_at": "2017-08-08T13:50:47.881Z"
  },
  "card": {
    "exp_month": null,
    "exp_year": null,
    "last4": null,
    "url": "http://localhost:5000/l/622a3661"
  },
  "confirmation_token": "92575",
  "confirmed_at": null,
  "created_at": "2017-08-08T13:50:47.855Z",
  "updated_at": "2017-08-08T13:50:48.836Z"
}
```

With `confirmation`:

  - Creates an unconfirmed customer
  - Generates a confirmation token

Without `confirmation`:

  - Creates a confirmed customer
  - A `unconfirmed_phone_number` attribute must be present


### HTTP Request

`POST https://api.dirtylemon.com/v1/customers`

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation | no | Wether or not to perform the confirmation flow. Default to `true` |
| unconfirmed_phone_number | no | Unique phone number |
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.
