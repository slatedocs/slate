## Purchases from a store.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_orders`
||`store_v2_orders_read_only`

## Operations

*   [List Orders](#list-orders)
*   [Get an Order](#get-an-order)
*   [Get a Count of Orders](#get-a-count-of-orders)
*   [Create an Order](#create-an-order)
*   [Update an Order](#update-an-order)
*   [Delete an Order](#delete-an-order)
*   [Delete All Orders](#delete-all-orders)

## List Orders

Gets the collection of orders. (The default sort is by order id, from lowest to highest.)

*   [OAuth](#list-orders-oauth)
>`GET /stores/{store_hash}/v2/orders`
*   [Basic Auth](#list-orders-basic)
>`GET /api/v2/orders`

### Filters

Filter parameters can be added to the URL query string to select specific orders in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `min_id` | int | `/api/v2/orders?min_id={value}` |
| `max_id` | int | `/api/v2/orders?max_id={value}` |
| `min_total` | decimal | `/api/v2/orders?min_total={value}` |
| `max_total` | decimal | `/api/v2/orders?max_total={value}` |
| `customer_id` | string | `/api/v2/orders?customer_id={value}` |
| `status_id` | string | `/api/v2/orders?status_id={value}` |
| `is_deleted` | string | `/api/v2/orders?is_deleted={value}` |
| `payment_method` | string | `/api/v2/orders?payment_method={value}` |
| `min_date_created` | dateTime or date | `/api/v2/orders?min_date_created={value}` |
| `max_date_created` | dateTime or date | `/api/v2/orders?max_date_created={value}` |
| `min_date_modified` | dateTime or date | `/api/v2/orders?min_date_modified={value}` |
| `max_date_modified` | dateTime or date | `/api/v2/orders?max_date_modified={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 orders are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `page` | int | `/api/v2/orders?page={number}` |
| `limit` | int | `/api/v2/orders?limit={count}` |
| `sort` | string | `/api/v2/orders?sort=date_created:desc` |

```json
[
  {
    "id": 100,
    "customer_id": 10,
    "date_created": "Wed, 14 Nov 2012 19:26:23 +0000",
    "date_modified": "Wed, 14 Nov 2012 19:26:23 +0000",
    "date_shipped": "",
    "status_id": 11,
    "status": "Awaiting Fulfillment",
    "subtotal_ex_tax": "79.0000",
    "subtotal_inc_tax": "79.0000",
    "subtotal_tax": "0.0000",
    "base_shipping_cost": "0.0000",
    "shipping_cost_ex_tax": "0.0000",
    "shipping_cost_inc_tax": "0.0000",
    "shipping_cost_tax": "0.0000",
    "shipping_cost_tax_class_id": 2,
    "base_handling_cost": "0.0000",
    "handling_cost_ex_tax": "0.0000",
    "handling_cost_inc_tax": "0.0000",
    "handling_cost_tax": "0.0000",
    "handling_cost_tax_class_id": 2,
    "base_wrapping_cost": "0.0000",
    "wrapping_cost_ex_tax": "0.0000",
    "wrapping_cost_inc_tax": "0.0000",
    "wrapping_cost_tax": "0.0000",
    "wrapping_cost_tax_class_id": 3,
    "total_ex_tax": "79.0000",
    "total_inc_tax": "79.0000",
    "total_tax": "0.0000",
    "items_total": 1,
    "items_shipped": 0,
    "payment_method": "cash",
    "payment_provider_id": null,
    "payment_status": "",
    "refunded_amount": "0.0000",
    "order_is_digital": false,
    "store_credit_amount": "0.0000",
    "gift_certificate_amount": "0.0000",
    "ip_address": "50.58.18.2",
    "geoip_country": "",
    "geoip_country_iso2": "",
    "currency_id": 1,
    "currency_code": "USD",
    "currency_exchange_rate": "1.0000000000",
    "default_currency_id": 1,
    "default_currency_code": "USD",
    "staff_notes": "",
    "customer_message": "",
    "discount_amount": "0.0000",
    "coupon_discount": "0.0000",
    "shipping_address_count": 1,
    "is_deleted": false,
    "billing_address": {
      "first_name": "Trisha",
      "last_name": "McLaughlin",
      "company": "",
      "street_1": "12345 W Anderson Ln",
      "street_2": "",
      "city": "Austin",
      "state": "Texas",
      "zip": "78757",
      "country": "United States",
      "country_iso2": "US",
      "phone": "",
      "email": "elsie@example.com"
    },
    "products": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/products.json",
      "resource": "/orders/100/products"
    },
    "shipping_addresses": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/shippingaddresses.json",
      "resource": "/orders/100/shippingaddresses"
    },
    "coupons": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/coupons.json",
      "resource": "/orders/100/coupons"
    }
  }
]
```
## Get an Order

Gets an order.

*   [OAuth](#get-an-order-oauth)
>`GET /stores/{store_hash}/v2/orders/{id}`
*   [Basic Auth](#get-an-order-basic)
>`GET /api/v2/orders/{id}`

```json
{
  "id": 100,
  "customer_id": 10,
  "date_created": "Wed, 14 Nov 2012 19:26:23 +0000",
  "date_modified": "Wed, 14 Nov 2012 19:26:23 +0000",
  "date_shipped": "",
  "status_id": 11,
  "status": "Awaiting Fulfillment",
  "subtotal_ex_tax": "79.0000",
  "subtotal_inc_tax": "79.0000",
  "subtotal_tax": "0.0000",
  "base_shipping_cost": "0.0000",
  "shipping_cost_ex_tax": "0.0000",
  "shipping_cost_inc_tax": "0.0000",
  "shipping_cost_tax": "0.0000",
  "shipping_cost_tax_class_id": 2,
  "base_handling_cost": "0.0000",
  "handling_cost_ex_tax": "0.0000",
  "handling_cost_inc_tax": "0.0000",
  "handling_cost_tax": "0.0000",
  "handling_cost_tax_class_id": 2,
  "base_wrapping_cost": "0.0000",
  "wrapping_cost_ex_tax": "0.0000",
  "wrapping_cost_inc_tax": "0.0000",
  "wrapping_cost_tax": "0.0000",
  "wrapping_cost_tax_class_id": 3,
  "total_ex_tax": "79.0000",
  "total_inc_tax": "79.0000",
  "total_tax": "0.0000",
  "items_total": 1,
  "items_shipped": 0,
  "payment_method": "cash",
  "payment_provider_id": null,
  "payment_status": "",
  "refunded_amount": "0.0000",
  "order_is_digital": false,
  "store_credit_amount": "0.0000",
  "gift_certificate_amount": "0.0000",
  "ip_address": "50.58.18.2",
  "geoip_country": "",
  "geoip_country_iso2": "",
  "currency_id": 1,
  "currency_code": "USD",
  "currency_exchange_rate": "1.0000000000",
  "default_currency_id": 1,
  "default_currency_code": "USD",
  "staff_notes": "",
  "customer_message": "",
  "discount_amount": "0.0000",
  "coupon_discount": "0.0000",
  "shipping_address_count": 1,
  "is_deleted": false,
  "billing_address": {
    "first_name": "Trisha",
    "last_name": "McLaughlin",
    "company": "",
    "street_1": "12345 W Anderson Ln",
    "street_2": "",
    "city": "Austin",
    "state": "Texas",
    "zip": "78757",
    "country": "United States",
    "country_iso2": "US",
    "phone": "",
    "email": "elsie@example.com"
  },
  "products": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/products.json",
    "resource": "/orders/100/products"
  },
  "shipping_addresses": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/shippingaddresses.json",
    "resource": "/orders/100/shippingaddresses"
  },
  "coupons": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/coupons.json",
    "resource": "/orders/100/coupons"
  }
}
```

## Get a Count of Orders

Gets a count of the number of orders in the store.

*   [OAuth](#get-a-count-of-orders-oauth)
>`GET /stores/{store_hash}/v2/orders/count`
*   [Basic Auth](#get-a-count-of-orders-basic)
>`GET /api/v2/orders/count`

```json
{
  "count": 9
}
```

## Create an Order

Manually create and submit an order.

*   [OAuth](#create-an-order-oauth)
>`POST /stores/{store_hash}/v2/orders`
*   [Basic Auth](#create-an-order-basic)
`POST /api/v2/orders`

### Read-only Properties

The following properties of the order are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `date_modified`
*   `date_shipped`
*   `status`
*   `order_source`
*   `subtotal_tax`
*   `shipping_cost_tax`
*   `shipping_cost_tax_class_id`
*   `handling_cost_tax`
*   `handling_cost_tax_class_id`
*   `wrapping_cost_tax`
*   `wrapping_cost_tax_class_id`
*   `total_tax`
*   `payment_status`
*   `currency_id`
*   `currency_code`
*   `currency_exchange_rate`
*   `default_currency_id`
*   `default_currency_code`
*   `coupon_discount`
*   `store_credit_amount`
*   `gift_certificate_amount`
*   `shipping_address_count`
*   `is_deleted`
*   `coupons`

### Requirements

The following properties of the order are required. The request won’t be fulfilled unless these properties are valid.

*   `products`
*   `billing_address`

### Notes
>KNOWN ISSUE: Bigcommerce does not compute sales tax to orders created via the API if the store has automatic tax enabled.</span>

>PRO TIP: Abbreviated state names in shipping and billing addresses will prevent tax documents from being submitted to Avalara. Spell state names out in full to ensure successful Avalara tax document submissions. For example, supplying `**CA**` as a state name results in no tax document submission. Supplying `**California**` as a state name results in a successful submission.</span>

#### Overriding Pre-set Values

You can create overrides for calculated values such as product prices, subtotal and totals by sending a fixed value in the request. If values are not supplied for these properties, they will be automatically calculated based on the pre-set store values and tax rules.

#### Order Products

*   Existing products can be added to the order with a reference to their `product_id`.
*   Custom products can be added to the order using the [products array](/api/orders/order/products "products object/array").
*   If price is not specified, it will automatically pick up the price from the store’s product catalog, however you can override it via `price_inc_tax` and `price_ex_tax`.
*   If `price_inc_tax` and `price_ex_tax` is specified, price and rulesets are ignored and the `**price_inc_tax**` or `**price_ex_tax**` are written to `**base_price**`, according to the store settings.
*   When the store is subscribed to Avalara Premium, a value of `**API Tax Override**` is written to the `**name**` field of the order tax object.
*   Tax will be calculated based on the tax rules specified in the store except in the case of automatic taxes, however you can optionally override the tax values by specifying `price_inc_tax` and `price_ex_tax` in both cases.
*   For products which are configured to track stock, the quantity specified on the order will reduce the stock on hand. When there is not enough inventory to fulfill the order, it will be rejected with an ‘out of stock’ error code.
*   For products which have min and max quantities specified in their settings, the API will honor these and reject orders appropriately.
*   For products where product options are required, the API will validate these requirements to ensure the product options are specified.
*   Product quantity must be specified.

#### Calculation of Totals

*   When not specified, order subtotal and total are automatically calculated.
*   You can override order subtotal and/or total. If you choose to override one, we strongly recommend that override both as the system will not be able to accurately calculate the other.

#### Order Properties

*   Billing address is mandatory.
*   Shipping address is not mandatory and can optionally be specified as composite records.
    *   When the shipping address is not specified, the system will fall back to using the billing address as the shipping address
    *   Multiple shipments are not supported so it will assume the first address in the collection
*   In the shipping and billing address, their is no requirement to specify ‘country’ when ‘country_ISO2’ is specified.
    *   The value specified for ‘country_ISO2’ will always override any value specified for ‘country’
*   Coupon redemption is not supported at this time.
*   Set customer_id to 0 to specify a guest checkout.
*   order_source cannot be specified and it will be set to ‘external’.
    *   You can optionally specify a value for external_source to specify which external source the order is coming from - i.e., POS system X, accounting system Y, etc

#### Changing the Order Status

*   status_id can be specified resulting in the the corresponding ‘status’ to automatically be set. When not specified, status_id will be automatically set to 1 resulting in ‘status’ to be set to ‘Pending’.

*   POST or PUT Orders on stores with Avalara Premium causes tax documents to be submitted. If a store has subscribed to Avalara Premium, Bigcommerce automatically submits tax documents to Avalara when the order achieves a paid status. The following statuses are of the paid type:
    *   `Shipped`
    *   `Partially Shipped`
    *   `Awaiting Pickup`
    *   `Awaiting Shipment`
    *   `Completed`
    *   `Awaiting Fulfillment`
*   Bigcommerce considers all statuses other than the above to be of the unpaid type, except `**Refunded**`, which is considered neither paid or unpaid. Orders created using the `**POST**` method that include a status of the paid type result in the submission of tax documents to Avalara.

```curl
{
  "customer_id": 0,
  "status_id": 11,
  "date_created": "Thu, 04 Oct 2012 03:24:40 +0000",
  "subtotal_ex_tax": 1705,
  "subtotal_inc_tax": 1915,
  "base_shipping_cost": 0,
  "shipping_cost_ex_tax": 0,
  "shipping_cost_inc_tax": 0,
  "base_handling_cost": 0,
  "handling_cost_ex_tax": 0,
  "handling_cost_inc_tax": 0,
  "base_wrapping_cost": 0,
  "wrapping_cost_ex_tax": 0,
  "wrapping_cost_inc_tax": 0,
  "total_ex_tax": 1705,
  "total_inc_tax": 1915,
  "refunded_amount": 0,
  "order_is_digital": false,
  "staff_notes": "",
  "customer_message": "",
  "discount_amount": 10,
  "billing_address": {
    "first_name": "Trisha",
    "last_name": "McLaughlin",
    "company": "",
    "street_1": "12345 W Anderson Ln",
    "street_2": "",
    "city": "Austin",
    "state": "Texas",
    "zip": "78757",
    "country": "United States",
    "country_iso2": "US",
    "phone": "",
    "email": "elsie@example.com"
  },
  "shipping_addresses": [
    {
      "first_name": "Trisha",
      "last_name": "McLaughlin",
      "company": "Acme Pty Ltd",
      "street_1": "566 Sussex St",
      "street_2": "",
      "city": "Austin",
      "state": "Texas",
      "zip": "78757",
      "country": "United States",
      "country_iso2": "US",
      "phone": "",
      "email": "elsie@example.com"
    }
  ],
  "products": [
    {
      "product_id": 32,
      "quantity": 2
    },
    {
      "product_id": 33,
      "quantity": 2,
      "product_options": [
        {
          "id": 87,
          "value": 10
        }
      ]
    },
    {
      "name": "My custom product",
      "quantity": 2,
      "price_inc_tax": 10.8,
      "price_ex_tax": 10
    }
  ],
  "external_source": "POS"
}
```

```json
{
  "id": 100,
  "customer_id": 0,
  "date_created": "Thu, 04 Oct 2012 03:24:40 +0000",
  "date_modified": "Thu, 30 May 2013 01:48:39 +0000",
  "date_shipped": "",
  "status_id": 1,
  "status": "Pending",
  "subtotal_ex_tax": "1705.0000",
  "subtotal_inc_tax": "1915.0000",
  "subtotal_tax": "210.0000",
  "base_shipping_cost": "0.0000",
  "shipping_cost_ex_tax": "0.0000",
  "shipping_cost_inc_tax": "0.0000",
  "shipping_cost_tax": "0.0000",
  "shipping_cost_tax_class_id": 0,
  "base_handling_cost": "0.0000",
  "handling_cost_ex_tax": "0.0000",
  "handling_cost_inc_tax": "0.0000",
  "handling_cost_tax": "0.0000",
  "handling_cost_tax_class_id": 0,
  "base_wrapping_cost": "0.0000",
  "wrapping_cost_ex_tax": "0.0000",
  "wrapping_cost_inc_tax": "0.0000",
  "wrapping_cost_tax": "0.0000",
  "wrapping_cost_tax_class_id": 0,
  "total_ex_tax": "1705.0000",
  "total_inc_tax": "1915.0000",
  "total_tax": "210.0000",
  "items_total": 4,
  "items_shipped": 0,
  "payment_method": "Manual",
  "payment_provider_id": null,
  "payment_status": "",
  "refunded_amount": "0.0000",
  "order_is_digital": false,
  "store_credit_amount": "0.0000",
  "gift_certificate_amount": "0.0000",
  "ip_address": "",
  "geoip_country": "",
  "geoip_country_iso2": "",
  "currency_id": 0,
  "currency_code": null,
  "currency_exchange_rate": "0.0000000000",
  "default_currency_id": 0,
  "default_currency_code": null,
  "staff_notes": "",
  "customer_message": "",
  "discount_amount": "10.0000",
  "coupon_discount": "0.0000",
  "shipping_address_count": 1,
  "is_deleted": false,
  "billing_address": {
    "first_name": "Trisha",
    "last_name": "McLaughlin",
    "company": "",
    "street_1": "12345 W Anderson Ln",
    "street_2": "",
    "city": "Austin",
    "state": "Texas",
    "zip": "78757",
    "country": "United States",
    "country_iso2": "US",
    "phone": "",
    "email": "elsie@example.com"
  },
  "order_source": "external",
  "external_source": "POS",
  "products": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/products.json",
    "resource": "/orders/100/products"
  },
  "shipping_addresses": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/shippingaddresses.json",
    "resource": "/orders/100/shippingaddresses"
  },
  "coupons": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/orders/100/coupons.json",
    "resource": "/orders/100/coupons"
  }
}
```

## Update an Order

Updates an existing order.

*   [OAuth](#update-an-order-oauth)
>`PUT /stores/{store_hash}/v2/orders/{id}`
*   [Basic Auth](#update-an-order-basic)
>`PUT /api/v2/orders/{id}`

### Read-only Properties

The following properties of the order are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `date_modified`
*   `date_shipped`
*   `status`
*   `order_source`
*   `subtotal_tax`
*   `shipping_cost_tax`
*   `shipping_cost_tax_class_id`
*   `handling_cost_tax`
*   `handling_cost_tax_class_id`
*   `wrapping_cost_tax`
*   `wrapping_cost_tax_class_id`
*   `total_tax`
*   `payment_status`
*   `currency_id`
*   `currency_code`
*   `currency_exchange_rate`
*   `default_currency_id`
*   `default_currency_code`
*   `coupon_discount`
*   `store_credit_amount`
*   `gift_certificate_amount`
*   `shipping_address_count`
*   `coupons`

### Notes

>KNOWN ISSUE: Bigcommerce does not compute sales tax to orders updated via the API if the store has automatic tax enabled.</span>

### Changing the Order Status

The `status` property cannot be edited directly as it is generated based on the `status_id`.

Use the `status_id` property to set the order to a specific state. The list of available statuses is provided by the [Order Statuses](/api/stores/v2/order_statuses) resource. If the store has subscribed to Avalara Premium, tax documents are submitted when the `status_id` property changes. The following table details the behavior for `**PUT**` operations. See also the list of [Paid Statuses](#paid-status).

| Existing Status | Status Passed | Resultant Status | Avalara tax document submission |
| --- | --- | --- | --- |
| Any | None | `**Pending**` | None |
| Paid or `**Refunded**` | Paid | Paid | None |
| Unpaid or `**Refunded**` | Unpaid | Unpaid | None |
| Paid or `**Refunded**` | Unpaid | Unpaid | Tax document voided |
| Unpaid or `**Refunded**` | Paid | Paid | Tax document submitted |

### Calculated Fields

Edits to the following properties will trigger a recalculation of the subtotal and total:

*   `products`
*   `discount_amount`
*   `shipping_cost_ex_tax`
*   `shipping_cost_inc_tax`
*   `handling_cost_ex_tax`
*   `handling_cost_inc_tax`
*   `wrapping_cost_ex_tax`
*   `wrapping_cost_inc_tax`
*   `billing_address`
*   `shipping_addresses`

>NOTE: The Orders resource currently does not support coupon redemptions and discounts apart from manual discount. You should only modify the above fields if you have created the order via the POST operation or you intend to override the subtotals and totals manually.</span>

## Delete an Order

Deletes an order.

*   [OAuth](#delete-an-order-oauth)
>`DELETE /stores/{store_hash}/v2/orders/{id}`
*   [Basic Auth](#delete-an-order-basic)
>`DELETE /api/v2/orders/{id}`

### Notes

>NOTE: Attempts to `DELETE` an order on a store with automatic tax enabled will fail and return `405 Method not allowed`.</span>

## Delete All Orders

Deletes all orders in the store.


*   [OAuth](#delete-all-orders-oauth)
>`DELETE /stores/{store_hash}/v2/orders`
*   [Basic Auth](#delete-all-orders-basic)
>`DELETE /api/v2/orders`
