# Brands

Brand facets for identifying and categorizing products according to their manufacturer or company metonym.

|||
|---|---|
| **Manages** |
| OAuth Scopes | `store_v2_products`
||`store_v2_products_read_only`


## Operations

*   [List Brands](#list-brands)
*   [Get a Brand](#get-a-brand)
*   [Get a Count of Brands](#get-a-count-of-brands)
*   [Create a Brand](#create-a-brand)
*   [Update a Brand](#update-a-brand)
*   [Delete a Brand](#delete-a-brand)
*   [Delete All Brands](#delete-all-brands)

## List Brands

Gets the collection of brands. (Default sorting is by brand id, from lowest to highest.)

*   [OAuth](#list-brands-oauth)
>`GET /stores/{store_hash}/v2/brands`
*   [Basic Auth](#list-brands-basic)
>`GET /api/v2/brands`

### Filters

Filter parameters can be added to the URL query string to select specific brands in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `name` | string | `/api/v2/brands?name={value}` |
| `min_id` | int | `/api/v2/brands?min_id={value}` |
| `max_id` | int | `/api/v2/brands?max_id={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, Bigcommerce returns up to 50 brands by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/brands?page={number}` |
| `Limit` | int | `/api/v2/brands?limit={count}` |

```json
[
  {
    "id": 1,
    "name": "Apple",
    "page_title": "",
    "meta_keywords": "",
    "meta_description": "",
    "image_file": "",
    "search_keywords": ""
  },
  {
    "id": 2,
    "name": "Microsoft",
    "page_title": "",
    "meta_keywords": "",
    "meta_description": "",
    "image_file": "",
    "search_keywords": ""
  }
]
```

## Get a Brand

Gets a brand.

*   [OAuth](#get-a-brand-oauth)
>`GET /stores/{store_hash}/v2/brands/{id}`
*   [Basic Auth](#get-a-brand-basic)
>`GET /api/v2/brands/{id}`

```json
{
  "id": 1,
  "name": "Apple",
  "page_title": "",
  "meta_keywords": "",
  "meta_description": "",
  "image_file": "",
  "search_keywords": ""
}
```

## Get a Count of Brands

Returns the total number of brands in the store.

*   [OAuth](#get-a-count-of-brands-oauth)
>`GET /stores/{store_hash}/v2/brands/count`
*   [Basic Auth](#get-a-count-of-brands-basic)
>`GET /api/v2/brands/count`

```json
{
  "count": 25
}
```

## Create a Brand

Creates a new brand.


*   [OAuth](#create-a-brand-oauth)
>`POST /stores/{store_hash}/v2/brands`
*   [Basic Auth](#create-a-brand-basic)
>`POST /api/v2/brands`

### Read-only Properties

The following properties of the brand are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`

### Requirements

The following properties of the brand are required. The request won’t be fulfilled unless these properties are valid.

*   `name`

### Notes

To maximize system performance, Bigcommerce caps the number of brands that can be added to a store at 30,000. If your POST causes the store to exceed the maximum of 30,000 brands, Bigcommerce will return a 403 error.

```curl
{
  "name": "Xmen",
  "page_title": "X men brand"
}
```

```json
{
  "id": 10,
  "name": "Xmen",
  "page_title": "X men brand",
  "meta_keywords": null,
  "meta_description": null,
  "image_file": "",
  "search_keywords": ""
}
```

## Update a Brand

Updates an existing brand.

*   [OAuth](#update-a-brand-oauth)
>`PUT /stores/{store_hash}/v2/brands/{id}`
*   [Basic Auth](#update-a-brand-basic)
>`PUT /api/v2/brands/{id}`

### Read-only Properties

The following properties of the brand are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`

### Requirements

The following properties of the brand are required. The request won’t be fulfilled unless these properties are valid.

```json
{
  "id": 10,
  "name": "Xmen",
  "page_title": "X men brand",
  "meta_keywords": null,
  "meta_description": null,
  "image_file": "t/apirmzk0a__43675.jpg",
  "search_keywords": "xmen, awesomeness"
}
```

## Delete a Brand

Deletes a brand.

*   [OAuth](#delete-a-brand-oauth)
">`DELETE /stores/{store_hash}/v2/brands/{id}`
*   [Basic Auth](#delete-a-brand-basic)
>`DELETE /api/v2/brands/{id}`

## Delete All Brands

Deletes all brands belonging to a product.

*   [OAuth](#delete-all-brands-oauth)
>`DELETE /stores/{store_hash}/v2/brands`
*   [Basic Auth](#delete-all-brands-basic)
>`DELETE /api/v2/brands`
