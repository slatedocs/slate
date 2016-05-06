---
title: API Reference

language_tabs:
  - shell
  - ruby
  - python

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the GoRaise API! You can use our API to get information on various retailers, rates and users in our database.

We have language bindings in Shell, PHP &amp; Javascript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/tripit/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```php
some code
```

```js
some code
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: your_token"
```

> Make sure to replace `your_token` with your API key.

GoRaise uses API keys to allow access to the API. You can request a new GoRaise API key by contacting [our API team](https://www.goraise.co.uk/contact).

GoRaise expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>your_token</code> with your personal API key.
</aside>

# Retailers

## Get All Retailers

```php
some code
```

```js
some code
```

```shell
curl "https://api.goraise.co.uk/rest/retailers"
  -H "Authorization: your_token"
```

> The above command returns JSON structured like this:

```json
{
  "status": 200,
  "counts": {
    "start": 0,
    "limit": 100,
    "total": 2703
  },
  "items": [
    {
      "id": "1166",
      "name": "(IS) Interserver Webhosting and VPS",
      "description": null,
      "shortname": "isinterserverwebhostingandvps",
      "logo": null,
      "rate_highest_value": null,
      "rate_highest_type": null,
      "featured": "0",
      "featured_order": "0",
      "website_url": "http://www.interserver.net",
      "domain_aliases": null,
      "quality_score": null
    },
    {
      "id": "1121",
      "name": "(s) Strikingly",
      "description": null,
      "shortname": "sstrikingly",
      "logo": null,
      "rate_highest_value": "5",
      "rate_highest_type": "percent",
      "featured": "0",
      "featured_order": "0",
      "website_url": "https://www.strikingly.com/",
      "domain_aliases": null,
      "quality_score": null
    }
  ]
}
```

This endpoint retrieves all retailers.

### HTTP Request

`GET https://api.goraise.co.uk/rest/retailers`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
start | 0 | The initial search offset of the results
limit | 100 | How many results to pull back in one go. Can range from 1-200
name | false | Filter retailers by their name. Omit this to bring back all retailers

## Get a Specific Retailer

```php
some code
```

```js
some code
```

```shell
curl "https://api.goraise.co.uk/rest/retailers/1121"
  -H "Authorization: your_token"
```

> The above command returns JSON structured like this:

```json
{
  "status": 200,
  "counts": {
    "total": 1
  },
  "items": [
    {
      "id": "1121",
      "name": "(s) Strikingly",
      "description": null,
      "shortname": "sstrikingly",
      "logo": null,
      "rate_highest_value": "5",
      "rate_highest_type": "percent",
      "featured": "0",
      "featured_order": "0",
      "website_url": "https://www.strikingly.com/",
      "domain_aliases": null,
      "quality_score": null
    }
  ]
}
```

This endpoint retrieves a specific retailer.

<aside class="warning">Make sure your retailer ID reference is an integer!</aside>

### HTTP Request

`GET https://api.goraise.co.uk/retailers/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the retailer to retrieve

