## Unsubscribe

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/unsubscribe
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.unsubscribe({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 204 NO CONTENT
```

This endpoint unsubscribes a customer from future communications. Attempting to send messages will fail until the customer optins again.

<aside class="notice">
  This will fail if the customer is already unsubscribed.
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/unsubscribe`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

Nothing.
