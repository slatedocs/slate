## Session object

> Example object

```json
{
  "id": "35559e1d-0dcc-4872-9b26-bdffb56aef52",
  "customer_id": "6cbda5ea-aa69-4d06-a7eb-a1656bab4e9d",
  "need_attention": true,
  "tags": [
    "detox"
  ],
  "topics": [
    "product",
    "shipping"
  ],
  "created_at": "2017-05-05T13:14:33.959Z",
  "updated_at": "2017-05-05T13:20:26.066Z"
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
