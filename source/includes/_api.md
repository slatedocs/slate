---
cmsUserSlug: api
date: 2015-10-21T00:00:00.000Z
title: API
position: 100
---

## Netlify REST API

Netlify is a hosting service for the programmable web. It understands your documents and provides an API to handle atomic deploys of web sites, manage form submissions, inject javascript snippets, and much more. This is a REST-style API that uses JSON for serialization and OAuth 2 for authentication.

## Making a request

All URLs start with `https://api.netlify.com/api/v1/`. **SSL only**. The path is prefixed with the API version. If we change the API in backward-incompatible ways, we'll bump the version marker and maintain stable support for the old URLs.

To make a request for all the sites you have access to, you'd append the sites' index path to the base url to form something like https://api.netlify.com/api/v1/sites. In curl, that looks like:

```shell
curl -H 'User-Agent: MyApp (yourname@example.com)' https://api.netlify.com/api/v1/sites?access_token=oauth2_access_token
```

## Authenticating

Netlify uses OAuth2 for authentication. All requests must use HTTPS. You'll need an application client key and a client secret before you can access the Netlify API. You can register a new application at [https://api.netlify.com/applications](https://app.netlify.com/applications).

If you're making a public integration with Netlify for others to enjoy, you must use OAuth 2. This allows users to authorize your application to use Netlify on their behalf without having to copy/paste API tokens or touch sensitive login info.

The Oauth2 end user authorization endpoint is `https://app.netlify.com/authorize`.

## Endpoints

* `/sites` all sites
* `/sites/{site_id}/forms` all forms for a site
* `/sites/{site_id}/submissions` all submissions for a site
* `/sites/{site_id}/snippets` all snippets to be injected into the HTML of a site
* `/sites/{site_id}/metadata` a metadata object for a site (can be used in combination with the snippets)
* `/sites/{site_id}/deploys` all deploys for a site
* `/sites/{site_id}/ssl` activate ssl for a site
* `/deploys/{deploy_id}` a deploy
* `/deploys/{deploy_id}/files` all files in a deploy
* `/deploys/{deploy_id}/files/{path}` a specific file
* `/forms` all forms
* `/forms/{form_id}/submissions` all submissions from a specific form
* `/hooks` outbound [REST hooks](http://resthooks.org/)
* `/users` all users you have access to
* `/users/{user_id}/sites` all sites for a specific user
* `/users/{user_id}/forms` all forms for a specific user
* `/users/{user_id}/submissions` all form submissions for a specific user

A note on the `site_id`: this can either be the actual `id` of a site, but it is interchangeable with the full domain for a site (some-site.bitballoon.com or site.example.com).

## Rate Limiting

To protect Netlify from getting flooded by automated deploys or misbehaving applications, the Netlify API is rate limited.

You can make up to 200 requests per minute.

You can check the returned HTTP headers of any API request to see your current rate limit status:

```
X-RateLimit-Limit: 200
X-RateLimit-Remaining: 56
X-RateLimit-Reset: 1372700873
```

If you need higher limits, please contact us.

## Pagination

Requests that return multiple items will be paginated to 100 items by default. You can specify further pages with the ?page parameter. You can also set a custom page size up to 100 with the ?per_page parameter.

Note that page numbering is 1-based and that omitting the ?page parameter will return the first page.

### Link Header

The pagination info is included in the `Link` header.

```
Link: <https://api.netlify.com/api/v1/sites?page=3&per_page=20>; rel="next",
  <https://api.netlify.com/api/v1/sites?page=5&per_page=20>; rel="last"
```

Linebreak is included for readability.

The possible rel values are:

* `next`
  Shows the URL of the immediate next page of results.
* `last`
  Shows the URL of the last page of results.
* `prev`
  Shows the URL of the immediate previous page of results.

## Site IDs

Whenever the API requires a :site_id, you can either use the UUID of a site obtained through the API, or the domain of the site (mysite.netlify.com/www.example.com). These two are interchangeable whenever they're used in API paths.

## Deploying to netlify

The most common API action is doing deploys, either of a new site or an existing site.

Netlify supports two ways of doing deploys:

1. Sending a digest of all files in your deploy, and then uploading any files netlify doesn't already have on it's storage servers
2. Sending a zipped website and let netlify unzip and deploy

We generally recommend the first way, since it's more efficient and requires less bandwidth usage.

Whether you deploy a brand new site or create a deploy within an existing site, the process is similar.

First create a new site, if needed:

POST /api/v1/sites

Now you have a site ID and you can create a new deploy, either with a file digest or a zip file.

### Deploying via files digest

We recommend using a digest of file paths and SHA1's of the content.

POST /api/v1/sites/:site_id/deploys

    {"files": {"/index.html": "907d14fb3af2b0d4f18c2d46abe8aedce17367bd"}}

When using a file digest, the API will return an object similar to:

    {"deploy_id": "1234", "required": ["907d14fb3af2b0d4f18c2d46abe8aedce17367bd"]}

The `required` property will give you a list of SHA1's of files that you need to upload.

Note, if you have two files with the same SHA1, you do need to upload both of them.

Now upload the files:

PUT /api/v1/deploys/1234/files/index.html

Make sure to use "application/octet-stream" as your Content-Type and simply use the file contents as the HTTP request body.

Once all files have been uploaded, netlify will post process the deploy and invalidate the CDN.

### Deploying via ZIP file

To deploy via zip file, simply create a new deploy with Content-Type: "application/zip" and the ZIP file as the HTTP request body:

    POST /api/v1/:site_id/deploys

A deploy from a zip file will enter post processing mode straight after being created.

While we generally recommend using files digests, ZIP file based deploys are easy to do straight from the command line with CURL:

```
curl -H "Content-Type: application/zip" \
     -H "Authorization: Bearer my-api-access-token" \
     --binary-data="@website.zip" \
     https://api.netlify.com/api/v1/sites/mysite.netlify.com/deploys
```

### Creating a new site with a file digest or zip file

When creating a new site, you can include a file digest or a zip file straight away, to save an HTTP request.

The following will create a new site from a zip file:

```
curl -H "Content-Type: application/zip" \
     -H "Authorization: Bearer my-api-access-token" \
     --binary-data="@website.zip" \
     https://api.netlify.com/api/v1/sites
```

### Waiting for processing

You can poll the deploy to check the state:

GET /api/v1/deploys/1234

    {"deploy_id": "1234", "state": "ready"}

Once the state changes to "ready", the deploy is live.

### Draft deploys

When creating a new deploy, you can set `"draft": true` to mark the deploy as a draft deploy.

Draft deploys works just like normal deploys, but they won't change the active deploy of the site once they're done processing.

## Sites

The `/sites` endpoint allows you to access the sites deployed on Netlify.

### Get Sites

* `GET /sites` will return all sites you have access to.

```json
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
    "user_id":{"51f60d2d5803545326000005"},
  }
]
```

### Get Site

* `GET /sites/3970e0fe-8564-4903-9a55-c5f8de49fb8b` will return the site from its ID
* `GET /sites/www.example.com` will return the site matching the domain `www.example.com`

```json
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
  "user_id":{"51f60d2d5803545326000005"},
}
```

### Create Site

* `POST /api/v1/sites` will create a new site

When creating a site, you can set the following properties:

* `name`, the name of the site (**mysite**.netlify.com)
* `custom_domain`, the custom domain of the site (www.example.com)
* `password`, password protect the site
* `force_ssl`, will force SSL on the site if SSL is enabled (requires a paid plan)
* `processing_settings`, lets you set the following processing settings:
   {"css": {"bundle": true, "minify": true}, "js": {"bundle": true, "minify": true}, "html": {"pretty_urls": true, "canonical_urls": true}, "images": {"optimize": true}}
* `repo`, lets you configure continuous deployment. See the later section on that.

### Update Site

* `PATCH /api/v1/sites/{site_id}` will let you update some attributes on a site
* `PUT /api/v1/sites/{site_id}` will let you update some attributes on a site

This lets you update a site. Takes all the same parameters as when creating a site.

If you do a PUT request to a site with `Content-Type: application/zip` and a zipped website in the HTTP request body, it works just like creating a new deploy for the site based on a zip file.

### Destroy Site

* `DELETE /api/sites/{site_id}` will permanently delete a site
* `DELETE /api/sites/{site_domain}` will permanently delete a site

This will return `200 OK`.

### Provision SSL for a site

* `POST /api/sites/{site_id}/ssl` will activate SSL for site

The site must have a custom domain with DNS records configured to point to netlify's infrastructure.

Any domain aliases with valid DNS records will also be included in the SSL certificate for the site.

It normally takes just a few seconds from making the call until the site is accessible via HTTPS from all global CDN nodes.

## Submissions

The `/submissions` endpoint gives access to the form submissions of your Netlify sites. You can scope submissions to a specific site (`/sites/{site_id}/submissions`) or to a specific form (`/forms/{form_id}/submissions`).

### Get Submissions

* `GET /api/v1/submissions` will return a list of form submissions

```json
[
  {
    "id":"5231110b5803540aeb000019",
    "number":13,
    "title":null,
    "email":"test@example.com",
    "name":"Mathias Biilmann",
    "first_name":"Mathias",
    "last_name":"Biilmann",
    "company":"Netlify",
    "summary":"Hello, World",
    "body":"Hello, World",
    "data": {
      "email":"test@example.com",
      "name": "Mathias Biilmann",
      "ip":"127.0.0.1"
    },
    "created_at":"2013-09-12T00:55:39Z",
    "site_url":"http://synergy.bitballoon.com"
  }
]
```

## Forms

The `/api/v1/forms` endpoint allow you to access forms from your Netlify sites. You can scope forms to a specific site with `/sites/{site_id}/forms`.

### Get Forms

* `GET /forms` will return a list of forms

```json
[
  {
    "id":"ac0865cc46440b1e64666f520e8d88d670c8a2f6",
    "site_id":"0d3a9d2f-ef94-4380-93df-27ee400e2048",
    "name":"Landing Page",
    "paths":["/index"],
    "submission_count":3,
    "fields": [
      {"name":"name","type":"text"},
      {"name":"email","type":"email"},
      {"name":"phone","type":"text"},
      {"name":"company","type":"text"},
      {"name":"website","type":"url"},
      {"name":"number_of_employees","type":"select"}
    ],
    "created_at":"2013-09-18T20:26:19Z"
  }
]
```

## Hooks

Netlify can trigger webhooks, send email notifications or send slack messages on certain events.

The `/api/v1/hooks` endpoint lets you control the hooks for your site.

### Get Hook Types

* `GET /api/v1/hooks/types` returns a list of hook types that you can configure

```json
[{
  "name": "url",
  "fields": [{"name": "url", "options": {"type": "string", "title": "URL to notify"}}],
  "events": ["submission_created", "deploy_created", "deploy_failed"]
}]
```

### Get Hooks for a Site

Each type has a series of fields that you need to set to create a new hook, and a list of events that they can be triggered by.

* `GET /api/v1/hooks?site_id=:my_site_id` returns a list of a hooks defined for a specific site

```json
[{
  "id": "5636b7a00d61eec2d6001004",
  "site_id": "0d3a9d2f-ef94-4380-93df-27ee400e2048",
  "type":"email",
  "event":"submission_created",
  "data": {"email":"test@example.com"},
  "created_at":"2015-10-20T21:51:51Z",
  "updated_at":"2015-10-20T21:51:51Z"
}]
```

### Create a new Hook

* `POST /api/v1/hooks` creates a new hook

An example request body for an email hook for a specific form in your site, would look like this:

```json
{
  "site_id": "0d3a9d2f-ef94-4380-93df-27ee400e2048",
  "form_id": "5235a7a00d61eec2d6001302",
  "type": "email",
  "event": "submission_created",
  "data": {"email": "test@example.com"}
}
```

Form ID is optional and links the hook to a specific form within your site. You can also use `form_name` with the value of the `name` attribute of the form of your site as an alternative to `form_id`.

### Delete a hook

* `DELETE /api/v1/hooks/:hook_id` removes the hook permanently

Note, for outgoing webhooks, returning a `410 Gone` status code from the URL endpoint will trigger a deletion of the hook.


## Files

All files deployed by Netlify can be read through the API. Where the public URL of a file will serve the processed version for HTML pages, the files accessed through the API are the original uploaded files.

Netlify is based on a concept of atomic deploys. This means you never work on individual files. If you want to change a file, simply do a new deploy with a new version of the site. To delete a file, simply create a new deploy without the file. The file digest based deployment method, means that these operations are fast and low-cost. Atomic deploys guarantees that your site is never in an inconsistent state where some files are being uploaded and where users might get HTML files that are not in synch with the CSS or image files, etc...

### Get Files

* `GET /api/v1/sites/{site_id}/files` will return a list of all the files in the current deploy

```json
[
  {"id":"/index.html",
  "path":"/index.html",
  "sha":"20828dcdf2cd07e5980fe52759101591bf5014ab",
  "mime_type":"text/html",
  "size":27232
  }
]
```

### Get File

* `GET /api/v1/sites/{site_id}/files/{path-to-file}` returns the file

```json
{"id":"/index.html",
"path":"/index.html",
"sha":"20828dcdf2cd07e5980fe52759101591bf5014ab",
"mime_type":"text/html",
"size":27232
}
```

You can get the raw contents of the file by using the custom media type `application/vnd.bitballoon.v1.raw` as the Content-Type of your HTTP request.

## Snippets

Snippets are code snippets that will be injected into every HTML page of the website, either right before the closing head tag or just before the closing body tag. Each snippet can specify code for all pages and code that just gets injected into "Thank you" pages shown after a successful form submission.

### Get Snippets

* `GET /api/v1/sites/{site_id}/snippets` get a list of snippets specific to this site

```json
[
  {
    "id":0,
    "title":"Test",
    "general":"\u003Cscript\u003Ealert(\"Hello\")\u003C/script\u003E",
    "general_position":"head",
    "goal":"",
    "goal_position":"footer"
  }
]
```

The `general` property is the code that will be injected right before either the head or body end tag. The `general_position` can be `head` or `footer` and determines whether to inject the code in the head element or before the closing body tag.

The `goal` property is the code that will be injected into the "Thank you" page after a form submission. `goal_position` determines where to inject this code.

### Get Snippet

* `GET /api/v1/sites/{site_id}/snippets/{snippet_id}` get a specific snippet

```json
{
  "id":0,
  "title":"Test",
  "general":"\u003Cscript\u003Ealert(\"Hello\")\u003C/script\u003E",
  "general_position":"head",
  "goal":"",
  "goal_position":"footer"
}
```

### Add Snippet

* `POST /api/v1/sites/{site_id}/snippets` add a new snippet to a site.

### Update Snippet

* `PUT /api/v1/sites/{site_id}/snippets/{snippet_id}` replace a snippet.

### Delete Snippet

* `DELETE /api/v1/sites/{site_id}/snippets/{snippet_id}` delete a snippet.

## Metadata

Each site has a metadata object. The properties of the metadata object can be used within the snippets for a site by sing the [Liquid](https://github.com/Shopify/liquid) template syntax.

### Get Metadata

* `GET /api/v1/sites/{site_id}/metadata` get the metadata for a site

```json
{
  "my_meta_key": "my_meta_value"
}
```

### Update Metadata

* `PUT /api/v1/sites/{site_id}/metadata` replace the metdata object with a new metadata object

## Deploys

You can access all deploys for a specific site.

### Get Deploys

* `GET /api/v1/sites/{site_id}/deploys` a list of all deploys

```json
[
  {
    "id":"52465f435803544542000001",
    "premium":false,
    "claimed":true,
    "name":"synergy",
    "custom_domain":"www.example.com",
    "notification_email:"me@example.com",
    "url":"http://www.example.com",
    "deploy_url": "http://52465f435803544542000001.some-site.bitballoon.com",
    "admin_url":"https://api.netlify.com/sites/synergy",
    "screenshot_url":null,
    "created_at":"2013-09-17T05:13:08Z",
    "updated_at":"2013-09-17T05:13:19Z",
    "user_id":{"51f60d2d5803545326000005"},
    "state": "old"
  }
]
```

### Get Deploy

* `GET /api/v1/sites/{site_id}/deploys/{deploy_id}` a specific deploy

```json
{
  "id":"52465f435803544542000001",
  "premium":false,
  "claimed":true,
  "name":"synergy",
  "custom_domain":"www.example.com",
  "notification_email:"me@example.com",
  "url":"http://www.example.com",
  "deploy_url": "http://52465f435803544542000001.some-site.bitballoon.com",
  "admin_url":"https://api.netlify.com/sites/synergy",
  "screenshot_url":null,
  "created_at":"2013-09-17T05:13:08Z",
  "updated_at":"2013-09-17T05:13:19Z",
  "user_id":{"51f60d2d5803545326000005"},
  "state": "old"
}
```

### Restore Deploy

* `POST /sites/{site_id}/deploys/{deploy_id}/restore` restores an old deploy and make it the live version of the site

```json
{
  "id":"52465f435803544542000001",
  "premium":false,
  "claimed":true,
  "name":"synergy",
  "custom_domain":"www.example.com",
  "notification_email:"me@example.com",
  "url":"http://www.example.com",
  "deploy_url": "http://52465f435803544542000001.some-site.bitballoon.com",  
  "admin_url":"https://api.netlify.com/sites/synergy",
  "screenshot_url":null,
  "created_at":"2013-09-17T05:13:08Z",
  "updated_at":"2013-09-17T05:13:19Z",
  "user_id":{"51f60d2d5803545326000005"},
  "state": "current"
}
```
