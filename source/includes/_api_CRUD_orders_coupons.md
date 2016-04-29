## Coupons applied to an order.

|||
|---|---|
| **Manages** |
| OAuth Scopes | `store_v2_orders`
||`store_v2_orders_read_only`

## Operations

*   [List Order Coupons](#list-order-coupons)
*   [Get an Order Coupon](#get-an-order-coupon)

## List Order Coupons

Gets the coupon codes applied to an order. (Default sorting is by coupon id, from lowest to highest; however, only one coupon can be applied to each order.)

*   [OAuth](#list-order-coupons-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/coupons`
*   [Basic Auth](#list-order-coupons-basic)
>`GET /api/v2/orders/{order_id}/coupons`

### Filters

Filter parameters can be added to the URL query string to select specific order_coupons in the collection.

| Parameter | Type | Example |
| --- | --- | --- |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 order_coupons are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/orders/{order_id}/coupons?page={number}` |
| `Limit` | int | `/api/v2/orders/{order_id}/coupons?limit={count}` |

```json
[
  {
    "id": 1,
    "coupon_id": 1,
    "order_id": 115,
    "code": "557D2DEA0CCAFA1",
    "amount": "5.0000",
    "type": 1,
    "discount": "4.6600"
  }
]
```

## Get an Order Coupon

Gets a coupon code associated with an order.

*   [OAuth](#get-an-order-coupon-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/coupons/{id}`
*   [Basic Auth](#get-an-order-coupon-basic)
>`GET /api/v2/orders/{order_id}/coupons/{id}`

```json
{
  "id": 1,
  "coupon_id": 1,
  "order_id": 115,
  "code": "557D2DEA0CCAFA1",
  "amount": "5.0000",
  "type": 1,
  "discount": "4.6600"
}
```
