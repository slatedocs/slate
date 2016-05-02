# Orders

The order object contains a record of the purchase agreement between a shopper and a merchant. Returned by GET operations on the orders resource. Can also be passed in PUT and POST operations.

|||
|---|---|
| **Managed by** | [Orders Resource](/api/stores/v2/orders)

## Order Object - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int | The ID of the order, a read-only value. Do not pass in PUT or POST. |
| customer_id | int | The ID of the customer placing the order or 0 if it was a guest order. |
| date_created | date | The date this order was created, if not specified will default to current time. The date should be in RFC format - 'Tue, 20 Nov 2012 00:00:00 +0000' |
| date_modified | date | A read-only value representing the last modification of the order. Do not attempt to modify or set this value in a POST or PUT operation. |
| date_shipped | date | A read-only value representing the date of shipment. Do not attempt to modify or set this value in a POST or PUT operation. |
| status_id | int | The status ID, as detailed in the Order Statuses page (https://developer.bigcommerce.com/api/stores/v2/order_statuses). |
| status | string | The status will include one of the string values listed in the Order Statuses page (https://developer.bigcommerce.com/api/stores/v2/order_statuses). This value is read-only. Do not attempt to modify or set this value in a POST or PUT operation. |
| subtotal_ex_tax | decimal | Override value for subtotal excluding tax. If specified, the field subtotal_inc_tax is also required. |
| subtotal_inc_tax | decimal | Override value for subtotal including tax. If specified, the field subtotal_ex_tax is also required. |
| subtotal_tax | decimal | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. |
| base_shipping_cost | decimal | The value of the base shipping cost |
| shipping_cost_ex_tax | decimal | The value of shipping cost excluding tax |
| shipping_cost_inc_tax | decimal | The value of shipping cost including tax |
| shipping_cost_tax | decimal | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. |
| shipping_cost_tax_class_id | int | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. NOTE: Value ignored if automatic tax enabled on the store. |
| base_handling_cost | decimal | The value of the base handling cost |
| handling_cost_ex_tax | decimal | The value of the handling cost excluding tax |
| handling_cost_inc_tax | decimal | The value of the handling cost including tax |
| handling_cost_tax | decimal | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. |
| handling_cost_tax_class_id | int | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. NOTE: Value ignored if automatic tax enabled on the store. |
| base_wrapping_cost | decimal | The value of the base wrapping cost |
| wrapping_cost_ex_tax | decimal | The value of the wrapping cost excluding tax |
| wrapping_cost_inc_tax | decimal | The value of the wrapping cost including tax |
| wrapping_cost_tax | decimal | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. |
| wrapping_cost_tax_class_id | int | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. NOTE: Value ignored if automatic tax enabled on the store. |
| total_ex_tax | decimal | Override value for the total, excluding tax. If specified, the field total_inc_tax is also required. |
| total_inc_tax | decimal | Override value for the total, including tax. If specified, the field total_ex_tax is also required. |
| total_tax | decimal | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. |
| items_total | int | The total number of items in the order. |
| items_shipped | int | The number of items that has been shipped. |
| payment_method | string | The payment method for this order. Can be one of the following: Manual, Credit Card, cash, Test Payment Gateway, ... |
| payment_provider_id | string | The ID of the payment provider if a payment provider was used. |
| payment_status | enum | A read-only value. Do not attempt to modify or set this value in a POST or PUT operation. |
| refunded_amount | decimal | The amount refunded from this transaction. |
| order_is_digital | boolean | Whether this order is an order for digital products. |
| store_credit_amount | decimal | A read-only value. Do not pass in a POST or PUT. |
| gift_certificate_amount | decimal | A read-only value. Do not pass in a POST or PUT. |
| ip_address | string | IP Address of the customer if known. |
| geoip_country | string | The full country name where the customer made the purchase based on the IP. |
| geoip_country_iso2 | string | The country where the customer made the purchase based on the IP is ISO2 format. |
| currency_id | int | The ID of the currency being used in this transaction. A read-only value. Do not pass in a POST or PUT. |
| currency_code | string | The currency code of the currency being used in this transaction. A read-only value. Do not pass in a POST or PUT. |
| currency_exchange_rate | decimal | A read-only value. Do not pass in a POST or PUT. |
| default_currency_id | int | A read-only value. Do not pass in a POST or PUT. |
| default_currency_code | string | The currency code of the default currency for this type of transaction. A read-only value. Do not pass in a POST or PUT. |
| staff_notes | text | Any additional notes for staff. |
| customer_message | text | Message for the customer. |
| discount_amount | decimal | Amount of discount for this transaction. |
| coupon_discount | decimal | A read-only value. Do not pass in a POST or PUT. |
| shipping_address_count | int | The number of shipping addresses associated with this transaction. A read-only value. Do not pass in a POST or PUT. |
| is_deleted | boolean | Indicates if the order was deleted (archived). A read-only value. Do not pass in a POST or PUT. |
| ebay_order_id | string | If the order was placed through eBay, the eBay order number will be included. Otherwise, the value will be 0. |
| billing_address | object | The billing address object contains the billing address details for this transaction, specifically: first_name, last_name, company, street_1, street_2, city, state, zip, country, country_iso2, phone, and email. Ensure that state names are spelled out in full, e.g., California. Required for POST operations. |
| order_source | string | Orders submitted via the store's website will include a "www" value. Orders submitted via the API will be set to "external". A read-only value. Do not pass in a POST or PUT. |
| external_source | string | For orders submitted or modified via the API, using a PUT or POST operation, you can optionally pass in a value identifying the system used to generate the order. For example, "POS". Otherwise, the value will be null. |
| products | object|array | Refer to https://developer.bigcommerce.com/api/orders/order/products |
| shipping_addresses | object|array | For PUT and POST operations, you can optionally pass a "shipping_addresses" object array containing one or more shipping addresses. If you include more than one, only the first will be used as the API does not currently support shipping to more than one address. If you do not pass a shipping address, the billing address will be used. Refer to the "Order Shipping Address" page for the full list of name/value pairs (https://developer.bigcommerce.com/api/objects/v2/order_shipping_address). Not all fields are required. Refer to "Create order" on the Objects resource page for an example of the syntax. For GET and other operations, the shipping_addresses object will consist of two addresses: the URI of a JSON object containing the shipping address details and a context path which provides an alternate means of retrieving the data, such as if you prefer XML. Refer to "List orders" on the Orders resource page for the syntax. |
| coupons | object | A read-only value. Do not attempt to pass in a PUT or POST. The coupons object contains two name/value pairs. The value paired with "url" is the fully qualified address of the JSON object array containing the details of the coupon(s) associated with this transaction, if any. The value of "resource" is the context path to the "coupons" resource, which represents an alternate means of retrieving the data, such as if you prefer XML. |

## Webhook Events

### Order Created
```
store/order/created
```
Occurs when an order is received from the checkout or when a manual order is created in the control panel.


### Order Updated
```
store/order/updated
```
Occurs when order details are updated through the control panel, or when an order status is changed from the control panel or API

### Order archived
```
store/order/archived
```
Occurs when an order is archived from the control panel.
