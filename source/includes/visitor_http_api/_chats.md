Chat API
========

## Chats

### Get a collection of visitor's chats

You can get a list of all chats of the visitor.

```json
{
  "next": "https://service.giosg.com/api/v5/client/visitors/3803737880ec4dedb7eee63a860bfff2/chats?cursor=48d7ca8d5a394ff99a32720ccf7893bd",
  "previous": null,
  "results": [
    {
      "id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "token": "uibdbtmk5etolmjaduaafnqpl2ujzkyr4slkq3cabdai37qm",
      "start_time": "2015-02-13T11:31:36.042",
      "end_time": null,
      "updated_at": "2015-02-13T12:38:36.431",
      "is_autosuggested": false,
      "room_id": "9926bdfa-56e0-11e5-b98c-6c4008c08dfe",
      "message_count": 0,
      "user_message_count": 0,
      "visitor_message_count": 0,
      "currently_present_user_count": 1,
      "participation_count": 2,
      "user_participation_count": 1,
      "visitor_participation_count": 1
    }
  ]
}
```

`GET /api/v5/client/visitors/<visitor_id>/chats`

This API endpoint returns a [paginated collection][]. They are sorted by the creation time of the chats, in ascending order.

### Create a new chat with a visitor in a room

Start a new chat with a visitor in the given room.

`POST /api/v5/client/visitors/<visitor_id>/rooms/<room_id>/chats`

The visitor will automatically be added as participant of the chat by creating a [participation][chat participation] resource.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`auto_resume` | `true`/`false` | `false` | If provided, then attempt to get an existing recent chat in this room where the visitor is already a participant, instead of creating a new chat.

Returns 201 status code when a new chat was created successfully.
Returns 200 if resumed an existing chat when `auto_resume` parameter was provided.

When a new chat was successfully created, the following channels are notified with an `added` message.

- For the visitor: `/api/v5/client/visitors/<visitor_id>/chats`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats`

## Chat operator presences

A chat operator presence describes an user (a chat operator) being currently "joined" to a chat.

Attribute | Format | Editable | Description
:---------|:-------|:--------|------------
`user_id` | [ID][] | **required** | ID of the user being currently joined to the chat.
`user` | object | read-only | User being currently joined to the chat.
`chat_id` | [ID][] | **required** | ID of the chat in which the user is currently being joined.
`created_at` | [date/time][] | read-only | When this organization account was created. **Available only for your own organization.**

### Get operators that are currently present at the chat

You can get a collection of chat operator presences.

`GET /api/v5/client/visitors/<visitor_id>/chats/<chat_id>/presences`

This API endpoint returns a [paginated collection][]. They are sorted by the time on which the operators have joined the chat.

```json
{
  "next": "https://service.giosg.com/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/presences?cursor=45d9e7358e1249c491b4fa0212310f55",
  "previous": null,
  "results": [
    {
      "created_at": "2015-02-13T11:31:36.042",
      "user_id": "378ad5a0-bb89-481b-978b-4268b368cfef",
      "user": {
        /* TODO */
      }
    },
    {
      "created_at": "2015-02-13T12:14:34.154",
      "user_id": "c38e173c-c3ee-47f9-afa7-37c08e7a3b58",
      "user": {
        /* TODO */
      }
    }
  ]
}
```

## Chat participations

The visitor as well as each user who have sent at least one message to the chat is added as a "participant" to the chat. This is represented as a "participation" resource:

Attribute | Format | Editable | Description
:---------|:-------|:--------|------------
`id` | [ID][]/string | read-only | ID of the user or visitor that has participated in the chat.
`type` | string | read-only | Either `visitor` or `user`.

### Get a collection of chat participations

`GET /api/v5/client/visitors/<visitor_id>/chats/<chat_id>/participations`


## Chat messages

Chat consists of a number of messages. Some of them are actual typed messages from either operator or visitor, and some of them are automatically added events about the chat, especially when an operator has [joined or leaved][chat presence] the chat.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`id` | [ID][] | read-only | Unique identifier for the message
`type` | string | read-only | Whether the message is an actual message (`msg`), autosuggest (`autosuggest`), a join event (`join`) or a leave event (`leave`). When POSTing a message, this will automatically be set to `msg`.
`created_at` | [date/time][] | read-only | When the message was sent
`sender_type` | string | read-only | Whether the sender is operator (`user`) or visitor (`visitor`). When POSTing a new message with these endpoints, this will automatically be set to `visitor`.
`sender_id` | [ID][]/string | **required** | Identifier for the sender. If the sender is a user, then this is the user's ID. Otherwise this is an unique string for the visitor.
`sender_public_name` | string | read-only | A display name for the sender as the visitor would see him.
`message` | string | **required** | Content text of the message. The maximum length is 2000 characters.

### Get chat history

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

Get the chat history, that is, the collection of all chat messages in the given chat.

`GET /api/v5/client/visitors/<visitor_id>/chats/<chat_id>/messages`

### Send a chat message

    POST /api/v5/client/visitors/<visitor_id>/chats/4a591004-4c18-4260-bbb4-fc9f9f9a048d/messages

```json
{
  "sender_id": "45bb6c530b824ca5ac6601cfbfb8159b",
  "message": "Thank you for your help!"
}
```

Sends a new chat message with type `msg` to a chat.

`POST /api/v5/client/visitors/<visitor_id>/chats/<chat_id>/messages`

The ID of the sender must be explicitly provided. If the chat was not previously in waiting state, then `is_waiting_response` of the chat is automatically changed to `true`.

Because the `message_count` and `visitor_message_count` were increased, we notify the following channels with a `changed` message. This also includes any possible changes to `is_waiting_response`.

- For the visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats`

The following real-time channels are notified with an `added` notification:

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/messages`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/messages`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats/<chat_id>/messages`
