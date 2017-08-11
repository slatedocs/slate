## Event object

> Example object

```json
{
  "id": "7f8e3fdc-44a2-4b0c-b4f0-f0df4a11d099",
  "name": "customer.updated",
  "created_at": "2017-08-08T13:54:09.766Z",
  "data": {
    "id": "6547bfaf-9cd9-43bf-abf5-6e3fd22df2a2",
    "card": {
      "url": "http://localhost:5000/l/622a3661",
      "last4": null,
      "exp_year": null,
      "exp_month": null
    },
    "email": "philippe@dirtylemon.com",
    "last_name": "Musk",
    "reference": "9559c5",
    "time_zone": "UTC",
    "created_at": "2017-08-08T13:50:47.855Z",
    "first_name": "Elon",
    "updated_at": "2017-08-08T13:54:09.662Z",
    "confirmed_at": "2017-08-08T13:54:09.660Z",
    "country_code": "CA",
    "phone_number": "+14185800893",
    "unsubscribed": false,
    "billing_address": {
      "id": "64084e6a-6a5c-436f-8888-971eef7c04c0",
      "lat": null,
      "lng": null,
      "url": "http://localhost:5000/l/c4766493",
      "zip": null,
      "city": null,
      "type": "BillingAddress",
      "state": null,
      "country": null,
      "street1": null,
      "street2": null,
      "created_at": "2017-08-08T13:50:47.884Z",
      "updated_at": "2017-08-08T13:50:47.884Z"
    },
    "shipping_address": {
      "id": "4530fad5-c939-4a59-be3a-9467c1b389bf",
      "lat": null,
      "lng": null,
      "url": "http://localhost:5000/l/1cb4d262",
      "zip": null,
      "city": null,
      "type": "ShippingAddress",
      "state": null,
      "country": null,
      "street1": null,
      "street2": null,
      "created_at": "2017-08-08T13:50:47.881Z",
      "updated_at": "2017-08-08T13:50:47.881Z"
    }
  }
}
```

An `Event` object is created for major things happening while interacting with the API. Note that many API requests may cause multiple events to be created. For example, creating a new customer will trigger both a `customer.created` event and a `address.created` event.


| Attribute  | Type      | Description |
| ---------- | --------- | ------------|
| id         | string    | Unique identifier for the object |
| name       | string    | Description of the event |
| created_at | timestamp | Time at which the object was created |
| data       | hash      | Object containing data associated with the event. |
