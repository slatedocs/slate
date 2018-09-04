# Borderless Payouts Guide
Welcome to TransferWise Payouts API documentation. 
Before you jump into coding please take few moments to go through these 3 topics at first.

## Getting started
### 1. Learn about TransferWise borderless account. 
Borderless account features and pricing are best explained below.

[https://transferwise.com/gb/borderless/pricing](https://transferwise.com/gb/borderless/pricing)


### 2. Signup for TransferWise borderless account
Get hands-on experience as it will help you understand how our payment flow works. 
Just follow these three simple steps. 

* Sign up for TransferWise borderless account. [https://transferwise.com/gb/borderless](https://transferwise.com/gb/borderless)

* Make a transfer — check [our video guide](https://transferwise.com/help/article/1779442/creating-a-transfer/video-guide-make-a-transfer) for a step-by-step guide.

* Verify that our coverage includes your currency route(s).


### 3. Choose the best tool for you

There are two ways you can make large number of payouts:

* *Batch payments.* Prepare CSV file and upload this using our Batch Payments tool: [https://transferwise.com/batch](https://transferwise.com/batch)

* *API integration.* Automate your payment process fully by sending payment orders via TransferWise API. 



## API access
```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/profiles \
     -H "Authorization: Bearer <your api token>"
```

### Authentication
Signup for developer account to get API token for sandbox. [https://sandbox.transferwise.tech/register](https://sandbox.transferwise.tech/register)

Your developer account will have some test money so you can start making payments in same way as in LIVE environment.  You will find your API tokens in the Settings page. 

Add your API token as header parameter to every request like this:

*Authorization: Bearer xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx*

### TEST and LIVE environments

* Sandbox API is located at https://api.sandbox.transferwise.tech
* LIVE API is located at https://api.transferwise.com


## Get your profile id


> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/profiles \
     -H "Authorization: Bearer <your api token>"
```

> Example Response:

```json

[
  {
    "id": 217896,
    "type": "personal",
    "details": {
      "firstName": "Oliver",
      "lastName": "Wilson",
      "dateOfBirth": "1977-07-01",
      "phoneNumber": "+3725064992",
      "avatar": "https://lh6.googleusercontent.com/-XzeFZ2PJE1A/AAAAAAAI/AAAAAAAAAAA/RvuvhXFsqs0/photo.jpg",
      "occupation": null,
      "primaryAddress": 236532
    }
  },
  {
    "id": 220192,
    "type": "business",
    "details": {
      "name": "ABC Logistics Ltd",
      "registrationNumber": "12144939",
      "acn": null,
      "abn": null,
      "arbn": null,
      "companyType": "LIMITED",
      "companyRole": "OWNER",
      "descriptionOfBusiness": "Information and communication",
      "primaryAddress": 240402,
      "webpage": "https://abc-logistics.com"
    }
  }
]


```

You only need to call this endpoint once to obtain your user profile id.
Your personal and business profiles have different IDs.  Profile id values are required when making payouts. 

### Request

**`GET https://api.sandbox.transferwise.tech/v1/profiles`**

### Response



Personal Profile Fields

Field                   | Description | Format
---------               | -------               | -----------
id                      | Personal profile id   | Integer
type                    | Profile type          | Text
details.firstName       | Person first name     | Text
details.lastName        | Person last name      | Text
details.dateOfBirth     | Date of birth         | "yyyy-mm-dd"
details.phoneNumber     | Phone number          | Text
details.avatar          | Link to avatar image  | Text
details.occupation      | Occupation            | Text
details.primaryAddress  | Address object id     | Integer


Business Profile Fields

Field | Description | Format
--------- | ------- | -----------
id                              | Business profile id                             | Integer
type                            | Profile type                                    | Text
details.name                    | Business name                                   | Text
details.registrationNumber      | Business registration number                    | Text
details.acn                     | ACN (only applicable for Australian business)   | Text
details.abn                     | ABN (only applicable for Australian business)   | Text
details.arbn                    | ARBN (only applicable for Australian business)  | Text
details.companyType             | Company legal type                              | Text
details.companyRole             | Person's role in the company                    | Text
details.descriptionOfBusiness   |  Business description                           | Text
details.primaryAddress          |  Address object id                              | Integer
details.webpage                 |  Webpage URL                                    | Text




## Create quote


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
    "id": 10451930,
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

There are four steps to execute payouts: 

**Step 1: Create a quote**

Step 2: Create a recipient account

Step 3: Create a transfer

Step 4: Fund a transfer

<br/>
Quote fetches current mid-market exchange rate that will be used for your transfer. Quote also calculates our fee and estimated delivery time. 


### Request

**`POST https://api.sandbox.transferwise.tech/v1/quotes`**

Field                 | Description                                   | Format
---------             | -------                                       | -----------
profile               | Personal or business profile id               | Text
source                | Source(send) currency code                          | Text
target                | Target(receive) currency code                          | Text
rateType              | Always use constant 'FIXED'                   | Text
targetAmount          | Amount in target currency                     | Decimal
sourceAmount          | Amount in source currency. <br/>Either sourceAmount or targetAmount is required, never both.   | Decimal
type                  | 'BALANCE_PAYOUT' for payments <br/> 'BALANCE_CONVERSION' for conversion between balances | Text


### Response

Quote id is needed for creating transfers in step 3.

Field                 | Description                                   | Format
---------             | -------                                       | -----------
id                    | Quote id                                      | Integer
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



## Create recipient account

> Example Request (Create GBP recipient):

```shell

curl -X POST https://api.sandbox.transferwise.tech/v1/accounts \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "currency": "GBP", 
          "type": "sort_code", 
          "profile": <your profile id>, 
          "accountHolderName": "Ann Johnson",
          "legalType": "PRIVATE",
           "details": { 
              "sortCode": "231470", 
              "accountNumber": "28821822" 
           } 
         }'

```

> Example Response (Create GBP recipient):

```json
{
    "id": 31273058,
    "profile": <your profile id>, 
    "accountHolderName": "Ann Johnson",
    "type": "sort_code", 
    "country": "GB", 
    "currency": "GBP",
    "details": {
        "accountNumber": "28821822",
        "sortCode": "231470"
    }
}

```

There are four steps to execute payouts: 

Step 1: Create a quote

**Step 2: Create a recipient account**

Step 3: Create a transfer

Step 4: Fund a transfer

<br/>
Recipient is a person or institution  who is the ultimate beneficiary of your payment. 

Recipient bank account details are different for different currencies. For example you only need to know IBAN number to send payments to most European and Nordic countries. 
But in order to send money to Canada you would need to know four fields: Institution No, Transit no, Account No & Account Type.

GBP example is provided here. You can find other currency examples in Recipient API section below.  


### Request

**`POST https://api.sandbox.transferwise.tech/v1/accounts`**

Field                 | Description                                   | Format
---------             | -------                                       | -----------
currency              | 3 character currency code                     | Text
type                  | Recipient type                                | Text
profile               | Personal or business profile id               | Integer
accountHolderName     | Recipient full name                           | Text
legalType             | Recipient legal type: PRIVATE or BUSINESS     | Text
details               | Currency specific group, see Recipients API   | 
details.sortCode      | Recipient bank sort code (GBP example)        | Text
details.accountNumber | Recipient bank account no (GBP example)       | Text


### Response

Recipient id is needed for creating transfers in step 3.

Field                 | Description                                   | Format
---------             | -------                                       | -----------
id                    | recipientAccountId                            | Integer
profile               | Personal or business profile id               | Integer
acccountHolderName    | Recipient full name                           | Text
currency              | 2 character country code                      | Text
country               | 3 character currency code                     | Text
type                  | Recipient type                                | Text
details               | Currency specific group, see Recipients API   | 
details.sortCode      | Recipient bank sort code (GBP example)        | Text
details.accountNumber | Recipient bank account no (GBP example)       | Text


### Send money to email recipient

If you don't know recipient bank account details you can set up **email recipient** so that TransferWise can collect bank details directly from the recipient. 

TransferWise will then email your recipient with a link to collect their bank account details. 
Once recipient provides bank account details to us we are able to complete your transfer.

So all you need to know is recipient name and email to send payment.
See below under Recipient API how to create email recipients.


## Create transfer

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

There are four steps to execute payouts: 

Step 1: Create a quote

Step 2: Create a recipient account

**Step 3: Create a transfer**

Step 4: Fund a transfer

<br/>
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



## Fund transfer

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

There are four steps to execute payouts: 

Step 1: Create a quote

Step 2: Create a recipient account

Step 3: Create a transfer

**Step 4: Fund a transfer**

<br/>
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




## Get transfer delivery time 

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

Get the live delivery estimate for a transfer by the transfer ID. 
The delivery estimate is the time at which we currently expect the transfer to arrive in the benificiary's bank account. 
This is not a guaranteed time but we are working hard to make these estimates as accurate as possible.


### Request

**`GET https://api.sandbox.transferwise.tech/v1/delivery-estimates/{transferId}`**


### Response

You need to save transfer id for tracking its status later.

Field                     | Description             | Format
---------                 | -------                 | -----------
estimatedDeliveryDate     | Estimated time when funds will arrive to recipient's bank account  | Timestamp

## Track transfer status

> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/transfers/{transferId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
    "id": 468956,
    "user": <your user id>,
    "targetAccount": <recipient account id>,
    "sourceAccount": null,
    "quote": <quote id>,
    "status": "outgoing_payment_sent",
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




You can check transfer latest status by polling this endpoint. We are building webhook notification support to notify about status changes, but unfortunately this is not available yet. Normal state flow of transfers: 

**Incoming Payment Waiting ⇒ Processing ⇒ Funds Converted ⇒ Outgoing Payment Sent**

Outgoing Payment Sent is the final state of normal flow. Should the payment fail then the problematic flow continues. For example, if recipient bank account does not exist and payment is returned. Problematic state flow of transfers: 

**Outgoing Payment Sent ⇒ Bounced Back ⇒ Funds Refunded**

Most bounce backs occur within 2-3 business days. However, to be on safe side, we advise to check transfer status for potential bounce backs for 2 weeks.


<br/>

Full list of transfer statuses in the order of their occurence is given below:

* **incoming_payment_waiting** — You have submitted transfer and transfer is waiting for funding.

* **waiting_recipient_input_to_proceed** — This status is only used for “send money to email” transfers, when we are waiting for your recipient to fill in their bank details so we can continue processing your transfer.

* **processing** — Your funds have been received and your transfer is being processed by TransferWise. Processing is a generic term that includes our behind-the-scene activities like AML, compliance and fraud checks.

* **funds_converted** — All compliance checks have been completed with your transfer and funds have been converted from source currency to target currency.

* **outgoing_payment_sent** — TransferWise has paid out funds to your recipient. This is final state of transfer, assuming funds are not returned. When a transfer has this state it does not immediately mean your recipient already has funds available in their bank account. 
Payment systems in different countries operate in different speeds and frequency. For example, in UK the payment will reach your recipient bank account within few minutes after we have sent the outgoing payment. However, in Eurozone and US, it usually takes one day until funds are available.

* **cancelled** — This status is used when transfer you created was not funded and therefore never processed. Final state of transfer.

* **funds_refunded** — Transfer has been refunded. Final state of transfer.

* **bounced_back** — Transfer has bounced back but has not been cancelled nor refunded yet.


## Check account balance

> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/borderless-accounts?profileId={profileId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
    {
        "id": 64,
        "profileId": <your profile id>,
        "recipientId": 13828530,
        "creationTime": "2018-03-14T12:31:15.678Z",
        "modificationTime": "2018-03-19T15:19:42.111Z",
        "active": true,
        "eligible": true,
        "balances": [
            {
                "balanceType": "AVAILABLE",
                "currency": "GBP",
                "amount": {
                    "value": 10999859,
                    "currency": "GBP"
                },
                "reservedAmount": {
                    "value": 0,
                    "currency": "GBP"
                },
                "bankDetails": null
            },
            {
                "balanceType": "AVAILABLE",
                "currency": "EUR",
                "amount": {
                    "value": 9945236.2,
                    "currency": "EUR"
                },
                "reservedAmount": {
                    "value": 0,
                    "currency": "EUR"
                },
                "bankDetails": null
            }
        ]
    }
]
```



Get available balances for all activated currencies in your borderless account.

### Request

**`GET https://api.sandbox.transferwise.tech/v1/borderless-accounts?profileId={profileId}`**

Use profile id obtained earlier to make this call. 



### Response

Field                             | Description                                   | Format
---------                         | -------                                       | -----------
id                                | borderlessAccountId                         | Integer
profileId                         | Personal or business profile id               | Integer
recipientId                       | Recipient id you can use for borderless topup payment order  | Integer
creationTime                      | Date when balance account was opened                     | Timestamp
modificationTime                  | Date when balance account setup was modified.            | Timestamp
active                            | Is borderless account active or inactive       | Boolean
eligible                          | Ignore                                         | Boolean
balances[n].balanceType              | AVAILABLE                                     | Text
balances[n].currency                 | Currency code      | Text
balances[n].amount.value             | Available balance in specified currency       | Decimal
balances[n].amount.currency          | Currency code       | Text
balances[n].reservedAmount.value     | Reserved amount from your balance | Decimal
balances[n].reservedAmount.currency  | Reserved amount currency code       | Text
balances[n].bankDetails              | Your borderless account bank details       | Group


## Get account statement

> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/borderless-accounts/{borderlessAccountId}/statement.json?
currency=EUR&intervalStart=2018-03-01T00:00:00.000Z&intervalEnd=2018-03-15T23:59:59.999Z \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
  "accountHolder": {
    "type": "PERSONAL",
    "address": {
      "addressFirstLine": "Veerenni 24",
      "city": "Tallinn",
      "postCode": "12112",
      "stateCode": "",
      "countryName": "Estonia"
    },
    "firstName": "Oliver",
    "lastName": "Wilson"
  },
  "issuer": {
    "name": "TransferWise Ltd.",
    "firstLine": "56 Shoreditch High Street",
    "city": "London",
    "postCode": "E1 6JJ",
    "stateCode": "",
    "country": "United Kingdom"
  },
  "bankDetails": null,
  "transactions": [
    {
      "type": "DEBIT",
      "date": "2018-04-30T08:47:05.832Z",
      "amount": {
        "value": -7.76,
        "currency": "EUR"
      },
      "totalFees": {
        "value": 0.04,
        "currency": "EUR"
      },
      "details": {
        "type": "CARD",
        "description": "Card transaction of 6.80 GBP issued by Tfl.gov.uk/cp TFL TRAVEL CH",
        "amount": {
          "value": 6.8,
          "currency": "GBP"
        },
        "category": "Transportation Suburban and Loca",
        "merchant": {
          "name": "Tfl.gov.uk/cp",
          "firstLine": null,
          "postCode": "SW1H 0TL  ",
          "city": "TFL TRAVEL CH",
          "state": "   ",
          "country": "GB",
          "category": "Transportation Suburban and Loca"
        }
      },
      "exchangeDetails": {
        "forAmount": {
          "value": 6.8,
          "currency": "GBP"
        },
        "rate": null
      },
      "runningBalance": {
        "value": 16.01,
        "currency": "EUR"
      },
      "referenceNumber": "CARD-249281"
    },
    {
      "type": "CREDIT",
      "date": "2018-04-17T07:47:00.227Z",
      "amount": {
        "value": 200,
        "currency": "EUR"
      },
      "totalFees": {
        "value": 0,
        "currency": "EUR"
      },
      "details": {
        "type": "DEPOSIT",
        "description": "Received money from HEIN LAURI with reference SVWZ+topup card",
        "senderName": "HEIN LAURI",
        "senderAccount": "EE76 1700 0170 0049 6704 ",
        "paymentReference": "SVWZ+topup card"
      },
      "exchangeDetails": null,
      "runningBalance": {
        "value": 207.69,
        "currency": "EUR"
      },
      "referenceNumber": "TRANSFER-34188888"
    },
    {
      "type": "CREDIT",
      "date": "2018-04-10T05:58:34.681Z",
      "amount": {
        "value": 9.94,
        "currency": "EUR"
      },
      "totalFees": {
        "value": 0,
        "currency": "EUR"
      },
      "details": {
        "type": "CONVERSION",
        "description": "Converted 8.69 GBP to 9.94 EUR",
        "sourceAmount": {
          "value": 8.69,
          "currency": "GBP"
        },
        "targetAmount": {
          "value": 9.94,
          "currency": "EUR"
        },
        "fee": {
          "value": 0.03,
          "currency": "GBP"
        },
        "rate": 1.147806
      },
      "exchangeDetails": null,
      "runningBalance": {
        "value": 9.94,
        "currency": "EUR"
      },
      "referenceNumber": "CONVERSION-1511237"
    }
  ],
  "endOfStatementBalance": {
    "value": 9.94,
    "currency": "EUR"
  },
  "query": {
    "intervalStart": "2018-03-01T00:00:00Z",
    "intervalEnd": "2018-04-30T23:59:59.999Z",
    "currency": "EUR",
    "accountId": 64
  }
}
```

Get borderless account statement for one currency and for specified time range. 
The period between intervalStart and intervalEnd cannot exceed 3 months.

### Request

**`GET https://api.sandbox.transferwise.tech/v1/borderless-accounts/{borderlessAccountId}/statement.json?`**

**`currency=EUR&intervalStart=2018-03-01T00:00:00.000Z&intervalEnd=2018-03-15T23:59:59.999Z`**

All query parameters are mandatory.

Field                             | Description                                   | Format
---------                         | -------                                       | -----------
borderlessAccountId                   | Your borderlessAccountId is included in "Check account balance" response as field "id".                        | Integer
currency                              | Currency code              | Text
intervalStart                         | Statement start time in UTC time             | Zulu time. Don't forget the 'Z' at the end. 
intervalEnd                           | Statement start time in UTC time             | Zulu time. Don't forget the 'Z' at the end. 

Note that you can also download statements in PDF and CSV formats if you replace statement.json with statement.csv or statement.pdf respectively in the above URL.

### Response

Field                             | Description                                   | Format
---------                         | -------                                       | -----------
accountHolder.type                      | Account holder type: PERSONAL or BUSINESS                        | Text
accountHolder.address.addressFirstLine  | Account holder address street          | Text
accountHolder.address.city              | Account holder address city          | Text
accountHolder.address.postCode          | Account holder address zipc ode | Text
accountHolder.address.stateCode         | Account holder address state | Text
accountHolder.address.countryName       | Account holder address country | Text
accountHolder.firstName                 | Account holder first name | Text
accountHolder.lastName                  | Account holder last name | Text
issuer.name                             | Account issuer name | Text
issuer.firstLine                        | Account issuer address street | Text
issuer.city                             | Account issuer address city | Text
issuer.postCode                         | Account issuer address zip code | Text
issuer.stateCode                        | Account issuer address state | Text
issuer.country                          | Account issuer address country | Text
bankDetails              | Your borderless account bank details       | Group
transactions[n].type                 | DEBIT or CREDIT              | Text
transactions[n].date                 | Time of transaction           | Zulu time
transactions[n].amount.value                 | Transaction amount           | Decimal
transactions[n].amount.currency                 | Transaction currency code             | Text
transactions[n].totalFees.value                 | Transaction fee amount           | Decimal
transactions[n].totalFees.currency                 | Transaction fee currency code             | Text
transactions[n].details.type                 | CARD, CONVERSION, DEPOSIT, TRANSFER, MONEY_ADDED              | Text
transactions[n].details.description                 | Human readable explanation about the transaction           | Text
transactions[n].details.amount.value                 | Amount in original currency (card transactions abroad)              | Decimal
transactions[n].details.amount.currency                 | Original currency code              | Text
transactions[n].details.sourceAmount.value                 | Amount in source currency (conversions)              | Decimal
transactions[n].details.sourceAmount.currency                 | Source currency code              | Text
transactions[n].details.targetAmount.value                 | Amount in target currency (conversions)              | Decimal
transactions[n].details.targetAmount.currency                 | Target currency code              | Text
transactions[n].details.fee.value                 | Conversion fee amount             | Decimal
transactions[n].details.fee.currency                 | Conversion fee currency code              | Text
transactions[n].details.rate                 | Conversion exchange rate            | Decimal
transactions[n].details.senderName                 | Deposit sender name                | Text
transactions[n].details.senderAccount              | Deposit sender bank account details                  | Text
transactions[n].details.paymentReference                 | Deposit payment reference text                  | Text
transactions[n].details.category             |  Card transaction category                 | Text
transactions[n].details.merchant.name             |  Card transaction merchant name                 | Text
transactions[n].details.merchant.firstLine             |  Merchant address street          | Text
transactions[n].details.merchant.postCode             |  Merchant address zipcode                 | Text
transactions[n].details.merchant.city             | Merchant address city                 | Text
transactions[n].details.merchant.state             | Merchant address state              | Text
transactions[n].details.merchant.country            | Merchant address country                 | Text
transactions[n].details.merchant.category             |  Merchant category                 | Text
transactions[n].exchangeDetails.forAmount.value             |  Currency exchange amount                | Decimal
transactions[n].exchangeDetails.forAmount.currency             |  Currency code                 | Text
transactions[n].exchangeDetails.rate             | Exchange rate                 | Decimal
transactions[n].runningBalance.value             | Running balance after the transaction   | Decimal
transactions[n].runningBalance.currency             |  Running balance currency code                | Text
transactions[n].referenceNumber            |TransferWise assigned unique transaction reference number | Text
endOfStatementBalance.value                | Closing balance for specified time period   | Decimal
endOfStatementBalance.currency             | Closing balance currency code | Text
query.intervalStart                | Query parameter repeated             | Zulu time
query.intervalEnd                | Query parameter repeated                 | Zulu time
query.currency                | Query parameter repeated          | Text
query.accountId                | Query parameter repeated         | Integer

## Going Live checklist



### 1. Make your integration bulletproof
  * Implement basic retry mechanism to handle potential failures or network interruptions 
  * Implement duplicate prevention mechanism to avoid duplicate payments. Verify that UUID is uniquely generated for each individual payment and its value is kept same in case of retrying.
  * Implement basic logging to help out in debugging and problem solving, if needed.
  * Check that your  can handle all possible transfer states during polling of transfer info.
  * Automatically check available balance before submitting requests to fund your transfers. This avoids rejections due to insufficient balance.
  * Verify that your borderless account statement provides you all information you need for financial accounting.


### 2. Open LIVE account
  * Sign up for Transferwise borderless account and go through on-boarding flow including 2FA setup.

### 3. Setup Security for LIVE environment
  * Obtain your live API token from Settings page. 
  * Store your live API token securely in your production servers so that only authorized persons have access to it. 
  
### 4. Do penny testing in LIVE
  * Make a small deposit to your borderless account. 
  * Make few small value test payments via LIVE API before you start executing large number of transfers.
  * All set. Switch it on.
