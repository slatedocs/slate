---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='mailto:api@tier.app'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - vehicles
  - zones
  - pricing
  - rental
  - invoice
  - pickup
  - dropoff
  - automations
  - errors

search: true
---

# Introduction

Welcome to the Tier API. It provides the essentials to integrate with Tier's mobility platform.
There's different levels of access for mobility and logistics partners.
Access is limited for different endpoints and zones for each API key individually.

The first half of the documentation is tailored to mobility partners wanting to integrate listing of
rentable vehicles and start and stop rentals on behalf of their own users.

The second half is for logistics providers that need to know where to find scooters that need to
be picked up and where to drop them off next day.

## Format

The Tier API is using the [JSON:API standard](https://jsonapi.org/).

## Versioning

The API is versioned using a prefix in the URL, e.g. `/v1` for the first version. There are
still some unversioned (deprecated) endpoints. If you are using these, please note that they will stop
working in future releases of this API. Please always use the newest API version and contact
us when there is a reason why you cannot switch to a newer version.

## Backwards-Compatible Minor Updates

We will only break backwards compatibility in new API versions, which have their own URL prefix.
That means that all actions or resources will remain backwards compatible as long as your integration
allows for the following changes to be made on our side:

 - An endpoint resource might return new fields, e.g. `{"foo": "bar"}` might be `{"foo": "bar", "baz": 123}` tomorrow 
 - An endpoint might accept new optional data or parameters
 - An endpoint might ignore previously required data while providing same functionality
  

# Authentication

> To authenticate, use this code:


```shell
curl "api_endpoint_here"
  -H "x-api-key: TIER API KEY"
```

> Please make sure to replace `TIER API KEY` with your API key.

Tier is using an API Keys based authentication. To register for an access key send an email
to <a href='mailto:api@tier.app'>api@tier.app</a>. Each API key is bound to certain permissions
that determine which zones and endpoints you can access.

`x-api-key: YOUR TIER KEY`

<aside class="notice">
You must replace <code>TIER API KEY</code> with your personal API key.
</aside>

