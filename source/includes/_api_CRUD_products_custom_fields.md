## Custom fields associated with a product.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_products`
||`store_v2_products_read_only`

## Operations

*   [List Custom Fields](#list-custom-fields)
*   [Get a Custom Field](#get-a-custom-field)
*   [Get a Count of Custom Fields](#get-a-count-of-custom-fields)
*   [Create a Custom Field](#create-a-custom-field)
*   [Update a Custom Field](#update-a-custom-field)
*   [Delete a Custom Field](#delete-a-custom-field)
*   [Delete Multiple Custom Fields](#delete-multiple-custom-fields)

## List Custom Fields

Gets custom fields associated with a product.

*   [OAuth](#list-custom-fields-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/custom_fields`
*   [Basic Auth](#list-custom-fields-basic)
>`GET /api/v2/products/{product_id}/custom_fields`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 custom_fields are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/products/{product_id}/custom_fields?page={number}` |
| `Limit` | int | `/api/v2/products/{product_id}/custom_fields?limit={count}` |

```json
[
  {
    "id": 1,
    "product_id": 30,
    "name": "Toy manufactured in",
    "text": "USA"
  },
  {
    "id": 2,
    "product_id": 45,
    "name": "Release Date",
    "text": "2013-12-25"
  }
]
```

## Get a Custom Field

Gets a custom field associated with a product.

*   [OAuth](#get-a-custom-field-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/custom_fields/{id}`
*   [Basic Auth](#get-a-custom-field-basic)
>`GET /api/v2/products/{product_id}/custom_fields/{id}`

```json
{
  "id": 2,
  "product_id": 30,
  "name": "Toy manufactured in",
  "text": "USA"
}
```

## Get a Count of Custom Fields

Gets a count of the number of custom fields in the store.

*   [OAuth](#get-a-count-of-custom-fields-oauth)
>`GET /stores/{store_hash}/v2/products/custom_fields/count`
*   [Basic Auth](#get-a-count-of-custom-fields-basic)
>`GET /api/v2/products/custom_fields/count`

```json
{
  "count": 0
}
```

## Create a Custom Field

Creates a new custom field associated with a product

*   [OAuth](#create-a-custom-field-oauth)
>`POST /stores/{store_hash}/v2/products/{product_id}/custom_fields`
*   [Basic Auth](#create-a-custom-field-basic)
>`POST /api/v2/products/{product_id}/custom_fields`

### Read-only Properties

The following properties of the custom field are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `product_id`

### Requirements

The following properties of the custom field are required. The request won’t be fulfilled unless these properties are valid.

*   `name`
*   `text`

```curl
{
  "name": "Release Date",
  "text": "2013-12-25"
}
```

```json
{
  "id": 5,
  "product_id": 45,
  "name": "Release Date",
  "text": "2013-12-25"
}
```

## Update a Custom Field

Updates an existing custom field associated with a product.

*   [OAuth](#update-a-custom-field-oauth)
>`PUT /stores/{store_hash}/v2/products/{product_id}/custom_fields/{id}`
*   [Basic Auth](#update-a-custom-field-basic)
>`PUT /api/v2/products/{product_id}/custom_fields/{id}`

### Read-only Properties

The following properties of the custom field are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `product_id`

### Requirements

The following properties of the custom field are required. The request won’t be fulfilled unless these properties are valid.

*   `name`
*   `text`

```curl
{
  "name": "Release Date",
  "text": "2013-12-31"
}
```

```json
{
  "id": 5,
  "product_id": 45,
  "name": "Release Date",
  "text": "2013-12-31"
}
```

## Delete a Custom Field

Deletes a custom field associated with a product.

*   [OAuth](#delete-a-custom-field-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/custom_fields/{id}`
*   [Basic Auth](#delete-a-custom-field-basic)
>`DELETE /api/v2/products/{product_id}/custom_fields/{id}`

## Delete Multiple Custom Fields

Deletes multiple custom fields associated with a product.

*   [OAuth](#delete-multiple-custom-fields-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/custom_fields`
*   [Basic Auth](#delete-multiple-custom-fields-basic)
>`DELETE /api/v2/products/{product_id}/custom_fields`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 custom_fields are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/products/{product_id}/custom_fields?page={number}` |
| `Limit` | int | `/api/v2/products/{product_id}/custom_fields?limit={count}` |
