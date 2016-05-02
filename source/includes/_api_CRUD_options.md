## Shared attributes that control value facets on a product.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_products`
||`store_v2_products_read_only`

## Operations

*   [List Options](#list-options)
*   [Get an Option](#get-an-option)
*   [Get a Count of Options](#get-a-count-of-options)
*   [Create an Option](#create-an-option)
*   [Update an Option](#update-an-option)
*   [Delete an Option](#delete-an-option)
*   [Delete All Options](#delete-all-options)

## List Options

Gets the collection of options. (Default sorting is by option id, from lowest to highest.)

*   [OAuth](#list-options-oauth)
>`GET /stores/{store_hash}/v2/options`
*   [Basic Auth](#list-options-basic)
>`GET /api/v2/options`

### Filters

Filter parameters can be added to the URL query string to select specific options in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `name` | string | `/api/v2/options?name={value}` |
| `display_name` | string | `/api/v2/options?display_name={value}` |
| `type` | string | `/api/v2/options?type={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 options are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/options?page={number}` |
| `Limit` | int | `/api/v2/options?limit={count}` |

```json
[
  {
    "id": 3,
    "name": "Colors",
    "display_name": "Color",
    "type": "CS",
    "values": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/options/3/values.json",
      "resource": "/options/3/values"
    }
  },
  {
    "id": 4,
    "name": "Screen Sizes",
    "display_name": "Screen Sizes",
    "type": "RT",
    "values": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/options/4/values.json",
      "resource": "/options/4/values"
    }
  }
]
```

## Get an Option

Gets an option.

*   [OAuth](#get-an-option-oauth)
>`GET /stores/{store_hash}/v2/options/{id}`
*   [Basic Auth](#get-an-option-basic)
>`GET /api/v2/options/{id}`

```json
{
  "id": 3,
  "name": "Colors",
  "display_name": "Color",
  "type": "CS",
  "values": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/options/3/values.json",
    "resource": "/options/3/values"
  }
}
```

## Get a Count of Options

Gets a count of the number of options in the store.

*   [OAuth](#get-a-count-of-options-oauth)
>`GET /stores/{store_hash}/v2/options/count`
*   [Basic Auth](#get-a-count-of-options-basic)
>`GET /api/v2/options/count`

```json
{
  "count": 4
}
```

## Create an Option

Creates a new option.

*   [OAuth](#create-an-option-oauth)
>`POST /stores/{store_hash}/v2/options`
*   [Basic Auth](#create-an-option-basic)
>`POST /api/v2/options`

### Read-only Properties

The following properties of the option are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `values`

### Requirements

The following properties of the option are required. The request won’t be fulfilled unless these properties are valid.

*   `name`
*   `type`

```curl
{
  "name": "Color",
  "display_name": "Color",
  "type": "CS"
}
```

```json
{
  "id": 10,
  "name": "Color",
  "display_name": "Color",
  "type": "CS",
  "values": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/options/10/values.json",
    "resource": "/options/10/values"
  }
}
```

## Update an Option

Updates an existing option.

*   [OAuth](#update-an-option-oauth)
>`PUT /stores/{store_hash}/v2/options/{id}`
*   [Basic Auth](#update-an-option-basic)
>`PUT /api/v2/options/{id}`

### Read-only Properties

The following properties of the option are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `values`

### Requirements

The following properties of the option are required. The request won’t be fulfilled unless these properties are valid.

```curl
{
  "name": "Xmen toys",
  "display_name": "xmen extreme toys",
  "type": "T"
}
```

```json
{
  "id": 18,
  "name": "Xmen toys",
  "display_name": "xmen extreme toys",
  "type": "T",
  "values": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/options/18/values.json",
    "resource": "/options/18/values"
  }
}
```

## Delete an Option

Deletes an option.

*   [OAuth](#delete-an-option-oauth)
>`DELETE /stores/{store_hash}/v2/options/{id}`
*   [Basic Auth](#delete-an-option-basic)
>`DELETE /api/v2/options/{id}`

## Delete All Options

Deletes all options from the store.

*   [OAuth](#delete-all-options-oauth)
>`DELETE /stores/{store_hash}/v2/options`
*   [Basic Auth](#delete-all-options-basic)
>`DELETE /api/v2/options`
