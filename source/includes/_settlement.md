# Settlement
Settle securities not managed by the Bond management module.

<a name="loadrecordedinvestmentsforinvestor"></a>
## List investments for an investor
```http
GET /settlement/investors/{clientId}/accounts/{accountType}/investments HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

HTTP/1.1 200 OK
Content-Type: application/json

  {
      "investments": [
          {
              "accountType": "string",
              "amount": {
                  "amount": "number",
                  "currency": "string"
              },
              "clientId": "string",
              "investmentId": "string",
              "productId": "string",
              "trancheId": "string"
          }
      ]
  }
```
#### Description
Lists recorded investments for an investor.

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**accountType**  <br>*required*|The type of the account|enum (ISA, GOJI_INVESTMENT)|
|**Path**|**clientId**  <br>*required*|The ID of the investor|string|

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**accountType**|The type of the account|enum (ISA, GOJI_INVESTMENT)|
|**Body**|**amount**|The amount of the investment|string|
|**Body**|**clientId**|The id of the client|string|
|**Body**|**investmentId**|The unique id of the investment|string|
|**Body**|**productId**|The product id|string|
|**Body**|**trancheId**|The tranche id|string|


<a name="recordrepaymentdestination"></a>
## Adds a payment destination (Deprecated)
```http
POST /settlement/payment-destination HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {
    "accountName": "string",
    "accountNumber": "string",
    "sortCode": "string",
    "reference": "string"
  }

HTTP/1.1 200 OK
Content-Type: application/json

  {
      "id": "string"
  }
```

#### Description
Adds a payment destination. This has been deprecated to be replaced with https://docs.api.goji.investments/payments/reference/payments/add-bank-account-details

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**accountName**|The name of the account|string|
|**Body**|**accountNumber**|The account number|string|
|**Body**|**sortCode**|The sortcode for the account|string|
|**Body**|**reference**|The bank account reference|string|

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**id**|The id of the payment destination|string|

<a name="listrepaymentdestination"></a>
## Lists payment destinations (Deprecated)
```http
GET /settlement/payment-destination HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "paymentDestinations": [
    {
      "accountName": "string",
      "accountNumber": "string",
      "sortCode": "string",
      "reference": "string"
    }
  ]
}
```

#### Description
Lists payment destinations. This has been deprecated to be replaced with https://docs.api.goji.investments/payments/reference/payments/bank-account-details

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**accountName**|The name of the account|string|
|**Body**|**accountNumber**|The account number|string|
|**Body**|**sortCode**|The sort code|string|
|**Body**|**reference**|The bank reference|string|

<a name="updaterepaymentdestination"></a>
## Updates a payment destination (Deprecated)
```http
PUT /settlement/payment-destination/{id} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {
    "accountName": "string",
    "accountNumber": "string",
    "sortCode": "string",
    "reference": "string"
  }

HTTP/1.1 200 OK
Content-Type: application/json

  {
      "id": "string"
  }
```
#### Description
Updates a payment destination. This has been deprecated to be replaced with https://docs.api.goji.investments/payments/reference/payments/update-bank-account-details

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**id**  <br>*required*|The id of the payment destination to update|string|
|**Body**|**accountName**  <br>*required*|The account name|string|
|**Body**|**accountNumber**  <br>*required*|The accountNumber|string|
|**Body**|**sortCode**  <br>*required*|The sort code|string|
|**Body**|**reference**  <br>*required*|The payment reference|string|

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**id**|The id of the updated bank account details|string|

<a name="addclientmoneyregisteredproduct"></a>
## Adds a registered product
```http
POST /settlement/product HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {
      "id": "string",
      "investmentDocument": "string",
      "isaEligible": boolean
  }

HTTP/1.1 200 OK
Content-Type: application/json

  "SUCCESS"
```
#### Description
Adds a registered product

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**id**  <br>*required*|The unique id for the product|string|
|**Body**|**investmentDocument**  <br>*required*|A link to the investment document / memorandum|string|
|**Body**|**isaEligible**  <br>*required*|If the product is suitable for an ISA|boolean|

<a name="settlementregisteredproducts"></a>
## Returns list of registered products
```http
GET /settlement/product HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

HTTP/1.1 200 OK
Content-Type: application/json

 {
     "products": [
         {
             "id": "string",
             "investmentDocument": "string",
             "isaEligible": boolean
         }
     ]
 }
```
#### Description
Returns list of registered products

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**products[].id**|The unique id for the product|string|
|**Body**|**products[].investmentDocument**|A link to the investment document / memorandum|string|
|**Body**|**products[].isaEligible**|If the product is suitable for an ISA|boolean|

<a name="updateclientmoneyregisteredproduct"></a>
## Updates a registered product
```http
PUT /settlement/product/{productId} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

 {
     "investmentDocument": "string",
     "isaEligible": "boolean"
 }

HTTP/1.1 200 OK
Content-Type: application/json

  "SUCCESS"
```
#### Description
Updates a registered product

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**investmentDocument**|A link to the investment document / memorandum|string|
|**Body**|**isaEligible**|If the product is suitable for an ISA|boolean|

<a name="recordrepayment"></a>
## Adds a repayment to an investment
```http
POST /settlement/repayment HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {
    "investorRepayments": [
        {
            "amount": {
                "amount": "number",
                "currency": "string"
            },
            "investmentId": "string",
            "tax": {
                "amount": "number",
                "currency": "string"
            },
            "type": "string"
        }
    ],
    "reference": "string"
  }

HTTP/1.1 200 OK
Content-Type: application/json

  "SUCCESS"
```
#### Description
Adds a repayment to an investment.

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**investorRepayments[].amount.amount**  <br>*required*|The amount |number|
|**Body**|**investorRepayments[].amount.currency**  <br>*required*|The ISO currency code|string|
|**Body**|**investorRepayments[].investmentId**  <br>*required*|The investmentId related to this repayment|string|
|**Body**|**investorRepayments[].tax.amount**  <br>*optional*|The amount of tax if any to be withheld|string|
|**Body**|**investorRepayments[].tax.currency**  <br>*optional*|The ISO currency code for the tax|string|
|**Body**|**investorRepayments[].type**  <br>*required*|The type of repayment. enum(CAPITAL, INTEREST)|string|
|**Body**|**reference**  <br>*required*|The repayment reference to validate the monies received|string|

<a name="repaymentreference"></a>
## Generate repayment reference
```http
GET /settlement/repayment/reference HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

HTTP/1.1 200 OK
Content-Type: application/json

  {
    "accountNumber": "string",
    "reference": "string",
    "sortCode": "string"
  }
```
#### Description
Generates a repayment reference to be used when depositing repayment funds.

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**accountNumber**|The accountNumber|string|
|**Body**|**sortCode**|The sort code|string|
|**Body**|**reference**|The payment reference|string|

<a name="settlementsecondarymarket"></a>
## Records the settlement of a secondary market trade
```http
POST /settlement/secondary-market HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {
    "buySide": {
        "accountType": "string",
        "bankAccountId": "string",
        "clientId": "string",
        "fee": {
            "amount": "number",
            "currency": "string"
        },
        "feePaymentDestination (Deprecated)": "string",
        "newInvestmentId": "string",
        "reference": "string",
        "totalPurchaseAmount": {
            "amount": "number",
            "currency": "string"
        }
    },
    "sellSide": {
        "bankAccountId": "string",
        "clientId": "string",
        "fee": {
            "amount": "number",
            "currency": "string"
        },
        "feePaymentDestination (Deprecated)": "string",
        "investmentId": "string",
        "premium": {
            "amount": "number",
            "currency": "string"
        },
        "reference": "string",
        "remainingCapitalAmount": {
            "amount": "number",
            "currency": "string"
        }
    }
  }

HTTP/1.1 200 OK
Content-Type: application/json

```
#### Description
Records the settlement of a secondary market trade.

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**buySide.accountType**  <br>*required*|The account purchasing the investment|enum (GOJI_INVESTMENT, ISA, SIPP)|
|**Body**|**buySide.bankAccountId**  <br>*optional*|The ID of the bank account details to send fees to|string|
|**Body**|**buySide.clientId**  <br>*required*|The client ID of the buyer|string|
|**Body**|**buySide.fee.amount**  <br>*optional*|The fee amount being paid by the buyer. In addition to the totalPurchaseAmount.|number|
|**Body**|**buySide.fee.currency**  <br>*optional*|The ISO Currency code|string|
|**Body**|**buySide.feePaymentDestination (Deprecated)**  <br>*optional*|The ID of the payment destination to send fees to. This has been deprecated, please use the bankAccountId field|string|
|**Body**|**buySide.newInvestmentId**  <br>*required*|The ID for the investment being held by the buy side investor|string|
|**Body**|**buySide.reference**  <br>*required*|The bank reference for the funds transfer|string|
|**Body**|**buySide.totalPurchaseAmount.amount**  <br>*required*|The total amount being paid for the investment. This must equal the sum of the remainingCapitalAmount plus premium on the sell side.|number|
|**Body**|**buySide.totalPurchaseAmount.currency**  <br>*required*|The ISO Currency code|string|
|**Body**|**sellSide.bankAccountId**  <br>*optional*|The ID of the bank account details to send fees to|string|
|**Body**|**sellSide.clientId**  <br>*required*|The client ID of the seller|string|
|**Body**|**sellSide.fee.amount**  <br>*optional*|The fee being paid by the seller. Deducted from the total sales price.|number|
|**Body**|**sellSide.fee.currency**  <br>*optional*|The ISO Currency code|string|
|**Body**|**sellSide.feePaymentDestination (Deprecated)**  <br>*optional*|The ID of the payment destination to send fees to. This has been deprecated, please use the bankAccountId field|string|
|**Body**|**sellSide.investmentId**  <br>*required*|The ID of the investment being sold|string|
|**Body**|**sellSide.premium.amount**  <br>*optional*|The premium (positive or negative) added to the remaining capital amount to get the total sales price.|number|
|**Body**|**sellSide.premium.currency**  <br>*optional*|The ISO Currency code|string|
|**Body**|**sellSide.reference**  <br>*required*|The bank reference for the funds transfer|string|
|**Body**|**sellSide.remainingCapitalAmount.amount**  <br>*required*|The remaining capital amount of the investment being sold.|number|
|**Body**|**sellSide.remainingCapitalAmount.currency**  <br>*required*|The ISO Currency code|string|

<a name="settlementrecordinvestment"></a>
## Records an investment tranche and triggers a transfer of funds to the Investment Manager
```http
POST /settlement/tranche HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {
    "bankAccountId": "string",
    "id": "string",
    "investments": [
        {
            "accountType": "string",
            "amount": {
                "amount": "number",
                "currency": "string"
            },
            "clientId": "string",
            "id": "string"
        }
    ],
    "paymentDestinationId (Deprecated)": "string",
    "productId": "string",
    "reference": "string"
  }

HTTP/1.1 200 OK
Content-Type: application/json

  {
     "accountNumber": "string",
     "id": "string",
     "reference": "string",
     "sortCode": "string",
     "totalAmount": {
         "amount": "number",
         "currency": "string"
     }
  }
```
#### Description
Records an investment and triggers a transfer of funds to the Investment Manager.

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**bankAccountId**  <br>*required*|The ID of the bank account details to be used for this tranche.|string|
|**Body**|**id**  <br>*required*|The unique ID for this tranche of investment|string|
|**Body**|**investments[].amount.amount**  <br>*required*|The amount for the investment|number|
|**Body**|**investments[].amount.currency**  <br>*required*|The ISO currency code for the investment amount|string|
|**Body**|**investments[].clientId**  <br>*required*|The clientId for the investment|string|
|**Body**|**investments[].accountType**  <br>*required*|The clients accountType (ISA, GOJI_INVESTMENTS)|string|
|**Body**|**investments[].id**  <br>*required*|The unique id for the investment|string|
|**Body**|**paymentDestinationId (Deprecated)**  <br>*optional*|The ID of the payment destination to be used for this tranche. This has been deprecated, please use the bankAccountId field|string|
|**Body**|**productId**  <br>*required*|The ID of the investment product as preciously registered in the system|string|
|**Body**|**reference**  <br>*required*|The bank reference for the funds transfer|string|

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**id**|The unique ID for this investment tranche|string|
|**Body**|**accountNumber**|The account number the funds will be sent to|string|
|**Body**|**sortCode**|The sort code the funds will be sent to|string|
|**Body**|**reference**|The bank reference for the funds transfer|string|
|**Body**|**totalAmount.amount**|The total amount being invested|number|
|**Body**|**totalAmount.currency**|The ISO currency code for the investment amount|string|

