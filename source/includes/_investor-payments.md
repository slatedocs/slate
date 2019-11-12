# Investor Payments

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

## `GET /platformApi/investors/{clientId}/accounts/balances`

```http

GET /platformApi/investors/{clientId}/accounts/balances HTTP/1.1
Host: api-sandbox.goji.investments
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

## `GET /platformApi/investors/{clientId}/accounts/balances/{accountType}`

```http

GET /platformApi/investors/{clientId}/accounts/balances/{accountType} HTTP/1.1
Host: api-sandbox.goji.investments
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

## `GET /platformApi/investors/{clientId}/transactions`

```http

GET /platformApi/investors/{clientId}/transactions HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "dateTime" : "dateTime",
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "id" : "id",
  "type" : "DEPOSIT",
  "account" : "account",
  "status" : "CLEARED"
} ]
```
### Description
Retrieves a list of cash transactions associated with a given investor.
### Response
| Name                        | Type   | Description                                             |
| --------------------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [].id                       | string | The ID of the cash transaction                          |
| [].dateTime                 | string | The datetime the cash transaction occurred              |
| [].amount                   | ref    | The total amount involved in the cash transaction       |
| [].amount.amount            | number | The amount                                              |
| [].amount.currency          | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].type                     | string | The transaction type Possible values are: <br>`DEPOSIT`<br>`BONUS`<br>`WITHDRAWAL`<br>`INVESTMENT`<br>`CANCELLED_INVESTMENT`<br>`TRANSFER_INVESTMENT_OUT`<br>`TRANSFER_INVESTMENT_IN`<br>`INTEREST_REPAYMENT`<br>`CAPITAL_REPAYMENT`<br>`FEES`<br>`WITHHOLDING_TAX`<br>`ACCOUNT_TRANSFER_IN`<br>`ACCOUNT_TRANSFER_OUT`<br>`ISA_TRANSFER_IN`<br>`ISA_TRANSFER_IN_RESIDUAL_INCOME`<br>`ISA_TRANSFER_IN_REPAIR`<br>`ISA_TRANSFER_IN_REPAIR_DEDUCTION_FROM_ISA`<br>`ISA_TRANSFER_OUT`<br>`SIPP_TRANSFER_IN`<br>`BUY_PREMIUM`<br>`SELL_PREMIUM`<br> |
| [].cashBalance              | ref    | The cash balance                                        |
| [].cashBalance.amount       | number | The amount                                              |
| [].cashBalance.currency     | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].investedBalance          | ref    | The invested balance                                    |
| [].investedBalance.amount   | number | The amount                                              |
| [].investedBalance.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].totalBalance             | ref    | The total balance                                       |
| [].totalBalance.amount      | number | The amount                                              |
| [].totalBalance.currency    | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].account                  | string | The transaction account                                 |
| [].status                   | string | The transaction status Possible values are: <br>`ASSIGNED`<br>`PENDING`<br>`CLEARED`<br>                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

## `GET /platformApi/investors/{clientId}/bankTransferDetails`

```http

GET /platformApi/investors/{clientId}/bankTransferDetails HTTP/1.1
Host: api-sandbox.goji.investments
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

## `GET /platformApi/investors/{clientId}/bankTransferDetails/isa`

```http

GET /platformApi/investors/{clientId}/bankTransferDetails/isa HTTP/1.1
Host: api-sandbox.goji.investments
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

## `GET /platformApi/investors/{clientId}/bankDetails`

```http

GET /platformApi/investors/{clientId}/bankDetails HTTP/1.1
Host: api-sandbox.goji.investments
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
Retrieve the investor's withdrawal bank details.
### Response
| Name          | Type   | Description         |
| ------------- | ------ | ------------------- |
| accountNumber | string | The account number. |
| sortCode      | string | The sort code.      |
| accountName   | string | The account name.   |

## `POST /platformApi/investors/{clientId}/bankDetails`

```http

POST /platformApi/investors/{clientId}/bankDetails HTTP/1.1
Host: api-sandbox.goji.investments
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
Sets the investor's withdrawal bank details for the first time.
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

## `PUT /platformApi/investors/{clientId}/bankDetails`

```http

PUT /platformApi/investors/{clientId}/bankDetails HTTP/1.1
Host: api-sandbox.goji.investments
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
Updates the investor's withdrawal bank details.
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

## `POST /platformApi/investors/{clientId}/accounts/{accountType}/withdrawal`

```http

POST /platformApi/investors/{clientId}/accounts/{accountType}/withdrawal HTTP/1.1
Host: api-sandbox.goji.investments
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

""
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
## `POST /platformApi/investors/{clientId}/accounts/{accountType}/transfer`

```http

POST /platformApi/investors/{clientId}/accounts/{accountType}/transfer HTTP/1.1
Host: api-sandbox.goji.investments
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

## `POST /platformApi/test/payment`

```http

POST /platformApi/test/payment HTTP/1.1
Host: api-sandbox.goji.investments
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
