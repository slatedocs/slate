---
title: The Growth App API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - javascript

toc_footers:
  - <a href='https://thegrowthapp.com/settings'>Create an API client</a>

includes:
  - errors

search: true
---

# Introduction

The API for The Growth App has been built around [REST](https://en.wikipedia.org/wiki/Representational_state_transfer). It uses HTTP response codes to indicate API errors. We support [cross-origin resource sharing](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing), allowing you to interact securely with our API from a client-side web application (though you should never expose your secret API key in any public website's client-side code). [JSON](http://www.json.org/) is returned by all API responses.

# Authentication

> To access the API, you first have to request an `access_token`, by logging in.

```shell
curl "https://api.thegrowthapp.com/v1/auth/login?username=abc&password=def"
```

```javascript
import TheGrowthApp from thegrowthapp

const client = new TheGrowthApp('username', 'password')
```

> You may now use your `access_token` to access any resource your account is authorized for.

```shell
curl "https://api.thegrowthapp.com/v1/growthbooks"
  -H "Authorization: Bearer <token>"
```

```javascript
client.growthbooks.all()
```

> When the `access_token` expired, you have to request a new one using your `refresh_token`. (You may also login for as many times you want)

```shell
curl "https://api.thegrowthapp.com/v1/auth/refresh_token"
  -H "Authorization: Bearer <token>"
```

```javascript
# Our library automatically detects when a new `access_token` is required, and calls this method accordingly.
client.refresh_token()
```

We use [JSON Web Tokens](https://jwt.io/) for authentication. Before accessing the API, you either have to signup to create a new user, or login using the credentials of an existing user. Requests will contain an `access_token` and a `refresh_token` as payload.

We expect for the `access_token` to be included in all following API requests to the server in a header that looks like the following:

`Authorization: Bearer <token>`

<aside class="notice">
Replace <code>&lt;token&gt;</code> with your <code>access_token</code>.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete
