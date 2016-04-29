## Stock Keeping Unit identifiers associated with products.

|||
|---|---
| **Manages** |
| **OAuth Scopes** | `store_v2_products`
||`store_v2_products_read_only`

## Operations

*   [List Product SKUs](#list-product-skus)
*   [Get a Product SKU](#get-a-product-sku)
*   [Get a Count of Product SKUs](#get-a-count-of-product-skus)
*   [Create a Product SKU](#create-a-product-sku)
*   [Update a Product SKU](#update-a-product-sku)
*   [Delete a Product SKU](#delete-a-product-sku)
*   [Delete Multiple Product SKUs](#delete-multiple-product-skus)

## List Product SKUs

Gets the collection of SKUs associated with a product.

*   [OAuth](#list-product-skus-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/skus`
*   [Basic Auth](#list-product-skus-basic)
>`GET /api/v2/products/{product_id}/skus`

### Filters

Filter parameters can be added to the URL query string to select specific skus in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| min_id | int | /api/v2/products/{product_id}/skus?min_id={value} |
| max_id | int | /api/v2/products/{product_id}/skus?max_id={value} |
| sku | string | /api/v2/products/{product_id}/skus?sku={value} |
| upc | string | /api/v2/products/{product_id}/skus?upc={value} |
| inventory_level | string | /api/v2/products/{product_id}/skus?inventory_level={value} |
| inventory_warning_level | string | /api/v2/products/{product_id}/skus?inventory_warning_level={value} |
| bin_picking_number | string | /api/v2/products/{product_id}/skus?bin_picking_number={value} |
| min_inventory_level | int | /api/v2/products/{product_id}/skus?min_inventory_level={value} |
| max_inventory_level | int | /api/v2/products/{product_id}/skus?max_inventory_level={value} |
| is_low_inventory | boolean | /api/v2/products/{product_id}/skus?is_low_inventory={value} |
| product_hash | int | /api/v2/products/{product_id}/skus?product_hash={value} |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 skus are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| Page | int | /api/v2/products/{product_id}/skus?page={number} |
| Limit | int | /api/v2/products/{product_id}/skus?limit={count} |

```json
[
  {
    "id": 1,
    "product_id": 5,
    "sku": "MB-1",
    "cost_price": "0.0000",
    "upc": "",
    "inventory_level": 0,
    "inventory_warning_level": 0,
    "bin_picking_number": "",
    "options": [
      {
        "product_option_id": 15,
        "option_value_id": 17
      },
      {
        "product_option_id": 16,
        "option_value_id": 28
      }
    ]
  },
  {
    "id": 2,
    "product_id": 5,
    "sku": "MB-2",
    "cost_price": "0.0000",
    "upc": "",
    "inventory_level": 0,
    "inventory_warning_level": 0,
    "bin_picking_number": "",
    "options": [
      {
        "product_option_id": 15,
        "option_value_id": 18
      },
      {
        "product_option_id": 16,
        "option_value_id": 26
      }
    ]
  }
]
```

## Get a Product SKU

Gets a single product SKU.

*   [OAuth](#get-a-product-sku-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/skus/{id}`
*   [Basic Auth](#get-a-product-sku-basic)
>`GET /api/v2/products/{product_id}/skus/{id}`

```json
{
  "id": 5,
  "product_id": 7,
  "sku": "MBA-1atest",
  "cost_price": "0.0000",
  "upc": "",
  "inventory_level": 0,
  "inventory_warning_level": 0,
  "bin_picking_number": "",
  "options": [
    {
      "product_option_id": 20,
      "option_value_id": 51
    }
  ]
}
```

## Get a Count of Product SKUs

Gets a count of the number of product SKUs in the store.

*   [OAuth](#get-a-count-of-product-skus-oauth)
>`GET /stores/{store_hash}/v2/products/skus/count`
*   [Basic Auth](#get-a-count-of-product-skus-basic)
>`GET /api/v2/products/skus/count`

```json
{
  "count": 1235
}
```

## Create a Product SKU

Creates a new product SKU.

*   [OAuth](#create-a-product-sku-oauth)
>`POST /stores/{store_hash}/v2/products/{product_id}/skus`
*   [Basic Auth](#create-a-product-sku-basic)
>`POST /api/v2/products/{product_id}/skus`

### Read-only Properties

The following properties of the sku are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`

### Requirements

The following properties of the sku are required. The request won’t be fulfilled unless these properties are valid.

*   `sku`
*   `options`

### Notes

To maximize system performance, Bigcommerce caps the number of SKUs associated with a product at 500. If you attempt to add a SKU to a product that has 500 SKUs, Bigcommerce will return a 403 error.

```json
{
  "id": 5,
  "product_id": 7,
  "sku": "MBA-1atest",
  "cost_price": "0.0000",
  "upc": "",
  "inventory_level": 0,
  "inventory_warning_level": 0,
  "bin_picking_number": "",
  "options": [
    {
      "product_option_id": 20,
      "option_value_id": 51
    }
  ]
}
```

## Update a Product SKU

Updates an existing product SKU.

*   [OAuth](#update-a-product-sku-oauth)
>`PUT /stores/{store_hash}/v2/products/{product_id}/skus/{id}`
*   [Basic Auth](#update-a-product-sku-basic)
>`PUT /api/v2/products/{product_id}/skus/{id}`


### Read-only Properties

The following properties of the sku are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`

### Requirements

The following properties of the sku are required. The request won’t be fulfilled unless these properties are valid.

```json
{
  "id": 5,
  "product_id": 7,
  "sku": "MBA-1atest",
  "cost_price": "2.9900",
  "upc": "",
  "inventory_level": 0,
  "inventory_warning_level": 0,
  "bin_picking_number": "",
  "options": [
    {
      "product_option_id": 20,
      "option_value_id": 51
    }
  ]
}
```

## Delete a Product SKU

Deletes a product SKU.

*   [OAuth](#delete-a-product-sku-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/skus/{id}`
*   [Basic Auth](#delete-a-product-sku-basic)
>`DELETE /api/v2/products/{product_id}/skus/{id}`

## Delete Multiple Product SKUs

Deletes multiple product SKUs.

*   [OAuth](#delete-multiple-product-skus-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/skus`
*   [Basic Auth](#delete-multiple-product-skus-basic)
>`DELETE /api/v2/products/{product_id}/skus`

### Filters

Filter parameters can be added to the URL query string to select specific skus in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `min_id` | int | `/api/v2/products/{product_id}/skus?min_id={value}` |
| `max_id` | int | `/api/v2/products/{product_id}/skus?max_id={value}` |
| `sku` | string | `/api/v2/products/{product_id}/skus?sku={value}` |
| `upc` | string | `/api/v2/products/{product_id}/skus?upc={value}` |
| `inventory_level` | string | `/api/v2/products/{product_id}/skus?inventory_level={value}` |
| `inventory_warning_level` | string | `/api/v2/products/{product_id}/skus?inventory_warning_level={value}` |
| `bin_picking_number` | string | `/api/v2/products/{product_id}/skus?bin_picking_number={value}` |
| `min_inventory_level` | int | `/api/v2/products/{product_id}/skus?min_inventory_level={value}` |
| `max_inventory_level` | int | `/api/v2/products/{product_id}/skus?max_inventory_level={value}` |
| `is_low_inventory` | boolean | `/api/v2/products/{product_id}/skus?is_low_inventory={value}` |
| `product_hash` | int | `/api/v2/products/{product_id}/skus?product_hash={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 skus are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `page` | int | `/api/v2/products/{product_id}/skus?page={number}` |
| `limit` | int | `/api/v2/products/{product_id}/skus?limit={count}` |
