---
title: TransferWise Payouts API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

search: true

includes:
  - recipients

---
# Payouts API
## Before you start coding

### 1. Learn about TransferWise borderless account. 
Borderless account features and pricing are best explained below.

[https://transferwise.com/gb/borderless/pricing](https://transferwise.com/gb/borderless/pricing)


### 2. Signup for TransferWise borderless account
Get hands-on experience before you start with API integration as it will help you understand how our payment flow works. 
Just follow these three simple steps. 

* Sign up for TransferWise borderless account. [https://transferwise.com/gb/borderless](https://transferwise.com/gb/borderless)

* Make a transfer — check [our video guide](https://transferwise.com/help/article/1779442/creating-a-transfer/video-guide-make-a-transfer) for a step-by-step guide.

* Verify that our coverage includes your currency route(s).


### 3. Choose the best tool for you

There are two ways you can execute large number of payouts:

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
sourceAmount          | Amount in source currency.                    | Decimal
targetAmount          | Amount in target currency                     | Decimal
type                  | 'BALANCE_PAYOUT' for payments <br/> 'BALANCE_CONVERSION' for conversion between balances | Text
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
    "currency": "GBP"
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
id                    | Recipient id                                  | Integer
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




You can check transfer latest status by polling this endpoint. We are building webhook notification support to notify about status changes, but unfortunately this is not available yet.


### State flow of transfers:

**Incoming Payment Waiting ⇒ Processing ⇒ Funds Converted ⇒ Outgoing Payment Sent**

Outgoing Payment Sent is the final state of happy flow. Should the payment fail then the problematic flow continues. For example, if recipient bank account does not exist and payment is returned.

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






## Download account statement





## Go Live



