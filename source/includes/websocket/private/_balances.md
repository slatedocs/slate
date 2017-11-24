# Balance Events

You receive the events below when you're subscribed to the private `balances` channel.

## Balance Update

```json
{
	"event": "balance",
	"updates": [
		{
			"asset": "ETH",
			"available": "377.9934",
			"total": "9939.122"
		},
		{
			"asset": "BTC",
			"available": "18.1221",
			"total": "55.991"
		}
	]
}
```

A `balance` event is sent whenever one or more of your balances changes.

The `total` balance value will appear only if it has changed.