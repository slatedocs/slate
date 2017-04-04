# Line items

## Line item object

```json
{
  ...
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id          | string   | Unique identifier for the object |
| description | string   | |
| amount      | integer  | Total amount in cents |
| quantity    | integer  |  |
| product     | hash     | `Product` object |
| created_at  | timestamp | Time at which the object was created |
| updated_at  | timestamp | Time at which the object was updated |
