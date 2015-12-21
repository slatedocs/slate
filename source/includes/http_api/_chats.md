Chat API
========

Chats
-----

A chat represents a single conversation. In practice, there is exactly one visitor participant and an arbitrary number of user ("operator") participants.

A chat has the following attributes:

Attribute | Type | Editable | Description
----------|------|----------|------------
`id` | [ID][] | read-only | Unique identifier for the chat
`token` | string | read-only | A legacy Giosg-signed encoded unique string for the chat
`created_at` | [date/time][] | read-only | When the chat conversation started
`ended_at` | [date/time][] | read-only | When the chat conversation ended (or `null` if not yet ended)
`updated_at` | [date/time][] | When the chat conversation was last time updated
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
`is_waiting_response` | boolean | read-only | This is `true` if the latest message in this chat is by the visitor, and if the chat has not ended, otherwise `false`.
`presence_count` | integer | read-only | How many people (visitor and users) there are currently present at this chat.
`user_presence_count` | integer | read-only | How many users there are currently present at this chat.
`visitor_presence_count` | integer | read-only | How many visitor there are currently present at this chat (0 or 1)
`participant_count` | integer | read-only | How many people (visitor and users) have attended or sent messages to this chat.
`user_participant_count` | integer | read-only | How many users have sent at least one message to the chat.
`visitor_participant_count` | integer | read-only | How many visitors have attended this chat. In practice, this always `1`, but this attribute exists for future.

Any changes to chats are notified to the following [channels][]:

Channel | Description
--------|------------
`/api/v5/client/visitors/<visitor_id>/chats` | For each visitor of the chat
`/api/v5/orgs/<org_id>/users/<user_id>/chats` | For each participant and currently present user of the chat
`/api/v5/orgs/<org_id>/rooms/<room_id>/chats` | For the chat parent room chat collection and each organization having access to that room

### List chats at a room

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
      "is_waiting_response": true,
      "presence_count": 1,
      "user_presence_count": 1,
      "visitor_presence_count": 1,
      "participant_count": 2,
      "user_participant_count": 1,
      "visitor_participant_count": 1
    }
  ]
}
```

You can list chats for a room:

`GET /api/v5/orgs/<org_id>/rooms/<room_id>/chats`

This API endpoint returns a [paginated collection][]. They are sorted by the creation time of the chats, in descending order.

This endpoint takes the following GET-parameters:

Parameter             | Type    | Default | Description
----------------------|---------|---------|------------
`is_waiting_response` | boolean | (none)  | If `true`, then return only waiting chats. If `false`, return only chats that are not waiting.
`is_ended`            | boolean | (none)  | If `true`, only return ended chats. If `false`, only return open chats.

Returns 403 if you do not have permission to the room and you are not a manager.

### List chats of a user

You can get a collection of chats that a user has been participating **or** in which the user is currently present. If you need specifically either one of these then you can use the GET parameters described below.

`GET /api/v5/orgs/<org_id>/users/<user_id>/chats`

This returns a [paginated collection][]. It is sorted by the creation time of the chat, in descending order.

Parameter             | Type    | Default | Description
----------------------|---------|---------|------------
`is_present`          | boolean | (none)  | If `true`, only return chats where `<user_id>` currently has a [chat presence][]. If `false`, exclude thats where `<user_id>` currently has a chat presence.
`is_participant`      | boolean | (none)  | If `true`, only return chats where `<user_id>` is a [chat participant][]. If `false`, exclude thats where `<user_id>` is a chat participant.
`is_ended`            | boolean | (none)  | If `true`, only return ended chats. If `false`, only return open chats.

When using this endpoint, the chat as the following additional attributes:

Attribute        | Type    | Editable  | Description
-----------------|---------|-----------|------------
`is_present`     | boolean | read-only | Whether or not the `<user_id>` currently has a [chat presence][] at this chat
`is_participant` | boolean | read-only | Whether or not the `<user_id>` is a [participant of this chat][chat participant]

### Create a new chat with a visitor in a room

Start a new chat with a visitor in the given room.

`POST /api/v5/orgs/<org_id>/rooms/<room_id>/visitors/<visitor_id>/chats`

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`auto_resume` | [ID][] | (none) | If provided, then attempt to get an existing recent chat where the given user can join, instead of creating a new chat. In addition, we will automatically (and atomically) create a [presence][chat presence] for this user and chat. **NOTE**: The “private chats” setting affects the decision whether to create or resume a chat.

Returns 201 status code when a new chat was created successfully.
Returns 200 if resumed an existing chat when `auto_resume` parameter was provided.
Returns 403 if you have no permission to the room and you are not a manager.

This notifies the [channels][] of the chat, as well as appropriate channels of [chat presences][chat presence] and [chat participants][chat participant].

Chat presences
--------------

A chat presence describes either a user (a chat operator) or a visitor being currently "joined" to a chat. In case of visitors, the presence is equal to the online status of the visitor in the related room. Users on the other hands need explicitly to "join" the chat.

Both visitors' and operators' presences are automatically removed from a chat presences if we have not heard about them for a while, indicating that they have closed their browser tab or they have lost their web connection.

Attribute | Format | Editable | Description
:---------|:-------|:--------|------------
`id`      | [ID][]/string | **required** | The ID of the user or the identifier string for the visitor currently joined to the chat.
`type`    | string | read-only | Either `user` or `visitor`
`name`    | string | read-only | The name of the user/visitor as it would be displayed for the operator. Either the actual name of the user, or any custom name given to the visitor. Otherwise `null`
`public_name` | string | read-only | The name of the user/visitor as it would be displayed for the visitor. Either the user's alias, or any custom username of the visitor (e.g. set by API data)
`avatar` | object | read-only | If the user/visitor has an avatar image, then this is is an object with `id` and `url` attributes. Otherwise this is `null`.
`chat_id` | [ID][] | **required** | ID of the chat being joined.
`created_at` | [date/time][] | read-only | When the user/visitor become present in the chat.

Changes to chat presences are notified to the following [channels][]:

Channels    | Description
------------|---------------
`/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/presences` | For each visitor of the chat
`/api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/presences` | For each participant and currently present user of the chat
`/api/v5/orgs/<org_id>/rooms/<room_id>/chats/<chat_id>/presences` | For the related room and each organization having access to that room

In addition, chat presences affect the following attributes of a [chat][], notifying the channels of the related chat:

- `presence_count`
- `user_presence_count`
- `visitor_presence_count`

### Get currently present people at the chat

    GET /api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/presences

```json
{
  "next": "https://service.giosg.com/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/presences?cursor=45d9e7358e1249c491b4fa0212310f55",
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
      "created_at": "2015-02-13T11:31:36.042"
    },
    {
      "id": "3b90ef7c93484af4965a79ace7bc9a62",
      "type": "visitor",
      "name": null,
      "public_name": null,
      "avatar": null,
      "chat_id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "created_at": "2015-02-13T12:14:34.154"
    }
  ]
}
```

You can get a collection of current chat presences:

`GET /api/v5/orgs/<org_id>/chats/<chat_id>/presences`

This API endpoint returns a [paginated collection][]. They are sorted by the time on which the people have joined the chat.

### Join operator to a chat

> Example request for joining the operator to a chat

    POST /api/v5/orgs/39351090-2f16-49e0-ae14-96c9a3a721f2/chats/62eb5cd5-5d52-4bb1-b711-ba31f864e775/presences

```json
{
  "id": "ce771dbe-afbf-4e58-bbcb-9855ecacee9a"
}
```

You can adds a user to the list of currently present people of the chat. Operator will be automatically removed from the joined operators if the operator has not been reached for a while, or by making a leave API request.

`POST /api/v5/orgs/<org_id>/chats/<chat_id>/presences`

The request object must contain the `id` attribute, which is the ID of the user being joined.

You may alternatively make the following request, in which case the payload is not required:

`PUT /api/v5/orgs/<org_id>/chats/<chat_id>/presences/<user_id>`

This endpoint accepts the following GET parameters:

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`exclusive` | `true`/`false` | `false` | The exclusive parameter makes the join fail with 400 if there is already at least one other user joined the chat. This prevents multiple operators taking the chat. It does not matter if there is a visitor or not.

Returns 201 if the user was added to the joined operators of the chat.
Returns 200 if the user is already joined to the chat.
Returns 400 if the user ID is invalid or the user cannot be joined to the chat.

This request sends notifications to the [channels][] of the chat presences as well as the related chat.

### Leave from a chat

Removes the operator from the list of currently present operators of the chat.

`DELETE /api/v5/orgs/<org_id>/chats/<chat_id>/presences/<user_id>`

This request sends notifications to the [channels][] of the chat presences as well as the related chat.


Chat participants
-------------------

The visitor as well as each user who have sent at least one message to the chat is added as a "participant" to the chat.

In contrast to the [chat presences][chat presence], chat _participant_ describes a person who has ever attended to the chat. They may not be currently present at the chat.

A chat participant has the following attributes:

Attribute | Format | Editable | Description
:---------|:-------|:--------|------------
`id` | [ID][]/string | read-only | ID of the user or visitor that has participated in the chat.
`type` | string | read-only | Either `visitor` or `user`.
`name`    | string | read-only | The name of the user/visitor as it would be displayed for the operator. Either the actual name of the user, or any custom name given to the visitor. Otherwise `null`
`public_name` | string | read-only | The name of the user/visitor as it would be displayed for the visitor. Either the user's alias, or any custom username of the visitor (e.g. set by API data)
`avatar` | object | read-only | If the user/visitor has an avatar image, then this is is an object with `id` and `url` attributes. Otherwise this is `null`.
`chat_id` | [ID][] | **required** | ID of the chat being joined.
`created_at` | [date/time][] | read-only | When the user/visitor become present in the chat.


### Get a collection of chat participants

    GET /api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/participants

```json
{
  "next": "https://service.giosg.com/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/chats/58f5055c-56e0-11e5-9354-6c4008c08dfe/participants?cursor=45d9e7358e1249c491b4fa0212310f55",
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
      "created_at": "2015-02-13T11:31:36.042"
    },
    {
      "id": "3b90ef7c93484af4965a79ace7bc9a62",
      "type": "visitor",
      "name": null,
      "public_name": null,
      "avatar": null,
      "chat_id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "created_at": "2015-02-13T12:14:34.154"
    }
  ]
}
```

You can get a [paginated collection][] of all the participants of the chat:

`GET /api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/participants`


## Chat messages

Chat consists of a number of messages. Some of them are actual typed messages from either operator or visitor, and some of them are automatically added events about the chat, especially when an operator has [joined or leaved][chat presence] the chat.

Attribute | Type | Editable | Description
:---------|:-----|----------|------------
`id` | [ID][] | read-only | Unique identifier for the message
`type` | string | read-only | Whether the message is an actual message (`msg`), autosuggest (`autosuggest`), a join event (`join`) or a leave event (`leave`). When POSTing a message, this will automatically be set to `msg`.
`created_at` | [date/time][] | read-only | When the message was sent
`sender_type` | string | read-only | Whether the sender is operator (`user`) or visitor (`visitor`). When POSTing a new message with these endpoints, this will automatically be set to `user`.
`sender_id` | [ID][]/string | **required** | Identifier for the sender. If the sender is a user, then this is the user's ID. Otherwise this is an unique string for the visitor.
`sender_public_name` | string | read-only | A display name for the sender as the visitor would see him.
`sender_name` | string | read-only | A display name for the sender as an operator would see him.
`sender_avatar` | object | read-only | If the sender has an avatar image, then this is an object with `id` and `url` attributes. Otherwise this is `null`.
`message` | string | **required** | Content text of the message. The maximum length is 2000 characters.

Any changes to chat messages are notified to the following [channels][]:

Channel | Description
--------|------------
`/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/messages` | For each visitor of the chat
`/api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/messages` | For each participant and currently present user of the chat
`/api/v5/orgs/<org_id>/rooms/<room_id>/chats/<chat_id>/messages` | For the chat parent room chat collection and each organization having access to that room

In addition, sending chat messages affect the following attributes of a [chat][], which notifies the channels of the chat.

- `message_count`
- `user_message_count`
- `visitor_message_count`
- `is_waiting_response`


### Get chat history

    GET /api/v5/orgs/54de4830-a16e-417a-802b-4bf4bcb59ed8/chats/450fc49e-277e-4dd6-af0f-6e9dcb885b09/messages

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

Get the chat history, that is, the collection of all chat messages in the given chat.

`GET /api/v5/orgs/<org_id>/chats/<chat_id>/messages`

The response is a [paginated collection][], ordered by the creation date in descending order.

### Send a chat message

    POST /api/v5/orgs/b2bf5dba-055c-4ac6-a83c-7f85a1f60db9/chats/4a591004-4c18-4260-bbb4-fc9f9f9a048d/messages

```json
{
  "sender_id": "7c94ae79-a4b4-4eea-ac23-24c16f910080",
  "message": "OK, I've found out the issue!"
}
```

Send a new chat message with type `msg` to a chat:

`POST /api/v5/orgs/<org_id>/chats/<chat_id>/messages`

The ID of the sender must be explicitly provided. This is usually equal to the user who is authenticated. If the sender is not yet added as a participant of this chat, then a new [participant][chat participant] is automatically created.

If the chat was previously in waiting state, then `is_waiting_response` of the chat is automatically changed to `false`.

This notifies any channels of chat messages, as well as channels of the related [chat][] and [chat participants][chat participant] accordingly.




## Get a collection of chats on organization

<aside class="warning">
  The following is <strong>work in progress!!!</strong>
</aside>

You can get a list of your organization's chats by making a GET request.

`GET https://service.giosg.com/api/v5/orgs/<organization_id>/chats`

By default, the API returns all the available chats paginated, sorted by ascending ID order. You may want to filter the chats or change the order or pagination parameters by providing GET parameters in the URL. Remember to URL-encode any parameter values.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`ordering` | [ordering][] | `created_at` | Order results by either `created_at` or `ended_at`.
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 25 | [Page size][paginated collection] for the pages, with max value of 100
`since_id` | [ID][] | | Only return chats after the chat with this ID (exclusive)
`created_at` | [date/time][] | | Only return chats started after this moment (inclusive)
`ended_at` | [date/time][] | | Only return chats ended before this moment (exclusive)
`has_sales` | true/false | | If `true`/`false`, only return chats with/without sales
`is_real_conversation` | true/false | | If `true`/`false`, only return real/non-real chats
`room_id` | [ID][] | | Only chats on the [room][] with this ID.
`tag` | string | | Only chats that have this tag added to them by an operator.
`min_message_count` | integer | | Only chats with at least this number of messages.
`only_ended` | true/none | | If `true`, only include chats that have been ended

```json
{
  "count": 57,
  "num_pages": 3,
  "per_page": 25,
  "current_page": 1,
  "next_page": 2,
  "previous_page": null,
  "next_page_url": "https://service.giosg.com/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/chats?page=2",
  "previous_page_url": null,
  "results": [
    {
      "id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "token": "uibdbtmk5etolmjaduaafnqpl2ujzkyr4slkq3cabdai37qm",
      "created_at": "2015-02-13T11:31:36.042",
      "ended_at": "2015-02-13T12:38:36.424",
      "updated_at": "2015-02-13T12:38:36.431",
      "is_private": false,
      "is_real_conversation": false,
      "is_autosuggested": false,
      "room_id": "9926bdfa-56e0-11e5-b98c-6c4008c08dfe",
      "api_data": [
        {
          "name": "name",
          "value": "Milan Indrajit"
        },
        {
          "name": "customer_number",
          "value": "12345678"
        }
      ],
      "user_message_count": 0,
      "visitor_message_count": 0,
      "message_count": 0,
      "start_url": "http://www.customerpage.com/settings",
      "start_url_title": "Settings page",
      "autosuggest_url": "http://www.customerpage.com/",
      "autosuggest_url_title": "Frontpage of our site",
      "logs": [
        {
          "created_at": "2015-01-15T13:43:28.572",
          "type": 2,
          "sender_type": 1,
          "sender_id": "1",
          "message": "How may I help you?",
          "display_name": "John Doe"
        },
        {
          "created_at": "2015-01-15T13:43:23.655",
          "type": 1,
          "sender_type": 2,
          "sender_id": "429569b04f31f1f507236ea7359b50cf",
          "message": "Could you tell me about whether this product is in stock?",
          "display_name": "Milan Indrajit"
        }
      ],
      "tags": [
        {
          "name": "Premium"
        }
      ],
      "shopping_carts": [
        {
          "id": "ca0a324f-56e0-11e5-8d07-6c4008c08dfe",
          "opened_at": "2015-02-13T08:23:57.331",
          "total_price": "83.00",
          "monthly_total_price": "360.00",
          "currency": "EUR",
          "locked_at": "2015-02-13T08:24:57.588",
          "products": [
            {
              "id": "db66a978-56e0-11e5-878d-6c4008c08dfe",
              "name": "Apple iPad Air 2",
              "description": "Work and play faster, thinner, and lighter with the iPad Air 2 from Apple. Featuring Apple's 64-bit A8X chip and M8 coprocessor, the Air 2 delivers 40% faster CPU performance and 2.5 times the graphics performance when compared to its predecessor.",
              "category": "Chat",
              "product_number": "12345",
              "price": "499.90",
              "quantity": 1,
              "monthly_price": null,
              "monthly_quantity": null,
              "stock_balance": 123,
              "added_at": "2015-02-13T08:23:57.341",
              "deleted_at": null
            }
          ]
        }
      ]
    }
  ]
}
```

This API end-point returns a [paginated collection][] of chat objects, having the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`id` | [ID][] | Unique identifier for this chat
`token` | string | Encoded Giosg token for the chat itself
`created_at` | [date/time][] | When the chat conversation started
`ended_at` | [date/time][] | When the chat conversation ended (or `null` if not yet ended)
`updated_at` | [date/time][] | When the chat conversation was last time updated
`is_private` | boolean | Whether or not the chat is marked as private for its operators
`is_real_conversation` | boolean | Whether or not the chat is an actual conversation
`is_autosuggested` | boolean | Whether or not the chat started with an autosuggestion
`room_id` | [ID][] | ID of the [room][] in which the chat occurred
`api_data` | array of objects | A list of any data that has been submitted for the visitor with APIs. Each object has the attributes `name` and `value`.
`user_message_count` | integer | How many messages there were by operator in this chat
`visitor_message_count` | integer | How many messages there were by visitor in this chat
`message_count` | integer | How many messages there were in total in this chat
`start_url` | string | Full URL of the page that the visitor was on when they sent their first message
`start_url_title`| string | Title of the page that the visitor was on when they sent their first message
`autosuggest_url` | string | Full URL of the page that the visitor was on when they received an autosuggest
`autosuggest_url_title` | string | Title of the page that the visitor was on when they received an autosuggest
`logs` | array of objects | All the chat messages in this chat, see below.
`tags` | array of objects | All the tags added by operators to the chat. Each tag object has the attribute `name`.
`shopping_carts` | array of objects | All the shopping carts of the visitor, related to this chat, see below.

Every nested **chat log** object has the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`created_at` | [date/time][] | When the message was sent
`sender_type` | integer | Whether the sender is operator (`1`) or visitor (`2`)
`sender_id` | [ID][]/string | Identifier for the sender. If the sender is an operator, then this is the user's ID. Otherwise this is an unique string for the visitor.
`type` | integer | Whether the message is an actual message (`1`) or autosuggest (`2`)
`message` | string | Content text of the message
`display_name` | string | A display name for the sender

Every nested **shopping cart** object has the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`id` | [ID][] | Unique identifier for the shopping cart
`opened_at` | [date/time][] | When the first item was added to the shopping cart
`total_price` | string | The total sum of the shopping cart, as a decimal string
`monthly_total_price` | string | The total monthly subscription sum of the shopping cart, as a decimal string
`currency` | string | The currency in which the shopping cart value is given, e.g. `EUR`
`locked_at` | [date/time][] | When the cart was purchased, i.e. "locked". It is `null` if the visitor has not purchased the shopping cart (yet)
`products` | array of objects | List of products in the shopping cart, see below.

Every nested **shopping cart product** object has the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`id` | [ID][] | Unique identifier for this item
`name` | string | Name of the product
`description` | string | Description of the product
`category` | string | Name of the category to which the product belongs
`product_number` | string | The product number or ID in the shop
`price` | string | The price of a (single) product as a decimal string
`quantity` | integer | How many pieces of this product there are in the shopping cart
`monthly_price` | string | The monthly subscription price of a (single) product as a decimal string
`monthly_quantity` | integer | How many pieces of a monthly subscriptions there are in the shopping cart
`stock_balance` | integer | How many available pieces of product there are in stock
`added_at` | [date/time][] | When the product was added to the shopping cart
`deleted_at` | [date/time][] | When the product was removed from the shopping cart. If `null`, then the products actually exists in the shopping cart. Otherwise, it has actually been removed and should not be considered to be in the cart.
