## Update a session

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "need_attention": true,
  "tags": ["detox"],
  "topics": ["product", "shipping"]
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/sessions/current
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.sessions.update({CUSTOMER_ID}, {
  need_attention: true,
  tags: ["detox"],
  topics: ["product", "shipping"]
})
```

> Example response

```http
HTTP/1.1 200 OK
```

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

This endpoint updates a session.

Updating the `need_attention` attribute to `true`:

  - Pauses the [conversational system](#)
  - Allows a human agent to send messages
  - Notifies a human agent to take action

Updating the `need_attention` attribute to `false`:

  - Resumes the conversational system
  - Disallow a human agent to send messages

<aside class="notice">
  At least one <a href="#messages">message</a>  must have been created for the given customer before attempting to update a session.
</aside>


### HTTP Request

`PATCH https://api.dirtylemon.com/v1/customers/:customer_id/sessions/current`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| need_attention | false | |
| tags           | false | Array of tags. Will erase existing values. |
| topics         | false | Array of topics. Will erase existing values. |

### Returns

A session object.
