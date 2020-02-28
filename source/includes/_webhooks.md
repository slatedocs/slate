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
You should verify that the `Authorization` header matches the expected signature string using the secret that was shared with you during onboarding.
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
This is fired whenever personal details are registered.

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

## INVESTOR_CREATED
This is fired whenever a new investor is registered.

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

## INVESTOR_KYC_STATUS_CHANGE
This is fired whenever an investor's KYC status changes eg from `REFERRED` to `VERIFIED`.

```json
{
  "clientId": "string",
  "newKycStatus": "string"
}
```

## INVESTOR_FUNDS_RECEIVED
This is fired whenever investor funds are cleared into their account eg for a bank transfer.

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
  "accountType": "string"
}
```

## ISA_AUTO_REPAIRED
This is fired whenever an oversubscribed ISA has been auto repaired. Oversubscription happens when an investor deposits more than their allowed subscription limit. The overflowing amount will be automatically moved to the investment account.

```json
{
  "clientId": "string",
  "repairedAmount": {
      "amount": 0.00,
      "currency": "GBP"
  }
}
```

## INVESTOR_FUNDS_WITHDRAWN
This is fired whenever an investor withdraws funds.

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

## INVESTMENT_QUEUED
This is fired whenever an investment is queued. Bond Management API only.

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

## INVESTMENT_FULFILLED
This is fired whenever an investment is fulfilled. Bond Management API only.

```json
{
  "clientId": "string",
  "investmentId": "string"
}
```

## TRANSFER_IN_CREATED
This is fired whenever a transfer in is created.

```json
{
  "clientId": "string",
  "transferInId": "string"
}
```

## TRANSFER_OUT_CREATED
This is fired whenever a transfer out is requested.

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

## TRANSFER_OUT_COMPLETED
This is fired whenever a transfer out is completed.

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

## TRANSFER_IN_FUNDS_RECEIVED
This is fired whenever the funds for a transfer in are received.

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

## ISA_PROVISIONALLY_OPENED
This is fired whenever an ISA is opened.

```json
{
  "clientId": "string"
}
```

## INVESTMENT_PAYOUT_EVENT
This is fired whenever a repayment is distributed to an investor's account. Bond Management API only.

```json
{
  "investmentPayouts" : [ {
    "investorId" : "string",
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

## FUNDS_REQUESTED
This is fired whenever repayment funds are requested from the investment manager. Bond Management API only.

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

## FUNDS_RECEIVED
This is fired whenever repayment funds are received from the investment manager.

```json
{
  "reference" : "string",
  "amount" : {
    "amount" : 0.0,
    "currency" : "GBP"
  }
}
```

## BANK_ACCOUNT_DETAILS_STATUS_CHANGED
This is fired whenever a set of bank account details are "ENABLED"/"DISABLED", as displayed by their status.

```json
{
  "id" : "string",
  "accountName" : "string",
  "accountNumber" : "string",
  "sortCode" : "string",
  "status" : "string"
}
```

## WALLET_CREATED
This is fired whenever a wallet is created.

```json
{
  "id" : "3d9ca033-eb05-459f-9f70-1139d2e2b213",
  "ownerPartyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502",
  "bankDetails" : {
    "id" : "03946a54-6b4f-4bae-897d-6ee2baf0e848",
    "accountName" : "Housing Project 22",
    "accountNumber" : "00000000",
    "sortCode" : "000000"
  }
}
```

## WALLET_FUNDS_RECEIVED
This is fired when funds are received into a wallet.

```json
{
  "id" : "3d9ca033-eb05-459f-9f70-1139d2e2b213",
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


## WALLET_TRANSFER_CLEARED
<aside class="warning">
This Webhook is currently not in use.
<aside class="warning">

This is fired when a wallet transfer is completed.

```json
{
  "destinationBankAccountDetails" : {
    "bankAccountId" : "string",
    "bankDetails" : {
      "accountName" : "string",
      "accountNumber" : "string",
      "sortCode" : "string"
    }
  },
  "sourceWallet" : {
    "id" : "string",
    "ownerPartyId": "string",
    "bankDetails" : {
      "accountName" : "string",
      "accountNumber" : "string",
      "sortCode" : "string"
    }
  },
  "amount" : {
    "amount": 0.00,
    "currency": "GBP"
  },
  "success" : "boolean",
  "narrative" : "string",
  "reference" : "string"
}
```

TRADE_SETTLEMENT
This event is fired when a trade request (available as part of the Equities API) has reached a terminal state. 
E.g. settles successfully

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

## DIVIDEND_UPDATE
This event is fired two times in the lifecycle of a dividend post request. 
1. once funds have been received to distribute to investors 'DISTRIBUTING' 
2. once distribution of the dividend is 'COMPLETE'

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
      "payments": [
        {
          "clientId": "clientId",
          "accountType": "GIA",
          "payment": {
            "currency": "GBP",
            "amount": 100
          },
          "status": "DISTRIBUTED"
        }
      ],
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

## BATCH_UPDATE
This event is fired when an update related to a bulk payment request occurs. E.g. the bulk payment is now complete.

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
      "payments": [
        {
          "clientId": "clientId",
          "accountType": "GIA",
          "amount": {
            "amount": 1000,
            "currency": "GBP"
          },
          "status": "RECEIVED",
          "sourceOfFunds": null
        }
      ],
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

## ACCOUNT_FEE_PROCESSED
This is fired when account fees have been processed

```json
{
  "investorId": "string",
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

## COMPANY_REGISTRATION_UPDATE
This is fired when the status of the company registration state changes. 

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
