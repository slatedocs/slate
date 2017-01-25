# Batch

## View Current Batch

> Returns JSON structured like this:

```json
{
  "data": {
    "batchRefNum": 238287,
    "closed": "2016-09-12 22:35:06",
    "creditsAmount": 601.02,
    "creditsCount": 3,
    "netAmount": 86510.36,
    "opened": "2016-08-22 14:13:32",
    "salesAmount": 87111.38,
    "salesCount": 872,
    "scheduled": "",
    "sequence": 2215,
    "status": "Open",
    "transactionCount": 890,
    "voidsAmount": 836.75,
    "voidsCount": 15
  }
}
```

This method lets you view current batch

### HTTP Request

`GET batches/current`

## Close Batch

> Returns `true` on successful

This method lets you close a batch

### HTTP Request

`GET batches/<BATCHID>/close`

### URL Parameters

Parameter | Description
--------- | -----------
BATCHID | The ID of the batch to be closed.

## Fina Batch

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "batchRefNum": 236301,
      "closed": "2016-08-01 08:40:01",
      "creditsAmount": 0,
      "creditsCount": 0,
      "netAmount": 7203.36,
      "opened": "2016-08-01 08:37:39",
      "salesAmount": 7203.36,
      "salesCount": 999,
      "scheduled": "",
      "sequence": 108,
      "status": "Closed",
      "transactionCount": 999,
      "voidsAmount": 0,
      "voidsCount": 0
    },
    {
      "batchRefNum": 236304,
      "closed": "2016-08-01 08:42:13",
      "creditsAmount": 0,
      "creditsCount": 0,
      "netAmount": 10592.63,
      "opened": "2016-08-01 08:40:01",
      "salesAmount": 10592.63,
      "salesCount": 965,
      "scheduled": "",
      "sequence": 108,
      "status": "Closed",
      "transactionCount": 965,
      "voidsAmount": 0,
      "voidsCount": 0
    }
}
```

This method lets you close a batch

### HTTP Request

`GET batches/search?start_date=<STARTDATE>&end_date=<ENDDATE>&page=<PAGE>`

### URL Parameters

Parameter | Description
--------- | -----------
STARTDATE* | Start date
ENDDATE* | End date
PAGE | Page to be displayed (default: 1)

## View Specific Batch

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": 108694431,
      "custid": "SBNKo7Uu4AykLjn4_stress_custom",
      "accountHolder": "CMS Test",
      "checkData": {
        "account": null,
        "routing": null
      },
      "creditCardData": {
        "avsStreet": "",
        "avsZip": "",
        "cardCode": "XXX",
        "cardExpiration": "XXXX",
        "cardNumber": "XXXXXXXXXXXX2224",
        "cardPresent": false,
        "cardType": "V",
        "internalCardAuth": false,
        "magStripe": "",
        "magSupport": "",
        "pares": "",
        "termType": ""
      },
      "datetime": "2016-08-01 08:41:29",
      "lineItems": [],
      "details": {
        "amount": 7,
        "clerk": "",
        "description": "Stress description",
        "invoice": "Stress Inv",
        "nonTax": false,
        "orderID": "",
        "pONum": "",
        "table": "",
        "tax": 0,
        "terminal": ""
      },
      "response": {
        "acsUrl": null,
        "authAmount": 7,
        "authCode": "108704",
        "avsResult": "No AVS response (Typically no AVS data sent or swiped transaction)",
        "avsResultCode": "",
        "batchNum": 1100,
        "batchRefNum": 236310,
        "cardCodeResult": "No CVV2/CVC data available for transaction.",
        "cardCodeResultCode": "",
        "cardLevelResult": null,
        "cardLevelResultCode": null,
        "conversionRate": 0,
        "convertedAmount": 0,
        "convertedAmountCurrency": null,
        "custNum": 0,
        "error": "",
        "errorCode": 0,
        "isDuplicate": false,
        "payload": null,
        "refNum": 108694431,
        "result": "Approved",
        "resultCode": "A",
        "status": "Pending",
        "statusCode": "P",
        "vpasResultCode": null
      },
      "serverIP": "52.0.137.18",
      "source": "PIE - Test",
      "status": "Voided",
      "transactionType": "Voided Credit",
      "user": "auto"
    },
    {
      "id": 108697185,
      "custid": "SBNKo7Uu4AykLjn4_0001",
      "accountHolder": "CMS Test",
      "checkData": {
        "account": null,
        "routing": null
      },
      "creditCardData": {
        "avsStreet": "",
        "avsZip": "",
        "cardCode": "XXX",
        "cardExpiration": "XXXX",
        "cardNumber": "XXXXXXXXXXXX2224",
        "cardPresent": false,
        "cardType": "V",
        "internalCardAuth": false,
        "magStripe": "",
        "magSupport": "",
        "pares": "",
        "termType": ""
      },
      "datetime": "2016-08-01 10:14:07",
      "lineItems": [],
      "details": {
        "amount": 1,
        "clerk": "",
        "currency": "",
        "description": "Onetime Sale",
        "comments": "",
        "discount": 0,
        "invoice": "1470071647",
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
        "authAmount": 1,
        "authCode": "135132",
        "avsResult": "Address: Match & 5 Digit Zip: Match",
        "avsResultCode": "YYY",
        "batchNum": 1100,
        "batchRefNum": 236310,
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
        "refNum": 108697185,
        "result": "Approved",
        "resultCode": "A",
        "status": "Returned",
        "statusCode": "R",
        "vpasResultCode": null
      },
      "serverIP": "52.0.212.18",
      "source": "Slice 2.0 (Local)",
      "status": "Voided (Funds Released)",
      "transactionType": "Voided Sale",
      "user": "auto"
    }
}
```

This method lets you view a specific batch that contains several transactions

### HTTP Request

`GET batches/<BATCHID>`

### URL Parameters

Parameter | Description
--------- | -----------
BATCHID | The ID of the batch to be closed.