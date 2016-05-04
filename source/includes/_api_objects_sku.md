# Product SKUs

|||
|---|---|
| Managed by | [SKUs Resource](/api/v2/products/skus)

## Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int | |
| product_id | int | |
| sku | string | The unique sku |
| cost_price | decimal | The cost price of the product |
| upc | string | The upc for the product combination |
| inventory_level | int | The inventory level for the product |
| inventory_warning_level | int | The inventory warning level for the product |
| bin_picking_number | string | The BIN picking number |
| options | object_array | This is an object {"product_option_id": int, "option_value_id":int} |
