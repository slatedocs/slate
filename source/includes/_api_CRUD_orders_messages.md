## Messages associated with an order.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_orders`
||`store_v2_orders_read_only`


## Operations

*   [List Order Messages](#list-order-messages)
*   [Get Order Message](#get-order-message)

## List Order Messages

Gets the messages associated with an order.

*   [OAuth](#list-order-messages-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/messages`
*   [Basic Auth](#list-order-messages-basic)
>`GET /api/v2/orders/{order_id}/messages`

### Filters

Filter parameters can be added to the URL query string to select specific order_messages in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `min_id` | int | `/api/v2/orders/{order_id}/messages?min_id={value}` |
| `max_id` | int | `/api/v2/orders/{order_id}/messages?max_id={value}` |
| `status` | string | `/api/v2/orders/{order_id}/messages?status={value}` |
| `customer_id` | string | `/api/v2/orders/{order_id}/messages?customer_id={value}` |
| `is_flagged` | string | `/api/v2/orders/{order_id}/messages?is_flagged={value}` |
| `min_date_created` | dateTime or date | `/api/v2/orders/{order_id}/messages?min_date_created={value}` |
| `max_date_created` | dateTime or date | `/api/v2/orders/{order_id}/messages?max_date_created={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 order_messages are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `page` | int | `/api/v2/orders/{order_id}/messages?page={number}` |
| `limit` | int | `/api/v2/orders/{order_id}/messages?limit={count}` |

## Get Order Message

Gets a message associated with an order.

*   [OAuth](#get-order-message-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/messages/{id}`
*   [Basic Auth](#get-order-message-basic)
>`GET /api/v2/orders/{order_id}/messages/{id}`
