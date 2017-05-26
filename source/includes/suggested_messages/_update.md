## Update a Suggested Message

> Example request

```shell
curl -X PATCH \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/suggested_messages/{SUGGESTED_MESSAGE_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.suggested_messages.update({SUGGESTED_MESSAGE_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "4891b7bb-1985-48f4-9a03-1e573041bd8a",
  "remote_id": "26ae9dea-cd8b-449b-bbb1-cdedf3216686",
  "content": "What can I do to help?",
  "content_type": "text",
  "selected_count": 8
}
```

This endpoint updates a suggested message. It increments the `selected_count` attribute on each request.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/suggested_messages/:suggested_message_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| suggested_message_id | yes |  |

### Returns

A suggested message object.

### Event

Fires a `suggested_message.updated` event with payload:

```json
{
  "id": "suggested_message_id",
  "selected_count": 1
}
```
