## Embedded videos displayed on product listings.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_products`
||`store_v2_products_read_only`

## Operations

*   [List Product Videos](#list-product-videos)
*   [Get a Product Video](#get-a-product-video)
*   [Get a Count of Product Videos](#get-a-count-of-product-videos)
*   [Create a Product Video](#create-a-product-video)
*   [Update Product Video Metadata](#update-product-video-metadata)
*   [Delete a Product Video](#delete-a-product-video)
*   [Delete All Product Videos](#delete-all-product-videos)

## List Product Videos

Gets the videos associated with a product.

*   [OAuth](#list-product-videos-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/videos`
*   [Basic Auth](#list-product-videos-basic)
>`GET /api/v2/products/{product_id}/videos`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 product_videos are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `page` | int | `/api/v2/products/{product_id}/videos?page={number}` |
| `limit` | int | `/api/v2/products/{product_id}/videos?limit={count}` |

```json
[
  {
    "id": "UmhvxsOwhqk",
    "product_id": 30,
    "sort_order": 0,
    "name": "X-Men Evolution: Season 1, Episode 1"
  }
]
```

## Get a Product Video

Gets a product video.

*   [OAuth](#get-a-product-video-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/videos/{id}`
*   [Basic Auth](#get-a-product-video-basic)
>`GET /api/v2/products/{product_id}/videos/{id}`

## Get a Count of Product Videos

Gets a count of the number of product videos in the store.

*   [OAuth](#get-a-count-of-product-videos-oauth)
>`GET /stores/{store_hash}/v2/products/videos/count`
*   [Basic Auth](#get-a-count-of-product-videos-basic)
>`GET /api/v2/products/videos/count`

```json
{
  "count": 0
}
```

## Create a Product Video

Adds a link to a YouTube video to a product.

*   [OAuth](#create-a-product-video-oauth)
>`POST /stores/{store_hash}/v2/products/{product_id}/videos`
*   [Basic Auth](#create-a-product-video-basic)
>`POST /api/v2/products/{product_id}/videos`

### Read-only Properties

The following properties of the product video are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`

### Requirements

The following properties of the product video are required. The request won’t be fulfilled unless these properties are valid.

*   `url`

### Notes

Only YouTube videos are supported. To create a new video, pass the full `url` in the request body.

```curl
{
  "url": "https://www.youtube.com/watch?v=4wZ3ZG_Wams"
}
```

## Update Product Video Metadata

Edit the metadata of a product video.

*   [OAuth](#update-product-video-metadata-oauth)
>`PUT /stores/{store_hash}/v2/products/{product_id}/videos/{id}`
*   [Basic Auth](#update-product-video-metadata-basic)
>`PUT /api/v2/products/{product_id}/videos/{id}`

### Read-only Properties

The following properties of the product video are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`

### Notes

The `name`, `sort_order` and `url` properties of the product video are editable.

Posting a new `url` will update the `id` of the video to reference the new video.

```curl
{
  "name": "New video title",
  "sort_order": 2
}
```

## Delete a Product Video

Delete a product video.

*   [OAuth](#delete-a-product-video-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/videos/{id}`
*   [Basic Auth](#delete-a-product-video-basic)
>`DELETE /api/v2/products/{product_id}/videos/{id}`

## Delete All Product Videos

Deletes all videos belonging to a product.

*   [OAuth](#delete-all-product-videos-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/videos`
*   [Basic Auth](#delete-all-product-videos-basic)
>`DELETE /api/v2/products/{product_id}/videos`
