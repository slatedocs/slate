Chat API
========

## Chats

### Get a collection of chats at a room

You can get a list of open chats that are waiting for a response by an operator.

`GET /api/v5/orgs/<org_id>/rooms/<room_id>/chats`

This API endpoint returns a [paginated collection][]. They are sorted by the creation time of the chats, in ascending order.

```json
{
  "next": "https://service.giosg.com/api/v5/orgs/7f9e9580-095b-42c7-838c-c04e667b26f7/rooms/9926bdfa-56e0-11e5-b98c-6c4008c08dfe/chats?cursor=171cfd0d7ce542be86221f01d2823cb1",
  "previous": null,
  "results": [
    {
      "id": "58f5055c-56e0-11e5-9354-6c4008c08dfe",
      "token": "uibdbtmk5etolmjaduaafnqpl2ujzkyr4slkq3cabdai37qm",
      "start_time": "2015-02-13T11:31:36.042",
      "end_time": null,
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
      "is_waiting_response" true,
      "currently_present_user_count": 1,
      "participation_count": 2,
      "user_participation_count": 1,
      "visitor_participation_count": 1
    }
  ]
}
```

### Get a collection of all chats of the user

`GET /api/v5/orgs/<org_id>/users/<user_id>/chats`

### Get a collection chats where the user is currently present

Get a collection of chats where the user `<user_id>` has currently a [presence][chat presence].

`GET /api/v5/orgs/<org_id>/users/<user_id>/current_chats`

### Create a new chat with a visitor in a room

Start a new chat with a visitor in the given room.

`POST /api/v5/orgs/<org_id>/rooms/<room_id>/visitors/<visitor_id>/chats`

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`auto_resume` | [ID][] | (none) | If provided, then attempt to get an existing recent chat where the given user can join, instead of creating a new chat. In addition, we will automatically (and atomically) create a [presence][chat presence] for this user and chat. **NOTE**: The “private chats” setting affects the decision whether to create or resume a chat.

Returns 201 status code when a new chat was created successfully.
Returns 200 if resumed an existing chat when `auto_resume` parameter was provided.

When a new chat was successfully created, the following channels are notified with an `added` message. If an existing chat was resumed (with `auto_resume`) and the operator was joined to the chat, then a `changed` message is sent instead, notifying about a change in field `currently_present_user_count`.

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats`

The following real-time channels are also notified when appropriate:

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/presences`
- For each participant user of the chat (including the joined user): `/api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/presences`
- For each currently present operator (including the joined user): `/api/v5/orgs/<org_id>/users/<user_id>/current_chats/<chat_id>/presences`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats/<chat_id>/presences`

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

`GET /api/v5/orgs/<org_id>/chats/<chat_id>/presences`

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

### Join operator to a chat

Adds the operator to the list of currently present operators of the chat. Operator is automatically removed from the joined operators if the operator has not been reached for a while.

`POST /api/v5/orgs/<org_id>/chats/<chat_id>/presences`

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`exclusive` | `true`/`false` | `false` | The exclusive parameter makes the join fail with 400 if there is already at least one other operator joined the chat. This prevents multiple operators taking the chat.

Returns 201 if the user was added to the joined operators of the chat.
Returns 200 if the user had already been added.
Returns 400 if the user does not have permissions to join the chat.

Because the `currently_present_user_count` increased, we notify the following channels with a `changed` message:

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats`

The following real-time channels are notified with an `added` notification:

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/presences`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/presences`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats/<chat_id>/presences`

### Leave from a chat

Removes the operator from the list of currently present operators of the chat.

`DELETE /api/v5/orgs/<org_id>/chats/<chat_id>/presences/<user_id>`

Because the `currently_present_user_count` decreased, we notify the following channels with a `changed` message:

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats`

The following real-time channels are notified with an `removed` notification:

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/presences`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/presences`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats/<chat_id>/presences`

## Chat participations

The visitor as well as each user who have sent at least one message to the chat is added as a "participant" to the chat. This is represented as a "participation" resource:

Attribute | Format | Editable | Description
:---------|:-------|:--------|------------
`id` | [ID][]/string | read-only | ID of the user or visitor that has participated in the chat.
`type` | string | read-only | Either `visitor` or `user`.

### Get a collection of chat participations

`GET /api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/participations`


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
`message` | string | **required** | Content text of the message. The maximum length is 2000 characters.

### Get chat history

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

### Send a chat message

    POST /api/v5/orgs/b2bf5dba-055c-4ac6-a83c-7f85a1f60db9/chats/4a591004-4c18-4260-bbb4-fc9f9f9a048d/messages

```json
{
  "sender_id": "7c94ae79-a4b4-4eea-ac23-24c16f910080",
  "message": "OK, I've found out the issue!"
}
```

Sends a new chat message with type `msg` to a chat.

`POST /api/v5/orgs/<org_id>/chats/<chat_id>/messages`

The ID of the sender must be explicitly provided. This is usually equal to the user who is authenticated. If the sender is not yet added as a participant of this chat, then a new [participation][chat participation] is automatically created.

If the chat was previously in waiting state, then `is_waiting_response` of the chat is automatically changed to `false`.

Because the `message_count` and `user_message_count` were increased, we notify the following channels with a `changed` message. This also includes any possible changes to `is_waiting_response`, `participant_count` and `user_participant_count`.

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats`

The following real-time channels are notified with an `added` notification:

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/messages`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/messages`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats/<chat_id>/messages`

If the user was added as a participant to the chat we also notify the following channels with a `added` message:

- For each visitor of the chat: `/api/v5/client/visitors/<visitor_id>/chats/<chat_id>/participations`
- For each participant and currently present user of the chat: `/api/v5/orgs/<org_id>/users/<user_id>/chats/<chat_id>/participations`
- For the chat parent room chat collection and each organization having access that room: `/api/v5/orgs/<org_id>/rooms/<room_id>/chats/<chat_id>/participations`





## Get a collection of chats on organization

You can get a list of your organization's chats by making a GET request.

`GET https://service.giosg.com/api/v5/orgs/<organization_id>/chats`

By default, the API returns all the available chats paginated, sorted by ascending ID order. You may want to filter the chats or change the order or pagination parameters by providing GET parameters in the URL. Remember to URL-encode any parameter values.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`ordering` | [ordering][] | `start_time` | Order results by either `start_time` or `end_time`.
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 25 | [Page size][paginated collection] for the pages, with max value of 100
`since_id` | [ID][] | | Only return chats after the chat with this ID (exclusive)
`start_time` | [date/time][] | | Only return chats started after this moment (inclusive)
`end_time` | [date/time][] | | Only return chats ended before this moment (exclusive)
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
      "start_time": "2015-02-13T11:31:36.042",
      "end_time": "2015-02-13T12:38:36.424",
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
      "operator_message_count": 0,
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
`start_time` | [date/time][] | When the chat conversation started
`end_time` | [date/time][] | When the chat conversation ended (or `null` if not yet ended)
`updated_at` | [date/time][] | When the chat conversation was last time updated
`is_private` | boolean | Whether or not the chat is marked as private for its operators
`is_real_conversation` | boolean | Whether or not the chat is an actual conversation
`is_autosuggested` | boolean | Whether or not the chat started with an autosuggestion
`room_id` | [ID][] | ID of the [room][] in which the chat occurred
`api_data` | array of objects | A list of any data that has been submitted for the visitor with APIs. Each object has the attributes `name` and `value`.
`operator_message_count` | integer | How many messages there were by operator in this chat
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
