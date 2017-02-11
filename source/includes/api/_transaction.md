# Transactions

## Auth Only

> Returns JSON structured like this:

```json
{
  "data": {
    "status": {
      "result": "authonly",
      "resultCode": "A",
      "status": "pending",
      "statusCode": "P",
      "error": "",
      "message": ""
    },
    "details": {
      "amount": "131.5",
      "type": "authonly",
      "refNum": "8a82944a5a184b46015a269cfc832f8c",
      "authCode": "400010",
      "transactionDate": "2017-02-09 22:01:45",
      "batchID": "",
      "invoice": "",
      "orderID": "",
      "description": "",
      "callbackURL": "",
      "submittedBy": "",
      "comments": "",
      "custom": null,
      "userCustom": null,
      "lineitems": []
    },
    "customer": {
      "custID": "wilson-007",
      "name": "Wilson Empleo",
      "company": "Zylun PH"
    },
    "paymentDetails": {
      "payID": 1,
      "method": "card",
      "cardNum": "XXXXXXXXXXXX2224",
      "cardType": "visa"
    },
    "info": {
      "gatewayID": 4,
      "name": "acapture",
      "referrer": "",
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 29,
      "userKey": "slicelocal_acapture",
      "proccessTime": "4213.60",
      "tranToken": "89893b3e5b8edefcc1480557e5f35fb6"
    }
  }
}
```

This method run a auth only transaction

### HTTP Request

`POST transactions/authonly`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
amount* |  | Amount of the transaction
paymethod* |  | Payment method to be used
customer* |  | Customer ID
billing[firstname] |  | First name
billing[lastname] |  | Last name
custom_field[one] |  | First custom field
custom_field[two] |  | Second custom field
lineitem1[sku] |  | Lineitem sku
lineitem1[productname] |  | Lineitem product name
lineitem1[description] |  | Lineitem description
lineitem1[unitprice] |  | Lineitem unit price
lineitem1[qty] |  | Lineitem quantity
lineitem1[taxable] |  | Lineitem taxable

<aside class="notice">* = Required.</aside>

## Capture Sale

> Returns JSON structured like this:

```json
{
  "data": {
    "status": {
      "result": "approved",
      "resultCode": "A",
      "status": "settled",
      "statusCode": "S",
      "error": "",
      "message": ""
    },
    "details": {
      "amount": "131.50",
      "type": "capture",
      "refNum": "8a8294495a18272f015a269da9a57084",
      "authCode": "",
      "transactionDate": "2017-02-09 22:02:28",
      "batchID": "",
      "invoice": "",
      "orderID": "",
      "description": "",
      "callbackURL": "",
      "submittedBy": "",
      "comments": "",
      "custom": null,
      "userCustom": null,
      "lineitems": []
    },
    "customer": {
      "custID": "wilson-007",
      "name": "Wilson Empleo",
      "company": "Zylun PH"
    },
    "paymentDetails": [],
    "info": {
      "gatewayID": 4,
      "name": "acapture",
      "referrer": "",
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 29,
      "userKey": "slicelocal_acapture",
      "proccessTime": "2002.23",
      "tranToken": "976035d82bd81273b2eee783bbc7f2d6"
    }
  }
}
```

This method capture a sale

### HTTP Request

`GET transactions/<REFNUM>/capture`

### URL Parameters

Parameter | Description
--------- | -----------
REFNUM | Transaction reference number

<aside class="notice">* = Required.</aside>

## Run Sale

> Returns JSON structured like this:

```json
{
  "data": {
    "status": {
      "result": "approved",
      "resultCode": "A",
      "status": "settled",
      "statusCode": "S",
      "error": "",
      "message": ""
    },
    "details": {
      "amount": "1.34",
      "type": "sale",
      "refNum": "8a8294495a18272f015a268f85e06d12",
      "authCode": "400010",
      "transactionDate": "2017-02-09 21:46:50",
      "batchID": "",
      "invoice": "",
      "orderID": "",
      "description": "",
      "callbackURL": "",
      "submittedBy": "",
      "comments": "",
      "custom": null,
      "userCustom": null,
      "lineitems": []
    },
    "customer": null,
    "paymentDetails": {
      "payID": 40,
      "method": "card",
      "cardNum": "XXXXXXXXXXXX2224",
      "cardType": "visa"
    },
    "info": {
      "gatewayID": 4,
      "name": "acapture",
      "referrer": null,
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 32,
      "userKey": "slicelocal_acapture",
      "proccessTime": "2920.87",
      "tranToken": "bd04353ce87d8972dc9d257c9c86e9c4"
    }
  }
}
```

This method run a sale transaction

### HTTP Request

`POST transactions/run`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
amount* |  | Amount of the transaction
paymethod* |  | Payment method to be used
customer* |  | Customer ID
billing[firstname] |  | First name
billing[lastname] |  | Last name
custom_field[one] |  | First custom field
custom_field[two] |  | Second custom field
lineitem1[sku] |  | Lineitem sku
lineitem1[productname] |  | Lineitem product name
lineitem1[description] |  | Lineitem description
lineitem1[unitprice] |  | Lineitem unit price
lineitem1[qty] |  | Lineitem quantity
lineitem1[taxable] |  | Lineitem taxable

<aside class="notice">* = Required.</aside>

## Refund Transaction

> Returns JSON structured like this:

```json
{
  "data": {
    "status": {
      "result": "approved",
      "resultCode": "A",
      "status": "settled",
      "statusCode": "S",
      "error": "",
      "message": ""
    },
    "details": {
      "amount": ".1",
      "type": "refund",
      "refNum": "8a82944a5a184b46015a269301f32ce1",
      "authCode": "",
      "transactionDate": "2017-02-09 21:50:39",
      "batchID": "",
      "invoice": "",
      "orderID": "",
      "description": "",
      "callbackURL": "",
      "submittedBy": "",
      "comments": "",
      "custom": null,
      "userCustom": null,
      "lineitems": []
    },
    "customer": {
      "custID": "tokenex-0016",
      "name": "CMS Test last name",
      "company": "Zylun PH"
    },
    "paymentDetails": [],
    "info": {
      "gatewayID": 4,
      "name": "acapture",
      "referrer": null,
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 32,
      "userKey": "slicelocal_acapture",
      "proccessTime": "1728.68",
      "tranToken": "e0b8e2fcafc2dd4082bff3206fc3a7d4"
    }
  }
}
```

This method lets you refund a transaction

### HTTP Request

`POST transactions/<REFNUM>/refund`

### URL Parameters

Parameter | Description
--------- | -----------
REFNUM | Transaction reference number

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
amount* |  | Amount of the transaction

## Void Transaction

> Returns JSON structured like this:

```json
{
  "data": {
    "status": {
      "result": "approved",
      "resultCode": "A",
      "status": "settled",
      "statusCode": "S",
      "error": "",
      "message": ""
    },
    "details": {
      "amount": "3.00",
      "type": "void",
      "refNum": "8a82944a5a184b46015a268ee42c2c08",
      "authCode": "",
      "transactionDate": "2017-02-09 21:46:09",
      "batchID": "",
      "invoice": "",
      "orderID": "",
      "description": "",
      "callbackURL": "",
      "submittedBy": "",
      "comments": "",
      "custom": null,
      "userCustom": null,
      "lineitems": []
    },
    "customer": {
      "custID": "tokenex-0016",
      "name": "CMS Test last name",
      "company": "Zylun PH"
    },
    "paymentDetails": [],
    "info": {
      "gatewayID": 4,
      "name": "acapture",
      "referrer": null,
      "clientIP": "127.0.0.1",
      "mid": "513485000208199",
      "userID": 32,
      "userKey": "slicelocal_acapture",
      "proccessTime": "1682.40",
      "tranToken": "866069963b55ebe1c1b1839f38c075f3"
    }
  }
}
```

This method lets you void a transaction

### HTTP Request

`POST transactions/<REFNUM>/void`

### URL Parameters

Parameter | Description
--------- | -----------
REFNUM | Transaction reference number
