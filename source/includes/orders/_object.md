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
      "id": "26ae9dea-cd8b-449b-bbb1-cdedf3216686",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-05-03T22:26:49.705Z",
      "updated_at": "2017-05-03T22:26:49.705Z"
    }
  ],
  "shipments": [
    {
      "id": "20a21109-0e00-403b-84cc-62e095c94bca",
      "label": "1 six-pack of [skin+hair]",
      "carrier": "UPS",
      "tracking_number": "9400136897846107013399",
      "tracking_url": "https://track.easypost.com/djE6dHJrX2Y0YTdkMGI1NmJlNDQ1MzdhMjMzN2M2ODlmMGM2OTdm",
      "tracking_status": "delivered",
      "tracking_status_at": "2017-05-03T22:38:23.432Z",
      "eta": "2017-05-03T12:00:00.000Z",
      "created_at": "2017-05-03T22:37:50.357Z",
      "updated_at": "2017-05-03T22:38:23.432Z"
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
| line_items   | list | Array of [line item](#line-items) objects |
| shipments    | list | Array of [shipments](#shipments) objects |
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |
