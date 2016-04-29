# Coupons

Applies a category or product discount to an order for customers who enter a given code.

|||
|---|---|
| **Managed by** | [Coupons Resource](/api/stores/v2/coupons)

## Coupon Object - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int | coupon id |
| name | string | The name of the coupon. |
| type | enum | The coupon type field is an enumerated field and a value from the following list should be used. per_item_discount per_total_discount shipping_discount free_shipping percentage_discount |
| amount | decimal | The amount is a decimal field which can either be the monetary discount to be applied to an order or a percentage discount to be applied to an order. The type of this field is determined by the coupon type. |
| min_purchase | decimal | This is a decimal field which specifies the minimum value an order must have before the coupon can be applied to it. |
| expires | date | This is a date field which specifies when a coupon expires. Coupons need not have an expiry date as you can also control expiry via max_uses and max_uses_per_customer. The date field must be formatted as per RFC-2822. |
| enabled | boolean | True, if coupon is enabled. False otherwise. |
| code | string | The coupon code which customers will use to receive their discounts. Must be Unique. |
| applies_to | object | This object provides ability to restrict a coupon to an entity type (category/product) and ability to restrict a coupon specific categories/products, where 0 is all categories/products. |
| num_uses | int | Number of times this coupon has been used. This is a readonly field and can't be changed via PUT or POST. |
| max_uses | int | Maximum number of times this coupon can be used. |
| max_uses_per_customer | int | Maximum number of times each customer can use this coupon. |
| restricted_to | object | This field provides the ability to restrict coupon usage based on locations as follows If a coupon is restricted by country then a list of ISO2 country codes is provided. To retrieve these you can do a GET request on /countries.json endpoint. "restricted_to": { "countries": ["AU"] } If a coupon is restricted by states then a list of state names is provided indexed by the ISO2 country code for each country. To retrieve these you can do a GET request on /countries.json endpoint and then a GET request on /countries/:id/states.json endpoint. "restricted_to": { "states": { "AU": ["Australian Capital Territory"] } } If a coupon is restricted by zip codes then a list of zip codes indexed by the ISO2 country code for each country is provided as follows. Please refer to this KB article "restricted_to": { "zips": { "AU": ["2000", "20??"] } } |
| shipping_methods | array | This is a list of shipping method names. If a shipping method isn't enabled on the store it can't be used to with a coupon. To check which shipping methods are enabled please do a GET request on the /shipping/methods.json endpoint. |
