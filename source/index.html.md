---
title: PractiTest's REST API

language_tabs:
  - shell
  - ruby
  - python
  - javascript
  - csharp


toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the PractiTest's REST API! The REST APIs are for developers who want to integrate PractiTest into their application, synchronize issue trackers or develop any other tool integration with PractiTest. The API also enables organizations to update their automated test results into PractiTest.

We have language bindings in Shell, Ruby, Python, Java and C#! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# Authentication
> To authorize, use this request:

```csharp
TOKEN = "CHANGE_WITH_YOUR_TOKEN";
DEVELOPER_EMAIL = "CHANGE_WITH_YOUR_EMAIL_ADDRESS";
String encoded =System.Convert.ToBase64String(System.Text.Encoding.GetEncoding("ISO-8859-1").GetBytes(username + ":" + password));
httpWebRequest.Headers.Add("Authorization", "Basic " + encoded);
```

```ruby
require 'net/http'
require 'net/https'
require 'uri'
require 'json'

URL   = "https://prod.practitest.com"
TOKEN = "CHANGE_WITH_YOUR_TOKEN"
DEVELOPER_EMAIL= "CHANGE_WITH_YOUR_EMAIL_ADDRESS"

def post_request(path, json_body)
  uri = URI.parse("#{URL}/api/v2/#{path}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (URL[0..4].downcase == "https")
  req = Net::HTTP::Post.new(uri.path, {"Content-Type" => "application/json"})
  req.basic_auth DEVELOPER_EMAIL, TOKEN

  req.body = json_body
  res = http.request(req)
end

def get_request(path)
  uri = URI.parse("#{URL}/api/v2/#{path}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (URL[0..4].downcase == "https")
  req = Net::HTTP::Get.new(uri.path)
  req.basic_auth DEVELOPER_EMAIL, TOKEN
  res = http.request(req)
end

def post_good_results
  json_results = {
    :project_id => 19,
    name: 'yaniv',
    author_id: 1,
    :___f_21713 => {value: ['one', 'two']}
  }.to_json
  puts json_results
  post_request('issues.json', json_results)
end

puts get_request('projects.json').body
```

```python
NEED TO ADD
```

```shell
    curl -H "Content-Type: application/json" \
     -u CHANGE_WITH_YOUR_EMAIL_ADDRESS:CHANGE_WITH_YOUR_TOKEN  \
    https://prod.practitest.com/api/v2/projects.json

    curl -H "Content-Type: application/json" \
    https://prod.practitest.com/api/v2/projects.json?developer_email=CHANGE_WITH_YOUR_EMAIL_ADDRESS&api_token=CHANGE_WITH_YOUR_TOKEN

    Here’s an example of the JSON response you may get when submitting an authorization request to : https://prod.practitest.com/api/v2/projects.json

    {"data":[{"id":"3947","type":"projects","attributes":{"name":"another JIRA Cloud","created-at":"2016-10-31T18:11:23Z","automation-support":false}},{"id":"2258","type":"projects","attributes":{"name":"Jira Cloud 2","created-at":"2016-01-21T14:57:40Z","automation-support":false}}],"links":{"self":"https://prod.practitest.com/api/v2/projects.json?page%5Bnumber%5D=1\u0026page%5Bsize%5D=2","next":"https://prod.practitest.com/api/v2/projects.json?page%5Bnumber%5D=2\u0026page%5Bsize%5D=2","last":"https://prod.practitest.com/api/v2/projects.json?page%5Bnumber%5D=2\u0026page%5Bsize%5D=2"}}
```

```javascript

```

> Make sure to replace `CHANGE_WITH_YOUR_TOKEN` with your API token and `CHANGE_WITH_YOUR_EMAIL_ADDRESS` with your email address.

PractiTest uses API tokens to allow access to the API. You can create a new PractiTest's API token by going to the Account Settings - "API Tokens". Please visit this <a href="https://www.practitest.com/help/account/account-api-tokens/">help page</a> for more information.

PractiTest expects for the API token and developer email to be included in all API requests to the server in a header that looks like the following:

`Authorization: CHANGE_WITH_YOUR_EMAIL_ADDRESS:CHANGE_WITH_YOUR_TOKEN `

<aside class="notice">
You must replace <code>CHANGE_WITH_YOUR_EMAIL_ADDRESS</code> with your email address and <code>CHANGE_WITH_YOUR_TOKEN_YOUR_API_TOKEN</code> with your custom API token.
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
