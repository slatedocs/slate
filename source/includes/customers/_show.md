## Retrieve a customer

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.retrieve({CUSTOMER_ID})
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
  "email": "customer@example.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "123456",
  "billing_address_url": "https://api.dirtylemon.com/l/6243c9",
  "shipping_address_url": "https://api.dirtylemon.com/l/192b86",
  "card_url": "https://api.dirtylemon.com/l/0896d5",
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
}
```

This endpoint retrieves a specific customer. Use this endpoint to generate short and ephemeral URLs allowing the customer to edit his informations.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

A customer object.
