# Order Products

Product line item belonging to an order

|||
|---|---|
| **Managed by** | [Order Products Resource](/api/stores/v2/orders/products)

## Order Product Object - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int |
| order_id | int |
| product_id | int |
| order_address_id | int |
| name | string |
| sku | string |
| type | enum |
| base_price | decimal |
| price_ex_tax | decimal |
| price_inc_tax | decimal |
| price_tax | decimal |
| base_total | decimal |
| total_ex_tax | decimal |
| total_inc_tax | decimal |
| total_tax | decimal |
| weight | decimal |
| quantity | int |
| base_cost_price | decimal |
| cost_price_inc_tax | decimal |
| cost_price_ex_tax | decimal |
| cost_price_tax | decimal |
| is_refunded | boolean |
| refund_amount | decimal |
| return_id | int |
| wrapping_name | string |
| base_wrapping_cost | decimal |
| wrapping_cost_ex_tax | decimal |
| wrapping_cost_inc_tax | decimal |
| wrapping_cost_tax | decimal |
| wrapping_message | text |
| quantity_shipped | int |
| event_name | string |
| event_date | date |
| fixed_shipping_cost | decimal |
| ebay_item_id | string |
| ebay_transaction_id | string |
| option_set_id | int |
| parent_order_product_id | int |
| is_bundled_product | boolean |
| bin_picking_number | string |
| applied_discounts | object |
| product_options | object_array |
| configurable_fields | object_array |
