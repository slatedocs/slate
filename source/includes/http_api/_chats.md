Chat API
========

## Get a collection of chats

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
