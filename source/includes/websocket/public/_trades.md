# Trades

## Snapshot

```json
{
	"type": "snapshot",
	"channel": "trades",
	"product": "ETH-BTC",
	"data": [
		{
			"timestamp":"1511507963627.726",
			"product":"ETH-BTC",
			"taker_order_id":"605aa534-aa09-4c9d-bef5-9d8f70c00a72",
			"maker_order_id":"9d335cce-d581-45f6-8efc-bdab3d61c6e2",
			"size":"0.10000000",
			"price":0.04,
			"side":"sell"
		},
		{
			"timestamp":"1511507893098.827",
			"product":"ETH-BTC",
			"taker_order_id":"be9f10c6-166c-4c45-bcc0-f7f34d10399b",
			"maker_order_id":"380e9304-091c-4ca7-852d-19ddf5ccc925",
			"size":"0.10000000",
			"price":0.051313,
			"side":"sell"
		}
	]
}
```

When you first subscribe to the `trades` channel, you'll receive a snapshot of the most recent trades (up to 100).

## Event

```json
{
	"event": "trade",
	"sequence": 439,
	"product": "ETH-BTC",
	"taker_order_id": "7ec97c53-75b2-4e9b-bdfa-6eca818f8c8d",
	"maker_order_id": "5d818156-fc9a-4bfe-b0e3-1ef3f3f5d799",
	"size": "11.774650",
	"price": "0.04771",
	"side": "buy",
	"timestamp": "1511434619393.320"
}
```

A `trade` event indicates that a trade occurred on the market. `side` represents the taker side: a `buy` side match is an up-tick and a `sell` side match is a down-tick.