## Retrieve a customer

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.retrieve({CUSTOMER_ID})
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
  "email": "dionne.phil@gmail.com",
  "first_name": "Philippe",
  "last_name": "Dionne",
  "time_zone": "America/New_York",
  "shipping_rate": 0,
  "unsubscribed": false,
  "billing_address": {
    "id": "a4b7609e-7c00-41dd-acec-2856a2b53364",
    "type": "BillingAddress",
    "street1": "95 GRAND ST",
    "street2": "",
    "city": "NEW YORK",
    "state": "NY",
    "country": "US",
    "zip": "10013-5902",
    "lat": null,
    "lng": null,
    "url": "https://api.dirtylemon.com/l/b77dff",
    "created_at": "2017-05-16T16:07:15.130Z",
    "updated_at": "2017-05-16T16:07:15.151Z"
  },
  "shipping_address": {
    "id": "562ba11b-dd1a-4c4e-91b9-07c115d720dc",
    "type": "ShippingAddress",
    "street1": "95 GRAND ST",
    "street2": "",
    "city": "NEW YORK",
    "state": "NY",
    "country": "US",
    "zip": "10013-5902",
    "lat": "40.7213413",
    "lng": "-74.0020398",
    "url": "https://api.dirtylemon.com/l/575817",
    "created_at": "2017-05-16T16:07:15.124Z",
    "updated_at": "2017-05-16T16:07:17.331Z"
  },
  "card": {
    "exp_month": "8",
    "exp_year": "2019",
    "last4": "4242",
    "url": "https://api.dirtylemon.com/l/a6bbee"
  },
  "confirmation_token": "368582",
  "confirmed_at": "2017-05-16T16:03:22.798Z",
  "created_at": "2017-05-16T16:01:14.237Z",
  "updated_at": "2017-05-16T16:07:17.404Z"
}
```

This endpoint retrieves a specific customer. Use this endpoint to generate short and ephemeral URLs allowing the customer to edit his informations.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

A customer object.
