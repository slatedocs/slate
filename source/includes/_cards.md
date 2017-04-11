# Cards

## Create a card

> Example request

```js
const dirtylemon = require('dirtylemon');

dirtylemon.cards.create({CUSTOMER_ID}, {
  stripeToken: 'token'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

This endpoint creates a customer credit card. The newly created card then becomes the customer's default payment method.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/<ID>/cards`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| stripeToken | yes | A Stripe credit card token |

### Returns

Nothing
