---
title: go~mus API Documentation

language_tabs:
  - shell

toc_footers:
  - <a href='https://gomus.de'>go~mus</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the go~mus API! You can use our API to access go~mus API endpoints, which can get information on various museums, exhibitions and products in our database.

We have language bindings in Shell and Ruby! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/tripit/slate). Feel free to contribute.

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Bearer meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

go~mus uses API keys to allow access to the API. You can request a new go~mus API key by email.

go~mus expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Museums

## Get All Museums

```shell
curl "https://demo.gomus.de/api/v3/smart/museums"
  -H "Authorization: Bearer meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
    "museums": [
        {
            "cms_approach": "",
            "cms_contact": "",
            "cms_detail_infos": "",
            "cms_email": "",
            "cms_opening_hours": "",
            "cms_phone": "",
            "cms_short_infos": "",
            "cms_url": "",
            "created_at": "2015-12-16T09:17:16+01:00",
            "id": 56,
            "is_archived": false,
            "name": "Hamburger Kunsthalle",
            "name_payment": "Hamburger Kunsthalle",
            "picture": {
                "article": "https://demo.gomus.de/production/museums/56/article/ansichten-der-hamburger-kunsthalle--7-.jpg?1450253834",
                "copyright_info": null,
                "description": null,
                "detail": "https://demo.gomus.de/production/museums/56/detail/ansichten-der-hamburger-kunsthalle--7-.jpg?1450253834",
                "preview": "https://demo.gomus.de/production/museums/56/preview/ansichten-der-hamburger-kunsthalle--7-.jpg?1450253834",
                "teaser": "https://demo.gomus.de/production/museums/56/teaser/ansichten-der-hamburger-kunsthalle--7-.jpg?1450253834",
                "thumbnail": "https://demo.gomus.de/production/museums/56/thumbnail/ansichten-der-hamburger-kunsthalle--7-.jpg?1450253834",
                "title": null
            },
            "updated_at": "2015-12-16T09:45:38+01:00"
        }
    ]
}
```

This endpoint retrieves all museums.

### HTTP Request

`GET https://demo.gomus.de/api/v3/smart/museums`

### Query Parameters

See API reference. TODO: link to v3.html (raml)

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

