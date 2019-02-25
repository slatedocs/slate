---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - zones
  - vehicles
  - customers
  - rental
  - itineraries
  - errors

search: true
---

# Introduction

Welcome to the Tier API. It provides the essentials to integrate with Tier's mobility platform.
We are using the JSON:API standard.

# Authentication

> To authorize, use this code:


```shell
curl "api_endpoint_here"
  -H "x-api-key: TIER API KEY"
```

> Make sure to replace `TIER API KEY` with your API key.

Tier is using an API Keys based authentication. To register for an access key send an email
to <a href='mailto:api@tier.app'>api@tier.app</a>

`x-api-key: YOUR TIER KEY`

<aside class="notice">
You must replace <code>TIER API KEY</code> with your personal API key.
</aside>

The customer relevant endpoints are using JWT
