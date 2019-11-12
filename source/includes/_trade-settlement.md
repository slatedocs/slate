## <em>Trade Settlement 🚧</em>

The Trade Settlement API allows an Investment Manager to report trades which require settlement.

The API is currently under construction.

## Trades

Once an instrument has been created, it can then be traded. A trade can be submitted using [`POST /trades`](/#instruments-post-trades).

To retrieve an existing trade, the [`GET /trades/{tradeId}`](#instruments-get-trades) endpoint can be used.


## Trade Model

| Key                       | JSON Type | Value Type | Value Description                                                          |
|---------------------------|-----------|------------|----------------------------------------------------------------------------|
| id                        | String    | UUID       | A UUID of the trade.                                                       |
| quantity                  | Number    | Number     | The number of shares being bought/sold.                                    |
| instrumentSymbol          | String    | ID/Symbol  | The platform generated unique ID/symbol of the instrument.                 |
| price                     | Object    | Object     | The price the instrument is being traded at.                               |
| price.currency            | String    | ISO 4217   | The currency that `price.amount` is expressed in.                          |
| price.amount              | Number    | Number     | The cost per share in `price.currency`.                                    |
| buy                       | Object    | Object     | Represents the buy-side details of a trade                                 |
| buy.investor              | Object    | Object     | Null for non-investor, or details investor details.                        |
| buy.investor.clientId     | String    | Client ID  | The client ID of the investor, i.e. PROP-12345.                            |
| buy.investor.accountType  | String    | Enum       | Values: GIA, ISA.                                                          |
| buy.nominee               | Object    | Object     | Null when the buyer is not a nominee, else field below.                    |
| buy.nominee.accountType   | String    | Enum       | The nominee involved in the buy. Values: GOJI, ORIGINATOR.                 |
| buy.fees[]                | FeeSymbol | FeeSymbol  | Fields below detail a FeeSymbol registered at `POST /instrument`.          |
| buy.fees[].symbol         | String    | String     | Optional. Fee type symbol registered at `POST /instrument`.                |
| buy.fees[].cost.currency  | Number    | Number     | The currency of the fee.                                                   |
| buy.fees[].cost.amount    | Number    | Number     | The amount of the fee in `cost.currency`. (not per share)                  |
| sell                      | Object    | Object     | Represents the sell-side details of a trade                                |
| sell.investor             | Object    | Object     | Null for non-investor, or details investor details.                        |
| sell.investor.clientId    | String    | Client ID  | The client ID of the investor, i.e. PROP-12345.                            |
| sell.investor.accountType | String    | Enum       | Values: GIA, ISA.                                                          |
| sell.nominee              | Object    | Object     | Null when the seller is not a nominee, else fields below.                  |
| sell.nominee.accountType  | String    | Enum       | The nominee involved in the sell. Values: GOJI, ORIGINATOR.                |
| sell.fees[]               | String    | String     | Fields below detail a FeeSymbol registered at `POST /instrument`.          |
| sell.fees[].symbol        | FeeSymbol | FeeSymbol  | Optional. Fee type symbol registered at `POST /instrument`.                |
| sell.fees[].cost.currency | Number    | Number     | The currency of the fee.                                                   |
| sell.fees[].cost.amount   | Number    | Number     | The amount of the fee in `cost.currency`.                                  |

## `POST /trades`
```http
POST /trades HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 79f33f3c-86e0-4613-ba49-9fac3c6f0eab
{
  "id": "cdfb86c8-1085-43ed-9839-f4c8e7267818",
  "buy": {
    "investor": {
      "clientId": "PROP-12345",
      "accountType": "GIA",
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
    "fees": []
  },
  "price": {
    "amount": 4.99,
    "currency": "GBP"
  },
  "quantity": 1000,
  "instrumentId": "446ca5fc-4d38-4706-a50b-5b3a64d3f703"
}
```
### Description

Persists a new trade which will then undergo the settlement process.

An instrument must first be registered using the following API:

 * [Instrument API](/#instruments)
 
...before it can be traded.

Trades can be between the nominee company and an investor or two investors. 

### Request

Body: [Trade Model](/#trade-settlement-trade-model)

### Response

Body: [Trade Model](/#trade-settlement-trade-model)

Http Status: 

| HTTP Status Code | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 201 Created      | Trade      created successfully                  | Trade      | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |


## `GET /trades/{tradeId}`

```http
GET /trades/cdfb86c8-1085-43ed-9839-f4c8e7267818
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
  "status": "RECEIVED",
  "buy": {
    "investor": {
      "clientId": "PROP-12345",
      "accountType": "GIA",
    },
    "nominee": null,
    "fees": [
      {
        "narrative": "Stamp Duty",
        "cost": {
          "currency": "GBP",
          "amount": 5.00
        }
      }
    ]
  },
  "sell": {
    "investor": null,
    "nominee": {
      "accountType": "ORIGINATOR"
    },
    "fees": []
  },
  "price": {
    "amount": 4.99,
    "currency": "GBP"
  },
  "quantity": 1000,
  "instrumentId": "446ca5fc-4d38-4706-a50b-5b3a64d3f703"
}
```

### Description

Retrieves the details of an existing trade.

### Request

Body: None

### Response

Body: [Trade Model](/#trade-settlement-trade-model)

Http Status: 

| Code             | Description                                      | Body       | Content-Type     |
|------------------|--------------------------------------------------|------------|------------------|
| 200 Created      | Trade exists and is return in the body           | Trade      | application/json |
| 400 Bad Request  | The request was malformed.  See response body    | None       | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized | None       | n/a              |
| 404 Not Found    | No trade with this UUID exists                   | None       | n/a              |
