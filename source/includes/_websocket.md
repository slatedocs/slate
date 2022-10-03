# Websocket API

You can connect to the websocket API and listen for realtime changes in several things such as order books, markets, scores, and line updates.

## Initialization

```javascript
import * as ably from "ably";

async function initialize() {
  const realtime = new ably.Realtime.Promise({
    authUrl: `https://api.sx.bet/user/token`,
  });
  await new Promise<void>((resolve, reject) => {
    realtime.connection.on("connected", () => {
      resolve();
    });
    // 10s timeout to connect
    setTimeout(() => reject(), 10000);
  });
}
```

We use the Ably SDK to allow users to connect to our API. It supports pretty much every major language but all of the examples on this page will be in JavaScript. The API is relatively identical across languages though. See [this link](#https://ably.com/documentation/quick-start-guide) for a basic overview of the API in other languages.

<aside class="warning">
You only need one instance of the <code>ably</code> object to connect to the API. Connections to multiple channels are multiplexed though the single network connection. If you create too many individual connections, you will be forcefully unsubscribed from all channels and disconnected.
</aside>

All the examples following assume you have a `realtime` object in scope following the initialization code to the right.

## Market updates

```javascript
const channel = realtime.channels.get(`markets`);
channel.subscribe((message) => {
  console.log(message.data);
});
```

> The above command returns JSON structured like this:

```json
[
  {
    "gameTime": 1625674200,
    "group1": "MLB",
    "homeTeamFirst": false,
    "leagueId": 171,
    "leagueLabel": "MLB",
    "line": 7,
    "liveEnabled": false,
    "marketHash": "0x384c6d8e17c9b5522a17f7bb049ede7d3dd9dd1311232fe854e7f9f4708dfc4c",
    "outcomeOneName": "Over 7.0",
    "outcomeTwoName": "Under 7.0",
    "outcomeVoidName": "NO_GAME_OR_EVEN",
    "sportId": 3,
    "sportLabel": "Baseball",
    "sportXeventId": "L7186379",
    "status": "ACTIVE",
    "teamOneName": "Tampa Bay Rays",
    "teamTwoName": "Cleveland Indians",
    "type": 2
  }
]
```

Subscribe to all changes in markets on sx.bet. You will get updates when

- A new market is added
- A market is removed (set to `INACTIVE`)
- A market's fields have changed (for example, game time has changed or the market has settled)

### Channel name format

`markets`

### Message payload format

See [the markets section](#get-specific-markets) for the format of the message

## Line changes

```javascript
const channel = realtime.channels.get(`main_line`);
channel.subscribe((message) => {
  console.log(message.data);
});
```

> The above command returns JSON structured like this:

```json
{
  "marketHash": "0x38cceead7bda65c18574a34994ebd8af154725d08aa735dcbf26247a7dcc67bd",
  "marketType": 3,
  "sportXeventId": "L7178624"
}
```

Subscribe to all line changes. Messages are sent for particular combinations of event IDs and market types. Note that only market types with lines will have updates sent. See [the active markets section](#get-active-markets) for details on which types have lines.

### Channel name format

`main_line`

### Message payload format

| Name          | Type   | Description                                             |
| ------------- | ------ | ------------------------------------------------------- |
| marketHash    | string | The market which is now the main line for this event ID |
| marketType    | number | The type of market this update refers to.               |
| sportXeventId | string | The event ID for this update                            |

To get the actual line, you'll have to fetch the market using the `marketHash`

## Live score updates

```javascript
const sportXeventId = "L7178624";
const channel = realtime.channels.get(`live_scores:${sportXeventId}`);
channel.subscribe((message) => {
  console.log(message.data);
});
```

> The above command returns JSON structured like this:

```json
{
  "teamOneScore": 2,
  "teamTwoScore": 1,
  "sportXeventId": "L7178624",
  "currentPeriod": "4th Set",
  "periodTime": "-1",
  "sportId": 6,
  "leagueId": 1263,
  "periods": [
    {
      "label": "1st Set",
      "isFinished": true,
      "teamOneScore": "4",
      "teamTwoScore": "6"
    },
    {
      "label": "2nd Set",
      "isFinished": true,
      "teamOneScore": "6",
      "teamTwoScore": "3"
    },
    {
      "label": "3rd Set",
      "isFinished": true,
      "teamOneScore": "7",
      "teamTwoScore": "5"
    },
    {
      "label": "4th Set",
      "isFinished": false,
      "teamOneScore": "1",
      "teamTwoScore": "2"
    },
    {
      "label": "Game",
      "isFinished": false,
      "teamOneScore": "0",
      "teamTwoScore": "0"
    }
  ],
  "extra": "[{\"Name\":\"Turn\",\"Value\":\"1\"},{\"Name\":\"DoubleFaults\",\"Value\":\"{\\\"3/6\\\":\\\"0,0,0,0,0,0\\\",\\\"3/7\\\":\\\"0,2,0,0,0,0\\\",\\\"3/4\\\":\\\"0,0,0,0,0\\\",\\\"3/5\\\":\\\"0,0,0,0\\\",\\\"1/4\\\":\\\"0,0,0,0\\\",\\\"3/2\\\":\\\"0,0,0,0,0,0\\\",\\\"1/5\\\":\\\"0,0,0,0,0\\\",\\\"3/3\\\":\\\"0,0,0,0,0\\\",\\\"1/6\\\":\\\"2,2,0,0,0,0,2,0,0,0\\\",\\\"1/7\\\":\\\"0,0,0,0,0,0\\\",\\\"3/12\\\":\\\"0,0,0,0,0,0,0\\\",\\\"3/1\\\":\\\"0,0,0,0,0\\\",\\\"1/1\\\":\\\"0,0,0,0,0\\\",\\\"1/2\\\":\\\"0,0,0,0,0\\\",\\\"3/11\\\":\\\"0,0,0,0,0,0,2,0\\\",\\\"1/3\\\":\\\"0,0,0,0,0\\\",\\\"3/8\\\":\\\"0,0,1,0,0,0,0,0,0,0\\\",\\\"1/8\\\":\\\"0,0,0,0,0\\\",\\\"3/9\\\":\\\"0,0,0,0,0\\\",\\\"1/9\\\":\\\"0,0,0,0,0,0,0,0\\\",\\\"2/7\\\":\\\"0,0,0,0,0,0\\\",\\\"2/6\\\":\\\"0,0,0,0,0\\\",\\\"2/5\\\":\\\"0,0,0,0,0,0,0,0,0,0\\\",\\\"2/4\\\":\\\"0,0,0,0,0,0,0,0\\\",\\\"2/3\\\":\\\"0,0,0,0\\\",\\\"2/2\\\":\\\"0,0,0,0,0,0,0,0\\\",\\\"2/1\\\":\\\"0,0,0,0,0\\\",\\\"4/1\\\":\\\"0,0,2,0,2,0\\\",\\\"4/3\\\":\\\"0,0,0,0,0\\\",\\\"4/2\\\":\\\"0,0,0,0,0,0,0,0\\\",\\\"3/10\\\":\\\"0,0,0,0,0,0\\\",\\\"2/9\\\":\\\"0,0,0,0,0\\\",\\\"1/10\\\":\\\"0,0,0,0\\\",\\\"2/8\\\":\\\"0,0,0,0\\\"}\"},{\"Name\":\"CourtSurfaceType\",\"Value\":\"Grass\"},{\"Name\":\"Aces\",\"Value\":\"{\\\"3/6\\\":\\\"0,0,0,0,0,0\\\",\\\"3/7\\\":\\\"0,0,0,0,0,0\\\",\\\"3/4\\\":\\\"0,0,0,0,0\\\",\\\"3/5\\\":\\\"0,2,0,0\\\",\\\"1/4\\\":\\\"2,2,0,0\\\",\\\"3/2\\\":\\\"0,0,0,0,0,0\\\",\\\"1/5\\\":\\\"0,0,0,0,0\\\",\\\"3/3\\\":\\\"0,0,0,0,2\\\",\\\"1/6\\\":\\\"0,0,0,0,0,0,0,0,0,0\\\",\\\"1/7\\\":\\\"0,0,0,0,0,0\\\",\\\"3/12\\\":\\\"1,0,0,0,0,0,0\\\",\\\"3/1\\\":\\\"0,0,0,2,0\\\",\\\"1/1\\\":\\\"0,0,0,0,0\\\",\\\"1/2\\\":\\\"0,2,0,0,0\\\",\\\"3/11\\\":\\\"0,0,0,0,0,0,0,0\\\",\\\"1/3\\\":\\\"0,0,0,0,0\\\",\\\"3/8\\\":\\\"0,0,0,0,0,0,0,0,0,0\\\",\\\"1/8\\\":\\\"0,0,0,0,0\\\",\\\"3/9\\\":\\\"0,0,0,0,0\\\",\\\"1/9\\\":\\\"0,0,0,0,0,0,0,0\\\",\\\"2/7\\\":\\\"0,0,0,0,0,0\\\",\\\"2/6\\\":\\\"0,0,0,0,0\\\",\\\"2/5\\\":\\\"0,0,0,0,0,0,0,0,0,0\\\",\\\"2/4\\\":\\\"0,0,0,0,0,0,0,0\\\",\\\"2/3\\\":\\\"0,0,0,0\\\",\\\"2/2\\\":\\\"0,0,0,0,0,0,0,0\\\",\\\"2/1\\\":\\\"0,0,0,0,0\\\",\\\"4/1\\\":\\\"0,0,0,0,0,0\\\",\\\"4/3\\\":\\\"0,0,0,0,0\\\",\\\"4/2\\\":\\\"2,0,0,0,0,0,0,0\\\",\\\"3/10\\\":\\\"0,0,0,0,0,0\\\",\\\"2/9\\\":\\\"0,0,0,0,0\\\",\\\"1/10\\\":\\\"0,0,2,0\\\",\\\"2/8\\\":\\\"2,0,0,0\\\"}\"}]"
}
```

Subscribe to live score changes for a particular event.

### Channel name format

`live_scores:{sportXeventId}`

| Name          | Type   | Description                           |
| ------------- | ------ | ------------------------------------- |
| sportXeventId | string | The event ID you wish to subscribe to |

### Message payload format

| Name          | Type     | Description                                                                              |
| ------------- | -------- | ---------------------------------------------------------------------------------------- |
| teamOneScore  | number   | The current score for team one. Referring to `teamOneName` in the `Market` object itself |
| teamTwoScore  | number   | The current score for team two. Referring to `teamTwoName` in the `Market` object itself |
| sportXeventId | string   | The event ID for this update                                                             |
| currentPeriod | string   | An identifier for the current period                                                     |
| periodTime    | string   | The current time for the period. "-1" if not applicable (for example, in tennis)         |
| sportId       | number   | The sport ID for this market                                                             |
| leagueId      | number   | The league ID for this market                                                            |
| periods       | `Period` | Individual period information                                                            |
| extra         | string   | JSON encoded extra data for this live score update                                       |

where a `Period` object looks like

| Name         | Type    | Description                                                                     |
| ------------ | ------- | ------------------------------------------------------------------------------- |
| label        | string  | The period name                                                                 |
| isFinished   | boolean | `true` if the period is over                                                    |
| teamOneScore | string  | The score of team one. Referring to `teamOneName` in the `Market` object itself |
| teamTwoScore | string  | The score of team two. Referring to `teamTwoName` in the `Market` object itself |

To get the actual line, you'll have to fetch the market using the `marketHash`

## Trade updates

```javascript
const channel = realtime.channels.get(`recent_trades`);
channel.subscribe((message) => {
  console.log(message.data);
});
```

> The above command returns JSON structured like this

```json
{
  "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
  "bettor": "0x814d79A9940CbC5Af4C19cAa118EC065a77CD31f",
  "stake": "9999999999999999999",
  "odds": "48442571331686290000",
  "orderHash": "0xf7321de419b8887eafe5756d25db37ed2796dfc2495a49e286f13c8533fddb67",
  "marketHash": "0x32d6c7d300dc44c795e2bdb0c735d9ad74fd2bbece890129d4a5ea0ec6b566f1",
  "maker": false,
  "betTime": 1625668455,
  "settled": false,
  "bettingOutcomeOne": true,
  "fillHash": "0x027f3237d9dc9dfa6068b60d852c3e9727768683a8c43b2e1a436029f0de924e",
  "status": "SUCCESS",
  "tradeStatus": "SUCCESS"
}
```

Subscribe to all trade updates on the exchange. You will receive updates when a trade is settled or a new trade is placed.

### Channel name format

`recent_trades`

### Message payload format

See [the trades section](#get-active-trades) for the format of the message

## Active order updates

```javascript
const user = "0x082605F78dD83A8423113ecbEB794Fb3FFE470a2";
const token = process.env.USDC_TOKEN_ADDRESS; // get from https://api.sx.bet/metadata
const channel = realtime.channels.get(`active_orders:${token}:${user}`);
channel.subscribe((message) => {
  console.log(message.data);
});
```

> The above command returns JSON structured like this

```json
[
  [
    "0x7bd766486f589f3e272d48294d8881fe68aae7704f7b2ef0a50bf6128be44271",
    "0xde53cf70e510eb5aa63a4bd6582579769980e0c1749b64caa7e6773c0c308188",
    "INACTIVE",
    "1000000000",
    "1000000000"
    "20306024864520233000",
    2209006800,
    1625691600,
    "1271418014917937117393617219009886912225128221921196717331617268846160092273",
    false,
    "0xbf099ab02255d5e2a9e063dc43a7afe96e65f5e8fc2ed3d2ba60b0a3fcadb3441bf32271293e85b7a795c9d86a2304035a0da3285113e746547e236bc58885e01c",
    "6982204685293715457"
  ]
]
```

Subscribe to changes in a particular user's orders. You will receive updates when orders are filled, cancelled, or posted. Note that for performance reasons, updates are delayed by at most 100ms.

### Channel name format

`active_orders:{token}:{user}`

| Name  | Type   | Description                                               |
| ----- | ------ | --------------------------------------------------------- |
| token | string | Restrict updates to only orders denominated in this token |
| user  | string | The user to subscribe to                                  |

### Message payload format

The order is packed into an array and the fields are sent in the below order, with the 0th index as the first row. Note that these are the same fields as mentioned in the [the orders section](#get-active-orders), with an additional `status` and `updateTime` field.

| Name                     | Type    | Description                                                                                                                                                                                                                                                                                                                                    |
| ------------------------ | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| orderHash                | string  | A unique identifier for this order                                                                                                                                                                                                                                                                                                             |
| marketHash               | string  | The market for this order                                                                                                                                                                                                                                                                                                                      |
| status                   | string  | "ACTIVE" if this order is still valid, "INACTIVE" otherwise                                                                                                                                                                                                                                                                                    |
| fillAmount               | string  | How much this order has been filled in Ethereum units up to a max of `totalBetSize`. See [the token section](#tokens) of how to convert this into nominal amounts                                                                                                                                                                              |     |
| totalBetSize             | string  | The total size of this order in Ethereum units. See the [the token section](#tokens) section for how to convert this into nominal amounts.                                                                                                                                                                                                     |
| percentageOdds           | string  | The odds that the `maker` receives in the sportx protocol format. To convert to an implied odds divide by 10^20. To convert to the odds that the taker would receive if this order would be filled in implied format, use the formula `takerOdds=1-percentageOdds/10^20`. See the [unit conversion section](#bookmaker-odds) for more details. |
| expiry                   | number  | Depcreated field: the time in unix seconds after which this order is no longer valid. Always 2209006800                                                                                                                                                                                                                                        |
| apiExpiry                | number  | The time in unix seconds after which this order is no longer valid                                                                                                                                                                                                                                                                             |
| salt                     | string  | A random number to differentiate identical orders                                                                                                                                                                                                                                                                                              |
| isMakerBettingOutcomeOne | boolean | `true` if the maker is betting outcome one (and hence taker is betting outcome two if filled)                                                                                                                                                                                                                                                  |
| signature                | string  | Signature of the maker on this order                                                                                                                                                                                                                                                                                                           |
| updateTime               | string  | Server-side clock time for the last modification of this order.                                                                                                                                                                                                                                                                                |

Note that the messages are sent in batches in an array. If you receive two updates for the same `orderHash` within an update, you can order them by `updateTime` after converting the `updateTime` to a BigInt or BigNumber.

## Order book updates

```javascript
const marketHash =
  "0x04b9af76dfb92e71500975db77b1de0bb32a0b2413f1b3facbb25278987519a7";
const token = "0xa25dA0331Cd053FD17C47c8c34BCCBAaF516C438";
const channel = realtime.channels.get(`order_book:${token}:${marketHash}`);
channel.subscribe((message) => {
  console.log(message.data);
});
```

> The above command returns JSON structured like this

```json
[
  [
    "0x7bd766486f589f3e272d48294d8881fe68aae7704f7b2ef0a50bf6128be44271",
    "INACTIVE",
    "1000000000",
    "0x9883D5e7dC023A441A01Ef95aF406C69926a0AB6",
    "1000000000",
    "20306024864520233000",
    2209006800,
    1625691600,
    "1271418014917937117393617219009886912225128221921196717331617268846160092273",
    false,
    "0xbf099ab02255d5e2a9e063dc43a7afe96e65f5e8fc2ed3d2ba60b0a3fcadb3441bf32271293e85b7a795c9d86a2304035a0da3285113e746547e236bc58885e01c",
    "6982204685293715457"
  ]
]
```

Subscribe to changes in a particular order book. You will receive updates when orders are filled, cancelled, or posted. Note that for performance reasons, updates are delayed by at most 100ms. Updates are packed into arrays to reduce total bandwidth.

### Channel name format

`order_book:{token}:{marketHash}`

| Name       | Type   | Description                                               |
| ---------- | ------ | --------------------------------------------------------- |
| token      | string | Restrict updates to only orders denominated in this token |
| marketHash | string | The market to subscribe to                                |

### Message payload format

The order is packed into an array and the fields are sent in the below order, with the 0th index as the first row. Note that these are the same fields as mentioned in the [the orders section](#get-active-orders), with an additional `status` and `updateTime` field.

| Name                     | Type    | Description                                                                                                                                                                                                                                                                                                                                    |
| ------------------------ | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| orderHash                | string  | A unique identifier for this order                                                                                                                                                                                                                                                                                                             |
| status                   | string  | "ACTIVE" if this order is still valid, "INACTIVE" otherwise                                                                                                                                                                                                                                                                                    |
| fillAmount               | string  | How much this order has been filled in Ethereum units up to a max of `totalBetSize`. See [the token section](#tokens) of how to convert this into nominal amounts                                                                                                                                                                              |
| maker                    | string  | The market maker for this order                                                                                                                                                                                                                                                                                                                |
| totalBetSize             | string  | The total size of this order in Ethereum units. See the [the token section](#tokens) section for how to convert this into nominal amounts.                                                                                                                                                                                                     |
| percentageOdds           | string  | The odds that the `maker` receives in the sportx protocol format. To convert to an implied odds divide by 10^20. To convert to the odds that the taker would receive if this order would be filled in implied format, use the formula `takerOdds=1-percentageOdds/10^20`. See the [unit conversion section](#bookmaker-odds) for more details. |
| expiry                   | number  | Depcreated field: the time in unix seconds after which this order is no longer valid. Always 2209006800                                                                                                                                                                                                                                        |
| apiExpiry                | number  | The time in unix seconds after which this order is no longer valid                                                                                                                                                                                                                                                                             |
| salt                     | string  | A random number to differentiate identical orders                                                                                                                                                                                                                                                                                              |
| isMakerBettingOutcomeOne | boolean | `true` if the maker is betting outcome one (and hence taker is betting outcome two if filled)                                                                                                                                                                                                                                                  |
| signature                | string  | Signature of the maker on this order                                                                                                                                                                                                                                                                                                           |
| updateTime               | string  | Server-side clock time for the last modification of this order.                                                                                                                                                                                                                                                                                |

Note that the messages are sent in batches in an array. If you receive two updates for the same `orderHash` within an update, you can order them by `updateTime` after converting the `updateTime` to a BigInt or BigNumber.
