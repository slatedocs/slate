## *Viewing an Investor's Assets*

This can be used in conjunction with the [Equities API](/#settlement-equity) to view the status of an investor's holdings. 


## Asset Balance Model

### Response-Only Attributes 

| Key                       | JSON Type | Value Type | Value Description                                                                                               |
|---------------------------|-----------|------------|-----------------------------------------------------------------------------------------------------------------|
| id                        | String    | PotId      | The Goji-generated UUID that references where the asset is logically stored.                                    |
| type                      | String    | PotType    | Describes a category that a set of holdings can fall under.                                                     |
| balances                  | Object    | Object     | Describes an investor's holdings. Contains mappings of `instrumentSymbol(s)` to `Quantity` held by an investor. |
| at                        | String    | Object     | The timestamp at which the balances were calculated to.                                                         |


## `GET /investors/{clientId}/assets`

```http
GET /investors/CLIENT-ID/assets HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...
X-GOJI-CLIENT-ID: 79f33f3c-86e0-4613-ba49-9fac3c6f0eab
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
    {
        "id": "7a58a894-564c-4e19-a170-74cd2ed36aa1",
        "type": "EQUITY",
        "balances": {
            "Instrument Sample 2": 100,
            "Instrument Sample 1": 12
        },
        "at": "2020-05-28T09:29:33.247276Z"
    },
    {
        "id": "bbb6159d-0405-4fa1-95d5-853ef82bddb2",
        "type": "RESERVED",
        "balances": {},
        "at": "2020-05-28T09:29:33.247276Z"
    }
]
```

### Description

Retrieves the breakdown of assets for a given investor when a `clientId` is supplied.

Currently, an investor's holdings can fall under two categories: `EQUITY` or `RESERVED`. 

For a given investor, should a particular set of shares in some instrument fall under `EQUITY`, this means that the shares have been settled. 
Conversely, should shares be visible under the `RESERVED` category, this means that the shares are still in the process of settling.


### Request

Body: None

### Response

Body: [Asset Balance Model](/#settlement-equity-asset-balance-model)

Http Status: 

| HTTP Status Code | Description                                                                    | Body              | Content-Type     |
|------------------|--------------------------------------------------------------------------------|-------------------|------------------|
| 200 OK           | The status of the investor's various holdings are returned in the body         | Asset Balance     | application/json |
| 400 Bad Request  | The request was malformed.  See response body                                  | None              | n/a              |
| 401 Unauthorized | No auth provided, auth failed, or not authorized                               | None              | n/a              |
| 404 Not Found    | No investor with the specified clientId exists                                 | None              | n/a              |
