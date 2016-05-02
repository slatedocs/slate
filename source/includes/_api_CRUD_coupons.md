## Category or product discounts that can be applied to orders for customers who enter a given code.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_marketing`
||`store_v2_marketing_read_only`


## Operations

*   [List Coupons](#list-coupons)
*   [Get a Coupon](#get-a-coupon)
*   [Get a Count of Coupons](#get-a-count-of-coupons)
*   [Create a Coupon](#create-a-coupon)
*   [Update a Coupon](#update-a-coupon)
*   [Delete a Coupon](#delete-a-coupon)
*   [Delete All Coupons](#delete-all-coupons)

## List Coupons

Gets the collection of coupons. (Default sorting is by coupon/discount id, from lowest to highest.)


*   [OAuth](#list-coupons-oauth)
>`GET /stores/{store_hash}/v2/coupons`
*   [Basic Auth](#list-coupons-basic)
>`GET /api/v2/coupons`

### Filters

Filter parameters can be added to the URL query string to select specific coupons in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `id` | string | `/api/v2/coupons?id={value}` |
| `code` | string | `/api/v2/coupons?code={value}` |
| `name` | string | `/api/v2/coupons?name={value}` |
| `type` | string | `/api/v2/coupons?type={value}` |
| `min_id` | int | `/api/v2/coupons?min_id={value}` |
| `max_id` | int | `/api/v2/coupons?max_id={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 coupons are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/coupons?page={number}` |
| `Limit` | int | `/api/v2/coupons?limit={count}` |

```json
[
  {
    "id": 1,
    "name": "5% off order total",
    "type": "per_item_discount",
    "amount": "5.0000",
    "min_purchase": "0.0000",
    "expires": "",
    "enabled": true,
    "code": "4F75AF0C3802D39",
    "applies_to": {
      "entity": "categories",
      "ids": [
        0
      ]
    },
    "num_uses": 0,
    "max_uses": 0,
    "max_uses_per_customer": 0,
    "restricted_to": {
      "countries": [
        "AU"
      ]
    },
    "shipping_methods": null
  },
  {
    "id": 2,
    "name": "10% off order total",
    "type": "per_item_discount",
    "amount": "10.0000",
    "min_purchase": "0.0000",
    "expires": "",
    "enabled": true,
    "code": "CBD1455FDA13815",
    "applies_to": {
      "entity": "categories",
      "ids": [
        0
      ]
    },
    "num_uses": 0,
    "max_uses": 0,
    "max_uses_per_customer": 0,
    "restricted_to": {
      "states": {
        "AU": [
          "Australian Capital Territory"
        ]
      }
    },
    "shipping_methods": null
  },
  {
    "id": 3,
    "name": "Free shipping",
    "type": "free_shipping",
    "amount": "0.0000",
    "min_purchase": "0.0000",
    "expires": "",
    "enabled": true,
    "code": "7E97D5F3F75FA2D",
    "applies_to": {
      "entity": "categories",
      "ids": [
        0
      ]
    },
    "num_uses": 0,
    "max_uses": 0,
    "max_uses_per_customer": 0,
    "restricted_to": {
      "zips": {
        "AU": [
          "2000",
          "20??"
        ]
      }
    },
    "shipping_methods": null
  },
  {
    "id": 4,
    "name": "$5 off shipping",
    "type": "shipping_discount",
    "amount": "5.0000",
    "min_purchase": "0.0000",
    "expires": "",
    "enabled": true,
    "code": "DC0C1CC8807DAC8",
    "applies_to": {
      "entity": "categories",
      "ids": [
        0
      ]
    },
    "num_uses": 0,
    "max_uses": 0,
    "max_uses_per_customer": 0,
    "restricted_to": null,
    "shipping_methods": null
  },
  {
    "id": 5,
    "name": "only for shipping_flatrate",
    "type": "0",
    "amount": "0.0000",
    "min_purchase": "100.0000",
    "expires": "Thu, 31 Jan 2013 00:00:00 +0000",
    "enabled": false,
    "code": "shippingFlatrate-2",
    "applies_to": {
      "entity": "products",
      "ids": [
        32
      ]
    },
    "num_uses": 0,
    "max_uses": 10,
    "max_uses_per_customer": 0,
    "restricted_to": null,
    "shipping_methods": [
      "shipping_flatrate"
    ]
  }
]
```

## Get a Coupon

Gets a coupon.

*   [OAuth](#get-a-coupon-oauth)
>`GET /stores/{store_hash}/v2/coupons/{id}`
*   [Basic Auth](#get-a-coupon-basic)
">`GET /api/v2/coupons/{id}`

```json
{
  "id": 1,
  "name": "5% off order total",
  "type": "per_item_discount",
  "amount": "5.0000",
  "min_purchase": "0.0000",
  "expires": "",
  "enabled": true,
  "code": "4F75AF0C3802D39",
  "applies_to": {
    "entity": "categories",
    "ids": [
      0
    ]
  },
  "num_uses": 0,
  "max_uses": 0,
  "max_uses_per_customer": 0,
  "restricted_to": null,
  "shipping_methods": null
}
```

## Get a Count of Coupons

Gets a count of the number of coupons in the store.

*   [OAuth](#get-a-count-of-coupons-oauth)
>`GET /stores/{store_hash}/v2/coupons/count`
*   [Basic Auth](#get-a-count-of-coupons-basic)
>`GET /api/v2/coupons/count`

```json
{
  "count": 65
}
```

## Create a Coupon

Creates a new coupon.

*   [OAuth](#create-a-coupon-oauth)
>`POST /stores/{store_hash}/v2/coupons`
*   [Basic Auth](#create-a-coupon-basic)
>`POST /api/v2/coupons`

### Read-only Properties

The following properties of the coupon are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `num_uses`

### Requirements

The following properties of the coupon are required. The request won’t be fulfilled unless these properties are valid.

*   `name`
*   `code`
*   `type`
*   `amount`
*   `applies_to`

### Notes

The coupon type can be one of the following:

*   per_item_discount
*   per_total_discount
*   shipping_discount
*   free_shipping
*   percentage_discount

```curl
{
  "name": "5% off order total",
  "type": "per_item_discount",
  "code": "4F75AF0C3802D39",
  "enabled": true,
  "amount": "5",
  "applies_to": {
    "entity": "categories",
    "ids": [
      0
    ]
  }
}
```

```json
{
  "id": 1,
  "name": "5% off order total",
  "type": "per_item_discount",
  "amount": "5.0000",
  "min_purchase": "0.0000",
  "expires": "",
  "enabled": true,
  "code": "4F75AF0C3802D39",
  "applies_to": {
    "entity": "categories",
    "ids": [
      0
    ]
  },
  "num_uses": 0,
  "max_uses": 0,
  "max_uses_per_customer": 0,
  "restricted_to": null,
  "shipping_methods": null
}
```

## Update a Coupon

Updates an existing coupon.

*   [OAuth](#update-a-coupon-oauth)
>`PUT /stores/{store_hash}/v2/coupons/{id}`
*   [Basic Auth](#update-a-coupon-basic)
>`PUT /api/v2/coupons/{id}`

### Read-only Properties

The following properties of the coupon are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `num_uses`

### Requirements

The following properties of the coupon are required. The request won’t be fulfilled unless these properties are valid.

```json
{
  "id": 1,
  "name": "5% off order total",
  "type": "per_item_discount",
  "amount": "5.0000",
  "min_purchase": "0.0000",
  "expires": "",
  "enabled": true,
  "code": "4F75AF0C3802D39",
  "applies_to": {
    "entity": "categories",
    "ids": [
      0
    ]
  },
  "num_uses": 0,
  "max_uses": 0,
  "max_uses_per_customer": 0,
  "restricted_to": null,
  "shipping_methods": null
}
```
## Delete a Coupon

Deletes a coupon.

*   [OAuth](#delete-a-coupon-oauth)
>`DELETE /stores/{store_hash}/v2/coupons/{id}`
*   [Basic Auth](#delete-a-coupon-basic)
>`DELETE /api/v2/coupons/{id}`

## Delete All Coupons

Deletes all coupons in the store.

*   [OAuth](#delete-all-coupons-oauth)
>`DELETE /stores/{store_hash}/v2/coupons`
*   [Basic Auth](#delete-all-coupons-basic)
>`DELETE /api/v2/coupons`
