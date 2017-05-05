## Create a customer

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "unconfirmed_phone_number": "1 333-333-333"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.create({
  unconfirmed_phone_number: '1 333-333-333'
  first_name: 'Yogi',
  last_name: 'Berra',
  email: 'yogi@berra.com'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "32139dfd-87c3-4552-8e91-0d9de718bff6",
  "phone_number": null,
  "unconfirmed_phone_number": "+14185810827",
  "country_code": "CA",
  "email": "yogi@berra.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "152200",
  "billing_address_url": null,
  "shipping_address_url": null,
  "card_url": null,
  "confirmed_at": "2017-04-14T18:48:52.367Z",
  "confirmation_sent_at": null,
  "created_at": "2017-04-14T18:48:52.367Z",
  "updated_at": "2017-04-14T18:48:52.967Z"
}
```

With `confirmation`:

  - Creates an __unconfirmed__ customer
  - Fires a `verification` event

Without `confirmation`:

  - Creates a __confirmed__ customer


### HTTP Request

`POST https://api.dirtylemon.com/v1/customers`

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation | no | Wether or not to perform the confirmation flow. Default to `true` |
| unconfirmed_phone_number | yes | Unique phone number |
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.
