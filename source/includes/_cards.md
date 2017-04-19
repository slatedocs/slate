# Cards

## Create a card

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "stripeToken": "token"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/card
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.card.create({CUSTOMER_ID}, {
  stripeToken: 'token'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "exp_month": "8",
  "exp_year": "2019",
  "last4": "4242"
}
```

This endpoint creates a customer credit card. The newly created card then becomes the customer's default payment method.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/<ID>/card`

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| stripeToken | yes | A Stripe credit card token |

### Returns

A card object.
