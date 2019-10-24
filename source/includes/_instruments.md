# Instruments 🚧

The Instruments API allows an Investment Manager to create new Instruments, and issue/allocate shares of that instrument.

This instrument can then be used for:

 * [Trade Settlement](/#trade-settlement)
 * [Corporate Actions](/#corporate-actions)

## Instrument Model
```json
{
  "id": "446ca5fc-4d38-4706-a50b-5b3a64d3f703",
  "investmentDocumentUrl": "https://path.to/the/kiid.pdf",
  "isaEligible": false,
  "assetClass": "EQUITY",
  "primaryMarketBankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41",
  "feeTypes": [
    {
      "symbol": "STAMP_DUTY",
      "bankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41"
    },
    {
      "symbol": "COMMISSION",
      "bankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41"
    }
  ]
}
```

The Instrument model used for both the [`POST /instruments`](/#instruments-post-instruments) and [`GET /instruments/{InstrumentSymbol}`](/#instruments-get-instruments) endpoints.

| Key                        | JSON Type | Value Type       | Value Description                                                                                |
|----------------------------|-----------|------------------|--------------------------------------------------------------------------------------------------|
| symbol                     | String    | InstrumentSymbol | Unique symbol used to identify this instrument.                                                  |
| assetClass                 | String    | AssetClass       | Values: DEBT, EQUITY                                                                             |
| primaryMarketBankAccountId | String    | BankAccountId    | The bank account ID to send primary market sale funds to.                                        |
| feeTypes[].symbol          | String    | FeeSymbol        | A symbolic representation of the type of fee, i.e. STAMP_DUTY.                                   |
| feeTypes[].bankAccountId   | String    | BankAccountId    | BankAccountID from [`POST /platformApi/bankAccountDetails`](/#payments-post-bankaccountdetails). |

## `POST /instruments`

```http
POST /instruments HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 79f33f3c-86e0-4613-ba49-9fac3c6f0eab

{
  "id": "SPV99",
  "assetClass": "EQUITY",
  "primaryMarketBankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41",
  "feeTypes": [
    {
      "symbol": "COMMISSION",
      "bankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41"
    }
  ]
}
```

```http
HTTP/1.1 201 Created
Content-Type: application/json
X-GOJI-REQUEST-ID: 79f33f3c-86e0-4613-ba49-9fac3c6f0eab

{
  "id": "SPV99",
  "assetClass": "EQUITY",
  "primaryMarketBankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41",
  "feeTypes": [
    {
      "symbol": "COMMISSION",
      "bankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41"
    }
  ]
}
```

### Description

Registers a new instrument which can then be referenced by it's symbol in other APIs which require an InstrumentSymbol.

### Request

Body: [Instrument Model](/#instruments-instrument-model)

### Response

Body: [Instrument Model](/#instruments-instrument-model)

Http Status:

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 201 Created      | Instrument created successfully                  | Instrument | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |

## `GET /instruments/{InstrumentSymbol}`

### Description

```http
GET /instruments/SPV99 HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 79f33f3c-86e0-4613-ba49-9fac3c6f0eab
```

```http
HTTP/1.1 200 OK
Content-Type: application/json
X-GOJI-REQUEST-ID: 79f33f3c-86e0-4613-ba49-9fac3c6f0eab

{
  "id": "446ca5fc-4d38-4706-a50b-5b3a64d3f703",
  "assetClass": "EQUITY",
  "primaryMarketBankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41",
  "feeTypes": [
    {
      "symbol": "COMMISSION",
      "bankAccountId": "01700ae3-1b61-41c8-87d9-c59e82f33a41"
    }
  ]
}
```

Retrieves the details held about an instrument.

### Request

Body: None

### Response

Body: [Instrument Model](/#instruments-instrument-model)

Http Status:

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 200 Created      | Instrument exists and is return in the body      | Instrument | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |
| 404 Not Found    | No instrument with this symbol is registered     | None       | n/a              |
