# Payments - Manager

## Testing outbound payments

When testing outbound payments in the sandbox environment please make sure you use valid sort codes &
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

## *Managing Payment Destinations*

## `GET /platformApi/bankAccountDetails`
```http

GET /platformApi/bankAccountDetails HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "id" : "id",
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode",
  "status" : "status"
} ]
```
### Description
List of bank accounts we hold in the system for sending money to.
### Response
| Name             | Type   | Description                                |
| ---------------- | ------ | ------------------------------------------ |
| [].id            | string | The bank account details ID.               |
| [].accountNumber | string | The account number.                        |
| [].sortCode      | string | The sort code.                             |
| [].accountName   | string | The account name.                          |
| [].status        | string | Whether or not the account has passed AML. Possible values are: <br>`ENABLED`<br>`DISABLED` |

## `POST /platformApi/bankAccountDetails`

```http

POST /platformApi/bankAccountDetails HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}

```

```http 
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

## `GET /platformApi/bankAccountDetails/{id}`

```http

GET /platformApi/bankAccountDetails/{id} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
```

```http 
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

## `PUT /platformApi/bankAccountDetails/{id}`

```http

PUT /platformApi/bankAccountDetails/{id} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "accountName" : "accountName",
  "accountNumber" : "accountNumber",
  "sortCode" : "sortCode"
}

```

```http 
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

## *Registering Companies as Wallet Holders*

## `POST /companies🚧`
```http
POST /companies HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "ukCompany": {
    "number": "00000000",
    "name": "Fake Company LIMITED"
  }
}
```

```http 
HTTP/1.1 201 Created
Content-Type: application/json
{
  "partyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502",
  "status": "PENDING",
  "ukCompany": {
    "number": "00000000",
    "name": "Fake Company LIMITED"
  }
}
```
### Description

Register a company with the Goji Platform.  This allows the company to own Wallets, and send/receive money through them.

The registration process is asynchronous.  When this API is first called, the `status` returned will be `PENDING`. A 
`COMPANY_REGISTRATION_UPDATE` webhook will be used to notify completion of the registration.

The registration process is partially manual, so the webhook will be dispatched significantly later than the API call, 
so do not assume the webhook will arrive shortly after the API call. 

### Request
| Name              | Type   | Description                                        | Required |
| ----------------- | ------ | -------------------------------------------------- | -------- |
| ukCompany.number  | string | The Company Number registered with Companies House.| required |
| ukCompany.name    | string | Company Name.                                      | required |

### Response
| Name              | Type   | Description                                        |
| ----------------- | ------ | -------------------------------------------------- |
| partyId           | string | The Party ID for this company.                     |
| status            | string | Enum: PENDING, REGISTERED.                         |
| ukCompany.number  | string | The Company Number registered with Companies House.|
| ukCompany.name    | string | Company Name.                                      |

## `GET /companies🚧`
```http
GET /companies HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "partyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502"
    "ukCompany": {
      "number": "00000000",
      "name": "Fake Company LIMITED"
    }
  },
  {
    "partyId": "COM~0176cb07-30ba-4802-ab4a-b0835222cf5b"
    "ukCompany": {
      "number": "00000001",
      "name": "Other Fake Company LIMITED"
    }
  }
]
```
### Description

Retrieves all companies that have been registered.

### Response
| Name              | Type   | Description                                        |
| ----------------- | ------ | -------------------------------------------------- |
| partyId           | string                                                      |
| ukCompany.number  | string | The Company Number registered with Companies House.|
| ukCompany.name    | string | Company Name                                       |

## `GET /companies/{id} 🚧`
```http
GET /companies/COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502 HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "partyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502"
  "ukCompany": {
    "number": "00000000",
    "name": "Fake Company LIMITED"
  }
}
```
### Description

Retrieve details of a single company.

### Response
| Name              | Type   | Description                                        |
| ----------------- | ------ | -------------------------------------------------- |
| partyId           | string | Party ID for the company                           |
| ukCompany.number  | string | The Company Number registered with Companies House.|
| ukCompany.name    | string | Company Name                                       |

## *Managing Wallets*


## `POST /wallets 🚧`
```http

POST /wallets HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "ownerPartyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502",
  "walletName" : "Housing Project 22"
}

```

```http 
HTTP/1.1 202 Accepted
Content-Type: application/json

{
  "id" : "3d9ca033-eb05-459f-9f70-1139d2e2b213",
  "ownerPartyId": "COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502",
  "walletName" : "Housing Project 22"
}
```

ℹ️ _Prior to creating a Wallet, the company who owns the money in the Wallet must be registered using [`POST /companies`](#payments-manager-post-companies)_

### Description
Creates a Wallet. The Wallet creation will not happen immediately. The `WALLET_CREATED` webhook will be used to notify
you of the Wallet creation completing, including the Bank Account Number and Sort Code.

### Request
| Name         | Type   | Description                           | Required |
| ------------ | ------ | ------------------------------------- | -------- |
| ownerPartyId | string | The PartyId that will own the Wallet. | required |
| walletName   | string | New wallet name                       | required |

### Response
| Name         | Type   | Description                           |
| ------------ | ------ | ------------------------------------- |
| id           | string | The unique identifier for the Wallet. |
| ownerPartyId | string | The PartyId that will own the Wallet. |
| walletName   | string | Wallet name.                          |


## `GET /wallets 🚧`
```http

GET /wallets HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "id" : "walletId",
    "bankAccountDetailsId" : "bankAccountDetailsId",
    "bankDetails" : {
      "accountName": "Housing Project 22",
      "accountNumber": "00000000",
      "sortCode": "000000"
    },
    "balance" : {
      "currency" : "GBP"
      "amount" : 10.45
    }
  }
]
```
### Description
List of wallet details
### Response
| Name                        | Type   | Description                                      |
| --------------------------- | ------ | ------------------------------------------------ |
| id                          | string | The ID of the wallet                             |
| bankAccountDetailsId        | string | The bank account details ID                      |
| bankDetails                 | ref    | The bank details for the wallet                  |
| bankDetails.accountName     | string | The account name for use when depositing money   |
| bankDetails.accountNumber   | string | The account number to use when depositing money  |
| bankDetails.sortCode        | string | The sort code to use when depositing money       |
| balance                     | ref    | The total cash balance for the wallet            |
| balance.amount              | number | The amount.                                      |
| balance.currency            | string | The ISO 4217 three character codes eg 'GBP'      |

## `GET /wallets/{id} 🚧`
```http

GET /wallets/3d9ca033-eb05-459f-9f70-1139d2e2b213 HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id" : "3d9ca033-eb05-459f-9f70-1139d2e2b213",
  "bankAccountDetailsId" : "bankAccountDetailsId",
  "bankDetails" : {
    "accountName": "Housing Project 22",
    "accountNumber": "00000000",
    "sortCode": "000000"
  },
  "balance" : {
    "amount" : 10.45,
    "currency" : "GBP"
  }
}
```
### Description
Wallet Details
### Response
| Name                        | Type   | Description                                      |
| --------------------------- | ------ | ------------------------------------------------ |
| id                          | string | The ID of the wallet                             |
| bankAccountDetailsId        | string | The bank account details ID                      |
| bankDetails                 | ref    | The bank details for the wallet                  |
| bankDetails.accountName     | string | The account name for use when depositing money   |
| bankDetails.accountNumber   | string | The account number to use when depositing money  |
| bankDetails.sortCode        | string | The sort code to use when depositing money       |
| balance                     | ref    | The total cash balance for the wallet            |
| balance.amount              | number | The amount.                                      |
| balance.currency            | string | The ISO 4217 three character codes eg 'GBP'      |


## `POST /wallets/{id}/payment 🚧`
```http

POST /wallets/{id}/payment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "destinationBankAccountId" : "03946a54-6b4f-4bae-897d-6ee2baf0e848",
  "amount" : {
    "currency" : "GBP",
    "amount" : 10.45
  },
  "reference" : "ABC1234567",
  "narrative" : "Moving to operating account"
}

```

```http 
HTTP/1.1 202 Accepted
Content-Type: application/json

```
### Description
Create a payment instruction from a wallet.  Before instructing a payment, the destination bank account
must first be registered using [`POST /platformApi/bankAccountDetails`](/#payments-manager-post-platformapi-bankaccountdetails).

### Request
| Name                          | Type   | Description                                 | Required |
| ----------------------------- | ------ | ------------------------------------------- | -------- |
| destinationBankAccountId      | string | The ID of the destination bank account      | required |
| amount                        | ref    | The total cash balance.                     | required |
| amount.amount                 | number | The amount.                                 | required |
| amount.currency               | string | The ISO 4217 three character codes eg 'GBP' | required |
| reference                     | string | The bank reference used for the transfer    | required |
| narrative                     | string | The reason for the wallet transfer          |          |

## `GET /wallets/{id}/transactions/year/{year}/month/{month} 🚧`

```http

GET /wallets/{id}/transactions/year/{year}/month/{month} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

```

```http 
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
    "clearedDateTime": "2019-01-01T12:33:30Z",
    "associatedBankDetails" : {
      "accountName": "accountName",
      "accountNumber": "accountNumber",
      "sortCode": "sortCode"
    }
  }
]

```
### Description

Retrieve a list of transactions for a given wallet for a given year and month.

### Response
| Name                                    | Type      | Description                                          |
| --------------------------------------- | --------- | ---------------------------------------------------- |
| id                                      | string    | The id of the transaction                            |
| amount                                  | ref       | The total cash balance.                              |
| amount.amount                           | number    | The amount.                                          |
| amount.currency                         | string    | The ISO 4217 three character codes eg 'GBP'          |
| type                                    | string    | The type of wallet instruction                       |
| status                                  | string    | The status of the wallet transfer. PENDING, CLEARED  |
| reference                               | string    | The bank reference used for the transfer             |
| narrative                               | string    | The reason for the wallet transfer                   |
| createdDateTime                         | date/time | The date / time the transaction was created          |
| clearedDateTime                         | date/time | The date / time the transaction was cleared          |
| associatedBankDetails                   | ref       | The bank details for the wallet                      |
| associatedBankDetails.accountName       | string    | The account name related to the transaction          |
| associatedBankDetails.accountNumber     | string    | The account number related to the transaction        |
| associatedBankDetails.sortCode          | string    | The sort code related to the transaction             |
