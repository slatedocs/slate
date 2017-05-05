## Session object

> Example object

```json
{
  "id": "10125e23-3ad9-46bc-a4c1-e1e8e1a79d16",
  "customer_id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "need_attention": true,
  "tags": [
    "mobile"
  ],
  "topics": [
    "sleep",
    "skin+hair"
  ],
  "created_at": "2017-04-21T14:38:59.691Z",
  "updated_at": "2017-04-21T18:10:51.475Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| customer_id  | string   | Unique identifier for the associated customer |
| need_attention | boolean | Wether the customer needs human attention or not |
| tags         | array   | Custom tags |
| topics       | array   | Custom topics |
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |
