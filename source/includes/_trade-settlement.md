## <em>Trade Settlement 🚧</em>

The Trade Settlement API allows an Investment Manager to report trades which require settlement.

The API is currently under construction.

## Trades

Once an instrument has been created, it can then be traded. A trade can be submitted using [`POST /trades`](/#settlement-equity-post-trades).

To retrieve an existing trade, the [`GET /trades/{id}`](#settlement-equity-get-trades-id) endpoint can be used.


## Trade Model

### Required Attributes 

| Key                       | JSON Type | Value Type | Value Description                                                                                           |
|---------------------------|-----------|------------|-------------------------------------------------------------------------------------------------------------|
| id                        | String    | TradeId    | The platform generated unique ID of the trade. Up to 100 characters.                                        |
| instrumentSymbol          | String    | ID/Symbol  | The platform generated unique ID/symbol of the instrument.                                                  |
| quantity                  | Number    | Number     | The number of shares being bought/sold.                                                                     |
| price                     | Object    | Object     | The price the instrument is being traded at.                                                                |
| price.amount              | Number    | Number     | The cost per share unit in `price.currency`.                                                                |
| price.currency            | String    | ISO 4217   | The currency that `price.amount` is expressed in.                                                           |
| transactTime              | String    | ISO 8601   | The timestamp at which the trade was originally executed on the platform.                                   |
| buy                       | Object    | Object     | Represents the buy-side details of a trade                                                                  |
| buy.investor              | Object    | Object     | Set to null for non-investor, or details investor details.                                                  |
| buy.investor. clientId    | String    | String     | The registered clientId of the investor, i.e. PROP-12345.                                                   |
| buy.investor. accountType | String    | Enum       | Values: `GIA`, `ISA`.                                                                                       |
| buy.nominee               | Object    | Object     | Set to null when the buyer is not a nominee, else field below.                                              |
| buy.nominee. accountType  | String    | Enum       | The nominee involved in the buy. Value: `ORIGINATOR`.                                                         |
| buy.fees[]                | Array     | List       | Required when fees exist on the instrument being traded that the buyer needs to pay. Otherwise leave empty. |
| sell                      | Object    | Object     | Represents the sell-side details of a trade                                                                 |
| sell.investor             | Object    | Object     | Set to null for non-investor, or details investor details.                                                  |
| sell.investor. clientId   | String    | String     | The registered clientId of the investor, i.e. PROP-12345.                                                   |
| sell.investor. accountType| String    | Enum       | Values: `GIA`, `ISA`.                                                                                       |
| sell.nominee              | Object    | Object     | Set to null when the seller is not a nominee, else fields below.                                            |
| sell.nominee. accountType | String    | Enum       | The nominee involved in the sell. Values: `ORIGINATOR`.                                                       |
| sell.fees[]               | Array     | List       | Required when fees exist on the instrument being traded that the seller needs to pay. Otherwise leave empty.|


### Optional Attributes

| Key                       | JSON Type | Value Type | Value Description                                                             |
|---------------------------|-----------|------------|-------------------------------------------------------------------------------|
| buy.fees[]                | Array     | List       | Optional. Fields below detail a `FeeSymbol` registered at `POST /instrument`. |
| buy.fees[] .symbol        | String    | FeeSymbol  | Fee type symbol registered at `POST /instrument`.                             |
| buy.fees[] .cost.amount   | Number    | Number     | The amount to be charged associated with a specific `FeeSymbol`               |
| buy.fees[] .cost.currency | Number    | Number     | The currency that `cost.amount` is expressed in.                              |
| sell.fees[]               | Array     | List       | Optional. Fields below detail a `FeeSymbol` registered at `POST /instrument`. |
| sell.fees[] .symbol       | String    | FeeSymbol  | Fee type symbol registered at `POST /instrument`.                             |
| sell.fees[] .cost.amount  | Number    | Number     | The amount to be charged associated with a specific `FeeSymbol`               |
| sell.fees[] .cost.currency| Number    | Number     | The currency that `cost.amount` is expressed in.                              |
| settlementStatus          | String    | Enum       | Response only. Details the current settlement status of a trade.              |

## `POST /trades`
```http
POST /trades HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 79f33f3c-86e0-4613-ba49-9fac3c6f0eab

{
  "id": "cdfb86c8-1085-43ed-9839-f4c8e7267818",
  "instrumentSymbol": "446ca5fc-4d38-4706-a50b-5b3a64d3f703",
  "quantity": 1000,
  "price": {
    "amount": 4.99,
    "currency": "GBP"
  },
  "transactTime": "2019-12-09T10:21:19.453Z",
  "buy": {
    "investor": {
      "clientId": "PROP-12345",
      "accountType": "GIA"
    },
    "nominee": null,
    "fees": [
      {
        "symbol": "STAMP_DUTY",
        "cost": {
          "currency": "GBP",
          "amount": 7.27
        }
      }
    ]
  },
  "sell": {
    "investor": null,
    "nominee": {
      "accountType": "ORIGINATOR"
    },
    "fees": [
      
    ]
  }
}
```
### Description

Persists a new trade which will then undergo the settlement process.

An instrument must first be registered using the following API:

 * [Instrument API](/#settlement-equity-instruments)
 
...before it can be traded.

Trades can be between the nominee company and an investor or two investors. 

### Request

Body: [Trade Model](/#settlement-equity-trade-model)

### Response

Body: [Trade Model](/#settlement-equity-trade-model)

Http Status: 

| HTTP Status Code | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 201 Created      | Trade created successfully                       | Trade      | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |


## `GET /trades/{id}`

```http
GET /trades/cdfb86c8-1085-43ed-9839-f4c8e7267818 HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 79f33f3c-86e0-4613-ba49-9fac3c6f0eab
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "cdfb86c8-1085-43ed-9839-f4c8e7267818",
  "instrumentSymbol": "446ca5fc-4d38-4706-a50b-5b3a64d3f703",
  "quantity": 1000,
  "price": {
    "amount": 4.99,
    "currency": "GBP"
  },
  "transactTime": "2019-12-09T10:21:19.453Z",
  "settlementStatus": "SETTLING",
  "buy": {
    "investor": {
      "clientId": "PROP-12345",
      "accountType": "GIA"
    },
    "nominee": null,
    "fees": [
      {
        "narrative": "Stamp Duty",
        "cost": {
          "currency": "GBP",
          "amount": 5
        }
      }
    ]
  },
  "sell": {
    "investor": null,
    "nominee": {
      "accountType": "ORIGINATOR"
    },
    "fees": [
      
    ]
  }
}
```

### Description

Retrieves the details of an existing trade given trade `id`.

### Request

Body: None

### Response

Body: [Trade Model](/#settlement-equity-trade-model)

Http Status: 

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 200 OK           | Trade exists and is return in the body           | Trade      | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |
| 404 Not Found    | No trade with this UUID exists                   | None       | n/a              |
