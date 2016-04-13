## Tracks a package consignment from an order, shipped from the seller to the buyer.

|||
|---|---|
| **Managed by** | [Shipments Resource](/api/stores/v2/orders/shipments)

## Properties

| Name | Type | Description |
| --- | --- | --- |
| `id` | `int` |
| `order_id` | `int` |
| `customer_id` | `int` |
| `order_address_id` | `int` | ID of the order address the shipment is associated with |
| `date_created` | `date` |
| `tracking_number` | `string` | Tracking number of the shipment |
| `shipping_method` | `string` |
| `comments` | `text` | Comments the shipper wishes to add |
| `billing_address` | `object` |
| `shipping_address` | `object` |
| `items` | `object_array` | The items in the shipment. Is an object. Look at the items table. A sample value can be [{"order_product_id":15,"quantity":2}] 
