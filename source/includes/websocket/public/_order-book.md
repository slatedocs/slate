# Book

## Snapshot

```json
{
	"type": "snapshot",
	"channel": "book",
	"product": "ETH-BTC",
	"data": {
		"bids": [
			["0.04", "4.90000000", 1],
			["0.039465", "4.24022501", 1],
			["0.039462", "0.81290040", 1],
			["0.039375", "1.99379837", 1]
		],
		"asks": [
			["0.05132", "9.22057678", 1],
			["0.051323", "3.52460275", 1],
			["0.051885", "0.23329705", 1],
			["0.053011", "1.88536196", 1]
		]
	}
}
```

When you first subscribe to the `book` channel, you'll receive a snapshot of the order book containing up to 100 bids and 100 asks.

## Event

```json
{
	"event": "book",
	"sequence": 991,
	"product": "ETH-BTC",
	"updates": [
		["0.04771", "1.44543", 1, 0],
		["0.05892", "2.99112", 2, 1],
	]
}
```

A `book` event provides real-time order book updates. It contains an `updates` array that contains arrays representing price level deltas.

Each delta array contains:

* price
* size
* order count at this level. '0' means the price level was removed
* bid (0) or ask (1)

This event is batched and sent every 500 milliseconds at most.