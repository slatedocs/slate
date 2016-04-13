## Redirects are used to create custom URL paths that map to resources on the storefront (such as products, categories, brands, etc.) or manually defined static URLs.

|||
|----|-----|
| **Manages** |
| **OAuth Scopes** | `store_v2_content`
||`store_v2_content_read_only`|

## Operations

*   [List Redirects](#list-redirects)
*   [Get a Redirect](#get-a-redirect)
*   [Get a Count of Redirects](#get-a-count-of-redirects)
*   [Create a Redirect](#create-a-redirect)
*   [Update a Redirect](#update-a-redirect)
*   [Delete a Redirect](#delete-a-redirect)
*   [Delete Multiple Redirects](#delete-multiple-redirects)

## List Redirects

Gets the collection of URL redirects.

*   [OAuth](#list-redirects-oauth)
>`GET /stores/{store_hash}/v2/redirects`
*   [Basic Auth](#list-redirects-basic)
>`GET /api/v2/redirects`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 redirects are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/redirects?page={number}` |
| `Limit` | int | `/api/v2/redirects?limit={count}` |

```json
[
  {
    "id": 1,
    "path": "/redirect_path1",
    "forward": {
      "type": "manual",
      "ref": "http://www.bigcommerce.com"
    },
    "url": "http://www.bigcommerce.com"
  },
  {
    "id": 2,
    "path": "/redirect_path2",
    "forward": {
      "type": "product",
      "ref": 35
    },
    "url": "http://store.example.com/product-no-35"
  }
]
```

## Get a Redirect

Gets a single URL redirect.

*   [OAuth](#get-a-redirect-oauth)
>`GET /stores/{store_hash}/v2/redirects/{id}`
*   [Basic Auth](#get-a-redirect-basic)
>`GET /api/v2/redirects/{id}`

```json
{
  "id": 1,
  "path": "/redirect_path1",
  "forward": {
    "type": "manual",
    "ref": "http://www.bigcommerce.com"
  },
  "url": "http://www.bigcommerce.com"
}
```

## Get a Count of Redirects

Gets a count of redirects.


*   [OAuth](#get-a-count-of-redirects-oauth)
>`GET /stores/{store_hash}/v2/redirects/count`
*   [Basic Auth](#get-a-count-of-redirects-basic)
>`GET /api/v2/redirects/count`



### Response

Example JSON returned in the response:
```
{
  "count": 0
}
```
## Create a Redirect

Creates a new URL redirect.

*   [OAuth](#create-a-redirect-oauth)
>`POST /stores/{store_hash}/v2/redirects`
*   [Basic Auth](#create-a-redirect-basic)
>`POST /api/v2/redirects`



### Read-only Properties

The following properties of the redirect are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `url`

### Requirements

The following properties of the redirect are required. The request won’t be fulfilled unless these properties are valid.

*   `path`
*   `forward`

### Request

Example request object:
```
{
  "path": "/mens_clothing",
  "forward": {
    "type": "category",
    "ref": 3
  }
}
```
### Response

Example JSON returned in the response:
```
{
  "id": 3,
  "path": "/mens_clothing",
  "forward": {
    "type": "category",
    "ref": 3
  },
  "url": "http://store.example.com/mens"
}
```
## Update a Redirect

Updates an existing URL redirect.

*   [OAuth](#update-a-redirect-oauth)
>`PUT /stores/{store_hash}/v2/redirects/{id}`
*   [Basic Auth](#update-a-redirect-basic)
>`PUT /api/v2/redirects/{id}`



### Read-only Properties

The following properties of the redirect are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `url`

### Requirements

The following properties of the redirect are required. The request won’t be fulfilled unless these properties are valid.

*   `path`
*   `forward`

### Notes

The `path`, `forward.type` and `forward.ref` fields of an existing redirect can be updated.

## Delete a Redirect

Deletes a URL redirect.

*   [OAuth](#delete-a-redirect-oauth)
>`DELETE /stores/{store_hash}/v2/redirects/{id}`
*   [Basic Auth](#delete-a-redirect-basic)
>`DELETE /api/v2/redirects/{id}`



## Delete Multiple Redirects

Deletes multiple URL redirects.

*   [OAuth](#delete-multiple-redirects-oauth)
>`DELETE /stores/{store_hash}/v2/redirects`
*   [Basic Auth](#delete-multiple-redirects-basic)
>`DELETE /api/v2/redirects`



### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 redirects are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/redirects?page={number}` |
| `Limit` | int | `/api/v2/redirects?limit={count}` |
