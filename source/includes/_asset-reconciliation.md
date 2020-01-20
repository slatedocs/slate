## <em>Asset Reconciliation </em>

The Asset Reconciliation API allows an Investment Manager to communicate the expected distribution of equity, held by their investors, on a per-instrument basis.

This information will then be used by Goji for reconciliation purposes.


## Asset Reconciliation Reporting

The [`POST /instruments/reporting`](/#settlement-equity-post-instruments-reporting) endpoint allows platforms to report their system's view on equity allocation for reconcillation purposes.

Equity allocation can be communicated to Goji as a snapshot via multiple calls to [`POST /instruments/reporting`](/#settlement-equity-post-instruments-reporting) describing investor holdings on a per-instrument basis. 

⚠️ All instruments that are part of the same snapshot should share the same `reportId`.


## Asset Reconciliation Reporting Model

### Required Attributes

All of the following attributes of the Asset Reconciliation Reporting Model are considered 'required' attributes. 

⚠️ In the case of an instrument that has not yet been issued or traded to investors - the holdings section can be left empty. The expectation is that this will still be reported to Goji.


| Key                  | JSON Type | Value Type       | Value Description                                                                                                                                     |
|----------------------|-----------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| reportId             | String    | UUID             | A platform-generated UUID for this snapshot, shared between all instruments included in this snapshot.                                                |
| instrumentSymbol     | String    | InstrumentSymbol | The unique ID/symbol of the instrument registered by the platform.                                                                                    |
| timestamp            | String    | ISO 8601         | The time at which the snapshot of all instruments' holdings was originally taken. The very first snapshot is expected to have been taken at midnight. |
| holdings[]           | Array     | Object           | The list of investor holdings in an `instrumentSymbol`.                                                                                               |
| holdings[].clientId  | String    | Object           | The clientId of the investor associated with this individual holding.                                                                                 |
| holdings[].quantity  | Number    | Number           | The number of shares owned by the `clientId`.                                                                                                         |


## `POST /instruments/reporting`

```http
POST /instruments/reporting HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 59425d3d-cf73-44ff-aecb-590cd198a4bc

{
  "reportId": "68f54225-6760-449d-8f38-a003d1dc535a",
  "instrumentSymbol": "SPV1",
  "timestamp": "2020-01-09T08:53:20.963Z",
  "holdings": [
    {
      "clientId": "GOJI-13251",
      "quantity": 100
    },
    {
      "clientId": "GOJI-13252",
      "quantity": 200
    },
    {
      "clientId": "GOJI-13254",
      "quantity": 300
    }
  ]
}
```

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "reportId": "68f54225-6760-449d-8f38-a003d1dc535a",
  "instrumentSymbol": "SPV1",
  "timestamp": "2020-01-09T23:59:59.999Z",
  "holdings": [
    {
      "clientId": "GOJI-13251",
      "quantity": 100
    },
    {
      "clientId": "GOJI-13252",
      "quantity": 200
    },
    {
      "clientId": "GOJI-13254",
      "quantity": 300
    }
  ]
}
```

### Description

Creates a new asset report on a specified `instrumentSymbol` to be used in further reconciliation processes. 
This will form part of a wider snapshot being communicated to Goji which describes the distribution/ allocation of equity.
All asset reports that fall under the same wider snapshot should share the same `reportId`.


### Request

Body: [Asset Reconciliation Reporting Model](/#settlement-equity-instrument-reporting-model)

### Response

Body: [Asset Reconciliation Reporting Model](/#settlement-equity-instrument-reporting-model)

Http Status: 

| HTTP Status Code | Description                                      | Body                                    | Content-Type     |                 
|------------------|--------------------------------------------------|-----------------------------------------|------------------| 
| 201 Created      | Report created successfully                      | Asset Reconciliation Reporting Model    | application/json |                 
| 400 Bad Request  | The request was malformed.  See response body    | None                                    | n/a              |                  
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None                                    | n/a              |                 

## `GET /instruments/reporting/{reportId}/{instrumentSymbol}`

```http
GET /instruments/reporting/68f54225-6760-449d-8f38-a003d1dc535a/SPV1 HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 59425d3d-cf73-44ff-aecb-590cd198a4bc
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "reportId": "68f54225-6760-449d-8f38-a003d1dc535a",
  "instrumentSymbol": "SPV1",
  "timestamp": "2020-01-09T23:59:59.999Z",
  "holdings": [
    {
      "clientId": "GOJI-13251",
      "quantity": 100
    },
    {
      "clientId": "GOJI-13252",
      "quantity": 200
    },
    {
      "clientId": "GOJI-13254",
      "quantity": 300
    }
  ]
}
```

### Description

Retrieves the details of an existing instrument's holdings at a point in time, given a snapshot `reportId` and `instrumentSymbol` is supplied.

### Request

Body: [Asset Reconciliation Reporting Model](/#settlement-equity-instrument-model)

### Response

Body: [Asset Reconciliation Reporting Model](/#settlement-equity-instrument-model)

Http Status: 

| Code             | Description                                             | Body                                 | Content-Type     |
|------------------|---------------------------------------------------------|--------------------------------------|------------------|
| 200 OK           | Report exists and is returned in the body               | Asset Reconciliation Reporting Model | application/json |
| 400 Bad Request  | The request was malformed.  See response body           | None                                 | n/a              |                
| 401 Unauthorized | No auth provided, auth failed, or not authorized        | None                                 | n/a              |                   
| 404 Not Found    | No instrument with this UUID exists                     | None                                 | n/a              |                  
