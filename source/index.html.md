---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json
 

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---
 
# Lightning API v0 Beta Documentation

## Connect With Us

Follow us on twitter <a href="https://twitter.com/SuredBits">@Suredbits</a>

We invite you to join our Slack channel <a href="https://join.slack.com/t/suredbits/shared_invite/enQtNDEyMjY3MTg1MTg3LTYyYjkwOGUzMDQ4NDAwZjE1M2I3MmQyNWNlZjNlYjg4OGRjYTRjNWUwNjRjNjg4Y2NjZjAxYjU1N2JjMTU1YWM">Suredbits Slack</a>

## Background Resources
Thank you and welcome to SuredBits' Lightning App API documentation. This API allows you to query our NFL, NBA and Crypto Exchange data. Our NFL and NBA APIs offer multiple channels including teams, players, games, scores, and statistics.  Our Crypto Exchange API allows you to stream data on Trades, Tickers and Order Books. 

We are currently focused primarily on developers already familiar with Bitcoin and know Lightning or are interested in building apps using the Lightning protocol. However, if you are just starting out in cryptocurrency development, we have included some helpful links below.

<aside class="success">IMPORTANT: Suredbits is a Lightning Application built on the Bitcoin protocol.  This initial release is only on testnet. </aside>

Here are some useful resources to help you learn and get started with Bicoin and Lightning Network.  Read and watch and come back when you're ready. 

1. <a href="https://bitcoin.org/en/download">Download Bitcoin Core</a>
2. <a href="http://lightning.network/">Lightning Network Background</a>
3. <a href="https://lightning.network/lightning-network-paper.pdf">Lightning Whitepaper</a>
4. <a href="https://www.youtube.com/watch?v=l1si5ZWLgy0">Introduction to Bitcoin</a>

## Suredbits Lightning Node
In order to access our APIs, you will need to connect to our lightning node via your preferred lightning client.   

The url is:

<span style="color:blue"> *0338f57e4e20abf4d5c86b71b59e995ce4378e373b021a7b6f41dabb42d3aad069@ln.test.suredbits.com* </span>


## Suredbits Lightning Payment 

This is our recommended lnd lightning client library: <a href="https://github.com/SuredBits/sb-api-lnd">https://github.com/SuredBits/sb-api-lnd</a>

This is an alternative c-lightning client library: <a href="https://github.com/suredbits/lightning-charge">https://github.com/suredbits/lightning-charge</a>

## UUID

> Example Data returned with valid UUID

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
<aside class="warning"> All request require a field called <b> uuid </b> </aside>  

A valid <span style="color:red"> `uuid` </span> request will show up on the invoice, response, and any error message that are returned.  If no <span style="color:red"> `uuid` </span> is specified in a websocket request then this field will be omitted from that request's response.

## Format 

> Example Data returned

```json 
{  
  "data":
  [
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
      "weight":210,"status":
      "Unknown",:
    }
  ]
}
```

Suredbits APIs are available via websockets with the following format:

**Basic example requests**

{"channel":"players", "lastName" : "Moss", "firstName" : "Randy"}

<aside class="note">NOTE: All API requests must include the  "channel" field.  However, "channel" does not have to be the first field in the request. </aside>

<aside class="note">NOTE: All times are in Universal Time Coordinated or "UTC".  So be sure to do time zone conversions. </aside>

1. Send a request over the websocket (see <a href="#NFLData">NFL Data</a>). 

2. Upon confirmation of a valid request, you will receive a Lightning Network Invoice that should appear similar to the one below.

3. Pay that ln invoice in your lightning client 

4. Receive data :)

**Ping/Pong**

To confirm your connection, send a <span style="color:red"> ping </span> request. Add an optional <span style="color:red"> uuid </span> if you want to track across specific channels. 

<aside class="success"> {"event": "ping"} should return {"event":"pong"} </aside>


**Sample Lightning Invoice**

A successful request will generate a lightning invoice that will look similar to the example below:

<span style="color:red"> *lnbcrt10n1pd5v2mwpp5ulxpj8ht4gvtqnyl8zuykfk4wcv6sz455ce5dy0e0lqt...* </span>

#Crypto Exchange API 

## Crypto Exchange Websocket Endpoint 

**wss://test.api.suredbits.com/exchange/v0**

## Info

**Trading Pairs Supported**

Symbol | Binance | Bitfinex
------- | ------ | ---------
BTCUSDT |    X     | 
ETHBTC  |    X     |    X
ETHUSDT |    X     | 
BTCUSD  |          |    X 
ETHUSD  |          |    X



**Subscribe**

> Example request Format: 

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

> Example Info data 

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
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> event </span> | String | <span style="color:red"> "subscribe" </span>
<span style="color:red"> channel </span> | String | <span style="color:red">  "tickers" </span>
<span style="color:red"> symbol  </span> | String | <span style="color:red"> "ETHBTC" </span>
<span style="color:red"> exchange </span> | String | <span style="color:red"> "bitfinex" </span>
<span style="color:red"> duration </span> | Integer (milliseconds) | <span style="color:red"> "15000" </span>
<span style="color:red"> refundInvoice </span> | String | <span style="color:red"> lnbcrt10n1pd5v2mwpp5ulxpj8ht... </span>


**Payment** 

<aside class="warning"> Our pricing model is still evolving and could change as our API service grows and matures. For now, for each second of streaming data, you will be charged 1 Satoshi. </aside>

1 second = 1 Satoshi

10 seconds = 10 Satoshis

100 seconds = 100 Satoshis


We will post notification of any future changes in our pricing model here and via our twitter @Suredbits.

**Refill**

You may refill your subscrption at any time with the following command format: 

Field | Type | Example
------| ------ | --------
<span style="color:red"> uuid </span> | String | <span style="color:red"> "e.g. 123e4567-e89b-12d3-a456-426655440000" </span>
<span style="color:red"> addedDuration </span> | Integer (milliseconds) | <span style="color:red"> "1000" </span>
<span style="color:red"> event </span> | String | <span style="color:red"> "refill" </span>

**Snapshots**

> Example of Snapshot from Trades Channel

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


**Unsubscribe**

You may unsubscribe from a channel using the following command:

Field | Type | Example
------| ------ | --------
<span style="color:red"> uuid </span> | String | <span style="color:red"> "e.g. 123e4567-e89b-12d3-a456-426655440000" </span> 
<span style="color:red"> event </span> | String | <span style="color:red"> "unsubscribe" </span>


**Maintenance**

In the event of maintenance or service interruption, we will refund any remaining portion of your subscription. 


## Tickers

> Example Request Tickers

```json
{  "event":"subscribe",
   "channel":"tickers",
   "symbol":"BTCUSDT",
   "exchange":"binance",
   "duration":120000,
   "refundInvoice":"lnbcrt1pdace6qpp5my6nc58d50r5gk...",
    "uuid":"[uuid]"
}
```

> Example Tickers data

```json
{  
   "uuid":"dc48f38e-7f71-4ea2-8c4c-52c683db93fa",
   "exchange":"binance",
   "symbol":"BTCUSDT",
   "duration":120000,
   "event":"subscribed"
}{  
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
      "totalTrades":142249
   }
}
```

The <span style="color:red"> Tickers </span> channel streams high level updates for given trading pairs.  See the table below for which exchanges return which fields.


Field | Type | Exchanges Supported
------ | ------ | --------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000</span>
<span style="color:red"> eventTime </span>| Integer | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>
<span style="color:red"> symbol </span> | String | <span style="color:red"> binance </span>
<span style="color:red"> priceChange </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> priceChangePerc </span> |  Double | <span style="color:red"> binance </span>
<span style="color:red"> weightedAvePrice </span> |  Double | <span style="color:red"> binance </span>
<span style="color:red"> prevClose </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> close </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> closeQuantity </span> |  Double | <span style="color:red"> binance </span>
<span style="color:red"> bid </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>          
<span style="color:red"> bidSize </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>          
<span style="color:red"> ask </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>          
<span style="color:red"> askSize </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>        
<span style="color:red"> open </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> high </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> low </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> volume </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> quoteVolume </span> | Double| <span style="color:red"> binance </span>
<span style="color:red"> statOpenTime </span> | Integer | <span style="color:red"> binance </span>
<span style="color:red"> statCloseTime </span> | Integer | <span style="color:red"> binance </span>
<span style="color:red"> firstTradeId </span> | Integer | <span style="color:red"> binance </span>
<span style="color:red"> totalTrades </span> | Integer | <span style="color:red"> binance </span>
<span style="color:red"> eventTime </span> |  Integer | <span style="color:red"> binance </span>                   
<span style="color:red"> bid </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> bidSize </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> ask </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> askSize </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> priceChange |</span>  Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>           
<span style="color:red"> priceChangePerc </span> |  Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>       
<span style="color:red"> close </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>           
<span style="color:red"> volume </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>
<span style="color:red"> high  </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>
<span style="color:red"> low </span> |  Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>

## Trades

> Example request Trades

```json

{  "event":"subscribe",
   "channel":"trades",
   "symbol":"BTCUSDT",
   "exchange":"binance",
   "duration":12000,
   "refundInvoice":"lnbcrt1pdace6qpp5my6nc58d50r5gk38ynyz...",
   "uuid":"[uuid]"
}
```

> Example Trades data

```json
{  
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
   "exchange":"binance",
   "symbol":"BTCUSDT",
   "duration":10000,
   "event":"payment received"
}{  
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
   "data":{  
      "eventTime":1541715784094,
      "symbol":"BTCUSDT",
      "tradeId":77827378,
      "price":6502.99,
      "quantity":0.030665,
      "buyerId":183136564,
      "sellerId":183136526,
      "tradeTime":1541715784094,
      "marketMaker":false
   }
}{  
   "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
   "data":{  
      "eventTime":1541715784161,
      "symbol":"BTCUSDT",
      "tradeId":77827379,
      "price":6501.35,
      "quantity":0.088033,
      "buyerId":183136558,
      "sellerId":183136565,
      "tradeTime":1541715784156,
      "marketMaker":true
   }
}
```

The <span style="color:red"> Trades </span> channel streams executed trades for a given trading pair.  See the table below for which exchanges returns which fields. 

Field |  Type | Exchanges Supported 
------ | ------- | -----------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> eventType </span> | String | <span style="color:red"> binance </span>
<span style="color:red"> eventTime </span> | Integer | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>
<span style="color:red"> symbol </span> | String | <span style="color:red"> binance </span>
<span style="color:red"> tradeId </span> | Integer | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>
<span style="color:red"> price </span> | Double | <span style="color:red"> binance </span>
<span style="color:red"> quantity </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>
<span style="color:red"> buyerId </span> | Integer | <span style="color:red"> binance </span>
<span style="color:red"> sellerId </span> | Integer | <span style="color:red"> binance </span>
<span style="color:red"> tradeTime </span> | Integer | <span style="color:red"> binance </span>
<span style="color:red"> marketMaker </span> |  Boolean | <span style="color:red"> binance </span>
<span style="color:red"> tradeid </span> | Integer | <span style="color:red"> binance </span>
<span style="color:red"> eventTime </span> | Integer | <span style="color:red"> binance </span>        
<span style="color:red"> quantity </span> | Double | <span style="color:red"> binance </span>      
<span style="color:red"> price </span> | Double | <span style="color:red"> bitfinex </span> , <span style="color:red"> binance  </span>

## Order Books

> Example Request Order Books

```json
{ "event":"subscribe", 
  "channel":"books", 
  "symbol":"BTCUSD", 
  "exchange":"bitfinex", 
  "duration":15000,
  "refundInvoice":"lnbcrt1pdace6qpp5my6nc58d50r5...",
  "uuid":"[uuid]"
}
```

> Example Order Books data

```json
{  
      "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
      "exchange":"bitfinex",
      "symbol":"BTCUSD",
      "duration":15000,
      "event":"payment received"
   }{  
      "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
      "data":{  
         "eventTime":1541715102336,
         "orderId":18836717052,
         "price":6504.4,
         "quantity":0.16911629
      }
   }{  
      "uuid":"8dda8625-2946-4500-8dd5-13c78d2f42b8",
      "data":{  
         "eventTime":1541715102336,
         "orderId":18836717013,
         "price":6502.9,
         "quantity":0.1691553
      }
   }
   ```

The <span style="color:red"> Books </span> channel streams bids and asks for a given trading pair on given exchange.  Currently, only the Bitfinex exchange is supported for this feature.  

Field | Type | Exchanges Supported
------| -------| --------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> eventTime </span> | Integer | <span style="color:red"> bitfinex </span> 
<span style="color:red"> symbol </span> |  String | <span style="color:red"> bitfinex </span> 
<span style="color:red"> orderId </span> |  Integer | <span style="color:red"> bitfinex </span> 
<span style="color:red"> price  </span>| Double | <span style="color:red"> bitfinex </span> 
<span style="color:red"> quantity </span> | Double | <span style="color:red"> bitfinex </span> 

<h1 id="NFLData"> NFL Data</h1>

## NFL Websocket Endpoint

**wss://test.api.suredbits.com/nfl/v0**

## Info

> Example request

```json
{
   "channel": "info", 
    "uuid": "[uuid]"
}
```

This provides a check and confirmation on the status of the API. 

> Example data

```json
{
  "data":
    [
      {
        "version":"8",
        "lastRosterDownload":"2018-08-13T17:07:53.668Z",
        "seasonType":"Preseason",
        "seasonYear":2018,
        "week":"NflPreSeasonWeek1"
       }
    ]
 }
```


## Games

> Example request Games

```json
{
  "channel":"games", 
  "week":1, 
  "seasonPhase" : "Regular", 
  "year" : 2017, 
  "uuid": "[uuid]"
}
```


> Example of Games data

```json

 {
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

The <span style="color:red"> Games </span> channel returns data for specific games. 

The required fields to query NFL Games data are as follows:

**Required fields**

Field | Type | Example
------ | ------- | ------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> week </span> | Integer | <span style="color:red"> </span> <span style="color:red"> 1, 2, 3 </span> etc...
<span style="color:red"> seasonPhase </span> | String |  <span style="color:red"> Preaseason, Regular </span> , or <span style="color:red"> *Postseason* </span>


**Optional fields**

Field | Type | Example
------ | ------- | --------
<span style="color:red"> year </span> | Integer |  <span style="color:red"> 2009, 2010, 2011, etc. </span>
<span style="color:red"> teamId </span> | String  |  <span style="color:red"> CHI, MIN, GB, MIA </span> etc. <a href="#TeamID">See Team ID Table</a>
<span style="color:red"> realtime </span> | Boolean | <span style="color:red"> true </span>


## Players

> Example request Players

```json
{
  "channel":"players", 
  "lastName" : "Moss", 
  "firstName" : "Randy", 
  "uuid": "[uuid]"
}

```

> Example Players data

```json 

{
  "data":
    [
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
        "status": "Unknown",:
       }
    ]
  }
```

The <span style="color:red"> Players </span> channel returns data for particular players by <span style="color:red"> name </span>.  

The required fields to request NFL Player data are as follows: 

**Required Fields**

Field | Type | Example
------ | ----- | -----
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> firstName </span> | String |  <span style="color:red"> Randy </span>
<span style="color:red"> lastName </span>  | String |  <span style="color:red"> Moss </span>


## Team

> Example request Rosters

```json
{
  "channel": "team", 
  "teamId": "CHI", 
  "retrieve": "roster", 
  "uuid": "[uuid]"
}
```

> Example request Rosters in Year

```json
{
  "channel": "team", 
  "teamId": "CHI", 
  "retrieve": "schedule", 
  "year": 2018, 
  "uuid": "[uuid]"
}
```


> Example of Roster data

```json

{
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

```json
{
  "channel": "team", 
  "teamId": "CHI", 
  "retrieve": "schedule", 
  "uuid": "[uuid]"
}
```


>Example of Schedule data

```json

 {
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

The <span style="color:red"> Team </span> channel returns data for <span style="color:red"> roster </span> or <span style="color:red"> schedule </span> for a given NFL team.


The required fields to request NFL Team & Roster data are as follows:

**Required fields**: 

Field | Type | Example 
------ | ----- | ------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> teamID </span> | String |  <span style="color:red"> CHI </span>, <span style="color:red"> MIN </span> etc.
<span style="color:red"> retrieve </span> | String |  <span style="color:red"> roster </span> or <span style="color:red"> schedule </span>

**Optional Field**

Field | Type | Example
------| ----- | ------
<span style="color:red"> year </span> | Integer | <span style="color:red"> 2018 </span> , <span style="color:red"> 2015 </span> , <span style="color:red"> 2011 </span> , etc. 

<aside class="notice">NOTE: the <span style="color:red"> year </span> field defaults to current year. </aside>

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

```json
{
  "channel":"stats", 
  "statType" : "passing", 
  "gameId" : "2016101604", 
  "playerId" : "00-0027973",
  "uuid": "[uuid]"
 }

```
> Example request Stats #2

```json
{
    "channel":"stats", 
    "lastName" : "Brees", 
    "firstName" : "Drew", 
    "year": 2017, 
    "week" : 1, 
    "seasonPhase" : "Regular", 
    "statType" : "passing",
    "uuid": "[uuid]"
}
```



> Example of Stats data

```json


{
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

The <span style="color:red"> Stats </span> channel returns data for an individual <span style="color:red"> player </span> or <span style="color:red"> game </span>.

To query by <span style="color:red"> *gameId* </span> and <span style="color:red"> *playerId* </span>:

**Required field for Stats by Id**


Field | Type | Example
------ | ----- | -------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> channel </span> | String| <span style="color:red"> *stats* </span>
<span style="color:red"> statType </span> | String | <span style="color:red"> *passing, rushing, receiving, defense* </span>
<span style="color:red"> gameId </span> | String | <span style="color:red"> *2016101604* </span>
<span style="color:red"> playerId </span> | String | <span style="color:red"> *00-0027973* </span> 


To query by <span style="color:red"> *name* </span> and <span style="color:red"> *week* </span>:

**Required fields for Stats by Name and Week**

Field | Type | Example
------ | ------- | -----
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> channel </span> | String | <span style="color:red"> *stats* </span>
<span style="color:red"> statType </span> | String | <span style="color:red"> *passing, rushing, receiving, defense* </span>
<span style="color:red"> year </span> | Integer | <span style="color:red"> *2016, 2017* </span>
<span style="color:red"> week </span> | Integer  | <span style="color:red"> *1, 2* </span>... 
<span style="color:red"> seasonPhase | String  | </span> <span style="color:red"> *Preseason, Regular, Postseason* </span>
<span style="color:red"> firstName  | String | </span> <span style="color:red"> *Drew* </span>
<span style="color:red"> lastName | String | </span> <span style="color:red"> *Brees* </span>

# NBA Data

## NBA Websocket Endpoint

**wss://test.api.suredbits.com/nba/v0**

## Info

> Example request Info

```json
{
  "channel": "info", 
  "uuid": "[uuid]"
}
```

> Example of Info data

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

The <span style="color:red"> Info </span> channel returns high level information of the current status of the <span style="color:red"> NBA </span> endpoint. 

Field | Type | Example
------ | ----- | -------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>


## Games

> Example request Games

```json
{
  "channel": "games", 
  "year": 2018, 
  "month": 11, 
  "day": 24, 
  "uuid": "[uuid]"
}
```

> Example request Games with TeamId

```json
{
  "channel": "games", 
  "year": 2016, "month": 12, 
  "day": 20, 
  "teamId": "CHI", 
  "uuid": "[uuid]"
}
```

> Example Games data

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

The <span style="color:red"> Games </span> channel returns statistics about specific games played.  

**Required Fields**

Field | Type | Example
------ | ----- | -------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> channel </span> | String | <span style="color:red"> games </span>
<span style="color:red"> year </span> | Integer  | <span style="color:red"> 2016 </span>, <span style="color:red"> 2017 </span> and <span style="color:red"> 2018 </span>
<span style="color:red"> month </span> | Integer  | <span style="color:red"> 3 </span>, <span style="color:red"> 8 </span>, <span style="color:red"> 12 </span> etc..
<span style="color:red"> day </span>    | Integer |  Follows typical calendar convention: <span style="color:red"> 2 </span>, <span style="color:red"> 17 </span>, <span style="color:red"> 28 </span>, etc...

<aside class="notice">NOTE: We only support from year 2016 to current. </aside>

**Example Request with teamID**

To search for a game by a specific team, add an optional field for <span style="color:red"> teamID </span>


<a href="#NBATeamID">See Team ID Table</a>


## Players

> Example request Players

```json
{
  "channel": "players", 
  "lastName": "Durant", 
  "firstName": "Kevin", 
  "uuid": "[uuid]"
}
```

> Example Players data (Kevin Durant)

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

The <span style="color:red"> Players </span> channel returns biographical information about specific players. For individual player statistics, see the <span style="color:red"> Stats </span> channel 

**Required Fields**

Field | Type | Example 
------ | ------ |-------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> channel </span> | String | <span style="color:red"> players </span>
<span style="color:red"> firstName </span> | String | <span style="color:red"> Kevin </span>
<span style="color:red"> lastName </span>  | String | <span style="color:red"> Durant </span>


## Teams

> Example request for Roster

```json
{
  "channel": "team", 
  "retrieve": "roster", 
  "uuid": "[uuid]"
}
```
> Example request for Schedule 

```json
{
  "channel": "team", 
  "retrieve": "schedule", 
  "uuid": "[uuid]"
}
```
> Example request with Year

```json
{
  "channel": "team", 
  "retrieve": "schedule", 
  "season": "2016-2017", 
  "uuid": "[uuid]"
}
```

> Example of team Schedule (Chicago Bulls)

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
}
...

```
The <span style="color:red"> Teams </span> channel returns information such as <span style="color:red"> rosters </span> or <span style="color:red"> schedules </span> for specific teams.  

**Required Fields**

Field | Type |  Example
----- | ----- | --------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> channel </span> | String |  <span style="color:red"> teams </span>
<span style="color:red"> teamId </span> | String | <span style="color:red"> CHI </span>, <span style="color:red"> LAC </span>, <span style="color:red"> MIA </span>, etc...
<span style="color:red"> retrieve </span> | String | <span style="color:red"> roster </span> or <span style="color:red"> schedule </span> 

**Optional Fields**

Field | Type | Example
------|------|--------
<span style="color:red"> season </span> | String | <span style="color:red"> 2016-2017 </span>


<h3 id="NBATeamID"> Team ID Table</h3>

Team ID  | Team | Team ID | Team
----- | ------- | ------- | -------
ATL | Atlanta Hawks	| PHI | Philadelphia 76ers 
MIA	| Miami Heat | DET | Detroit Pistons	
BKN	| Brooklyn Nets | PHX	| Phoenix Suns
MIL	| Milwaukee Bucks | GSW  | Golden State Warriors
BOS	| Boston Celtics| POR	    | Portland Trail Blazers
MIN	| Minnesota Timberwolves | HOU  | Houston Rockets	
CHA	| Charlotte Hornets	| SAC  | Sacramento Kings
NOP	| New Orleans Pelicans | IND | Indiana Pacers	
CHI	| Chicago Bulls	| SAS   | San Antonio Spurs
NYK	| New York Knicks | LAC  | Los Angeles Clippers
CLE	| Cleveland Cavaliers | TOR   |	Toronto Raptors
OKC	| Oklahoma City Thunder | LAL | Los Angeles Lakers
DAL	| Dallas Mavericks |UTA	  | Utah Jazz
ORL	| Orlando Magic | MEM   | Memphis Grizzlies	
DEN	| Denver Broncos | WAS  | Washington Wizards


## Stats 

> Example request Stats by ID

```json
{
  "channel": "stats", 
  "gameId": "21600854", 
  "playerId": "201142", 
  "uuid": "[uuid]"
}
```

> Example request for Stats by Name

```json
{
  "channel": "stats", 
  "lastName": "Durant", 
  "firstName": "Kevin", 
  "year": 2017, 
  "month": 12, 
  "day": 12, 
  "uuid": "[uuid]"
}
```

> Example of player Stats data (Kevin Durant)

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
}`
```

The <span style="color:red"> Stats </span> channel returns data for individual players and allows you to query by <span style="color:red"> gameId </span>, <span style="color:red"> playerId </span> or by specific player <span style="color:red"> name </span>.

**Required Fields for Stats by Id**

Field | Type | Example 
------ | ------ | ------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> channel </span> | String | <span style="color:red"> stats </span>
<span style="color:red"> gameId </span> | String  | <span style="color:red"> "21600854" </span>
<span style="color:red"> playerId </span>  | String | <span style="color:red"> "201142" </span>


**Required Field for Stats by Name**

Field | Type | Example
------| -----| ---------
<span style="color:red"> uuid  </span> | String | <span style="color:red"> e.g. 123e4567-e89b-12d3-a456-426655440000 </span>
<span style="color:red"> channel </span> | String | <span style="color:red"> stats </span>
<span style="color:red"> Year </span> | Integer  | <span style="color:red"> 2016 </span>, <span style="color:red"> 2017 </span> and <span style="color:red"> 2018 </span>
<span style="color:red"> Month </span>| Integer  | <span style="color:red"> 2 </span>, <span style="color:red"> 6 </span>, <span style="color:red"> 10 </span> etc..
<span style="color:red"> Day </span> | Integer  | Follows typical calendar convention: <span style="color:red"> 3 </span>, <span style="color:red"> 18 </span>, <span style="color:red"> 25 </span>, etc...
<span style="color:red"> firstName </span> | String | <span style="color:red">  Kevin </span>
<span style="color:red"> lastName </span> | String | <span style="color:red"> Durant </span>

# Contact Us
Follow us on twitter <a href="https://twitter.com/SuredBits">@Suredbits</a>

Join our Slack channel <a href="https://join.slack.com/t/suredbits/shared_invite/enQtNDEyMjY3MTg1MTg3LTYyYjkwOGUzMDQ4NDAwZjE1M2I3MmQyNWNlZjNlYjg4OGRjYTRjNWUwNjRjNjg4Y2NjZjAxYjU1N2JjMTU1YWM">Suredbits Slack</a>
 
Email us at <a href="mailto:support@suredbits.com">support@suredbits.com</a>

