# Site Endpoints
Whenever the API requires a `:site_id`, you can either use the UUID of a site obtained through the API, or the domain of the site (mysite.netlify.com/www.example.com). These two are interchangeable whenever they're used in API paths.

## Get All Sites

This endpoint will retrieve all the sites associated with the `access_token`.

``` http
GET /sites HTTP/1.1
```

> Example response:

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

## Get a Site

For the `:site_id` you can use either the actual ID or the domain.

``` http
GET /sites/{:site_id} HTTP/1.1
```

> Example response:

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
  "user_id":"51f60d2d5803545326000005"
}
```

Examples using the `:site_id` as a domain or an ID:

- `GET /sites/3970e0fe-8564-4903-9a55-c5f8de49fb8b`
- `GET /sites/www.example.com`

## Create Site

<aside class='notice'>
These passwords are simple. They are meant to do basic auth, send a site to a client only. Not secure against a determined attacker. They are sent and stored in plain text, but all over HTTPS. See // TODO <LINK TO PASSWORD SECTION> // for more information.
</aside>

``` http
POST /sites HTTP/1.1
```

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
    // TODO @Matt -example please! & we should link here too
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
Not providing the `repo` information will skip integrating with the git provider. It is especially useful for manual deploys (see: // TODO link //).

## Update Site

For updating attributes on a site you can use either `PATCH` or `PUT`. They take all the same parameters as creating a site.

### HTTP request
``` http
PATCH /sites/{:site_id} HTTP/1.1
```
``` http
PUT /sites/{:site_id} HTTP/1.1
```

<aside class=notice>
If you do a PUT request to a site with <code>Content-Type: application/zip</code> and a zipped website in the HTTP request body, it works just like creating a new deploy for the site based on a zip file.
</aside>

## Destroy Site

These endpoints will permanently delete a site. Either by domain or ID.

``` http
DELETE /sites/{:site_id} HTTP/1.1
```
``` http
DELETE /sites/{:site_domain} HTTP/1.1
```

This will return `200 OK`.

## Provision SSL for a site

<aside class=notice>
The site must have a custom domain with DNS records configured to point to netlify's infrastructure.
</aside>

``` http
POST /sites/{:site_id}/ssl HTTP/1.1
```

Any domain aliases with valid DNS records will also be included in the SSL certificate for the site.

It normally takes just a few seconds from making the call until the site is accessible via HTTPS from all global CDN nodes.
