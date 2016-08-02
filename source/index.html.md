---
title: API Reference

language_tabs:
  - shell
  - python
  - javascript

toc_footers:
  - <a href='https://api.scaleapi.com/signup'>Signup for Scale</a>
  - <a href="https://scalesupport.herokuapp.com/">Join the Scale Support Slack channel!</a>

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

Anyone can use our API! [Sign up here](https://api.scaleapi.com/signup) to get started using Scale. You can also [contact us](mailto:hello@scaleapi.com) for volume pricing or any inquiries.

You can also join our [Slack channel here](https://scalesupport.herokuapp.com/)!

<!-- We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.
 -->
# Authentication

> To authorize, use this code:

```shell
# With curl, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -u "YOUR_API_KEY:"
```

```python
import requests

requests.get('api_endpoint_here', auth=('YOUR_API_KEY', ''))
```

```javascript
var request = require("request");
var SCALE_API_KEY = 'YOUR_API_KEY';

request.get('api_endpoint_here', {
  'auth': {
    'user': SCALE_API_KEY,
    'pass': '',
    'sendImmediately': true
  }
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
```

> Make sure to replace `YOUR_API_KEY` with your API key.

Scale uses API keys to allow access to the API. You can register a new Scale API key on your dashboard (if you have access to Scale).

Scale expects for the API key to be included in all API requests to the server via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username value. You do not need to provide a password. You can do this using the `-u` flag:

`-u YOUR_API_KEY:`

<aside class="notice">
You must replace <code>YOUR_API_KEY</code> with your personal API key.
</aside>

### Callback Authentication

If you'd like to authenticate our callbacks, we set a `scale-callback-auth` HTTP header on each of our callbacks. The value will be equal to your `Live Callback Auth Key` shown on your dashboard. If this header is not set, or it is set incorrectly, the callback is not from Scale.

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
`task_id` | string | The `task_id` is the unique identifier for the task.
`type` | string | The type of the task. Currently, we support `categorization`.
`instruction` | string | A plaintext string explaining the instructions for the task.
`params` | object | An object with the parameters of the task based on the type. For `categorization`, for example, this will include `attachment_type`, `attachment`, and `categories`.
`response` | object | An object corresponding to the response once the task is completed. For `categorization`, it will have the attribute `category`, corresponding to the chosen category.
`callback_url` | string | A string of the URL that should be POSTed once the task is completed for the response data. See the Callback section for more details.
`status` | string | The status of the task, one of `pending`, `completed`, or `canceled`.
`created_at` | timestamp | A string of the UTC timestamp of when the task was created.
`completed_at` | timestamp | A string of the UTC timestamp of when the task was completed. This will only be filled in after it is completed.


# Create Categorization Task

```shell
curl "https://api.scaleapi.com/v1/task/categorize" \
  -u YOUR_API_KEY: \
  -d callback_url="http://www.example.com/callback" \
  -d instruction="Is this company public or private?" \
  -d attachment_type=website \
  -d attachment="http://www.google.com/" \
  -d categories=public \
  -d categories=private
```

```python
import requests

payload = {
  'callback_url': 'http://www.example.com/callback',
  'instruction': 'Is this company public or private?',
  'attachment_type': 'website',
  'attachment': 'http://www.google.com/',
  'categories': ['public', 'private']
}

requests.post("https://api.scaleapi.com/v1/task/categorize", 
  data=payload, 
  auth=('YOUR_API_KEY', ''))

```

```javascript
var request = require("request");
var SCALE_API_KEY = 'YOUR_API_KEY';

var payload = {
  'callback_url': 'http://www.example.com/callback',
  'instruction': 'Is this company public or private?',
  'attachment_type': 'website',
  'attachment': 'http://www.google.com/',
  'categories': ['public', 'private']
};

request.post('https://api.scaleapi.com/v1/task/categorize', {
  'auth': {
    'user': SCALE_API_KEY,
    'pass': '',
    'sendImmediately': true
  },
  'form': payload
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
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

This endpoint creates a `categorization` task. In this task, one of our workers will view the attachment and choose a category for it according to the instruction. You may allow multiple categories to be chosen by setting `allow_multiple` to `true`. Example use cases are spam detection, copyright detection, product categorization, etc.

This task involves a plaintext `instruction` about how to make the categorization, an `attachment` of what you'd like to categorize, an `attachment_type`, and finally a list of `categories`. 

There is an optional `category_ids` parameter, which you can use to impose an id system over the categories. The format of this parameter should be a dictionary, where the keys are the ids (as strings), and then the values are the category values provided in `categories`. An example is:

```"category_ids": {
  "123": "Blue Cross",
  "124": "Red Cross"
}```

If successful, Scale will immediately return the generated task object, of which you should at least store the `task_id`.

The parameters `attachment_type`, `attachment`, `categories`, and `category_ids` (optional) will be stored in the `params` object of the constructed `task` object.

### HTTP Request

`POST https://api.scaleapi.com/v1/task/categorize`

### Parameters

Parameter | Type | Description
--------- | ---- | -------
`callback_url` | string | The full url (including the scheme `http://` or `https://`) of the callback when the task is completed.
`instruction` | string | The plaintext instruction of how to categorize the item.
`attachment_type` | string | One of `text`, `image`, `video`, `audio`, `website`, or `pdf`. Describes what type of file the attachment is.
`attachment` | string | The attachment to be categorized. If `attachment_type` is `text`, then it should be plaintext. Otherwise, it should be a URL pointing to the attachment.
`categories` | [string] | An array of strings for the categories which you'd like the object to be sorted between.
`category_ids` (optional) | dictionary | An optional dictionary where the keys are the optional ids, and the values are the category values provided in `categories`.
`allow_multiple` (optional) | boolean | Default is `false`. Determines whether you allow multiple categories to be chosen for the attachment

### Response on Callback

The `response` object will be of the form:

`
{
  "category": ...
}`

If `allow_multiple` is `false`, then the value will be a string equal to one of the original categories. 

If `allow_multiple` is `true`, the value will be an array of categories, each one being one of the original categories.

If `category_ids` was provided, there will be another field `category_id` corresponding to the given id of the chosen category/categories. For example, it could look like:

```{
  "category": "Blue Cross", "category_id": "123"
}```

# Create Transcription Task

```shell
curl "https://api.scaleapi.com/v1/task/transcription" \
  -u YOUR_API_KEY: \
  -d callback_url="http://www.example.com/callback" \
  -d instruction="Write down the normal fields. Then for each news item on the page, write down the information for the row." \
  -d attachment_type=website \
  -d attachment="http://www.reddit.com/" \
  -d fields[title]="Title of Webpage" \
  -d fields[top_result]="Title of the top result" \
  -d row_fields[username]="Username of submitter" \
  -d row_fields[comment_count]="Number of comments"
```

```python
import requests
import json

payload = {
  'callback_url': 'http://www.example.com/callback',
  'instruction': 'Write down the normal fields. Then for each news item on the page, write down the information for the row.',
  'attachment_type': 'website',
  'attachment': 'http://www.google.com/',
  'fields': {
    'title': 'Title of Webpage',
    'top_result': 'Title of the top result'
  },
  'row_fields': {
    'username': 'Username of submitter',
    'comment_count': 'Number of comments'
  }
}

headers = {"Content-Type": "application/json"}

requests.post("https://api.scaleapi.com/v1/task/transcription", 
  data=json.dumps(payload), 
  headers=headers,
  auth=('YOUR_API_KEY', ''))

```

```javascript
var request = require("request");
var SCALE_API_KEY = 'YOUR_API_KEY';

var payload = {
  'callback_url': 'http://www.example.com/callback',
  'instruction': 'Write down the normal fields. Then for each news item on the page, write down the information for the row.',
  'attachment_type': 'website',
  'attachment': 'http://www.google.com/',
  'fields': {
    'title': 'Title of Webpage',
    'top_result': 'Title of the top result'
  },
  'row_fields': {
    'username': 'Username of submitter',
    'comment_count': 'Number of comments'
  }
};

request.post('https://api.scaleapi.com/v1/task/transcription', {
  'auth': {
    'user': SCALE_API_KEY,
    'pass': '',
    'sendImmediately': true
  },
  'form': payload
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
```

> The above command returns JSON structured like this:

```json
{
  "created_at": "2016-06-25T02:18:04.248Z",
  "callback_url": "http://www.example.com/test_callback",
  "type": "transcription",
  "status": "pending",
  "instruction": "Write down the normal fields. Then for each news item on the page, write down the information for the row.",
  "params": {
    "row_fields": {
      "username": "Username of submitter",
      "comment_count": "Number of comments"
    },
    "fields": {
      "title": "Title of Webpage",
      "top_result": "Title of the top result"
    },
    "attachment": "http://www.reddit.com/",
    "attachment_type": "website"
  },
  "task_id": "576de9dc1ea5f917d56fc2a0"
}
```

This endpoint creates a `transcription` task. In this task, one of our workers will read an attachment and arbitrarily transcribe any information you'd like. Example use cases could be transcribing information from PDFs, manually scraping a web page for information, etc.

This task involves a plaintext `instruction` about how to transcribe the attachment, an `attachment` of what you'd like to transcribe, an `attachment_type`, a dictionary `fields` which describes all the things you'd like transcribed, and an optional dictionary `row_fields` for items which need to be transcribed per row in the attachment.

Both `field` and `row_fields` are dictionaries where the keys are the keys you'd like the results to be returned under, and values are the descriptions you'd like to show the human worker.

If successful, Scale will immediately return the generated task object, of which you should at least store the `task_id`.

The parameters `attachment_type`, `attachment`, `fields`, and `row_fields` will be stored in the `params` object of the constructed `task` object.

<aside class="notice">
We limit the number of rows you may transcribe per API request to 10 rows. If you need more rows, send multiple API requests.
</aside>

### HTTP Request

`POST https://api.scaleapi.com/v1/task/transcription`

### Parameters

Parameter | Type | Description
--------- | ---- | -------
`callback_url` | string | The full url (including the scheme `http://` or `https://`) of the callback when the task is completed.
`instruction` | string | The plaintext instruction of how to transcribe the attachment.
`attachment_type` | string | One of `text`, `image`, `video`, `audio`, `website`, or `pdf`. Describes what type of file the attachment is.
`attachment` | string | The attachment to be transcribed. If `attachment_type` is `text`, then it should be plaintext. Otherwise, it should be a URL pointing to the attachment.
`fields` | dictionary | A dictionary corresponding to the fields to be transcribed. Keys are the keys you'd like the fields to be returned under, and values are descriptions to be shown to human workers.
`row_fields` (optional) | dictionary | If your transcription requires a transcription of a variable number of row items, then this dictionary describes the fields for these rows. The format is the same as `fields`, 

### Response on Callback

The `response` object will be of the form:

`
{
  "fields": {
    ...
  },
  "rows": [{
    ...
  },
  {
    ...
  }]
}`

`fields` will have keys corresponding to the keys you provided in the parameters, with values the transcribed value. `rows` will be an array of such dictionaries, with keys corresponding to the keys you provided in the parameters, and values corresponding to the transcribed value.

# Create Phone Call Task

```shell
curl "https://api.scaleapi.com/v1/task/phonecall" \
  -u YOUR_API_KEY: \
  -d callback_url="http://www.example.com/callback" \
  -d instruction="Call this person and tell me his email address" \
  -d phone_number=5055006865 \
  -d entity_name="Alexandr Wang" \
  -d fields[email]="Email Address"
```
```python
import requests
import json

payload = {
  'callback_url': 'http://www.example.com/callback',
  'instruction': 'Call this person and tell me his email address',
  'phone_number': '5055006865',
  'entity_name': 'Alexandr Wang',
  'fields': {
    'email': 'Email Address',
  }
}

headers = {"Content-Type": "application/json"}

requests.post("https://api.scaleapi.com/v1/task/phonecall", 
  data=json.dumps(payload), 
  headers=headers,
  auth=('YOUR_API_KEY', ''))

```

```javascript
var request = require("request");
var SCALE_API_KEY = 'YOUR_API_KEY';

var payload = {
  'callback_url': 'http://www.example.com/callback',
  'instruction': 'Call this person and tell me his email address',
  'phone_number': '5055006865',
  'entity_name': 'Alexandr Wang',
  'fields': {
    'email': 'Email Address',
  }
};

request.post('https://api.scaleapi.com/v1/task/phonecall', {
  'auth': {
    'user': SCALE_API_KEY,
    'pass': '',
    'sendImmediately': true
  },
  'form': payload
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
```

> The above command returns JSON structured like this:

```json
{
  "created_at": "2016-06-27T23:53:10.367Z",
  "callback_url": "http://www.example.com/test_callback",
  "type": "phonecall",
  "status": "pending",
  "instruction": "Call this man and tell me his email.",
  "params": {
    "fields": {
      "email": "Email Address"
    },
    "entity_name": "Alexandr Wang",
    "phone_number": "5055006865"
  },
  "task_id": "5771bc6631b72659f0d3692b"
}
```

This endpoint creates a `phonecall` task. In this task, one of our workers will call the specified phone number and follow the instructions. Potential use cases could be making reservations or appointments, confirming reservations, asking for contact numbers or emails, etc.

This task involves a plaintext `instruction` about how to transcribe the attachment, a `phone_number` for the phone number to call, and an `entity_name` which describes the phone number.

The optional fields are `attachment_type` and `attachment` for an optional attachment, a plaintext string `script` for an optional script for the worker to follow, and `fields` for optional fields you'd like to be written down and returned to you.

The optional `field` parameter is a dictionary where the keys are the keys you'd like the results to be returned under, and values are the descriptions you'd like to show the human worker.

If successful, Scale will immediately return the generated task object, of which you should at least store the `task_id`.

The parameters `phone_number`, `entity_name`, `script`, `attachment_type`, `attachment`, and `fields` will be stored in the `params` object of the constructed `task` object.

<aside class="notice">
For low volume, we currently only support calling US numbers. For higher volume international calls, please <a href="mailto:hello@scaleapi.com">contact us</a>!
</aside>

### HTTP Request

`POST https://api.scaleapi.com/v1/task/phonecall`

### Parameters

Parameter | Type | Description
--------- | ---- | -------
`callback_url` | string | The full url (including the scheme `http://` or `https://`) of the callback when the task is completed.
`instruction` | string | The plaintext instruction of how to make the phone call.
`phone_number` | string | The phone number which will be called by our worker. Should include a country code (+1 for US numbers).
`script` (optional) | string | An optional script to be shown the the worker as they make the phone call. You should use this if you've already optimized a script for phone calling.
`entity_name` | name | The name of the entity which corresponds to the person or business of the phone number.
`attachment_type` (optional) | string | One of `text`, `image`, `video`, `audio`, `website`, or `pdf`. Describes what type of file the attachment is.
`attachment` (optional) | string | The optional attachment to be used for the phone call. If `attachment_type` is `text`, then it should be plaintext. Otherwise, it should be a URL pointing to the attachment.
`fields` (optional) | dictionary | A dictionary corresponding to the fields to be recorded. Keys are the keys you'd like the fields to be returned under, and values are descriptions to be shown to human workers.

### Response on Callback

The `response` object will be of the form:

`
{
  "outcome": ...,
  "fields": {
    ...
  }
}`

The outcome will be a string equal to one of `no_pickup` (meaning nobody picked up), `hung_up` (meaning the recipient hung up before the task could be completed), or `success` (the call succeeded). 

If your original call provided `fields`, `fields` will have keys corresponding to the keys you provided in the parameters, with values the transcribed value.

# Create Comparison Task

```shell
curl "https://api.scaleapi.com/v1/task/comparison" \
  -u YOUR_API_KEY: \
  -d callback_url="http://www.example.com/callback" \
  -d instruction="Do the objects in these images have the same pattern?" \
  -d attachment_type=image \
  -d attachments="http://i.ebayimg.com/00/$T2eC16dHJGwFFZKjy5ZjBRfNyMC4Ig~~_32.JPG" \
  -d attachments="http://images.wisegeek.com/checkered-tablecloth.jpg" \
  -d choices="yes" \
  -d choices="no"
```
```python
import requests
import json

payload = {
  'callback_url': 'http://www.example.com/callback',
  'instruction': 'Do the objects in these images have the same pattern?',
  'attachment_type': 'image',
  'attachments': [
    'http://i.ebayimg.com/00/$T2eC16dHJGwFFZKjy5ZjBRfNyMC4Ig~~_32.JPG',
    'http://images.wisegeek.com/checkered-tablecloth.jpg'
  ],
  'choices': ['yes', 'no']
}

headers = {"Content-Type": "application/json"}

requests.post("https://api.scaleapi.com/v1/task/comparison", 
  data=json.dumps(payload), 
  headers=headers,
  auth=('YOUR_API_KEY', ''))

```

```javascript
var request = require("request");
var SCALE_API_KEY = 'YOUR_API_KEY';

var payload = {
  'callback_url': 'http://www.example.com/callback',
  'instruction': 'Do the objects in these images have the same pattern?',
  'attachment_type': 'image',
  'attachments': [
    'http://i.ebayimg.com/00/$T2eC16dHJGwFFZKjy5ZjBRfNyMC4Ig~~_32.JPG',
    'http://images.wisegeek.com/checkered-tablecloth.jpg'
  ],
  'choices': ['yes', 'no']
};

request.post('https://api.scaleapi.com/v1/task/comparison', {
  'auth': {
    'user': SCALE_API_KEY,
    'pass': '',
    'sendImmediately': true
  },
  'form': payload
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
```

> The above command returns JSON structured like this:

```json
{
  "created_at": "2016-06-30T07:38:32.368Z",
  "callback_url": "http://localhost:5000/internal/test_callback",
  "type": "comparison",
  "status": "pending",
  "instruction": "Do the objects in these images have the same pattern?",
  "params": {
    "choices": [
      "yes",
      "no"
    ],
    "attachment_type": "image",
    "attachments": [
      "http://i.ebayimg.com/00/$T2eC16dHJGwFFZKjy5ZjBRfNyMC4Ig~~_32.JPG",
      "http://images.wisegeek.com/checkered-tablecloth.jpg"
    ]
  },
  "task_id": "5774cc78b02487c424f089dd"
}
```

This endpoint creates a `comparison` task. In this task, one of our workers view the given attachments and do any comparison requested.

This task involves a plaintext `instruction`, an array of `attachments`, and an `attachment_type`.

At least of the `fields` or `choices` parameters must specified for the data to be returned. `choices` is an array of strings from which the user to choose, and `fields` is useful for free-text response. 

`fields` is a dictionary where the keys are the keys you'd like the results to be returned under, and values are the descriptions you'd like to show the human worker.

If successful, Scale will immediately return the generated task object, of which you should store the `task_id`.

The parameters `attachment_type`, `attachments`, `choices`, and `fields` will be stored in the `params` object of the constructed `task` object.

### HTTP Request

`POST https://api.scaleapi.com/v1/task/comparison`

### Parameters

Parameter | Type | Description
--------- | ---- | -------
`callback_url` | string | The full url (including the scheme `http://` or `https://`) of the callback when the task is completed.
`instruction` | string | The plaintext instruction of how to compare the attachments.
`attachment_type` | string | One of `text`, `image`, `video`, `audio`, `website`, or `pdf`. Describes what type of file the attachments are.
`attachments` | array | An array of attachments to compare. If `attachment_type` is `text`, then each attachment should be plaintext. Otherwise, they should be URLs pointing to the attachments.
`fields` (optional) | dictionary | A dictionary corresponding to the fields to be recorded. Keys are the keys you'd like the fields to be returned under, and values are descriptions to be shown to human workers.
`choices` (optional) | [string] | An array of strings for the choices to be given to the worker. One of `choices` or `fields` must be specified.

### Response on Callback

The `response` object will be of the form:

`
{
  "choice": "some_choice",
  "fields": {
    ...
  }
}`

If your original call provided `choices`, `choice` will be one of the original choices.

If your original call provided `fields`, `fields` will have keys corresponding to the keys you provided in the parameters, with values the transcribed value.

# Callbacks

> The `callback_url` will be POSTed with `application/json` data of the following object form:

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
        "red",
        "blue"
      ]
    },
    "task_id": "576c41bf13e36b0600b02b34"
  },
  "response": {
    "status_code": "200",
    "category": "red"
  },
  "task_id": "576c41bf13e36b0600b02b34"
}
```

On your tasks, you will be required to supply a `callback_url`, a fully qualified URL that we will POST with the results of the task when completed. The data will be served as a JSON body (`application/json`).

You should respond to the POST request with a 200 status code. If we do not receive a 200 status code, we will retry one more time.

If you're just starting out and want the easiest way to set up your own callback URL, we recommend using [ngrok](https://ngrok.com/) to expose a local server to the internet. Feel free to [contact us](mailto:hello@scaleapi.com) if you have any trouble.

### Authentication

If you'd like to authenticate our callbacks, we set a `scale-callback-auth` HTTP header on each of our callbacks. The value will be equal to your `Live Callback Auth Key` shown on your dashboard. If this header is not set, or it is set incorrectly, the callback is not from Scale.

### POST Data

Attribute | Type | Description
--------- | ------- | -----------
`task_id` | string | The `task_id` is the unique identifier for the task.
`response` | object | The response object of the completed request. For `categorization`, it will contain a `category` attribute of the assigned category.
`task` | object | The full task object for reference and convenience.


# Task Endpoints

## Retrieve a Task

```shell
curl "https://api.scaleapi.com/v1/task/{task_id}" \
  -u YOUR_API_KEY:
```

```python
import requests

task_id = 'YOUR_TASK_ID'

response = requests.get('https://api.scaleapi.com/v1/task/%s' % task_id, auth=('YOUR_API_KEY', ''))

# Return dictionary can be accessible in this way
response_dict = json.loads(response.content)
```

```javascript
var request = require("request");
var SCALE_API_KEY = 'YOUR_API_KEY';

var task_id = 'YOUR_TASK_ID';

request.get('https://api.scaleapi.com/v1/task/' + task_id + '/', {
  'auth': {
    'user': SCALE_API_KEY,
    'pass': '',
    'sendImmediately': true
  }
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
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
`task_id` | The task_id of the task to retrieve

### Returns

Returns a task if a valid identifier was provided, and returns a 404 error otherwise.

## Cancel a task

```shell
curl -X POST "https://api.scaleapi.com/v1/task/{task_id}/cancel" \
  -u YOUR_API_KEY:
```

```python
import requests
import json

task_id = 'YOUR_TASK_ID'

response = requests.post('https://api.scaleapi.com/v1/task/%s/cancel/' % task_id, auth=('YOUR_API_KEY', ''))

# Return dictionary can be accessible in this way
response_dict = json.loads(response.content)
```

```javascript
var request = require("request");
var SCALE_API_KEY = 'YOUR_API_KEY';

var task_id = 'YOUR_TASK_ID';

request.post('https://api.scaleapi.com/v1/task/' + task_id + '/cancel/', {
  'auth': {
    'user': SCALE_API_KEY,
    'pass': '',
    'sendImmediately': true
  }
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
```

> The above command returns JSON structured like this:

```json
{
  "task_id": "576ba74eec471ff9b01557cc",
  "created_at": "2016-06-23T09:09:34.752Z",
  "callback_url": "http://www.example.com/test_callback",
  "type": "categorization",
  "status": "canceled",
  "instruction": "Would you say this item is big or small?",
  "params": {
    "attachment_type": "text",
    "attachment": "car",
    "categories": [
      "big",
      "small"
    ]
  }
}
```

This endpoint cancels a task so that it will not be completed.

You may only cancel pending tasks, and the endpoint will return a 500 error code if you attempt to cancel a completed task.

### HTTP Request

`POST https://api.scaleapi.com/v1/task/{TASK_ID}/cancel`

### URL Parameters

Parameter | Description
--------- | -----------
`task_id` | The task_id of the task to cancel

### Returns

Returns the canceled task if a valid identifier for a pending task was provided, and returns a 404 error or 500 error otherwise.

## List All Tasks

```shell
curl "https://api.scaleapi.com/v1/tasks" \
  -u YOUR_API_KEY:
```

```python
import requests
import json

response = requests.get('https://api.scaleapi.com/v1/tasks/', auth=('YOUR_API_KEY', ''))

# Return dictionary can be accessible in this way
response_dict = json.loads(response.content)
```

```javascript
var request = require("request");
var SCALE_API_KEY = 'YOUR_API_KEY';

request.get('https://api.scaleapi.com/v1/tasks/', {
  'auth': {
    'user': SCALE_API_KEY,
    'pass': '',
    'sendImmediately': true
  }
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body);
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
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