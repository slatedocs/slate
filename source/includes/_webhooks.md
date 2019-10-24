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

The string is then encrypted using `HMAC-SHA256` using a secret. This secret will either be shared with you as part of the onboarding process, or is obtained from our API when registering your webhook URL.
The result is then Base64 encoded to produce a string.
The encrypted string is then UTF-8 URL encoded.

### Verifying the signature

<aside class="notice">
You should verify that the `Authorization` header matches the expected signature string using the secret that was shared with you during onboarding.
</aside>

## `POST /webhooks`

```http

POST /webhooks HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "url" : "url"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Register a webhook url.
### Request
| Name | Type   | Description                         | Required |
| ---- | ------ | ----------------------------------- | -------- |
| url  | string | The url to dispatch the webhook to. | optional |
### Response
| Name | Type | Description |
| ---- | ---- | ----------- |

## Webhook Types

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

>INVESTOR_PERSONAL_DETAILS_REGISTERED
><br>This is fired whenever personal details are registered.

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

>INVESTOR_CREATED
><br>This is fired whenever a new investor is registered.

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

>INVESTOR_KYC_STATUS_CHANGE
><br>This is fired whenever an investor's KYC status changes eg from `REFERRED` to `VERIFIED`.

```json
{
  "clientId": "string",
  "newKycStatus": "string"
}
```

>INVESTOR_FUNDS_RECEIVED
><br>This is fired whenever investor funds are cleared into their account eg for a bank transfer.

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

>INVESTOR_FUNDS_WITHDRAWN
><br>This is fired whenever an investor withdraws funds.

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

>INVESTMENT_QUEUED
><br>This is fired whenever an investment is queued. Bond Management API only.

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

>INVESTMENT_FULFILLED
><br>This is fired whenever an investment is fulfilled. Bond Management API only.

```json
{
  "clientId": "string",
  "investmentId": "string"
}
```

>TRANSFER_IN_CREATED
><br>This is fired whenever a transfer in is created.

```json
{
  "clientId": "string",
  "transferInId": "string"
}
```

>TRANSFER_OUT_CREATED
><br>This is fired whenever a transfer in is requested.

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
    "transferOutFee: {
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
```

>TRANSFER_IN_FUNDS_RECEIVED
><br>This is fired whenever the funds for a transfer in are received.

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

>ISA_PROVISIONALLY_OPENED
><br>This is fired whenever an ISA is opened.

```json
{
  "clientId": "string"
}
```

>INVESTMENT_PAYOUT_EVENT
><br>This is fired whenever a repayment is distributed to an investor's account. Bond Management API only.

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

>FUNDS_REQUESTED
><br>This is fired whenever repayment funds are requested from the investment manager. Bond Management API only.

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

>FUNDS_RECEIVED
><br>This is fired whenever repayment funds are received from the investment manager. Bond Management API only.

```json
{
  "reference" : "string",
  "amount" : {
    "amount" : 0.0,
    "currency" : "GBP"
  }
}
```

>BANK_ACCOUNT_DETAILS_STATUS_CHANGED
><br>This is fired whenever a set of bank account details are "ENABLED"/"DISABLED", as displayed by their status.

```json
{
  "id" : "string",
  "accountName" : "string",
  "accountNumber" : "string",
  "sortCode" : "string",
  "status" : "string"
}
```

>WALLET_CREATED
><br>This is fired whenever a wallet is created.

```json
{
  "walletId" : "string",
  "bankDetails" : {
    "accountName" : "string",
    "accountNumber" : "string",
    "sortCode" : "string",
  }
}
```

>WALLET_REGISTERED
><br>This is fired whenever setup management of wallet is done.

```json
{
  "companyName" : "string",
}
```
