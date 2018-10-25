---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript
  - php

toc_footers:
  - <span>Write us at soporte@chekin.io to get an API Key</span>

includes:
  - errors

search: true
---

# Introduction

Welcome to the CheKin API! 

You can use our API to access CheKin API endpoints, which can get information on Bookings, Persons Registered, Housings and more.

The CheKin API is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. 
We support cross-origin resource sharing, allowing you to interact securely with our API from a client-side web application. 
JSON is returned by all API responses, including errors.

The base url for CheKin API endpoints is `https://api.chekin.io/api/v1/`


# Api Key

> To authorize, use this code:


```shell
# With shell, you can just pass the correct header with each request
curl "https://api.chekin.io/api/v1/"
  -H "Api-Key: yourApiKeyhere"
```

```python

```

```ruby

```

```javascript

```

```php

```

> Make sure to replace `yourApiKeyhere` with your API key.

CheKin uses API keys to allow access to the API. You can ask for an new API key at soporte@chekin.io.
CheKin expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Api-Key: yourApiKeyhere`

<aside class="notice">
You must replace <code>yourApiKeyhere</code> with your personal API key.
</aside>

# User Token Authentication

> To get a user token, use this code:


```shell
curl -X POST \
  https://api.chekin.io/api/v1/users/token/create/ \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'content-type: multipart/form-data;' \
  -F email=usersemail@domain.com \
  -F password=userspassword
```

> The above command returns JSON structured like this:

```json
  {
    "auth_token": "yourUserTokenHere"
  }
```

> Make sure to replace `yourApiKeyhere` with your API key in headers.

To act in behalf of a CheKin user through the CheKin API, and access to his data, you will need to generate a user token. 
To get a token do a `POST` to the tokens endpoint at `https://api.chekin.io/api/v1/users/token/create/` sending user email and password and you will get the token as response. 

CheKin expects for the user token to be included in all authenticated API requests to the server in a header that looks like the following:

`Authorization: Token yourUserTokenHere`

<aside class="notice">
You must replace <code>yourUserTokenHere</code> with your user token.
</aside>

# Accommodations

## Get All accommodations


```shell
curl -X GET \
  https://api.chekin.io/api/v1/housings/ \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
```


> The above command returns JSON structured like this:

```json
[
    {
        "id": 267,
        "tradename": "My House 1",
        "housing_type": "HOU",
        "rta_number": "RTAVTA12345678",
        "address": "Street 123",
        "province": 5,
        "municipality": "Barcelona",
        "legal_holder_name": "Peter Parker",
        "legal_holder_nif": "112345646S",
        "legal_holder_phone": "+3356258888",
        "police_type": "POL",
        "police_user": "policeuser",
        "police_password": "policepassword",
        "image": "https://an_url_of_the_picture_of_the_accommodation",
        "signature_url": "https://an_url_for_the_manager_signature_file",
        "is_housing_group": false,
        "police_hostelry_code": "",
        "airbnb_calendar": null,
        "legal_age": 16,
        "rooms_qty": 1,
        "max_capacity": 1,
        "airbnb_ics_url": null,
        "booking_ics_url": null,
        "avantio_ics_url": null
    },
    {
        "id": 1055,
        "tradename": "My House 2",
        "housing_type": "HOU",
        "rta_number": "RTAVTA12345678",
        "address": "Other Street 456",
        "province": 12,
        "municipality": "Madrid",
        "legal_holder_name": "Bruce Wane",
        "legal_holder_nif": "214142355bb",
        "legal_holder_phone": "+34555622122",
        "police_type": "POL",
        "police_user": "policeuser",
        "police_password": "policepassword",
        "image": "https://an_url_of_the_picture_of_the_accommodation",
        "signature_url": "https://an_url_for_the_manager_signature_file",
        "is_housing_group": false,
        "police_hostelry_code": "",
        "airbnb_calendar": "",
        "legal_age": 16,
        "rooms_qty": 1,
        "max_capacity": 1,
        "airbnb_ics_url": "",
        "booking_ics_url": "",
        "avantio_ics_url": ""
    },
]
```

This endpoint retrieves all the accommodations belonging to a user.

### HTTP Request

`GET https://api.chekin.io/api/v1/housings/`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — you need to send the authentication headers with API Key and User Token!
</aside>

## Get a Specific Accomodation


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

