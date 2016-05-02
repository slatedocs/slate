## Taxes applied to an order.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_orders`
||`store_v2_orders_read_only`

## Operations

*   [List Order Taxes](#list-order-taxes)
*   [Get an Order Tax](#get-an-order-tax)

## List Order Taxes

Gets the list of taxes applied to an order.

*   [OAuth](#list-order-taxes-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/taxes`
*   [Basic Auth](#list-order-taxes-basic)
>`GET /api/v2/orders/{order_id}/taxes`

### Filters

Filter parameters can be added to the URL query string to select specific order_taxes in the collection.

| Parameter | Type | Example |
| --- | --- | --- |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 order_taxes are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/orders/{order_id}/taxes?page={number}` |
| `Limit` | int | `/api/v2/orders/{order_id}/taxes?limit={count}` |

## Get an Order Tax

Gets an order tax item.

*   [OAuth](#get-an-order-tax-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/taxes/{id}`
*   [Basic Auth](#get-an-order-tax-basic)
>`GET /api/v2/orders/{order_id}/taxes/{id}`
