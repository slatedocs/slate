# Payments

## GET /investors/{clientId}/bankTransferDetails

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
## GET /investors/{clientId}/bankTransferDetails/isa

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
## GET /investors/{clientId}/bankDetails

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
## PUT /investors/{clientId}/bankDetails

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
## POST /investors/{clientId}/bankDetails

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
## GET /investors/{clientId}/accounts/balances

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
## GET /investors/{clientId}/accounts/balances/{accountType}

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
## POST /investors/{clientId}/accounts/{accountType}/withdrawal

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
## POST /investors/{clientId}/accounts/{accountType}/transfer

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
| Name            | Type   | Description                                 | Required |
| --------------- | ------ | ------------------------------------------- | -------- |
| toAccount       | string |                                             | optional |
| amount          | ref    |                                             | optional |
| amount.amount   | number | The amount.                                 ||
| amount.currency | string | The ISO 4217 three character codes eg 'GBP' ||
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
## POST /wallet

```http

POST /wallet HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "walletName" : "walletName"
}

HTTP/1.1 202 OK
Content-Type: application/json

""
```
### Description
Create a wallet
### Request
| Name       | Type   | Description     | Required |
| ---------- | ------ | --------------- | -------- |
| walletName | string | New wallet name | required |
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /wallet/{id}

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
## DELETE /wallet/{id}

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
### Request
| Name | Type | Description | Required || ---- | ---- | ----------- | -------- |

### Response
| Name                 | Type   | Description                                   |
| -------------------- | ------ | --------------------------------------------- |
| originatorId         | string | The originator ID registered for the wallet . |
| bankAccountDetailsId | string | The bank account details ID                   |
## POST /wallet/company/registration

```http

POST /wallet/company/registration HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "companyProfile" : {
    "sicCodes" : [ "sicCodes", "sicCodes" ],
    "address" : {
      "country" : "country",
      "poBox" : "poBox",
      "careOf" : "careOf",
      "postalCode" : "postalCode",
      "locality" : "locality",
      "addressLine1" : "addressLine1",
      "addressLine2" : "addressLine2",
      "region" : "region"
    },
    "companyNumber" : "companyNumber",
    "companyName" : "companyName",
    "type" : "type"
  },
  "officerList" : {
    "officers" : [ {
      "officerRole" : "officerRole",
      "firstName" : "firstName",
      "lastName" : "lastName",
      "emailAddress" : "emailAddress",
      "address" : {
        "country" : "country",
        "poBox" : "poBox",
        "careOf" : "careOf",
        "postalCode" : "postalCode",
        "locality" : "locality",
        "addressLine1" : "addressLine1",
        "addressLine2" : "addressLine2",
        "region" : "region"
      },
      "phoneNumber" : "phoneNumber",
      "resignedOn" : "resignedOn",
      "dateOfBirth" : "dateOfBirth",
      "countryOfResidence" : "countryOfResidence",
      "appointedOn" : "appointedOn"
    }, {
      "officerRole" : "officerRole",
      "firstName" : "firstName",
      "lastName" : "lastName",
      "emailAddress" : "emailAddress",
      "address" : {
        "country" : "country",
        "poBox" : "poBox",
        "careOf" : "careOf",
        "postalCode" : "postalCode",
        "locality" : "locality",
        "addressLine1" : "addressLine1",
        "addressLine2" : "addressLine2",
        "region" : "region"
      },
      "phoneNumber" : "phoneNumber",
      "resignedOn" : "resignedOn",
      "dateOfBirth" : "dateOfBirth",
      "countryOfResidence" : "countryOfResidence",
      "appointedOn" : "appointedOn"
    } ]
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Register a corporate for wallet management
### Request
| Name                         | Type   | Description                                    | Required |
| ---------------------------- | ------ | ---------------------------------------------- | -------- |
| companyProfile               | ref    |                                                | required |
| companyProfile.companyName   | string | Company Name                                   ||
| address.addressLine1         | string | Address Line 1                                 ||
| address.addressLine2         | string | Address Line 2                                 ||
| address.careOf               | string | Care Of                                        ||
| address.country              | string | Country                                        ||
| address.locality             | string | Locality                                       ||
| address.poBox                | string | Po Box                                         ||
| address.postalCode           | string | Postal Code                                    ||
| address.region               | string | Region                                         ||
| companyProfile.type          | string | Company type                                   ||
| companyProfile.companyNumber | string | Company Number                                 ||
| companyProfile.sicCodes      | array  | standard industrial classification (sic) codes ||
| officerList                  | ref    |                                                | required |
| officerList.officers         | array  | Officers                                       ||
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /bankAccountDetails

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
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /bankAccountDetails

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
## GET /bankAccountDetails/{id}

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
## PUT /bankAccountDetails/{id}

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
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /test/payment

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
### Request
| Name             | Type   | Description                                                                   | Required |
| ---------------- | ------ | ----------------------------------------------------------------------------- | -------- |
| amount           | ref    | The amount to deposit.                                                        | required |
| amount.amount    | number | The amount.                                                                   ||
| amount.currency  | string | The ISO 4217 three character codes eg 'GBP'                                   ||
| paymentReference | string | The reference. Set to ISA if the funds should be credited to the ISA account. | required |
| paymentType      | string | Should be set to DEPOSIT                                                      | required |
| clientId         | string | The client ID                                                                 | required |
### Response
| Name | Type | Description || ---- | ---- | ----------- |
