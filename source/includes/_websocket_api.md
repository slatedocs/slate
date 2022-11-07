# Websocket Feed

Websocket api can be used for the following use cases

- Get real time feed of market data, this includes L2 and L3 orderbook and recent trades.
- Get price feeds - Mark prices of different contracts, price feed of underlying indexes etc.
- Get account specific notifications like fills, liquidations, [ADL](https://www.delta.exchange/user-guide/docs/trading-guide/ADL/) and PnL updates.

Access url

- Production - wss://socket.delta.exchange
- Testnet - wss://testnet-socket.delta.exchange

# Subscribing to Channels

## Subscribe

To begin receiving feed messages, you must first send a subscribe message to the server indicating which channels and contracts to subscribe for. This message is mandatory — you will be disconnected if no subscribe has been received within 60 seconds.

To specify contracts within each channel, just pass a list of symbols inside the channel payload.

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

On subscribing to **v2/ticker** channel, socket server will emit messages with type 'ticker' in response.

> Ticker Sample

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
    "symbol": "ADABTC",
    timestamp: 1595242187705121,            // in us
    "turnover": 16.805033569999996,         // turnover reported in settling symbol
    "turnover_symbol": "BTC",               // settling symbol
    "turnover_usd": 154097.09108233,        // turnover in usd
    "volume": 1254631                       // volume is defined as contract_value * size 
}
```

## l2_orderbook

**l2_orderbook** channel provides snapshot of the latest level2 orderbook.

> L2 Orderbook Sample

```
// l2 orderbook Response
{
    "symbol": "BTCUSD_28Dec",
    "product_id": 3,
    "type": "l2_orderbook",
    "timestamp": 1561634049751430,
    "buy": [{"limit_price":"0.0014577","size":62},{"limit_price":"0.0014571","size":28}],
    "sell": [{"limit_price":"6229.0","size":15964},{"limit_price":"6229.5","size":3504},{"limit_price":"6230.0","size":15964},{"limit_price":"6231.0","size":15957}]
}
```

## all_trades

**all_trades** channel provides a real time feed of all trades (fills).

```
// All Trades Response
{
    symbol: "BNBBTC_30Nov",
    price: "0.0014579",
    size: 100,
    type: "all_trades",
    buyer_role: "maker",
    seller_role: "taker",
    timestamp: 1561634049751430
}
```

## mark_price

**mark_price** channel provides a real time feed of mark price. This is the price on which all open positions are marked for liquidation.

Please note that the product symbol is prepended with a "MARK:" to subscribe for mark price.

```
// Mark Price Response
{
    symbol: "MARK:BNBBTC_30Nov",
    product_id: 7,
    type: "mark_price",
    price: "0.00401010",
    annualized_basis: "25.12",    // in %
    timestamp: 1561634049751430
}
```

## spot_price

**spot_price** channel provides a real time feed of the underlying index prices.

```
// Spot Price Response
{
    symbol: ".DEBNBBTC",
    price: "0.0014579",
    type: "spot_price",
    timestamp: 1561634049751430
}
```

## funding_rate

**funding_rate** channel provides a real time feed of funding rates for perpetual contracts.

```
// Funding Rate Response
{
    symbol: "BNBBTC_30Nov",
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

>OHLC candles update sample

```
Sample Subscribe Request
{
  "name": "candlestick_1m",                 // "candlestick_" + resolution
  "symbols": [ "BTCUSD", "ETHUSDT" ]        // product symbol
}



Sample feed response

{
    "candle_start_time": 1596015240000000,
    "close": 9223,
    "high": 9228,
    "low": 9220,
    "open": 9221,
    "resolution": "1m",
    "symbol": "BTCUSD_P",
    "timestamp": 1596015289339699,
    "type": "candlestick_1m",
    "volume": 1.2
}
```

# Private Channels

Private channels require clients to authenticate.

## Margins
Channel provides updates for margin blocked for different assets, these updates are provided only on change of margin.

```
// margin update
{
    "type": "margins",
    "balance": "1.0012",
    "order_margin": "0.121212",     // Margin blocked in open orders
    "position_margin: "0.101212",   // Margin blocked in position
    "commission": "0.00012",        // commissions blocked in position and order
    "asset_id": 2                   // BTC
}
```

## Positions
Channel provides updates for change in position. Need to pass list of product symbols while subscribing. these updates are provided only on change of position.

A snapshot of current open position will be sent after subscribing a symbol, incremental updates will be sent on trade executions.

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
Channel provides updates for details of margin values for portfolio, these updates are provided every 2 seconds.

Keys - 

- im_w_ucf -
        This is the final initial margin requirement of the portfolio.
          im_w_ucf = max(risk_margin, margin_floor) - ucf
- im_wo_ucf -
        This is the initial margin requirement of the portfolio without ucf
          im_wo_ucf = max(risk_margin, margin_floor) - ucf
- mm_w_ucf -
        This is the final maintenance margin requirement of the portfolio.
          mm_w_ucf = 80% * max(risk_margin, margin_floor) - ucf
- mm_wo_ucf -
        This is the maintenance margin requirement of the portfolio without ucf.
          mm_wo_ucf = 80% * max(risk_margin, margin_floor)
- commission -
        This is the commission required for the portfolio. It is added on top of the initial margin requirement.
- blocked_margin - 
        This is the actual blocked margin that we were able to block from the wallet balance to fullfill the initial margin and commissions requirement
- futures_margin_floor - 
        This is the Margin Floor requirement contributed by futures
- long_options_margin_floor -
        This is the Margin Floor requirement contributed by long options position/orders
- short_options_margin_floor - 
        This is the Margin Floor requirement contributed by short options position/orders
- margin_floor - 
          margin_floor = long_options_margin_floor + short_options_margin_floor
- risk_margin - 
          This is the Risk Margin requirement calculated as per our stress scenarios
- risk_matrix -
          Matrix showing details for all the stress scenarios 
- positions_upl - 
          This is the UCF which summations of all positions marked at mark price. More details in user guide
- liquidation_risk
          This is a flag showing if the portfolio is in liquidation risk.
            ideally when 
              blocked_margin < im_w_ucf + commissions
                In such situation the portfolio is not sufficiently margined
                After some cusion we start sending liquidation_risk as true indicating a potential liquidation 
                So while placing new orders this deficit also needs to be fulfilled along with any additional margin requirement for the order
              blocked_margin < mm_w_ucf
                This is our liquidation condition
- under_liquidation
          This is a flag showing if the portfolio is under liquidation.
          During this process we follow all our liquidation steps which can be seen here
- under_liquidation
          This is the shortfall value in margin to not be under liquidation risk


```
// portfolio margin update

{
    "type": "portfolio_margins",
    "user_id": 1,
    "asset_id": 2,                   // BTC
    "index_symbol": ".DEXBTUSDT",
    liquidation_risk: false,
    "blocked_margin": "100",
    "mm_wo_ucf": "80",
    "mm_w_ucf": "80",
    "im_wo_ucf": "100",
    "im_w_ucf": "100",
    "positions_upl": "0",
    "risk_margin": "100",
    "risk_matrix": {
        "down":[
            {"is_worst":false,"pnl":"230.03686162","price_shock":"10"}
        ],
        "unchanged":[
            {"is_worst":false,"pnl":"230.03686162","price_shock":"10"}
        ],
        "up":[]
    },
    "futures_margin_floor": "20",
    "short_options_margin_floor": "20",
    "long_options_margin_floor": "20",
    "under_liquidation": false,
    "commission": "3.444",
    "margin_floor": "60",
    "timestamp": 1544091555086559,
    "margin_shortfall": "4.5"             // key sent when liquidation_risk is true 
}

```
<!-- 
## Trading Notitifications

**trading_notifications** channel provides updates of all the private trade notifications.

## orderUpdate
Channel provides updates when any order is updated for any action such as fill, quantity change.

```
// orderUpdate
{
    "type": "orderUpdate",
    "action": "fill",
    "product_id": 3,
    "symbol": "BTCUSD_28Dec",
    "order_id": 3283999,
    "side": "buy",
    "unfilled_size": 1,
    "filled_size": 1,
    "price": "4500.0",
    "state": "open",
    "timestamp": 1544091555086559
}
```


## fill
Channel provides updates when any order is executed.

```
// Fill
{
    "symbol": "BNBBTC_30Nov",
    "fill_id": "1234-abcd-qwer-3456",
    "product_id": 7,
    "type": "fill",
    "user_id": 1998,
    "order_id": 3283999,
    "side": "buy",
    "size": 190,
    "price": "0.00145791",
    "role": "taker",
    "client_order_id": "GA123",
    "timestamp": 1544091555086559
}
```

## adl
Channel provides updates when open position get auto deleveraged.

```
// ADL
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "type": "adl",
    "timestamp": 1544091555086559
    "side": 'buy',          // Position side
    "size": 32,             // size by which your position was reduced
    "entry_price": "0.000121",
    "exit_price": "0.0001222",
    "realized_pnl": "0.1",
}
```

## self_trade
Channel provide updates when any of your order get matched with your open order.

```
// Self Trade
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "type": "self_trade",
    "user_id": 1998,
    "size": 199,
    "price": "0.00145791",
    "timestamp": 1544091555086559
}
```

## pnl
Channel provides pnl updates when any position gets close.

```
// PNL
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "type": "pnl",
    "user_id": 1998,
    "side": "sell",
    "size": 180",
    "entry_price": "0.00145797",
    "exit_price": "0.00145791",
    "realized_pnl": "0.00102121",
    "timestamp": 1544091555086559

}
```

## liquidation
Channel provide updates when any position gets liquidated.

```
// Liquidation
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "type": "liquidation",
    "user_id": 1998,
    "timestamp": 1542108684000000,
    "side": "buy",              // side of the position which got liquidated
    "size": 180,	        // size of the position which got liquidated, always positive
    "liquidation_price": "0.00145791",
    "bankruptcy_price": "0.00145700",

}
```

## stop_trigger
Channel provide updates when stop order gets triggered.

```
// Stop Trigger
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "user_id": 1998
    "type": "stop_trigger",
    "timestamp": 1542108684000000,
    "side": "buy",
    "size": 180

}
```

## stop_cancel
Channel provide updates when stop order gets cancelled.

```
// Stop Cancel
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "user_id": 1998
    "type": "stop_cancel",
    "timestamp": 1542108684000000,
    "side": "buy",
    "message": "",
    "size": 180
}
```
## auto_topup
Channel provide updates when margin get updated due to auto_topup istrue for that open position.

```
// Auto Topup

```
 -->
