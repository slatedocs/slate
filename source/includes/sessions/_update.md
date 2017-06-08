## Update a session

> Example request

```shell
curl -X PATCH \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "need_attention": true,
  "tags": ["detox"],
  "topics": ["product"],
  "suggested_messages": [{"id": "26ae9dea-cd8b-449b-bbb1-cdedf3216686", "content_type": "text", "content": "What can I do to help?"}],
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/sessions/current
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.sessions.update({CUSTOMER_ID}, {
  need_attention: true,
  tags: ["detox"],
  topics: ["product"],
  suggested_messages: [{id: "26ae9dea-cd8b-449b-bbb1-cdedf3216686", "content_type": "text", content: "What can I do to help?"}]
})
```

> Example response

```http
HTTP/1.1 200 OK
```

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
  "suggested_messages": [
    {
      "id": "4891b7bb-1985-48f4-9a03-1e573041bd8a",
      "remote_id": "26ae9dea-cd8b-449b-bbb1-cdedf3216686",
      "content": "What can I do to help?",
      "content_type": "text"
    }
  ],
  "created_at": "2017-05-24T19:32:54.048Z",
  "updated_at": "2017-05-24T20:00:00.929Z"
}
```

This endpoint updates a session.

Updating the `need_attention` attribute to `true`:

  - Pauses the [conversation system](#)
  - Notifies a human agent to take action

Updating the `need_attention` attribute to `false`:

  - Resumes the [conversation system](#)


### HTTP Request

`PATCH https://api.dirtylemon.com/v1/customers/:customer_id/sessions/current`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter          | Required | Description |
| ------------------ | -------- | ------------|
| need_attention     | false | |
| tags               | false | Array of tags. Will erase existing values. |
| topics             | false | Array of topics. Will erase existing values. |
| suggested_messages | false | Array of [suggested messages](#suggested-messages). Will erase existing values if attribute is `null` or an empty array. |

### Returns

A session object.
