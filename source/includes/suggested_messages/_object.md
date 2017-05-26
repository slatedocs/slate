## Suggested Message object

> Example object

```json
{
  "id": "4891b7bb-1985-48f4-9a03-1e573041bd8a",
  "remote_id": "26ae9dea-cd8b-449b-bbb1-cdedf3216686",
  "content": "What can I do to help?",
  "content_type": "text",
  "selected_count": 8
}
```

| Attribute      | Type     | Description |
| -------------- | -------- | ------------|
| id             | string   | Unique identifier for the object |
| remote_id      | string   | Unique identifier representing the object on a third-party system |
| content        | string   |  |
| content_type   | string   | Must be `text` |
| selected_count | integer | Number of times an agent selected this suggested message |
