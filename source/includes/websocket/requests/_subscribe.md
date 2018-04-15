<h1 id='WebSocket' class='section-header'>WebSocket</h1>

### Endpoint URL

`wss://data.wcex.com`

# Subscribe

```json
{
  "type": "subscribe",
  "product": "ETH-BTC",
  "channels": [
  	"ticker",
  	"book",
    "trades"
  ]
}
```

```json
{
  "type": "unsubscribe"
}
```

To receive WebSocket events, you must first send a `subscribe` message with the product and channels you wish to subscribe to.

You can unsubscribe in a similar fashion, by sending an `unsubscribe` message.

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
  "product": "ETH-BTC",
  "channels": [
  	"ticker",
  	"orders",
    "balances"
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
* `sig` The signed message for the `GET /ws-auth` request, with no body. See [Signing a Request](#signing-a-request)
* `timestamp` The current time in milliseconds since UNIX epoch
