# Websocket Feed

# Overview

Websocket api can be used for the following use cases

- Get real time feed of market data, this includes l2 and l3 orderbook and recent trades.
- Get price feeds - Mark prices of different contracts, price feed of underlying indexes etc.
- Get account specific notifications like fills, liquidations, ADL and PnL updates.

Base url

wss://api.delta.exchange:3091

# Subscribing to Channels

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
            "name": "orderBookL2",
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
            "name": "orderBookL2",
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

# Unsubscribing

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

# Public Channels

## ticker

## orderbookl2

## trades

# Private Channels

## trading_notifications
