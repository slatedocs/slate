# Trades

## Get active trades

```shell
curl --location --request POST 'https://api.sx.bet/trades'
```

> The above command returns JSON structured like this:

```json
{
  "status": "success",
  "data": {
    "trades": [
      {
        "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
        "bettor": "0x63a4491dC73245E181c47BAe0ae9d6627E56dE55",
        "stake": "10236134166947574099",
        "odds": "50583446830801460000",
        "orderHash": "0xb47329db2a3f612748094f415f9bf478cbed2f196548ec68154bd1fc543a6f09",
        "marketHash": "0x3fd03af14bf11264f5274ed4c8cc283e4479d29d33e17409e8e7d9b26ca9f030",
        "maker": true,
        "betTime": 1607708054,
        "settled": true,
        "settleValue": 1,
        "bettingOutcomeOne": false,
        "fillHash": "0xbe846c92bec584c4d2215df76ac7d53ebab25f81a30cca5811fb93f35e8b5321",
        "tradeStatus": "SUCCESS",
        "valid": true,
        "outcome": 1,
        "settleDate": "2020-12-11T20:17:45.990Z"
      },
      {
        "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
        "bettor": "0x683bcf3ecc5A6e2E99ff83f3300515a584108391",
        "stake": "9999999999999999999",
        "odds": "49416553169198540000",
        "orderHash": "0xb47329db2a3f612748094f415f9bf478cbed2f196548ec68154bd1fc543a6f09",
        "marketHash": "0x3fd03af14bf11264f5274ed4c8cc283e4479d29d33e17409e8e7d9b26ca9f030",
        "maker": false,
        "betTime": 1607708054,
        "settled": true,
        "settleValue": 1,
        "bettingOutcomeOne": true,
        "fillHash": "0xbe846c92bec584c4d2215df76ac7d53ebab25f81a30cca5811fb93f35e8b5321",
        "tradeStatus": "SUCCESS",
        "valid": true,
        "outcome": 1,
        "settleDate": "2020-12-11T20:17:45.990Z"
      },
      {
        "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
        "bettor": "0xE965292B97CD666e85FaB99e2732b1A71046cf3F",
        "stake": "17592800276256254757",
        "odds": "69184587813620070000",
        "orderHash": "0x1534133364d8b18d803a9419914bb89a651de5e9fa1845868d6844a6670c4762",
        "marketHash": "0xcb8285aeef17d824b76cf4a00ba5f2bf256048114937c85609897e7b8967e9ca",
        "maker": true,
        "betTime": 1607719092,
        "settled": true,
        "settleValue": 1,
        "bettingOutcomeOne": true,
        "fillHash": "0xc0240cf27c111d843bc4cf2de0521ab097223de933125857343e7a6fba469172",
        "tradeStatus": "SUCCESS",
        "valid": true,
        "outcome": 1,
        "settleDate": "2020-12-11T22:02:19.484Z"
      },
      {
        "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
        "bettor": "0x5aC843EecBf67669d4003aa49aE5e0136dc73365",
        "stake": "7835984995472770999",
        "odds": "30815412186379930000",
        "orderHash": "0x1534133364d8b18d803a9419914bb89a651de5e9fa1845868d6844a6670c4762",
        "marketHash": "0xcb8285aeef17d824b76cf4a00ba5f2bf256048114937c85609897e7b8967e9ca",
        "maker": false,
        "betTime": 1607719092,
        "settled": true,
        "settleValue": 1,
        "bettingOutcomeOne": false,
        "fillHash": "0xc0240cf27c111d843bc4cf2de0521ab097223de933125857343e7a6fba469172",
        "tradeStatus": "SUCCESS",
        "valid": true,
        "outcome": 1,
        "settleDate": "2020-12-11T22:02:19.484Z"
      }
    ],
    "nextKey": "60e4b70dc476a37a5b1b15ae",
    "pageSize": 4
  }
}
```

This endpoint retrieves past trades on the exchange split up by order. This is a paginated endpoint. For example, if a trade fills more than one order at once, it will show up as two entries for the bettor.

### HTTP Request

`POST https://api.sx.bet/trades`

### Request payload parameters

| Name          | Required | Type     | Description                                                                                                     |
| ------------- | -------- | -------- | --------------------------------------------------------------------------------------------------------------- |
| startDate     | false    | number   | Only get trades placed after this time in UNIX seconds                                                          |
| endDate       | false    | number   | Only get trades placed before this time in UNIX seconds                                                         |
| bettor        | false    | string   | Only get trades placed by this bettor (regardless if maker or taker)                                            |
| settled       | false    | boolean  | If `true`, only get settled trades                                                                              |
| marketHashes  | false    | string[] | Only get trades for particular markets                                                                          |
| baseToken     | false    | string   | Only get trades placed for a particular token                                                                   |
| maker         | false    | boolean  | If `true`, only get trades where the bettor is the maker                                                        |
| affiliate     | false    | string   | Only get trades under this affiliate                                                                            |
| pageSize      | false    | number   | Requested page size. Each call will only return up to this amount of records. Default is 100.                   |
| paginationKey | false    | string   | Used for pagination. Pass the `nextKey` returned from the previous request to retrieve the next set of records. |
| tradeStatus   | false    | string   | Filter trades to see only those with `SUCCESS` or `FAILED` status'                                              |

### Response format

| Name       | Type    | Description                                                                       |
| ---------- | ------- | --------------------------------------------------------------------------------- |
| status     | string  | `success` or `failure` if the request succeeded or not                            |
| data       | object  | The response data                                                                 |
| > trades   | Trade[] | The trades for the request                                                        |
| > nextKey  | string  | Use this key as the `paginationKey` to retrieve the next set of records, if any   |
| > pageSize | number  | Maximum amount of records on this page. Will be equal to the `pageSize` passed in |

A `Trade` object has the following format

| Name              | Type    | Description                                                                                                                          |
| ----------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| baseToken         | string  | The token in which this trade was placed                                                                                             |
| bettor            | string  | The address of the bettor who placed the trade                                                                                       |
| stake             | string  | Exact token amount that was staked for the bet. To convert into a readable token amount, see [the token conversion section](#tokens) |
| odds              | string  | Implied odds that the bettor received for this bet. Divide by 10^20 to get the odds in decimal format.                               |
| orderHash         | string  | The unique identifier of the order that was filled for this trade                                                                    |
| marketHash        | string  | The unique identifier of the market for which this trade was placed                                                                  |
| maker             | boolean | `true` if the bettor is market maker in this trade                                                                                   |
| betTime           | number  | The time in UNIX seconds when the trade was placed                                                                                   |
| settled           | boolean | `true` if this bet is settled (this refers to if the bet was won lost or voided, not if the trade succeeded or not)                  |
| bettingOutcomeOne | boolean | `true` if the bettor is betting outcome one in the market                                                                            |
| fillHash          | string  | The unique identifier for this trade                                                                                                 |
| tradeStatus       | string  | `SUCCESS` or `FAILED` depending on if this trade succeeded or not                                                                    |
| valid             | boolean | `true` if the trade counts toward competitions or tournaments                                                                        |
| outcome           | number  | with `settled=true`, this will be 0, 1, or 2 depending on the final outcome of the market                                            |
| settleDate        | string  | ISO formatted date string of when the trade was settled                                                                              |

## Get consolidated trades

```shell
curl --location --request POST 'https://api.sx.bet/trades/consolidated' \
--header 'Content-Type: application/json''
```

> The above command returns JSON structured like this:

```json
{
  "status": "success",
  "data": {
    "trades": [
      {
        "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
        "tradeStatus": "SUCCESS",
        "bettor": "0x025b9FD9F1ed818d688e19c5F43c500bf44cEA47",
        "totalStake": "4.999999999999999999",
        "weightedAverageOdds": "67564738292011016000",
        "marketHash": "0x7b27d766b6e36b87e2b7924f792c4f84d9b459318735d69cbb7d695b0857f8d5",
        "maker": false,
        "settled": false,
        "fillHash": "0xc44e72f94e70ede9742c6b8aeb77e743e0cbf753ff3eae8bd4f1ab98b9260f0e",
        "gameLabel": "Australia vs New Zealand",
        "bettingOutcomeLabel": "Australia",
        "sportXeventId": "L6350002",
        "bettingOutcome": 1,
        "gameTime": "2021-01-06T23:30:00.000Z",
        "leagueLabel": "International Test",
        "outcome": 0,
        "netReturn": "4.999999999999999999"
      },
      {
        "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
        "tradeStatus": "SUCCESS",
        "bettor": "0x025b9FD9F1ed818d688e19c5F43c500bf44cEA47",
        "totalStake": "4.999999999999999999",
        "weightedAverageOdds": "67564738292011016000",
        "marketHash": "0x7b27d766b6e36b87e2b7924f792c4f84d9b459318735d69cbb7d695b0857f8d5",
        "maker": false,
        "settled": false,
        "fillHash": "0xc44e72f94e70ede9742c6b8aeb77e743e0cbf753ff3eae8bd4f1ab98b9260f0e",
        "gameLabel": "Australia vs New Zealand",
        "bettingOutcomeLabel": "Australia",
        "sportXeventId": "L6350002",
        "bettingOutcome": 1,
        "gameTime": "2021-01-06T23:30:00.000Z",
        "leagueLabel": "International Test",
        "outcome": 0,
        "netReturn": "4.999999999999999999"
      }
    ],
    "count": 100
  }
}
```

This endpoint retrieves past consolidated trades on the exchange via pagination. If a trade fills multiple orders, it will show up as one entry here per bettor.

### HTTP Request

`POST https://api.sx.bet/trades/consolidated`

### Request payload parameters

| Name          | Required | Type    | Description                                                        |
| ------------- | -------- | ------- | ------------------------------------------------------------------ |
| bettor        | false    | string  | Only get trades placed by this bettor                              |
| settled       | true     | boolean | If `true` only get settled trades                                  |
| page          | true     | number  | Page number for pagination                                         |
| perPage       | true     | number  | Amount of records to fetch per page                                |
| sortBy        | true     | string  | Which field to sort by (see response for field names)              |
| sortAsc       | true     | boolean | If `true`, sorts in ascending order                                |
| maker         | false    | boolean | If `true`, only gets trades where the bettor was a market maker    |
| sportXeventId | false    | string  | Only gets trades for this event ID                                 |
| tradeStatus   | false    | string  | Filter trades to see only those with `SUCCESS` or `FAILED` status' |

### Response format

| Name     | Type                | Description                                            |
| -------- | ------------------- | ------------------------------------------------------ |
| status   | string              | `success` or `failure` if the request succeeded or not |
| data     | any                 | The response data                                      |
| > trades | ConsolidatedTrade[] | The consolidated trades for this request               |
| > count  | number              | Total count of trades for this query                   |

A `ConsolidatedTrade` object has the following format

| Name                | Type    | Description                                                                                                                                 |
| ------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| baseToken           | string  | The token in which this trade was placed                                                                                                    |
| tradeStatus         | string  | `SUCCESS` or `FAILED` depending on if this trade succeeded or not                                                                           |
| bettor              | string  | The address of the bettor who placed the trade                                                                                              |
| totalStake          | string  | Total nominal stake of the trade                                                                                                            |
| weightedAverageOdds | string  | Weighted average odds (based on stake) of the trade if the trade filled multiple orders. Divide by 10^20 to get the odds in decimal format. |
| marketHash          | string  | The unique identifier of the market for which this trade was placed                                                                         |
| maker               | boolean | `true` if the bettor is market maker in this trade                                                                                          |
| settled             | boolean | `true` if this bet is settled (this refers to if the bet was won lost or voided, not if the trade succeeded or not)                         |
| fillHash            | string  | The unique identifier for this trade                                                                                                        |
| gameLabel           | string  | A general label for the market                                                                                                              |
| bettingOutcomeLabel | string  | Which team/side the bettor bet                                                                                                              |
| sportXeventId       | string  | The unique fixture ID for this trade                                                                                                        |
| bettingOutcome      | number  | `1` if the bettor is betting outcome one, `2` otherwise                                                                                     |
| gameTime            | string  | ISO formatted date string of when the game is suppossed to occur                                                                            |
| leagueLabel         | string  | The name of this league                                                                                                                     |
| outcome             | number  | With `settled=true`, this will be 0, 1, or 2 depending on the final outcome of the market                                                   |
