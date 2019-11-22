# Payments - Manager

### Testing outbound payments

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


## `POST /platformApi/wallet/company/registration`
```http
POST /platformApi/wallet/company/registration HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "profile": {
    "companyName": "Company Name",
    "address": {
      "country": "UK",
      "poBox": "poBox",
      "careOf": "careOf",
      "postalCode": "AB12CD",
      "locality": "locality",
      "addressLine1": "addressLine1",
      "addressLine2": "addressLine2",
      "region": "region"
    },
    "type": "ltd",
    "companyNumber": "10965535",
    "sicCodes": [
      "80900"
    ]
  },
  "officerList": {
    "items": [
      {
        "officerRole": "director",
        "firstName": "Name",
        "lastName": "Surename",
        "emailAddress": "example@example.com",
        "address": {
          "country": "UK",
          "poBox": "poBox",
          "careOf": "careOf",
          "postalCode": "AB12CD",
          "locality": "UK",
          "addressLine1": "addressLine1",
          "addressLine2": "addressLine2",
          "region": "region"
        },
        "phoneNumber": "07512345678",
        "resignedOn": "resignedOn",
        "dateOfBirth": "1980-01-30",
        "countryOfResidence": "countryOfResidence",
        "appointedOn": "1999-01-30",
        "percentageOwnership": 99
      }
    ]
  }
}

```

```http 
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

## `POST /platformApi/wallet`
```http

POST /platformApi/wallet HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "walletName" : "Housing Project 22"
}

```

```http 
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

## `GET /platformApi/wallet/{id}`
```http

GET /platformApi/wallet/{id} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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

## `GET /platformApi/wallet/{id}/balance`

```http

GET /platformApi/wallet/{id}/balance HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "walletId" : "walletId",
  "balance" : {
    "amount" : 10.45,
    "currency" : "GBP"
  }
}
```
### Description
Get the total balance for a wallet
### Response
| Name                 | Type   | Description                                   |
| -------------------- | ------ | --------------------------------------------- |
| walletId             | string | The ID of the wallet                          |
| balance              | ref    | The total cash balance for the wallet         |
| balance.amount       | number | The amount.                                   |
| balance.currency     | string | The ISO 4217 three character codes eg 'GBP'   |

## `POST /platformApi/wallet/{id}/payment`
```http

POST /platformApi/wallet/{id}/payment HTTP/1.1
Host: api-sandbox.goji.investments
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

```

```http 
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

## `GET /platformApi/wallet/{id}/transactions`

```http

GET /platformApi/wallet/{id}/transactions HTTP/1.1
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
