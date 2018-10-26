# Transfers

## Create

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
              "reference" : "to my friend",
              "transferPurpose": "verification.transfers.purpose.pay.bills",
              "sourceOfFunds": "verification.source.of.funds.other"
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

Transfer is a payout order to recipient account based on a quote. Once created then a transfer needs to be funded during next 5 working days. 
In case not it will get automatically cancelled.  


### Request

**`POST https://api.sandbox.transferwise.tech/v1/transfers`**

Field                          | Description                                   | Format
---------                      | -------                                       | -----------
targetAccount                  | Recipient account id. You can create multiple transfers to same recipient account.   | Integer
quote                          | Quote id. You can only create one transfer per one quote. <br/>You cannot use same quote ID to create multiple transfers. | Integer
customerTransactionId     | This is required to perform idempotency check to avoid duplicate transfers in case of network failures or timeouts.                          | UUID
details.reference (optional)    | Recipient will see this reference text in their bank statement. Maximum allowed characters depends on the currency route. [Business Payments Tips](https://transferwise.com/help/article/2348295/business/business-payment-tips) article has a full list. | Text
details.transferPurpose (conditionally required)| For example when target currency is THB. See more about conditions at [Transfers.Requirements](#transfers-requirements)  | Text
details.sourceOfFunds (conditionally required) | For example when target currency is USD and transfer amount exceeds 10k. See more about conditions at [Transfers.Requirements](#transfers-requirements) | Text

There are two options to deal with conditionally required fields: <br/>
<ul>
 <li>Always provide values for these fields</li>
 <li>Always call transfers-requirements endpoint and submit values only if indicated so.</li>
</ul>



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


## Fund

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




## Cancel


> Example Request:

```shell
curl -X PUT https://api.sandbox.transferwise.tech/v1/transfers/{transferId}/cancel \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
  "id": 16521632,
  "user": 4342275,
  "targetAccount": 8692237,
  "sourceAccount": null,
  "quote": 657171,
  "status": "cancelled",
  "reference": "reference text",
  "rate": 0.89,
  "created": "2017-11-24 10:47:49",
  "business": null,
  "transferRequest": null,
  "details": {
    "reference": "vambo 3"
  },
  "hasActiveIssues": false,
  "sourceCurrency": "EUR",
  "sourceValue": 0,
  "targetCurrency": "GBP",
  "targetValue": 150,
  "customerTransactionId": "54a6bc09-cef9-49a8-9041-f1f0c654cd88"
}
```

Only transfers which are not funded can be cancelled. Cancellation is final it can not be undone.  

### Request

**`PUT https://api.sandbox.transferwise.tech/v1/transfers/{transferId}/cancel`**

Use transfer id that you obtained when creating a transfer. 


## Get by Id

> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/transfers/{transferId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
  "id": 15574445,
  "user": 294205,
  "targetAccount": 7993919,
  "sourceAccount": null,
  "quote": 113379,
  "status": "incoming_payment_waiting",
  "reference": "good times",
  "rate": 1.2151,
  "created": "2017-03-14 15:25:51",
  "business": null,
  "transferRequest": null,
  "details": {
    "reference": "good times"
  },
  "hasActiveIssues": false,
  "sourceValue": 1000,
  "sourceCurrency": "EUR",
  "targetValue": 895.32,
  "targetCurrency": "GPB",
  "customerTransactionId": "6D9188CF-FA59-44C3-87A2-4506CE9C1EA3"
}
```

Get transfer info by id. Since we don't have push notifications yet, you can poll this endpoint to track your transfer status.
### Request
**`GET https://api.sandbox.transferwise.tech/v1/transfers/{transferId}`**







## Get Issues

> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/transfers/{transferId}/issues \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
  {
    "type": "Payment has bounced back",
    "state": "OPENED",
    "description": "Inorrect recipient account number"
  }
]
```

Get pending issues that are suspending a transfer from further processing. This is more applicable for Bank Integrations use case when transfers are NOT funded from borderless account but funding is sent via bank transfer.
For example "DEPOSIT_AMOUNT_LESS_INVOICE" means that arrived funding does not cover total transfer amount.

### Request

**`GET https://api.sandbox.transferwise.tech/v1/transfers/{transferId}/issues`**


### Response
Field                 | Description             | Format
---------             | -------                 | -----------
type                  | Issue type: <br/><ul><li>DEPOSIT_AMOUNT_LESS_INVOICE</li><li>DEPOSIT_AMOUNT_MORE_INVOICE</li><li>PROVE_ACCOUNT_OWNERSHIP_WITH_REFERENCE_CODE</li><li>PROVE_ACCOUNT_OWNERSHIP_WITH_MICRO_DEPOSIT</li><li>JOINT_ACCOUNT_PROOF_NEEDED</li><li>BUSINESS_ORDER_PERSONAL_DEPO</li><li>INCORRECT_NAME_DEPOSIT</li><li>DEPOSIT_PROOF_NEEDED</li><li>PERSONAL_ORDER_BUSINESS_DEPO</li><li>INCORRECT_DEPOSIT_RECIPIENT_DETAILS</li><li>INCORRECT_SOURCE_ACCOUNT_NUMBER</li><ul>  | Text
status                | Issue state: OPENED, IN_PROGRESS, CLOSED              | Text
description           | Additional details about issue. For example 'Incorrect recipient account number'          | Text



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




## List

> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/transfers?offset=0&limit=100&profile=<your profile id>&status=funds_refunded&createdDateStart=2018-12-15&createdDateEnd=2018-12-30  \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
  {
    "id": 15574445,
    "user": 294205,
    "targetAccount": 7993919,
    "sourceAccount": null,
    "quote": 113379,
    "status": "funds_refunded",
    "reference": "good times",
    "rate": 1.1179,
    "created": "2018-12-16 15:25:51",
    "business": null,
    "transferRequest": null,
    "details": {
      "reference": "good times"
    },
    "hasActiveIssues": false,
    "sourceValue": 1000,
    "sourceCurrency": "EUR",
    "targetValue": 895.32,
    "targetCurrency": "GPB",
    "customerTransactionId": "6D9188CF-FA59-44C3-87A2-4506CE9C1EA3"
  },
  {
    "id": 14759252,
    "user": 294205,
    "targetAccount": 5570192,
    "sourceAccount": null,
    "quote": 113371,
    "status": "funds_refunded",
    "reference": "",
    "rate": 1.1179,
    "created": "2018-12-26 15:25:51",
    "business": null,
    "transferRequest": null,
    "details": {
      "reference": ""
    },
    "hasActiveIssues": false,
    "sourceValue": 1000,
    "sourceCurrency": "EUR",
    "targetValue": 895.32,
    "targetCurrency": "GPB",
    "customerTransactionId": "785C67AD-7E29-4DBC-9D4A-4C45D4D5333A"
  }
]
```

Get the list of transfers for given user's profile (defaults to user's personal profile). 

You can add query parameters to specify user's profile (personal or business), time period and/or payment status. 

For example you can query:<br/>
<ul>
  <li> all failed payments created since last week</li>
  <li> all completed payments created since yesterday</li>
</ul>


### Request

**`GET https://api.sandbox.transferwise.tech/v1/transfers/?offset=0&limit=100&profile=<your profile id>&status=funds_refunded&createdDateStart=2018-12-15&createdDateEnd=2018-12-30`**

Field                     | Description             | Format
---------                 | -------                 | -----------
profile                   | User profile id. If parameter is omitted, defaults to user's personal profile | Integer
status                    | Status code or codes list (as comma separated value list) to filter returned transfers with. See [Track transfer status](#transferwise-payouts-guide-track-transfer-status) for complete list of statuses. | Text
createdDateStart          | Starting date to filter transfers, inclusive of the provided date.   | yyyy-MM-dd
createdDateEnd            | Ending date to filter transfers, inclusive of the provided date.     | yyyy-MM-dd
limit                     | Maximum number of records to be returned in response   | Integer
offset                    | Starting record number | Integer



## Requirements

> Example Request:

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/transfer-requirements \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
            "targetAccount": <recipient account id>,
            "quote": <quote id>,
            "details": {
              "reference": "good times",
              "sourceOfFunds": "verification.source.of.funds.other",
              "sourceOfFundsOther": "Trust funds"
            },
            "customerTransactionId": "6D9188CF-FA59-44C3-87A2-4506CE9C1EA3"
         }'
```

> Example Response:

```json
[
  {
    "type": "transfer",
    "fields": [
      {
        "name": "Transfer reference",
        "group": [
          {
            "key": "reference",
            "type": "text",
            "refreshRequirementsOnChange": false,
            "required": false,
            "displayFormat": null,
            "example": null,
            "minLength": null,
            "maxLength": 10,
            "validationRegexp": null,
            "validationAsync": null,
            "valuesAllowed": null
          }
        ]
      },
      {
        "name": "Transfer purpose",
        "group": [
          {
            "key": "transferPurpose",
            "type": "select",
            "refreshRequirementsOnChange": true,
            "required": true,
            "displayFormat": null,
            "example": null,
            "minLength": null,
            "maxLength": null,
            "validationRegexp": null,
            "validationAsync": null,
            "valuesAllowed": [
              {
                "key": "verification.transfers.purpose.purchase.property",
                "name": "Buying property abroad"
              },
              {
                "key": "verification.transfers.purpose.pay.bills",
                "name": "Rent or other property expenses"
              },
              {
                "key": "verification.transfers.purpose.mortgage",
                "name": "Mortgage payment"
              },
              {
                "key": "verification.transfers.purpose.pay.tuition",
                "name": "Tuition fees or studying expenses"
              },
              {
                "key": "verification.transfers.purpose.send.to.family",
                "name": "Sending money home to family"
              },
              {
                "key": "verification.transfers.purpose.living.expenses",
                "name": "General monthly living expenses"
              },
              {
                "key": "verification.transfers.purpose.other",
                "name": "Other"
              }
            ]
          }
        ]
      },
      {
        "name": "Source of funds",
        "group": [
          {
            "key": "sourceOfFunds",
            "type": "select",
            "refreshRequirementsOnChange": true,
            "required": true,
            "displayFormat": null,
            "example": null,
            "minLength": null,
            "maxLength": null,
            "validationRegexp": null,
            "validationAsync": null,
            "valuesAllowed": [
              {
                "key": "verification.source.of.funds.salary",
                "name": "Salary"
              },
              {
                "key": "verification.source.of.funds.investment",
                "name": "Investments (stocks, properties, etc.)"
              },
              {
                "key": "verification.source.of.funds.inheritance",
                "name": "Inheritance"
              },
              {
                "key": "verification.source.of.funds.loan",
                "name": "Loan"
              },
              {
                "key": "verification.source.of.funds.other",
                "name": "Other"
              }
            ]
          }
        ]
      }
    ]
  }
]
```


Almost every country has their own specific originality when it comes to the nitty gritty details of domestic payment systems and money transfer regulations. 
Maximum allowed length of reference text is a good example. The US payment system, ACH, supports 10 characters only, but transfers within Mexico allow up to 100 characters and so on.

Same is true for requirements arising from Anti-Money Laundering regulations adopted in different countries. Transfers from and to USD almost always require more details about source of funds and transfer purpose, compared to transfers to EUR or GBP.

Endpoint /transfer-requirements exposes all these specific requirements based on specific quote and target recipient account.

To make sure that processing of your transfers does not get delayed because of missing details, we highly recommend to verify the transfer requirements before before submitting any transfer.


### Request
**` POST https://api.sandbox.transferwise.tech/v1/transfer-requirements`**<br/>


1.Prepare request body to create transfer object first. 
Now post this request body to transfer-requirements endpoint to figure out if there are any other required fields.


2.Analyze the returned list of fields. Our example includes reference, sourceOfFunds and transferPurpose fields.  Field 'reference' is optional. Fields 'sourceOfFunds' and 'transferPurpose' are required and both have 
refreshRequirementsOnChange=true which indicates that there could be additional fields required depending on the selected value.

In our example you will have to POST request to/v1/transfer-requirements` second time as well with values set for 'transferPurpose' and 'sourceOfFunds'.
So in case you set sourceOfFunds = 'verification.source.of.funds.other'  then another text field called "sourceOfFundsOther" is also required where you need to specify the details in free format.

3.Once you get to the point where you have provided values for all fields which have refreshRequirementsOnChange=true then you have complete set of fields to compose a valid request to create a transfer object. 
For example this is a valid request to create a transfer.
<br/> POST /v1/transfers:<br/>

{
    "targetAccount": <recipient account id>,
    "quote": <quote id>,
    "details": {
      "reference": "good times",
      "sourceOfFunds": "verification.source.of.funds.other",
      "sourceOfFundsOther": "Trust funds"
    },
    "customerTransactionId": "6D9188CF-FA59-44C3-87A2-4506CE9C1EA3"
}


### Response
Field                                       | Description                                               | Format
---------                                   | -------                                                   | -----------
type                                        | "transfer"                                                | Text
fields[n].name                              | Field description                                         | Text
fields[n].group[n].key                      | Key is name of the field you should include in the JSON   | Text
fields[n].group[n].type                     | Display type of field (e.g. text, select, etc)            | Text
fields[n].group[n].refreshRequirementsOnChange |  Tells you whether you should call POST transfer-requirements once the field value is set to discover required lower level fields.  | Boolean
fields[n].group[n].required                 | Indicates if the field is mandatory or not                | Boolean
fields[n].group[n].displayFormat            | Display format pattern.                                   | Text
fields[n].group[n].example                  | Example value.                                            | Text
fields[n].group[n].minLength                | Min valid length of field value.                          | Integer
fields[n].group[n].maxLength                | Max valid length of field value.                          | Integer
fields[n].group[n].validationRegexp         | Regexp validation pattern.                                | Text
fields[n].group[n].validationAsync          | Validator URL and parameter name you should use when submitting the value for validation | Text
fields[n].group[n].valuesAllowed[n].key     | List of allowed values. Value key                         | Text
fields[n].group[n].valuesAllowed[n].name    | List of allowed values. Value name.                       | Text

<br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/>
