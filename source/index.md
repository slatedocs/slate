---
title: API Reference

language_tabs:
  - shell
  - ruby
  - python
  - .net

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>


includes:
  - errors

---

# Introduction V1 APIs

Welcome to the Evercam.io V1 API Documentation, currently the production default. Within the docs, we provide examples in Curl, Python, Java, Nodejs and .Net. You can view code examples in the area to the right, and you can switch the programming language of the examples with the tabs in the top right.

*For more information about Evercam.io you can visit our documentation. Documentation for the Beta APIs can be found here.*


## Getting Started

The Evercam.io API is based on REST: it is comprised of resources with predictable urls and utilises standard HTTP features (like HTTP Basic Authentication, Response Codes and Methods). All requests, including errors, return JSON. The API expects JSON for all POST and PUT requests.


## Client Frameworks and Libraries

Evercam libraries

* Ruby - https://github.com/evercam/evercam-ruby
* Ruby on Rails - https://github.com/evercam/evercam-rails

3rd party libraries

* Python - https://github.com/evercam/evercam.py
* .NET - https://github.com/evercam/evercam.net
* Node.js - https://github.com/evercam/evercam.node
* Java - https://github.com/evercam/evercam.java


## API Endpoint

The base URI for the V1 API is -

* https://api.evercam.io/v1


## API Resources

The V1 API exposes the following resources -

* /users


## Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import 'kittn'

api = Kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace `meowmeowmeow` with your personal API key.
</aside>

# cameras

## Get All cameras

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.cameras.get
```

```python
import 'kittn'

api = Kittn.authorize('meowmeowmeow')
api.cameras.get()
```

```shell
curl "http://example.com/api/cameras"
  -H "Authorization: meowmeowmeow"
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
    "name": "Isis",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all cameras.

### HTTP Request

`GET http://example.com/cameras`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include cameras that have already been adopted.

<aside class="success">
Remember — a happy camera is an authenticated camera!
</aside>

## Get a Specific camera

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.cameras.get(2)
```

```python
import 'kittn'

api = Kittn.authorize('meowmeowmeow')
api.cameras.get(2)
```

```shell
curl "http://example.com/api/cameras/3"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Isis",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific camera.

<aside class="warning">If you're not using an administrator API key, note that some cameras will return 403 Forbidden if they are hidden for admins only.</aside>

### HTTP Request

`GET http://example.com/cameras/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the cat to retrieve

