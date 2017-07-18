---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - php
  - python
  - ruby
  - shell


toc_footers:
  - <a href='https://www.adback.co/fr/register/'>Sign Up for a Developer token</a>
  - <a href='https://www.adback.co/fr/admin/api/'>Claim your token here, must be logged</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/tripit/slate). Feel free to edit it and use it as a base for your own API's documentation.

# How it works ?

What's the utility of the API? How it works ?

AdBlock lists are updated regularly so domains or scripts can be blocked in a very untimely manner.

The API gives a possibility to provide you with functioning domains and scripts in real time. Our system daily verifies the validity of domains and scripts we provide and in case of blocking, automatically allocates the new ones.

Therefore the implementation of the API script has to be done only once and then operates totally autonomously.

![alt text](/images/how.png)

# Script URL and name

> To get script URL and name, use this code:

```php
<?php

/*
CONNECT TO YOUR IN-MEMORY DATA STRUCTURE STORE LIKE REDIS
*/
$cache = new Redis();
$cache->connect('host');

/*
GET DATA FROM EITHER IN YOUR IN-MEMORY DATA STRUCTURE STORE OR THE API
*/
if ($cache->has('scriptElement')) {
    $scriptElement = $cache->hGetAll('scriptElement');
} else {
    $scriptElement = json_decode(file_get_contents('https://adback.co/api/script/me?access_token=[token]'), true);
    foreach ($scriptElement as $key => $value) {
        $cache->hSet('scriptElement', $key, $value);
    }
    $cache->expire('scriptElement', 60*60*24);
}
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```shell
$  wget https://raw.githubusercontent.com/dekalee/adback-bash-refresh/master/adback-refresh-tags

$  chmod +x adback-refresh-tags

$  ./adback-refresh-tags [token] [options]

Options:

    -c: output custom message script (JS output)
    -a: output analytics script (JS output)
    -html: change the output method (html output)

```

> Make sure to replace `[token]` with your API token.


With shell, you can just execute bash script from [this repo](https://github.com/dekalee/adback-bash-refresh/blob/master/adback-refresh-tags)

[here](https://www.adback.co/fr/admin/api/) your can get your personal API `[token]`

<aside class="notice">
You must replace <code>[token]</code> with your personal API token.
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

This endpoint retrieves a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

