<h1 id='WebSocket' class='section-header'>WebSocket</h1>

<h1 id='WS-Requests' class='section-subheader'>Requests</h1>

# Subscribe

```json
{
  "type": "subscribe",
  "products": ["ETH-BTC"],
  "channels": [
  	"ticker",
  	"book",
  	{
  		"name": "trades", 
  		"products": ["ETH-BTC", "LTC-BTC"]
  	}
  ]
}
```

```json
{
  "type": "unsubscribe",
  "products": ["ETH-BTC"]
}
```

To receive WebSocket events, you must first send a `subscribe` message with the channels you wish to subscribe to.

You can subscribe to specific products by passing them in the `products` array. You can subscribe to up to 5 products at a time.

You can also specify your products on a per-channel basis by passing an object containing the channel's `name` and `products` instead of a string.

You can unsubscribe in a similar fashion, by sending an `unsubscribe` message. To unsubscribe from specific channels or products, you can pass them into `products` or `channels`. To unsubscribe entirely, simply send an unsubscribe message without any channels set.

## Channels

You can subscribe to the following channels:

### Public channels

* `ticker`
* `book`
* `trades`

### Private channels

* `orders`
* `balances`
* `deposits`

## Authenticating

```json
{
  "type": "subscribe",
  "products": ["ETH-BTC"],
  "channels": [
  	"ticker",
  	"orders",
  	{name: "balances", products: ["ETH-BTC", "LTC-BTC"]}
  ],
  "auth": {
  	"key": "8b6bcdc6-5ef8-463b-833f-3681dc2c90d3",
  	"sig": "5a1073b62e4dd62e4dd56244c89941...",
  	"timestamp": 1511027890939
  }
}
```

To receive events from private channels, you must authenticate when sending the initial `subscribe` message.

Authentication is similar to REST request signing and authentication. Pass in an `auth` field in your `subscribe` message containing:

* `key` Your API key
* `sig` The signed message for the `GET /ws-auth` request
* `timestamp` The current time in milliseconds since UNIX epoch
