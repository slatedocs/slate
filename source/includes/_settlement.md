# Settlement

The Settlement API allows the investment manager to record trades that have been executed.

## Recording available products

The investment manager must record what investments are going to be available to investors and whether
they will be made available in the ISA.

## Making an investment

The investment manager will periodically record an investment in the Goji platform via the API. This will trigger a
record of the investment against the investors' accounts and also move the funds from the client money account to the investment manager.

![](/images/settlement/images/client-money-investment.png "")

## Bond repayments

The investment manager will calculate repayments and any withholding tax that are due to the investors in the bond. The investment manager will
record the due repayment via the API. Once the funds are received, they will be distributed to the appropriate investors and any tax or fees specified will
be returned to the investment manager to the specified payment destination

![](/images/settlement/images/client-money-repayment.png "")

## Bond maturity

When the bond matures, the investment manager will calculate repayments that are due to the investors in the bond. The investment manager will
record the due repayment via the API. Once the funds are received, they will be distributed to the appropriate investors and any tax or fees specified will
be returned to the investment manager to the specified payment destination.

![](/images/settlement/images/client-money-maturity.png "")

## Secondary market

When the investment manager wishes to transfer ownership of a loan (or part thereof), the sale is recorded via the API
to the Goji platform. If appropriate funds are available in the buyer's account in the Goji platform, the appropriate
transactions are recorded and funds are moved to the seller's account.

![](/images/settlement/images/client-money-secondary-market.png "")

##   GET /settlement/payment-destination

```http

GET /settlement/payment-destination HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "id" : "id"
}
```
### Description
Lists payment destinations. This has been deprecated to be replaced with https://docs.api.goji.investments/payments/reference/payments/bank-account-details
### Response
| Name | Type   | Description                              |
| ---- | ------ | ---------------------------------------- |
| id   | string | The unique id of the payment destination |
##  POST /settlement/payment-destination

```http

POST /settlement/payment-destination HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "reference" : "reference",
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "id" : "id"
}
```
### Description
Adds a payment destination. This has been deprecated to be replaced with https://docs.api.goji.investments/payments/reference/payments/add-bank-account-details
### Request
| Name          | Type   | Description                                       | Required |
| ------------- | ------ | ------------------------------------------------- | -------- |
| accountName   | string | The bank account name.                            | optional |
| accountNumber | string | The bank account number.                          | required |
| sortCode      | string | The bank account sort code.                       | required |
| reference     | string | The reference to be used when transferring funds. | required |
### Response
| Name | Type   | Description                              |
| ---- | ------ | ---------------------------------------- |
| id   | string | The unique id of the payment destination |
##   PUT /settlement/payment-destination/{id}

```http

PUT /settlement/payment-destination/{id} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "reference" : "reference",
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "id" : "id"
}
```
### Description
Updates a payment destination. This has been deprecated to be replaced with https://docs.api.goji.investments/payments/reference/payments/update-bank-account-details
### Request
| Name          | Type   | Description                                       | Required |
| ------------- | ------ | ------------------------------------------------- | -------- |
| accountName   | string | The bank account name.                            | optional |
| accountNumber | string | The bank account number.                          | required |
| sortCode      | string | The bank account sort code.                       | required |
| reference     | string | The reference to be used when transferring funds. | required |
### Response
| Name | Type   | Description                              |
| ---- | ------ | ---------------------------------------- |
| id   | string | The unique id of the payment destination |
##  POST /settlement/repayment

```http

POST /settlement/repayment HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "reference" : "reference",
  "investorRepayments" : [ {
    "amount" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "investmentId" : "investmentId",
    "tax" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "type" : "CAPITAL"
  }, {
    "amount" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "investmentId" : "investmentId",
    "tax" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "type" : "CAPITAL"
  } ]
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Adds a repayment to an investment.
### Request
| Name                              | Type   | Description                                            | Required |
| --------------------------------- | ------ | ------------------------------------------------------ | -------- |
| reference                         | string | The payment reference used for the repayment of funds. | required |
| investorRepayments                | array  | The repayments per investor.                           | required |
| investorRepayments[].investmentId | string | The ID of the of the investment                        | required |
| investorRepayments[].type         | string | The type of the repayment                              | required |
| investorRepayments[].amount       | ref    | The amount being repaid                                | required |
| investorRepayments[].tax          | ref    | The amount of tax being withheld from this repayment   | optional |
### Response
| Name | Type | Description || ---- | ---- | ----------- |

##   GET /settlement/repayment/reference

```http

GET /settlement/repayment/reference HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "reference" : "reference",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}
```
### Description
Generates a repayment reference to be used when depositing repayment funds.
### Response
| Name          | Type   | Description                                                  |
| ------------- | ------ | ------------------------------------------------------------ |
| reference     | string | The bank reference to be used when depositing the repayment. |
| accountNumber | string | The account number for the repayment deposit.                |
| sortCode      | string | The sort code for the repayment deposit.                     |
##   GET /settlement/investors/{clientId}/accounts/{accountType}/investments

```http

GET /settlement/investors/{clientId}/accounts/{accountType}/investments HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "investments" : [ {
    "amount" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "clientId" : "clientId",
    "productId" : "productId",
    "investmentId" : "investmentId",
    "accountType" : "GOJI_INVESTMENT",
    "trancheId" : "trancheId"
  }, {
    "amount" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "clientId" : "clientId",
    "productId" : "productId",
    "investmentId" : "investmentId",
    "accountType" : "GOJI_INVESTMENT",
    "trancheId" : "trancheId"
  } ]
}
```
### Description
Lists recorded investments for an investor.
### Response
| Name                       | Type   | Description                                                                                                     |
| -------------------------- | ------ | --------------------------------------------------------------------------------------------------------------- |
| investments                | array  |                                                                                                                 |
| investments[].investmentId | string | The ID of the investment. This is the ID of the overall investment and so will be shared by multiple investors. |
| investments[].clientId     | string | The ID of the investor                                                                                          |
| investments[].productId    | string | The ID of the investment product as preciously registered in the system                                         |
| investments[].trancheId    | string | The ID of the investment tranche of a particular product                                                        |
| investments[].amount       | ref    | The amount being invested                                                                                       |
| investments[].accountType  | string | The account making the investment.                                                                              |
##  POST /settlement/tranche

```http

POST /settlement/tranche HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "reference" : "reference",
  "paymentDestinationId (Deprecated)" : "paymentDestinationId (Deprecated)",
  "productId" : "productId",
  "bankAccountId" : "bankAccountId",
  "id" : "id",
  "investments" : [ {
    "amount" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "clientId" : "clientId",
    "accountType" : "GOJI_INVESTMENT",
    "id" : "id"
  }, {
    "amount" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "clientId" : "clientId",
    "accountType" : "GOJI_INVESTMENT",
    "id" : "id"
  } ]
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "reference" : "reference",
  "totalAmount" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "id" : "id",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}
```
### Description
Records an investment and triggers a transfer of funds to the Investment Manager.
### Request
| Name                              | Type   | Description                                                                                                                 | Required |
| --------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------- | -------- |
| id                                | string | The unique ID for this tranche of investment                                                                                | required |
| productId                         | string | The ID of the investment product as preciously registered in the system                                                     | required |
| paymentDestinationId (Deprecated) | string | The ID of the payment destination to be used for this tranche. This has been deprecated, please use the bankAccountId field | optional |
| bankAccountId                     | string | The ID of the bank account details to be used for this tranche.                                                             | required |
| reference                         | string | The bank reference for the funds transfer                                                                                   | required |
| investments                       | array  |                                                                                                                             | required |
| investments[].id                  | string | The unique ID for this clients investment                                                                                   | required |
| investments[].clientId            | string | The ID of the investor                                                                                                      | required |
| investments[].amount              | ref    | The amount being invested                                                                                                   | required |
| investments[].accountType         | string | The account making the investment.                                                                                          | required |
### Response
| Name                 | Type   | Description                                  |
| -------------------- | ------ | -------------------------------------------- |
| id                   | string | The unique ID for this investment            |
| totalAmount          | ref    | The total amount being invested              |
| totalAmount.amount   | number | The amount.                                  |
| totalAmount.currency | string | The ISO 4217 three character codes eg 'GBP'  |
| sortCode             | string | The sort code the funds will be sent to      |
| accountNumber        | string | The account number the funds will be sent to |
| reference            | string | The bank reference for the funds transfer    |
##  POST /settlement/secondary-market

```http

POST /settlement/secondary-market HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "buySide" : {
    "reference" : "reference",
    "clientId" : "clientId",
    "accountType" : "GOJI_INVESTMENT",
    "fee" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "bankAccountId" : "bankAccountId",
    "feePaymentDestination (Deprecated)" : "feePaymentDestination (Deprecated)",
    "newInvestmentId" : "newInvestmentId",
    "totalPurchaseAmount" : {
      "amount" : 2.68,
      "currency" : "currency"
    }
  },
  "sellSide" : {
    "reference" : "reference",
    "clientId" : "clientId",
    "premium" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "investmentId" : "investmentId",
    "fee" : {
      "amount" : 2.68,
      "currency" : "currency"
    },
    "bankAccountId" : "bankAccountId",
    "feePaymentDestination (Deprecated)" : "feePaymentDestination (Deprecated)",
    "capitalAmount" : {
      "amount" : 2.68,
      "currency" : "currency"
    }
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Records the settlement of a secondary market trade.
### Request
| Name                                        | Type   | Description                                                                                                     | Required |
| ------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------- | -------- |
| sellSide                                    | ref    | Details of the sell side.                                                                                       | required |
| sellSide.clientId                           | string | The client ID of the seller                                                                                     ||
| sellSide.investmentId                       | string | The ID of the investment being sold                                                                             ||
| capitalAmount.amount                        | number | The amount.                                                                                                     ||
| capitalAmount.currency                      | string | The ISO 4217 three character codes eg 'GBP'                                                                     ||
| premium.amount                              | number | The amount.                                                                                                     ||
| premium.currency                            | string | The ISO 4217 three character codes eg 'GBP'                                                                     ||
| fee.amount                                  | number | The amount.                                                                                                     ||
| fee.currency                                | string | The ISO 4217 three character codes eg 'GBP'                                                                     ||
| sellSide.feePaymentDestination (Deprecated) | string | The ID of the payment destination to send fees to. This has been deprecated, please use the bankAccountId field ||
| sellSide.bankAccountId                      | string | The ID of the bank account details to send fees to                                                              ||
| sellSide.reference                          | string | The bank reference for the funds transfer                                                                       ||
| buySide                                     | ref    | Details of the buy side.                                                                                        | required |
| buySide.clientId                            | string | The client ID of the buyer                                                                                      ||
| buySide.accountType                         | string | The account purchasing the investment                                                                           ||
| totalPurchaseAmount.amount                  | number | The amount.                                                                                                     ||
| totalPurchaseAmount.currency                | string | The ISO 4217 three character codes eg 'GBP'                                                                     ||
| fee.amount                                  | number | The amount.                                                                                                     ||
| fee.currency                                | string | The ISO 4217 three character codes eg 'GBP'                                                                     ||
| buySide.feePaymentDestination (Deprecated)  | string | The ID of the payment destination to send fees to. This has been deprecated, please use the bankAccountId field ||
| buySide.bankAccountId                       | string | The ID of the bank account details to send fees to                                                              ||
| buySide.reference                           | string | The bank reference for the funds transfer                                                                       ||
| buySide.newInvestmentId                     | string | The ID for the investment being held by the buy side investor                                                   ||
### Response
| Name | Type | Description || ---- | ---- | ----------- |

##   GET /settlement/product

```http

GET /settlement/product HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "products" : [ {
    "investmentDocument" : "investmentDocument",
    "isaEligible" : true,
    "id" : "id"
  }, {
    "investmentDocument" : "investmentDocument",
    "isaEligible" : true,
    "id" : "id"
  } ]
}
```
### Description
Returns list of registered products
### Response
| Name                          | Type    | Description                                                                                                    |
| ----------------------------- | ------- | -------------------------------------------------------------------------------------------------------------- |
| products                      | array   |                                                                                                                |
| products[].id                 | string  | The unique ID of the product                                                                                   |
| products[].investmentDocument | string  | A URL to a KID, investment memorandum or similar. This is used to track investments and their ISA suitability. |
| products[].isaEligible        | boolean | True if the investment can be included in an IF ISA.                                                           |
##  POST /settlement/product

```http

POST /settlement/product HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "investmentDocument" : "investmentDocument",
  "isaEligible" : true,
  "id" : "id"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "investmentDocument" : "investmentDocument",
  "isaEligible" : true,
  "id" : "id"
}
```
### Description
Adds a registered product
### Request
| Name               | Type    | Description                                                                                                    | Required |
| ------------------ | ------- | -------------------------------------------------------------------------------------------------------------- | -------- |
| id                 | string  | The unique ID of the product                                                                                   | required |
| investmentDocument | string  | A URL to a KID, investment memorandum or similar. This is used to track investments and their ISA suitability. | required |
| isaEligible        | boolean | True if the investment can be included in an IF ISA.                                                           | required |
### Response
| Name               | Type    | Description                                                                                                    |
| ------------------ | ------- | -------------------------------------------------------------------------------------------------------------- |
| id                 | string  | The unique ID of the product                                                                                   |
| investmentDocument | string  | A URL to a KID, investment memorandum or similar. This is used to track investments and their ISA suitability. |
| isaEligible        | boolean | True if the investment can be included in an IF ISA.                                                           |
##   PUT /settlement/product/{productId}

```http

PUT /settlement/product/{productId} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "investmentDocument" : "investmentDocument",
  "isaEligible" : true
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "investmentDocument" : "investmentDocument",
  "isaEligible" : true,
  "id" : "id"
}
```
### Description
Updates a registered product
### Request
| Name               | Type    | Description                                                                                                    | Required |
| ------------------ | ------- | -------------------------------------------------------------------------------------------------------------- | -------- |
| investmentDocument | string  | A URL to a KID, investment memorandum or similar. This is used to track investments and their ISA suitability. | required |
| isaEligible        | boolean | True if the investment can be included in an IF ISA.                                                           | required |
### Response
| Name               | Type    | Description                                                                                                    |
| ------------------ | ------- | -------------------------------------------------------------------------------------------------------------- |
| id                 | string  | The unique ID of the product                                                                                   |
| investmentDocument | string  | A URL to a KID, investment memorandum or similar. This is used to track investments and their ISA suitability. |
| isaEligible        | boolean | True if the investment can be included in an IF ISA.                                                           |
