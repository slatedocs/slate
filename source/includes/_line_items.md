# Line items

## Line item object

> Example object

```json
{
  "id": "edf7656f-f76c-4d6f-aabd-f1c4b91431bf",
  "description": "1 six-pack(s) [skin+hair]",
  "amount": 6500,
  "quantity": 1,
  "sku": {
    "id": "868137000115",
    "price": 6500
  },
  "created_at": "2017-02-26T17:18:08.341Z",
  "updated_at": "2017-02-26T17:18:25.655Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id          | string   | Unique identifier for the object |
| description | string   | |
| amount      | integer  | Total amount in cents |
| quantity    | integer  |  |
| sku         | hash     | A simplified `SKU` object without it's associated `product` object |
| created_at  | timestamp | Time at which the object was created |
| updated_at  | timestamp | Time at which the object was updated |
