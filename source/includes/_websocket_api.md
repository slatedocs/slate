# Websocket Feed

Websocket api can be used for the following use cases

- Get real time feed of market data, this includes L2 and L3 orderbook and recent trades.
- Get price feeds - Mark prices of different contracts, price feed of underlying indexes etc.
- Get account specific notifications like fills, liquidations, [ADL](https://www.delta.exchange/user-guide/docs/trading-guide/ADL/) and PnL updates.

Access url

- Production - wss://api.delta.exchange:2096
- Testnet - wss://testnet-api.delta.exchange:2096

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

## ticker

The ticker channel provides price change data for the last 24 hrs (rolling window). It is published every 5 seconds.

On subscribing to **ticker** channel, socket server will emit messages with type 'ticker' in response.

> Ticker Sample

```
// Response
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "type": "ticker",
    "timestamp": 1561634049751430,
    "open": 0.0014622,
    "high": 0.0014622,
    "low": 0.0014622,
    "close": 0.0014622,
    "volume": 1
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

## recent_trade

**recent_trade** channel provides a real time feed of all recent trades (fills).

```
// Trades Response
{
    symbol: "BNBBTC_30Nov",
    price: "0.0014579",
    size: 100,
    "type": "recent_trade",
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
    annualized_basis: 25.12,    // in %
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

```
// Position update
{
    "type": "positions",
    "symbol": "BTCUSD_29Mar",           // Product Symbol
    "product_id": 1,                    // Product ID
    "size": -100,                       // Position size, if > 0 -> long else short
    "margin": "0.0121",                 // Margin blocked in the position
    "entry_price": "3500.0",            // Avg Entry price of the position
    "liquidation_price": "3356.0",      // Liquidation trigger price
    "bankruptcy_price": "3300.0",       // Bankruptcy Price
    "commission": "0.00001212"          // Commissions blocked for closing the position
}
```

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