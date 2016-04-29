## Content entries in the store’s blog.
|||
|----|-----|
| **Manages** ||
| **OAuth Scopes** | store_v2_content |
||store_v2_content_read_only|



## Operations

*   [List Blog Posts](#list-blog-posts)
*   [Get a Blog Post](#get-a-blog-post)
*   [Get a Count of Blog Posts](#get-a-count-of-blog-posts)
*   [Create a Blog Post](#create-a-blog-post)
*   [Update a Blog Post](#update-a-blog-post)
*   [Delete a Blog Post](#delete-a-blog-post)
*   [Delete Multiple Blog Posts](#delete-multiple-blog-posts)

## List Blog Posts

Gets the collection of blog posts. (Default sorting is by published_date, from most-recent to earliest.)

*   [OAuth](#list-blog-posts-oauth)
>`GET /stores/{store_hash}/v2/blog/posts`

*   [Basic Auth](#list-blog-posts-basic)

>`GET /api/v2/blog/posts`


### Filters

Filter parameters can be added to the URL query string to select specific blog_posts in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `is_published` | string | `/stores/{store_hash}/v2/blog/posts?is_published={value}` |
| `url` | string | `/stores/{store_hash}/v2/blog/posts?url={value}` |
| `tag` | string | `/stores/{store_hash}/v2/blog/posts?tag={value}` |
| `published_date` | string | `/stores/{store_hash}/v2/blog/posts?published_date={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 blog_posts are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/stores/{store_hash}/v2/blog/posts?page={number}` |
| `Limit` | int | `/stores/{store_hash}/v2/blog/posts?limit={count}` |

```json
  {
    "id": 2,
    "title": "Ten Great New Products",
    "url": "/blog/ten-great-new-products/",
    "preview_url": "/blog/ten-great-new-products/?preview=53829a3bb47f4",
    "body": "<p>Here's ten new products that make great gifts...</p>",
    "tags": [
      "New",
      "Products"
    ],
    "summary": "Here's ten new products that make great gifts...",
    "is_published": false,
    "published_date": "2014-05-26T01:34:41+0000",
    "meta_description": null,
    "meta_keywords": "New,Products",
    "author": "",
    "author_url": "",
    "thumbnail_path": ""
  },
  {
    "id": 1,
    "title": "Your first blog post!",
    "url": "/your-first-blog-post/",
    "preview_url": "/your-first-blog-post/",
    "body": "<p> <strong>Welcome to your blog!</strong><br> A blog is a great place to share details on your products, business and whatever else you think your shoppers might like to hear from you. You can include photos in your blog posts and even videos. For ideas and inspiration on how to structure your blog, take a look at the Bigcommerce <a href='http://blog.bigcommerce.com/' target='_blank'>ecommerce blog</a>.</p><p><strong>How can I delete this post?</strong><br>To delete this post and add your own, login to your <a href='/admin' target='_blank'>admin area</a>, click the Content tab at the top of the screen and choose Blog.</p><p><strong>Powered by Bigcommerce</strong><br>Your website, online store and blog are powered by Bigcommerce <a href='http://www.bigcommerce.com/' target='_blank'>ecommerce software</a>. It includes everything you need to run a beautiful online store including <a href='http://www.bigcommerce.com/templates/' target='_blank'>ecommerce website templates</a>, <a href='http://www.bigcommerce.com/features/hosting/' target='_blank'>ecommerce hosting</a>, an <a href='http://www.bigcommerce.com/features/setup/' target='_blank'>online shopping cart</a> and more.</p>",
    "tags": [
      "Blog",
      "SEO"
    ],
    "summary": " Welcome to your blog! A blog is a great place to share details on your products, business and whatever else you think your shoppers might like to hear from you. You can include photos in your blog posts and even videos. For ideas and inspiration on how to structure your blog, take a look [...]",
    "is_published": true,
    "published_date": "2014-02-15T19:46:34+0000",
    "meta_description": "",
    "meta_keywords": "Blog,SEO",
    "author": "",
    "author_url": "",
    "thumbnail_path": ""
  }
]
```
## Get a Blog Post

Gets a blog post.

*   [OAuth](#get-a-blog-post-oauth)
>`GET /stores/{store_hash}/v2/blog/posts/{id}
*   [Basic Auth](#get-a-blog-post-basic)
>`GET /api/v2/blog/posts/{id}

```json
{
  "id": 1,
  "title": "Your first blog post!",
  "url": "/your-first-blog-post/",
  "preview_url": "/your-first-blog-post/",
  "body": "<p> <strong>Welcome to your blog!</strong><br> A blog is a great place to share details on your products, business and whatever else you think your shoppers might like to hear from you. You can include photos in your blog posts and even videos. For ideas and inspiration on how to structure your blog, take a look at the Bigcommerce <a href='http://blog.bigcommerce.com/' target='_blank'>ecommerce blog</a>.</p><p><strong>How can I delete this post?</strong><br>To delete this post and add your own, login to your <a href='/admin' target='_blank'>admin area</a>, click the Content tab at the top of the screen and choose Blog.</p><p><strong>Powered by Bigcommerce</strong><br>Your website, online store and blog are powered by Bigcommerce <a href='http://www.bigcommerce.com/' target='_blank'>ecommerce software</a>. It includes everything you need to run a beautiful online store including <a href='http://www.bigcommerce.com/templates/' target='_blank'>ecommerce website templates</a>, <a href='http://www.bigcommerce.com/features/hosting/' target='_blank'>ecommerce hosting</a>, an <a href='http://www.bigcommerce.com/features/setup/' target='_blank'>online shopping cart</a> and more.</p>",
  "tags": [
    "Blog",
    "SEO"
  ],
  "summary": " Welcome to your blog! A blog is a great place to share details on your products, business and whatever else you think your shoppers might like to hear from you. You can include photos in your blog posts and even videos. For ideas and inspiration on how to structure your blog, take a look [...]",
  "is_published": true,
  "published_date": "2014-02-15T19:46:34+0000",
  "meta_description": "",
  "meta_keywords": "Blog,SEO",
  "author": "",
  "author_url": "",
  "thumbnail_path": ""
}
```
## Get a Count of Blog Posts

Gets a count of blog posts.


*   [OAuth](#get-a-count-of-blog-posts-oauth)
>`GET /stores/{store_hash}/v2/blog/posts/count
*   [Basic Auth](#get-a-count-of-blog-posts-basic)
>`GET /api/v2/blog/posts/count


```json
{
  "count": 6
}
```
## Create a Blog Post

Creates a new blog post.

*   [OAuth](#create-a-blog-post-oauth)
>`POST /stores/{store_hash}/v2/blog/posts
*   [Basic Auth](#create-a-blog-post-basic)
>`POST /api/v2/blog/posts


### Read-only Properties

The following properties of the blog post are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `preview_url`

### Requirements

The following properties of the blog post are required. The request won’t be fulfilled unless these properties are valid.

*   `title`
*   `body`

### Notes

Blog posts default to draft status. Set `is_published` to true to publish posts to the storefront.

If a custom `url` is not provided, the post’s URL will be generated based on the value of `title`.

```curl
{
  "title": "A Sample Blog Post",
  "body": "<p>This is a blog post.</p>",
  "author": "Author Name",
  "author_url": "http://example.com/author-name",
  "thumbnail_path": "http://cdn.example.com/sample-post.jpg",
  "is_published": true,
  "tags": [
    "Blog",
    "Example"
  ]
}
```
## Update a Blog Post

Updates an existing blog post.


*   [OAuth](#update-a-blog-post-oauth)
>`PUT /stores/{store_hash}/v2/blog/posts/{id}
*   [Basic Auth](#update-a-blog-post-basic)
>`PUT /api/v2/blog/posts/{id}


### Read-only Properties

The following properties of the blog post are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `preview_url`

### Requirements

The following properties of the blog post are required. The request won’t be fulfilled unless these properties are valid.

```curl
{
  "title": "New: A Sample Blog Post",
  "url": "/blog/sample-post"
}
```
## Delete a Blog Post

Deletes a blog post.

*   [OAuth](#delete-a-blog-post-oauth)
>`DELETE /stores/{store_hash}/v2/blog/posts/{id}
*   [Basic Auth](#delete-a-blog-post-basic)
>`DELETE /api/v2/blog/posts/{id}


## Delete Multiple Blog Posts

Deletes multiple blog posts in the collection.

*   [OAuth](#delete-multiple-blog-posts-oauth)
>`DELETE /stores/{store_hash}/v2/blog/posts
*   [Basic Auth](#delete-multiple-blog-posts-basic)
>`DELETE /api/v2/blog/posts


### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 blog_posts are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/blog/posts?page={number}` |
| `Limit` | int | `/api/v2/blog/posts?limit={count}` |
