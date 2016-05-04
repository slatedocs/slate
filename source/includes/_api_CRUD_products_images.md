## Product Images Resource – Operations

Images associated with a product.

|||
|---|---|
| Manages | [Product Image Object](/api/?BasicAuth#product-image-properties) |
| OAuth Scopes | `store_v2_products`
||`store_v2_products_read_only`

**Operations**

*   [List Product Images](#list-product-images)
*   [Get a Product Image](#get-a-product-image)
*   [Get a Count of Product Images](#get-a-count-of-product-images)
*   [Create a Product Image](#create-a-product-image)
*   [Update a Product Image](#update-a-product-image)
*   [Delete a Product Image](#delete-a-product-image)
*   [Delete Multiple Product Images](#delete-multiple-product-images)

## List Product Images

Gets the images associated with a product. (Default sorting is by image id, from lowest to highest.)

*   [OAuth](#list-product-images-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/images`
*   [Basic Auth](#list-product-images-basic)
>`GET /api/v2/products/{product_id}/images`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 product_images are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `page` | int | `/api/v2/products/{product_id}/images?page={number}` |
| `limit` | int | `/api/v2/products/{product_id}/images?limit={count}` |

```json
[
  {
    "id": 247,
    "product_id": 32,
    "image_file": "sample_images/in_123__14581.jpg",
    "zoom_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.1280.1280.jpg?c=1",
    "thumbnail_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.386.513.jpg?c=1",
    "standard_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.220.290.jpg?c=1",
    "tiny_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.44.58.jpg?c=1",
    "is_thumbnail": true,
    "sort_order": 0,
    "description": null,
    "date_created": "Mon, 24 Sep 2012 01:14:30 +0000"
  },
  {
    "id": 248,
    "product_id": 32,
    "image_file": "sample_images/in_122__93910.jpg",
    "zoom_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/248/in_122__93910.1393831046.1280.1280.jpg?c=1",
    "thumbnail_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/248/in_122__93910.1393831046.386.513.jpg?c=1",
    "standard_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/248/in_122__93910.1393831046.220.290.jpg?c=1",
    "tiny_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/248/in_122__93910.1393831046.44.58.jpg?c=1",
    "is_thumbnail": false,
    "sort_order": 1,
    "description": null,
    "date_created": "Mon, 24 Sep 2012 01:17:14 +0000"
  }
]
```

## Get a Product Image

Gets a product image.

*   [OAuth](#get-a-product-image-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/images/{id}`
*   [Basic Auth](#get-a-product-image-basic)
>`GET /api/v2/products/{product_id}/images/{id}`

```json
{
  "id": 248,
  "product_id": 32,
  "image_file": "sample_images/in_122__93910.jpg",
  "zoom_url": "https://cdn.bcapp.dev/bcapp/et7xe3pz/products/32/images/248/in_122__93910.1393831046.1280.1280.jpg?c=1",
  "thumbnail_url": "https://cdn.bcapp.dev/bcapp/et7xe3pz/products/32/images/248/in_122__93910.1393831046.386.513.jpg?c=1",
  "standard_url": "https://cdn.bcapp.dev/bcapp/et7xe3pz/products/32/images/248/in_122__93910.1393831046.220.290.jpg?c=1",
  "tiny_url": "https://cdn.bcapp.dev/bcapp/et7xe3pz/products/32/images/248/in_122__93910.1393831046.44.58.jpg?c=1",
  "is_thumbnail": false,
  "sort_order": 1,
  "description": null,
  "date_created": "Mon, 24 Sep 2012 01:17:14 +0000"
}
```

## Get a Count of Product Images

Gets a count of the number of product images in the store.

*   [OAuth](#get-a-count-of-product-images-oauth)
>`GET /stores/{store_hash}/v2/products/images/count`
*   [Basic Auth](#get-a-count-of-product-images-basic)
>`GET /api/v2/products/images/count`

```json
{
  "count": 105
}
```

## Create a Product Image

Creates a new product image.

*   [OAuth](#create-a-product-image-oauth)
>`POST /stores/{store_hash}/v2/products/{product_id}/images`
*   [Basic Auth](#create-a-product-image-basic)
>`POST /api/v2/products/{product_id}/images`

### Read-only Properties

The following properties of the product image are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `date_created`
*   `product_id`

### Requirements

The following properties of the product image are required. The request won’t be fulfilled unless these properties are valid.

*   `image_file`

```json
{
  "id": 116,
  "product_id": 29,
  "image_file": "p/022/astonishing-x-men-1-100k__36562.jpg",
  "is_thumbnail": false,
  "sort_order": 0,
  "description": "",
  "date_created": "Fri, 21 Dec 2012 18:54:04 +0000"
}
```

## Update a Product Image

Updates an existing product image.

*   [OAuth](#update-a-product-image-oauth)
>`PUT /stores/{store_hash}/v2/products/{product_id}/images/{id}`
*   [Basic Auth](#update-a-product-image-basic)
>`PUT /api/v2/products/{product_id}/images/{id}`

### Read-only Properties

The following properties of the product image are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`
*   `date_created`

### Requirements

The following properties of the product image are required. The request won’t be fulfilled unless these properties are valid.

```json
{
  "id": 118,
  "product_id": 30,
  "image_file": "k/392/ud2vk0n1l0zcfr7gtlqi__43888.png",
  "is_thumbnail": false,
  "sort_order": 1,
  "description": "",
  "date_created": "Fri, 21 Dec 2012 19:01:03 +0000"
}
```

## Delete a Product Image

Deletes a product image.

*   [OAuth](#delete-a-product-image-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/images/{id}`
*   [Basic Auth](#delete-a-product-image-basic)
>`DELETE /api/v2/products/{product_id}/images/{id}`

## Delete Multiple Product Images

Deletes multiple product images.

*   [OAuth](#delete-multiple-product-images-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/images`
*   [Basic Auth](#delete-multiple-product-images-basic)
>`DELETE /api/v2/products/{product_id}/images`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 product_images are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/products/{product_id}/images?page={number}` |
| `Limit` | int | `/api/v2/products/{product_id}/images?limit={count}` |
