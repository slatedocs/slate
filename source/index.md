---
title: Recruiterbox | API Reference

includes:
  - pagination
  - errors
  - openings

language_tabs:
  - shell

toc_footers:



search: false
---

# Introduction

Welcome to the Recruiterbox API


# Authentication

Authentication is done via the API key which you can find in [Settings -> Advanced Settings -> API Key](https://app.recruiterbox.com/app/#settings/api-key/)

Requests are authenticated using [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username. You do not need to provide a password.

You can see your API key, and revoke it if necessary. Be sure to keep your API key a secret.

> Example Request

```shell
curl https://api.recruiterbox.com/v1/openings -u {key}:

curl uses the -u flag to pass basic auth credentials (adding a colon after your API key will prevent it from asking you for a password).

```

<aside class="notice">
You must replace `{key}` with your API key.
</aside>

