# Unit Conversion

## Tokens

Every token in Ethereum has an associated "decimals" value. This effectively specifies how divisible the token is. For example, 100 USDC is actually stored as 100 \* 10^18 USDC on Ethereum itself. Here is a table for the tokens supported by SportX and their associated decimals value

| Token | SX Network Address                            | Decimals |
| ----- | --------------------------------------------- | -------- |
| USDC  | See `https://api.sx.bet/metadata` for address | 6        |
| DAI   | See `https://api.sx.bet/metadata` for address | 18       |
| WETH  | See `https://api.sx.bet/metadata` for address | 18       |

To convert from nominal units (such as 100 USDC) to Ethereum units which are used in the API, you can do the following.

`ethereumAmount = nominalAmount * 10^decimals`

Similarly, to convert from Ethereum units to nominal units, you can do the following

`nominalAmount = ethereumAmount / 10^decimals`

where `decimals` is specified in the above table.

## Odds

Odds are specified in an implied odds format like `8391352143642350000`. To convert to a readable implied odds, divide by `10^20`. `8391352143642350000` for example is 0.0839 or 8.39%

To convert from implied odds to decimal odds, inverse the number. For example, 0.0839 in decimal format is `1/0.0839 = 11.917`.

## Bookmaker odds

```json
{
  "fillAmount": "0",
  "orderHash": "0xb46e5fff6498f061e93c4f5ed501ee72d924180d6aa78cdfd4d188d3383c91d4",
  "marketHash": "0x0eeace4a9bbf6235bc59695258a419ed3a05a2c8e3b6a58fb71a0d9e6b031c2b",
  "maker": "0x63a4491dC73245E181c47BAe0ae9d6627E56dE55",
  "totalBetSize": "10000000000000000000",
  "percentageOdds": "70455284072443640000",
  "expiry": 2209006800,
  "apiExpiry": 1631233201
  "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
  "executor": "0x3E91041b9e60C7275f8296b8B0a97141e6442d49",
  "salt": "69415402816762328320330277846098411244657139277332120954321492419616371539163",
  "isMakerBettingOutcomeOne": true,
  "signature": "0x2aaea5b7c86166c0fbf2745c66aff794a23d21ac71ee143d08706700adbb59aa4c9b862286cf736acae5a74b10847ced73b628f4396eaab0af13b0c637fe4d021b",
  "createdAt": "2021-06-04T17:42:07.257Z"
}
```

It's important to note how odds are displayed on sx.bet. Recall from [the order section](#get-active-orders) that `percentageOdds` is from the perspective of the market maker. The odds that are displayed on sx.bet in the order books are what the taker will be receiving. Let's run through an example.

Suppose an order looks like the one on the right.

Here the maker is betting outcome one (`isMakerBettingOutcomeOne = true`) and receiving implied odds of `70455284072443640000 / 10^20 = 0.704552841`. Therefore the taker is betting _outcome two_ and receiving implied odds of `1 - 0.704552841 = 0.295447159`. This would be displayed on sx.bet (what the user sees) under the second order book with odds of 29.5% in implied format, or `1 / 0.295447159 = 3.3847` in decimal format.

![bookmaker_odds_example](/images/bookmaker_odds_example.png)
