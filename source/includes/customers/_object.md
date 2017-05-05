## Customer object

> Example object

```json
{
  "id": "6cbda5ea-aa69-4d06-a7eb-a1656bab4e9d",
  "phone_number": "+14185800893",
  "country_code": "CA",
  "email": "dionne.phil@gmail.com",
  "first_name": "Philippe",
  "last_name": "Dionne",
  "time_zone": "America/Toronto",
  "unsubscribed": false,
  "billing_address": {
    "id": "4d49a9ef-6c9c-4412-90e3-a3cd164162f1",
    "type": "BillingAddress",
    "street1": "1-60 CRÉMAZIE OUEST",
    "street2": "",
    "city": "QUEBEC",
    "state": "QC",
    "country": "CA",
    "zip": "G1R 1X3",
    "lat": null,
    "lng": null,
    "created_at": "2017-05-03T21:06:06.374Z",
    "updated_at": "2017-05-03T21:06:06.374Z"
  },
  "shipping_address": {
    "id": "903f61c0-44bc-4079-a427-483961611f35",
    "type": "ShippingAddress",
    "street1": "1-60 CRÉMAZIE OUEST",
    "street2": "",
    "city": "QUEBEC",
    "state": "QC",
    "country": "CA",
    "zip": "G1R 1X3",
    "lat": "46.8051224",
    "lng": "-71.2270809",
    "created_at": "2017-05-03T21:06:06.368Z",
    "updated_at": "2017-05-03T21:06:11.403Z"
  },
  "card": {
    "exp_month": "8",
    "exp_year": "2019",
    "last4": "4242"
  },
  "billing_address_url": "https://api.dirtylemon.com/l/574c5b",
  "shipping_address_url": "https://api.dirtylemon.com/l/aa5225",
  "card_url": "https://api.dirtylemon.com/l/37e04c",
  "confirmation_token": "256120",
  "confirmed_at": "2017-05-03T16:03:15.887Z",
  "created_at": "2017-05-03T16:02:41.132Z",
  "updated_at": "2017-05-05T13:14:28.670Z"
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
| unsubscribed             | boolean |  |
| billing_address          | hash |  |
| shipping_address         | hash |  |
| card                     | hash |  |
| billing_address_url      | string | Ephemeral url allowing the user to edit his billing address with a form |
| shipping_address_url     | string | Ephemeral url allowing the user to edit his shipping address with a form |
| card_url                 | string | Ephemeral url allowing the user to edit his credit card with a form |
| confirmation_token       | string |  |
| confirmed_at             | timestamp | Time at which the phone number was confirmed |
| created_at               | timestamp | Time at which the object was created |
| updated_at               | timestamp | Time at which the object was updated |
