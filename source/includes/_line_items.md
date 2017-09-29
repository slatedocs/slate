# Line items

## Line item object

> Example object

```json
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
```

| Attribute   | Type      | Description |
| ----------- | --------- | ------------|
| id          | string    | Unique identifier for the object |
| description | string    | |
| amount      | integer   | Total amount in cents |
| currency    | string    | |
| quantity    | integer   | |
| sku         | hash      | A simplified `SKU` object without it's associated `product` object |
| created_at  | timestamp | Time at which the object was created |
| updated_at  | timestamp | Time at which the object was updated |
