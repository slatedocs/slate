## List all customers

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers?phone_number=%2B1234567890
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.list({ phone_number: '+1234567890'})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
[
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
    "confirmed_at": "2017-05-16T16:03:22.798Z",
    "created_at": "2017-05-16T16:01:14.237Z",
    "updated_at": "2017-05-16T16:07:17.404Z"
  }
]
```

This endpoint lists customers with a given phone number. Customers can be either __confirmed__ or __unconfirmed__. Since phone numbers must be unique, this endpoint will always return a list with a single element.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers?phone_number=phone_number`

### Query params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| phone_number | yes | A phone number encoded according to [encodeURIComponent](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/encodeURIComponent) |


### Returns

A collection of customer objects.
