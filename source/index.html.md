---
title: Affinity API Reference

language_tabs:
  - shell

toc_footers:

includes:
  - data-model
  - entity-attributes
  - lists
  - list-entries
  - persons
  - relationship-strengths
  - organizations
  - opps
  - entity-values
  - entity-value-changes
  - notes
  - entity-files
  - webhooks
  - additional-materials
---

# Introduction

Welcome to the Affinity API! This API provides a RESTful interface for performing
operations on the different objects that make up Affinity. If you are trying to
accomplish an action through this API and are not sure on what endpoints to use, or
if you have ideas on more endpoints we could create to make your workflow easier,
please do not hesitate to contact us at `support@affinity.co`.

# Overview

## Authentication

> Authentication using HTTP basic auth.

```shell
curl "https://api.affinity.co/api_endpoint" -u :<API-KEY>
```

To use the API, you will need to generate an API secret key. This can be done easily through
the Settings Panel that is accessible through the left sidebar on the Affinity web app.

Requests are authenticated using [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication).
Provide your API key as the basic auth password. You do not need to provide a username.

Currently, we support one key per user on your team. Once you have generated a key, you
will need to pass in the key with every API request for us to process it successfully.
Otherwise, an error with a code of `401` will be returned.

## Requests & Responses

This is a full-featured RESTful API. We provide reading & writing functionality for each
object type in Affinity. All requests use the base URL of `https://api.affinity.co/`.

Responses to each request are provided as a JSON object. The response is either the data
requested, or a valid error message and error code as outlined below.

Here is a list of all the error codes the Affinity API returns in case something does not go as expected:

| Error Code | Meaning                                                                                                                                                                                                      |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 401        | Unauthorized -- Your API key is invalid.                                                                                                                                                                     |
| 404        | Not Found -- Requested resource does not exist.                                                                                                                                                              |
| 422        | Unprocessable Entity -- Malformed parameters supplied. This can also happen in cases the parameters supplied logically cannot complete the request. In this case, an appropriate error message is delivered. |
| 429        | Too Many Requests -- You have exceed the rate limit.                                                                                                                                                         |
| 500        | Internal Server Error -- We had a problem with our server. Try again later.                                                                                                                                  |
| 503        | Service Unavailable -- This shouldn't generally happen. Either a deploy is in process, or Affinity services are down.                                                                                        |

**Note:** Requests must be sent over HTTPS. Requests sent over HTTP will not return any
data in order to ensure your sensitive information remains secure.

## Rate Limiting

Each API key is limited to 40K requests per day. Once you hit the quota, all further requests will return an error code of
429 - this will reset as soon as the next day begins.
