## Index of tags used on the store’s blog.
|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_content`|
||`store_v2_content_read_only`|


## Operations

*   [List Tags](#list-tags)

## List Tags

List of tags with associated blog posts.

*   [OAuth](#list-tags-oauth)
>`GET /stores/{store_hash}/blog/tags`
*   [Basic Auth](#list-tags-basic)
>`GET /api/blog/tags`

```json
[
  {
    "tag": "Blog",
    "post_ids": [
      1
    ]
  },
  {
    "tag": "New",
    "post_ids": [
      2
    ]
  },
  {
    "tag": "Products",
    "post_ids": [
      2
    ]
  },
  {
    "tag": "Seo",
    "post_ids": [
      1
    ]
  }
]
```
