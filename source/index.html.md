---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json
  - javascript
 

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---
 
# Lightning API v0 Beta Documentation

## Connect With Us

Follow us on twitter <a href="https://twitter.com/Suredbits">@Suredbits</a>

We invite you to join our Slack channel <a href="https://join.slack.com/t/suredbits/shared_invite/enQtNDEyMjY3MTg1MTg3LTYyYjkwOGUzMDQ4NDAwZjE1M2I3MmQyNWNlZjNlYjg4OGRjYTRjNWUwNjRjNjg4Y2NjZjAxYjU1N2JjMTU1YWM">Suredbits Slack</a>

## Background Resources
Thank you and welcome to Suredbits' Lightning App API documentation. This API allows you to query our NFL, NBA and Crypto Exchange data. Our NFL and NBA APIs offer multiple channels including teams, players, games, scores, and statistics.  Our Crypto Exchange API allows you to stream data on Trades, Tickers and Order Books. 

We are currently focused primarily on developers already familiar with Bitcoin and know Lightning or are interested in building apps using the Lightning protocol. However, if you are just starting out in cryptocurrency development, we have included some helpful links below.

<aside class="success">IMPORTANT: Suredbits is a Lightning application built on the Bitcoin protocol.  As of February 6, 2019, we have moved our API services to mainnet. We have kept some data available for free - on testnet - for testing and experiment.  See <a href="#Testnet"> Testnet Node </a> section below. </aside>

Here are some useful resources to help you learn and get started with Bicoin and Lightning Network.  Read and watch and come back when you're ready. 

1. <a href="https://bitcoin.org/en/download">Download Bitcoin Core</a>
2. <a href="http://lightning.network/">Lightning Network Background</a>
3. <a href="https://lightning.network/lightning-network-paper.pdf">Lightning Whitepaper</a>
4. <a href="https://www.youtube.com/watch?v=l1si5ZWLgy0">Introduction to Bitcoin</a>

## Recommended Client Library

We recommend using our custom <a href="https://github.com/suredbits/sb-api"> Javascript Client Library</a> for interacting with our API services. It supports all major implementations of the Lightning protocol: lnd, c-lightning and eclair.   

## Mainnet Node (paid) 
In order to access our paid API service, you will need to connect to our lightning node via your preferred lightning client.  

Our paid service offers complete coverage for all channels, endpoints and fields .  

The Lightning Node URL for our paid service is: 
<span style="color: blue"><code style="word-wrap: break-word;"> 038bdb5538a4e415c42f8fb09750729752c1a1800d321f4bb056a9f582569fbf8e@ln.suredbits.com </code></span>


<h2 id="Testnet"> Testnet Node (free) </h2>

In order to access our free API service, you will need to connect to our lightning node via your preferred lightning client.   

The Lightning Node URL for our testnet service is:

<span style="color:blue"><code style="word-wrap: break-word;" > 0338f57e4e20abf4d5c86b71b59e995ce4378e373b021a7b6f41dabb42d3aad069@ln.test.suredbits.com </code></span>


We provide a number of free data endpoints so users can experiment and learn the structure of our Lightning API service. To allow for complete testing, we make the following data avaialble for free on testnet:  

## Crypto Exchange Testnet API

Currently, we offer the trading pair `BTCUSD` data for free across all available exchanges. 

For Binance, the symbol is `BTCUSDT`.

## Crypto Futures Testnet API

Currently, we offer the trading pair `BTCUSD` data for free across all available exchanges. 

## NFL Testnet API 

> Example request for "Tom Brady" in "Players" endpoint

```json
{
  "channel":"players", 
  "lastName" : "Brady", 
  "firstName" : "Tom", 
  "uuid": "6dc1320d-de0e-40a5-8162-83d9eb4634de"
}

```

```javascript
import {  Lnd, Sockets } from "sb-api"
const ln = await Lnd()

const nfl = await Sockets.nflTestnet(ln)
const players = await nfl.players() // automatically queries for Tom Brady since we're on testnet
```

> Example request for "NE" (New England) roster in "Team" endpoint

```json
{
  "channel": "team", 
  "teamId": "NE", 
  "retrieve": "roster", 
  "uuid": "689c2c7d-cd08-4b2c-b87d-f1de10b4e94d"
}

```

```javascript
import {  Lnd, Sockets } from "sb-api"
const ln = await Lnd()

const nfl = await Sockets.nflTestnet(ln)
const roster = await nfl.roster({ teamId: "NE" })
```

> Example request for Tom Brady in "Stats" endpoint by lastName and firstName

```json
{
    "channel":"stats", 
    "lastName" : "Brady", 
    "firstName" : "Tom", 
    "year": 2018, 
    "week" : 2, 
    "seasonPhase" : "Postseason", 
    "statType" : "passing",
    "uuid": "b97247c2-8bd6-450e-b81c-3c5a725e2057"
}

```

```javascript
import {  Lnd, Sockets } from "sb-api"
const ln = await Lnd()

const nfl = await Sockets.nflTestnet(ln)
const stats = await nfl.statsByNameAndWeek({
  year: 2018,
  week: 2,
  seasonPhase: "Postseason",
  statType: "passing"
})
```

> Example request for Tom Brady in "Stats" endpoint by playerId and gameId

```json
{
  "channel":"stats", 
  "statType" : "passing", 
  "gameId" : "2019011300", 
  "playerId" : "00-0019596",
  "uuid": "aa334616-71e0-45ee-be6d-6dbce545bad3"
}

```

```javascript
import {  Lnd, Sockets } from "sb-api"
const ln = await Lnd()

const nfl = await Sockets.nflTestnet(ln)
const stats = await nfl.statsById({
  statType: "passing",
  gameId: "2019011300",
  playerId: "00-0019596"
})
```

Currently, we offer `Info` and `Games` data endpoints for free on testnet. 

In addition, to help developers build and test end-to-end applications, we offer a series of data across all endpoints: `Games`, `Players`, `Team` and `Stats` for a specific player.  

For testing, we provide data for **Tom Brady** for free on testnet.   

## NBA Testnet API 

> Example request for "Lebron James" in Players endpoint  

```json

{
  "channel": "players", 
  "lastName": "James", 
  "firstName": "Lebron", 
  "uuid": "2602b409-1737-49e5-a32d-62608d1e2c29"
}
```

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nbaTestnet(ln)
const players = await nba.players() // name is inferred automatically on testnet
```

> Example request for "LAL" (Los Angeles Lakers) in "Team" endpoint

```json
{
  "channel": "games", 
  "year": 2019, 
  "month": 1, 
  "day": 14, 
  "teamId":"LAL",
  "uuid": "2c48e899-01ef-443e-b455-144486b1c291"
}
```

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nbaTestnet(ln)
const games = await nba.games({ day: 14, month: 1, year: 2019, teamId: 'LAL' })
```

> Example request of Lebron James in "Stats" endpoint by playerId and gameId

```json
{
  "channel": "stats", 
  "gameId": "21800500", 
  "playerId": "2544", 
  "uuid": "ddc2632e-f9bb-4ea9-bdf6-992e1590f676"
}
```

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nbaTestnet(ln)
const stats = await nba.statsById({ gameId: '21800500', playerId: '2544' })
```

> Example request for Lebron James in "Stats" endpoint by lastName and firstName 

```json

{
  "channel": "stats", 
  "lastName": "James", 
  "firstName": "Lebron", 
  "year": 2019, 
  "month": 1, 
  "day": 13, 
  "uuid": "689c2c7d-cd08-4b2c-b87d-f1de10b4e94d"
}

```

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nbaTestnet(ln)
const stats = await nba.statsByName({ year: 2019, month: 1, day: 13 }) 
// name is inferred automatically because we're on testnet
```

Currently, we offer `Info` and `Games` data endpoints for free. 

In addition, to help developers build and test end-to-end applications, we offer a series of data across all endpoints: `Games`, `Players`, `Team` and `Stats` for a specific player.  

For testing, we provide data for **Lebron James** for free on testnet.   


## Payment & Pricing

### How to Pay

This is our recommended lnd lightning client library: <a href="https://github.com/Suredbits/sb-api-lnd">https://github.com/Suredbits/sb-api-lnd</a>

This is an alternative c-lightning client library: <a href="https://github.com/suredbits/lightning-charge">https://github.com/suredbits/lightning-charge</a>


### Pricing

<aside class="success"> All payments are transacted in cryptocurrency.  For convenience, we have quoted prices in USD equiavalents. </aside>

<aside class="success"> We reserve the right to change pricing as necessary.  We also reserve the right to change what is available in our free API offerings. Any changes in pricing or services will be announced via our Twitter <a href="https://twitter.com/Suredbits">@Suredbits</a> </aside>

For NFL Data and NBA Data APIs, the cost is $.01 (1 cent) per call.  

For our streaming Crypto Exchange API, the cost is $.10 (10 cents) per sixty seconds of streaming data.   

Anything less than 60 seconds will be prorated accordingly.  

A minimum of 10 satoshis will be charged for all streaming data calls. 

## UUID

> Example data returned with valid UUID

```json
{
  "uuid":"123e4567-e89b-12d3-a456-426655440000",
  "data":
    {
      "version":"8",
      "lastRosterDownload":"2018-07-20T141610.664Z",
      "seasonType":"Regular",
      "seasonYear":2017,
      "week":"NflWeek17" 
    }
 }
```

```javascript
// our JS client library automatically generates and inserts UUIDs for you
```
<aside class="warning"> All request require a field called <b> uuid </b> </aside>  

A valid <span style="color:red"> `uuid` </span> is required for all requests and will appear on all invoices, data responses, and errors related to that request.  If no <span style="color:red"> `uuid` </span> is specified in a request, then there will be an error message returned.

## Format 

> Basic example request

```json
{  
   "channel":"players",
   "lastName":"Moss",
   "firstName":"Randy",
   "uuid":"bfbef9da-eb9e-418c-8f6b-963743355ef7"
}
```


> Example data returned

```javascript
  [
    { 
      playerId: "00-0011754",
      gsisName: "R.Moss",
      fullName: "Randy Moss",
      firstName: "Randy",
      lastName: "Moss",
      team: "UNK",
      position: "UNK",
      profileId: 2502220,
      profileUrl: "http://www.nfl.com/player/randymoss/2502220/profile",
      birthDate: "2/13/1977",
      college: "Marshall",
      yearsPro: 14,
      height: 76,
      weight: 210,
      status: "Unknown"
    }
  ]
```

```json 
{  
  "uuid":"bfbef9da-eb9e-418c-8f6b-963743355ef7",
  "data":
  [
    { 
      "playerId": "00-0011754",
      "gsisName": "R.Moss",
      "fullName": "Randy Moss",
      "firstName": "Randy",
      "lastName": "Moss",
      "team": "UNK",
      "position": "UNK",
      "profileId": 2502220,
      "profileUrl": "http://www.nfl.com/player/randymoss/2502220/profile",
      "birthDate": "2/13/1977",
      "college": "Marshall",
      "yearsPro": 14,
      "height": 76,
      "weight": 210,
      "status": "Unknown"
    }
  ]
}
```

Suredbits APIs are available via websockets with the following format:


<aside class="note">NOTE: All API requests must include the  "channel" field.  However, "channel" does not have to be the first field in the request. </aside>

<aside class="note">NOTE: All times are in Universal Time Coordinated or "UTC".  So be sure to do time zone conversions. </aside>

1. Send a request over the websocket 

2. Upon confirmation of a valid request, you will receive a Lightning Network invoice that should appear similar to the one below.

3. Pay that LN invoice in your lightning client 

4. Receive data :)

### Ping/Pong

To confirm your connection, send a <span style="color:red">`ping`</span> request. Ping has an optional `uuid` field for correlating multiple pongs to multiple pings. 

<aside class="success"><code>{"event": "ping"}</code> should return <code>{"event":"pong"}</code></aside>


### Sample Lightning Invoice

A successful request will generate a lightning invoice that will look similar to the example below:

<span style="color:blue"><code style="word-wrap:break-word;">lnbcrt10n1pd5v2mwpp5ulxpj8ht4gvtqnyl8zuykfk4wcv6sz455ce5dy0e0lqt...</code></span>

# Crypto Exchange API 

## Crypto Exchange Websocket Endpoint 

This is the paid service url **wss://api.suredbits.com/exchange/v0** on mainnet.

This is the free version url **wss://test.api.suredbits.com/exchange/v0** on testnet. 

## Overview

### Trading Pairs Supported

Symbol | Binance | Bitfinex | Coinbase | Bitstamp | Gemini  |  Kraken |
------- | ------ | --------- | -------- | ------- | ------- | -------
`BTCUSDT` |    X     |         |          |         |         |
`ETHBTC`  |    X     |    X    |    X     |   X     |    X    |    X
`ETHUSDT` |    X     |         |          |         |         |
`BTCUSD`  |          |    X    |    X     |   X     |    X    |    X
`ETHUSD`  |          |    X    |    X     |   X     |    X    |    X



### Subscribe

> Example request format: 

```javascript
// Our library handles request construction for you
// Refer to the sections on tickers, trades and books
// for specfics on how to send requests
```

```json
{  
   "event":"subscribe",
   "channel":"trades",
   "symbol":"BTCUSDT",  
   "exchange":"binance",
   "duration":120000,
   "refundInvoice":"lnbcrt1pdace6qpp5my6nc58d50r5gk38ynyz...",
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8"
}
```

> Example subscription confirmation 

```javascript
// Our library handles request construction for you
// Refer to the sections on tickers, trades and books
// for specfics on how to send requests
```

```json
{  
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
   "exchange":"binance",
   "symbol":"BTCUSDT",
   "duration":100000,
   "event":"payment received"
}
```


To subscribe to a data stream, use the following command format:

Field | Type | Example
------ | ------ | -------
 `uuid`  | String | "123e4567-e89b-12d3-a456-426655440000"
 `event` | String | "subscribe"
 `channel` | String | "tickers" 
 `symbol`  | String | "ETHBTC"
 `exchange`  | String | "bitfinex" 
 `duration` | Integer (milliseconds) | "15000" 
 `refundInvoice`  | String | lnbcrt10n1pd5v2mwpp5ulxpj8ht...


### Snapshots
> Example of snapshot from trades channel

```javascript 
[
  {
    eventTime: 1543347647113,
    symbol: 'BTCUSDT',
    tradeId: 82634229,
    price: 3809.1,
    quantity: 0.293652,
    buyerId: 195007870,
    sellerId: 195007859,
    tradeTime: 1543347647109,
    marketMaker: false,
  }
]

```

```json
{  
   "uuid":"f8363f36-65dd-4a07-a3e0-75f38b816df7",
   "snapshot":[  
      {  
         "eventTime":1543347647113,
         "symbol":"BTCUSDT",
         "tradeId":82634229,
         "price":3809.1,
         "quantity":0.293552,
         "buyerId":195007870,
         "sellerId":195007859,
         "tradeTime":1543347647109,
         "marketMaker":false
      },
      ...
    ]
}
```

Upon subscribing to a channel an initial snapshot is sent.  The snapshot provides a view of the current state of the market.


### Sequence Identifier

In order to better monitor potential gaps in streaming data, we provide a sequence number for each returned data value. 

Example: `"seq": 21` , `"seq":437`, `"seq":2873` etc. 


### Refill

> Subscription refill 

```javascript
import { Lnd, Sockets } from "sb-api"

const ln = await Lnd()
const refundInvoice = await ln.receive()
const exchangeSocket = await Sockets.exchange(ln)
const sub = await exchangeSocket.books({
  duration: 10000,
  exchange: "bitfinex",
  refundInvoice,
  symbol: "ETHBTC",
  onData: data => console.log("received data", data),
  onSnapshot: snapshot => console.log("received snapshot: ", snapshot),
})
await sub.refill(60000) // adds one minute to our subscription
```
 


```json
{
    "event": "refill",
    "addedDuration": 60000, // adds one minute to our subscription
    "uuid": "8f2e4f08-2ef4-11e9-9f18-5f29bb1268a9"
}
```

You may refill your subscription at any time. 


### Unsubscribe
 
> Subscription cancellation

```javascript
import { Lnd, Sockets } from "sb-api"

const ln = await Lnd()
const refundInvoice = await ln.receive()
const exchangeSocket = await Sockets.exchange(ln)
const sub = await exchangeSocket.books({
  duration: 10000,
  exchange: "bitfinex",
  refundInvoice,
  symbol: "ETHBTC",
  onData: data => console.log("received data", data),
  onSnapshot: snapshot => console.log("received snapshot: ", snapshot),
})
await sub.unsubscribe()
```
```json
{
    "event": "unsubscribe",
    "uuid": "8f2e4f08-2ef4-11e9-9f18-5f29bb1268a9"
}
```
You may unsubscribe from a channel at any time. Any time remainaing will be refunded. 


### Maintenance

In the event of maintenance or service interruption, we will refund any remaining portion of your subscription. 


## Tickers

> Example request Tickers

```json
{  "event":"subscribe",
   "channel":"tickers",
   "symbol":"BTCUSDT",
   "exchange":"binance",
   "duration":120000,
   "refundInvoice":"lnbcrt1pdace6qpp5my6nc58d50r5gk...",
    "uuid":"dc48f38e-7f71-4ea2-8c4c-52c683db93fa"
}
```

```javascript
import { Lnd, Sockets } from "sb-api"

const ln = await Lnd()
const refundInvoice = await ln.receive()
const exchangeSocket = await Sockets.exchange(ln)
const tickersSub = await exchangeSocket.tickers({
  duration: 10000,
  exchange: "binance",
  symbol: "BTCUSDT",
  refundInvoice,
  onData: data => console.log("received data", data),
  onSnapshot: snapshot => console.log("received snapshot: ", snapshot),
  onSubscriptionEnded: dataset => console.log(`got dataset with ${dataset.length} elements`) 
  //                    ^^^ dataset is the list of all your 
  //                        previously received data points
})
```

> Example Tickers data

```javascript
// snapshot
[
  {
    eventTime: 1543849532563,
    symbol: 'BTCUSDT',
    priceChange: -253.84,
    priceChangePerc: -6.08,
    weightedAvePrice: 4079.82822535,
    prevClose: 4174.49,
    close: 3921.26,
    closeQuantity: 1.144132,
    bid: 3920.31,
    bidSize: 0.052611,
    ask: 3922.57,
    askSize: 1.207388,
    open: 4175.1,
    high: 4268,
    low: 3896.03,
    volume: 42258.714174,
    quoteVolume: 172408294.85387801,
    statOpenTime: 1543763132561,
    statCloseTime: 1543849532561,
    firstTradeId: 83998182,
    lastTradeId: 84182065,
    totalTrades: 183884,
  }
]


// data
{
  eventTime: 1541716718571,
  symbol: 'BTCUSDT',
  priceChange: -68.06,
  priceChangePerc: -1.036,
  weightedAvePrice: 6524.40647569,
  prevClose: 6575.83,
  close: 6503.16,
  closeQuantity: 0.040421,
  bid: 6501.05,
  bidSize: 0.123017,
  ask: 6503.16,
  askSize: 0.463804,
  open: 6571.22,
  high: 6594,
  low: 6471.22,
  volume: 12760.988421,
  quoteVolume: 83257875.49020969,
  statOpenTime: 1541630318568,
  statCloseTime: 1541716718568,
  firstTradeId: 77686104,
  lastTradeId: 77828352,
  totalTrades: 142249
}
```

```json

{  
   "uuid":"dc48f38e-7f71-4ea2-8c4c-52c683db93fa",
   "exchange":"binance",
   "symbol":"BTCUSDT",
   "duration":120000,
   "event":"payment received"
}

{  
   "uuid":"dc48f38e-7f71-4ea2-8c4c-52c683db93fa",
   "snapshot":[  
      {  
         "eventTime":1543849532563,
         "symbol":"BTCUSDT",
         "priceChange":-253.84,
         "priceChangePerc":-6.08,
         "weightedAvePrice":4079.82822535,
         "prevClose":4174.49,
         "close":3921.26,
         "closeQuantity":1.144132,
         "bid":3920.31,
         "bidSize":0.052611,
         "ask":3922.57,
         "askSize":1.207388,
         "open":4175.1,
         "high":4268,
         "low":3896.03,
         "volume":42258.714174,
         "quoteVolume":172408294.85387801,
         "statOpenTime":1543763132561,
         "statCloseTime":1543849532561,
         "firstTradeId":83998182,
         "lastTradeId":84182065,
         "totalTrades":183884
      }
   ]
}


{  
   "uuid":"dc48f38e-7f71-4ea2-8c4c-52c683db93fa",
   "data":{  
      "eventTime":1541716718571,
      "symbol":"BTCUSDT",
      "priceChange":-68.06,
      "priceChangePerc":-1.036,
      "weightedAvePrice":6524.40647569,
      "prevClose":6575.83,
      "close":6503.16,
      "closeQuantity":0.040421,
      "bid":6501.05,
      "bidSize":0.123017,
      "ask":6503.16,
      "askSize":0.463804,
      "open":6571.22,
      "high":6594,
      "low":6471.22,
      "volume":12760.988421,
      "quoteVolume":83257875.49020969,
      "statOpenTime":1541630318568,
      "statCloseTime":1541716718568,
      "firstTradeId":77686104,
      "lastTradeId":77828352,
      "totalTrades":142249,
   },
   "seq":123
}
```

The **Tickers** channel streams high level updates for given trading pairs.  See the table below for which exchanges return which fields.


Field | Type | Exchanges Supporting
------ | ------ | --------
`uuid`  | String | "123e4567-e89b-12d3-a456-426655440000"
`eventTime` | Integer | bitfinex, binance, coinbase, bitstamp, kraken
`symbol` | String | binance, coinbase, bitstamp, gemini, kraken
`priceChange` | Double | binance, bitfinex 
`priceChangePerc`  |  Double | binance, bitfinex 
`weightedAvePrice` |  Double | binance, bitstamp, kraken
`prevClose` | Double | binance 
`close` | Double | binance, bitfinex, kraken
`closeQuantity` |  Double | binance, kraken
`bid` | Double | bitfinex, binance, coinbase, bitstamp, gemini, kraken    
`bidSize` | Double |  bitfinex, binance, kraken 
`ask` | Double | bitfinex, binance, coinbase, bitstamp, gemini, kraken      
`askSize` | Double | bitfinex, binance, kraken        
`open`  | Double | binance, coinbase, bitstamp, kraken
`high`  | Double | binance, bitfinex, coinbase, bitstamp, kraken
`low`  | Double | binance, bitfinex, coinbase, bitstamp, kraken
`volume`  | Double | binance, bitfinex, coinbase, bitstamp, gemini, kraken
`quoteVolume` | Double| binance 
`statOpenTime` | Integer | binance, kraken
`statCloseTime`  | Integer | binance, gemini, kraken
`firstTradeId`  | Integer | binance 
`lastTradId`  | Integer | binance, coinbase
`totalTrades` | Integer | binance, kraken


## Trades

> Example request Trades

```json

{  "event":"subscribe",
   "channel":"trades",
   "symbol":"BTCUSDT",
   "exchange":"binance",
   "duration":12000,
   "refundInvoice":"lnbcrt1pdace6qpp5my6nc58d50r5gk38ynyz...",
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8"
}
```

```javascript
import { Lnd, Sockets } from "sb-api"

const ln = await Lnd()
const refundInvoice = await ln.receive()
const exchangeSocket = await Sockets.exchange(ln)
const tickersSub = await exchangeSocket.trades({
  duration: 10000,
  exchange: "gemini",
  symbol: "BTCUSD",
  refundInvoice,
  onData: data => console.log("received data", data),
  onSnapshot: snapshot => console.log("received snapshot: ", snapshot),
  onSubscriptionEnded: dataset => console.log(`got dataset with ${dataset.length} elements`) 
  //                    ^^^ dataset is the list of all your 
  //                        previously received data points
})
```

> Example Trades data

```javascript
// snapshot
[
  {
    eventTime: 1543839862868,
    symbol: 'BTCUSDT',
    tradeId: 84153760,
    price: 4038.81,
    quantity: 0.115984,
    buyerId: '199276007',
    sellerId: '199274414',
    tradeTime: 1543839862861,
    marketMaker: false,
  },
  // rest of elements omitted
  // for brevity
]


//data
{
  eventTime: 1541715784094,
  symbol: 'BTCUSDT',
  tradeId: 77827378,
  price: 6502.99,
  quantity: 0.030665,
  buyerId: '183136564',
  sellerId: '183136526',
  tradeTime: 1541715784094,
  marketMaker: false,
}

```

```json

{  
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
   "exchange":"binance",
   "symbol":"BTCUSDT",
   "duration":10000,
   "event":"payment received"
}

{  
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
   "snapshot":[  
      {  
         "eventTime":1543839862868,
         "symbol":"BTCUSDT",
         "tradeId":84153760,
         "price":4038.81,
         "quantity":0.115984,
         "buyerId":"199276007",
         "sellerId":"199274414",
         "tradeTime":1543839862861,
         "marketMaker":false
      },
      ...
    ]
}

{  
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
   "data":{  
      "eventTime":1541715784094,
      "symbol":"BTCUSDT",
      "tradeId":77827378,
      "price":6502.99,
      "quantity":0.030665,
      "buyerId":"183136564",
      "sellerId":"183136526",
      "tradeTime":1541715784094,
      "marketMaker":false,
   }
   "seq":893
}{  
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
   "data":{  
      "eventTime":1541715784161,
      "symbol":"BTCUSDT",
      "tradeId":77827379,
      "price":6501.35,
      "quantity":0.088033,
      "buyerId":"183136558",
      "sellerId":"183136565",
      "tradeTime":1541715784156,
      "marketMaker":true,
   }
   "seq":894
}
```

The **Trades** channel streams executed trades for a given trading pair.  See the table below for which exchanges returns which fields. 

Field |  Type | Exchanges Supporting 
------ | ------- | -----------
`uuid` | String | "123e4567-e89b-12d3-a456-426655440000"
`eventTime` | Integer | bitfinex, binance, kraken
`symbol` | String | binance, coinbase, kraken
`tradeId` | Integer | bitfinex, binance, coinbase, bitstamp, gemini 
`price` | Double | binance, bitfinex, coinbase, bitstamp, gemini, kraken
`quantity` | Double | bitfinex, binance, coinbase, bitstamp, gemini, kraken
`buyerId` | String | binance, coinbase, bitstamp
`sellerId` | String | binance, coinbase, bitstamp 
`tradeTime` | Integer | binance, coinbase, gemini, kraken
`marketMaker` |  Boolean | binance, coinbase, bitstamp, gemini, kraken


## Order Books

> Example request Order Books

```json
{ "event":"subscribe", 
  "channel":"books", 
  "symbol":"BTCUSD", 
  "exchange":"bitfinex", 
  "duration":15000,
  "refundInvoice":"lnbcrt1pdace6qpp5my6nc58d50r5...",
  "uuid":"d7975109-e6d0-47ae-9c26-531d553c420b"
}
```


```javascript
import { Lnd, Sockets } from "sb-api"

const ln = await Lnd()
const refundInvoice = await ln.receive()
const exchangeSocket = await Sockets.exchange(ln)
const tickersSub = await exchangeSocket.trades({
  duration: 10000,
  exchange: "bitfinex",
  symbol: "ETHBTC",
  refundInvoice,
  onData: data => console.log("received data", data),
  onSnapshot: snapshot => console.log("received snapshot: ", snapshot),
  onSubscriptionEnded: dataset => console.log(`got dataset with ${dataset.length} elements`) 
  //                    ^^^ dataset is the list of all your 
  //                        previously received data points
})
```

> Example Order Books data

```javascript
// snapshot
[
  {
    eventTime: 1543850299172,
    orderId: 19811509228,
    price: 3894.7,
    quantityTotal: 0.25,
  },
  // rest of elements omitted
  // for brevity
]


// data
{
  eventTime: 1541715102336,
  orderId: 18836717013,
  price: 6502.9,
  quantityTotal: 0.1691553,
}

```

```json

{  
      "uuid":"d7975109-e6d0-47ae-9c26-531d553c420b",
      "exchange":"bitfinex",
      "symbol":"BTCUSD",
      "duration":15000,
      "event":"payment received"
}

{  
   "uuid":"d7975109-e6d0-47ae-9c26-531d553c420b",
   "snapshot":[  
      {  
         "eventTime":1543850299172,
         "orderId":19811509228,
         "price":3894.7,
         "quantityTotal":0.25
      },
      ...
   ]
}

{  
      "uuid":"d7975109-e6d0-47ae-9c26-531d553c420b",
      "data":{  
         "eventTime":1541715102336,
         "orderId":18836717052,
         "price":6504.4,
         "quantityTotal":0.16911629,
      }
      "seq":622
   }{  
      "uuid":"d7975109-e6d0-47ae-9c26-531d553c420b",
      "data":{  
         "eventTime":1541715102336,
         "orderId":18836717013,
         "price":6502.9,
         "quantityTotal":0.1691553,
      }
      "seq":309
   }
   ```

The **Books** channel streams bids and asks for a given trading pair on given exchange. 

Field | Type | Exchanges Supporting
------| -------| --------
`uuid`  | String | "123e4567-e89b-12d3-a456-426655440000"
`eventTime` | Integer | binance, bitfinex, bitstamp, gemini 
`orderId` |  Integer |  bitfinex, bitstamp 
`price`  | Double | binance, bitfinex, coinbase, bitstamp, gemini 
`quantityTotal` | Double | binance, bitfinex, coinbase, gemini 
`quantityChange` | Double | bitstamp, gemini 
`symbol` | String |  binance, coinbase 

# Crypto Futures API

## Crypto Futures API Endpoints

This is the paid service url **wss://api.suredbits.com/futures/v0** on mainnet.

This is the free version url **wss://test.api.suredbits.com/futures/v0** on testnet. 

## Overview

### Trading Pairs Supported 

Symbol | Kraken  | 
------| -------- | 
`BTCUSD` |  X    |    
`ETHUSD` |  X    |   
`ETHBTC` |       | 

## Tickers

The **Tickers** channel streams high level updates for given trading pairs.  See the table below for which exchanges return which fields.

Field | Type | Exchanges Supporting
------| -------| --------
`eventTime` | Integer | Kraken
`symbol` | String | Kraken
`maturationInterval`| String | Kraken
`maturationTime`| Integer | Kraken
`bid` | Float | Kraken
`bidSize` | Float | Kraken
`ask` | Float | Kraken
`askSize`| Float | Kraken
`price`| Float | Kraken
`priceChange`| Float | Kraken
`last`| Float | Kraken
`low` | Float | Kraken
`high`| Float | Kraken
`volume` | Float | Kraken
`volWeightedAvePrice`| Float | Kraken
`leverage`| String | Kraken
`premium`| Float | Kraken
`index`| Float | Kraken
`openInterest`| Float | Kraken
`fundingRate`| Float | Kraken
`nextFundingRateTime`| Integer | Kraken
`fundingRatePrediction` | Float | Kraken


## Trades

The **Trades** channel streams executed trades for a given trading pair.  See the table below for which exchanges returns which fields. 

Field | Type | Exchanges Supporting
------| -------| --------
`eventTime` | Integer | Kraken
`symbol` | String | Kraken
`tradeId` | Integer | Kraken
`price` | Float | Kraken
`quantity` | Float | Kraken
`buyerId` | String | Kraken
`sellerId` | String | Kraken
`tradeTime` | Integer | Kraken
`marketMaker` | Boolean | Kraken
`reason` | String | Kraken
`maturationTime` | String | Kraken


## Order Books 

The **Books** channel streams bids and asks for a given trading pair on given exchange. 

Field | Type | Exchanges Supporting
------| -------| --------
`eventTime` | Integer | Kraken
`symbol` | String | Kraken
`maturation` | Integer | Kraken 
`orderId`| Integer | Kraken
`price` | Float | Kraken
`quantityChange`| Float | Kraken
`quantityTotal` | Float | Kraken


<h1 id="NFLData"> NFL Data</h1>

## NFL Websocket Endpoint


This is the paid service url **wss://api.suredbits.com/nfl/v0** on mainnet.

This is the free service url **wss://test.api.suredbits.com/nfl/v0** on testnet.

## Info

> Example request

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nfl = await Sockets.nfl(ln)
const info = await nfl.info()
```

```json
{
   "channel": "info", 
  "uuid": "d7975109-e6d0-47ae-9c26-531d553c420b"
}
```

This provides a check and confirmation on the status of the API. 

> Example data

```javascript
{
  version: '8',
  lastRosterDownload: '2018-08-13T17:07:53.668Z',
  seasonType: 'Preseason',
  seasonYear: 2018,
  week: 'NflPreSeasonWeek1'
}
```

```json
{
  "uuid": "1771601c-0fe8-4387-b2ce-be9a0abe1356",
  "data":
      {
        "version":"8",
        "lastRosterDownload":"2018-08-13T17:07:53.668Z",
        "seasonType":"Preseason",
        "seasonYear":2018,
        "week":"NflPreSeasonWeek1"
       }
 }
```


## Games

> Example request Games

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nfl = await Sockets.nfl(ln)
const games = await nfl.games({ week: 1, seasonPhase: 'Regular', year: 2017 })
```

```json
{
  "channel":"games", 
  "week":1, 
  "seasonPhase" : "Regular", 
  "year" : 2017, 
  "uuid": "8ccbd2d9-65aa-401e-a056-44d543544d47"
}
```


> Example of Games data

```javascript
[
  {
    gsisId: '2017091006',
    gameKey: '57241',
    startTime: '2017-09-10T17:00:00.000Z',
    week: 'NflWeek1',
    dayOfWeek: 'Sunday',
    seasonYear: 2017,
    seasonType: 'Regular',
    finished: true,
    homeTeam: {
      team: 'MIA',
      score: 0,
      scoreQ1: 0,
      scoreQ2: 0,
      scoreQ3: 0,
      scoreQ4: 0,
      turnovers: 0,
    },
    awayTeam: {
      team: 'TB',
      score: 0,
      scoreQ1: 0,
      scoreQ2: 0,
      scoreQ3: 0,
      scoreQ4: 0,
      turnovers: 0,
    },
    timeInserted: '2017-08-04T18:29:15.669Z',
    timeUpdate: '2018-06-08T19:34:44.063Z',
  },
  // more elements omitted for brevity
]
```

```json
 {
   "uuid": "8ccbd2d9-65aa-401e-a056-44d543544d47",
   "data":
    [
      {
      "gsisId":"2017091006",
      "gameKey":"57241",
      "startTime":"2017-09-10T17:00:00.000Z",
      "week":"NflWeek1",
      "dayOfWeek":"Sunday",
      "seasonYear":2017,
      "seasonType":"Regular",
      "finished":true,
      "homeTeam":{
        "team":"MIA",
        "score":0,
        "scoreQ1":0,
        "scoreQ2":0,
        "scoreQ3":0,
        "scoreQ4":0,
        "turnovers":0
        },
      "awayTeam":{
        "team":"TB",
        "score":0,
        "scoreQ1":0,
        "scoreQ2":0,
        "scoreQ3":0,
        "scoreQ4":0,
        "turnovers":0
      },
      "timeInserted":"2017-08-04T18:29:15.669Z",
      "timeUpdate":"2018-06-08T19:34:44.063Z",
     },
     ...
    ]
 }
```

The **Games** channel returns data for specific games. 

**Completed and upcoming games**

The available fields to query data from completed and upcoming NFL games are as follows:

**Required fields**

Field | Type | Example
------ | ------- | ------
`uuid` | String | "123e4567-e89b-12d3-a456-426655440000" 
`week` | Integer |  1, 2, 3 etc...
`seasonPhase` | String |   Preaseason, Regular, or Postseason 


**Optional fields**

Field | Type | Example
------ | ------- | --------
`year` | Integer |  2009, 2010, 2011, etc. 
`teamId` | String  |  CHI, MIN, GB, MIA etc. <a href="#TeamID">See Team ID Table</a>

**Live games**

You can also query for games that are currently playing. The available fields are as follows: 

**Required fields**

Field | Type | Example
------ | ------- | ------
`uuid`  | String | "123e4567-e89b-12d3-a456-426655440000"
`realtime` | Boolean (true) | true 

**Optional fields**

Field | Type | Example
------ | ------- | ------
`teamId` | String  |  CHI, MIN, GB, MIA etc. <a href="#TeamID">See Team ID Table</a>


## Players

> Example request Players

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nfl = await Sockets.nfl(ln)
const players = await nfl.players({ firstName: 'Randy', lastName: 'Moss' })
```

```json
{
  "channel":"players", 
  "lastName" : "Moss", 
  "firstName" : "Randy", 
  "uuid": "dfd2a7d4-3a36-4624-96c4-80f0c166d447ok"
}
```

> Example Players data

```javascript
[
  {
    playerId: '00-0011754',
    gsisName: 'R.Moss',
    fullName: 'Randy Moss',
    firstName: 'Randy',
    lastName: 'Moss',
    team: 'UNK',
    position: 'UNK',
    profileId: 2502220,
    profileUrl: 'http://www.nfl.com/player/randymoss/2502220/profile',
    birthDate: '2/13/1977',
    college: 'Marshall',
    yearsPro: 14,
    height: 76,
    weight: 210,
    status: 'Unknown',
  }
]
```

```json

{  
   "uuid":"c8aa064c-51d9-4910-ab2d-add823bce374",
   "data":[  
      {  
         "playerId":"00-0011754",
         "gsisName":"R.Moss",
         "fullName":"Randy Moss",
         "firstName":"Randy",
         "lastName":"Moss",
         "team":"UNK",
         "position":"UNK",
         "profileId":2502220,
         "profileUrl":"http://www.nfl.com/player/randymoss/2502220/profile",
         "birthDate":"2/13/1977",
         "college":"Marshall",
         "yearsPro":14,
         "height":76,
         "weight":210,
         "status":"Unknown"
      }
   ]
}
```

  

The **Players** channel returns data for particular players by `name`.  

The required fields to request NFL Player data are as follows: 

**Required Fields**

Field | Type | Example
------ | ----- | -----
`uuid` | String | "123e4567-e89b-12d3-a456-426655440000"
`firstName` | String |  Randy 
`lastName` | String |  Moss 


## Team

> Example request Rosters

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nfl = await Sockets.nfl(ln)
const roster = await nfl.roster({ teamId: 'MIN' })
```

```json

{
  "channel": "team", 
  "teamId": "MIN", 
  "retrieve": "roster", 
  "uuid": "db69a9d5-13c3-42a0-958a-623630a0fc81"
}

```

> Example request Rosters in Year

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nfl = await Sockets.nfl(ln)
const roster = await nfl.roster({ teamId: 'MIN', year: 2018 }
```

```json
{
  "channel": "team", 
  "teamId": "MIN", 
  "retrieve": "schedule", 
  "year": 2018, 
  "uuid": "[uuid]"
}
```

> Example of Roster data

```javascript
[
  {
    playerId: '00-0027981',
    gsisName: 'K.Rudolph',
    fullName: 'Kyle Rudolph',
    firstName: 'Kyle',
    lastName: 'Rudolph',
    team: 'MIN',
    position: 'TE',
    profileId: 2495438,
    profileUrl: 'http://www.nfl.com/player/kylerudolph/2495438/profile',
    uniformNumber: 82,
    birthDate: '11/9/1989',
    college: 'Notre Dame',
    yearsPro: 8,
    height: 78,
    weight: 265,
    status: 'Active',
  },
  // more elements omitted for brevity
]
```

```json
{
  "uuid":"db69a9d5-13c3-42a0-958a-623630a0fc81",
  "data":
    [
      {
        "playerId":"00-0027981",
        "gsisName":"K.Rudolph",
        "fullName":"Kyle Rudolph",
        "firstName":"Kyle",
        "lastName":"Rudolph",
        "team":"MIN",
        "position":"TE",
        "profileId":2495438,
        "profileUrl":"http://www.nfl.com/player/kylerudolph/2495438/profile",
        "uniformNumber":82,
        "birthDate":"11/9/1989",
        "college":"Notre Dame",
        "yearsPro":8,"height":78,
        "weight":265,
        "status":"Active",
       },
       ...
    ]
  }
```
  
> Example request Schedules
  
```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()
  
const nfl = await Sockets.nfl(ln)
const schedule = await nfl.schedule({ teamId: 'CHI' })
```

```json
{
  "channel": "team", 
  "teamId": "CHI", 
  "retrieve": "schedule", 
  "uuid": "ede60177-f218-40ff-8fde-605f29a8bfce"
}
```


>Example of Schedule data

```javascript
[
  {
    gsisId: '2017091001',
    gameKey: '57236',
    startTime: '2017-09-10T170000.000Z',
    week: 'NflWeek1',
    dayOfWeek: 'Sunday',
    seasonYear: 2017,
    seasonType: 'Regular',
    finished: true,
    homeTeam: {
      team: 'CHI',
      score: 17,
      scoreQ1: 0,
      scoreQ2: 10,
      scoreQ3: 0,
      scoreQ4: 7,
      turnovers: 0,
    },
    awayTeam: {
      team: 'ATL',
      score: 23,
      scoreQ1: 3,
      scoreQ2: 7,
      scoreQ3: 3,
      scoreQ4: 10,
      turnovers: 1,
    },
    timeInserted: '2017-08-04T182915.669Z',
    timeUpdate: '2018-06-08T192330.452Z',
  },
  // more elements omitted for brevity
]
```

```json
 {
   "uuid": "ede60177-f218-40ff-8fde-605f29a8bfce",
   "data":
    [
      {
        "gsisId":"2017091001",
        "gameKey":"57236",
        "startTime":"2017-09-10T170000.000Z",
        "week":"NflWeek1",
        "dayOfWeek":"Sunday",
        "seasonYear":2017,
        "seasonType":"Regular",
        "finished":true,
        "homeTeam":
      {
        "team":"CHI",
        "score":17,
        "scoreQ1":0,
        "scoreQ2":10,
        "scoreQ3":0,
        "scoreQ4":7,
        "turnovers":0
      },
    "awayTeam":
      {
        "team":"ATL",
        "score":23,
        "scoreQ1":3,
        "scoreQ2":7,
        "scoreQ3":3,
        "scoreQ4":10,
        "turnovers":1
      },
    "timeInserted":"2017-08-04T182915.669Z",
    "timeUpdate":"2018-06-08T192330.452Z",
    },
    ...
   ]
 }
```

The **Team** channel returns data for `roster` or `schedule` or a given NFL team.


The required fields to request NFL Team & Roster data are as follows:

**Required fields** 

Field | Type | Example 
------ | ----- | ------
`uuid`  | String | "123e4567-e89b-12d3-a456-426655440000" 
`teamId` | String |  CHI, MIN, MIA  etc.
`retrieve` | String |  roster or schedule 

**Optional Fields**

Field | Type | Example
------| ----- | ------
`year` | Integer | 2018,  2015, 2011, etc. 

NOTE: the `year` field defaults to current year. 

<h3 id="TeamID"> Team ID Table</h3>

Team Id	| City & Name | TeamID | City & Name
-------- | ----------- | ------ | ---------
ARI	| Arizona Cardinals	| LA   | Los Angeles Rams
ATL	| Atlanta Falcons	| MIA  | Miami Dolphins
BAL	| Baltimore Ravens	| MIN | Minnesota Vikings
BUF	| Buffalo Bills	NE	| NE  | New England Patriots
CAR	| Carolina Panthers	| NO | New Orleans Saints
CHI	| Chicago Bears	NYG	| NYG | New York Giants
CIN	| Cincinnati Bengals	| NYJ	| New York Jets
CLE	| Cleveland Browns	| OAK	| Oakland Raiders
DAL	| Dallas Cowboys	| PHI	| Philadelphia Eagles
DEN	| Denver Broncos	| PIT	| Pittsburgh Steelers
DET	| Detroit Lions	SD	| SD   | San Diego Chargers
GB	| Green Bay Packers	| SEA	| Seattle Seahawks
HOU	| Houston Texans	| SF	| San Francisco 49ers
IND	| Indianpolis Colts	| TB	| Tampa Bay Buccaneers
JAC	| Jacksonville Jaguars	| TEN	| Tennessee Titans
KC	| Kansas City Chiefs	| WAS	| Washington Redskins


## Stats 

> Example request Stats #1

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nfl = await Sockets.nfl(ln)
const stats = await nfl.statsById({ 
  gameId: '2016101604', 
  playerId: '00=0027973', 
  statType: 'passing' 
})
```

```json
{
  "channel":"stats", 
  "statType" : "passing", 
  "gameId" : "2016101604", 
  "playerId" : "00-0027973",
  "uuid": "4312144f-a0a9-4c23-bfd5-01405813c2c9"
}
```
> Example request Stats #2

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nfl = await Sockets.nfl(ln)
const stats = await nfl.statsByNameAndWeek({
  firstName: 'Drew',
  lastName: 'Brees',
  seasonPhase: 'Regular',
  statType: 'passing',
  week: 1,
  year: 2017,
})

```
```json
{
    "channel":"stats", 
    "lastName" : "Brees", 
    "firstName" : "Drew", 
    "year": 2017, 
    "week" : 1, 
    "seasonPhase" : "Regular", 
    "statType" : "passing",
    "uuid": "4312144f-a0a9-4c23-bfd5-01405813c2c9"
}

```

> Example of Stats data

```javascript
[
  {
    att: 37,
    cmp: 27,
    cmpAirYds: 167,
    inCmp: 10,
    inCmpAirYds: 75,
    passingInt: 0,
    sack: 1,
    sackYds: -7,
    passingTds: 1,
    passingTwoPointAttempt: 0,
    passingTwoPointAttemptMade: 0,
    passingTwoPointAttemptMissed: 0,
    passingYds: 291,
  }
]
```

```json
{
  "uuid":"4312144f-a0a9-4c23-bfd5-01405813c2c9",
  "data":
    [
      {
        "att":37,
        "cmp":27,
        "cmpAirYds":167,
        "inCmp":10,
        "inCmpAirYds": 75,
        "passingInt":0,
        "sack":1,
        "sackYds":-7,
        "passingTds":1,
        "passingTwoPointAttempt":0,
        "passingTwoPointAttemptMade":0,
        "passingTwoPointAttemptMissed":0,
        "passingYds":291,
       },
       ...
    ]
}

```

The **Stats** channel returns data for an individual `player`or `game`.

To query by `gameId` and `playerId`:

**Required field for Stats by Id**


Field | Type | Example
------ | ----- | -------
`uuid`  | String | "123e4567-e89b-12d3-a456-426655440000"
`channel` | String| stats
`statType` | String | passing, rushing, receiving, defense
`gameId` | String | 2016101604
`playerId` | String | 00-0027973


To query by `name` and `week`:

**Required fields for Stats by Name and Week**

Field | Type | Example
------ | ------- | -----
`uuid`  | String | "123e4567-e89b-12d3-a456-426655440000"
`channel` | String | stats
`statType` | String | passing, rushing, receiving, defense
`year` | Integer | 2016, 2017
`week` | Integer  | 1, 2... 
`seasonPhase` | String  | Preseason, Regular, Postseason* 
`firstName`  | String | Drew
`lastName` | String | Brees

# NBA Data

## NBA Websocket Endpoint

This is the paid service url **wss://api.suredbits.com/nba/v0** on mainnet.

This is the free version url **wss://test.api.suredbits.com/nba/v0** on testnet. 

## Info

> Example request Info

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const info = await nba.info()
```

```json
{
  "channel": "info", 
  "uuid": "123e4567-e89b-12d3-a456-426655440000"
}
```

> Example of Info data

```javascript
{
  seasonYear: '2018-2019',
  seasonPhase: 'Regular',
  version: 0,
  lastUpdated: Date('2018-11-15T21:58:50.490Z'),
}
```

```json
{  
   "uuid":"123e4567-e89b-12d3-a456-426655440000",
   "data":{  
      "seasonYear":"2018-2019",
      "seasonPhase":"Regular",
      "version":0,
      "lastUpdated":"2018-11-15T21:58:50.490Z"
      
    }
}
```

The `Info` channel returns high level information of the current status of the `NBA` endpoint. 

Field | Type | Example
------ | ----- | -------
`uuid` | String |  "123e4567-e89b-12d3-a456-426655440000" 


## Games

> Example request Games

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const games = await nba.games({ year: 2018, month: 11, day: 24 })
```

```json
{
  "channel": "games", 
  "year": 2018, 
  "month": 11, 
  "day": 24, 
  "uuid": "3f4f2853-e84f-4a29-b807-8a471e59ca44"
}
```

> Example request Games with TeamId

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const games = await nba.games({ year: 2016, month: 12, day: 20, teamId: 'CHI' })
```

```json
{
  "channel": "games", 
  "year": 2016, 
  "month": 12, 
  "day": 20, 
  "teamId": "CHI", 
  "uuid": "3f4f2853-e84f-4a29-b807-8a471e59ca44"
}
```

> Example Games data

```javascript
[
  {
    gameId: 21800280,
    startTime: Date('2018-11-25T01:00:00.000Z'),
    homeTeam: {
      teamID: 'WAS',
      finalScore: 0,
    },
    awayTeam: {
      teamID: 'NOP',
      finalScore: 0,
    },
    finished: false,
    seasonPhase: 'Regular',
    year: '2018-2019',
  },
  {
    gameId: 21800282,
    startTime: Date('2018-11-25T01:00:00.000Z'),
    homeTeam: {
      teamID: 'OKC',
      finalScore: 0,
    },
    awayTeam: {
      teamID: 'DEN',
      finalScore: 0,
    },
    finished: false,
    seasonPhase: 'Regular',
    year: '2018-2019',
  },
  {
    gameId: 21800285,
    startTime: Date('2018-11-25T01:30:00.000Z'),
    homeTeam: {
      teamID: 'GSW',
      finalScore: 0,
    },
    awayTeam: {
      teamID: 'SAC',
      finalScore: 0,
    },
    finished: false,
    seasonPhase: 'Regular',
    year: '2018-2019',
  },
  {
    gameId: 21800284,
    startTime: Date('2018-11-25T01:30:00.000Z'),
    homeTeam: {
      teamID: 'MIL',
      finalScore: 0,
    },
    awayTeam: {
      teamID: 'SAS',
      finalScore: 0,
    },
    finished: false,
    seasonPhase: 'Regular',
    year: '2018-2019',
  },
  {
    gameId: 21800279,
    startTime: Date('2018-11-25T00:30:00.000Z'),
    homeTeam: {
      teamID: 'CLE',
      finalScore: 0,
    },
    awayTeam: {
      teamID: 'HOU',
      finalScore: 0,
    },
    finished: false,
    seasonPhase: 'Regular',
    year: '2018-2019',
  },
  {
    gameId: 21800281,
    startTime: Date('2018-11-25T01:00:00.000Z'),
    homeTeam: {
      teamID: 'MIN',
      finalScore: 0,
    },
    awayTeam: {
      teamID: 'CHI',
      finalScore: 0,
    },
    finished: false,
    seasonPhase: 'Regular',
    year: '2018-2019',
  },
]
```

```json
{  
   "uuid":"3f4f2853-e84f-4a29-b807-8a471e59ca44",
   "data":[  
      {  
         "gameId":21800280,
         "startTime":"2018-11-25T01:00:00.000Z",
         "homeTeam":{  
            "teamID":"WAS",
            "finalScore":0
         },
         "awayTeam":{  
            "teamID":"NOP",
            "finalScore":0
         },
         "finished":false,
         "seasonPhase":"Regular",
         "year":"2018-2019"
      },
      {  
         "gameId":21800282,
         "startTime":"2018-11-25T01:00:00.000Z",
         "homeTeam":{  
            "teamID":"OKC",
            "finalScore":0
         },
         "awayTeam":{  
            "teamID":"DEN",
            "finalScore":0
         },
         "finished":false,
         "seasonPhase":"Regular",
         "year":"2018-2019"
      },
      {  
         "gameId":21800285,
         "startTime":"2018-11-25T01:30:00.000Z",
         "homeTeam":{  
            "teamID":"GSW",
            "finalScore":0
         },
         "awayTeam":{  
            "teamID":"SAC",
            "finalScore":0
         },
         "finished":false,
         "seasonPhase":"Regular",
         "year":"2018-2019"
      },
      {  
         "gameId":21800284,
         "startTime":"2018-11-25T01:30:00.000Z",
         "homeTeam":{  
            "teamID":"MIL",
            "finalScore":0
         },
         "awayTeam":{  
            "teamID":"SAS",
            "finalScore":0
         },
         "finished":false,
         "seasonPhase":"Regular",
         "year":"2018-2019"
      },
      {  
         "gameId":21800279,
         "startTime":"2018-11-25T00:30:00.000Z",
         "homeTeam":{  
            "teamID":"CLE",
            "finalScore":0
         },
         "awayTeam":{  
            "teamID":"HOU",
            "finalScore":0
         },
         "finished":false,
         "seasonPhase":"Regular",
         "year":"2018-2019"
      },
      {  
         "gameId":21800281,
         "startTime":"2018-11-25T01:00:00.000Z",
         "homeTeam":{  
            "teamID":"MIN",
            "finalScore":0
         },
         "awayTeam":{  
            "teamID":"CHI",
            "finalScore":0
         },
         "finished":false,
         "seasonPhase":"Regular",
         "year":"2018-2019"
      }
   ]
}
```

The **Games** channel returns statistics about specific games played.  

**Completed and upcoming games**

The available fields to query data from completed and upcoming NBA games are as follows:

**Required Fields**

Field | Type | Example
------ | ----- | -------
`uuid` | String | "123e4567-e89b-12d3-a456-426655440000"
`channel` | String |  games 
`year` | Integer  | 2016, 2017 and 2018 
`month` | Integer  | 3, 8, 12 etc..
`day` | Integer |  Follows typical calendar convention: 2, 17, 28, etc...

<aside class="notice">NOTE: We only support from year 2016 to current. </aside>

To search for a game by a specific team, add an optional field for `teamId`

**Optional fields**

| Field                                   | Type   | Example                                                                                             |
| --------------------------------------- | ------ | --------------------------------------------------------------------------------------------------- |
| `teamId` | String | ATL, CLE, PHX, LAC etc. <a href="#NBATeamID">See Team ID Table</a> |

**Live games**
You can also query for games that are currently playing. The available fields are as follows: 

**Required fields**

| Field                                      | Type           | Example                                                                 |
| ------------------------------------------ | -------------- | ----------------------------------------------------------------------- |
| `uuid` | String         | "123e4567-e89b-12d3-a456-426655440000" 
| `realtime` | Boolean (true) | true                                  |

**Optional fields**

| Field                                   | Type   | Example                                                                                             |
| --------------------------------------- | ------ | --------------------------------------------------------------------------------------------------- |
| `teamId` | String | ATL, CLE, PHX, LAC etc. <a href="#NBATeamID">See Team ID Table</a> |



## Players

> Example request Players

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const players = await nba.players({ firstName: 'Kevin', lastName: 'Durant' }
```

```json
{
  "channel": "players", 
  "lastName": "Durant", 
  "firstName": "Kevin", 
  "uuid": "3f4f2853-e84f-4a29-b807-8a471e59ca44"
}
```

> Example Players data (Kevin Durant)

```javascript
[
  {
    playerId: 201142,
    firstName: 'Kevin',
    lastName: 'Durant',
    fullName: 'Kevin Durant',
    team: 'GSW',
    profileUrl: '',
    birthDate: Date('2018-10-19T11:43:30.426Z'),
    status: 'Active',
    rookieYear: 2007,
    lastYear: 2018,
  },
]
```

```json
{  
   "uuid":"3f4f2853-e84f-4a29-b807-8a471e59ca44",
   "data":[  
      {  
         "playerId":201142,
         "firstName":"Kevin",
         "lastName":"Durant",
         "fullName":"Kevin Durant",
         "team":"GSW",
         "profileUrl":"",
         "birthDate":"2018-10-19T11:43:30.426Z",
         "status":"Active",
         "rookieYear":2007,
         "lastYear":2018
      }
   ]
}
```

The **Players** channel returns biographical information about specific players. For individual player statistics, see the **Stats** channel 

**Required Fields**

| Field                                      | Type   | Example                                                                 |
| ------------------------------------------ | ------ | ----------------------------------------------------------------------- |
| `uuid`  | String | "123e4567-e89b-12d3-a456-426655440000"  |
| `channel` | String |  players                                 |
| `firstName` | String |  Kevin                                   |
| `lastName` | String |  Durant                                 |


## Team

> Example request for Roster

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const roster = await nba.roster({ teamId: 'DEN' }
```

```json
{
  "channel": "team", 
  "retrieve": "roster",
  "teamId": "DEN", 
  "uuid": "3f4f2853-e84f-4a29-b807-8a471e59ca44"
}
```
> Example request with season

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const roster = await nba.roster({ season: '2016-2017', teamId: 'GSW' })
```

```json
{
  "channel": "team", 
  "retrieve": "schedule", 
  "teamId": "GSW",
  "season": "2016-2017", 
  "uuid": "3f4f2853-e84f-4a29-b807-8a471e59ca44"
}
```
> Example request for Schedule 

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const schedule = await nba.schedule({ teamId: 'CHI' })
```

```json
{
  "channel": "team", 
  "teamId": "CHI",
  "retrieve": "schedule", 
  "uuid": "3f4f2853-e84f-4a29-b807-8a471e59ca44"
}
```

> Example of team Schedule (Chicago Bulls)

```javascript
[
  {
    gameId: 21600073,
    startTime: Date('2016-11-05T00:00:00.000Z'),
    homeTeam: {
      teamID: 'CHI',
      finalScore: 104,
    },
    awayTeam: {
      teamID: 'NYK',
      finalScore: 117,
    },
    finished: true,
    seasonPhase: 'Regular',
    year: '2016-2017',
  }, 
  // more elements omitted for brevity
]
```

```json
{  
   "uuid":"3f4f2853-e84f-4a29-b807-8a471e59ca44",
   "data":[  
      {  
         "gameId":21600073,
         "startTime":"2016-11-05T00:00:00.000Z",
         "homeTeam":{  
            "teamID":"CHI",
            "finalScore":104
         },
         "awayTeam":{  
            "teamID":"NYK",
            "finalScore":117
         },
         "finished":true,
         "seasonPhase":"Regular",
         "year":"2016-2017",
      }
   ]
}
...

```
The **Teams** channel returns information such as `rosters` or `schedules` for specific teams.  

**Required Fields**

| Field                                     | Type   | Example                                                                                                                  |
| ----------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------ |
| `uuid` | String | "123e4567-e89b-12d3-a456-426655440000"                                                 |
| `channel` | String | teams                                                                                    |
| `teamId` | String | CHI, LAC, MIA, etc... |
| `retrieve` | String | roster or schedule                                     |

**Optional Fields**

| Field                                   | Type   | Example                                    |
| --------------------------------------- | ------ | ------------------------------------------ |
| `season` | String | 2016-2017 |


<h3 id="NBATeamID"> Team ID Table</h3>

| Team ID | Team                   | Team ID | Team                   |
| ------- | ---------------------- | ------- | ---------------------- |
| ATL     | Atlanta Hawks          | PHI     | Philadelphia 76ers     |
| MIA     | Miami Heat             | DET     | Detroit Pistons        |
| BKN     | Brooklyn Nets          | PHX     | Phoenix Suns           |
| MIL     | Milwaukee Bucks        | GSW     | Golden State Warriors  |
| BOS     | Boston Celtics         | POR     | Portland Trail Blazers |
| MIN     | Minnesota Timberwolves | HOU     | Houston Rockets        |
| CHA     | Charlotte Hornets      | SAC     | Sacramento Kings       |
| NOP     | New Orleans Pelicans   | IND     | Indiana Pacers         |
| CHI     | Chicago Bulls          | SAS     | San Antonio Spurs      |
| NYK     | New York Knicks        | LAC     | Los Angeles Clippers   |
| CLE     | Cleveland Cavaliers    | TOR     | Toronto Raptors        |
| OKC     | Oklahoma City Thunder  | LAL     | Los Angeles Lakers     |
| DAL     | Dallas Mavericks       | UTA     | Utah Jazz              |
| ORL     | Orlando Magic          | MEM     | Memphis Grizzlies      |
| DEN     | Denver Broncos         | WAS     | Washington Wizards     |


## Stats 

> Example request Stats by ID

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const stats = await nba.statsById({ gameId: '21600854', playerId: '201142' }
```

```json
{
  "channel": "stats", 
  "gameId": "21600854", 
  "playerId": "201142", 
  "uuid": "3f4f2853-e84f-4a29-b807-8a471e59ca44"
}
```

> Example request for Stats by Name

```javascript
import { Lnd, Sockets } from 'sb-api'
const ln = await Lnd()

const nba = await Sockets.nba(ln)
const stats = await nba.statsByName({ 
  firstName: 'Kevin', 
  lastName: 'Durant', 
  year: 2017, 
  month: 12, 
  day: 12 
})
```

```json
{
  "channel": "stats", 
  "lastName": "Durant", 
  "firstName": "Kevin", 
  "year": 2017, 
  "month": 12, 
  "day": 12, 
  "uuid": "3f4f2853-e84f-4a29-b807-8a471e59ca44"
}
```

> Example of player Stats data (Kevin Durant)

```javascript
[
  {
    playerId: 201142,
    min: 0,
    fgm: 0,
    fga: 0,
    tpm: 0,
    tpa: 0,
    ftm: 0,
    fta: 0,
    plusminus: 0,
    off: 0,
    deff: 0,
    tot: 0,
    ast: 0,
    pf: 0,
    st: 0,
    to: 0,
    bs: 0,
    pts: 0,
  }
]
```

```json
{  
   "uuid":"3f4f2853-e84f-4a29-b807-8a471e59ca44",
   "data":[  
      {  
         "playerId":201142,
         "min":0,
         "fgm":0,
         "fga":0,
         "tpm":0,
         "tpa":0,
         "ftm":0,
         "fta":0,
         "plusminus":0,
         "off":0,
         "deff":0,
         "tot":0,
         "ast":0,
         "pf":0,
         "st":0,
         "to":0,
         "bs":0,
         "pts":0
      }
   ]
}
```

The **Stats** channel returns data for individual players and allows you to query by `gameId`, `playerId` or by specific player `name`.

**Required Fields for Stats by Id**

Field | Type | Example 
------ | ------ | ------
`uuid`  | String | "123e4567-e89b-12d3-a456-426655440000" 
`channel` | String | stats 
`gameId` | String  | "21600854"
`playerId` | String | "201142"


**Required Field for Stats by Name**

| Field                                      | Type    | Example                                                                                                                                                   |
| ------------------------------------------ | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `uuid`   | String  | "123e4567-e89b-12d3-a456-426655440000"                                                                                   |
| `channel`  | String  | stats                                                                                                                    |
| `year` | Integer | 2016, 2017 and 2018                                     |
| `month` | Integer | 2, 6, 10 etc..                                         |
| `day` | Integer | Follows typical calendar convention: 3, 18, 25, etc... |
| `firstName` | String  | Kevin                                                                                                                |
| `lastName`  | String  | Durant                                                                                                                   |

# Contact Us
Follow us on twitter <a href="https://twitter.com/Suredbits">@Suredbits</a>

Join our Slack channel <a href="https://join.slack.com/t/suredbits/shared_invite/enQtNDEyMjY3MTg1MTg3LTYyYjkwOGUzMDQ4NDAwZjE1M2I3MmQyNWNlZjNlYjg4OGRjYTRjNWUwNjRjNjg4Y2NjZjAxYjU1N2JjMTU1YWM">Suredbits Slack</a>
 
Email us at <a href="mailto:support@suredbits.com">support@suredbits.com</a>

# Homepage

<a href="https://www.suredbits.com"> Return to Suredbits.com </a>

