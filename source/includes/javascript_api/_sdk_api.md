<aside class="warning">
This documentation is a <strong>draft</strong>!
</aside>

Giosg SDK API
=============

Setup
-----

### Set permission token

```javascript
giosg.api.setPermissionToken(permissionJWT);
```

Set the permission token used for all the actions for the Giosg SDK. Setting a new token replaces the previous one.

Rooms
-----

### Room basic info and state

```javascript
giosg.api.rooms.streamRoom(roomId).subscribe(observer);
```

> Example room

```json
{
    "id": "8e91795e-99ef-4f9a-8d09-04995333651f",
    "display_name": "Test room",
    "is_any_operator_online": true
}
```

Endpoint/channel:

`/api/v5/client/rooms/<room_id>`

Permission to get a status for any known room:

`/api/v5/client/rooms/*`

### Collection of joined rooms

```javascript
giosg.api.rooms.streamJoinedRooms().subscribe(observer);
```

You can stream the array of room IDs to which the visitor is currently being joined.

<aside class="info">
This information is only shared between those Giosg SDK instances that are connected to the same proxy master.
</aside>

### Join a room

```javascript
giosg.api.rooms.joinRoom(roomId);
```

Joins to the given room. Performing this action while already being joined to the room has no effect.

<aside class="info">
This information is only shared between those Giosg SDK instances that are connected to the same proxy master.
</aside>

### Leave a room

```javascript
giosg.api.rooms.joinRoom(roomId);
```

Leaves from the given room. Performing this action while not being joined to the room has no effect.

<aside class="info">
This information is only shared between those Giosg SDK instances that are connected to the same proxy master.
</aside>

Visitor and operators
---------------------

### Online operators

```javascript
giosg.api.rooms.streamOnlineOperators(roomId).subscribe(observer);
```

> Example collection of online operators

```json
{
    "results": [{
        "id": "f0190b71-7ea3-4308-b4b9-48039c3e2367",
        "display_name": "John Smith",
        "avatar": {
            "id": "9fe7f863-fcf8-4102-866a-4a677d8f32a0",
            "url": "https://giosg-chat-public-eu.s3.amazonaws.com/img/customer/personnel/yrKMbV50gCedS4ilJOaqRGNFHxAz1s.png"
        }
    }]
}
```

Streams snapshots of operators that are currently online in the room. The stream emits a new snapshot of operator objects whenever they are added, removed or changed. Avatar is either an object or `null` if the operator has no avatar.

Endpoint/channel:

`/api/v5/client/rooms/<room_id>/online_operators`

Permission to get online operators for any known room:

`/api/v5/client/rooms/*/online_operators`

### Visitor's state

```javascript
giosg.api.visitor.streamMyself().subscribe(observer);
```

> Example visitor resource

```json
{
    "id": "133f73c7-08d3-4c01-86e8-aa8603e7bf37",
    "type": 1,
    "display_name": null,
    "typing_status": "idle"
}
```

Endpoint/channel:

`/api/v5/client/visitors/<visitor_id>`

Permission to get the state for one specific visitor:

`/api/v5/client/visitors/133f73c7-08d3-4c01-86e8-aa8603e7bf37`

Chats
-----

### Chats for a visitor in a room

```javascript
giosg.api.visitor.streamOwnChatsForRoom(roomId).subscribe(observer);
```

> Example collection of chats

```json
{
    "results": [{
        "id": "b5a8f915-caa7-4c62-a95a-b4f84713ce95",
        "is_visible": true,
        "is_closed": true,
        "message_count": 2,
        "visitor_message_count": 1,
        "operator_message_count": 1
    }, {
        "id": "3fee630f-304a-4621-9d2b-aadb358098e9",
        "is_visible": false,
        "is_closed": true,
        "message_count": 4,
        "visitor_message_count": 3,
        "operator_message_count": 1
    }]
}
```

Endpoint/channel:

`/api/v5/client/visitors/<visitor_id>/rooms/<room_id>/chats`

Permission to list chats for any known room for one specific visitor:

`/api/v5/client/visitors/133f73c7-08d3-4c01-86e8-aa8603e7bf37/rooms/*/chats`

### Single chat

```javascript
giosg.api.chat.streamChat(chatId).subscribe(observer);
```

> Example chat resource

```json
{
    "id": "b5a8f915-caa7-4c62-a95a-b4f84713ce95",
    "is_visible": true,
    "is_closed": true,
    "message_count": 2,
    "visitor_message_count": 1,
    "operator_message_count": 1
}
```

Endpoint/channel:

`/api/v5/client/visitors/<visitor_id>/chats/<chat_id>`

Permission to get the state of a any known chat for one specific visitor:

`/api/v5/client/visitors/133f73c7-08d3-4c01-86e8-aa8603e7bf37/chats/*`

### Chat participants

```javascript
giosg.api.chat.streamChatParticipants(chatId).subscribe(observer);
```

> Example collection of participants

```json
{
    "results": [{
        "id": "f0190b71-7ea3-4308-b4b9-48039c3e2367",
        "type": 2,
        "display_name": "John Smith",
        "typing_status": "typing"
    }, {
        "id": "133f73c7-08d3-4c01-86e8-aa8603e7bf37",
        "type": 1,
        "display_name": null,
        "typing_status": "idle"
    }, {
        "id": "a1966647-0ed7-4013-a99d-a28f69db694f",
        "type": 2,
        "display_name": "The Specialist",
        "typing_status": "typed"
    }]
}
```

You can stream arrays of chat participant objects.
Whenever a participant is added or their attributes are changed, the stream emit a new snaphost of the participant list.
Type `1` means visitor and `2` means operator.

Endpoint/channel:

`/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/participants`

Permission to get chat participants of a any known chat for one specific visitor:

`/api/v5/client/visitors/133f73c7-08d3-4c01-86e8-aa8603e7bf37/chats/*/participants`

### Chat logs

```javascript
giosg.api.chat.streamRecentChatLogs(chatId).subscribe(observer);
```

> Example collection of chat logs

```json
{
    "results": [{
        "id": "b5a8f915-caa7-4c62-a95a-b4f84713ce95",
        "type": 2,
        "message": "How may I help you?",
        "sender_type": 2,
        "sender_id": "f0190b71-7ea3-4308-b4b9-48039c3e2367",
        "sender_display_name": "John Smith"
    }, {
        "id": "3fee630f-304a-4621-9d2b-aadb358098e9",
        "type": 1,
        "message": "I should buy a boat.",
        "sender_type": 1,
        "sender_id": "133f73c7-08d3-4c01-86e8-aa8603e7bf37",
        "sender_display_name": null
    }]
}
```

You can stream arrays of chat logs in the given chat.
Each new log message makes the stream emit a new snaphost of the chat log list.

<aside class="warning">
If the chat has a relatively small amount of logs, then this always returns all the chat logs.
Only if the chat has a large amount of logs, then this only contains the latest chat logs.
</aside>

Endpoint/channel:

`/api/v5/client/visitors/133f73c7-08d3-4c01-86e8-aa8603e7bf37/chats/<chat_id>/logs`

Permission to get chat logs of a any known chat for one specific visitor:

`/api/v5/client/visitors/133f73c7-08d3-4c01-86e8-aa8603e7bf37/chats/*/logs`
