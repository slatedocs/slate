## Order object

> Example object

```json
{
  "id": "1526b746-6a39-4958-91bf-a80bba41cdc3",
  "customer_id": "294e03d6-df4f-4ee1-94be-e334c420381a",
  "reference": "6f324c",
  "status": "created",
  "currency": "usd",
  "tax": 0,
  "shipping_fee": 0,
  "total": 6500,
  "preordered": false,
  "coupon_id": null,
  "shipping": {
    "company": null,
    "street1": "1-60 CRÉMAZIE OUEST",
    "street2": "",
    "street3": null,
    "city": "QUEBEC",
    "state": "QC",
    "country": "CA",
    "zip": "G1R 1X3"
  },
  "line_items": [
    {
      "id": "29ed62f3-2a36-4543-b586-508bd6a3313f",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-05-01T22:25:46.626Z",
      "updated_at": "2017-05-01T22:25:46.626Z"
    }
  ],
  "shipments": [
    {
      "label": "1 six-pack of [skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_at": null,
      "eta": null,
      "created_at": "2017-05-02T00:10:39.726Z",
      "updated_at": "2017-05-02T00:10:39.726Z"
    }
  ],
  "created_at": "2017-05-01T22:25:46.589Z",
  "updated_at": "2017-05-02T00:19:55.935Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| customer_id  | string   | Unique identifier for the associated customer |
| reference    | string | Short unique identifier for the object |
| status       | string | Either `created`, `paid`, `canceled`, `fulfilled` or `returned` |
| currency     | string | |
| tax          | integer | Tax amount in cents |
| shipping_fee | integer | Shipping fee in cents |
| total        | integer | Total amount in cents |
| preordered   | boolean | |
| coupon_id    | string | A `coupon` id |
| shipping     | hash | |
| line_items   | list | Array of `line item` objects |
| shipments    | list | Array of `shipments` objects |
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |
