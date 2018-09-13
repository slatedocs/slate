# Quotes
## Create

> Example Request:

```shell

curl -X POST https://api.sandbox.transferwise.tech/v1/quotes \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "source": "EUR",
          "target": "GBP",
          "rateType": "FIXED",
          "targetAmount": 600,
          "type": "BALANCE_PAYOUT"
        }'

```

> Example Response:

```json
{
    "id": <quoteId>,
    "source": "EUR",
    "target": "GBP",
    "sourceAmount": 663.84,
    "targetAmount": 600.00,
    "type": "BALANCE_PAYOUT",
    "rate": 0.9073,
    "createdTime": "2018-08-27T14:35:44.553Z",
    "createdByUserId": <your user id>,
    "profile": <your profile id>,
    "rateType": "FIXED",
    "deliveryEstimate": "2018-08-27T14:35:44.496Z",
    "fee": 2.34,
    "allowedProfileTypes": [
        "PERSONAL",
        "BUSINESS"
    ],
    "guaranteedTargetAmount": false,
    "ofSourceAmount": true
}
```

<br/>
Quote can be used to create a transfer within 30 minutes. You need quoteId as an input to create a transfer. 
Quote locks current mid-market exchange rate that will be used for your transfer. 
Quote also calculates transfer fee and estimates delivery time. 

### Request

**`POST https://api.sandbox.transferwise.tech/v1/quotes`**

Field                 | Description                                   | Format
---------             | -------                                       | -----------
profile               | Personal or business profile id               | Text
source                | Source(send) currency code                    | Text
target                | Target(receive) currency code                          | Text
rateType              | Always use constant 'FIXED'                   | Text
targetAmount          | Amount in target currency                     | Decimal
sourceAmount          | Amount in source currency. <br/>Either sourceAmount or targetAmount is required, never both.   | Decimal
type                  | 'BALANCE_PAYOUT' for payments funded from borderless account  <br/> 'BALANCE_CONVERSION' for conversion between balances  <br/> 'REGULAR' for payments funded via bank transfers | Text


### Response

Field                 | Description                                   | Format
---------             | -------                                       | -----------
id                    | quoteId                                      | Integer
source                | Source(send) currency code                    | Text
target                | Target(receive) currency code                 | Text
sourceAmount          | Amount in source currency                     | Decimal
targetAmount          | Amount in target currency                     | Decimal
type                  | Quote type                                    | Text
rate                  | Exchange rate value                           | Decimal
createdTime           | Quote created timestamp                       | Timestamp
createdByUserId       | Your used id                                  | Integer
profile               | Personal or business profile id               | Integer
rateType              | Always 'FIXED'                                | Text
deliveryEstimate      | Estimated timestamp when recipient would receive funds, assuming transfer will be created now. | Timestamp
fee                   | TransferWise fee in source currency for this payment (deducted from source amount).                   | Decimal
allowedProfileTypes   | PERSONAL, BUSINESS or both. Specifies which legal entities can use this quote. There are few currency routes are where we dont support business customers yet. | Text
guaranteedTargetAmount| Not relevant for fixed rate quotes. Please ignore. | Boolean
ofSourceAmount        | Not relevant for fixed rate quotes. Please ignore. | Boolean




## Get By Id
> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/quotes/{quoteId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
    "id": <quoteId>,
    "source": "EUR",
    "target": "GBP",
    "sourceAmount": 663.84,
    "targetAmount": 600.00,
    "type": "BALANCE_PAYOUT",
    "rate": 0.9073,
    "createdTime": "2018-08-27T14:35:44.553Z",
    "createdByUserId": <your user id>,
    "profile": <your profile id>,
    "rateType": "FIXED",
    "deliveryEstimate": "2018-08-27T14:35:44.496Z",
    "fee": 2.34,
    "allowedProfileTypes": [
        "PERSONAL",
        "BUSINESS"
    ],
    "guaranteedTargetAmount": false,
    "ofSourceAmount": true
}
```

Get quote info by id.
### Request
**`GET https://api.sandbox.transferwise.tech/v1/quotes/{quoteId}`**




## Get Pay-in Methods
> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/quotes/{quoteId}/pay-in-methods \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
  {
    "type": "transfer",
    "details": {
      "payInReference": "quote-113300 P304205"
    }
  }
]
```

Get text that you should use in the "payment reference" field when sending funds via local bank transfer to TransferWise to fund your payment request.
Reference text includes "P-REF" number of user which we need in order to automatically link funds.

### Request
**`GET https://api.sandbox.transferwise.tech/v1/quotes/{quoteId}/pay-in-methods`**

### Response

Field                    | Description                                                                    | Format
---------                | -------                                                                        | -----------
type                     | Currently always 'transfer' meaning only pay-in option is via bank transfer.   | Text
details.payInReference   | Reference text to be used when sending your bank transfer to TransferWise.     | Text



## Get Temporary Quote

> Example Request (Bearer token):

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/quotes?source=EUR&target=GBP&rateType=FIXED&targetAmount=600 \
     -H "Authorization: Bearer <your api token>" 

```
> Example Request (Basic authentication):

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/quotes?source=EUR&target=GBP&rateType=FIXED&targetAmount=600 \
     --user <your api client_id>:<your api client_secret> 
```




> Example Response:

```json
{
    "source": "EUR",
    "target": "GBP",
    "sourceAmount": 663.84,
    "targetAmount": 600.00,
    "type": "REGULAR",
    "rate": 0.9073,
    "createdTime": "2018-08-27T14:35:44.553Z",
    "createdByUserId": 0,
    "rateType": "FIXED",
    "deliveryEstimate": "2018-08-27T14:35:44.496Z",
    "fee": 2.34,
    "allowedProfileTypes": [
        "PERSONAL",
        "BUSINESS"
    ],
    "guaranteedTargetAmount": false,
    "ofSourceAmount": true
}
```

**`GET https://api.sandbox.transferwise.tech/v1/quotes?source=SEK&target=USD&sourceAmount=1000&rateType=FIXED`**

 Get temporary quote for sending 1000 SEK to USD<br/>

**`GET https://api.sandbox.transferwise.tech/v1/quotes?source=SEK&target=USD&targetAmount=1000&rateType=FIXED`**

 Get temporary quote for sending SEK to 1000 USD<br/>


### Request

Note that this endpoint supports two types of authentication: Bearer token and Basic authentication (client_id/client_secret).

**`GET https://api.sandbox.transferwise.tech/v1/quotes`**

Field                 | Description                                   | Format
---------             | -------                                       | -----------
source                | Source(send) currency code                    | Text
target                | Target(receive) currency code                 | Text
rateType              | Always use constant 'FIXED'                   | Text
targetAmount          | Amount in target currency                     | Decimal
sourceAmount          | Amount in source currency. <br/>Either sourceAmount or targetAmount is required, never both.   | Decimal


### Response

Same as [Create](#quotes-create), but without "id" field since temporary quote is not stored and cannot be used for creating transfer.
Temporary quote is not associated with any user, it is anonymous. 








