---
title: API Reference

language_tabs:
  - curl
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='/'>Request Access to the Scale Beta</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

> API Endpoint

```
https://api.scaleapi.com/v1/
```

Welcome to the Scale API! You can use our API to access Scale API endpoints, which can create, access, and cancel human tasks.

Currently our API is in Beta, so please [contact us](http://www.scaleapi.com) to get started using Scale. We're working to handle as many customers as possible.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# Authentication

> To authorize, use this code:

```ruby
require 'scale'

api = Kittn::APIClient.authorize!('YOUR_API_KEY')
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
```

```curl
# With curl, you can just pass the correct header with each request
curl "api_endpoint_here"
  -u "YOUR_API_KEY:"
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
```

> Make sure to replace `YOUR_API_KEY` with your API key.

Scale uses API keys to allow access to the API. You can register a new Scale API key on your dashboard (if you access to Scale).

Scale expects for the API key to be included in all API requests to the server via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username value. You do not need to provide a password. You can do this using the `-u` flag:

`-u YOUR_API_KEY:`

<aside class="notice">
You must replace <code>YOUR_API_KEY</code> with your personal API key.
</aside>

# Create Tasks

## Create Transcription Task

```ruby
require 'scale'

api = Kittn::APIClient.authorize!('YOUR_API_KEY')
api.kittens.get
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.kittens.get()
```

```shell
curl "https://api.scaleapi.com/api/task/transcription"
  -u YOUR_API_KEY:
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
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

`GET https://api.scaleapi.com/api/task/transcription`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Create Buy Product Task

```ruby
require 'scale'

api = Kittn::APIClient.authorize!('YOUR_API_KEY')
api.kittens.get
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.kittens.get()
```

```shell
curl "https://api.scaleapi.com/api/task"
  -u YOUR_API_KEY:
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
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

`GET https://api.scaleapi.com/api/task`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

## Create Categorization Task

```ruby
require 'scale'

api = Kittn::APIClient.authorize!('YOUR_API_KEY')
api.kittens.get
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.kittens.get()
```

```shell
curl "https://api.scaleapi.com/api/task"
  -u YOUR_API_KEY:
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
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

`GET https://api.scaleapi.com/api/task`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

# Task Endpoints

## Retrieve a Task

```ruby
require 'scale'

api = Kittn::APIClient.authorize!('YOUR_API_KEY')
api.kittens.get(2)
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.kittens.get(2)
```

```shell
curl "https://api.scaleapi.com/api/task/2"
  -u YOUR_API_KEY:
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
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

This endpoint retrieves a specific task.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET https://api.scaleapi.com/tasks/{TASK_ID}`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

### Returns

Returns a task if a valid identifier was provided, and returns an error otherwise.

## List All Tasks

```ruby
require 'scale'

api = Kittn::APIClient.authorize!('YOUR_API_KEY')
api.kittens.get(2)
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.kittens.get(2)
```

```shell
curl "https://api.scaleapi.com/api/task/2"
  -u YOUR_API_KEY:
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
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

## Cancel a Task

```ruby
require 'scale'

api = Kittn::APIClient.authorize!('YOUR_API_KEY')
api.kittens.get(2)
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.kittens.get(2)
```

```shell
curl "https://api.scaleapi.com/api/task/2"
  -u YOUR_API_KEY:
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
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

