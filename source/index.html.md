---
title: PractiTest's REST API

language_tabs:
  - shell
  - ruby
  - python
  - csharp


toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# PractiTest API V2

## Welcome to the PractiTest's REST API V2!

The REST API is designed for developers who want to integrate PractiTest into their application, synchronize issue trackers or develop any other tool integration with PractiTest.
The API also enables organizations to update their automated test results into PractiTest.

We have language bindings in Shell, Ruby, Python, Java and C#! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

## JSON API
All along this api we've embraced <a href="http://jsonapi.org/" target="blank">JSON API</a> standards, for share conventions and to save you (and us) precious time.

## A small note about API V2 vs V1
We wrote this API V2 based on our experiecne from V1, trying to make it simpler and more rebust.
Eventually, this V2 API will support all current V1 API, and later on V1 will be depreciated.

If you're new to PractiTest and you just starting to write API code, you should use this V2, and not the V1. If you need anything that is still missing, please email us to support, as we'd like to reduce the number of V1 users.

### Current API V1 users
If you already have V1 code, then you must change /api/resource_name to /api/v1/resource_name. Also, when you write new code, try to use V2, since V1 will depreciate.

# Authentication

```shell
    curl -H "Content-Type: application/json" \
     -u YOUR_EMAIL:YOUR_TOKEN  \
    https://prod.practitest.com/api/v2/projects.json
# IS THE SAME AS:
    curl -H "Content-Type: application/json" \
    https://prod.practitest.com/api/v2/projects.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN
```


```csharp
TOKEN = "YOUR_TOKEN";
DEVELOPER_EMAIL = "YOUR_EMAIL";
String encoded =System.Convert.ToBase64String(System.Text.Encoding.GetEncoding("ISO-8859-1").GetBytes(username + ":" + password));
httpWebRequest.Headers.Add("Authorization", "Basic " + encoded);
```

```ruby
require 'net/http'
require 'net/https'
require 'uri'
require 'json'

URL   = "https://prod.practitest.com"
TOKEN = "xxx"
DEVELOPER_EMAIL= "my@mail.address"

uri = URI.parse("#{URL}/api/v2/projects.json")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
req = Net::HTTP::Get.new(uri.path)
req.basic_auth DEVELOPER_EMAIL, TOKEN
res = http.request(req)
puts res.body
```


```python
NEED TO ADD
```

> This command: https://prod.practitest.com/api/v2/projects.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:


```json
{
  "data": [
    {
      "id": "4581",
      "type": "projects",
      "attributes": {
        "name": "Sanity check (Rails 4)",
        "created-at": "2016-07-28T13:34:51Z",
        "automation-support": false,
        "enable-delete-issues": false,
        "time-management-support": false
      }
    },
    {
      "id": "4578",
      "type": "projects",
      "attributes": {
        "name": "Sanity Check (screen captures)",
        "created-at": "2016-06-20T11:32:52Z",
        "automation-support": false,
        "enable-delete-issues": true,
        "time-management-support": false
      }
    }
  ],
  "links": {
    "self": "https://prod.practitest.com/api/v2/projects.json?api_token=afb913899fc295e809255fbdb4fbc1fb37296250&developer_email=admin%40pt.com&page%5Bnumber%5D=1&page%5Bsize%5D=2",
    "next": "https://prod.practitest.com/api/v2/projects.json?api_token=afb913899fc295e809255fbdb4fbc1fb37296250&developer_email=admin%40pt.com&page%5Bnumber%5D=2&page%5Bsize%5D=2",
    "last": "https://prod.practitest.com/api/v2/projects.json?api_token=afb913899fc295e809255fbdb4fbc1fb37296250&developer_email=admin%40pt.com&page%5Bnumber%5D=3&page%5Bsize%5D=2"
  },
  "meta": {
    "current-page": 1,
    "next-page": 2,
    "prev-page": null,
    "total-pages": 3,
    "total-count": 5
  }
}
```


> Make sure to replace `YOUR_TOKEN` with your API token and `YOUR_EMAIL` with your email address.

PractiTest uses API tokens for authentication. You can create a new API token by going to the Account Settings - "API Tokens". Please visit this <a href="https://www.practitest.com/help/account/account-api-tokens/" target="_blank">API tokens</a> for more information.

API expects the API-token and developer email to be included in all API requests to the server.
They can be **either** in the header as basic authentication, **OR** as parameters in the query string (which is usually more convinient with browser's debugging)


<aside class="notice">
You must replace <code>YOUR_EMAIL</code> with your email address and <code>YOUR_TOKEN</code> with your custom API token.
See below why we'd like you to use your real developer email address.
</aside>

<aside class="success">
**Developer email** is not authenticated by the API. You can put there any email you want. But if you have errors, or bad syntax, the only way that we get back to you, would be if you put your valid email address. This way we can help you (almost) immediately if we see something wrong.
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
