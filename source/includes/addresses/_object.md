## Address object

> Example object

```json
{
  "id": "4530fad5-c939-4a59-be3a-9467c1b389bf",
  "type": "ShippingAddress",
  "street1": "128 LAFAYETTE ST",
  "street2": "",
  "city": "NEW YORK",
  "state": "NY",
  "country": "US",
  "zip": "10013-3174",
  "lat": "40.7213413",
  "lng": "-74.0020399",
  "url": "http://localhost:5000/l/1cb4d262",
  "created_at": "2017-08-08T13:50:47.881Z",
  "updated_at": "2017-08-08T14:14:20.390Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id          | string   | Unique identifier for the object |
| type        | string | Either `ShippingAddress` or `BillingAddress` |
| street1     | string |  |
| street2     | string |  |
| city        | string |  |
| state       | string |  |
| country     | string |  |
| zip         | string |  |
| lat         | string |  |
| lng         | string |  |
| url         | string |  |
| created_at  | timestamp | Time at which the object was created |
| updated_at  | timestamp | Time at which the object was updated |
