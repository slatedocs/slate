# Payments

## Depositing funds

Once an investor has completed the KYC checks and has optionally opened an ISA, they can deposit funds.
The Goji Platform creates a unique account number investor and they can distinguish between their general investment and
ISA account with the reference number.

Deposits sent via Faster Payments will be credited to their account within 90 seconds of the payment reaching our banking partner.

![](/images/payments/images/deposit-funds.png "")

## Withdrawals

An investor can withdraw cash to their personal account.
Withdrawal requests are typically processed immediately and funds should clear straight away.

The Goji Platform performs a series of checks to guard against potential money laundering   . On occasion a
withdrawal may be delayed until manual approval is given to process the transaction.

![](/images/payments/images/withdrawal.png "")

### Testing withdrawals

When testing withdrawals in the sandbox environment please make sure you use valid sort codes &
account numbers as these are validated to ensure they accept faster payments prior to being sent.

Below are some valid sample details you can use:


|Sort Code |   Account Number|
|-|-|
|203002  |  00004588|
|203002  |  00027944|
|204514  |  58110244|
|204514  |  60282377|
|166051  |  99993193|
|166051  |  87889196|

## `GET /investors/{clientId}/bankTransferDetails`

```http

GET /investors/{clientId}/bankTransferDetails HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "bankReference" : "bankReference",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}
```
### Description
Retrieve the bank details for depositing funds to the general investments account.
### Response
| Name          | Type   | Description                            |
| ------------- | ------ | -------------------------------------- |
| accountNumber | string | The account number.                    |
| sortCode      | string | The sort code.                         |
| bankReference | string | The reference to use for the transfer. |
## `GET /investors/{clientId}/bankTransferDetails/isa`

```http

GET /investors/{clientId}/bankTransferDetails/isa HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "bankReference" : "bankReference",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}
```
### Description
Retrieve the bank details for depositing funds to the ISA account.
### Response
| Name          | Type   | Description                            |
| ------------- | ------ | -------------------------------------- |
| accountNumber | string | The account number.                    |
| sortCode      | string | The sort code.                         |
| bankReference | string | The reference to use for the transfer. |
## `GET /investors/{clientId}/bankDetails`

```http

GET /investors/{clientId}/bankDetails HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}
```
### Description
Retrieve the investor's bank details.
### Response
| Name          | Type   | Description         |
| ------------- | ------ | ------------------- |
| accountNumber | string | The account number. |
| sortCode      | string | The sort code.      |
| accountName   | string | The account name.   |
## `PUT /investors/{clientId}/bankDetails`

```http

PUT /investors/{clientId}/bankDetails HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}
```
### Description
Replaces the investor's bank details.
### Request
| Name          | Type   | Description         | Required |
| ------------- | ------ | ------------------- | -------- |
| accountNumber | string | The account number. | required |
| sortCode      | string | The sort code.      | required |
| accountName   | string | The account name.   | required |
### Response
| Name          | Type   | Description         |
| ------------- | ------ | ------------------- |
| accountNumber | string | The account number. |
| sortCode      | string | The sort code.      |
| accountName   | string | The account name.   |
## `POST /investors/{clientId}/bankDetails`

```http

POST /investors/{clientId}/bankDetails HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}
```
### Description
Adds the investor's bank details.
### Request
| Name          | Type   | Description         | Required |
| ------------- | ------ | ------------------- | -------- |
| accountNumber | string | The account number. | required |
| sortCode      | string | The sort code.      | required |
| accountName   | string | The account name.   | required |
### Response
| Name          | Type   | Description         |
| ------------- | ------ | ------------------- |
| accountNumber | string | The account number. |
| sortCode      | string | The sort code.      |
| accountName   | string | The account name.   |
## `GET /investors/{clientId}/accounts/balances`

```http

GET /investors/{clientId}/accounts/balances HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalQueuedInvestedBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "accounts" : "{}",
  "totalCashBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalInvestedBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  }
}
```
### Description
Returns the investor's account balances.
### Response
| Name                                | Type   | Description                                                           |
| ----------------------------------- | ------ | --------------------------------------------------------------------- |
| totalBalance                        | ref    | The total balance. The sum of the invested, queued and cash balances. |
| totalBalance.amount                 | number | The amount.                                                           |
| totalBalance.currency               | string | The ISO 4217 three character codes eg 'GBP'                           |
| totalCashBalance                    | ref    | The total cash balance.                                               |
| totalCashBalance.amount             | number | The amount.                                                           |
| totalCashBalance.currency           | string | The ISO 4217 three character codes eg 'GBP'                           |
| totalQueuedInvestedBalance          | ref    | The total queued for investment.                                      |
| totalQueuedInvestedBalance.amount   | number | The amount.                                                           |
| totalQueuedInvestedBalance.currency | string | The ISO 4217 three character codes eg 'GBP'                           |
| totalInvestedBalance                | ref    | The total invested balance.                                           |
| totalInvestedBalance.amount         | number | The amount.                                                           |
| totalInvestedBalance.currency       | string | The ISO 4217 three character codes eg 'GBP'                           |
| accounts                            | object | A breakdown of the balances by account.                               |
## `GET /investors/{clientId}/accounts/balances/{accountType}`

```http

GET /investors/{clientId}/accounts/balances/{accountType} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "isaRemainingSubscriptionAmount" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalQueuedInvestedBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalInvestedBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  }
}
```
### Description
Returns the specified account balance.
### Response
| Name                                    | Type   | Description                                                                                              |
| --------------------------------------- | ------ | -------------------------------------------------------------------------------------------------------- |
| totalBalance                            | ref    | The total balance. The sum of the invested, queued and cash balances.                                    |
| totalBalance.amount                     | number | The amount.                                                                                              |
| totalBalance.currency                   | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalCashBalance                        | ref    | The total cash balance.                                                                                  |
| totalCashBalance.amount                 | number | The amount.                                                                                              |
| totalCashBalance.currency               | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalQueuedInvestedBalance              | ref    | The total queued for investment.                                                                         |
| totalQueuedInvestedBalance.amount       | number | The amount.                                                                                              |
| totalQueuedInvestedBalance.currency     | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalInvestedBalance                    | ref    | The total invested balance.                                                                              |
| totalInvestedBalance.amount             | number | The amount.                                                                                              |
| totalInvestedBalance.currency           | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| isaRemainingSubscriptionAmount          | ref    | The remaining amount of new funds that can be added to the ISA this tax year. null if not an ISA balance |
| isaRemainingSubscriptionAmount.amount   | number | The amount.                                                                                              |
| isaRemainingSubscriptionAmount.currency | string | The ISO 4217 three character codes eg 'GBP'                                                              |
## `POST /investors/{clientId}/accounts/{accountType}/withdrawal`

```http

POST /investors/{clientId}/accounts/{accountType}/withdrawal HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "reference" : "reference",
  "amount" : {
    "amount" : 2.68,
    "currency" : "currency"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "isaRemainingSubscriptionAmount" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalQueuedInvestedBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalInvestedBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  }
}
```
### Description
Withdraw cash from the specified account to the registered investor bank details.
### Request
| Name            | Type   | Description                                              | Required |
| --------------- | ------ | -------------------------------------------------------- | -------- |
| amount          | ref    | The amount of the residual income payment                | optional |
| amount.amount   | number | The amount.                                              ||
| amount.currency | string | The ISO 4217 three character codes eg 'GBP'              ||
| reference       | string | An optional reference to be used when withdrawing funds. | optional |
### Response
| Name                                    | Type   | Description                                                                                              |
| --------------------------------------- | ------ | -------------------------------------------------------------------------------------------------------- |
| totalBalance                            | ref    | The total balance. The sum of the invested, queued and cash balances.                                    |
| totalBalance.amount                     | number | The amount.                                                                                              |
| totalBalance.currency                   | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalCashBalance                        | ref    | The total cash balance.                                                                                  |
| totalCashBalance.amount                 | number | The amount.                                                                                              |
| totalCashBalance.currency               | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalQueuedInvestedBalance              | ref    | The total queued for investment.                                                                         |
| totalQueuedInvestedBalance.amount       | number | The amount.                                                                                              |
| totalQueuedInvestedBalance.currency     | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalInvestedBalance                    | ref    | The total invested balance.                                                                              |
| totalInvestedBalance.amount             | number | The amount.                                                                                              |
| totalInvestedBalance.currency           | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| isaRemainingSubscriptionAmount          | ref    | The remaining amount of new funds that can be added to the ISA this tax year. null if not an ISA balance |
| isaRemainingSubscriptionAmount.amount   | number | The amount.                                                                                              |
| isaRemainingSubscriptionAmount.currency | string | The ISO 4217 three character codes eg 'GBP'                                                              |
## `POST /investors/{clientId}/accounts/{accountType}/transfer`

```http

POST /investors/{clientId}/accounts/{accountType}/transfer HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "toAccount" : "GOJI_INVESTMENT",
  "amount" : {
    "amount" : 2.68,
    "currency" : "currency"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "isaRemainingSubscriptionAmount" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalQueuedInvestedBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "totalInvestedBalance" : {
    "amount" : 2.68,
    "currency" : "currency"
  }
}
```
### Description
Transfer cash to another account.
### Request
| Name            | Type   | Description                                              | Required |
| --------------- | ------ | -------------------------------------------------------- | -------- |
| toAccount       | string |  Possible values are: <br>`GOJI_INVESTMENT`<br>`ISA`<br> | optional |
| amount          | ref    |                                                          | optional |
| amount.amount   | number | The amount.                                              ||
| amount.currency | string | The ISO 4217 three character codes eg 'GBP'              ||
### Response
| Name                                    | Type   | Description                                                                                              |
| --------------------------------------- | ------ | -------------------------------------------------------------------------------------------------------- |
| totalBalance                            | ref    | The total balance. The sum of the invested, queued and cash balances.                                    |
| totalBalance.amount                     | number | The amount.                                                                                              |
| totalBalance.currency                   | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalCashBalance                        | ref    | The total cash balance.                                                                                  |
| totalCashBalance.amount                 | number | The amount.                                                                                              |
| totalCashBalance.currency               | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalQueuedInvestedBalance              | ref    | The total queued for investment.                                                                         |
| totalQueuedInvestedBalance.amount       | number | The amount.                                                                                              |
| totalQueuedInvestedBalance.currency     | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| totalInvestedBalance                    | ref    | The total invested balance.                                                                              |
| totalInvestedBalance.amount             | number | The amount.                                                                                              |
| totalInvestedBalance.currency           | string | The ISO 4217 three character codes eg 'GBP'                                                              |
| isaRemainingSubscriptionAmount          | ref    | The remaining amount of new funds that can be added to the ISA this tax year. null if not an ISA balance |
| isaRemainingSubscriptionAmount.amount   | number | The amount.                                                                                              |
| isaRemainingSubscriptionAmount.currency | string | The ISO 4217 three character codes eg 'GBP'                                                              |
## `POST /wallet/company/registration`
```http
POST /wallet/company/registration HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "profile": {
    "companyName": "companyName",
    "address": {
      "country": "country",
      "poBox": "poBox",
      "careOf": "careOf",
      "postalCode": "postalCode",
      "locality": "locality",
      "addressLine1": "addressLine1",
      "addressLine2": "addressLine2",
      "region": "region"
    },
    "type": "type",
    "companyNumber": "companyNumber",
    "sicCodes": [
      "sicCode"
    ]
  },
  "officerList": {
    "items": [
      {
        "officerRole": "officerRole",
        "firstName": "firstName",
        "lastName": "lastName",
        "emailAddress": "emailAddress",
        "address": {
          "country": "country",
          "poBox": "poBox",
          "careOf": "careOf",
          "postalCode": "postalCode",
          "locality": "locality",
          "addressLine1": "addressLine1",
          "addressLine2": "addressLine2",
          "region": "region"
        },
        "phoneNumber": "phoneNumber",
        "resignedOn": "resignedOn",
        "dateOfBirth": "1970-03-29",
        "countryOfResidence": "countryOfResidence",
        "appointedOn": "appointedOn",
        "percentageOwnership": 12
      }
    ]
  }
}

HTTP/1.1 200 OK
Content-Type: application/json
""
```
### Description
Register a corporate for wallet management
### Request
| Name                                        | Type   | Description                                    | Required |
| ------------------------------------------- | ------ | ---------------------------------------------- | -------- |
| profile                                     | ref    |                                                | required |
| profile.companyName                         | string | Company Name                                   | required |
| profile.type                                | string | Company Type                                   | required |
| profile.companyNumber                       | string | Company Number                                 | required |
| profile.sicCodes                            | array  | Standard industrial classification (sic) codes | required |
| profile.address                             | ref    |                                                | required |
| profile.address.addressLine1                | string | Address Line 1                                 | required |
| profile.address.addressLine2                | string | Address Line 2                                 | required |
| profile.address.careOf                      | string | Care Of                                        | required |
| profile.address.country                     | string | Country                                        | required |
| profile.address.locality                    | string | Locality                                       | required |
| profile.address.poBox                       | string | Po Box                                         | required |
| profile.address.postalCode                  | string | Postal Code                                    | required |
| profile.address.region                      | string | Region                                         | required |
| officerList                                 | ref    |                                                | required |
| officerList.items                           | array  | Officers                                       | required |
| officerList.items.appointedOn               | string |                                                | required |
| officerList.items.countryOfResidence        | string |                                                | required |
| officerList.items.dateOfBirth               | string | ISO-8601 format date                           | required |
| officerList.items.firstName                 | string |                                                | required |
| officerList.items.lastName                  | string |                                                | required |
| officerList.items.resignedOn                | string |                                                | |
| officerList.items.officerRole               | string |                                                | required |
| officerList.items.emailAddress              | string |                                                | required |
| officerList.items.phoneNumber               | string |                                                | required |
| officerList.items.percentageOwnership       | number |                                                | required |
| officerList.items.address                   | ref    |                                                | required |
| officerList.items.address.addressLine1      | string | Address Line 1                                 | required |
| officerList.items.address.addressLine2      | string | Address Line 2                                 | required |
| officerList.items.address.careOf            | string | Care Of                                        | required |
| officerList.items.address.country           | string | Country                                        | required |
| officerList.items.address.locality          | string | Locality                                       | required |
| officerList.items.address.poBox             | string | Po Box                                         | required |
| officerList.items.address.postalCode        | string | Postal Code                                    | required |
| officerList.items.address.region            | string | Region                                         | required |

## `POST /wallet`
```http

POST /wallet HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "walletName" : "Housing Project 22"
}

HTTP/1.1 202 OK
Content-Type: application/json

{
  "id" : "3d9ca033-eb05-459f-9f70-1139d2e2b213"
}
```
<aside class="notice">
Prior to creating a wallet you need to have registered your company as the wallet holder using /wallet/company/registration
</aside>
### Description
Create a wallet
### Request
| Name       | Type   | Description     | Required |
| ---------- | ------ | --------------- | -------- |
| walletName | string | New wallet name | required |

### Response
| Name       | Type   | Description
| ---------- | ------ | ---------------
| id | string | The unique identifier for the created wallet
## `GET /wallet/{id}`
```http

GET /wallet/{id} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "bankAccountDetailsId" : "bankAccountDetailsId",
  "originatorId" : "originatorId"
}
```
### Description
Wallet Details
### Response
| Name                 | Type   | Description                                   |
| -------------------- | ------ | --------------------------------------------- |
| originatorId         | string | The originator ID registered for the wallet . |
| bankAccountDetailsId | string | The bank account details ID                   |
## `DELETE /wallet/{id}`

```http

DELETE /wallet/{id} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

""

HTTP/1.1 200 OK
Content-Type: application/json

{
  "bankAccountDetailsId" : "bankAccountDetailsId",
  "originatorId" : "originatorId"
}
```
### Description
Delete wallet
### Response
| Name                 | Type   | Description                                   |
| -------------------- | ------ | --------------------------------------------- |
| originatorId         | string | The originator ID registered for the wallet . |
| bankAccountDetailsId | string | The bank account details ID                   |
## `POST /wallet/{id}/payment`
```http

POST /wallet/{id}/payment HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "destinationBankAccountId" : "walletName",
  "amount" : {
    "amount" : 10.45,
    "currency" : "GBP"
  },
  "reference" : "reference",
  "narrative" : "narrative"
}

HTTP/1.1 202 OK
Content-Type: application/json

""
```
### Description
Create a payment instruction from a wallet
### Request
| Name       | Type   | Description     | Required |
| ---------- | ------ | --------------- | -------- |
| destinationBankAccountId | string | The ID of the destination bank account | required |
| amount                        | ref    | The total cash balance.                     | required |
| amount.amount                 | number | The amount.                                 | required |
| amount.currency               | string | The ISO 4217 three character codes eg 'GBP' | required |
| reference                     | string | The bank reference used for the transfer    | required |
| narrative                     | string | The reason for the wallet transfer          |

## `GET /wallet/{id}/transactions`

```http

GET /wallet/{id}/transactions HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "id": "id",
    "amount": {
      "amount": 123.50,
      "currency": "GBP"
    },
    "type": "type",
    "status": "PENDING",
    "reference": "reference",
    "narrative": "Solicitor Fees",
    "createdDateTime": "2019-01-01T12:33:00Z",
    "clearedDateTime": "2019-01-01T12:33:30Z"
  }
]

```
### Description
Retrieve a list of transactions for a given wallet.
### Response
| Name                 | Type   | Description                                   |
| -------------------- | ------ | --------------------------------------------- |
| id         | string | The id of the transaction |
| amount                        | ref    | The total cash balance.                     |
| amount.amount                 | number | The amount.                                 |
| amount.currency               | string | The ISO 4217 three character codes eg 'GBP' |
| type                          | string | The type of wallet instruction              |
| status                        | string | The status of the wallet transfer. PENDING, CLEARED |
| reference                     | string | The bank reference used for the transfer    |
| narrative                     | string | The reason for the wallet transfer          |
| createdDateTime               | date/time | The date / time the transaction was created          |
| clearedDateTime               | date/time | The date / time the transaction was cleared          |
## `GET /bankAccountDetails`
```http

GET /bankAccountDetails HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
List of bank accounts we hold in the system for sending money to.
## `POST /bankAccountDetails`

```http

POST /bankAccountDetails HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
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
Create a set of bank details.
### Request
| Name          | Type   | Description         | Required |
| ------------- | ------ | ------------------- | -------- |
| accountNumber | string | The account number. | required |
| sortCode      | string | The sort code.      | required |
| accountName   | string | The account name.   | required |
### Response
| Name | Type   | Description          |
| ---- | ------ | -------------------- |
| id   | string | The bank account ID. |
## `GET /bankAccountDetails/{id}`

```http

GET /bankAccountDetails/{id} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "accountName" : "accountName",
  "id" : "id",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode",
  "status" : "status"
}
```
### Description
Get a specific bank account we hold in the system for sending money to.
### Response
| Name          | Type   | Description                                |
| ------------- | ------ | ------------------------------------------ |
| id            | string | The bank account details ID.               |
| accountNumber | string | The account number.                        |
| sortCode      | string | The sort code.                             |
| accountName   | string | The account name.                          |
| status        | string | Whether or not the account has passed AML. |
## `PUT /bankAccountDetails/{id}`

```http

PUT /bankAccountDetails/{id} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Updates a specific set of stored account details. This will trigger an AML check.
### Request
| Name          | Type   | Description         | Required |
| ------------- | ------ | ------------------- | -------- |
| accountNumber | string | The account number. | required |
| sortCode      | string | The sort code.      | required |
| accountName   | string | The account name.   | required |

## `POST /test/payment`

```http

POST /test/payment HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "amount" : {
    "amount" : 2.68,
    "currency" : "currency"
  },
  "clientId" : "clientId",
  "paymentReference" : "paymentReference",
  "paymentType" : "paymentType"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Simulate depositing cash in an investor's account.

<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>

### Request
| Name             | Type   | Description                                                                   | Required |
| ---------------- | ------ | ----------------------------------------------------------------------------- | -------- |
| amount           | ref    | The amount to deposit.                                                        | required |
| amount.amount    | number | The amount.                                                                   ||
| amount.currency  | string | The ISO 4217 three character codes eg 'GBP'                                   ||
| paymentReference | string | The reference. Set to ISA if the funds should be credited to the ISA account. | required |
| paymentType      | string | Should be set to DEPOSIT                                                      | required |
| clientId         | string | The client ID                                                                 | required |
