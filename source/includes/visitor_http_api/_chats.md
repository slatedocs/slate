Chat API
========

## Chats

A chat represents a single conversation. In practice, there is exactly one visitor member and an arbitrary number of user ("operator") members.

A chat has the following attributes:

Attribute | Type | Editable | Description
----------|------|----------|------------
`id` | [ID][] | read-only | Unique identifier for the chat
`token` | string | read-only | A legacy Giosg-signed encoded unique string for the chat
`created_at` | [date/time][] | read-only | When the chat conversation started
`ended_at` | [date/time][] | read-only | When the chat conversation ended (or `null` if not yet ended)
`updated_at` | [date/time][] | read-only | When the chat conversation was last time updated
`is_autosuggested` | boolean | read-only | Whether or not the chat started with an autosuggestion
`room_id` | [ID][] | read-only | ID of the [room][] in which the chat occurred
`message_count` | integer | read-only | How many [messages][chat message] there are in total in this chat at the moment. **NOTE** that this only includes messages with type `msg`, so this does **not** include autosuggestions, or join/leave messages.
`user_message_count` | integer | read-only | How many [messages][chat message] there were by operator in this chat
`visitor_message_count` | integer | read-only | How many [messages][chat message] there were by visitor in this chat
`present_member_count` | integer | read-only | How many people (visitor and users) there are currently present at this chat.
`present_user_member_count` | integer | read-only | How many users there are currently present at this chat.
`present_visitor_member_count` | integer | read-only | How many visitor there are currently present at this chat (0 or 1)
`member_count` | integer | read-only | How many people (visitor and users) have attended or sent messages to this chat.
`user_member_count` | integer | read-only | How many users have sent at least one message to the chat.
`visitor_member_count` | integer | read-only | How many visitors have attended this chat.

Any changes to chats are notified to the following [channels][]:

Channel | Description
--------|------------
`/api/v5/client/visitors/<visitor_id>/chats` | For each visitor of the chat
`/api/v5/orgs/<organization_id>/users/<user_id>/chats` | For each member and currently present user of the chat
`/api/v5/orgs/<organization_id>/rooms/<room_id>/chats` | For the chat parent room chat collection and each organization having access to that room

### List visitor's chats

You can get a list of all chats of the visitor.

    GET https://service.giosg.com/api/v5/client/visitors/3803737880ec4dedb7eee63a860bfff2/chats

```json
{
  "next": "https://service.giosg.com/api/v5/client/visitors/3803737880ec4dedb7eee63a860bfff2/chats?cursor=48d7ca8d5a394ff99a32720ccf7893bd",
  "previous": null,
  "results": [
    {
      "id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "token": "uibdbtmk5etolmjaduaafnqpl2ujzkyr4slkq3cabdai37qm",
      "created_at": "2015-02-13T11:31:36.042",
      "ended_at": null,
      "updated_at": "2015-02-13T12:38:36.431",
      "is_autosuggested": false,
      "room_id": "9926bdfa-56e0-11e5-b98c-6c4008c08dfe",
      "message_count": 0,
      "user_message_count": 0,
      "visitor_message_count": 0,
      "present_member_count": 2,
      "present_user_member_count": 1,
      "present_visitor_member_count": 1,
      "member_count": 2,
      "user_member_count": 1,
      "visitor_member_count": 1
    }
  ]
}
```

`GET /api/v5/client/visitors/<visitor_id>/chats`

This API endpoint returns a [paginated collection][]. They are sorted by the creation time of the chats, in ascending order.

### Create a new chat

Start a new chat with a visitor in the given room.

`POST /api/v5/client/visitors/<visitor_id>/rooms/<room_id>/chats`

The visitor will automatically be added as member of the chat by creating a [member][chat member] resource.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`auto_resume` | `true`/`false` | `false` | If provided, then attempt to get an existing recent chat in this room where the visitor is already a member, instead of creating a new chat.

Returns 201 status code when a new chat was created successfully.
Returns 200 if resumed an existing chat when `auto_resume` parameter was provided.

When a new chat was successfully created, the following channels are notified with an `added` message.

- For the visitor: `/api/v5/client/visitors/<visitor_id>/chats`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<organization_id>/rooms/<room_id>/chats`


## Chat members

The visitor and each user who has participated to a chat is added as a chat member to the chat.

Attribute | Format | Editable | Description
:---------|:-------|:---------|------------
`id` | [ID][]/string | read-only | ID of the user or visitor being present at the chat.
`type` | string | read-only | Either `visitor` or `user`.
`public_name` | string | read-only | The name of the user/visitor as it would be displayed for the visitor. This is user's alias if they have one, otherwise it is their real name. For visitors, this is any custom username (e.g. set by API data) or `null`
`avatar` | object | read-only | If the user/visitor has an avatar image, then this is is an object with `id` and `url` attributes. Otherwise this is `null`.
`chat_id` | [ID][] | read-only | ID of the chat.
`created_at` | [date/time][] | read-only | When the user/visitor was added as a chat member.
`message_count` | integer | read-only | How many messages the user/visitor has sent to the chat. This may be 0, e.g. when operator has joined the chat but has not sent any message yet.
`is_present` | boolean | read-only | Whether or not the user/visitor is currently present at the chat.

Changes to chat members are notified to the following [channels][]:

Channels    | Description
------------|---------------
`/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/members` | For each visitor of the chat
`/api/v5/orgs/<organization_id>/users/<user_id>/chats/<chat_id>/members` | For each user member of the chat
`/api/v5/orgs/<organization_id>/rooms/<room_id>/chats/<chat_id>/members` | For the related room and each organization having access to that room

In addition, chat members affect the following attributes of a [chat][], notifying its channels:

- `member_count`
- `user_member_count`
- `visitor_member_count`
- `present_member_count`
- `present_user_member_count`
- `present_visitor_member_count`

### List chat members

    GET https://service.giosg.com/api/v5/client/visitors/3b90ef7c93484af4965a79ace7bc9a62/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/members

```json
{
  "next": "https://service.giosg.com/api/v5/client/visitors/3b90ef7c93484af4965a79ace7bc9a62/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/members?cursor=45d9e7358e1249c491b4fa0212310f55",
  "previous": null,
  "results": [
    {
      "id": "378ad5a0-bb89-481b-978b-4268b368cfef",
      "type": "user",
      "public_name": "Customer Service",
      "avatar": {
        "id": "7f9cb877-0fd9-4c27-90b0-bd4c2842da3d",
        "url": "http://www.example.com/avatar/5ef1a0ef-8b61-4473-8706-9669e30b47e6.jpg"
      },
      "chat_id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "created_at": "2015-02-13T11:31:36.042",
      "message_count": 8
    },
    {
      "id": "3b90ef7c93484af4965a79ace7bc9a62",
      "type": "visitor",
      "public_name": null,
      "avatar": null,
      "chat_id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "created_at": "2015-02-13T12:14:34.154",
      "message_count": 7
    }
  ]
}
```

You may get a [paginated collection][] of all members of a chat.

`GET /api/v5/client/visitors/<visitor_id>/chats/<chat_id>/members`

Returns 404 if the chat is not one of the visitor's chats.


## Chat messages

Chat consists of a number of messages. Some of them are actual typed messages from either operator or visitor, and some of them are automatically added events about the chat, especially when an operator has joined or leaved the chat.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`id` | [ID][] | read-only | Unique identifier for the message
`type` | string | read-only | Whether the message is an actual message (`msg`), autosuggest (`autosuggest`), a join event (`join`) or a leave event (`leave`). When POSTing a message, this will automatically be set to `msg`.
`created_at` | [date/time][] | read-only | When the message was sent
`sender_type` | string | read-only | Whether the sender is operator (`user`) or visitor (`visitor`). When POSTing a new message with these endpoints, this will automatically be set to `user`.
`sender_id` | [ID][]/string | read-only | Identifier for the sender. If the sender is a user, then this is the user's ID. Otherwise this is an unique string for the visitor.
`sender_public_name` | string | read-only | A display name for the sender as the visitor would see him.
`sender_avatar` | object | read-only | If the sender has an avatar image, then this is an object with `id` and `url` attributes. Otherwise this is `null`.
`message` | string | **required** | Content text of the message. The maximum length is 2000 characters.

Any changes to chat messages are notified to the following [channels][]:

Channel | Description
--------|------------
`/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/messages` | For each visitor of the chat
`/api/v5/orgs/<organization_id>/users/<user_id>/chats/<chat_id>/messages` | For each member and currently present user of the chat
`/api/v5/orgs/<organization_id>/rooms/<room_id>/chats/<chat_id>/messages` | For the chat parent room chat collection and each organization having access to that room

In addition, sending chat messages affect the following attributes of a [chat][], which notifies the channels of the chat.

- `message_count`
- `user_message_count`
- `visitor_message_count`
- `is_waiting`

In addition, sending chat messages affect the following attributes of a [chat member][], notifying its related channels.

- `message_count`

### List chat messages

    GET https://service.giosg.com/api/v5/client/visitors/f7a5a3b83d2e40dfb0dedd6c0e284214/chats/450fc49e-277e-4dd6-af0f-6e9dcb885b09/messages

```json
{
  "next": "https://service.giosg.com/api/v5/client/visitors/f7a5a3b83d2e40dfb0dedd6c0e284214/chats/450fc49e-277e-4dd6-af0f-6e9dcb885b09/messages?cursor=171cfd0d7ce542be86221f01d2823cb1",
  "previous": null,
  "results": [
    {
      "id": "8a94b3f1-d8a9-4530-b1f1-b757a8a57078",
      "type": "autosuggest",
      "created_at": "2015-02-13T11:30:03.045",
      "sender_type": "user",
      "sender_id": "7c94ae79-a4b4-4eea-ac23-24c16f910080",
      "sender_public_name": "Customer Service",
      "message": "How may I help you?"
    },
    {
      "id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "type": "msg",
      "created_at": "2015-02-13T11:31:36.042",
      "sender_type": "visitor",
      "sender_id": "f7a5a3b83d2e40dfb0dedd6c0e284214",
      "sender_public_name": null,
      "message": "Yes, actually you could."
    },
    {
      "id": "a3a3b8ed-7336-431a-8350-8f5be471a09e",
      "type": "join",
      "created_at": "2015-02-13T11:31:38.123",
      "sender_type": "user",
      "sender_id": "7c94ae79-a4b4-4eea-ac23-24c16f910080",
      "sender_public_name": "Customer Service"
    },
    {
      "id": "487a4dce-503a-43d0-bd62-1e1a7582c93b",
      "type": "msg",
      "created_at": "2015-02-13T11:32:01.654",
      "sender_type": "user",
      "sender_id": "7c94ae79-a4b4-4eea-ac23-24c16f910080",
      "sender_public_name": "Customer Service",
      "message": "OK, what do you want to know?"
    }
  ]
}
```

Get the collection of all chat messages in the given chat.

`GET /api/v5/client/visitors/<visitor_id>/chats/<chat_id>/messages`

### Send a chat message

    POST https://service.giosg.com/api/v5/client/visitors/be82243cf82540c49a629543022a3de2/chats/4a591004-4c18-4260-bbb4-fc9f9f9a048d/messages

> Example request payload

```json
{
  "message": "Thank you for your help!"
}
```

Send a new chat message with type `msg` to a chat.

`POST /api/v5/client/visitors/<visitor_id>/chats/<chat_id>/messages`

Returns 404 if the chat is not one of the visitor's chats.

The `sender_type` is automatically set to `visitor` and `sender_id` is set to `<visitod_id>`.

If this is the first message with type `msg` in the chat, then its `is_waiting` attribute is automatically set to `true`. (This only affects the authenticated users)
