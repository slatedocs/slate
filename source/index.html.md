---
title: API Reference

language_tabs:
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='http://www.scaleapi.com/'>Request Access to the Scale Beta</a>
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

<!-- We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.
 -->
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

```shell
# With curl, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -u "YOUR_API_KEY:"
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
```

> Make sure to replace `YOUR_API_KEY` with your API key.

Scale uses API keys to allow access to the API. You can register a new Scale API key on your dashboard (if you have access to Scale).

Scale expects for the API key to be included in all API requests to the server via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username value. You do not need to provide a password. You can do this using the `-u` flag:

`-u YOUR_API_KEY:`

<aside class="notice">
You must replace <code>YOUR_API_KEY</code> with your personal API key.
</aside>

# Task Object

The task object represents a single task that you create with Scale and is completed by a worker.

```json
{
  "task_id": "576ba74eec471ff9b01557cc",
  "completed_at": "2016-06-23T09:10:02.798Z",
  "created_at": "2016-06-23T09:09:34.752Z",
  "callback_url": "http://www.example.com/test_callback",
  "type": "categorization",
  "status": "completed",
  "instruction": "Would you say this item is big or small?",
  "params": {
    "attachment_type": "text",
    "attachment": "car",
    "categories": [
      "big",
      "small"
    ]
  },
  "response": {
    "category": "big",
    "status_code": 200
  }
}
```

### Attributes

Attribute | Type | Description
--------- | ------- | -----------
task_id | string | The `task_id` is the unique identifier for the task.
type | string | The type of the task. Currently, we support `categorization`.
instruction | string | A plaintext string explaining the instructions for the task.
params | object | An object with the parameters of the task based on the type. For `categorization`, this will include `attachment_type`, `attachment`, and `categories`.
response | object | An object corresponding to the response once the task is completed. For `categorization`, it will have the attribute `category`, corresponding to the chosen category.
callback_url | string | A string of the URL that should be POSTed once the task is completed for the response data. See the Callback section for more details.
status | string | The status of the task, one of `pending`, `completed`, or `canceled`.
created_at | timestamp | A string of the UTC timestamp of when the task was created.
completed_at | timestamp | A string of the UTC timestamp of when the task was completed. This will only be filled in after it is completed.

# Callbacks

> The `callback_url` will be POSTed with `x-www-form-urlencoded` data of the following object form:

```json
{
  "task": {
    "completed_at": "2016-06-23T21:54:44.904Z",
    "response": {
      "category": "big",
      "status_code": "200"
    },
    "created_at": "2016-06-23T20:08:31.573Z",
    "callback_url": "http://www.example.com/test_callback",
    "type": "categorization",
    "status": "completed",
    "instruction": "Is this object red or blue?",
    "params": {
      "attachment_type": "text",
      "attachment": "tomato",
      "categories": [
        "big",
        "small"
      ]
    },
    "task_id": "576c41bf13e36b0600b02b34"
  },
  "response": {
    "status_code": "200",
    "category": "big"
  },
  "task_id": "576c41bf13e36b0600b02b34"
}
```

On your tasks, you will be required to supply a `callback_url`, a fully qualified URL that we will POST with the results of the task when completed. The data will be `x-www-form-urlencoded`.

You should respond to the POST request with a 200 status code. If we do not receive a 200 status code, we will retry one more time.

### POST Data

Attribute | Type | Description
--------- | ------- | -----------
task_id | string | The `task_id` is the unique identifier for the task.
response | object | The response object of the completed request. For `categorization`, it will contain a `category` attribute of the assigned category.
task | object | The full task object for reference and convenience.

# Create Tasks

## Create Categorization Task

```ruby
require 'scale'

api = Scale::APIClient.authorize!('YOUR_API_KEY')
api.tasks.createCategorization()
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.tasks.createCategorization()
```

```shell
curl "https://api.scaleapi.com/api/task" \
  -u YOUR_API_KEY:
  -d callback_url="http://www.example.com/callback" \
  -d instruction="Is this company public or private?" \
  -d attachment_type=website \
  -d attachment="http://www.google.com/" \
  -d categories[]=public \
  -d categories[]=private
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
api.tasks.createCategorization();
```

> The above command returns JSON structured like this:

```json
{
  "task_id": "576ba74eec471ff9b01557cc",
  "created_at": "2016-06-23T09:09:34.752Z",
  "callback_url": "http://www.example.com/callback",
  "type": "categorization",
  "status": "pending",
  "instruction": "Is this company public or private?",
  "params": {
    "attachment_type": "website",
    "attachment": "http://www.google.com/",
    "categories": [
      "public",
      "private"
    ]
  }
}
```

This endpoint creates a `categorization` task. 

This task involves a plaintext `instruction` about how to make the categorization, an `attachment` of what you'd like to categorize, an `attachment_type`, and finally a list of categories.

If successful, Scale will immediately return the generated task object, of which you should at least store the `task_id`.

The parameters `attachment_type`, `attachment`, and `categories` will be stored in the `params` object of the constructed `task` object.

### HTTP Request

`POST https://api.scaleapi.com/v1/task/categorize`

### Parameters

Parameter | Type | Description
--------- | ---- | -------
callback_url | string | The full url (including the scheme `http://` or `https://`) of the callback when the task is completed.
instruction | string | The plaintext instruction of how to categorize the item.
attachment_type | string | One of `text`, `image`, `video`, `audio`, or `website`. Describes what type of file the attachment is.
attachment | string | The attachment to be categorized. If `attachment_type` is `text`, then it should be plaintext. Otherwise, it should be a URL pointing to the attachment.
categories | [string] | An array of strings for the categories which you'd like the object to be sorted between.

# Task Endpoints

## Retrieve a Task

```ruby
require 'scale'

api = Scale::APIClient.authorize!('YOUR_API_KEY')
api.kittens.get('576ba74eec471ff9b01557c')
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.tasks.get('576ba74eec471ff9b01557cc')
```

```shell
curl "https://api.scaleapi.com/v1/task/{task_id}" \
  -u YOUR_API_KEY:
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
let max = api.tasks.get('576ba74eec471ff9b01557cc');
```

> The above command returns JSON structured like this:

```json
{
  "task_id": "576ba74eec471ff9b01557cc",
  "completed_at": "2016-06-23T09:10:02.798Z",
  "created_at": "2016-06-23T09:09:34.752Z",
  "callback_url": "http://www.example.com/test_callback",
  "type": "categorization",
  "status": "completed",
  "instruction": "Would you say this item is big or small?",
  "params": {
    "attachment_type": "text",
    "attachment": "car",
    "categories": [
      "big",
      "small"
    ]
  },
  "response": {
    "category": "big",
    "status_code": 200
  }
}
```

This endpoint retrieves a specific task.

### HTTP Request

`GET https://api.scaleapi.com/v1/task/{TASK_ID}`

### URL Parameters

Parameter | Description
--------- | -----------
task_id | The task_id of the task to retrieve

### Returns

Returns a task if a valid identifier was provided, and returns a 404 error otherwise.

## List All Tasks

```ruby
require 'scale'

api = Scale::APIClient.authorize!('YOUR_API_KEY')
api.tasks.list()
```

```python
import scale

api = scale.authorize('YOUR_API_KEY')
api.tasks.list()
```

```shell
curl "https://api.scaleapi.com/v1/tasks" \
  -u YOUR_API_KEY:
```

```javascript
const scale = require('scale');

let api = scale.authorize('YOUR_API_KEY');
let max = api.tasks.list();
```

> The above command returns JSON structured like this:

```json
[
  {
    "created_at": "2016-06-23T08:10:51.032Z",
    "callback_url": "http://www.example.com/test_callback",
    "type": "categorization",
    "status": "completed",
    "instruction": "Is this object big or small?",
    "params": {
      "attachment_type": "text",
      "attachment": "ant",
      "categories": [
        "big",
        "small"
      ]
    },
    "completed_at": "2016-06-23T19:36:23.084Z",
    "response": {
      "status_code": 200,
      "category": "small"
    },
    "task_id": "576b998b4628d1bfaed7d3a4"
  },
  {
    "created_at": "2016-06-23T08:51:13.903Z",
    "callback_url": "http://www.example.com/test_callback",
    "type": "categorization",
    "status": "completed",
    "instruction": "Is this object big or small?",
    "params": {
      "attachment_type": "text",
      "attachment": "T-Rex",
      "categories": [
        "big",
        "small"
      ]
    },
    "completed_at": "2016-06-23T09:09:10.108Z",
    "response": {
      "status_code": 200,
      "category": "big"
    },
    "task_id": "576ba301eed30241b0e9bbf7"
  }
]
```

This endpoint retrieves a list of your tasks.

### HTTP Request

`GET https://api.scaleapi.com/v1/tasks`

### Returns

Returns a list of your tasks.