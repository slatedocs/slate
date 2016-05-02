## A reusable set of option facets that can be applied to products.

|||
|---|---|
| Manages |
| OAuth Scopes | `store_v2_products`
||`store_v2_products_read_only`

## Operations

*   [List Option Sets](#list-option-sets)
*   [Get an Option Set](#get-an-option-set)
*   [Get a Count of Option Sets](#get-a-count-of-option-sets)
*   [Create an Option Set](#create-an-option-set)
*   [Update an Option Set](#update-an-option-set)
*   [Delete an Option Set](#delete-an-option-set)
*   [Delete All Option Sets](#delete-all-option-sets)

## List Option Sets

Gets the collection of option sets. (Default sorting is by option-set id, from lowest to highest.)

*   [OAuth](#list-option-sets-oauth)
>`GET /stores/{store_hash}/v2/option_sets`
*   [Basic Auth](#list-option-sets-basic)
>`GET /api/v2/option_sets`

### Filters

Filter parameters can be added to the URL query string to select specific option_sets in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `name` | string | `/api/v2/option_sets?name={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 option_sets are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/option_sets?page={number}` |
| `Limit` | int | `/api/v2/option_sets?limit={count}` |

```json
[
  {
    "id": 1,
    "name": "MacBook",
    "options": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/optionsets/1/options.json",
      "resource": "/optionsets/1/options"
    }
  },
  {
    "id": 2,
    "name": "PixelSkin Case",
    "options": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/optionsets/2/options.json",
      "resource": "/optionsets/2/options"
    }
  }
]
```

## Get an Option Set

Gets an option set.

*   [OAuth](#get-an-option-set-oauth)
>`GET /stores/{store_hash}/v2/option_sets/{id}`
*   [Basic Auth](#get-an-option-set-basic)
>`GET /api/v2/option_sets/{id}`

```json
{
  "id": 10,
  "name": "T-Shirt Facets",
  "options": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/optionsets/10/options.json",
    "resource": "/optionsets/13/options"
  }
}
```

## Get a Count of Option Sets

Gets a count of the number of option sets in the store.

*   [OAuth](#get-a-count-of-option-sets-oauth)
>`GET /stores/{store_hash}/v2/option_sets/count`
*   [Basic Auth](#get-a-count-of-option-sets-basic)
>`GET /api/v2/option_sets/count`

```json
{
  "count": 4
}
```

## Create an Option Set

Creates a new Option set.

*   [OAuth](#create-an-option-set-oauth)
>`POST /stores/{store_hash}/v2/option_sets`
*   [Basic Auth](#create-an-option-set-basic)
>`POST /api/v2/option_sets`

### Read-only Properties

The following properties of the option set are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `options`

### Requirements

The following properties of the option set are required. The request won’t be fulfilled unless these properties are valid.

*   `name`

```curl
{
  "name": "T-Shirts"
}
```

```json
{
  "id": 10,
  "name": "T-Shirts",
  "options": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/optionsets/10/options.json",
    "resource": "/optionsets/10/options"
  }
}
```

## Update an Option Set

Updates an existing option set.

*   [OAuth](#update-an-option-set-oauth)
>`PUT /stores/{store_hash}/v2/option_sets/{id}`
*   [Basic Auth](#update-an-option-set-basic)
>`PUT /api/v2/option_sets/{id}`


### Read-only Properties

The following properties of the option set are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `options`

### Requirements

The following properties of the option set are required. The request won’t be fulfilled unless these properties are valid.

*   `name`

```curl
{
  "name": "T-shirt Facets"
}
```

```json
{
  "id": 10,
  "name": "T-shirt Facets",
  "options": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/optionsets/10/options.json",
    "resource": "/optionsets/13/options"
  }
}
```

## Delete an Option Set

Deletes an option set.

*   [OAuth](#delete-an-option-set-oauth)
>`DELETE /stores/{store_hash}/v2/option_sets/{id}`
*   [Basic Auth](#delete-an-option-set-basic)
>`DELETE /api/v2/option_sets/{id}`

## Delete All Option Sets

Deletes all option sets in the store.

*   [OAuth](#delete-all-option-sets-oauth)
>`DELETE /stores/{store_hash}/v2/option_sets`
*   [Basic Auth](#delete-all-option-sets-basic)
>`DELETE /api/v2/option_sets`
