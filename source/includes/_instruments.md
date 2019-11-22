## <em>Instruments 🚧</em>

The Instruments API allows an Investment Manager to [create new Instruments](/#settlement-equity-instrument-creation), and 
[issue/allocate shares](/#settlement-equity-issuing-allocating-shares) of that instrument.

This instrument can then be used for:

 * [Trade Settlement](/#settlement-equity-trade-settlement)
 * [Corporate Actions](/#settlement-equity-corporate-actions)

## Instrument Creation

Instrument creation allows registering a new [Instrument](/#settlement-equity-instrument-model), which is later referenced
by the `InstrumentSymbol`.  Currently only equity instruments are supported.

## Instrument Model
```json
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

The Instrument model used for both the [`POST /instruments`](/#settlement-equity-post-instruments) and [`GET /instruments/{InstrumentSymbol}`](/#settlement-equity-get-instruments-instrumentsymbol) endpoints.

| Key                        | JSON Type | Value Type       | Value Description                                                                                |
|----------------------------|-----------|------------------|--------------------------------------------------------------------------------------------------|
| symbol                     | String    | InstrumentSymbol | Unique symbol used to identify this instrument.                                                  |
| assetClass                 | String    | AssetClass       | Values: EQUITY                                                                                   |
| primaryMarketBankAccountId | String    | BankAccountId    | The bank account ID to send primary market sale funds to.                                        |
| feeTypes[].symbol          | String    | FeeSymbol        | A symbolic representation of the type of fee, i.e. STAMP_DUTY.                                   |
| feeTypes[].bankAccountId   | String    | BankAccountId    | BankAccountID from [`POST /platformApi/bankAccountDetails`](/#payments-manager-post-bankaccountdetails). |

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

Registers a new instrument which can then be referenced by its symbol in other APIs which require an `InstrumentSymbol`.


The instrument can then be referenced by the `InstrumentSymbol` in the following APIs:

 * [Trade Settlement API](/#settlement-equity-trade-settlement)
 * [Corporate Actions API](/#settlement-equity-corporate-actions)
 
In addition to defining the instrument, a list of fees that will apply to any trade settlement for this instrument 
must be specified.  The `FeeSymbol`s that have been registered will later be specified in the
[Trade Settlement API](/#settlement-equity-trade-settlement) to charge fees to the investors at settlement time.

### Request

Body: [Instrument Model](/#settlement-equity-instrument-model)

### Response

Body: [Instrument Model](/#settlement-equity-instrument-model)

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

Body: [Instrument Model](/#settlement-equity-instrument-model)

Http Status:

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 200 Created      | Instrument exists and is return in the body      | Instrument | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |
| 404 Not Found    | No instrument with this symbol is registered     | None       | n/a              |

## Issuing / Allocating Shares

After an instrument has been created, a number of shares must be issued to the nominee company.  This can be achieved
using [`POST /allocations`](/#settlement-equity-post-allocations).

Alternatively, if this instrument is created during migration of asset custody to Goji Nominee Ltd, and shares have 
already been sold to investors, the [`POST /allocations`](/#settlement-equity-post-allocations) can be used to allocate 
each investor's shares.

## Allocation Model

| Key                  | JSON Type | Value Type       | Value Description                                              |
|----------------------|-----------|------------------|----------------------------------------------------------------|
| id                   | String    | UUID             | A UUID for this allocation.                                    |
| quantity             | Number    | Number           | The (whole) number of shares to allocate.                      |
| instrumentId         | String    | InstrumentSymbol | Property Partner generated unique ID of the instrument.        |
| investor             | Object    | Object           | Null for non-investor allocation, or the fields below.         |
| investor.clientId    | String    | ClientId         | Either the client ID for the investor.                         |
| investor.accountType | String    | Enum             | Values: GIA, ISA.                                              |
| nominee              | Object    | Object           | Null when not allocating to a nominee, else fields below.      |
| nominee.accountType  | String    | Enum             | The nominee involved in the alloc. Values: GOJI, ORIGINATOR.   |

## `POST /allocations`

```http
POST /allocations HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 59425d3d-cf73-44ff-aecb-590cd198a4bc

{
  "id": "5dd40510-810e-4a55-a395-04819fd915b9",
  "allocation": {
    "investor": null,
    "nominee": {
      "accountType": "ORIGINATOR"
    }
  },
  "quantity": 1000000,
  "instrumentId": "446ca5fc-4d38-4706-a50b-5b3a64d3f703"
}
```

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": "5dd40510-810e-4a55-a395-04819fd915b9",
  "allocation": {
    "investor": null,
    "nominee": {
      "accountType": "ORIGINATOR"
    }
  },
  "quantity": 1000000,
  "instrumentId": "446ca5fc-4d38-4706-a50b-5b3a64d3f703"
}
```

### Description

Creates a new allocation of shares.

When initially issuing shares, the `nominee` must be specified.
When migrating shares, the `investor` must be specified.

### Request

Body: [Allocation Model](/#settlement-equity-allocation-model)

### Response

Body: [Allocation Model](/#settlement-equity-allocation-model)

Http Status: 

| HTTP Status Code | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 201 Created      | Allocation created successfully                  | Allocation | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |

## `GET /allocations/{AllocationId}`

```http
GET /allocations/5dd40510-810e-4a55-a395-04819fd915b9 HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 59425d3d-cf73-44ff-aecb-590cd198a4bc
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "5dd40510-810e-4a55-a395-04819fd915b9",
  "allocation": {
    "investor": null,
    "nominee": {
      "accountType": "ORIGINATOR"
    }
  },
  "quantity": 1000000,
  "instrumentId": "446ca5fc-4d38-4706-a50b-5b3a64d3f703"
}
```

### Description

Retrieves the details of an existing allocation.

### Request

Body: [Allocation Model](/#settlement-equity-allocation-model)

### Response

Body: [Allocation Model](/#settlement-equity-allocation-model)

Http Status: 

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 200 Created      | Allocation exists and is return in the body      | Allocation | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |
| 404 Not Found    | No allocation with this UUID exists              | None       | n/a              |
