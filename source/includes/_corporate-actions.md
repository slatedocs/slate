## <em>Corporate Actions 🚧</em>

The Corporate Actions API allows an Investment Manager to perform Corporate Actions that relate to 
[Instruments](/#settlement-equity-instruments).

The API is currently under construction.

## Dividends 

The [`POST /corporate-actions/dividends`](/#settlement-equity-post-dividend) endpoint can be used to pay dividends 
to investors that hold shares in an instrument.
 
Said endpoint references an instrument, and takes a list of all the investors that are shareholders to be paid. 

The call to [`POST /corporate-actions/dividends`](/#settlement-equity-post-dividend) will return a 201 Created response
with a `status` field in the body of 'AWAITING FUNDS'.

⚠️ Please note that this response only indicates that the dividend instruction has been received. 
The distribution of the dividend to investors will not occur until the necessary funds are received. 

The response will include a payTo section. Payment should be sent to the bank details specified, including the `payTo.reference`.

Once payment has been made, the [`GET /corporate-actions/dividends/{dividendId}`](/#settlement-equity-get-dividend-by-id) 
endpoint can be used to see the current status of the dividend instruction.

The status of the money transfer is further broken down at a per investor level. 


## Dividends Model

| Key                         | JSON Type | Value Type | Value Description                                               |
|-----------------------------|-----------|------------|-----------------------------------------------------------------|
| id                          | String    | UUID       | The platform generated UUID of the dividend posting.            |
| instrumentSymbol            | String    | UUID       | The platform generated unique ID/symbol of the instrument.      |
| status                      | String    | Enum       | Response Only. Values: AWAITING_FUNDS, DISTRIBUTING, PROCESSED. |
| totalPayout.currency        | String    | ISO 4217   | The currency that the total dividend payment is in.             |
| totalPayout.amount          | Number    | Number     | The total amount to be paid out.                                |
| payments[].clientId         | String    | Client ID  | The client ID for the dividend payment.                         |
| payments[].accountType      | String    | Enum       | The account to pay the dividend to. Values: GIA, ISA.           |
| payments[].payment.currency | String    | ISO 4217   | The currency that the dividend is paid in.                      |
| payments[].payment.amount   | Number    | Number     | The total amount to be paid to this investor.                   |
| payments[].status           | String    | Enum       | Response Only. Values: PENDING, PAID.                           |
| payTo.accountNumber         | String    | String     | Response Only. The account number to send payment to.           |
| payTo.sortCode              | String    | String     | Response Only. The sort code to send payment to.                |
| payTo.reference             | String    | String     | Response Only. The reference to use when sending payment.       |




## `POST /corporate-actions/dividends`
```http
POST /corporate-actions/dividends HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-REQUEST-ID: 49801f79-5347-4db5-a2b9-59e6cf3e0a22

{
  "id": "627e27b2-75be-4673-ba5a-7f765a8ace89",
  "instrumentSymbol": "446ca5fc-4d38-4706-a50b-5b3a64d3f703",
  "totalPayout": {
    "currency": "GBP",
    "amount": 180
  },
  "payments": [
    {
      "clientId": "PROP-12345",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 120
      }
    },
    {
      "clientId": "PROP-23456",
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
  "instrumentSymbol": "446ca5fc-4d38-4706-a50b-5b3a64d3f703",
  "status": "AWAITING_FUNDS",
  "dividendPerShare": {
    "currency": "GBP",
    "amount": 0.12
  },
  "totalPayout": {
    "currency": "GBP",
    "amount": 180
  },
  "payments": [
    {
      "clientId": "PROP-12345",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 120
      },
      "status": "PENDING"
    },
    {
      "clientId": "PROP-23456",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 60
      },
      "status": "PENDING"
    }
  ],
  "pay": {
    "accountNumber": "12345678",
    "sortCode": "040004",
    "reference": "abc123def456"
  }
}
```


### Description

Creates a new dividend instruction for an existing instrument to a list of investors.

⚠️ Please ensure that the relevant instrument is already registered at the following endpoint before
using the dividend endpoints:

 * [Instrument API](/#settlement-equity-instruments)

### Request

Body: [Dividend Model]((/#settlement-equity-post-dividend))

### Response

Body: [Dividend  Model]((/#settlement-equity-post-dividend))


Http Status: 

| HTTP Status Code | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 201 Created      | Dividend posting created successfully            | Dividend   | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |



## `GET /corporate-actions/dividends/{dividendId}`

To see the current state of a dividend instruction, this endpoint can be used.  

It will provide two statuses:

(1) An overall `status` of the dividend instruction.
(2) A breakdown of the current `status` of each payment.


```http
GET /corporate-actions/dividends/627e27b2-75be-4673-ba5a-7f765a8ace89 HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-REQUEST-ID: 6937bd3b-e3de-4fd6-9bd9-c87cd7305180
```


```http
HTTP/1.1 200 OK
Content-Type: application/json
X-GOJI-REQUEST-ID: 6937bd3b-e3de-4fd6-9bd9-c87cd7305180

{
  "id": "627e27b2-75be-4673-ba5a-7f765a8ace89",
  "instrumentSymbol": "446ca5fc-4d38-4706-a50b-5b3a64d3f703",
  "status": "DISTRIBUTING",
  "dividendPerShare": {
    "currency": "GBP",
    "amount": 0.12
  },
  "totalPayout": {
    "currency": "GBP",
    "amount": 180
  },
  "payments": [
    {
      "clientId": "PROP-12345",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 120
      },
      "status": "PAID"
    },
    {
      "clientId": "PROP-23456",
      "accountType": "GIA",
      "payment": {
        "currency": "GBP",
        "amount": 60
      },
      "status": "PENDING"
    }
  ],
  "pay": {
    "accountNumber": "12345678",
    "sortCode": "040004",
    "reference": "abc123def456"
  }
}
```

### Description

Retrieves the details of an existing dividend.

### Request

Body: None

### Response

Body: [Dividend Model](/#settlement-equity-get-dividend-by-id) 

Http Status: 

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 200 Created      | Trade exists and is return in the body           | Trade      | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |
| 404 Not Found    | No trade with this UUID exists                   | None       | n/a              |
