# Websocket Feed

# Overview

Websocket api can be used for the following use cases

- Get real time feed of market data, this includes l2 and l3 orderbook and recent trades.
- Get price feeds - Mark prices of different contracts, price feed of underlying indexes etc.
- Get account specific notifications like fills, liquidations, ADL and PnL updates.

Access url

Production - wss://api.delta.exchange:3091
Testnet - wss://testnet-api.delta.exchange:3091

# Subscribing to Channels

## Subscribe
To begin receiving feed messages, you must first send a subscribe message to the server indicating which channels and contracts to receive. This message is mandatory — you will be disconnected if no subscribe has been received within 5 seconds.

To specify contracts to listen for within each channel, just pass a list of symbols inside the channel payload.

Once a subscribe message is received the server will respond with a subscriptions message that lists all channels you are subscribed to. Subsequent subscribe messages will add to the list of subscriptions.

> Subscription Sample

```
// Request
// Subscribe to BTCUSD_28Dec and ETHBTC_28Dec with the ticker and orderbookL2 channels,
{
    "type": "subscribe",
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
    "channels": [
       {
         "name": "ticker"
       }
    ]
}
```

## Authentication

Authentication allows clients to receives private messages, ie trading notifications. Examples of the trading notifications are: fills, liquidations.

# Public Channels

## ticker
The ticker channel provides real-time price updates every time a match happens. On subscribing to **ticker** channel, socket server will emit messages with type 'ticker' in response.
> Ticker Sample

```
// Response
{
    "symbol":"BNBBTC_30Nov",
    "product_id":7,
    "type":"ticker", 
    "timestamp":1542108684,
    "open":0.0014622,
    "high":0.0014622,
    "low":0.0014622,
    "close":0.0014622,
    "volume":1
}
```

## l2_orderbook
**l2_orderbook** channel provides snapshot of the latest level2 orderbook on subscription with the type **snapshot** in response. Subsequent updates will have type **l2update**.

> Ticker Sample

```
// Snapshot Response
{
    "symbol":"BTCUSD_28Dec",
    "product_id":3,
    "type":"snapshot", 
    "timestamp":1542108684,
    "buy": [{"price":"0.0014577","size":62},{"price":"0.0014571","size":28},{"price":"0.0014562","size":54},{"price":"0.001455","size":34}],
    "sell": [{"price":"6229.0","size":15964},{"price":"6229.5","size":3504},{"price":"6230.0","size":15964},{"price":"6231.0","size":15957}]
    
}
```
```
// Update Response
{
    "symbol":"BTCUSD_28Dec",
    "product_id":3,
    "type":"l2update", 
    "timestamp":1542108684,
    "buy": [],
    "sell": []
    
}
```

## mark_price
```
// Response
{
    symbol: "MARK:BNBBTC_30Nov",
    product_id: 7,
    type: 'mark_price',
    price: "",
    annualized_basis:,
    timestamp: 
}
```

## spot_price

```
// spot_price Response
{
    symbol: "BNB/BTC",
    price: "0.0014579",
    type: "spot_price
}
```

## trades

```
// spot_price Response
{ 
    symbol: "BNBBTC_30Nov", 
    price: "", 
    size: 100, 
    buyer_role: "maker", 
    seller_role: "taker",
    timestamp: 1542108684
}
```

# Private Channels

Private channels require clients to authenticate.

## trading_notifications

**trading_notifications** channel provides updates of all the private trade notifications.

### fill

```
// Fill Response
{
    "symbol":"BNBBTC_30Nov",
    "product_id":7,
    "type":"fill",
    "user_id": 1998,
    "side": "buy",
    "size": 190,
    "price": , 
    "timestamp":1542108684
}
```

### adl

```
// Update Response
{
    "symbol":"BNBBTC_30Nov",
    "product_id":7,
    "type":"adl", 
    "timestamp":1542108684
    
}
```

### self_trade

```
// Update Response
{
    "symbol":"BNBBTC_30Nov",
    "product_id":7,
    "type":"self_trade", 
    "user_id": 1998,
    "size": 199,
    "price": "",
    "timestamp":1542108684
}
```

###pnl

```
// Update Response
{
    "symbol":"BNBBTC_30Nov",
    "product_id":7,
    "type":"pnl",
    "user_id": 1998,
    "side": "sell",
    "size": "",
    "entry_price": "",
    "exit_price": "",
    "realized_pnl": "",
    "timestamp":1542108684
    
}
```

###liquidation

```
// Response
{
    "symbol":"BNBBTC_30Nov",
    "product_id":7,
    "type":"liquidation", 
    "user_id": 1998,
    "timestamp":1542108684,
    "side": "buy",
    "size": 180,
    liquidation_price: "",
    bankruptcy_price: "",
    
}
```

### stop_trigger

```
// Response
{
    "symbol":"BNBBTC_30Nov",
    "product_id":7,
    "user_id": 1998
    "type":"stop_trigger", 
    "timestamp":1542108684,
    "side": "buy",
    "size": 180
    
}
```

### stop_cancel
```
// Response
{
    "symbol":"BNBBTC_30Nov",
    "product_id":7,
    "user_id": 1998
    "type":"stop_cancel", 
    "timestamp":1542108684,
    "side": "buy",
    "message": "",
    "size": 180
    
}
```
