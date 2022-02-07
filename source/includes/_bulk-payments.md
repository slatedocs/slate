## <em>Bulk Payments</em>

The Bulk Payments API allows an Investment Manager to specify a total amount of funds to distribute amongst their 
individual investors.

## Batch Payments 

The [`POST /transfers/batch`](/#payments-manager-post-transfers-batch) endpoint can be used to 
transfer money to multiple investors.

Said endpoint references a `totalPayout` amount, and takes a list of all the investors and the amount each is due to be paid.

The call to [`POST /transfers/batch`](/#payments-manager-post-transfers-batch) will return a 201 Created response
with a `status` field in the body of `AWAITING_FUNDS`.

⚠️ Please note that this response only indicates that the batch payment instruction has been received. 
The distribution of the batch to investors will not occur until the necessary funds are received. 

The response will include a payTo section. Payment should be sent to the bank details specified, including the `payTo.reference`.

Once payment has been made, the [`GET /transfers/batch/{batchId}`](/#payments-manager-get-transfers-batch-batchid) 
endpoint can be used to see the current status of the batch payment instruction.

The status of the money transfer is further broken down at a per investor level. 

On batch state update, a webhook will be fired that will contain the batch details with a summary of all payments. 
For full details of the batch payments, call [`GET /transfers/batch/{batchId}`](/#payments-manager-get-transfers-batch-batchid).

## Batch Model

### Required Attributes

| Key                          | JSON Type | Value Type | Value Description                                                            |
|------------------------------|-----------|------------|------------------------------------------------------------------------------|
| batchId                      | String    | BatchId    | The platform generated UUID of the batch payment posting.                    |
| type                         | String    | Enum       | The type of batch payment. Values: `MIGRATION`, `BONUS`, `CARD_PAYMENTS`     |
| status                       | String    | Enum       | Response Only. Values: `AWAITING_FUNDS`, `DISTRIBUTING`, `COMPLETE`.         |
| totalPayout.amount           | Number    | Number     | The total amount to be paid out to investors.                                |
| totalPayout.currency         | String    | ISO 4217   | The currency that the `totalPayout.currency` is in.                          |
| payments[]                   | Array     | Object     | The list of payments to be made as part of this batch instruction.           |
| payments[].clientId          | String    | Object     | The clientId of the investor associated with this individual payment.        |
| payments[] .accountType      | String    | Enum       | The client's account to pay to. Values: `GOJI_INVESTMENT`, `ISA`.            |
| payments[] .amount.currency  | String    | ISO 4217   | The currency associated with a `payments[].amount.amount`.                   |
| payments[] .amount.amount    | Number    | Number     | The total amount to be paid to this investor.                                |


### Optional Attributes

| Key                          | JSON Type | Value Type | Value Description                                                           |
|------------------------------|-----------|------------|-----------------------------------------------------------------------------|
| payments[].sourceOfFunds     | Object    | Object     | Optional but inclusion preferred. The client's active bank account details. |
| sourceOfFunds.accountName    | String    | String     | The investor's bank account name.                                           |
| sourceOfFunds.accountNumber  | String    | String     | The client's bank account number.                                           |
| sourceOfFunds.sortCode       | String    | String     | The client's bank account sort code.                                        |
| payments[].status            | String    | Enum       | Response Only. Values: `PENDING`, `DISTRIBUTED`, `RECEIVED`, `FAILED`.              |
| payTo.accountName            | String    | String     | Response Only. The name of the account to send payment to.                  |
| payTo.accountNumber          | String    | String     | Response Only. The account number to send payment to.                       |
| payTo.sortCode               | String    | String     | Response Only. The sort code to send payment to.                            |
| payTo.reference              | String    | String     | Response Only. The reference to use when sending payment.                   |


## `POST /transfers/batch`
```http
POST /transfers/batch HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "batchId": "4d8af0f8-26a1-4e06-bb1e-8225d1e36e2b",
  "type": "MIGRATION",
  "totalPayout": {
    "amount": 5000,
    "currency": "GBP"
  },
  "payments": [
    {
      "clientId": "clientId",
      "accountType": "GOJI_INVESTMENT",
      "amount": {
        "amount": 3000,
        "currency": "GBP"
      },
      "sourceOfFunds": {
        "accountName": "Account Name",
        "accountNumber": "12345678",
        "sortCode": "123456"
      }
    },
    {
      "clientId": "clientId2",
      "accountType": "GOJI_INVESTMENT",
      "amount": {
        "amount": 2000,
        "currency": "GBP"
      },
      "sourceOfFunds": null
    }
  ]
}
```

```http
HTTP/1.1 201 Created
Content-Type: application/json
X-GOJI-REQUEST-ID: 49801f79-5347-4db5-a2b9-59e6cf3e0a22

{
  "batchId": "4d8af0f8-26a1-4e06-bb1e-8225d1e36e2b",
  "type": "MIGRATION",
  "status": "AWAITING_FUNDS",
  "totalPayout": {
    "amount": 5000,
    "currency": "GBP"
  },
  "payments": [
    {
      "clientId": "clientId",
      "accountType": "GOJI_INVESTMENT",
      "amount": {
        "amount": 3000,
        "currency": "GBP"
      },
      "status": "PENDING",
      "sourceOfFunds": {
        "accountName": "Account Name",
        "accountNumber": "12345678",
        "sortCode": "123456"
      }
    },
    {
      "clientId": "clientId2",
      "accountType": "GOJI_INVESTMENT",
      "amount": {
        "amount": 2000,
        "currency": "GBP"
      },
      "status": "PENDING",
      "sourceOfFunds": null
    }
  ],
  "payTo": {
    "accountName": "Platform 1 - Receiving",
    "accountNumber": "12345678",
    "sortCode": "123456",
    "bankReference": "OR8144E143"
  }
}
```


### Description

Creates a new batch payment instruction to transfer money to a list of investors.


### Request

Body: [Batch Model](/#payments-manager-batch-model)

### Response

Body: [Batch Model](/#payments-manager-batch-model)


Http Status: 

| HTTP Status Code | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 201 Created      | Batch payment posted created successfully        | Batch      | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |



## `GET /transfers/batch/{batchId}`

To see the current state of a batch payment instruction, this endpoint can be used.  

It will provide two statuses:

(1) An overall `status` of the batch payment instruction.

(2) A breakdown of the current `status` of each individual payment.


```http
GET /transfers/batch/4d8af0f8-26a1-4e06-bb1e-8225d1e36e2b HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
```


```http
HTTP/1.1 200 OK
Content-Type: application/json
X-GOJI-REQUEST-ID: 6937bd3b-e3de-4fd6-9bd9-c87cd7305180

{
  "batchId": "4d8af0f8-26a1-4e06-bb1e-8225d1e36e2b",
  "type": "MIGRATION",
  "status": "AWAITING_FUNDS",
  "totalPayout": {
    "amount": 5000,
    "currency": "GBP"
  },
  "payments": [
    {
      "clientId": "clientId",
      "accountType": "GOJI_INVESTMENT",
      "amount": {
        "amount": 3000,
        "currency": "GBP"
      },
      "status": "PENDING",
      "sourceOfFunds": {
        "accountName": "Account Name",
        "accountNumber": "12345678",
        "sortCode": "123456"
      }
    },
    {
      "clientId": "clientId2",
      "accountType": "GOJI_INVESTMENT",
      "amount": {
        "amount": 2000,
        "currency": "GBP"
      },
      "status": "PENDING",
      "sourceOfFunds": null
    }
  ],
  "payTo": {
    "accountName": "Platform 1 - Receiving",
    "accountNumber": "12345678",
    "sortCode": "123456",
    "bankReference": "OR8144E143"
  }
}
```

### Description

Retrieves the details of an existing batch payment.

### Request

Body: None

### Response

Body: [Batch Payment Model](/#payments-manager-batch-model) 

Http Status: 

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 200 OK           | batch payment exists and is return in the body   | Batch      | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |
| 404 Not Found    | No batch payment with this UUID exists           | None       | n/a              |
