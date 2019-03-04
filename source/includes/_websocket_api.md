# Websocket Feed

Websocket api can be used for the following use cases

- Get real time feed of market data, this includes l2 and l3 orderbook and recent trades.
- Get price feeds - Mark prices of different contracts, price feed of underlying indexes etc.
- Get account specific notifications like fills, liquidations, ADL and PnL updates.

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
```

## Unsubscribe

If you want to unsubscribe from channel/contracts pairs, send an "unsubscribe" message. The structure is equivalent to subscribe messages. As a shorthand you can also provide no symbols for a channel, which will unsubscribe you from the channel entirely.

As a response to an unsubscribe message you will receive a subscriptions response.

> Unsubscribe Sample

```
// Request
{
    "type": "unsubscribe",
    "payload": {
        "channels": [
            {
                "name": "ticker"
            }
        ]
    }
}
```

## Authenticating a connection

Authentication allows clients to receives private messages, like trading notifications. Examples of the trading notifications are: fills, liquidations, adl and pnl updates.

To authenticate, you need to send a signed request of type 'auth' on your socket connection. Check the authentication section above for more details on how to sign a request using api key and secret.

The payload for the signed request will be
'GET' + timestamp + '/live'

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

To subscribe to private channels, the client needs to first send an auth event, providing api-key, and signature. 

You can create a new API key from here :
https://www.delta.exchange/app/account/manageapikeys

## Heartbeats

Delta websocket server sends ping frame every 30 secs, to which it expects a pong frame.
In case no pong frame is returned, the client will be disconnected in 1 minute.


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
    "timestamp": 1542108684,
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
// Snapshot Response
{
    "symbol": "BTCUSD_28Dec",
    "product_id": 3,
    "type": "snapshot",
    "timestamp": 1542108684,
    "buy": [{"price":"0.0014577","size":62},{"price":"0.0014571","size":28},{"price":"0.0014562","size":54},{"price":"0.001455","size":34}],
    "sell": [{"price":"6229.0","size":15964},{"price":"6229.5","size":3504},{"price":"6230.0","size":15964},{"price":"6231.0","size":15957}]
}
```

## Recent trades

**recent_trade** channel provides a real time feed of all recent trades (fills).

```
// Trades Response
{
    symbol: "BNBBTC_30Nov",
    price: "0.0014579",
    size: 100,
    buyer_role: "maker",
    seller_role: "taker",
    timestamp: 1542108684
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
    timestamp: 1542108684
}
```

## spot_price

**spot_price** channel provides a real time feed of the underlying index prices.

```
// Spot Price Response
{
    symbol: "BNB/BTC",
    price: "0.0014579",
    type: "spot_price
}
```

# Private Channels

Private channels require clients to authenticate.

## Margins
**margins** Channel provides updates for margin blocked for different assets

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
**positions** Channel provides updates for change in position. Need to pass list of product symbols while subscribing.

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

### orderUpdate

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

### fill

```
// Fill
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "type": "fill",
    "user_id": 1998,
    "order_id": 3283999,
    "side": "buy",
    "size": 190,
    "price": "0.00145791",
    "timestamp": 1544091555086559
}
```

### adl

```
// ADL
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "type": "adl",
    "timestamp": 1544091555086559

}
```

### self_trade

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

### pnl

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

###liquidation

```
// Liquidation
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "type": "liquidation",
    "user_id": 1998,
    "timestamp": 1542108684,
    "side": "buy",
    "size": 180,
    "liquidation_price": "0.00145791",
    "bankruptcy_price": "0.00145700",

}
```

### stop_trigger

```
// Stop Trigger
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "user_id": 1998
    "type": "stop_trigger",
    "timestamp": 1542108684,
    "side": "buy",
    "size": 180

}
```

### stop_cancel

```
// Stop Cancel
{
    "symbol": "BNBBTC_30Nov",
    "product_id": 7,
    "user_id": 1998
    "type": "stop_cancel",
    "timestamp": 1542108684,
    "side": "buy",
    "message": "",
    "size": 180
}
```
