---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - user
  - models
  - profile
  - playlist
  - goal
  - event
  - event_list

search: true
---

# Introduction

Welcome to the magpie API V2! You can use our API to incorporate user specific learning recommendations in your application, based on various inputs. You will be able to generate recommendations from content in an instance of magpie, retrieve information on your organisation, a user's profile and asset metadata.

Requests are made in the context of a user taking actions that trigger the API calls and not at an administrator level.
The API uses the JSON-RPC protocol (jsonrpc2). There is a client-side library available too as a way to speed up and simplify integration.


# Authentication

> Initial authentication HTTP authorisation header:

```http
Authorization: Bearer <API_KEY> eeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImI4MWkyY25hb3BmMDAyZ205bmJnIiwi
ZW1haWwiOiJhdEBmaWx0ZXJlZC5jb20iLCJmaXJzdE5hbWUiOiJBbGV4YW5kcnUiLCJsYXN0TmFtZSI6IlRyaWNhIn0.g_ZY56SDwIrIoc-e6e
noc1x69D5o2iW0S4KSqgx_UYY
```
> Initial authentication response:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"jwt_access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiJiYmJuN2x2YXRhYWcwMjZpdjJtZyIsIk9yZ0lEIjoiZmlsdGVyZWQiLCJHcm91cElEIjoiZmlsdGVyZWQtZ2xvYmFsZmlsdGVyIn0.e7A_2EQLwS3v7dOVTq0I5afjnmSWYfqmBngFOlRsaJI",
		"refresh_token": "wZk2AnHuCuMplJ2P52a3hK0nZ2CfnQEWH1jLR7Nk"
	},
	"id": "json"
}
```

> Other API calls HTTP authorisation header:

```http
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiJiYmJuN2x2YXRhYWcwMjZpdjJtZyIsIk9yZ0
lEIjoiZmlsdGVyZWQiLCJHcm91cElEIjoiZmlsdGVyZWQtZ2xvYmFsZmlsdGVyIn0.-r1E5oojKbvSaS-xKZW_VlYHThmBUCfC-5M6TaOsfyM
```

Authentication will be initiated on the client side using the **User.Authenticate** method. This method will either authenticate an existing user in our
system or, in case the user does not exist, create one. We will need in this initial call a user identifier that will be used to link data to said user. Optionally, meta data about the user can be provided. The user information will be stored in a JWT token, encrypted with a secret authentication key.

The system will return a structure containing an access token and a refresh token. The access token will be used in subsequent API requests until it expires.
On expiration, through the **User.Refresh** method, a new access token will be provided.

Api and secret authentication keys will be provided and used only during the authentication request. All future requests will use the server generated access token.

**Client authentication JWT claims structure:**

Name | Type | Notes
--------- | ------- | -----------
id | String | Max ? chars. Any format. No personal information.
email | String, Optional | Max ? chars.
firstName | String, Optional | Max ? chars.
lastName | String, Optional | Max ? chars.

<aside class="notice">
Token will be encrypted with the secret authentication key.
</aside>

<aside class="warning">
Implementations with SSO integration will need more in depth discussions and configurations.
You will need to contact the Filtered Technologies product department.
</aside>
