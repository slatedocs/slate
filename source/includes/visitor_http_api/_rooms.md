Rooms API
=========

## Rooms

The room resource that the visitor can access has the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`id` | [ID][] | The unique identifier of this room
`display_name` | string | Name of the room
`language_code` | string | Language of this room in ISO 639-1 code, or `null` if undefined.
`is_online` | boolean | Are there any users online in this room that the the visitor can chat with

### Retrieve room details
Get a single room object by its ID. This may be a shared room.

`GET https://service.giosg.com/api/v5/client/rooms/<room_id>`


### Channels

Any changes to rooms are notified to the following [channels][]:

Channel | Description
--------|------------
`/api/v5/client/rooms/<room_id>` | Visitors will receive updates any rooms they subscribe to through this channel

## Online users in a Room

Visitors can fetch a collection of online users in a room

Attribute | Type | Description
:---------|:-----|------------
`id` | [ID][] | Unique identifier
`public_name` | string |  The name of the user as it would be displayed for the visitor. This is user's alias if they have one, otherwise it is their real name.
`avatar` | object | The avatar of the user as an object. It contains attributes `id`and `url`. This is `null` if the user has no avatar.

### Retrieve a list of online users in a room

`GET https://service.giosg.com/api/v5/client/rooms/<room_id>/online_users`

### Channels

Any changes to rooms are notified to the following [channels][]:

Channel | Description
--------|------------
`/api/v5/client/rooms/<room_id>/online_users` | Changes to online user collection in a single room will be broadcasted to this channel
