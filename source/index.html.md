---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - widget
  - profile
  - playlist
  - goal
  - chat
  - event
  - event_list

search: true
---

# Introduction

Welcome to the Magpie API! You can use our API to to retrieve information on your organisation and generate user specific recommendations
based on various inputs.

Requests are made in the context of a user taking actions that trigger the API calls and not at an administrator level.
The API uses the JSON-RPC protocol. There is a client-side library available too as a way to speed up and simplify integration.


# Authentication

> Request Payload:

```shell
{
    "id":    "99850fed-cf9c-4b15-9b5c-e901beb29cc5",
    "email": "wile@acme.com",
    "name":  "Wile E.",
}

```


Both server-side and client-side use [JSON Web Tokens](https://jwt.io/introduction/) (JWT). This will require some server-side code in both cases.
There are off-the-shelf [libraries](https://jwt.io/#libraries) available for many languages. The JWT will be signed and encrypted.

An api key, secret key and organisation will be provided. These will be used to identify and authorise the requester.

The payload format is as follows

Name | Type | Notes
--------- | ------- | -----------
id | String | Max ? chars. Any format. No personal information.
email | String, Optional | Max ? chars.
name | String, Optional | Max ? chars.


`Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImI4MWkyY25hb3BmMDAyZ205bmJnIiwiZW1haWwiOiJ3aWxlQGFjbWUuY29tIiwibmFtZSI6IldpbGUgRS4iLCJvcmdhbmlzYXRpb24iOiJmaWx0ZXJlZCJ9.ywk-tC9tBkI3QABXHrFJArsRa2FYHSyLDbJ25GeDeDU`

<aside class="notice">
You must replace <code>5dc78bab-4988-4a15-96a2-9eb084fba6f6</code> with your personal API key.
Your token should be encrypted with the provided secret key.
</aside>
