## Update a customer

> Example request

```shell
curl -X PUT \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "email": "yogi@berra.com"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.update({CUSTOMER_ID}, {
  email: 'yogi@berra.com'
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "phone_number": "+13333333333",
  "unconfirmed_phone_number": "+13333333333",
  "country_code": "US",
  "email": "yogi@berra.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "123456",
  "billing_address_url": null,
  "shipping_address_url": null,
  "card_url": null,
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
}
```

This endpoint updates a customer.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/customers/:customer_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.
