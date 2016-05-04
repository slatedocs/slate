## Metadata that describes the store.

|||
|---|---|
| Manages |
| OAuth Scopes | `store_v2_information`
||`store_v2_information_read_only`

## Operations

*   [Get a Store's Information](#get-a-store-s-information)

## Get a Store's Information

Gets metadata about a store.

*   [OAuth](#get-a-store-s-information-oauth)
>`GET /stores/{store_hash}/v2/store`
*   [Basic Auth](#get-a-store-s-information-basic)
>`GET /api/v2/store`

```json
{
  "id": "cl1xgr",
  "domain": "sandbox.mybigcommerce.com",
  "name": "My Sandbox Store",
  "address": "555 Test Way, Quality City, CA 94109, USA",
  "phone": "567-098-9274",
  "admin_email": "admin@bigcommerce.com",
  "order_email": "order@bigcommerce.com",
  "language": "en",
  "currency": "USD",
  "currency_symbol": "$",
  "decimal_separator": ".",
  "thousands_separator": ",",
  "decimal_places": 2,
  "currency_symbol_location": "left",
  "weight_units": "LBS",
  "dimension_units": "Inches",
  "dimension_decimal_places": "2",
  "dimension_decimal_token": ".",
  "dimension_thousands_token": ",",
  "plan_name": "Employee Sandbox",
  "logo": {
    "url": "http://cdn6.bigcommerce.com/s-cl1xgr/product_images/sandbox_logo_lp_1410899221__28020.jpg",
    "mobile_url": false
  },
  "is_price_entered_with_tax": false,
  "active_comparison_modules": [

  ]
}
```
