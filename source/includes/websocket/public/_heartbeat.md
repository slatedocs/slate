# Public Events

# Heartbeat

```json
{
	"event": "heartbeat",
	"sequence": 55,
	"timestamp": 1511482279491
}
```

WCX will send a `heartbeat` event every five seconds so you'll know your WebSocket connection is active. Hearbeats also include sequence numbers which you can use to check that no messages were missed.

If you miss one or more heartbeats, or your sequence numbers contain gaps, your connection may be unreliable. We recommend that you disconnect and reconnect.