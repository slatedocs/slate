# Settlement
<a name="overview"></a>
### Overview
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

#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**accountType**  <br>*required*|The type of the account|enum (ISA, GOJI_INVESTMENT)|
|**Path**|**clientId**  <br>*required*|The ID of the investor|string|

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Investments.|[ClientMoneyInvestmentsForInvestor](#clientmoneyinvestmentsforinvestor)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**paymentDestination**  <br>*optional*|The payment destination|[PaymentDestination](#paymentdestination)|

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

#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**paymentDestination**  <br>*optional*|The payment destination|[PaymentDestinations](#paymentdestinations)|

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Payment Destination Id.|[PaymentDestinationResponse](#paymentdestinationresponse)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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

#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**id**  <br>*required*|The id of the payment destination to update|string|
|**Body**|**paymentDestination**  <br>*optional*|The payment destination update|[PaymentDestination](#paymentdestination)|

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Payment Destination Id.|[PaymentDestinationResponse](#paymentdestinationresponse)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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
      "isaEligible": "boolean"
  }

HTTP/1.1 200 OK
Content-Type: application/json

  "SUCCESS"
```
#### Description
Adds a registered product

#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**product**  <br>*optional*|Product to add|[RegisteredProduct](#registeredproduct)|


#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|The registered product.|[RegisteredProduct](#registeredproduct)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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
             "isaEligible": "boolean"
         }
     ]
 }
```
#### Description
Returns list of registered products

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|List of registered products.|[ListRegisteredProducts](#listregisteredproducts)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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

#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**productId**  <br>*required*|The ID of the product.|string|
|**Body**|**product**  <br>*optional*|Product to add|[RegisteredProductUpdate](#registeredproductupdate)|

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|The registered product.|[RegisteredProduct](#registeredproduct)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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

#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**repayment**  <br>*optional*|The repayment|[ClientMoneyRepayment](#clientmoneyrepayment)|

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|The repayments were registered successfully.|No Content|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|RepaymentReference.|[RepaymentReference](#repaymentreference)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**secondaryMarketTrade**  <br>*optional*|The secondary market trade|[SettleSecondaryMarketTrade](#settlesecondarymarkettrade)|

#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Added secondary market trade.|No Content|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

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

#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**investment**  <br>*optional*|Investment to add|[ClientMoneyTranche](#clientmoneytranche)|

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Added investment.|[ClientMoneyInvestmentResponse](#clientmoneyinvestmentresponse)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|

<a name="definitions"></a>
## Definitions

<a name="accountbalance"></a>
### Account Balance

|Name|Description|Schema|
|---|---|---|
|**isaRemainingSubscriptionAmount**  <br>*optional*|The remaining amount of new funds that can be added to the ISA this tax year. null if not an ISA balance|[MonetaryAmount](#monetaryamount)|
|**totalBalance**  <br>*optional*|The total balance. The sum of the invested, queued and cash balances.|[MonetaryAmount](#monetaryamount)|
|**totalCashBalance**  <br>*optional*|The total cash balance.|[MonetaryAmount](#monetaryamount)|
|**totalInvestedBalance**  <br>*optional*|The total invested balance.|[MonetaryAmount](#monetaryamount)|
|**totalQueuedInvestedBalance**  <br>*optional*|The total queued for investment.|[MonetaryAmount](#monetaryamount)|


<a name="accountbalances"></a>
### Account Balances

|Name|Description|Schema|
|---|---|---|
|**accounts**  <br>*optional*|A breakdown of the balances by account.|[accounts](#accountbalances-accounts)|
|**totalBalance**  <br>*optional*|The total balance. The sum of the invested, queued and cash balances.|[MonetaryAmount](#monetaryamount)|
|**totalCashBalance**  <br>*optional*|The total cash balance.|[MonetaryAmount](#monetaryamount)|
|**totalInvestedBalance**  <br>*optional*|The total invested balance.|[MonetaryAmount](#monetaryamount)|
|**totalQueuedInvestedBalance**  <br>*optional*|The total queued for investment.|[MonetaryAmount](#monetaryamount)|

<a name="accountbalances-accounts"></a>
**accounts**

|Name|Schema|
|---|---|
|**GOJI_INVESTMENT**  <br>*optional*|[AccountBalance](#accountbalance)|
|**ISA**  <br>*optional*|[AccountBalance](#accountbalance)|


<a name="accounttype"></a>
### Account Type
*Type* : enum (GOJI_INVESTMENT, ISA)


<a name="accounts"></a>
### Accounts

|Name|Schema|
|---|---|
|**accounts**  <br>*optional*|< enum (GOJI_INVESTMENT, ISA) > array|


<a name="addisa"></a>
### Add ISA

|Name|Description|Schema|
|---|---|---|
|**nationalInsuranceNumber**  <br>*required*|The national insurance number of the investor.|string|


<a name="address"></a>
### Address

|Name|Description|Schema|
|---|---|---|
|**country**  <br>*required*|The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.|string|
|**lineOne**  <br>*required*|Line one of the address.|string|
|**lineThree**  <br>*optional*|Line three of the address.|string|
|**lineTwo**  <br>*optional*|Line two of the address.|string|
|**postcode**  <br>*required*|The post code of the address.|string|
|**region**  <br>*required*|The region of the address eg county.|string|
|**townCity**  <br>*required*|The town/city of the address.|string|


<a name="bankdetails"></a>
### Bank Details

|Name|Description|Schema|
|---|---|---|
|**accountName**  <br>*required*|The account name.|string|
|**accountNumber**  <br>*required*|The account number.|string|
|**sortCode**  <br>*required*|The sort code.|string|


<a name="banktransferdetails"></a>
### Bank Transfer Details

|Name|Description|Schema|
|---|---|---|
|**accountNumber**  <br>*optional*|The account number.|string|
|**bankReference**  <br>*optional*|The reference to use for the transfer.|string|
|**sortCode**  <br>*optional*|The sort code.|string|


<a name="bond"></a>
### Bond

|Name|Description|Schema|
|---|---|---|
|**accruedInterestAmount**  <br>*optional*|The amount of interest that will be requested before the next repayment date.|[MonetaryAmount](#monetaryamount)|
|**id**  <br>*optional*|The ID of the Bond.|string|
|**initialInvestmentAmount**  <br>*optional*|The initial investment amount.|[MonetaryAmount](#monetaryamount)|
|**maturity**  <br>*optional*|The maturity of the bond.|[Maturity](#maturity)|
|**nextRepaymentDate**  <br>*optional*|The date of the next repayment event.|string (date)|
|**productCode**  <br>*optional*|The product code of the bond.|string|
|**startDate**  <br>*optional*|The start date of the bond.|string (date)|
|**status**  <br>*optional*|The status of the bond.|enum (QUEUED, LIVE, MATURED)|
|**totalAmount**  <br>*optional*|The total current invested amount. This can increase up to the start date of the bond.|[MonetaryAmount](#monetaryamount)|


<a name="clientmoneyinvestmentitem"></a>
### Investment for a specific investor

|Name|Description|Schema|
|---|---|---|
|**accountType**  <br>*optional*|The account making the investment.|enum (GOJI_INVESTMENT, ISA)|
|**amount**  <br>*optional*|The amount being invested|[MonetaryAmount](#monetaryamount)|
|**clientId**  <br>*optional*|The ID of the investor|string|
|**investmentId**  <br>*optional*|The ID of the investment. This is the ID of the overall investment and so will be shared by multiple investors.|string|
|**productId**  <br>*optional*|The ID of the investment product as preciously registered in the system|string|
|**trancheId**  <br>*optional*|The ID of the investment tranche of a particular product|string|


<a name="clientmoneyinvestmentresponse"></a>
### An investment response

|Name|Description|Schema|
|---|---|---|
|**accountNumber**  <br>*optional*|The account number the funds will be sent to|string|
|**id**  <br>*optional*|The unique ID for this investment|string|
|**reference**  <br>*optional*|The bank reference for the funds transfer|string|
|**sortCode**  <br>*optional*|The sort code the funds will be sent to|string|
|**totalAmount**  <br>*optional*|The total amount being invested|[MonetaryAmount](#monetaryamount)|


<a name="clientmoneyinvestmentsforinvestor"></a>
### Investments for the investor

|Name|Schema|
|---|---|
|**investments**  <br>*optional*|< [ClientMoneyInvestmentItem](#clientmoneyinvestmentitem) > array|


<a name="clientmoneyrepayment"></a>
### The repayment to be added to the investment.

|Name|Description|Schema|
|---|---|---|
|**investorRepayments**  <br>*required*|The repayments per investor.|< [ClientMoneyRepaymentItem](#clientmoneyrepaymentitem) > array|
|**reference**  <br>*required*|The payment reference used for the repayment of funds.|string|


<a name="clientmoneyrepaymentitem"></a>
### The repayment for a specific investor

|Name|Description|Schema|
|---|---|---|
|**amount**  <br>*required*|The amount being repaid|[MonetaryAmount](#monetaryamount)|
|**investmentId**  <br>*required*|The ID of the of the investment|string|
|**tax**  <br>*optional*|The amount of tax being withheld from this repayment|[MonetaryAmount](#monetaryamount)|
|**type**  <br>*required*|The type of the repayment|enum (CAPITAL, INTEREST)|


<a name="clientmoneyrepaymentresponse"></a>
### The details for sending the repayment.

|Name|Description|Schema|
|---|---|---|
|**accountNumber**  <br>*optional*|The account number to end the funds to.|string|
|**reference**  <br>*optional*|The bank reference for the funds transfer.|string|
|**sortCode**  <br>*optional*|The sort code to send the funds to.|string|
|**totalAmount**  <br>*optional*|The total amount to send.|[MonetaryAmount](#monetaryamount)|


<a name="clientmoneytranche"></a>
### A recorded investment tranche

|Name|Description|Schema|
|---|---|---|
|**bankAccountId**  <br>*required*|The ID of the bank account details to be used for this tranche.|string|
|**id**  <br>*required*|The unique ID for this tranche of investment|string|
|**investments**  <br>*required*||< [CreateClientMoneyInvestmentItem](#createclientmoneyinvestmentitem) > array|
|**paymentDestinationId (Deprecated)**  <br>*optional*|The ID of the payment destination to be used for this tranche. This has been deprecated, please use the bankAccountId field|string|
|**productId**  <br>*required*|The ID of the investment product as preciously registered in the system|string|
|**reference**  <br>*required*|The bank reference for the funds transfer|string|


<a name="contactdetails"></a>
### Contact Details

|Name|Description|Schema|
|---|---|---|
|**emailAddress**  <br>*required*|The email address.|string|
|**telephoneNumber**  <br>*required*|The telephone number.|string|


<a name="corporatedetails"></a>
### Corporate Details

|Name|Description|Schema|
|---|---|---|
|**companyName**  <br>*required*|The company name.|string|
|**companyType**  <br>*required*|The company type.|string|
|**registrationNumber**  <br>*required*|The company registration number.|string|


<a name="createclientmoneyinvestmentitem"></a>
### Investment for a specific investor

|Name|Description|Schema|
|---|---|---|
|**accountType**  <br>*required*|The account making the investment.|enum (GOJI_INVESTMENT, ISA)|
|**amount**  <br>*required*|The amount being invested|[MonetaryAmount](#monetaryamount)|
|**clientId**  <br>*required*|The ID of the investor|string|
|**id**  <br>*required*|The unique ID for this clients investment|string|


<a name="createinvestment"></a>
### Create Investment

|Name|Description|Schema|
|---|---|---|
|**amount**  <br>*required*|The amount invested.|[MonetaryAmount](#monetaryamount)|
|**productTermId**  <br>*required*|The product code for the investment.|string|
|**repaymentProfileId**  <br>*required*|The repayment profile ID.|integer|


<a name="createinvestor"></a>
### Create Investor

|Name|Description|Schema|
|---|---|---|
|**accountTypes**  <br>*optional*|defaults to [GOJI_INVESTMENT, ISA] if not provided for a INDIVIDUAL entityType. Defaults to [GOJI_INVESTMENT] for CORPORATE entityType. ISA invalid for CORPORATE entityType|< [AccountType](#accounttype) > array|
|**address**  <br>*required*||[Address](#address)|
|**contactDetails**  <br>*required*||[ContactDetails](#contactdetails)|
|**corporateDetails**  <br>*optional*|only required for CORPORATE entityType.|[CorporateDetails](#corporatedetails)|
|**dateOfBirth**  <br>*required*|The date of birth of the investor.|string (date)|
|**employmentDetails**  <br>*optional*||[EmploymentDetails](#employmentdetails)|
|**entityType**  <br>*required*||enum (INDIVIDUAL, CORPORATE)|
|**firstName**  <br>*required*|The first name of the investor.|string|
|**investorDeclarationType**  <br>*required*|All investors must complete a declaration to confirm the kind of investor they are.|enum (RESTRICTED, HIGH_NET_WORTH, INVESTMENT_PROFESSIONAL, SOPHISTICATED)|
|**lastName**  <br>*required*|The last name of the investor.|string|
|**migrationDetails**  <br>*optional*|Optional. Only required if migrating an investor.|[MigrationDetails](#migrationdetails)|
|**nationalInsuranceNumber**  <br>*optional*|The national insurance number of the investor. Only required if opening an ISA.|string|
|**nationality**  <br>*required*|The nationality of the investor in 2 character ISO country code eg. GB for British.|string|
|**title**  <br>*required*|The title of the investor.|enum (MISS, MR, MRS, MS, DR)|


<a name="currentbonds"></a>
### Current Bonds

|Name|Schema|
|---|---|
|**bonds**  <br>*optional*|< [Bond](#bond) > array|


<a name="documentupload"></a>
### Document Upload

|Name|Description|Schema|
|---|---|---|
|**data**  <br>*required*|The file to upload Base64 encoded.|string|
|**fileName**  <br>*required*|The file name eg passport.pdf.|string|


<a name="employmentdetails"></a>
### Employment Details

|Name|Description|Schema|
|---|---|---|
|**employmentStatus**  <br>*required*|The employment status.|enum (EMPLOYED_FULL_TIME, EMPLOYED_PART_TIME, SELF_EMPLOYED, UNEMPLOYED, HOUSE_PERSON, EDUCATION, RETIRED, NOT_WORKING_ILLNESS_DISABILITY)|
|**jobTitle**  <br>*required*|The job title.|string|


<a name="error"></a>
### Error

|Name|Description|Schema|
|---|---|---|
|**errorCode**  <br>*optional*|The error code.|string|
|**message**  <br>*optional*|The error message.|string|


<a name="errorresponse"></a>
### Error Response

|Name|Schema|
|---|---|
|**errors**  <br>*optional*|< [Error](#error) > array|


<a name="isadeclaration"></a>
### ISA Declaration

|Name|Description|Schema|
|---|---|---|
|**declaration**  <br>*optional*|The ISA declaration in HTML format.|string|
|**version**  <br>*optional*|The version of the ISA declaration.|string|


<a name="interaccounttransfer"></a>
### Inter Account Transfer

|Name|Schema|
|---|---|
|**amount**  <br>*optional*|[MonetaryAmount](#monetaryamount)|
|**toAccount**  <br>*optional*|enum (GOJI_INVESTMENT, ISA)|


<a name="investment"></a>
### Investment

|Name|Description|Schema|
|---|---|---|
|**amountInvested**  <br>*optional*|The amount invested.|[MonetaryAmount](#monetaryamount)|
|**endDate**  <br>*optional*|The end date of the investment.|string (date)|
|**gainToDate**  <br>*optional*|The gain to date. Can be negative if the investment has decreased in value.|[MonetaryAmount](#monetaryamount)|
|**gainToDateAsPercentage**  <br>*optional*|The gain to date as a percentage.|number|
|**id**  <br>*optional*|A unique ID for the investment.|string (uuid)|
|**productTermId**  <br>*optional*|The product code for the investment.|string|
|**startDate**  <br>*optional*|The start date of the investment.|string (date)|
|**status**  <br>*optional*|The status of the investment.|string|


<a name="investmentdocument"></a>
### The documents related to a given product.

|Name|Description|Schema|
|---|---|---|
|**fileName**  <br>*required*|The name of the file.|string|
|**fileUrl**  <br>*required*|The url of the document.|string|
|**investmentDocumentType**  <br>*required*|The type of document|enum (INVESTMENT_BROCHURE, KEY_INFORMATION_DOCUMENT, INVESTMENT_MEMORANDUM, COMPLIANCE_NOTE)|


<a name="investmentproduct"></a>
### Product

|Name|Description|Schema|
|---|---|---|
|**availableTerms**  <br>*optional*|The available terms, in months.|< integer > array|
|**product**  <br>*optional*|The product code.|string|


<a name="investmentproductslist"></a>
### Investment Products

|Name|Schema|
|---|---|
|**availableProducts**  <br>*optional*|< [InvestmentProduct](#investmentproduct) > array|


<a name="investor"></a>
### Investor

|Name|Description|Schema|
|---|---|---|
|**accountTypes**  <br>*optional*|Investor's account types|enum (GOJI_INVESTMENT, ISA)|
|**address**  <br>*optional*||[Address](#address)|
|**clientId**  <br>*optional*|The ID of the investor assigned by the platform.|string|
|**contactDetails**  <br>*optional*||[ContactDetails](#contactdetails)|
|**corporateDetails**  <br>*optional*|only required for CORPORATE entityType.|[CorporateDetails](#corporatedetails)|
|**dateOfBirth**  <br>*optional*|The date of birth of the investor.|string (date)|
|**employmentDetails**  <br>*optional*||[EmploymentDetails](#employmentdetails)|
|**entityType**  <br>*optional*||enum (INDIVIDUAL, CORPORATE)|
|**firstName**  <br>*optional*|The first name of the investor.|string|
|**lastName**  <br>*optional*|The last name of the investor.|string|
|**nationalInsuranceNumber**  <br>*optional*|The national insurance number of the investor.|string|
|**title**  <br>*optional*|The title of the investor.|enum (MISS, MR, MRS, MS, DR)|


<a name="investorrepayment"></a>
### The repayment to be added to the investment for the investor.

|Name|Description|Schema|
|---|---|---|
|**capitalAmount**  <br>*required*|The capital amount being repaid. May be zero.|[MonetaryAmount](#monetaryamount)|
|**clientId**  <br>*required*|The ID of the client|string|
|**interestAmount**  <br>*required*|The interest amount being repaid. May be zero.|[MonetaryAmount](#monetaryamount)|


<a name="kycdocuments"></a>
### KYC Documents

|Name|Description|Schema|
|---|---|---|
|**documents**  <br>*required*|The documents.|< [DocumentUpload](#documentupload) > array|


<a name="kycstatus"></a>
### KYC Status

|Name|Description|Schema|
|---|---|---|
|**status**  <br>*optional*|The KYC status of the investor|enum (IN_PROGRESS, DOCUMENTS_REQUIRED, VERIFIED)|


<a name="listinvestments"></a>
### Investments

|Name|Description|Schema|
|---|---|---|
|**investments**  <br>*optional*|The investments.|< [Investment](#investment) > array|


<a name="listregisteredproducts"></a>
### List of registered products

|Name|Schema|
|---|---|
|**products**  <br>*optional*|< [RegisteredProduct](#registeredproduct) > array|


<a name="maturity"></a>
### Maturity Details

|Name|Description|Schema|
|---|---|---|
|**date**  <br>*optional*|The maturity date if type FIXED|string (date)|
|**maturityType**  <br>*optional*|The type of bond maturity|enum (FIXED, DURATION)|
|**months**  <br>*optional*|The number of months until maturity if type DURATION|integer|


<a name="migrationdetails"></a>
### Optional details to migrate an existing investor.

|Name|Description|Schema|
|---|---|---|
|**existingClientId**  <br>*optional*|The existing client ID for the investor to be migrated|string|


<a name="monetaryamount"></a>
### Monetary Amount

|Name|Description|Schema|
|---|---|---|
|**amount**  <br>*required*|The amount.|number|
|**currency**  <br>*required*|The ISO 4217 three character codes eg 'GBP'|string|


<a name="paymentdestination"></a>
### The payment destination.

|Name|Description|Schema|
|---|---|---|
|**accountName**  <br>*optional*|The bank account name.|string|
|**accountNumber**  <br>*required*|The bank account number.|string|
|**reference**  <br>*required*|The reference to be used when transferring funds.|string|
|**sortCode**  <br>*required*|The bank account sort code.|string|


<a name="paymentdestinationitem"></a>
### The payment destination.

|Name|Description|Schema|
|---|---|---|
|**accountNumber**  <br>*optional*|The bank account number.|string|
|**id**  <br>*optional*|The id of the payment destination|string|
|**reference**  <br>*optional*|The reference to be used when transferring funds.|string|
|**sortCode**  <br>*optional*|The bank account sort code.|string|


<a name="paymentdestinationresponse"></a>
### The id of the payment destination.

|Name|Description|Schema|
|---|---|---|
|**id**  <br>*optional*|The unique id of the payment destination|string|


<a name="paymentdestinations"></a>
### The list of the payment destinations.

|Name|Description|Schema|
|---|---|---|
|**paymentDestinations**  <br>*optional*|The payment destinations|< [PaymentDestinationItem](#paymentdestinationitem) > array|


<a name="product"></a>
### Create Product.

|Name|Description|Schema|
|---|---|---|
|**name**  <br>*required*|The name of the product.|string|
|**terms**  <br>*required*|The product terms.|< [ProductTerm](#productterm) > array|


<a name="productresponse"></a>
### The ids related to a given product.

|Name|Description|Schema|
|---|---|---|
|**id**  <br>*optional*|The unique id of the product|string|


<a name="productterm"></a>
### The product terms used to configure the product.

|Name|Description|Schema|
|---|---|---|
|**fixedLiveDate**  <br>*optional*|A fixed date in the future when the product goes live. If this is not set, and the maximum funding limit is not specified, the bond will run according to the schedule you agree with Goji.|string (date)|
|**fixedMaturityDate**  <br>*optional*|A fixed date at which point the product matures. <b>Note: fixedMaturityDate or term must be specified</b>|string (date)|
|**interestRate**  <br>*required*|The interest rate of the product.|number|
|**interestType**  <br>*required*|The type of interest to be returned.|enum (FIXED, TARGET)|
|**investmentDocuments**  <br>*required*|The investment documents relating to the product.|< [InvestmentDocument](#investmentdocument) > array|
|**maximumFundingLimit**  <br>*optional*|The maximum amount allowed for the product before it goes live. <b>Note: The bond will NOT run until this limit is reached. ie. this is both a maximum limt and also the amount that must be filled for the bond to run.</>|[MonetaryAmount](#monetaryamount)|
|**minimumInvestment**  <br>*required*|The minimum individual investment allowed for the product.|[MonetaryAmount](#monetaryamount)|
|**repaymentProfiles**  <br>*required*|The investment documents relating to the product.|< enum (STANDARD_ANNUALLY_REINVESTMENT, STANDARD_ON_MATURITY, STANDARD_QUARTERLY_BLENDED, STANDARD_QUARTERLY_PAYOUT, STANDARD_QUARTERLY_PAYOUT_OFFSET_BY_1MTH, STANDARD_QUARTERLY_REINVESTMENT, STANDARD_SIX_MTH_PAYOUT, STANDARD_SIX_MTH_PAYOUT_OFFSET_BY_3MTH, STANDARD_SIX_MTH_REINVESTMENT) > array|
|**term**  <br>*optional*|The term length of the product in months. <b>Note: term or fixedMaturityDate must be specified</b>|integer|


<a name="registeredproduct"></a>
### Registered product

|Name|Description|Schema|
|---|---|---|
|**id**  <br>*required*|The unique ID of the product|string|
|**investmentDocument**  <br>*required*|A URL to a KID, investment memorandum or similar. This is used to track investments and their ISA suitability.|string|
|**isaEligible**  <br>*required*|True if the investment can be included in an IF ISA.|boolean|


<a name="registeredproductupdate"></a>
### Registered product

|Name|Description|Schema|
|---|---|---|
|**investmentDocument**  <br>*required*|A URL to a KID, investment memorandum or similar. This is used to track investments and their ISA suitability.|string|
|**isaEligible**  <br>*required*|True if the investment can be included in an IF ISA.|boolean|


<a name="repaymentreference"></a>
### The repayment reference.

|Name|Description|Schema|
|---|---|---|
|**accountNumber**  <br>*optional*|The account number for the repayment deposit.|string|
|**reference**  <br>*optional*|The bank reference to be used when depositing the repayment.|string|
|**sortCode**  <br>*optional*|The sort code for the repayment deposit.|string|


<a name="repaymentsaccrual"></a>
### The details for configuring the repayment accruals.

|Name|Description|Schema|
|---|---|---|
|**accrualDate**  <br>*optional*|The date up to which accruals will be generated|string (date)|


<a name="settlesecondarymarkettrade"></a>
### Record the settlement of a secondary market trade.

|Name|Description|Schema|
|---|---|---|
|**buySide**  <br>*required*|Details of the buy side.|[SettleSecondaryMarketTradeBuySide](#settlesecondarymarkettradebuyside)|
|**sellSide**  <br>*required*|Details of the sell side.|[SettleSecondaryMarketTradeSellSide](#settlesecondarymarkettradesellside)|


<a name="settlesecondarymarkettradebuyside"></a>
### Details of the secondary market buy side

|Name|Description|Schema|
|---|---|---|
|**accountType**  <br>*required*|The account purchasing the investment|enum (GOJI_INVESTMENT, ISA, SIPP)|
|**bankAccountId**  <br>*optional*|The ID of the bank account details to send fees to|string|
|**clientId**  <br>*required*|The client ID of the buyer|string|
|**fee**  <br>*optional*|The fee being paid by the buyer. In addition to the totalPurchaseAmount.|[MonetaryAmount](#monetaryamount)|
|**feePaymentDestination (Deprecated)**  <br>*optional*|The ID of the payment destination to send fees to. This has been deprecated, please use the bankAccountId field|string|
|**newInvestmentId**  <br>*required*|The ID for the investment being held by the buy side investor|string|
|**reference**  <br>*required*|The bank reference for the funds transfer|string|
|**totalPurchaseAmount**  <br>*required*|The total amount being paid for the investment. This must equal the sum of the remainingCapitalAmount plus premium on the sell side.|[MonetaryAmount](#monetaryamount)|


<a name="settlesecondarymarkettradesellside"></a>
### Details of the secondary market sell side

|Name|Description|Schema|
|---|---|---|
|**bankAccountId**  <br>*optional*|The ID of the bank account details to send fees to|string|
|**clientId**  <br>*required*|The client ID of the seller|string|
|**fee**  <br>*optional*|The fee being paid by the seller. Deducted from the total sales price.|[MonetaryAmount](#monetaryamount)|
|**feePaymentDestination (Deprecated)**  <br>*optional*|The ID of the payment destination to send fees to. This has been deprecated, please use the bankAccountId field|string|
|**investmentId**  <br>*required*|The ID of the investment being sold|string|
|**premium**  <br>*optional*|The premium (positive or negative) added to the remaining capital amount to get the total sales price.|[MonetaryAmount](#monetaryamount)|
|**reference**  <br>*required*|The bank reference for the funds transfer|string|
|**remainingCapitalAmount**  <br>*required*|The remaining capital amount of the investment being sold.|[MonetaryAmount](#monetaryamount)|


<a name="terms"></a>
### Terms and Conditions

|Name|Description|Schema|
|---|---|---|
|**termsAndConditions**  <br>*optional*|The terms and conditions in HTML format.|string|
|**version**  <br>*optional*|The version of the terms and conditions.|string|


<a name="testdeposit"></a>
### A test deposit

|Name|Description|Schema|
|---|---|---|
|**amount**  <br>*required*|The amount to deposit.|[MonetaryAmount](#monetaryamount)|
|**clientId**  <br>*required*|The client ID|string|
|**paymentReference**  <br>*required*|The reference. Set to ISA if the funds should be credited to the ISA account.|string|
|**paymentType**  <br>*required*|Should be set to DEPOSIT|string|


<a name="testinvestmentcycle"></a>
### The details for configuring the investment cycle run.

|Name|Description|Schema|
|---|---|---|
|**minimumRequiredForNewBond**  <br>*optional*|The minimum amount required for the new bond.|[MonetaryAmount](#monetaryamount)|


<a name="transferinui"></a>
### Transfer In UI

|Name|Schema|
|---|---|
|**apiUrl**  <br>*optional*|string|
|**scriptSrc**  <br>*optional*|string|
|**styleSrc**  <br>*optional*|string|
|**token**  <br>*optional*|string|


<a name="updateinvestor"></a>
### Update Investor

|Name|Description|Schema|
|---|---|---|
|**address**  <br>*required*||[Address](#address)|
|**contactDetails**  <br>*required*||[ContactDetails](#contactdetails)|
|**corporateDetails**  <br>*optional*|only required for CORPORATE entityType.|[CorporateDetails](#corporatedetails)|
|**dateOfBirth**  <br>*required*|The date of birth of the investor.|string (date)|
|**employmentDetails**  <br>*optional*||[EmploymentDetails](#employmentdetails)|
|**entityType**  <br>*optional*||enum (INDIVIDUAL, CORPORATE)|
|**firstName**  <br>*required*|The first name of the investor.|string|
|**investorDeclarationType**  <br>*optional*|must be SOPHISTICATED for an investor with entityType CORPORATE|enum (RESTRICTED, HIGH_NET_WORTH, INVESTMENT_PROFESSIONAL, SOPHISTICATED)|
|**lastName**  <br>*required*|The last name of the investor.|string|
|**nationalInsuranceNumber**  <br>*optional*|The national insurance number of the investor. Only required if opening an ISA.|string|
|**title**  <br>*required*|The title of the investor.|enum (MISS, MR, MRS, MS, DR)|


<a name="webhook"></a>
### The url for configuring the webhook.

|Name|Description|Schema|
|---|---|---|
|**url**  <br>*optional*|The url to dispatch the webhook to.|string|


<a name="withdrawal"></a>
### The amount to withdraw.

|Name|Description|Schema|
|---|---|---|
|**amount**  <br>*optional*|The amount of the residual income payment|[MonetaryAmount](#monetaryamount)|
|**reference**  <br>*optional*|An optional reference to be used when withdrawing funds.|string|


