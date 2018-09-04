# Transfers


## Create  - todo

> Example Request:

```shell

curl -X POST https://api.sandbox.transferwise.tech/v1/transfers \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "targetAccount": <recipient account id>,   
          "quote": <quote id>,
          "customerTransactionId": "<the UUID you generated for the transfer attempt>",
          "details" : {
              "reference" : "to my friend"
            } 
         }'

```

> Example Response:

```json
{
    "id": 468956,
    "user": <your user id>,
    "targetAccount": <recipient account id>,
    "sourceAccount": null,
    "quote": <quote id>,
    "status": "incoming_payment_waiting",
    "reference": "to my friend",
    "rate": 0.9065,
    "created": "2018-08-28 07:43:55",
    "business": <your business profile id>,
    "transferRequest": null,
    "details": {
        "reference": "to my friend"
    },
    "hasActiveIssues": false,
    "sourceCurrency": "EUR",
    "sourceValue": 661.89,
    "targetCurrency": "GBP",
    "targetValue": 600,
    "customerTransactionId": "bd244a95-dcf8-4c31-aac8-bf5e2f3e54c0"
}

```

Transfer is a payout order which consists of quote and recipient account. You can also add reference text and you need to specify unique identifier to avoid creating duplicate transfers. 
Once created then a transfer needs to be funded during next 5 working days. In case not it will get automatically cancelled.  


### Request

**`POST https://api.sandbox.transferwise.tech/v1/accounts`**

Field                          | Description                                   | Format
---------                      | -------                                       | -----------
targetAccount                  | Recipient account id. You can create multiple transfers to same recipient account.   | Integer
quote                          | Quote id. You can only create one transfer per one quote. <br/>You cannot use same quote ID to create multiple transfers. | Integer
customerTransactionId     | This is required to perform idempotency check to avoid duplicate transfers in case of network failures or timeouts.                          | UUID
details.reference (optional)    | Recipient will see this reference text in their bank statement. Maximum allowed characters depends on the currency route. [Business Payments Tips](https://transferwise.com/help/article/2348295/business/business-payment-tips) article has a full list. | Text


### Response

You need to save transfer id for tracking its status later.

Field                     | Description                                   | Format
---------                 | -------                                       | -----------
id                        | Transfer id                                   | Integer
user                      | Your user id                                  | Integer
targetAccount             | Recipient account id                          | Integer
sourceAccount             | Not used                                      | Integer
quote                     | Quote id                                      | Integer
status                    | Transfer current status | Text
reference                 | Deprecated, use details.reference instead     | Text
rate                      | Exchange rate value                           | Decimal
created                   | Timestamp when transfer was created | Timestamp 
business                  | Your business profile id                     | 
transferRequest           | Not used   | Integer
details.reference         | Payment reference text        | Text
hasActiveIssues           | Are there any pending issues which stop executing the transfer?  | Boolean 
sourceCurrency            | Source currency code   | Text
sourceValue               | Transfer amount in source currency   |  Decimal
targetCurrency            | Target currency code  | Text
targetValue               | Transfer amount in target currency   | Decimal
customerTransactionId     | UUID format unique identifier assinged by customer. Used for idempotency check purposes.  | UUID 


### Avoiding duplicate transfers
We use **customerTransactionId** field to avoid duplicate transfer requests. 
When your first call fails (error or timeout) then you should use the same value in **customerTransactionId** field that you used in the original call when you are submitting a retry message. 
This way we can treat subsequent retry messages as **repeat messages** and will not create duplicate transfers to your account. 


## Fund - todo

> Example Request:

```shell

curl -X POST https://api.sandbox.transferwise.tech/v1/transfers/{transferId}/payments \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "type": "BALANCE"   
         }'

```

> Example Response:

```json
{
  "type": "BALANCE",
  "status": "COMPLETED",
  "errorCode": null
}

```

This API call is the final step for executing payouts. TransferWise will now debit funds from your borderless balance and start processing your transfer. 
If your borderless balance is short of funds then this call will fail with "insufficient funds" error.

### Request

**`POST https://api.sandbox.transferwise.tech/v1/transfers/{transferId}/payments`**

Use transfer id that you obtained in previous step. 

Field                          | Description                                   | Format
---------                      | -------                                       | -----------
type                  | "BALANCE".  <br/>This indicates that your transfer will be funded from your borderless account balance. | Text


### Response

You need to save transfer id for tracking its status later.

Field                     | Description             | Format
---------                 | -------                 | -----------
type                  | "BALANCE"                   | Text
status                | "COMPLETED" or "REJECTED"                | Text
errorCode             | Failure reason. For example "balance.payment-option-unavailable"           | Text




## Cancel - todo

## Get by Id - todo

## Get Issues - todo

## Get Delivery Time
> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/delivery-estimates/{transferId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
   "estimatedDeliveryDate" : "2018-01-10T12:15:00.000+0000"
}

```

Get the live delivery estimate for a transfer by the transfer ID. <br/>
The delivery estimate is the time at which we currently expect the transfer to arrive in the benificiary's bank account. <br/>
This is not a guaranteed time but we are working hard to make these estimates as accurate as possible.<br/>

### Request

**`GET https://api.sandbox.transferwise.tech/v1/delivery-estimates/{transferId}`**


### Response

You need to save transfer id for tracking its status later.

Field                     | Description             | Format
---------                 | -------                 | -----------
estimatedDeliveryDate     | Estimated time when funds will arrive to recipient's bank account  | Timestamp



## List - todo


## Requirements - todo

