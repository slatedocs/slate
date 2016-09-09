# Transactions

## Run Sale

> Returns JSON structured like this:

```json
{
  "data": {
    "type": "sale",
    "details": {
      "amount": "2.22",
      "paymethod": "2hlg-gztu-2sf4-7frw"
    },
    "result_code": "A",
    "error_message": "",
    "response": {
      "acsUrl": "",
      "authAmount": 2.22,
      "authCode": "393354",
      "avsResult": "Address: Match & 5 Digit Zip: Match",
      "avsResultCode": "YYY",
      "batchNum": 2215,
      "batchRefNum": 238287,
      "cardCodeResult": "Match",
      "cardCodeResultCode": "M",
      "cardLevelResult": "Visa Traditional",
      "cardLevelResultCode": "A",
      "conversionRate": 0,
      "convertedAmount": 0,
      "convertedAmountCurrency": "840",
      "custNum": 0,
      "error": "Approved",
      "errorCode": 0,
      "isDuplicate": false,
      "payload": "",
      "refNum": 109637007,
      "result": "Approved",
      "resultCode": "A",
      "status": "Pending",
      "statusCode": "P",
      "vpasResultCode": ""
    },
    "custom_field": [],
    "lineitems": []
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
    "type": "refund",
    "details": {
      "amount": ".02"
    },
    "result_code": "A",
    "error_message": "",
    "response": {
      "acsUrl": null,
      "authAmount": ".02",
      "authCode": "103408",
      "avsResult": "Address: Match & 5 Digit Zip: Match",
      "avsResultCode": "YYY",
      "batchNum": 2622,
      "batchRefNum": 234573,
      "cardCodeResult": "Not Processed",
      "cardCodeResultCode": "P",
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
      "refNum": 108564342,
      "result": "Approved",
      "resultCode": "A",
      "status": "Settled",
      "statusCode": "S",
      "vpasResultCode": null
    }
  }
}
```

This method lets you refund a transaction

### HTTP Request

`POST transactions/<REFNUM>/<AMOUNT>/refund`

### URL Parameters

Parameter | Description
--------- | -----------
REFNUM | Transaction reference number
AMOUNT | Amount for refund.

## Void Transaction

> Returns JSON structured like this:

```json
{
  "data": {
    "type": "void",
    "details": {
      "amount": []
    },
    "result_code": "A",
    "error_message": "",
    "response": []
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