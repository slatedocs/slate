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

# Sites Endpoints
Whenever the API requires a `:site_id`, you can either use the UUID of a site obtained through the API, or the domain of the site (mysite.netlify.com/www.example.com). These two are interchangeable whenever they're used in API paths.

## Get All Sites
``` shell
curl https://app.netlify.com/v1/sites
    -H "Authorization: Bearer access_token"
```
``` http
GET /sites HTTP/1.1
```

> Responds with JSON:

``` json
[
  {
    "id":"3970e0fe-8564-4903-9a55-c5f8de49fb8b",
    "premium":false,
    "claimed":true,
    "name":"synergy",
    "custom_domain":"www.example.com",
    "url":"http://www.example.com",
    "admin_url":"https://api.netlify.com/sites/synergy",
    "screenshot_url":null,
    "created_at":"2013-09-17T05:13:08Z",
    "updated_at":"2013-09-17T05:13:19Z",
    "user_id":{"51f60d2d5803545326000005"}
  }
]
```

This endpoint will retrieve all the sites associated with the `access_token`.

### HTTP Request
`GET https://api.netlify.com/sites`

## Get A Site

For the `:site_id` you can use either the actual ID or the domain.

### HTTP Request
`GET https://api.netlify.com/sites/{:site_id}`

> Responds with JSON:

``` json
{
  "id":"3970e0fe-8564-4903-9a55-c5f8de49fb8b",
  "premium":false,
  "claimed":true,
  "name":"synergy",
  "custom_domain":"www.example.com",
  "notification_email":"me@example.com",
  "url":"http://www.example.com",
  "admin_url":"https://api.netlify.com/sites/synergy",
  "screenshot_url":null,
  "created_at":"2013-09-17T05:13:08Z",
  "updated_at":"2013-09-17T05:13:19Z",
  "user_id":{"51f60d2d5803545326000005"}
}
```

> examples using the :site_id as a domain or an ID

``` http
GET /sites/3970e0fe-8564-4903-9a55-c5f8de49fb8b HTTP/1.1
```
``` http
GET /sites/www.example.com HTTP/1.1
```

## Create Site

<aside class='notice'>
These passwords are simple. They are meant to do basic auth, send a site to a client only. Not secure against a determined attacker. They are sent and stored in plain text, but all over HTTPS. See // TODO <LINK TO PASSWORD SECTION> // for more information.
</aside>

> JSON body should look like:

``` json
{
  "name": "mysite.netlify.com",
  "custom_domain": "www.example.com",
  "password": "password",
  "force_ssl": true,
  "processing_settings": {
    "css": {
      "bundle": true,
      "minify": true
    },
    "html": {
      "pretty_urls": true,
      "canonical_urls": true
    }
  },
  "repo": {
    // TODO
  }
}
```

> Default processing_settings

``` json
{
  "images": {
    "optimize": true
  },
  "js": {
    "bundle": true,
    "minify": true
  },
  "css": {
    "bundle": true,
    "minify": true
  },
  "html": {
    "pretty_urls": true,
    "forms": true,
    "canonical_urls": true
  },
  "skip_processing": false
}
```

### HTTP Request
`POST /api/v1/sites`


These are the parameters you can set in the JSON body. None of them are required, and the defaults are as follows.

Name | Default | Description
-----|----------|---------|------------
name | auto generated name | the name of the site (e.g. **mysite**.netlify.com)
custom_domain | "" | the custom domain of the site (e.g. mysite.com)
password | "" | a simple password for basic auth
force_ssl | false | will force SSL on the site if SSL is enabled (requires a paid plan)
processing_settings | see --> | configure the settings for this site
repo | none | the repo information for continuous deployment

The `skip_processing` flag will disable all the other settings. You can provide any subset of these flags.
Not providing the `repo` information will skip integrating with the git provider. It is especially useful for manual deploys (see: // TODO //).

## Update Site

For updating attributes on a site you can use either `PATCH` or `PUT`. They take all the same parameters as creating a site.

### HTTP request
`PATCH /api/v1/sites/{:site_id}`

`PUT /api/v1/sites/{:site_id}`

<aside class=notice>
If you do a PUT request to a site with <code>Content-Type: application/zip</code> and a zipped website in the HTTP request body, it works just like creating a new deploy for the site based on a zip file.
</aside>

## Destroy Site

These endpoints will permanently delete a site. Either by domain or ID.

### HTTP request

`DELETE /api/sites/{:site_id}`

`DELETE /api/sites/{site_domain}`

This will return `200 OK`.

## Provision SSL for a site

<aside class=notice>
The site must have a custom domain with DNS records configured to point to netlify's infrastructure.
</aside>

### HTTP request
`POST /api/sites/{:site_id}/ssl`

Any domain aliases with valid DNS records will also be included in the SSL certificate for the site.

It normally takes just a few seconds from making the call until the site is accessible via HTTPS from all global CDN nodes.
