## Trigger

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "name": "order.confirmation",
  "resource_type" "Order",
  "resource_id": "0e4ce262-3e40-4c3a-9763-baa284c0873c"
}' \
https://api.dirtylemon.com/v1/bot/trigger
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.bot.trigger({
  name: 'order.confirmation',
  resource_type: 'Order',
  resource_id: '0e4ce262-3e40-4c3a-9763-baa284c0873c'
})
```

> Example response

```http
HTTP/1.1 200 OK
```

This endpoint allows external services to trigger actions to be performed by the bot, such as:

- Send a single message to a customer
- Start a conversation with a customer

### Triggers

This is a list of available triggers:

| Key | Type | Description |
| --- | ---- | ----------- |
| `order.confirmation` | Single message | Sends a message to the customer asking to confirm the order in order proceed with the payment |

<aside class="notice">
  <ul>
    <li>This will fail if the customer is unsubscribed.</li>
    <li>This will fail if the customer doesn't have a `phone_number` or `unconfirmed_phone_number`</li>
  </ul>
</aside>

### HTTP Request

- `POST https://api.dirtylemon.com/v1/bot/trigger`

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| name | yes | One of the valid triggers |
| resource_type | yes | Currently only `Order` is accepted |
| resource_id | yes | Resource id |

### Returns

Nothing.
