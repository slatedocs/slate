# REST Reference

<aside class=notice>
On error the endpoint will send back an appropriate HTTP response and a useful JSON payload.
</aside>

## Rate Limiting

To protect Netlify from getting flooded by automated deploys or misbehaving applications, the Netlify API is rate limited.

You can make up to **200 requests per minute**.

The HTTP headers of any API request has the current rate limit status:

``` http
GET /api/v1/sites HTTP/1.1
X-RateLimit-Limit: 200
X-RateLimit-Remaining: 56
X-RateLimit-Reset: 1372700873
```

If you need higher limits, please [contact us](TODO).

## Pagination

Requests that return multiple items will be paginated to 100 items by default. You can specify further pages with a combination of the `page` and `per_page` query parameters. They are assumed to be consistent between calls, meaning
`?page=3&per_page=10` would get you back entries from 30 - 39.

<!-- @Matt is this right? ^^^ -->

Parameter | Default | Description
----------|---------|------------
per_page | 100 | the size of a page, assumed to be consistent between paged calls
page | 1 | which page to retrieve

<aside class=notice>
note: page numbering is 1-based and that omitting the <code>page</code> query parameter will return the first page.
</aside>

### Link Header

The pagination info is included in the `Link` header.

``` http
GET /api/v1/sites?page=3&per_page=20 HTTP/1.1

Link: <https://api.netlify.com/api/v1/sites?page=3&per_page=20>; rel="next", \
      <https://api.netlify.com/api/v1/sites?page=5&per_page=20>; rel="last"
```

The possible `rel` values are:

* `next`
  Shows the URL of the immediate next page of results.
* `last`
  Shows the URL of the last page of results.
* `prev`
  Shows the URL of the immediate previous page of results.
