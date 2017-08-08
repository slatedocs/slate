## Session object

> Example object

```json
{
  "id": "7cb0a876-5d34-4e03-b725-932606041626",
  "customer_id": "d78c6a9e-ff0a-4fd6-b1cc-d2a31cc002d5",
  "need_attention": true,
  "tags": [
    "detox"
  ],
  "topics": [
    "product"
  ],
  "messages": [
    {
      "id": "4bada73e-14f2-4306-9752-51b4008251a4",
      "session_id": "7cb0a876-5d34-4e03-b725-932606041626",
      "content": "Need help?",
      "content_type": "text",
      "sender_role": "agent",
      "sent_at": "2017-05-24T19:32:54.060Z",
      "created_at": "2017-05-24T19:32:54.062Z"
    }
  ],
  "created_at": "2017-05-24T19:32:54.048Z",
  "updated_at": "2017-05-24T20:00:00.929Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id                 | string   | Unique identifier for the object |
| customer_id        | string   | Unique identifier for the associated customer |
| need_attention     | boolean | Wether the customer needs human attention or not |
| tags               | array   | Custom tags |
| topics             | array   | Custom topics |
| messages           | array   | Collection of [messages](#messages) |
| created_at         | timestamp | Time at which the object was created |
| updated_at         | timestamp | Time at which the object was updated |
