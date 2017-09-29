## Delete a customer

> Example request

```shell
curl -X DELETE \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.delete({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 204 NO CONTENT
```

This endpoint deletes a specific customer along with his orders and messages. Also immediately cancels any created or paid orders.

### HTTP Request

`DELETE https://api.dirtylemon.com/v1/customers/:customer_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

Nothing.
