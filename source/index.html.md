---
title: go.screver.com API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

This is initial go.screver.com API v1 Documentation. 

# Authentication

> To get an access token, send the following request:

```shell
curl -X POST https://go.screver.com/oauth/v2/token
  -d "client_id=clientid"
  -d "client_secret=clientsecret"
  -d "grant_type=client_credentials"
```

> Make sure to replace `clientid` and `clientsecret` with your OAuth client id and secret.

> The above command returns JSON structured like this:

```json
{
  "token_type": "Bearer",
  "access_token": "u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3",
  "expires_in": 3600
}
```

go.screver.com uses a token to allow access to the API. 
An OAuth client credentials request is used to obtain a token. 
[Contact us](https://www.go.screver.com/contact-us/) to get your OAuth `client id` and `client secret`. 
The token can be used for the number of seconds returned in the `expires_in` field.

`Authorization: Bearer u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3`

<aside class="notice">
You must replace <code>u8ptxAd2hJ3aRjtgwwmUqqkNpcMOYxf3</code> with the access token you received from the OAuth request.
</aside>

# Questions

## Get all questions
