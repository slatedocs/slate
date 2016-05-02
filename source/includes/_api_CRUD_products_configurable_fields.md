## Configurable fields associated with a product.

|||
|---|---|
| Manages |
| OAuth Scopes | `store_v2_products`
||`store_v2_products_read_only`

## Operations

*   [List Configurable Fields](#list-configurable-fields)
*   [Get a Configurable Field](#get-a-configurable-field)
*   [Get a Count of Configurable Fields](#get-a-count-of-configurable-fields)
*   [Delete a Configurable Field](#delete-a-configurable-field)
*   [Delete Multiple Configurable Fields](#delete-multiple-configurable-fields)

## List Configurable Fields

Gets the collection of configurable fields associated with a product.

*   [OAuth](#list-configurable-fields-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/configurable_fields`
*   [Basic Auth](#list-configurable-fields-basic)
>`GET /api/v2/products/{product_id}/configurable_fields`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 configurable_fields are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/products/{product_id}/configurable_fields?page={number}` |
| `Limit` | int | `/api/v2/products/{product_id}/configurable_fields?limit={count}` |

```json
[
  {
    "id": 1,
    "product_id": 30,
    "name": "Manufacturing Country",
    "type": "T",
    "allowed_file_types": "",
    "max_size": 0,
    "select_options": "",
    "is_required": true,
    "sort_order": 1
  }
]
```

## Get a Configurable Field

Gets a configurable field associated with a product.

*   [OAuth](#get-a-configurable-field-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/configurable_fields/{id}`
*   [Basic Auth](#get-a-configurable-field-basic)
>`GET /api/v2/products/{product_id}/configurable_fields/{id}`

```json
{
  "id": 1,
  "product_id": 30,
  "name": "Manufacturing Country",
  "type": "T",
  "allowed_file_types": "",
  "max_size": 0,
  "select_options": "",
  "is_required": true,
  "sort_order": 1
}
```

## Get a Count of Configurable Fields

Gets a count of the number of configurable fields in the store.

*   [OAuth](#get-a-count-of-configurable-fields-oauth)
>`GET /stores/{store_hash}/v2/products/configurable_fields/count`
*   [Basic Auth](#get-a-count-of-configurable-fields-basic)
>`GET /api/v2/products/configurable_fields/count`

```json
{
  "count": 0
}
```

## Delete a Configurable Field

Deletes a configurable field associated with a product.

*   [OAuth](#delete-a-configurable-field-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/configurable_fields/{id}`
*   [Basic Auth](#delete-a-configurable-field-basic)
>`DELETE /api/v2/products/{product_id}/configurable_fields/{id}`

## Delete Multiple Configurable Fields

Deletes multiple configurable fields associated with a product.

*   [OAuth](#delete-multiple-configurable-fields-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/configurable_fields`
*   [Basic Auth](#delete-multiple-configurable-fields-basic)
>`DELETE /api/v2/products/{product_id}/configurable_fields`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 configurable_fields are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/products/{product_id}/configurable_fields?page={number}` |
| `Limit` | int | `/api/v2/products/{product_id}/configurable_fields?limit={count}` |
