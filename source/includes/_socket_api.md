Socket API
==========

Both users and visitors use a socket connection to receive real-time notifications about the changes. Notifications are delivered through **channels**.

Subscribing the channels is done in the following way:

**Step 1**: The client opens a connection with **message router**

```json
["sub", ["<channel_id>", "<permission_token>"], {"query": 1234567}]
```

**Step 2**: The client sends a `sub` message with an arbitrary but unique query ID for a channel they want to subscribe.

The `<channel_id>` must be the ID of the channel being subscribed. The channel ID matches the URL path of the API endpoint where the resource or resource collection would be retrieved. For example: `/api/v5/client/visitors/e725acaa886f414986257bfe98d4db1c/chats` or `/api/v5/orgs/dc5e32c1-54d2-4010-8c04-8b66e565698e/rooms/3f7f6058-af90-4499-b769-9bb348af5736`.

The `<permission_token>` must be a JWT token string. If the token is valid and it grants the permission to the requested channel, then the subscription will be accepted.

<aside class="warning">
If the connection is ever closed and then re-opened, the client needs to re-send the <code>sub</code> messages for every channel they still want to subscribe!
</aside>

```json
["__qr__", [[]], {"query": 1234567}]
```

**Step 3**: The client receives a `__qr__` message (query response) whenever the subscription is confirmed. The response message contains the same `query` identifier. The client is now receiving notifications to this channel.

If the `<permission_token>` was not valid or it did not grant access to the channel, then the object also contains `fail` attribute with value `true`.

```json
["changed", ["<channel_id>", {
    "action": "<action_type>",
    "resourceId": "f39b84ae-c54c-4de3-a096-9ecde4f07f34",
    "resource": {
        "id": "f39b84ae-c54c-4de3-a096-9ecde4f07f34",
        "name": "Resource Name",
        "created_at": "2015-08-31T16:32:17.879Z"
    }
}]]
```

**Step 4**: The client receives a `changed` message as a notification about an added, removed or changed resource.

There are three possible values for the `action`:

Action    | Description
----------|------------
`added`   | A new resource has been added to the collection the channel represents. The `resource` field contains the full resource object.
`changed` | Attributes of a resource have changed. The `resourceId` attribute describes which resource was changed (see below). The `resource` field contains **only the changed attributes** of the resource.
`removed` | A resource has been removed from the collection the channel represents. The `resourceId` attribute describes which resource was removed (see below).

When the channel represents a collection of resources, the `resourceId` attribute describes which existing resource was altered. In most cases, the `resourceId` matches the value of the resource's `id` attribute. However, in some cases the identity attribute may have some other name, so it is client's responsibility to assign the changes to the correct resource.
