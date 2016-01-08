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
`is_private` | boolean | read-only | Whether or not the chat is marked as private for its operators
`is_real_conversation` | boolean | read-only | Whether or not the chat is an actual conversation
`is_autosuggested` | boolean | read-only | Whether or not the chat started with an autosuggestion
`room_id` | [ID][] | read-only | ID of the [room][] in which the chat occurred
`message_count` | integer | read-only | How many [messages][chat message] there are in total in this chat at the moment. **NOTE** that this only includes messages with type `msg`, so this does **not** include autosuggestions, or join/leave messages.
`user_message_count` | integer | read-only | How many [messages][chat message] there were by operator in this chat
`visitor_message_count` | integer | read-only | How many [messages][chat message] there were by visitor in this chat
`first_visitor_message_url` | string | read-only | Full URL of the page that the visitor was on when they sent their first message to this chat, or `null` if contains no message from the visitor.
`first_visitor_message_url_title`| string | read-only | Title of the page that the visitor was on when they sent their first message, or `null` if contains no message from the visitor.
`autosuggest_url` | string | read-only | Full URL of the page that the visitor was on when they received an autosuggest, or `null` if this chat does not contain an autosuggestion.
`autosuggest_url_title` | string | read-only | Title of the page that the visitor was on when they received an autosuggest, or `null` if this chat does not contain an autosuggestion.
`tag_count` | integer | read-only | How many tags there are associated with this chat.
`is_waiting` | boolean | read-only | This is `true` if the latest message in this chat is by the visitor, and if the chat has not ended, otherwise `false`.
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

### List chats at a room

    GET https://service.giosg.com/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/rooms/9926bdfa-56e0-11e5-b98c-6c4008c08dfe/chats

```json
{
  "next": "https://service.giosg.com/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/rooms/9926bdfa-56e0-11e5-b98c-6c4008c08dfe/chats?cursor=171cfd0d7ce542be86221f01d2823cb1",
  "previous": null,
  "results": [
    {
      "id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "token": "uibdbtmk5etolmjaduaafnqpl2ujzkyr4slkq3cabdai37qm",
      "created_at": "2015-02-13T11:31:36.042",
      "ended_at": null,
      "updated_at": "2015-02-13T12:38:36.431",
      "is_private": false,
      "is_real_conversation": false,
      "is_autosuggested": false,
      "room_id": "9926bdfa-56e0-11e5-b98c-6c4008c08dfe",
      "message_count": 0,
      "user_message_count": 0,
      "visitor_message_count": 0,
      "first_visitor_message_url": "http://www.customerpage.com/settings",
      "first_visitor_message_url_title": "Profile Settings",
      "autosuggest_url": "http://www.customerpage.com/",
      "autosuggest_url_title": "Site Frontpage",
      "tag_count": 2,
      "is_waiting": true,
      "present_member_count": 1,
      "present_user_member_count": 1,
      "present_visitor_member_count": 1,
      "member_count": 2,
      "user_member_count": 1,
      "visitor_member_count": 1
    }
  ]
}
```

You can list chats for a room:

`GET /api/v5/orgs/<organization_id>/rooms/<room_id>/chats`

This API endpoint returns a [paginated collection][]. They are sorted by the creation time of the chats, in descending order.

This endpoint takes the following GET-parameters:

Parameter    | Type    | Default | Description
-------------|---------|---------|------------
`is_waiting` | boolean | (none)  | If `true`, then return only waiting chats. If `false`, return only chats that are not waiting.
`is_ended`   | boolean | (none)  | If `true`, only return ended chats. If `false`, only return open chats.

Returns 403 if you do not have permission to the room and you are not a manager.

### List chats of a user

You can get a collection of chats that a user has been participating **or** in which the user has ever been present. Simply put, this returns the chats of the user.

`GET /api/v5/orgs/<organization_id>/users/<user_id>/chats`

This returns a [paginated collection][]. It is sorted by the creation time of the chat, in descending order.

Parameter             | Type    | Default | Description
----------------------|---------|---------|------------
`is_present`          | boolean | (none)  | If `true`, only return chats where `<user_id>` is **currently** present. If `false`, exclude thats where `<user_id>` is currently present.
`is_member`      | boolean | (none)  | If `true`, only return chats where `<user_id>` is a [chat member][]. If `false`, exclude thats where `<user_id>` is a chat member.
`is_ended`            | boolean | (none)  | If `true`, only return ended chats. If `false`, only return open chats.

When using this endpoint, the chat as the following additional attributes:

Attribute        | Type    | Editable  | Description
-----------------|---------|-----------|------------
`is_present`     | boolean | read-only | Whether or not the `<user_id>` is **currently** present at the chat
`is_member` | boolean | read-only | Whether or not the `<user_id>` is a [member of this chat][chat member]

### Create a new chat with a visitor in a room

Start a new chat with a visitor in the given room.

`POST /api/v5/orgs/<organization_id>/rooms/<room_id>/visitors/<visitor_id>/chats`

Creating a new chat using this endpoint does not require any attributes and therefore the payload is not required. However, it accepts the following get parameters:

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`auto_resume` | [ID][] | (none) | If provided, then attempt to get an existing recent chat where the given user can join, instead of creating a new chat. In addition, we will automatically (and atomically) create a [presence][chat presence] for this user and chat. **NOTE**: The “private chats” setting affects the decision whether to create or resume a chat.

Returns 201 status code when a new chat was created successfully.
Returns 200 if resumed an existing chat when `auto_resume` parameter was provided.
Returns 403 if you have no permission to the room and you are not a manager.

This notifies the [channels][] of the chat, as well as appropriate channels of [chat presences][chat presence] and [chat members][chat member].


## Chat members

The visitor as well as each user who have sent at least one message to the chat is added as a "member" to the chat.

In contrast to the [chat presences][chat presence], chat _member_ describes a person who has ever attended to the chat. They may not be currently present at the chat.

Attribute | Format | Editable | Description
:---------|:-------|:---------|------------
`id` | [ID][]/string | read-only | ID of the user or visitor being present at the chat.
`type` | string | read-only | Either `visitor` or `user`.
`name` | string | read-only | The name of the user/visitor as it would be displayed for the operator. For users this the actual name. For visitors this is any custom name, or `null`.
`public_name` | string | read-only | The name of the user/visitor as it would be displayed for the visitor. This is user's alias if they have one, otherwise it is their real name. For visitors, this is any custom username (e.g. set by API data) or `null`
`avatar` | object | read-only | If the user/visitor has an avatar image, then this is is an object with `id` and `url` attributes. Otherwise this is `null`.
`chat_id` | [ID][] | read-only | ID of the chat.
`created_at` | [date/time][] | read-only | When the user/visitor was added as a chat member.
`updated_at` | [date/time][] | read-only | When the this membership was updated.
`message_count` | integer | read-only | How many messages the user/visitor has sent to the chat. This may be 0, e.g. when operator has joined the chat but has not sent any message yet.
`is_present` | boolean | **required** | Whether or not the user/visitor is currently present at the chat.

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

### Get a collection of chat members

    GET /api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/rooms/aad26fe2-c8f3-45dc-931b-4b0b5e06467d/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/members

```json
{
  "next": "https://service.giosg.com/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/members?cursor=45d9e7358e1249c491b4fa0212310f55",
  "previous": null,
  "results": [
    {
      "id": "378ad5a0-bb89-481b-978b-4268b368cfef",
      "type": "user",
      "name": "John Smith",
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
      "name": null,
      "public_name": null,
      "avatar": null,
      "chat_id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "created_at": "2015-02-13T12:14:34.154",
      "message_count": 7
    }
  ]
}
```

You can get a [paginated collection][] of all the members of the chat:

`GET /api/v5/orgs/<organization_id>/rooms/<room_id>/chats/<chat_id>/members`

Or alternatively:

`GET /api/v5/orgs/<organization_id>/users/<user_id>/chats/<chat_id>/members`

### Join a user to a chat

> Example request for joining a user to a chat

    POST /api/v5/orgs/39351090-2f16-49e0-ae14-96c9a3a721f2/rooms/adab695d-a648-42d6-b956-19efc1124e89/chats/62eb5cd5-5d52-4bb1-b711-ba31f864e775/members

> Example request payload

```json
{
  "id": "ce771dbe-afbf-4e58-bbcb-9855ecacee9a",
  "is_present": true
}
```

You can add a user as a member to the chat by using the following endpoints.

<aside class="info">
The <code>is_present</code> attribute of both visitors and operators is automatically set to <code>false</code> if the servers have not heard about them for a while, indicating that they have closed their browser tab or they have lost their connection. However, they will not be removed from the members.
</aside>

If you are joining a user to a chat by a room, then use the following endpoint. It requires that you have a permission to the room. This can be used to join a chat that the user has not yet participated.

`POST /api/v5/orgs/<organization_id>/rooms/<room_id>/chats/<chat_id>/members`

The request object must contain the `id` attribute, which is the ID of the user being joined.

Also, by providing a `is_present` attribute with value `true` you can make the user to be currently present at the chat.

Alternatively, you may use this endpoint:

`PUT /api/v5/orgs/<organization_id>/rooms/<room_id>/chats/<chat_id>/members/<user_id>`

In this case you do not have to provide the `id` attribute.

Returns 201 if the user was added to the chat members.
Returns 200 if the user was already a chat member.
Returns 400 if the user cannot be joined to the chat or their presence cannot be updated.

<aside class="info">
If the <code>is_present</code> attribute was set to <code>true</code> and the related chat was previously in waiting state, then <code>is_waiting</code> of the chat is automatically changed to <code>false</code>.
</aside>

These endpoints accept the following URL parameters:

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`exclusive` | `true`/`false` | `false` | This has effect only, if you are setting `is_present` with value `true`. This makes the join fail with 400 if there is already **at least one other user currently present** at the chat.

<aside class="success">
Use the `exclusive` parameter to prevent multiple operators taking the chat simultaneously.
</aside>

This request sends notifications to the [channels][] of the chat presences as well as the related chat.

### Change operator chat presence

> Example request for making the operator not to be present any more at the chat

    PUT /api/v5/orgs/39351090-2f16-49e0-ae14-96c9a3a721f2/rooms/adab695d-a648-42d6-b956-19efc1124e89/chats/62eb5cd5-5d52-4bb1-b711-ba31f864e775/members/ce771dbe-afbf-4e58-bbcb-9855ecacee9a

> Example request payload

```json
{
  "is_present": false
}
```
You can make a user present or not present at a chat like described in the previous section:

`PUT /api/v5/orgs/<organization_id>/rooms/<room_id>/chats/<chat_id>/members/<user_id>`

You should provide the `is_present` attribute with either `true` or `false` value, indicating whether or not the user should be currently present at the chat.

The parameters and response codes are the same than described in the previous section.


## Chat messages

Chat consists of a number of messages. Some of them are actual typed messages from either operator or visitor, and some of them are automatically added events about the chat, especially when an operator has [joined or leaved][chat presence] the chat.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`id` | [ID][] | read-only | Unique identifier for the message
`type` | string | read-only | Whether the message is an actual message (`msg`), autosuggest (`autosuggest`), a join event (`join`) or a leave event (`leave`). When POSTing a message, this will automatically be set to `msg`.
`created_at` | [date/time][] | read-only | When the message was sent
`sender_type` | string | read-only | Whether the sender is operator (`user`) or visitor (`visitor`). When POSTing a new message with these endpoints, this will automatically be set to `user`.
`sender_id` | [ID][]/string | read-only | Identifier for the sender. If the sender is a user, then this is the user's ID. Otherwise this is an unique string for the visitor.
`sender_public_name` | string | read-only | A display name for the sender as the visitor would see him.
`sender_name` | string | read-only | A display name for the sender as an operator would see him.
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

    GET /api/v5/orgs/54de4830-a16e-417a-802b-4bf4bcb59ed8/rooms/d3b4ea93-c32c-4910-a114-c9d145e1c591/chats/450fc49e-277e-4dd6-af0f-6e9dcb885b09/messages

```json
{
  "next": "https://service.giosg.com/api/v5/orgs/54de4830-a16e-417a-802b-4bf4bcb59ed8/chats/450fc49e-277e-4dd6-af0f-6e9dcb885b09/messages?cursor=171cfd0d7ce542be86221f01d2823cb1",
  "previous": null,
  "results": [
    {
      "id": "8a94b3f1-d8a9-4530-b1f1-b757a8a57078",
      "type": "autosuggest",
      "created_at": "2015-02-13T11:30:03.045",
      "sender_type": "user",
      "sender_id": "7c94ae79-a4b4-4eea-ac23-24c16f910080",
      "sender_public_name": "Customer Service",
      "sender_name": "John Smith",
      "message": "How may I help you?"
    },
    {
      "id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "type": "msg",
      "created_at": "2015-02-13T11:31:36.042",
      "sender_type": "visitor",
      "sender_id": "f7a5a3b83d2e40dfb0dedd6c0e284214",
      "sender_public_name": null,
      "sender_name": null,
      "message": "Yes, actually you could."
    },
    {
      "id": "a3a3b8ed-7336-431a-8350-8f5be471a09e",
      "type": "join",
      "created_at": "2015-02-13T11:31:38.123",
      "sender_type": "user",
      "sender_id": "7c94ae79-a4b4-4eea-ac23-24c16f910080",
      "sender_public_name": "Customer Service",
      "sender_name": "John Smith"
    },
    {
      "id": "487a4dce-503a-43d0-bd62-1e1a7582c93b",
      "type": "msg",
      "created_at": "2015-02-13T11:32:01.654",
      "sender_type": "user",
      "sender_id": "7c94ae79-a4b4-4eea-ac23-24c16f910080",
      "sender_public_name": "Customer Service",
      "sender_name": "John Smith",
      "message": "OK, what do you want to know?"
    }
  ]
}
```

Get the collection of all chat messages in the given chat.

`GET /api/v5/orgs/<organization_id>/rooms/<room_id>/chats/<chat_id>/messages`

Or alternatively:

`GET /api/v5/orgs/<organization_id>/users/<user_id>/chats/<chat_id>/messages`

The response is a [paginated collection][], ordered by the creation date in descending order.

### Send a chat message

    POST /api/v5/orgs/b2bf5dba-055c-4ac6-a83c-7f85a1f60db9/users/7c94ae79-a4b4-4eea-ac23-24c16f910080/chats/9d25ef9d-26ed-40e8-8d74-a6a17039195d/messages

```json
{
  "message": "OK, I've found out the issue!"
}
```

Send a new chat message to a user's chat with type `msg` to a chat:

`POST /api/v5/orgs/<organization_id>/users/<user_id>/chats/<chat_id>/messages`

The `<user_id>` will be set as the sender of the message. If the sender is not yet added as a member of this chat, then a new [member][chat member] is automatically created.

<aside class="warning">
The user must be a member of the chat in order to send a message. Otherwise a 404 response is returned, as the chat was not found in the chats of the user.
</aside>

If the chat was previously in waiting state, then `is_waiting` of the chat is automatically changed to `false`.

This notifies any channels of chat messages, as well as channels of the related [chat][] and [chat members][chat member] accordingly.
