---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - config
  - products
  - orders
  - errors

search: true
---

# Introduction

 Bienvenido a la documentación de apis de loadingplay

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"
```

> Make sure to replace `YOUR_ACCESS_TOKEN` with your API key.

Loadingplay uses API keys to allow access to the API. You can register a new Loadingplay API key at our [developer contact](mailto:ricardo@loadingplay.com).

The API expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer YOUR_ACCESS_TOKEN`

<aside class="notice">
You must replace <code>YOUR_ACCESS_TOKEN</code> with your personal API key.
</aside>

