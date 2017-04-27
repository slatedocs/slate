# Messages

## Message object

> Example object

```json
{
  "id": "23940470-2fb3-42ad-8784-500915ad61a5",
  "session_id": "d57dc142-23ce-4ce5-a03b-9ebdc8497ba3",
  "content": "What's shea weber's plus-minus?",
  "content_type": "text",
  "sender_role": "init",
  "sent_at": "2016-12-20T20:50:42.708Z",
  "created_at": "2017-04-25T20:58:41.633Z",
  "updated_at": "2017-04-25T20:58:41.633Z"
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
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |

## Create a message

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "content": "Hey Ho!",
  "content_type": "text"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/sessions/{SESSION_ID}/messages
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.messages.create({CUSTOMER_ID}, {SESSION_ID}, {
  content: 'Hey Ho!',
  content_type: 'text'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{}
```

This endpoint creates a message on behalf of an __agent__:

- Notifies the [customer](#customers) of the message
- Notifies the [conversational system](...) of the message

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/sessions/:session_id/messages`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |
| session_id | yes | Only `current` is accepted. |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| content | yes |  |
| content_type | yes |  |

### Returns

A message object.
