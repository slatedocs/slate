# Websocket Feed

Websocket api can be used for the following use cases

- Get real time feed of market data, this includes L2 and L3 orderbook and recent trades.
- Get price feeds - Mark prices of different contracts, price feed of underlying indexes etc.
- Get account specific notifications like fills, liquidations, [ADL](https://www.delta.exchange/user-guide/docs/trading-guide/ADL/) and PnL updates.
- Get account specific updates on orders ,positions and wallets.

Access url

- Production - wss://socket.delta.exchange
- Testnet - wss://testnet-socket.delta.exchange

 You will be disconnected, if there is no activity within 60 after making connection.

# Product Categories

List of all the category names that should be used for subscribing to various public and private channels are listed here.

1. Put Options (symbol: ***put_options***)
2. Call Options (symbol: ***call_options***)
3. Futures (symbol: ***futures***)
4. Perpetual Futures (symbol: ***perpetual_futures***)

# Subscribing to Channels

## Subscribe

To begin receiving feed messages, you must first send a subscribe message to the server indicating which channels and contracts to subscribe for.

To specify contracts within each channel, just pass a list of symbols inside the channel payload. Mention ***["all"]*** in symbols if you want to receive updates across all the contracts. Please note that snapshots are sent only for specified symbols,meaning no snapshots are sent for symbol: ***"all"***.

Once a subscribe message is received the server will respond with a subscriptions message that lists all channels you are subscribed to. Subsequent subscribe messages will add to the list of subscriptions. 

> Subscription Sample

```
// Request
// Subscribe to BTCUSD_28Dec and ETHBTC_28Dec with the ticker and orderbookL2 channels,
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "ticker",
                "symbols": [
                    "BTCUSD_28Dec",
                    "ETHBTC_28Dec"
                ]
            },
            {
                "name": "l2_orderbook",
                "symbols": [
                    "BTCUSD_28Dec"
                ]
            },
            {
                "name": "funding_rate",
                "symbols": [
                    "all"
                ]
            }
        ]
    }
}

// Response
{
    "type": "subscriptions",
    "channels": [
        {
            "name": "l2_orderbook",
            "symbols": [
                "BTCUSD_28Dec"
            ],
        },
        {
            "name": "ticker",
            "symbols": [
                "BTCUSD_28Dec",
                "ETHBTC_28Dec"
            ]
        },
        {
            "name": "funding_rate",
            "symbols": [
                "all"
            ]
        }
    ]
}

// Error Response 
{
    "type": "subscriptions",
    "channels": [
        {
            "name": "l2_orderbook",
            "symbols": [
                "BTCUSD_28Dec"
            ],
        },
        {
            "name": "trading_notifications",
            "error": "subscription forbidden on trading_notifications. Unauthorized user"
        }
    ]
}
```


## Unsubscribe

If you want to unsubscribe from channel/contracts pairs, send an "unsubscribe" message. The structure is equivalent to subscribe messages. If you want to unsubscribe for specific symbols in a channel, you can pass it in the symbol list. As a shorthand you can also provide no symbols for a channel, which will unsubscribe you from the channel entirely.

> Unsubscribe Sample

```
// Request
{
    "type": "unsubscribe",
    "payload": {
        "channels": [
            {
                "name": "ticker",          // unsubscribe from ticker channel only for BTCUSD_28Dec
                "symbols": [
                    "BTCUSD_28Dec"
                ]
            },
            {
                "name": "l2_orderbook"      // unsubscribe from all symbols for l2_orderbook channel
            }
        ]
    }
}
```

## Authenticating a connection

Authentication allows clients to receives private messages, like trading notifications. Examples of the trading notifications are: fills, liquidations, [adl](/#trading-notitifications) and pnl updates.

To authenticate, you need to send a signed request of type 'auth' on your socket connection. Check the authentication section above for more details on how to sign a request using api key and secret.

The payload for the signed request will be
'GET' + timestamp + '/live'

To subscribe to private channels, the client needs to first send an auth event, providing api-key, and signature. 

> Authentication sample

```python
// auth message with signed request
import websocket
import hashlib
import hmac
import base64

api_key = 'a207900b7693435a8fa9230a38195d'
api_secret = '7b6f39dcf660ec1c7c664f612c60410a2bd0c258416b498bf0311f94228f'

def generate_signature(secret, message):
    message = bytes(message, 'utf-8')
    secret = bytes(secret, 'utf-8')
    hash = hmac.new(secret, message, hashlib.sha256)
    return hash.hexdigest()

def get_time_stamp():
    d = datetime.datetime.utcnow()
    epoch = datetime.datetime(1970,1,1)
    return str(int((d - epoch).total_seconds()))

# Get open orders
method = 'GET'
timestamp = get_time_stamp()
path = '/live'
signature_data = method + timestamp + path
signature = generate_signature(api_secret, signature_data)


ws = websocket.WebSocketApp('wss://api.delta.exchange:2096')
ws.send(json.dumps({
    "type": "auth",
    "payload": {
        "api-key": api_key,
        "signature": signature,
        "timestamp": timestamp
    }
}))
```

```nodejs

```

To unsubscribe from all private channels, just send a 'unauth' message on the socket. This will automatically unsubscribe the connection from all authenticated channels.

```python
ws.send(json.dumps({
    "type": 'unauth',
    "payload": {}
}))

```

# Detecting Connection Drops
Some client libraries might not detect connection drops properly. We provide two methods for the clients to ensure they are connected and getting subscribed data.

## Heartbeat (Recommended)
The client can enable heartbeat on the socket. If heartbeat is enabled, the server is expected to periodically send a heartbeat message to the client. Right now, the heartbeat time is set to 30 seconds. 

### How to Implement on client side

- Enable heartbeat (check sample code) after each successful socket connection
- Set a timer with duration of 35 seconds (We take 5 seconds buffer for heartbeat to arrive).
- When you receive a new heartbeat message, you reset the timer
- If the timer is called, that means the client didn't receive any heartbeat in last 35 seconds. In this case, the client should exit the existing connection and try to reconnect. 

```
// Enable Heartbeat on successful connection
ws.send({
    "type": "enable_heartbeat"
})

// Disable Heartbeat
ws.send({
    "type": "disable_heartbeat"
})

// Sample Heartbeat message received periodically by client
{
    "type": "heartbeat"
}
```


## Ping/Pong
The client can periodically (~ every 30 seconds) send a ping frame or a raw ping message and the server will respond back with a pong frame or a raw pong response. If the client doesn't receive a pong response in next 5 seconds, the client should exit the existing connection and try to reconnect. 

```
// Ping Request
ws.send({
    "type": "ping"
})

// Pong Response
ws.send({
    "type": "pong"
})
```

# Public Channels

## v2 ticker

The ticker channel provides price change data for the last 24 hrs (rolling window). It is published every 5 seconds.

You need to send the list of symbols for which you would like to subscribe to ticker channel. You can also subscribe to 
ticker updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
If you would like to subscribe for all the listed contracts, pass: `{ "symbols": ["all"] }`.
Please note that if you subscribe to ticker channel without specifying the symbols list, you will not receive any data.

> Ticker Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "v2/ticker",
                "symbols": [
                    "BTCUSD_28Dec"
                ]
            }
        ]
    }
}
// Subscribe to all the symbols
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "v2/ticker",
                "symbols": [
                    "all"
                ]
            }
        ]
    }
}
```

```
// Response
{
    "close": 0.00001327,
    "high": 0.00001359,
    "low": 0.00001323,
    "mark_price": "0.00001325",
    "open": 0.00001347,
    "product_id": 56,
    "size": 1254631,                        // num of contracts traded
    "spot_price": "0.00001326",             
    "symbol": "BTCUSD_28Dec",
    timestamp: 1595242187705121,            // in us
    "turnover": 16.805033569999996,         // turnover reported in settling symbol
    "turnover_symbol": "BTC",               // settling symbol
    "turnover_usd": 154097.09108233,        // turnover in usd
    "volume": 1254631                       // volume is defined as contract_value * size 
}
```

## l1_orderbook

**l1_orderbook** channel provides level1 orderbook updates. You need to send the list of symbols for which you would like to subscribe to L1 orderbook. You can also subscribe to 
orderbook updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
If you would like to subscribe for all the listed contracts, pass: `{ "symbols": ["all"] }`.
Please note that if you subscribe to L1 channel without specifying the symbols list, you will not receive any data.

> L1 Orderbook Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "l1_orderbook",
                "symbols": [
                    "ETHUSDT"
                ]
            }
        ]
    }
}
```

```
// l1 orderbook Response
{
  "ask_qty":"839",
  "best_ask":"1211.3",
  "best_bid":"1211.25",
  "bid_qty":"772",
  "last_sequence_no":1671603257645135,
  "last_updated_at":1671603257623000,
  "product_id":176,"symbol":"ETHUSDT",
  "timestamp":1671603257645134,
  "type":"l1_orderbook"
}
```


## l2_orderbook

**l2_orderbook** channel provides the complete level2 orderbook for the sepecified list of symbols at a pre-determined frequency. The frequency of updates may vary for different symbols. You can only subscribe to upto 20 symbols on a single connection. Unlike L1 orderbook channel, L2 ordebook channel doesnt accept prodcut category names or "all" as valid synbols. 
Please note that if you subscribe to L2 channel without specifying the symbols list, you will not receive any data.

> L2 Orderbook Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "l2_orderbook",
                "symbols": [
                    "ETHUSDT"
                ]
            }
        ]
    }
}
```

```
// l2 orderbook Response
{
  "type":"l2_orderbook"
  "symbol":"ETHUSDT",
  "product_id": 176,
  "buy": [{"limit_price":"101.5","size":10,"depth":"10"},{"limit_price":"101.0","size":28,"depth":"38"}],
  "sell": [{"limit_price":"102.0","size":20,"depth":"20"},{"limit_price":"102.5","size":"25","depth":"45"},{"limit_price":"103.0","size":30,"depth":"75"}],
  "last_sequence_no": 1671600134033215,
  "last_updated_at": 1671600133884000,
  "timestamp":1671600134033215,
}
```

## all_trades

**all_trades** channel provides a real time feed of all trades (fills).
You need to send the list of symbols for which you would like to subscribe to all trades channel. You can also subscribe to
all trades updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
If you would like to subscribe for all the listed contracts, pass: `{ "symbols": ["all"] }`.
Please note that if you subscribe to all_trades channel without specifying the symbols list, you will not receive any data.

> All Trades Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "all_trades",
                "symbols": [
                    "BTCUSD_28Dec"
                ]
            }
        ]
    }
}
```

```
// All Trades Response
{
    symbol: "BTCUSD_28Dec",
    price: "0.0014579",
    size: 100,
    type: "all_trades",
    buyer_role: "maker",
    seller_role: "taker",
    timestamp: 1561634049751430
}
```

## mark_price

**mark_price** channel provides a real time feed of mark price. This is the price on which all open positions are marked for liquidation.Please note that the product symbol is prepended with a "MARK:" to subscribe for mark price.
You need to send the list of symbols for which you would like to subscribe to mark price channel. You can also subscribe to 
mark price updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
If you would like to subscribe for all the listed contracts, pass: `{ "symbols": ["all"] }`.
Please note that if you subscribe to mark price channel without specifying the symbols list, you will not receive any data.

> Mark Price Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "mark_price",
                "symbols": [
                    "MARK:C-BTC-13000-301222"
                ]
            }
        ]
    }
}
```

```
// Mark Price Response
{
    "ask_iv":null,
    "ask_qty":null,
    "best_ask":null,
    "best_bid":"9532",
    "bid_iv":"5.000",
    "bid_qty":"896",
    "delta":"0",
    "gamma":"0",
    "implied_volatility":"0",
    "price":"3910.088012",
    "price_band":{"lower_limit":"3463.375340559572217228510815","upper_limit":"4354.489445440427782771489185"},
    "product_id":39687,
    "rho":"0",
    "symbol":"MARK:C-BTC-13000-301222",
    "timestamp":1671867039712836,
    "type":"mark_price",
    "vega":"0"
}
```

## spot_price

**spot_price** channel provides a real time feed of the underlying index prices. Specifying symbols when subscribing to spot_price is necessary to receive updates. No updates are sent for symbol: ***"all"***

> Spot Price Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "spot_price",
                "symbols": [
                    ".DEBNBBTC"
                ]
            }
        ]
    }
}
```

```
// Spot Price Response
{
    symbol: ".DEBNBBTC",
    price: "0.0014579",
    type: "spot_price",
    timestamp: 1561634049751430
}
```

## spot_30mtwap_price

**spot_30mtwap_price** channel provides a real time feed of the 30 min twap of underlying index prices. 
This is the price used for settlement of options. Specifying symbols when subscribing to spot_30mtwap_price is necessary to receive updates. No updates are sent for symbol: ***"all"***

> Spot Price 30mtwap Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "spot_30mtwap_price",
                "symbols": [
                    ".DEXBTUSDT"
                ]
            }
        ]
    }
}
```

```
// Spot 30 minutes twap Price Response
{
    symbol: ".DEXBTUSDT",
    price: "0.0014579",
    type: "spot_30mtwap_price",
    timestamp: 1561634049751430
}
```

## funding_rate

**funding_rate** channel provides a real time feed of funding rates for perpetual contracts.

You need to send the list of symbols for which you would like to subscribe to funding rate channel. You can also subscribe to funding rate updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
If you would like to subscribe for all the listed contracts, pass: `{ "symbols": ["all"] }`.
Please note that if you subscribe to funding rate channel without specifying the symbols list, you will not receive any data.

 
> Funding Rate Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "funding_rate",
                "symbols": [
                    "BTCUSD_28Dec"
                ]
            }
        ]
    }
}
```

```
// Funding Rate Response
{
    symbol: "BTCUSD_28Dec",
    product_id: 7,
    type: "funding_rate",
    funding_rate: "-0.00401010",  // in %
    timestamp: 1561634049751430   // in us
}
```

## product_updates
This channel provides updates when markets are disrupted and resumed. On opening, we conduct a single price auction and auction starting and finish events are also published on this channel. To subscribe, you dont need to pass the symbol list. This channel automatically subscribes to all markets by default.

>  Product Updates Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "product_updates"
            }
        ]
    }
}
```

```
// Market Disruption Response
{
    "type":"product_updates",
    "event":"market_disruption",
    "product":{
        "id":17,
        "symbol":"NEOUSDQ",
        "trading_status":"disrupted_cancel_only",
    },
    "timestamp": 1561634049751430,
}

// Auction Started Response
{
    "type":"product_updates",
    "event":"start_auction",
    "product":{
        "id":17,
        "symbol":"NEOUSDQ",
        "trading_status":"disrupted_post_only",
    },
    "timestamp": 1561634049751430,
}

// Auction Finished Response
{
    "type":"product_updates",
    "event":"finish_auction",
    "product":{
        "id":17,
        "symbol":"NEOUSDQ",
        "trading_status":"operational",
    },
    "timestamp": 1561634049751430,
}
```
### Market Disruption
When markets are disrupted, orderbook enters into cancel only mode. You can refer to "trading_status" field in product info to determine this. In cancel only mode, you can only cancel your orders. No matching happens in this mode.

### Auction Started
When markets need to come up, we conduct a single price auction. In this case, orderbook enters into post only mode. In post only mode, you can post new orders, cancel exisiting orders, add more margin to open positions. No matching happens in this mode. It is possible to see an overlap between asks and bids during this time.


### Auction Finished
When auction finishes, markets enter into operational mode and trading continues as usual. 

You can read more about the single price auction [here](https://www.delta.exchange/blog/bootstrapping-liquidity-using-auctions/)


## announcements
This channel provides updates on system wide announcements like scheduled maintenance, new contract launches etc. No need to pass any symbols while subscribing to this channel.

> Announcements Sample


```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "announcements"
            }
        ]
    }
}
```

```
// Maintenance Started Response
{
    "type":"announcements",
    "event":"maintenance_started",
    "maintenance_finish_time": 1561638049751430,
    "timestamp": 1561634049751430,
}

// Maintenance Finished Response
{
    "type":"announcements",
    "event":"maintenance_finished",
    "timestamp": 1561634049751430,
}
```

## candlesticks
This channel provides last ohlc candle for given time resolution.

Subscribe to **candlestick_${resolution}** channel for updates. 

List of supported resolutions
["1m","3m","5m","15m","30m","1h","2h","4h","6h","12h","1d","1w","2w","30d"]
 
You need to send the list of symbols for which you would like to subscribe to candlesticks channel. You can also subscribe to candlesticks
updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
Please note that if you subscribe to candlsticks channel without specifying the symbols list, you will not receive any data.

>OHLC candles update sample

```
Sample Subscribe Request
{
  "name": "candlestick_1m",                 // "candlestick_" + resolution
  "symbols": [ "BTCUSDT" ]        // product symbol
}



Sample feed response

{
    "candle_start_time": 1596015240000000,
    "close": 9223,
    "high": 9228,
    "low": 9220,
    "open": 9221,
    "resolution": "1m",
    "symbol": "BTCUSDT",
    "timestamp": 1596015289339699,
    "type": "candlestick_1m",
    "volume": 1.2
}
```

# Private Channels

Private channels require clients to authenticate.

## Margins
Channel provides updates for margin blocked for different assets, these updates are provided only on change of margin.

> Margins Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "margins"
            }
        ]
    }
}
```
```
// margin update
{
    "type": "margins",
    "balance": "1.0012",            // wallet balance = deposits - withdrawals + realised_cashflows
    "available_balance": "0.1",     // available balance for trading
    "order_margin": "0.121212",     // Margin blocked in isolated margined open orders
    "position_margin": "0.101212",  // Margin blocked in isolated margined positions
    "commission": "0.00012",        // commissions blocked in isolated margined positions and orders
    "portfolio_margin": "2.333"     // Margin blocked for portfolio margined positions and orders. Same as blocked margin in portfolio margins channel.
    "asset_id": 2                   // BTC
    "asset_symbol": "BTC",          // BTC
    "unvested_amount": "0.05"       // amount locked. Relevant only for DETO
    "timestamp": 1668570144,        // unix timestamp in microseconds
}
```

## Positions
This channel provides updates whenever there is any change in your open positions.

A snapshot of current open position will be sent after subscribing a symbol, incremental updates will be sent on trade executions.
You need to send the list of symbols for which you would like to subscribe to positions channel. You can also subscribe to positions 
updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
If you would like to subscribe for all the listed contracts, pass: `{ "symbols": ["all"] }`.
Please note that if you subscribe to positions channel without specifying the symbols list, you will not receive any data.

> Positions Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "positions",
                "symbols": ["BTCUSD_29Mar"]
            }
        ]
    }
}

//Subscribe for all the symbols
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "positions",
                "symbols": ["all"]
            }
        ]
    }
}
```

```
// Position update
{
    "type": "positions",
    "action": "",                       // "create"/"update"/"delete"
    "reason": "",                       // null, "auto_topup"
    "symbol": "BTCUSD_29Mar",           // Product Symbol
    "product_id": 1,                    // Product ID
    "size": -100,                       // Position size, if > 0 -> long else short
    "margin": "0.0121",                 // Margin blocked in the position
    "entry_price": "3500.0",            // Avg Entry price of the position
    "liquidation_price": "3356.0",      // Liquidation trigger price
    "bankruptcy_price": "3300.0",       // Bankruptcy Price
    "commission": "0.00001212"          // Commissions blocked for closing the position
}

//Snapshot 
{
   "result":[
      {
         "adl_level":"4.3335",
         "auto_topup":false,
         "bankruptcy_price":"261.82",
         "commission":"17.6571408",
         "created_at":"2021-04-29T07:25:59Z",
         "entry_price":"238.023457888493475682",
         "liquidation_price":"260.63",
         "margin":"4012.99",
         "product_id":357,
         "product_symbol":"ZECUSDT",
         "realized_funding":"-3.08",
         "realized_pnl":"6364.57",
         "size":-1686,
         "updated_at":"2021-04-29T10:00:05Z",
         "user_id":1,
         "symbol":"ZECUSDT"
      }
   ],
   "success":true,
   "type":"positions",
   "action":"snapshot"
}
```

## Orders
Channel provides updates when any order is updated for any action such as fill, quantity change. Need to pass list of product symbols while subscribing.

A snapshot of all open/pending orders will be sent after subscribing a symbol. And all incremental updates will be sent on create/update/delete of orders

All updates including snapshot will have incremental seq_id. seq_id is separate for each symbol.

Any of the following events can be tracked by the reason field in this channel

- fill
- stop_update
- stop_trigger
- stop_cancel
- liquidation
- self_trade


You need to send the list of symbols for which you would like to subscribe to orders channel. You can also subscribe to orders
updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
If you would like to subscribe for all the listed contracts, pass: `{ "symbols": ["all"] }`.
Please note that if you subscribe to orders channel without specifying the symbols list, you will not receive any data.

> Orders Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "orders",
                "symbols": ["BTCUSD_29Mar"]
            }
        ]
    }
}
```
```
// Order update

{
    "type": "orders",
    "action": "create",                 // "create"/"update"/"delete"
    "reason": "",                       // "fill"/"stop_update"/"stop_trigger"/"stop_cancel"/"liquidation"/"self_trade"/null
    "symbol": "BTCUSD_29Mar",           // Product Symbol
    "product_id": 1,                    // Product ID
    "order_id": 1234                    // Order id
    "client_order_id": ""               // Client order id
    "size": 100,                        // Order size
    "unfilled_size": 55,                // Unfilled size
    "average_fill_price": "8999.00"     // nil for unfilled orders
    "limit_price": "9000.00"                  // Price of the order
    "side": "buy"                       // Order side (buy or sell)
    "cancellation_reason": "cancelled_by_user"        // Cancellation reason in case of cancelled order, null otherwise
    "stop_order_type": "stop_loss_order",             // If a Stop Order -> "stop_loss_order"/"take_profit_order", null otherwise
    "bracket_order": false              // true for a bracket_order, false otherwise
    "state": "open"                     // "open"/"pending"/"closed"/"cancelled"
    "seq_no": 1                         // Incremental sequence number
    "timestamp": 1594105083998848       // Unix timestamp in microseconds
    "stop_price": "9010.00"                             // stop_price of stop order        
    "trigger_price_max_or_min": "9020.00"               // for trailing stop orders
    "bracket_stop_loss_price": "8090.00"
    "bracket_stop_loss_limit_price": "8090.00"
    "bracket_take_profit_price": "9020"      
    "bracket_take_profit_limit_price": "9020"
    "bracket_trail_amount": "10.00"
}

// Snapshot
{
  "meta": {
    "seq_no": 7,
    "timestamp": 1594149235554045
  },
  "result": [
    {
      "id": 1592130,
      "limit_price": "9000",
      "order_type": "limit_order",
      "product_id": 13,
      "reduce_only": false,
      "side": "buy",
      "size": 1,
      "state": "open",
      "stop_order_type": null,
      "stop_price": null,
      "time_in_force": "gtc",
      "trail_amount": null,
      "unfilled_size": 1,
      "average_fill_price": "8999.00",
      "user_id": 1132
    }
  ],
  "success": true,
  "symbol": "BTCUSD",
  "type": "orders",
  "action": "snapshot"
}
```

## UserTrades
Channel provides updates for fills. Need to pass list of product symbols while subscribing.

All updates will have incremental seq_id. seq_id is separate for each symbol.

Auto Deleverage Liquidations of a position can be tracked by reason: "adl" in the user_trades channel.
You need to send the list of symbols for which you would like to subscribe to user trades channel. You can also subscribe to user trades
updates for category of products by sending [category-names](/#product-categories). For example: to receive updates for put options and futures, refer this: `{"symbols": ["put_options", "futures"]}`.
If you would like to subscribe for all the listed contracts, pass: `{ "symbols": ["all"] }`.
Please note that if you subscribe to user trades channel without specifying the symbols list, you will not receive any data.

> User Trades Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "user_trades",
                "symbols": ["BNBBTC_30Nov"]
            }
        ]
    }
}
```
```
// user_trades
{
    "symbol": "BNBBTC_30Nov",
    "fill_id": "1234-abcd-qwer-3456",
    "reason": "normal"                      // "normal" or "adl"
    "product_id": 7,
    "type": "user_trades",
    "user_id": 1998,
    "order_id": 3283999,
    "side": "buy",
    "size": 190,
    "price": "0.00145791",
    "role": "taker",
    "client_order_id": "GA123",
    "timestamp": 1544091555086559,
    "seq_no": 1
}
    
```

## PortfolioMargins
Channel provides updates for portfolio margin values of the selected sub-account. These updates are sent every 2 seconds. In case portfolio margin is not enabled on the selected sub-account, no updates will be sent on this channel.

For detailed description of portfolio magrgin please see [user guide](https://guides.delta.exchange/delta-exchange-user-guide/trading-guide/margin-explainer/portfolio-margin)

UCF: is unrealised cashflows of your portfolio. These are the cashflows (negative for outgoing and positive for incoming) that will take place if all the positions in your portfolio are closed at prevailing mark prices.

> Portfolio Margin Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "portfolio_margins",
                "symbols": [".DEXBTUSDT"]
            }
        ]
    }
}
```
```
// portfolio margin update

{
    "type": "portfolio_margins",
    "user_id": 1,
    "asset_id": 2,                   // BTC
    "index_symbol": ".DEXBTUSDT",
    liquidation_risk: false,
    "blocked_margin": "100", // Margin blocked for current portfolio. Same as portfolio_margin in margins channel.
    "mm_wo_ucf": "80",
    "mm_w_ucf": "80",
    "im_wo_ucf": "100",
    "im_w_ucf": "100",
    "positions_upl": "0", 
    "risk_margin": "100",
    "risk_matrix":{"down":[{"is_worst":false,"pnl":"230.03686162","price_shock":"10"}],"unchanged":[{"is_worst":false,"pnl":"230.03686162","price_shock":"10"}],"up":[]},
    "futures_margin_floor": "20",
    "short_options_margin_floor": "20",
    "long_options_margin_floor": "20",
    "under_liquidation": false,
    "commission": "3.444",
    "margin_floor": "60",
    "timestamp": 1544091555086559, //timestamp in microseconds
    "margin_shortfall": "4.5"             // key sent when liquidation_risk is true 
}

```

Keys - 

<dl>
    <dt>index_symbol</dt>
    <dd>This is the coin on which portfolio margin is enabled.</dd>
    <dt>positions_upl</dt>
    <dd>This is unrealised cashflows (UCF) of your portfolio. These are the cashflows (negative for outgoing and positive for incoming) that will take place if all the positions in your portfolio are closed at prevailing mark prices. Unrealised cashflow is positive for long options and negative for short options.</dd>
    <dt>im_w_ucf</dt>
    <dd>This is the initial margin (IM) requirement for the portfolio. IM is computed as max(risk_margin, margin_floor) - UCF.</dd>
    <dd>If UCF > max(risk_margin, margin_floor) then IM is negative. Negative margin requirement results in increase in your balance available for trading.</dd>
    <dd>If the Wallet Balance (ex spot orders) is less than IM then you would only be able to place orders that reduce the risk of the portfolio.</dd>
    <dt>im_wo_ucf</dt>
    <dd>This is IM without UCF.</dd>
    <dt>mm_w_ucf</dt>
    <dd>This is the maintenance margin (MM) requirement for the portfolio. MM is computed as 80% * max(risk_margin, margin_floor) - UCF.</dd>
    <dd>If the Wallet Balance (ex spot orders) is less than MM then the portfolio will go into liquidation.</dd>
    <dd></dd>
    <dt>mm_wo_ucf</dt>
    <dd>This is MM without UCF.</dd>
    <dt>commission</dt>
    <dd>This is the trading fees blocked for the open orders/positions (for closing the positions) in the portfolio.</dd>
    <dd>This is in addition to the IM requirement.</dd>
    <dt>blocked_margin</dt>
    <dd>The margin actually blocked for your portfolio. If your Wallet Balance (ex spot orders) is greater than IM + commission then blocked_margin = IM + commissions. Otherwise blocked_margin is equal to the maximum amout we are able to block to meet the portfolio margin requirement.</dd>
    <dd>If blocked_margin < MM then the portfolio goes into liquidation.</dd>
    <dt>liquidation_risk</dt>
    <dd>This flag indicates if the portfolio is at liquidation risk.</dd>
    <dd>This flag is set to TRUE when blocked_margin < im_w_ucf + commissions.</dd>
    <dt>under_liquidation</dt>
    <dd>This flag is set to TRUE when the portfolio is under liquidation.</dd>
    <dt>margin_shortfall</dt>
    <dd>This is the minimum topup amount needed to bring the portfolio out of liquidation risk state.</dd>
    <dt>risk_margin</dt>
    <dd>The maximum likely loss of the portfolio under the various simulated stress scenarios.</dd>
    <dt>risk_matrix</dt>
    <dd>Matrix showing the profit/loss of the portfolio under various simulated stress scenarios.</dd>
    <dd> Profit/loss for each position and open order is computed with reference to the prevailing mark prices. Positive numbers indicate profit and negative numbers indicate loss.</dd>
    <dt>margin_floor</dt>
    <dd>Margin Floor is the minimum risk_margin required for a portfolio. </dd>
    <dd>It is comprised of sum of futures_margin_floor, long_options_margin_floor, short_options_margin_floor</dd>
</dl>

## MMP Trigger
Channel provides updates when MMP is triggered.Market maker protection is available to registered market makers by default. Others can reach out to support for getting access to MMP. More info [here](https://guides.delta.exchange/delta-exchange-user-guide/market-makers-guide/market-maker-protection).  

> MMP Trigger Sample

```
//Subscribe
{
    "type": "subscribe",
    "payload": {
        "channels": [
            {
                "name": "mmp_trigger"
            }
        ]
    }
}
```
```
// mmp_trigger response
{
    user_id: 1,
    asset: "BTC",
    frozen_till: 1561634049751430     # timestamp is microseconds, will be -1 if manual reset is enabled 
}
```