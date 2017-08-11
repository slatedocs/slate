## Customer object

> Example object

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
  "confirmed_at": "2017-05-16T16:03:22.798Z",
  "created_at": "2017-05-16T16:01:14.237Z",
  "updated_at": "2017-05-16T16:07:17.404Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id                       | string   | Unique identifier for the object |
| phone_number             | string |  |
| country_code             | string | The phone number's ISO 3166 country code |
| email                    | string |  |
| first_name               | string |  |
| last_name                | string |  |
| time_zone                | string |  |
| shipping_rate            | integer | Applicable shipping rate for the current shipping address |
| unsubscribed             | boolean |  |
| billing_address          | hash |  |
| shipping_address         | hash |  |
| card                     | hash |  |
| confirmed_at             | timestamp | Time at which the phone number was confirmed |
| created_at               | timestamp | Time at which the object was created |
| updated_at               | timestamp | Time at which the object was updated |
