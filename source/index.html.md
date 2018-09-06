---
title: XONIO API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - users
  - currency
  - wallet
  - shop
  - conversion
  - transfer
  - reward
  - record
  - settings
  - errors

search: true
---

# Introduction

Welcome to the XONIO API! You can use our API to access XONIO API endpoints, which can get information in our database.

We have language bindings in shell provided. You can view code examples in the dark area to the right.

This example API documentation page was created with [Slate](https://github.com/lord/slate).

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Bearer <TOKEN>"
```

> Make sure to replace `<TOKEN>` with your token.

XONIO uses OAuth 2.0 to allow access to the API.

XONIO expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer 9fdsf0s7df23.dsf7dbbv68786.4vhbv34x5jgvh2`

<aside class="notice">
You must replace <code>9fdsf0s7df23.dsf7dbbv68786.4vhbv34x5jgvh2</code> with your personal token.
</aside>