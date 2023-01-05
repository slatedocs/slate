---
title: SimplyPrint API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: cURL
#  - python: Python 3

toc_footers:
  - <a href='https://simplyprint.io' target='_blank'>SimplyPrint</a>
  - <a href='https://help.simplyprint.io' target='_blank'>Need help?</a>

includes:
  - files
  - filament
  - account
  - queue
# - oauth
  - printers
  - permissions
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the SimplyPrint API
  - name: keywords
    content: SimplyPrint API,SimplyPrint Documentation

# TODO; Add open graph tags
---

# Getting Started

<aside class="notice">
  <b>The SimplyPrint API is under construction!</b>

  This means this site is unfinished, and many endpoints are not yet documented. If you have any questions, please contact us via our <a href="https://help.simplyprint.io">helpdesk</a>.
</aside>

Welcome to the **SimplyPrint API**!

This documentation goes through authenticating and how to use the API. To get started you'll need an API key.

## Getting an API key

To get an API key you'll need a SimplyPrint account that is either a member of an organization or has at least the [SimplyPrint Pro plan](https://simplyprint.io/#pricing).

To create your own API key you first need a SimplyPrint account, you can go to your [account settings](https://simplyprint.io/panel/user_settings/security) and create a new API key.

TODO; Create API key page and explain how to create an API key.

## The base URL

The base URL for the SimplyPrint API is `https://api.simplyprint.io/{id}/`.

To use the base API at <https://api.simplyprint.io>, you will need to specify an id.

The id represents the unique identifier for the company that you are using the API key for. This id is used to access the specific functionality within the API that is associated with the company.

The endpoint represents the specific functionality that you want to access within the API. There are various endpoints available, each with its own specific purpose and functionality.

For example, if you want to access the `account/Test` endpoint for a company with an id of 123, you would use the following API endpoint:

<https://api.simplyprint.io/123/account/Test>

If you are part of an organization, you might need to ask your organization administrator to allow API access for your account for the organization.

<aside class="notice">
  <b>For the rest of this documentation, we will use the following variables:</b>

  <ol>
    <li>Replace <code>{base_url}</code> with your base api url</li>
    <li>Replace <code>{API_KEY}</code> with your API key</li>
  </ol>
</aside>

## Test your API key

```shell
curl {base_url}/account/Test \
  --header 'X-API-KEY: {API_KEY}'
```

```python
import requests

url = "{base_url}/account/Test"

r = requests.get(url, headers={'X-API-KEY': '{API_KEY}'})

print(r.json())
```

> Success return:

```json
{
  "status": true,
  "message": "Your API key is valid!"
}
```

> Error return in case of an invalid or missing API key:

```json
{
  "status": false,
  "message": "No API key provided, or not logged in"
}
```

> Error return in case of missing permissions for the organization:

```json
{
  "status": false,
  "message": "You don't have access to this account"
}
```

To verify that your API key is valid and that you have access to the desired organization, you can make a request to the `/account/Test` endpoint.

To make any request to the SimplyPrint API, you will need to include your API key in the request header. You can do this by including the `X-API-KEY` header in your request. On the right side of this page, you can see an example of how to make a request to the `/account/Test` endpoint using cURL and Python.

If you are unable to successfully make a request to the `/account/Test` endpoint using the provided example, there may be a few possible issues:

- Your API key may be invalid or missing. Make sure that you have a valid API key and that you are including it in the request header as shown in the example.
- You may not have access to the organization specified in the `id` parameter. Make sure that you are using the correct `id` for the organization that you have access to.
- There may be a problem with the base API URL or endpoint. Double check that you are using the correct base API URL and endpoint in your request.

If you are unable to resolve the issue after troubleshooting these potential issues, you may need to contact your organization administrator for further assistance. Otherwise, feel free to contact us via our [helpdesk](https://help.simplyprint.io/).
