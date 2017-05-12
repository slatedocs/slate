---
title: API Reference

language_tabs:
  - shell
  - php

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the DNA API! You can use our API to access DNA API endpoints, which can get information on various elements customers, devices, and billing in our database.

We have language bindings in Shell and PHP we also have Postman for you to test the methods without writing code! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


This example API documentation page was created with [Slate](https://github.com/tripit/slate). 

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "http://local.websales-api.nexogy.com/api/oauth/token?grant_type=password&client_id=<value>&client_secret=<value>&username=<value>&password=<value>&scope=<value>"
  -H "Accept: application/json"
```

```php
$kittn = require('kittn');
/* test */

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace the required `<value>` with the information provided.

> The above command returns a JSON structured like this:

```json
[
  {  
     "token_type":"Bearer",
     "expires_in":1200,
     "access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2",
     "refresh_token":"kvwLi6kTeq7DGbfsKLVvz/6zaCioe8Vk50x1QdlHJDFp4thYzPj5v"
  }
]
```

<aside class="warning">It is very important that in order for this documentation to work, you must have requested access to the API and recieved the following information: </aside>

Key | Value | Description
--------- | ------- | -----------
grant_type | password | This value is constant.
client_id | ????? | Once you've been approved to use our API you'll receive this value.
client_secret | ?????| Once you've been approved to use our API you'll receive this value.
username | ????? | Once you've been approved to use our API you'll receive this value.
password | ????? | Once you've been approved to use our API you'll receive this value.
scope | ????? | Once you've been approved to use our API you'll receive this value.

Once you have the values described above you can make the API calls using your <code>access_token</code> and the <code>token_type</code> .
To help with your development use Postman and add the following [Collection](http://example.com/developers).

DNA API expects for the <code>token_type</code> and <code>access_token</code> to be included in all API requests to the server in a header that looks like the following:

`Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2`

<aside class="notice">
You must replace <code>`values`</code> with your provided values. and add the <code>token_type</code> and <code>access_token</code> as values for the <code>Authorization</code>headers for all your API calls.
Additionally use the <code>Accept:application/json</code> Headers for every API call.
</aside>

# Client

## Create a Client

> To Create a new client, use this code:

```shell
curl "http://local.websales-api.nexogy.com/api/residential/client"
  -H "Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2"
  -H "Accept:application/json"
```

```php
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "result":"OK",
    "client":
      {
        "id":6519,
        "ns_domain":"ironmaiden.com"
      }
  }
]
```

This endpoint creates a Client on DNA. You will get back a <code>id</code> and a <code>ns_domain</code> these will be required for other operations. 

### HTTP Request

`POST http://local.websales-api.nexogy.com/api/residential/client`

### Query Parameters

<aside class="warning">This request has no default parameters or values. Ignoring this will result in an error.</aside>

Parameter | Example | Description
--------- | ------- | -----------
has_subreseller_id | true | This is an id used to group your cleint's IDs under a subreseller account if you have resellers that handele your clients this is how we would identify them for consolidation purposes.
subreseller_id | 1234 | Send this parameter only if you use a subreseller structure.
email | email@email.com | Email used for any information required for the client, for example to send received V-mail.
first_name | Steve | First name for the client.
last_name | Harris | Last name for the client.
zipcode | 33134 | The client's zipcode.
address | 126 Mendoza avenue aparment 7A | The client's address.
same_billing_address | true | Accepts true or false and determines if the address parameter will be used for billing, when false <code>billing_address</code> and <code>billing_zipcode</code> are required.
billing_address | 2121 ponce de leon | The billing address.
billing_zipcode | 33308 | The billing zipcode.

<aside class="success">
Remember — store your <code>&lt;id&gt;</code> and <code>&lt;ns_domain&gt;</code> for future operations!
</aside>

## Activate a Client

```shell
curl "http://local.websales-api.nexogy.com/api/residential/client/<id>/activate"
  -H "Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2"
  -H "Accept:application/json"
```

```php
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

This endpoint activates a specific client.

<aside class="warning">You will need the <code>&lt;id&gt;</code> for this operation</aside>

### HTTP Request

`GET http://local.websales-api.nexogy.com/api/residential/client/<id>/activate`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the client to activate

## Suspend a Client

```shell
curl "http://local.websales-api.nexogy.com/api/residential/client/<id>/suspend"
  -H "Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2"
  -H "Accept:application/json"
```

```php
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

This endpoint suspends a Client.

<aside class="warning">You will need the <code>&lt;id&gt;</code> for this operation</aside>

### HTTP Request

`GET http://local.websales-api.nexogy.com/api/residential/client/<id>/suspend`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the client to suspend
