# Webhooks
Receiving webhook updates for events that take place in the Goji Platform.

## Authentication

To allow you to verify that the webhook message originated from Goji, HMAC authentication headers will be included with the request.
`x-nonce` A unique string for every request. This will also be included in the signature string (see below) and is used to prevent replay attacks.
`x-timestamp` Milliseconds since epoch. This will also be included in the signature string (see below) and is used to prevent replay attacks.
`Authorization` In the format `<signature-string>` See below for how to build the `signature-string` .

### Building the signature string

The following details are concatenated together (without spaces):

    `nonce + \n + timestamp`

Where `\n` represents a single linefeed character, hex code `0x10`.

The string is then encrypted using `HMAC-SHA256` using a secret. This secret will either be shared with you as part of the onboarding process, or is obtained from our API when registering your webhook URL.
The result is then Base64 encoded to produce a string.
The encrypted string is then UTF-8 URL encoded.

### Verifying the signature

<aside class="notice">
You should verify that the <code>Authorization</code> header matches the expected signature string using the secret that was shared with you during onboarding.
</aside>

## `POST /webhooks`

```http

POST /platformApi/webhooks HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "url" : "url"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "url" : "url",
  "secret" : "secret"
}

```
### Description
Register a webhook url.
### Request
| Name | Type   | Description                         | Required |
| ---- | ------ | ----------------------------------- | -------- |
| url  | string | The url to dispatch the webhook to. | optional |
### Response
| Name | Type   | Description          |
| ---- | ------ | -------------------- |
| url   | string | The url as specified in the request. |
| secret   | string | The webhook secret that should be used to check the validity of webhooks received (see [Webhooks authentication](#webhooks-authentication) for full details). |

## *Webhook Types*

When certain events are triggered in the Goji system, a call can be made to your system to inform you of this event.

The URL to be called is configured as part of the onboarding process.

### Format

```json
{
  "id": "uuid",
  "dateTime": "yyyy-MM-ddTHH:mm:ss",
  "type": "TYPE",
  "content": {...}
}
```
The webhook `POST` body will be in the following format.
The following event `type`s will be supported, along with the content as `JSON`.

## INVESTOR_PERSONAL_DETAILS_REGISTERED
```json
{
  "title": "string",
  "firstName": "string",
  "lastName": "string",
  "contactDetails": {
    "emailAddress": "string",
    "telephoneNumber": "string"
  }
}
````

This is fired whenever personal details are registered.

## INVESTOR_CREATED
```json
{
  "clientId": "string",
  "title": "string",
  "firstName": "string",
  "middleName": "string",
  "lastName": "string",
  "dateOfBirth": "2017-12-12",
  "contactDetails": {
    "emailAddress": "string",
    "telephoneNumber": "string"
  },
  "address": {
    "lineOne": "string",
    "lineTwo": "string",
    "lineThree": "string",
    "townCity": "string",
    "region": "string",
    "country": "string",
    "postcode": "string"
  }
}
```
This is fired whenever a new investor is registered.

## INVESTOR_KYC_STATUS_CHANGE
```json
{
  "clientId": "string",
  "newKycStatus": "string"
}
```
This is fired whenever an investor's KYC status changes eg from `REFERRED` to `VERIFIED`.

## INVESTOR_FUNDS_RECEIVED
```json
{
  "clientId": "string",
  "reference": "string",
  "amount": {
    "amount": 0.00,
    "currency": "GBP"
  },
  "sourceAccount": {
      "accountName": "string",
      "accountNumber": "string",
      "sortCode": "string"
  },
  "accountType": "string",
  "redirected": boolean
  "intendedAccountType": "string",
  "accountType": "string",
  "sourceType": "string"
}
```
This is fired whenever investor funds are cleared into their account eg for a bank transfer.

<aside class="notice">
If using the batch payments api this event will not trigger but instead a <code>BATCH_UPDATE</code> event will be generated once all payments have been received.
</aside>

<aside class="notice">
If <code>redirected = true</code>, the <code>accountType</code> will reflect which account the money has been credited to. The <code>intendedAccountType</code> will
contain details of where the investor wished to deposit. This scenario is most likely when depositing into an ISA and the ISA subscription
status is preventing deposits.
</aside>

### Valid Source Types
DEPOSIT<br>
BONUS<br>
CAPITAL_REPAYMENT<br>
INTEREST_REPAYMENT<br>
SELL_PREMIUM

## ISA_AUTO_REPAIRED
```json
{
  "clientId": "string",
  "repairedAmount": {
      "amount": 0.00,
      "currency": "GBP"
  }
}
```
This is fired whenever an oversubscribed ISA has been auto repaired. Oversubscription happens when an investor deposits more than their allowed subscription limit. The overflowing amount will be automatically moved to the investment account.

## INVESTOR_FUNDS_WITHDRAWN
```json
{
  "clientId": "string",
  "reference": "string",
  "account": "string",
  "amount": {
    "amount": 0.00,
    "currency": "GBP"
  }
}
```
This is fired whenever an investor withdraws funds.

## INVESTMENT_QUEUED
```json
{
  "clientId": "string",
  "investmentId": "string",
  "amount": {
    "amount": 0.00,
    "currency": "GBP"
  },
  "productTermId": "string"
}
```
This is fired whenever an investment is queued. Bond Management API only.

## INVESTMENT_FULFILLED
```json
{
  "clientId": "string",
  "investmentId": "string"
}
```
This is fired whenever an investment is fulfilled. Bond Management API only.

## TRANSFER_IN_CREATED
```json
{
  "clientId": "string",
  "transferInId": "string"
}
```
This is fired whenever a transfer in is created.

## TRANSFER_OUT_CREATED
```json
{
  "transferOut": {
    "id": "string",
    "isaId": "string",
    "originatorId": "string",
    "originatorName": "string",
    "clientId": "string",
    "workflowId": "string",
    "isaManager": {
      "name": "string",
      "address": {
        "lineOne": "string",
        "lineTwo": "string",
        "lineThree": "string",
        "townCity": "string",
        "region": "string",
        "country": "string",
        "postcode": "string"
      },
      "accountNumber": "string",
      "sortCode": "string",
      "bankReference": "string"
    },
    "transferDetails": {
      "dateTAFReceived": "2017-12-12",
      "transferDateFromNewIsaManager": "2017-12-12",
      "transferAll": "boolean",
      "transferCurrentYearSubscriptions": "boolean",
      "transferPriorYearSubscriptions": "boolean",
      "transferAllPriorYearSubscriptions": "boolean",
      "priorYearAmountToTransfer": {
        "amount": 0.00,
          "currency": "GBP"
      },
      "transferOutFee": {
        "amount": 0.00,
        "currency": "GBP"
      }
    },
    "transferOutFee": {
      "id": "string",
      "transferOutId": "string",
      "transferOutFee": {
        "amount": 0.00,
        "currency": "GBP"
      },
      "dateTime": "2017-12-12T14:34:23"
    },
    "dateTimeStarted": "2017-12-12T14:34:23",
    "amountToTransfer": {
      "amount": 0.00,
      "currency": "GBP"
    },
    "amountSubscribedInCurrentYear": {
      "amount": 0.00,
      "currency": "GBP"
    },
    "dateOfFirstSubscriptionInCurrentYear": "2017-12-12"
  }
}
```
This is fired whenever a transfer out is requested.

## TRANSFER_OUT_COMPLETED
```json
{
  "transferOut": {
    "id": "string",
    "isaId": "string",
    "originatorId": "string",
    "originatorName": "string",
    "clientId": "string",
    "workflowId": "string",
    "isaManager": {
      "name": "string",
      "address": {
        "lineOne": "string",
        "lineTwo": "string",
        "lineThree": "string",
        "townCity": "string",
        "region": "string",
        "country": "string",
        "postcode": "string"
      },
      "accountNumber": "string",
      "sortCode": "string",
      "bankReference": "string"
    },
    "transferDetails": {
      "dateTAFReceived": "2017-12-12",
      "transferDateFromNewIsaManager": "2017-12-12",
      "transferAll": "boolean",
      "transferCurrentYearSubscriptions": "boolean",
      "transferPriorYearSubscriptions": "boolean",
      "transferAllPriorYearSubscriptions": "boolean",
      "priorYearAmountToTransfer": {
        "amount": 0.00,
          "currency": "GBP"
      },
      "transferOutFee": {
        "amount": 0.00,
        "currency": "GBP"
      }
    },
    "transferOutFee": {
      "id": "string",
      "transferOutId": "string",
      "transferOutFee": {
        "amount": 0.00,
        "currency": "GBP"
      },
      "dateTime": "2017-12-12T14:34:23"
    },
    "dateTimeStarted": "2017-12-12T14:34:23",
    "amountToTransfer": {
      "amount": 0.00,
      "currency": "GBP"
    },
    "amountSubscribedInCurrentYear": {
      "amount": 0.00,
      "currency": "GBP"
    },
    "dateOfFirstSubscriptionInCurrentYear": "2017-12-12"
  }
}
```
This is fired whenever a transfer out is completed.

## TRANSFER_IN_FUNDS_RECEIVED
```json
{
  "clientId": "string",
  "transferInId": "string",
  "amount": {
    "amount": 0.00,
    "currency": "GBP"
  }
}
```
This is fired whenever the funds for a transfer in are received.

## ISA_PROVISIONALLY_OPENED
```json
{
  "clientId": "string"
}
```
This is fired whenever an ISA is opened.

## INVESTMENT_PAYOUT_EVENT
```json
{
  "investmentPayouts" : [ {
    "investorId (DEPRECATED)" : "string (DEPRECATED)",
    "clientId" : "string",
    "investmentId" : "string",
    "account" : "string",
    "amount" : {
      "amount" : 0.00,
      "currency" : "GBP"
    },
    "type" : "string"
  }],
  "dueDate" : "2017-12-12",
  "type" : "string",
  "total" : {
    "amount" : 0.00,
    "currency" : "GBP"
  }
}
```
This is fired whenever a repayment is distributed to an investor's account. Bond Management API only.

## FUNDS_REQUESTED
```json
{
  "transactions" : [ {
    "bondId" : "string",
    "type" : "string",
    "amount" : {
      "amount" : 0.0,
      "currency" : "GBP"
    }
  } ],
  "amount" : {
    "amount" : 0.0,
    "currency" : "GBP"
  },
  "dueDate" : "string",
  "accountName" : "string",
  "accountNumber" : "string",
  "sortCode" : "string",
  "bankReference" : "string"
}
```
This is fired whenever repayment funds are requested from the investment manager. Bond Management API only.

## FUNDS_RECEIVED
```json
{
  "reference" : "string",
  "amount" : {
    "amount" : 0.0,
    "currency" : "GBP"
  }
}
```
This is fired whenever repayment funds are received from the investment manager.

## BANK_ACCOUNT_DETAILS_STATUS_CHANGED
```json
{
  "id" : "string",
  "accountName" : "string",
  "accountNumber" : "string",
  "sortCode" : "string",
  "status" : "string"
}
```
When registering bank account details using
<a href="/#payments-manager-post-platformapi-bankaccountdetails">/platformApi/bankAccountDetails</a>
Goji will perform verification of these account details and once validated the details will be ENABLED or DISABLED.
This is fired whenever the status of the bank account details changes.


## COMPANY_REGISTRATION_UPDATE
```json
{
  "partyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502",
  "status": "REGISTERED",
  "ukCompany": {
    "number": "00000000",
    "name": "Fake Company LIMITED"
  }
}
```
This is fired when the status of the company registration state changes.

## WALLET_CREATED
```json
{
  "walletId" : "3d9ca033-eb05-459f-9f70-1139d2e2b213",
  "ownerPartyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502",
  "bankDetails" : {
    "id" : "03946a54-6b4f-4bae-897d-6ee2baf0e848",
    "accountName" : "Housing Project 22",
    "accountNumber" : "00000000",
    "sortCode" : "000000"
  }
}
```
This is fired whenever a wallet is created.

## WALLET_FUNDS_RECEIVED (deprecated)
```json
{
  "walletId" : "3d9ca033-eb05-459f-9f70-1139d2e2b213",
  "ownerPartyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502",
  "reference": "Payment reference",
  "amount": {
    "amount": 0.00,
    "currency": "GBP"
  },
  "sourceAccount": {
    "accountName" : "Housing Project 22",
    "accountNumber" : "00000000",
    "sortCode" : "000000"
  }
}
```

Note: This webhook is now deprecated and has been replaced by the `WALLET_TRANSFER_UPDATE` webhook below.
Existing users of this webhook can continue to use it, however, it is recommended to move to the `WALLET_TRANSFER_UPDATE` webhook.

This is fired when funds are received into a wallet.

## WALLET_TRANSFER_UPDATE
```json
{
  "ownerPartyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502",
  "walletId" : "3d9ca033-eb05-459f-9f70-1139d2e2b213",
  "id" : "fbb5d667-03c4-4658-9b30-fcf06adfa5b8",
  "direction": "INBOUND",
  "status": "CLEARED",
  "amountReceived": {
    "amount": 10.23,
    "currency": "GBP"
  },
  "reference": "Payment Reference",
  "sourceAccount": {
    "accountName": "John Doe",
    "accountNumber": "00000000",
    "sortCode": "00000000"
  },
  "destinationAccount": {
    "accountName": "Jane Doe",
    "accountNumber": "00000000",
    "sortCode": "00000000"
  }
}
```

This webhook replaces the now deprecated `WALLET_FUNDS_RECEIVED` endpoint.
Users of the `WALLET_FUNDS_RECEIVED` endpoint can continue to use it, however, it is recommended to move to this webhook. 
For new users, please integrate against this webhook instead.

This is fired when funds are transfered into or out of a wallet. 

There are three statuses that can be returned in a 'WALLET_TRANSFER_UPDATE' webhook. These are:

(1) REQUESTED - this status is set when a request to move funds out of a wallet has been acknowledged.

(2) CLEARED - this status is set when:

  (a) funds are confirmed to have successfully left a wallet.
  
  (b) funds are confirmed to have successfully arrived into a wallet. 
  
(3) FAILED - this status is set when a request to move funds has failed. 

## TRADE_SETTLEMENT
```json
{
  "id": "99a41761-6629-47a2-8087-23961b1b059b",
  "dateTime": "2019-12-16T09:48:59",
  "type": "TRADE_SETTLEMENT",
  "content": {
    "trade": {
      "id": "14f8c00c-d667-46d6-a08f-cd978f84bb85",
      "buy": {
        "investor": {
          "clientId": "clientId",
          "accountType": "GIA"
        },
        "nominee": null,
        "fees": [
          {
            "symbol": "STAMP_DUTY",
            "cost": {
              "currency": "GBP",
              "amount": 500
            }
          }
        ]
      },
      "sell": {
        "investor": null,
        "nominee": {
          "accountType": "ORIGINATOR"
        },
        "fees": [

        ]
      },
      "price": {
        "currency": "GBP",
        "amount": 300
      },
      "quantity": 1000,
      "instrumentSymbol": "046deba4-0141-428b-9729-1668026c8caf",
      "settlementStatus": "SETTLED"
    }
  }
}
```

This event is fired when a trade request (available as part of the Equities API) has reached a terminal state.
E.g. settles successfully

## DIVIDEND_UPDATE

```json
{
  "id": "5cd2e950-bfc2-4fe9-a744-ae3483320ab7",
  "dateTime": "2019-12-16T09:56:51",
  "type": "DIVIDEND_UPDATE",
  "content": {
    "dividend": {
      "id": "68ee8001-cf85-465b-955e-24a22f89fd04",
      "instrumentSymbol": "instrument1",
      "status": "COMPLETE",
      "totalPayout": {
        "currency": "GBP",
        "amount": 100
      },
      "paymentsSummary": {
        "totalPayments": 10,
        "totalFailed": 1,
        "totalDistributed" : 2,
        "totalPending": 3,
        "totalReceived": 4
      },
      "payTo": {
        "accountName": "name",
        "accountNumber": "12345678",
        "sortCode": "001122",
        "reference": "12345678"
      }
    }
  }
}
```

This event is fired two times in the lifecycle of a dividend post request:

1. once funds have been received to distribute to investors 'DISTRIBUTING' 
2. once distribution of the dividend is 'COMPLETE' and funds received by investors

### Batch Payments Summary

| Key                 | JSON Type | Value Type | Value Description                                             |
|---------------------|-----------|------------|---------------------------------------------------------------|
| totalPayments       | Number    | Number     | The total payments of the batch.                              |
| totalPending        | Number    | Number     | The total individual batch payments waiting to be instructed. |
| totalDistributed    | Number    | Number     | The total payments have been distributed.                     |
| totalFailed         | Number    | Number     | Total failed batch payments                                   |
| totalReceived       | Number    | Number     | Total batch payments has been received by the investors.      |

## BATCH_UPDATE
```json
{
  "id": "6d9fc50e-de1b-4855-8c03-ae8a6093d91b",
  "dateTime": "2019-12-16T09:54:23",
  "type": "BATCH_UPDATE",
  "content": {
    "batch": {
      "originatorId": null,
      "batchId": "6a17ef7e-8696-4977-8989-4b948780c5db",
      "type": "MIGRATION",
      "status": "COMPLETE",
      "totalPayout": {
        "amount": 1000,
        "currency": "GBP"
      },
      "paymentsSummary": {
        "totalPayments": 10,
        "totalFailed": 1,
        "totalDistributed" : 2,
        "totalPending": 3,
        "totalReceived": 4
      },
      "payTo": {
        "accountName": "name",
        "accountNumber": "12345678",
        "sortCode": "001122",
        "bankReference": "12345678"
      }
    }
  }
}
```

This event is fired when an update related to a bulk payment request occurs. E.g. the bulk payment is distributed and funds received by investors.

### Batch Payments Summary

| Key                 | JSON Type | Value Type | Value Description                                             |
|---------------------|-----------|------------|---------------------------------------------------------------|
| totalPayments       | Number    | Number     | The total payments of the batch.                              |
| totalPending        | Number    | Number     | The total individual batch payments waiting to be instructed. |
| totalDistributed    | Number    | Number     | The total payments have been distributed.                     |
| totalFailed         | Number    | Number     | Total failed batch payments                                   |
| totalReceived       | Number    | Number     | Total batch payments has been received by the investors.      |

## ACCOUNT_FEE_PROCESSED
```json
{
  "clientId": "string",
  "dateTime": "2017-12-12T14:34:23",
  "account": "string",
  "amount" : {
    "amount": 0.00,
    "currency": "GBP"
  },
  "type": "FEES",
  "reference": "string",
  "clearedDateTime": "2017-12-12T14:34:23"
}
```

This is fired when account fees have been processed


## NOMINEE_ALLOCATION_STATUS_UPDATE
```json
{
  "id": "b2b8be2d-5575-4c9c-8f89-57398ddc5ff3",
  "quantity": 500,
  "instrumentSymbol": "INSTRUMENT_SYMBOL",
  "status": "ALLOCATED",
  "createdAt": "2020-09-17T12:43:18.519524Z",
  "updatedAt": "2020-09-18T13:43:18.523776Z"
}
```

This webhook is fired whenever there is a change in the `status` of an allocation instructed to be received by a nominee.

The `id` references the unique allocation id originally assigned when calling the [`POST /allocations`](/#settlement-equity-post-allocations) endpoint.

There are three statuses that can be returned in a `NOMINEE_ALLOCATION_STATUS_UPDATE` webhook. 
These are:

(1) PENDING - this status is set when an allocation instruction towards a nominee is created.

(2) ALLOCATED - a terminal status. This status is set when an allocation instruction towards a nominee been approved and actioned.
  
(3) CANCELLED - a terminal status. This status is set when an allocation instruction towards a nominee has been rejected and actioned.

 

## INVESTMENT_REPAYMENT_INSTRUCTION_RECEIVED
```json
{
  "id": "cc84c538-0c7f-41f7-8362-c6115c1df6f7",
  "type": "INVESTMENT_REPAYMENT_INSTRUCTION_RECEIVED",
  "dateTime": "2021-11-26T15:07:05.786408723Z",
  "content": {
    "repaymentBatchReference": "REPAYMENT-2b86a1bb-fe9d-4476-9e6b-0e29477e251d",
    "totalRepayments": 10,
    "totalAmount": {
      "amount": 0.3,
      "currency": "GBP"
    },
    "overallStatus": "PENDING",
    "postedAt": "2021-11-26T15:07:05.765271497Z",
    "clearedAt": null
  }
}
```
This webhook is fired when the system has successfully recorded a repayment request.


## INVESTMENT_REPAYMENT_CLEARING
```json
{
  "id": "d6adb525-adac-4cc0-a86f-a9c0e68a7bb8",
  "type": "INVESTMENT_REPAYMENT_CLEARING",
  "dateTime": "2021-11-26T21:51:32.574621Z",
  "content": {
    "repaymentBatchReference": "REPAYMENT-2b86a1bb-fe9d-4476-9e6b-0e29477e251d",
    "repaymentId": "REPAYMENT_ID",
    "investmentId": "INVESTMENT_CLIENT_ID",
    "amount": {
      "amount": 10,
      "currency": "GBP"
    },
    "type": "INTEREST",
    "status": "CLEARED",
    "postedAt": "2021-11-26T21:51:32.542533Z",
    "clearedAt": "2021-11-26T21:51:32.543340Z"
  }
}
```
This webhook is fired whenever the system marks a single repayment as cleared.
I.e. the money movement for the singular investor repayment has occurred.


## INVESTMENT_REPAYMENT_BATCH_COMPLETE
```json
{
  "id": "cc84c538-0c7f-41f7-8362-c6115c1df6f7",
  "type": "INVESTMENT_REPAYMENT_BATCH_COMPLETE",
  "dateTime": "2021-11-26T15:07:05.786408723Z",
  "content": {
    "repaymentBatchReference": "REPAYMENT-2b86a1bb-fe9d-4476-9e6b-0e29477e251d",
    "totalRepayments": 10,
    "totalAmount": {
      "amount": 0.3,
      "currency": "GBP"
    },
    "overallStatus": "CLEARED",
    "postedAt": "2021-11-26T15:07:05.765271497Z",
    "clearedAt": "2021-11-26T15:15:10.765271497Z"
  }
}
```
This webhook is fired when the system marks the full repayment request as complete.
I.e. all associated money movements have occurred.
