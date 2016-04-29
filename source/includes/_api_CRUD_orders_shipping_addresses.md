## Shipping addresses associated with an order.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_orders`
||`store_v2_orders_read_only`

## Operations

*   [List Order Shipping Addresses](#list-order-shipping-addresses)
*   [Get an Order Shipping Address](#get-an-order-shipping-address)
*   [Get a Count of Shipments](#get-a-count-of-shipments)

## List Order Shipping Addresses

Gets the shipping addresses associated with an order.

*   [OAuth](#list-order-shipping-addresses-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/shipping_addresses`
*   [Basic Auth](#list-order-shipping-addresses-basic)
>`GET /api/v2/orders/{order_id}/shipping_addresses`

### Filters

Filter parameters can be added to the URL query string to select specific order_shipping_addresses in the collection.

| Parameter | Type | Example |
| --- | --- | --- |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 order_shipping_addresses are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/orders/{order_id}/shipping_addresses?page={number}` |
| `Limit` | int | `/api/v2/orders/{order_id}/shipping_addresses?limit={count}` |

```json
[
  {
    "id": 15,
    "order_id": 114,
    "first_name": "Julie",
    "last_name": "Bishop",
    "company": "Yamia",
    "street_1": "988 Comanche Circle",
    "street_2": "",
    "city": "Cypress",
    "zip": "77426-2265",
    "country": "United States",
    "country_iso2": "US",
    "state": "Wyoming",
    "email": "",
    "phone": "5-(248)906-2014",
    "items_total": 1,
    "items_shipped": 0,
    "shipping_method": "None",
    "base_cost": "0.0000",
    "cost_ex_tax": "0.0000",
    "cost_inc_tax": "0.0000",
    "cost_tax": "0.0000",
    "cost_tax_class_id": 2,
    "base_handling_cost": "0.0000",
    "handling_cost_ex_tax": "0.0000",
    "handling_cost_inc_tax": "0.0000",
    "handling_cost_tax": "0.0000",
    "handling_cost_tax_class_id": 2,
    "shipping_zone_id": 1,
    "shipping_zone_name": "Default Zone"
  }
]
```

## Get an Order Shipping Address

Gets a shipping address associated with an order.

*   [OAuth](#get-an-order-shipping-address-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/shipping_addresses/{id}`
*   [Basic Auth](#get-an-order-shipping-address-basic)
>`GET /api/v2/orders/{order_id}/shipping_addresses/{id}`

```json
{
  "id": 15,
  "order_id": 114,
  "first_name": "Julie",
  "last_name": "Bishop",
  "company": "Yamia",
  "street_1": "988 Comanche Circle",
  "street_2": "",
  "city": "Cypress",
  "zip": "77426-2265",
  "country": "United States",
  "country_iso2": "US",
  "state": "Wyoming",
  "email": "",
  "phone": "5-(248)906-2014",
  "items_total": 1,
  "items_shipped": 0,
  "shipping_method": "None",
  "base_cost": "0.0000",
  "cost_ex_tax": "0.0000",
  "cost_inc_tax": "0.0000",
  "cost_tax": "0.0000",
  "cost_tax_class_id": 2,
  "base_handling_cost": "0.0000",
  "handling_cost_ex_tax": "0.0000",
  "handling_cost_inc_tax": "0.0000",
  "handling_cost_tax": "0.0000",
  "handling_cost_tax_class_id": 2,
  "shipping_zone_id": 1,
  "shipping_zone_name": "Default Zone"
}
```

## Get a Count of Shipments

Gets a count of the number of orders that have shipped.

*   [OAuth](#get-a-count-of-shipments-oauth)
>`GET /stores/{store_hash}/v2/orders/shipments/count`
*   [Basic Auth](#get-a-count-of-shipments-basic)
>`GET /api/v2/orders/shipments/count`

```json
{
  "count": 6
}
```
