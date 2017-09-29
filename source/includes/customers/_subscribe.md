## Subscribe

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/subscribe
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.subscribe({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 204 NO CONTENT
```

This endpoint re-subscribes a customer to communications after [unsubscription](#unsubscribe).

<aside class="notice">
  <ul>
    <li>This will fail if the customer is already subscribed.</li>
    <li>This will fail if the customer doesn't have an `unconfirmed_phone_number`</li>
  </ul>
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/subscribe`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

Nothing.
