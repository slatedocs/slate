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

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 102286438,
    "custid": "123456",
    "accountHolder": "John Doe",
    "checkData": {
      "account": null,
      "routing": null
    },
    "creditCardData": {
      "avsStreet": "",
      "avsZip": "",
      "cardCode": "XXX",
      "cardExpiration": "XXXX",
      "cardNumber": "XXXXXXXXXXXX2227",
      "cardPresent": false,
      "cardType": "V",
      "internalCardAuth": false,
      "magStripe": "",
      "magSupport": "",
      "pares": "",
      "termType": ""
    },
    "datetime": "2015-11-23 18:37:10",
    "timestamp": 1448332630,
    "lineitems": [],
    "details": {
      "amount": 135,
      "clerk": "",
      "currency": "",
      "description": "Recurring Payment",
      "comments": "",
      "discount": 0,
      "invoice": "1448332630",
      "nonTax": false,
      "orderID": "",
      "pONum": "",
      "shipping": 0,
      "subtotal": 0,
      "table": "",
      "tax": 0,
      "terminal": "",
      "tip": 0
    },
    "response": {
      "acsUrl": null,
      "authAmount": 135,
      "authCode": "086595",
      "avsResult": "Address Information not verified for domestic transaction",
      "avsResultCode": "XXU",
      "batchNum": 0,
      "batchRefNum": -2,
      "cardCodeResult": "Match",
      "cardCodeResultCode": "M",
      "cardLevelResult": null,
      "cardLevelResultCode": null,
      "conversionRate": 0,
      "convertedAmount": 0,
      "convertedAmountCurrency": "",
      "custNum": 0,
      "error": "Approved",
      "errorCode": 0,
      "isDuplicate": false,
      "payload": null,
      "refNum": 102286438,
      "result": "Approved",
      "resultCode": "A",
      "status": "Pending",
      "statusCode": "P",
      "vpasResultCode": null
    },
    "serverIP": "125.212.45.130",
    "source": "Slice 1.5 Local",
    "status": "Authorized (Pending Settlement)",
    "transactionType": "Sale",
    "user": "auto"
  }
}
```

This method lets you view specific transaction.

### HTTP Request

`GET transactions/<TRANID>`

### URL Parameters

Parameter | Description
--------- | -----------
TRANID | The reference number of the transaction.


## View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": 102286438,
      "custid": "123456",
      "accountHolder": "John Doe",
      "checkData": {
        "account": null,
        "routing": null
      },
      "creditCardData": {
        ...
      },
      "datetime": "2015-11-23 18:37:10",
      "timestamp": 1448332630,
      "lineitems": [],
      "details": {
        ...
      },
      "response": {
        ...
      },
      "serverIP": "125.212.45.130",
      "source": "Slice 1.5 Local",
      "status": "Authorized (Pending Settlement)",
      "transactionType": "Sale",
      "user": "auto"
    },
    {
      "id": 102230071,
      "custid": "new01",
      "accountHolder": "Jenner",
      "checkData": {
        "account": "XXXXX3123",
        "routing": "XXXXX3123"
      },
      "creditCardData": {
        ...
      },
      "datetime": "2015-11-19 15:58:01",
      "timestamp": 1447977481,
      "lineitems": [
        {
          "SKU": "32",
          "ProductName": "Prod 1",
          "Description": "Test lineitem",
          "UnitPrice": "3.35",
          "Qty": "4.0000",
          "Taxable": true
        },
        {
          "SKU": "8",
          "ProductName": "Prod 2",
          "Description": "Test lineitem 2",
          "UnitPrice": "1.00",
          "Qty": "4.0000",
          "Taxable": true
        }
      ],
      "details": {
        ...
      },
      "response": {
        ...
      },
      "serverIP": "125.212.45.130",
      "source": "Slice 1.5 Local",
      "status": "Pending",
      "transactionType": "Check (Sale)",
      "user": "auto"
    }
  ]
}
```

This method lets you view all transactions.

### HTTP Request

`GET transactions`

### URL Parameters

Parameter | Description
--------- | -----------
PLANID | The ID of the recurring plan to retrieve fees.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
start | (today - 1month) | Start date.
end | today | End date.
limit | 20 | Number of items to show per page. 
page | 1 | Page number. 