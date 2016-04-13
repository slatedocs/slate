## Product line items associated with an order.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_orders`
||`store_v2_orders_read_only`

## Operations

*   [List Order Products](#list-order-products)
*   [Get an Order Product](#get-an-order-product)
*   [Get a Count of Order Products](#get-a-count-of-order-products)

## List Order Products

Gets the product line items associated with an order. (By default, items sort from lowest to highest according to a newly created id, separate from the order_id and the product_id.)

*   [OAuth](#list-order-products-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/products`
*   [Basic Auth](#list-order-products-basic)
>`GET /api/v2/orders/{order_id}/products`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 order_products are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/orders/{order_id}/products?page={number}` |
| `Limit` | int | `/api/v2/orders/{order_id}/products?limit={count}` |

```json
[
  {
    "id": 16,
    "order_id": 115,
    "product_id": 0,
    "order_address_id": 16,
    "name": "Cynthia Gilbert Signature Collection",
    "sku": "",
    "type": "physical",
    "base_price": "93.1800",
    "price_ex_tax": "93.1800",
    "price_inc_tax": "93.1800",
    "price_tax": "0.0000",
    "base_total": "93.1800",
    "total_ex_tax": "93.1800",
    "total_inc_tax": "93.1800",
    "total_tax": "0.0000",
    "weight": "0",
    "quantity": 1,
    "base_cost_price": "0.0000",
    "cost_price_inc_tax": "0.0000",
    "cost_price_ex_tax": "0.0000",
    "cost_price_tax": "0.0000",
    "is_refunded": false,
    "refund_amount": "0.0000",
    "return_id": 0,
    "wrapping_name": "",
    "base_wrapping_cost": "0.0000",
    "wrapping_cost_ex_tax": "0.0000",
    "wrapping_cost_inc_tax": "0.0000",
    "wrapping_cost_tax": "0.0000",
    "wrapping_message": "",
    "quantity_shipped": 0,
    "event_name": null,
    "event_date": "",
    "fixed_shipping_cost": "0.0000",
    "ebay_item_id": "",
    "ebay_transaction_id": "",
    "option_set_id": null,
    "parent_order_product_id": null,
    "is_bundled_product ": false,
    "bin_picking_number": "",
    "applied_discounts": [
      {
        "id": "coupon",
        "amount": 4.66
      }
    ],
    "product_options": [

    ],
    "configurable_fields": [

    ]
  }
]
```

## Get an Order Product

Gets a product line item associated with the order.


*   [OAuth](#get-an-order-product-oauth)
>`GET /stores/{store_hash}/v2/orders/{order_id}/products/{id}`
*   [Basic Auth](#get-an-order-product-basic)
>`GET /api/v2/orders/{order_id}/products/{id}`

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

## Get a Count of Order Products

Gets a count of order product line items.

*   [OAuth](#get-a-count-of-order-products-oauth)
>`GET /stores/{store_hash}/v2/orders/products/count`
*   [Basic Auth](#get-a-count-of-order-products-basic)
>`GET /api/v2/orders/products/count`

```json
{
  "count": 17
}
```
