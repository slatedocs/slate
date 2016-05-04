## Reviews associated with a product.

|||
|---|---|
| **Manages** | [Product Review Object](/api/objects/v2/product_review)|
| **OAuth Scopes** | `store_v2_products`
||`store_v2_products_read_only`

## Operations

*   [List Product Reviews](#list-product-reviews)
*   [Get a Product Review](#get-a-product-review)
*   [Create a Product Review](#create-a-product-review)
*   [Update a Product Review](#update-a-product-review)
*   [Delete a Product Review](#delete-a-product-review)
*   [Delete All Product Reviews](#delete-all-product-reviews)

## List Product Reviews

Gets the reviews associated with a product. (Default sorting is by review id, from lowest to highest.)

*   [OAuth](#list-product-reviews-oauth)
>`GET /stores/{store_hash}/v2/products/{id}/reviews`
*   [Basic Auth](#list-product-reviews-basic)
>`GET /api/v2/products/{id}/reviews`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 product_reviews are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `page` | int | `/api/v2/products/{product_id}/reviews?page={number}` |
| `limit` | int | `/api/v2/products/{product_id}/reviews?limit={count}` |

```json
[
  {
    "id": 190,
    "product_id": 5310,
    "author": "John Doe",
    "date_created": "Wed, 12 Dec 2012 06:00:00 +0000",
    "title": "My experience with the widget",
    "review": "This widget worked for me, but might not work for everyone.",
    "rating": 4,
    "status": 1
  },
  {
    "id": 191,
    "product_id": 5310,
    "author": "Jane Doe",
    "date_created": "Tue, 12 Nov 2013 06:00:00 +0000",
    "title": "Great product, slow shipping",
    "review": "Took two weeks to arrive",
    "rating": 3,
    "status": 1
  },
  {
    "id": 192,
    "product_id": 5310,
    "author": "Jimmy Doe",
    "date_created": "Fri, 14 Dec 2012 06:00:00 +0000",
    "title": "Worked for me!",
    "review": "I thought this product was pretty good",
    "rating": 5,
    "status": 1
  }
]
```

## Get a Product Review

Gets a product review.

*   [OAuth](#get-a-product-review-oauth)
>`GET /stores/{store_hash}/v2/products/{product_id}/reviews/{id}`
*   [Basic Auth](#get-a-product-review-basic)
>`GET /api/v2/products/{product_id}/reviews/{id}`

```json
{
  "id": 190,
  "product_id": 5310,
  "author": "John Doe",
  "date_created": "Wed, 12 Dec 2012 06:00:00 +0000",
  "title": "My experience with the widget",
  "review": "This widget worked for me, but might not work for everyone.",
  "rating": 4,
  "status": 1
}
```

## Create a Product Review

Creates a new product review. (Details: The "review" property is the review's text. The "rating" property must be a whole number between 1–5. If the optional "date_created" property is not specified, it defaults to the current date/time. If the optional "status" property is not specified, it defaults to 0 [“Pending”]. Other allowable values are 1 [“Approved”] or 2 [“Disapproved”].)

*   [OAuth](#create-a-product-review-oauth)
>`POST /stores/{store_hash}/v2/products/{product_id}/reviews`
*   [Basic Auth](#create-a-product-review-basic)
>`POST /api/v2/products/{product_id}/reviews`

### Read-only Properties

The following properties of the product review are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`

### Requirements

The following properties of the product review are required. The request won’t be fulfilled unless these properties are valid.

*   `author`
*   `title`
*   `review`
*   `rating`

```json
{
  "id": 8,
  "product_id": 32,
  "author": "Jimmy Doe",
  "date_created": "Tue, 05 Mar 2013 06:00:00 +0000",
  "title": "Worked for me!",
  "review": "I thought this product was pretty good",
  "rating": 5,
  "status": 0
}
```

## Update a Product Review

Updates an existing product review. Your request may update any of the properties that are writeable for the Create (POST) operation.

*   [OAuth](#update-a-product-review-oauth)
>`PUT /stores/{store_hash}/v2/products/{product_id}/reviews/{id}`
*   [Basic Auth](#update-a-product-review-basic)
>`PUT /api/v2/products/{product_id}/reviews/{id}`

### Read-only Properties

The following properties of the product review are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `product_id`

```json
{
  "id": 8,
  "product_id": 32,
  "author": "Jimmy Doe",
  "date_created": "Tue, 05 Mar 2013 06:00:00 +0000",
  "title": "Worked for me!",
  "review": "I thought this product was pretty good",
  "rating": 5,
  "status": 1
}
```

## Delete a Product Review

Deletes a specified product review. (If successful, this will typically return a "204 No Content".)

*   [OAuth](#delete-a-product-review-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/reviews/{id}`
*   [Basic Auth](#delete-a-product-review-basic)
>`DELETE /api/v2/products/{product_id}/reviews/{id}`

## Delete All Product Reviews

Deletes all reviews for the specified product. (If successful, this will typically return a "204 No Content".)

*   [OAuth](#delete-all-product-reviews-oauth)
>`DELETE /stores/{store_hash}/v2/products/{product_id}/reviews`
*   [Basic Auth](#delete-all-product-reviews-basic)
>`DELETE /api/v2/products/{product_id}/reviews`
