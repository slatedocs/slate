---
cmsUserSlug: api
date: 2015-10-21T00:00:00.000Z
title: API
position: 100
---

# Deploying to netlify

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

``` shell
curl -H "Content-Type: application/zip"       \
     -H "Authorization: Bearer {:auth_token}" \
     --binary-data="@website.zip"             \
     https://api.netlify.com/api/v1/sites/mysite.netlify.com/deploys
```

### Creating a new site with a file digest or zip file

When creating a new site, you can include a file digest or a zip file straight away, to save an HTTP request.

The following will create a new site from a zip file:

``` shell
curl -H "Content-Type: application/zip"       \
     -H "Authorization: Bearer {:auth_token}" \
     --binary-data="@website.zip"             \
     https://api.netlify.com/api/v1/sites
```

### Waiting for processing

You can poll the deploy to check the state:

``` http
GET /deploys/1234 HTTP/1.1
```
> Example Response

``` json
{
  "deploy_id": "1234",
  "state": "ready"
}
```

Once the state changes to "ready", the deploy is live.

### Draft deploys

When creating a new deploy, you can set `"draft": true` to mark the deploy as a draft deploy.

Draft deploys works just like normal deploys, but they won't change the active deploy of the site once they're done processing.
