# Stablecoin Exchange Flows

The stablecoins we currently support are:

| Name                 | Symbol |
| -------------------- | ------ |
| Tether               | `usdt_erc20` |
| USDC                 | `usdc` |
| Paxos Standard Token | `pax`  |
| TrueUSD              | `tusd` |
| Gemini Dollar        | `gusd` |
| Dai                  | `dai`  |

## V1 Stablecoin Full Historical Inflow to Exchanges (will be deprecated Aug 16th, 2019, use v2)

<img src="https://img.shields.io/badge/Tier-Professional-black.svg"/>

```shell
curl "https://api.tokenanalyst.io/analytics/private/v1/erc20_exchanges_flow_historical/last?token=usdc&direction=inflow&format=json&key=API_KEY"
```

> The above command returns JSON structured like this:

```json
[
  {
    "date": "2018-11-28",
    "token_name": "USDC",
    "exchange": "Binance",
    "inflow": 7170265.744998998,
    "price": 1.01,
    "inflow_usd": 7253918.77,
    "number_of_txns": 174,
    "avg_txn_value": 41208.42382183332,
    "avg_txn_value_usd": 41689.19
  },
  {
    "date": "2018-11-28",
    "token_name": "USDC",
    "exchange": "Kucoin",
    "inflow": 7724.377048,
    "price": 1.01,
    "inflow_usd": 7814.49,
    "number_of_txns": 6,
    "avg_txn_value": 1287.3961746666666,
    "avg_txn_value_usd": 1302.42
  }
]
```

This endpoint returns the inflow of Stablecoins into exchange wallets. The `avg_txn_value` is the average transaction value for transactions flowing into exchange wallets on a given day.

### HTTP Request

`GET https://api.tokenanalyst.io/analytics/private/v1/erc20_exchanges_flow_historical/last?`

### Query Parameters

| Parameter | Type     | Description                                         |
| --------- | -------- | --------------------------------------------------- |
| key       | _string_ | Your unique API key                                 |
| format    | _string_ | What format you want your data in (`json` or `csv`) |
| token     | _string_ | `usdc`                                              |
| direction | _string_ | `inflow`                                            |



## V2 Stablecoin Full Historical Inflow from Exchanges (with 1 hour granularity)

<img src="https://img.shields.io/badge/Tier-Professional-black.svg"/>

```shell
curl "https://api.tokenanalyst.io/analytics/private/v1/erc20_exchanges_flow_window_historical/last?token=omg&direction=inflow&window=1h&format=json&key=API_KEY"
```

> The above command returns JSON structured like this:

```json
[
  {
    "date": "2018-11-06",
    "hour": "11:00:00",
    "token_name": "USDC",
    "exchange": "Binance",
    "inflow": 509.689581,
    "price": 1.0,
    "inflow_usd": 511.09,
    "number_of_txns": 3,
    "avg_txn_value": 169.896527,
    "avg_txn_value_usd": 170.36
  },
  {
    "date": "2018-11-07",
    "hour": "12:00:00",
    "token_name": "USDC",
    "exchange": "Kucoin",
    "inflow": 3585.887836,
    "price": 1.01,
    "inflow_usd": 3609.0,
    "number_of_txns": 3,
    "avg_txn_value": 1195.2959453333333,
    "avg_txn_value_usd": 1203.0
  }
]
```

This endpoint returns the inflow of stablecoins into exchange wallets. The `avg_txn_value`, `inflow`, and `number_of_txns` are calculated over the window (either 1 hour or 1 day). `hour` is in UTC

### HTTP Request

`GET https://api.tokenanalyst.io/analytics/private/v1/erc20_exchanges_flow_window_historical/last?`

### Query Parameters

| Parameter | Type     | Description                                         |
| --------- | -------- | --------------------------------------------------- |
| key       | _string_ | Your unique API key                                 |
| format    | _string_ | What format you want your data in (`json` or `csv`) |
| token     | _string_ | `usdt`                                               |
| direction | _string_ | `inflow`                                           |
| window    | _string_ | `1h` or `1d`                                        |

## Stablecoin Full Historical Outflow from Exchanges (will be deprecated Aug 16th, 2019, use v2)

<img src="https://img.shields.io/badge/Tier-Professional-black.svg"/>

```shell
curl "https://api.tokenanalyst.io/analytics/private/v1/erc20_exchanges_flow_historical/last?token=usdc&direction=outflow&format=json&key=API_KEY"
```

> The above command returns JSON structured like this:

```json
[
  {
    "date": "2018-11-06",
    "token_name": "USDC",
    "exchange": "Kucoin",
    "outflow": 509.689581,
    "price": 1.0,
    "outflow_usd": 511.09,
    "number_of_txns": 3,
    "avg_txn_value": 169.896527,
    "avg_txn_value_usd": 170.36
  },
  {
    "date": "2018-11-07",
    "token_name": "USDC",
    "exchange": "Kucoin",
    "outflow": 3585.887836,
    "price": 1.01,
    "outflow_usd": 3609.0,
    "number_of_txns": 3,
    "avg_txn_value": 1195.2959453333333,
    "avg_txn_value_usd": 1203.0
  }
]
```

This endpoint returns the outflow of Stablecoins from exchange wallets. The `avg_txn_value` is the average transaction value for transactions flowing out of exchange wallets on a given day.

### HTTP Request

`GET https://api.tokenanalyst.io/analytics/private/v1/erc20_exchanges_flow_historical/last?`

### Query Parameters

| Parameter | Type     | Description                                         |
| --------- | -------- | --------------------------------------------------- |
| key       | _string_ | Your unique API key                                 |
| format    | _string_ | What format you want your data in (`json` or `csv`) |
| token     | _string_ | `usdc`                                              |
| direction | _string_ | `outflow`                                           |



## V2 Stablecoin Full Historical Outflow from Exchanges (with 1 hour granularity)

<img src="https://img.shields.io/badge/Tier-Professional-black.svg"/>

```shell
curl "https://api.tokenanalyst.io/analytics/private/v1/erc20_exchanges_flow_window_historical/last?token=omg&direction=outflow&window=1h&format=json&key=API_KEY"
```

> The above command returns JSON structured like this:

```json
[
  {
    "date": "2018-11-06",
    "hour": "11:00:00",
    "token_name": "USDC",
    "exchange": "Kucoin",
    "outflow": 509.689581,
    "price": 1.0,
    "outflow_usd": 511.09,
    "number_of_txns": 3,
    "avg_txn_value": 169.896527,
    "avg_txn_value_usd": 170.36
  },
  {
    "date": "2018-11-07",
    "hour": "12:00:00",
    "token_name": "USDC",
    "exchange": "Kucoin",
    "outflow": 3585.887836,
    "price": 1.01,
    "outflow_usd": 3609.0,
    "number_of_txns": 3,
    "avg_txn_value": 1195.2959453333333,
    "avg_txn_value_usd": 1203.0
  }
]
```

This endpoint returns the outflow of stablecoins from exchange wallets. The `avg_txn_value`, `outflow`, and `number_of_txns` are calculated over the window (either 1 hour or 1 day). `hour` is in UTC

### HTTP Request

`GET https://api.tokenanalyst.io/analytics/private/v1/erc20_exchanges_flow_window_historical/last?`

### Query Parameters

| Parameter | Type     | Description                                         |
| --------- | -------- | --------------------------------------------------- |
| key       | _string_ | Your unique API key                                 |
| format    | _string_ | What format you want your data in (`json` or `csv`) |
| token     | _string_ | `usdt`                                               |
| direction | _string_ | `outflow`                                           |
| window    | _string_ | `1h` or `1d`                                        |
