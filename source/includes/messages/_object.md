## Message object

> Example object

```json
{
  "id": "9a7c5cf3-0ed5-40b0-8f63-c425bc14afe0",
  "session_id": "18e22f89-f945-4d6a-858f-7d487c321d67",
  "content": "Hey",
  "content_type": "text",
  "sender_role": "agent",
  "sent_at": "2017-05-02T12:04:42.693Z",
  "delivered_at": null,
  "created_at": "2017-05-02T12:04:42.694Z",
  "updated_at": "2017-05-02T12:04:42.694Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| session_id   | string   | Unique identifier for the associated object |
| content      | string   |  |
| content_type | string   | Must be `text` |
| sender_role  | string   | Must be `end-user`, `agent` or `init` |
| sent_at      | timestamp | Time at which the message was sent |
| delivered_at | timestamp | Time at which the message was delivered |
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |
