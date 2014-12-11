---
title: MojoPages API Documentation


toc_footers:
  - <a href='#'>Get an Access</a>
  - <a href='http://help.mojopages.com'>Get some help</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>
  - <p>&#169; 2014 MojoPages, Inc. San Diego, CA</p>

includes:
  - apiv1
  - changelog
  - errors
  - terms

search: true
---

# Introduction

Welcome to the MojoPages API documentation! MojoPages is a local business search application which uses social media to provide relavant and interesting results. The API is RESTful and enables adding, updating or delete business listing data on [MojoPages.com](http://mojopages.com) and it's properties. The API also allows you to check the status and map your business data to our database as well as retrieve all your business listings within our system. 

Sample code is currently available as cURL in the dark area to the right. Requests and responses are all in JSON. 

The API base url is: **http://api.mojopages.com/api/v1/**

The API is versioned, the current version is 1. This is designated in the url path with /v1

If you have any question please visit [our support pages](http://help.mojopages.com).


# Authentication

> To set authorization, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl http://api.mojopages.com/api/v1/status 
  -H "Authorization: Token token='YOUR-ACCESS-TOKEN'"
```

> Make sure to replace `YOUR-ACCESS-TOKEN` with your API access key.

MojoPages uses API keys to allow access to the API. You can get an account by contacting us.

The MojoPages API expects for the API key to be included in all API requests to the server. The API key can be passed either as a parameter like the following:

`access_token=YOUR-ACCESS-TOKEN`

Or in a header that looks like the following:

`Authorization: Token token="YOUR-ACCESS-TOKEN"`

<aside class="notice">
You must replace `YOUR-ACCESS-TOKEN` with your API key.
</aside>
