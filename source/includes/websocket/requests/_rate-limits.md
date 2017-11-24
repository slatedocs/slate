# Rate limits

WebSocket `subscribe` and `unsubscribe` messages are rate limited to 1 per 5 seconds per IP.

If you're being rate-limited, you'll receive a response with type `error`.