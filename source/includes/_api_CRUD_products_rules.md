## Rules that modify the default behavior of products.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_products`
||`store_v2_products_read_only`

## Operations

*   [List Product Rules](#list-product-rules)
*   [Get a Product Rule](#get-a-product-rule)
*   [Get a Count of Product Rules](#get-a-count-of-product-rules)
*   [Create a Product Rule](#create-a-product-rule)
*   [Update a Product Rule](#update-a-product-rule)
*   [Delete a Product Rule](#delete-a-product-rule)
*   [Delete Multiple Product Rules](#delete-multiple-product-rules)

## List Product Rules

Gets the collection of rules associated with a product. (Default sorting is by rule id, from lowest to highest.)

*   [OAuth](#list-product-rules-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/rules`
*   [Basic Auth](#list-product-rules-basic)
>`GET /api/v2/products/{product_id}/rules`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 product_rules are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/products/{product_id}/rules?page={number}` |
| `Limit` | int | `/api/v2/products/{product_id}/rules?limit={count}` |

```json
[
  {
    "id": 1,
    "product_id": 3,
    "sort_order": 0,
    "is_enabled": true,
    "is_stop": false,
    "price_adjuster": null,
    "weight_adjuster": null,
    "is_purchasing_disabled": false,
    "purchasing_disabled_message": "",
    "is_purchasing_hidden": false,
    "image_file": "attribute_rule_images/1_source.jpg",
    "conditions": [
      {
        "product_option_id": 4,
        "option_value_id": 7,
        "sku_id": null
      }
    ]
  },
  {
    "id": 2,
    "product_id": 3,
    "sort_order": 1,
    "is_enabled": true,
    "is_stop": false,
    "price_adjuster": null,
    "weight_adjuster": null,
    "is_purchasing_disabled": false,
    "purchasing_disabled_message": "",
    "is_purchasing_hidden": false,
    "image_file": "attribute_rule_images/2_source.jpg",
    "conditions": [
      {
        "product_option_id": 4,
        "option_value_id": 8,
        "sku_id": null
      }
    ]
  }
]
```

## Get a Product Rule

Gets a single product rule.

*   [OAuth](#get-a-product-rule-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/rules/{id}`
*   [Basic Auth](#get-a-product-rule-basic)
>`GET /api/v2/products/{product_id}/rules/{id}`

```json
{
  "id": 2,
  "product_id": 3,
  "sort_order": 1,
  "is_enabled": true,
  "is_stop": false,
  "price_adjuster": null,
  "weight_adjuster": null,
  "is_purchasing_disabled": false,
  "purchasing_disabled_message": "",
  "is_purchasing_hidden": false,
  "image_file": "attribute_rule_images/2_source.jpg",
  "conditions": [
    {
      "product_option_id": 4,
      "option_value_id": 8,
      "sku_id": null
    }
  ]
}
```

## Get a Count of Product Rules

Gets a count of the number of product rules in the store.

*   [OAuth](#get-a-count-of-product-rules-oauth)
>`GET /stores/{store_hash}/v2/products/rules/count`
*   [Basic Auth](#get-a-count-of-product-rules-basic)
>`GET /api/v2/products/rules/count`

```json
{
  "count": 3
}
```

## Create a Product Rule

Creates a new product rule.

*   [OAuth](#create-a-product-rule-oauth)
>`POST /stores/{store_hash}/v2/products/{product_id}/rules`
*   [Basic Auth](#create-a-product-rule-basic)
>`POST /api/v2/products/{product_id}/rules`


### Read-only Properties

The following properties of the product rule are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`

### Requirements

The following properties of the product rule are required. The request won’t be fulfilled unless these properties are valid.

*   `conditions`

```json
{
  "id": 10,
  "product_id": 3,
  "sort_order": 1,
  "is_enabled": true,
  "is_stop": false,
  "price_adjuster": null,
  "weight_adjuster": null,
  "is_purchasing_disabled": false,
  "purchasing_disabled_message": "",
  "is_purchasing_hidden": false,
  "image_file": "attribute_rule_images/2_source.jpg",
  "conditions": [
    {
      "product_option_id": 4,
      "option_value_id": 8,
      "sku_id": null
    }
  ]
}
```

## Update a Product Rule

Updates an existing product rule. NOTE: if you include a conditions object array, its contents will be appended to any existing conditions. This operation does not overwrite existing conditions.

*   [OAuth](#update-a-product-rule-oauth)
>`PUT /stores/{store_hash}/v2/products/{product_id}/rules/{id}`
*   [Basic Auth](#update-a-product-rule-basic)
>`PUT /api/v2/products/{product_id}/rules/{id}`

### Read-only Properties

The following properties of the product rule are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`

### Requirements

The following properties of the product rule are required. The request won’t be fulfilled unless these properties are valid.

```json
{
  "id": 2,
  "product_id": 3,
  "sort_order": 2,
  "is_enabled": true,
  "is_stop": false,
  "price_adjuster": null,
  "weight_adjuster": null,
  "is_purchasing_disabled": false,
  "purchasing_disabled_message": "",
  "is_purchasing_hidden": false,
  "image_file": "attribute_rule_images/2_source.jpg",
  "conditions": [
    {
      "product_option_id": 4,
      "option_value_id": 8,
      "sku_id": null
    }
  ]
}
```

## Delete a Product Rule

Deletes a product rule.

*   [OAuth](#delete-a-product-rule-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/rules/{id}`
*   [Basic Auth](#delete-a-product-rule-basic)
>`DELETE /api/v2/products/{product_id}/rules/{id}`

## Delete Multiple Product Rules

Deletes multiple product rules.

*   [OAuth](#delete-multiple-product-rules-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/rules`
*   [Basic Auth](#delete-multiple-product-rules-basic)
>`DELETE /api/v2/products/{product_id}/rules`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 product_rules are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/products/{product_id}/rules?page={number}` |
| `Limit` | int | `/api/v2/products/{product_id}/rules?limit={count}` |
