Socket API
==========

Both users and visitors use a socket connection to receive real-time notifications about the changes. Notifications are delivered through **channels**.

Subscribing the channels is done in the following way:

**Step 1**: The client opens a connection with **message router**

```json
["sub", ["<channel_id>", "<permission_token>"], {"query": 1234567}]
```

**Step 2**: The client sends a `sub` message with an arbitrary but unique query ID for a channel they want to subscribe:

```json
["__qr__", [[]], {"query": 1234567}]
```

**Step 3**: The client receives a `__qr__` message (query response) whenever the subscription is confirmed and the client is now receiving notifications to this channel.

```json
["changed", ["<channel_id>", {
    "action": "<action_type>",
    "resource": { ... }
}]]
```

**Step 4**: The client receives a `changed` message as a notification about a changed resource.
