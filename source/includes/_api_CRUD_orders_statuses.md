## Statuses that can be assigned to orders. Each status represents a state in the fulfilment workflow.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_orders`
||`store_v2_orders_read_only`

## Operations

*   [List Order Statuses](#list-order-statuses)
*   [Get an Order Status](#get-an-order-status)

## List Order Statuses

Gets the list of order statuses.

*   [OAuth](#list-order-statuses-oauth)
>`GET /stores/{store_hash}/v2/order_statuses`
*   [Basic Auth](#list-order-statuses-basic)
>`GET /api/v2/order_statuses`

### Filters

Filter parameters can be added to the URL query string to select specific order_statuses in the collection.

| Parameter | Type | Example |
| --- | --- | --- |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 order_statuses are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/order_statuses?page={number}` |
| `Limit` | int | `/api/v2/order_statuses?limit={count}` |

```json
[
  {
    "id": 0,
    "name": "Incomplete",
    "order": 0
  },
  {
    "id": "1",
    "name": "Pending",
    "order": "1"
  },
  {
    "id": "2",
    "name": "Shipped",
    "order": "8"
  },
  {
    "id": "3",
    "name": "Partially Shipped",
    "order": "6"
  },
  {
    "id": "4",
    "name": "Refunded",
    "order": "11"
  },
  {
    "id": "5",
    "name": "Cancelled",
    "order": "9"
  },
  {
    "id": "6",
    "name": "Declined",
    "order": "10"
  },
  {
    "id": "7",
    "name": "Awaiting Payment",
    "order": "2"
  },
  {
    "id": "8",
    "name": "Awaiting Pickup",
    "order": "5"
  },
  {
    "id": "9",
    "name": "Awaiting Shipment",
    "order": "4"
  },
  {
    "id": "10",
    "name": "Completed",
    "order": "7"
  },
  {
    "id": "11",
    "name": "Awaiting Fulfillment",
    "order": "3"
  },
  {
    "id": "12",
    "name": "Manual Verification Required",
    "order": "13"
  },
  {
    "id": "13",
    "name": "Disputed",
    "order": "12"
  }
]
```

## Get an Order Status

Gets a single order status.

*   [OAuth](#get-an-order-status-oauth)
>`GET /stores/{store_hash}/v2/order_statuses/{id}`
*   [Basic Auth](#get-an-order-status-basic)
>`GET /api/v2/order_statuses/{id}`

```json
{
  "id": "12",
  "name": "Manual Verification Required",
  "order": "12"
}
```
