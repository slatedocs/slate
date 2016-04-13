# Orders

## Integrate with point of sale, shipping, distribution, and inventory management systems.


## Resources

### [Orders](/api/stores/v2/orders)

Purchases from a store.

### [Order Coupons](/api/stores/v2/orders/coupons)

Coupons applied to an order.

### [Order Messages](/api/stores/v2/orders/messages)

### [Order Products](/api/stores/v2/orders/products)

Product line items associated with an order.

### [Order Shipping Addresses](/api/stores/v2/orders/shipping_addresses)

Shipping addresses associated with an order.

### [Order Statuses](/api/stores/v2/order_statuses)

Statuses that can be assigned to orders. Each status represents a state in the fulfilment workflow.

### [Order Taxes](/api/stores/v2/orders/taxes)

Taxes applied to an order.

### [Shipments](/api/stores/v2/orders/shipments)

Shipping package consignments tracked from an order.


## Objects

### [Order](/api/objects/v2/order)

The order object contains a record of the purchase agreement between a shopper and a merchant. Returned by GET operations on the orders resource. Can also be passed in PUT and POST operations.

### [Order Coupon](/api/objects/v2/order_coupon)

Coupon code applied to an order

### [Order Message](/api/objects/v2/order_message)

### [Order Product](/api/objects/v2/order_product)

Product line item belonging to an order

### [Order Shipping Address](/api/objects/v2/order_shipping_address)

Customer shipping address belonging to an order

### [Order Status](/api/objects/v2/order_status)

Represents a state in the order fulfilment workflow

### [Order Tax](/api/objects/v2/order_tax)

The taxes object provides information about each tax applied to an order, which may be useful for reporting purposes. All values are read-only.

### [Shipment](/api/objects/v2/shipment)

Tracks a package consignment from an order, shipped from the seller to the buyer.