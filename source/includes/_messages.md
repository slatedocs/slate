# Messages

## Message object

> Example object

```json
{}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| confirmed_at | timestamp | Time at which the order has been confirmed |
| canceled_at  | timestamp | Time at which the order has been canceled |
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

### Arguments
### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |
| session_id | yes | Only `current` is accepted. |


| Parameter | Required | Description |
| --------- | -------- | ------------|
| content | yes |  |
| content_type | yes |  |

### Returns

A message object.
