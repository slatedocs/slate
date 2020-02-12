## *Corporate Actions*

The Corporate Actions API allows an Investment Manager to perform Corporate Actions that relate to 
[Instruments](/#settlement-equity-instruments).

The API is currently under construction.

## Dividends 

The [`POST /corporate-actions/dividends`](/#settlement-equity-post-corporate-actions-dividends) endpoint can be used to pay dividends 
to investors that hold shares in an instrument.
 
Said endpoint references a registered instrument, and takes a list of all the investors that are shareholders to be paid. 

The call to [`POST /corporate-actions/dividends`](/#settlement-equity-post-corporate-actions-dividends) will return a 201 Created response
with a `status` field in the Dividend body of `AWAITING FUNDS`.

⚠️ Please note that this response only indicates that the dividend instruction has been received. 
The distribution of the dividend to investors will not occur until the necessary funds have been sent. 

Funds should be sent to the bank details specified in the `PayTo` section of the response, including the `payTo.reference`.

Once payment has been made, the [`GET /corporate-actions/dividends/{id}`](/#settlement-equity-get-corporate-actions-dividends-id) 
endpoint can be used to see the current status of the dividend instruction.

The status of the money transfer is further broken down at a per investor level. 


## Dividends Model


### Required Attributes

| Key                          | JSON Type | Value Type      | Value Description                                                                 |
|------------------------------|-----------|-----------------|-----------------------------------------------------------------------------------|
| id                           | String    | DividendId      | The platform generated UUID of the dividend posting.                              |
| instrumentSymbol             | String    | InstrumentSymbol| The unique ID/symbol of the instrument registered by the platform.                |
| totalPayout. currency        | String    | ISO 4217        | The currency that the total dividend payment is in.                               |
| totalPayout. amount          | Number    | Number          | The overall amount to be paid out.                                                |
| payments[]                   | Array     | List            | The list of all individual payments due to be paid out.                           |
| payments[]. clientId         | String    | String          | The investor's clientId for a dividend payment.                                   |
| payments[]. accountType      | String    | Enum            | The account type to pay the dividend to for some `clientId`. Values: `GIA`, `ISA`.|
| payments[]. payment.amount   | Number    | Number          | The total amount to be paid to a `clientId` in the given `payment.currency`.      |
| payments[]. payment.currency | String    | ISO 4217        | The currency corresponding to the `payment.amount` to be paid.                    |


### Additional Response Attributes

The following list of attributes are response-only and are expected to always be present on a response.

| Key                         | JSON Type | Value Type      | Value Description                                                                                                     |
|-----------------------------|-----------|-----------------|-----------------------------------------------------------------------------------------------------------------------|
| status                      | String    | Enum            | Response Only. The status of the overall dividend instruction. Values: `AWAITING_FUNDS`, `DISTRIBUTING`, `COMPLETE`.  |
| payments[].status           | String    | Enum            | Response Only. The status of an individual payment under `payments`. Values: `PENDING`, `COMPLETE`.                   |
| payTo.accountName           | String    | String          | Response Only. The account name associated with the `accountNumber` and `sortCode` below.                             |
| payTo.accountNumber         | String    | String          | Response Only. The account number to send payment to.                                                                 |
| payTo.sortCode              | String    | String          | Response Only. The sort code to send payment to.                                                                      | 
| payTo.reference             | String    | String          | Response Only. The reference to use when sending payment.                                                             |


## `POST /corporate-actions/dividends`
```http
POST /corporate-actions/dividends HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "id": "627e27b2-75be-4673-ba5a-7f765a8ace89",
  "instrumentSymbol": "instrument1",
  "totalPayout": {
    "currency": "GBP",
    "amount": 180
  },
  "payments": [
    {
      "clientId": "clientId",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 120
      }
    },
    {
      "clientId": "clientId2",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 60
      }
    }
  ]
}
```

```http
HTTP/1.1 201 Created
Content-Type: application/json
X-GOJI-REQUEST-ID: 49801f79-5347-4db5-a2b9-59e6cf3e0a22

{
  "id": "627e27b2-75be-4673-ba5a-7f765a8ace89",
  "instrumentSymbol": "instrument1",
  "status": "AWAITING_FUNDS",
  "totalPayout": {
    "currency": "GBP",
    "amount": 180
  },
  "payments": [
    {
      "clientId": "clientId",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 120
      },
      "status": "PENDING"
    },
    {
      "clientId": "clientId2",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 60
      },
      "status": "PENDING"
    }
  ],
  "payTo": {
    "accountName": "Platform1 - Receiving",
    "accountNumber": "123456789",
    "sortCode": "123456",
    "reference": "OR0CE628FF"
  }
}
```


### Description

Creates a new dividend instruction for an existing instrument to a list of investors.

⚠️ Please ensure that the relevant instrument is already registered at the following endpoint before
using the dividend endpoints:

 * [Instrument API](/#settlement-equity-instruments)

### Request

Body: [Dividend Model](/#settlement-equity-dividends-model)

### Response

Body: [Dividend  Model](/#settlement-equity-dividends-model)


Http Status: 

| HTTP Status Code | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 201 Created      | Dividend posting created successfully            | Dividend   | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |



## `GET /corporate-actions/dividends/{id}`

To see the current state of a dividend instruction, this endpoint can be used.  

It will provide two statuses:

(1) An overall `status` of the dividend instruction.

(2) A breakdown of the current `status` of each payment.


```http
GET /corporate-actions/dividends/627e27b2-75be-4673-ba5a-7f765a8ace89 HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
```


```http
HTTP/1.1 200 OK
Content-Type: application/json
X-GOJI-REQUEST-ID: 6937bd3b-e3de-4fd6-9bd9-c87cd7305180

{
  "id": "627e27b2-75be-4673-ba5a-7f765a8ace89",
  "instrumentSymbol": "instrument1",
  "status": "AWAITING_FUNDS",
  "totalPayout": {
    "currency": "GBP",
    "amount": 180
  },
  "payments": [
    {
      "clientId": "clientId",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 120
      },
      "status": "PENDING"
    },
    {
      "clientId": "clientId2",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 60
      },
      "status": "PENDING"
    }
  ],
  "payTo": {
    "accountName": "Platform1 - Receiving",
    "accountNumber": "123456789",
    "sortCode": "123456",
    "reference": "OR0CE628FF"
  }
}
```

### Description

Retrieves the details of an existing dividend given a dividend `id` is supplied.

### Request

Body: None

### Response

Body: [Dividend Model](/#settlement-equity-dividends-model) 

Http Status: 

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 200 OK           | Dividend exists and is return in the body        | Dividend   | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |
| 404 Not Found    | No dividend with this UUID exists                | None       | n/a              |
