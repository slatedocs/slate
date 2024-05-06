---
title: NitroTranslate API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='mailto:nitro@alconost.com'>Contact Us</a>

includes:
  - errors

search: false
---

# Introduction  

Welcome to the NitroTranslate API! You can use our API to access NitroTranslate API endpoints.

# Authentication

```shell
curl "api_endpoint_here" \
  -H "Content-Type: application/json" \
  -u apikey: 
```

```shell
curl "api_endpoint_here" \
  -H "Content-Type: application/json" \
  -H "Authorization: generate_auth_header_here" 
```

HTTP Basic authentication. The API key acts as the username. API keys are per-account and can be generated and deleted in the <a href="https://app.nitrotranslate.com/customer/settings">Settings page</a>.
Requests should contain a header field in the form of `Authorization: Basic $credentials`, where credentials is the Base64 encoded API key and a blank password joined by a single colon `:`.
You can just copy the Authorization header value when you generate the API key.

# Account

## Get Account

```shell
curl https://api.nitrotranslate.com/v1/account" \
  -H "Content-Type: application/json" \
  -u apikey:
```

> The above command returns JSON structured like this:

```json
{
  "id" : 123,
  "balance_overdraft_allowed": false,
  "reserved": 0.24,
  "balance": 174.46
}
```

This endpoint retrieves an account.

### HTTP Request

`GET https://api.nitrotranslate.com/v1/account`


# Orders

## Get All Orders

```shell
curl "https://api.nitrotranslate.com/v1/orders" \
  -H "Content-Type: application/json" \
  -u apikey:
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 6,
    "status": "QUEUE",
    "snippet": "Test",
    "source_language": "en",
    "target_language": "ru",
    "created_at": "2016-01-29T05:52:17.840197Z"
  },
  {
    "id": 7,
    "status": "DONE",
    "snippet": "Test",
    "source_language": "en",
    "target_language": "it",
    "created_at": "2016-01-29T05:52:17.840197Z",
    "accepted_at": "2016-01-30T012:45:01.223137Z",
    "completed_at": "2016-01-30T13:00:47.312484Z"
  }
]
```

This endpoint retrieves all account orders.

### HTTP Request

`GET https://api.nitrotranslate.com/v1/orders`

### Query Parameters

Parameter | Type | Description
--------- | ---- | -----------
sort | string | Data sorting type. Descending `desc` and ascending `asc` sorting supported.
page | integer | Page number (default: 0)
per_page |  | Orders count (default: 20)


## Get a Specific Order

```shell
curl "https://api.nitrotranslate.com/v1/orders/7" \
  -H "Content-Type: application/json" \
  -u apikey:
```

> The above command returns JSON structured like this:

```json
{
  "id": 7,
  "resource": {
    "type": "text/html",
    "metadata": "resource metadata",
    "data": "html data"
  },
  "source_text": "Test",
  "target_text": "Test",
  "status": "DONE",
  "source_language": "en",
  "target_language": "it",
  "volume": 4,
  "price": 0.05,
  "context": {
    "tone": "GUESS",
    "limit": 5,
    "category": "GENERAL" 
  },
  "comments": [
    {
      "id": 8,
      "time": "2023-02-16T10:47:59.000Z",
      "role": "CUSTOMER",
      "text": "Translation instructions",
      "attachments": [
        {
          "image": "base64 encoded image",
          "type": "image/png",
          "name": "IMAGE 1",
          "weight": 46,
          "size": "481x315"
        }
      ]
    }
  ],
  "created_at": "2023-02-16T10:47:59.000Z",
  "accepted_at": "2023-02-16T13:45:03.000Z",
  "completed_at": "2023-02-16T13:45:10.000Z"
}
```

This endpoint retrieves a specific order.

### HTTP Request

`GET https://api.nitrotranslate.com/v1/orders/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the order to retrieve

## Delete an Order

```shell
curl -X DELETE "https://api.nitrotranslate.com/v1/orders/6" \
  -H "Content-Type: application/json" \
  -u apikey:
```

> The above command returns 204 No Content:

This endpoint deletes a specific order.

### HTTP Request

`DELETE https://api.nitrotranslate.com/v1/orders/<ID>`

### URL Parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | integer | The ID of the order to be deleted

<aside class="notice">
You can delete orders with QUEUE status only.
</aside>

# Translation

## Calculate

```shell
curl "https://api.nitrotranslate.com/v1/calculate" \
  -H "Content-Type: application/json" \
  -u apikey:
  -d '{
  "source_language": "en",
  "target_languages": [
    "en",
    "it"
  ],
  "resource": {
    "type": "text/html",
    "metadata": "resource metadata",
    "data": "html data"
  }
}'
```

> The above command returns JSON structured like this:

```json
[
  {
    "source_language": "en",
    "target_language": "en",
    "volume": 12,
    "price": 0.15
  },
  {
    "source_language": "en",
    "target_language": "it",
    "volume": 12,
    "price": 0.19
  }
]
```

This endpoint returns the translation price.

All prices are in US dollars.

### Request

`POST https://api.nitrotranslate.com/v1/calculate`

### Attributes

Parameter | Required | Type | Description
--------- | -------- | ---- | -----------
source_language | Yes | string | Source language
target_languages | Yes | array | Collection of target languages
resource | Yes | object | Resource to be translated
resource.type | Yes | string | Resource MIME type (at the moment `text/plain`, `text/html`, `text/x-objcstrings`, `application/json` only supported)
metadata |  | string | Аny resource data to identify the order: file name, file path, etc.
resource.data | Yes | string | Resource data

## Translate

```shell
curl "https://api.nitrotranslate.com/v1/translate" \
  -H "Content-Type: application/json" \
  -u apikey: \
  -d '{
  "source_language": "en",
  "target_languages": [
    "en",
    "it"
  ],
  "resource": {
    "type": "text/html",
    "metadata": "resource metadata",
    "data": "html data"
  },
  "context": {
    "tone": "GUESS",
    "limit": 25,
    "category": "GAMES"
  },
  "comment": {
    "text": "Translation instructions",
    "attachments": [
      {
        "type": "image/png",
        "data": "base64 encoded image"
      },
      {
        "type": "image/svg+xml",
        "data": "base64 encoded image"
      }
    ]
  }
}'

```
> The above command returns JSON structured like this:

```json
{
  "text": "Text to translate",
  "resource": {
    "type": "text/html",
    "metadata": "resource metadata",
    "data": "html data"
  },
  "volume": 25,
  "orders": [
    {
      "id": 6,
      "source_language": "en",
      "target_language": "en",
      "price": 0.07,
      "created_at": "2023-11-13T12:19:54.000Z"
    },
    {
      "id": 7,
      "source_language": "en",
      "target_language": "it",
      "price": 0.27,
      "created_at": "2023-11-13T12:19:54.000Z"
    }
  ]
}
```
This endpoint sends the text for translation and creates a list of orders.

### HTTP Request

`POST https://api.nitrotranslate.com/v1/translate`

### Attributes

Parameter | Required | Type | Description
--------- | -------- | ---- | -----------
source_language | Yes | string | Source language
target_languages | Yes | array | Collection of target languages
text | Yes | string | (Deprecated) Text to be translated [Please use  `resource` parameter with `resource.type` - `text/plain` to send the text for translation.]
resource | Yes | object | Resource to be translated
resource.type | Yes | string | Resource MIME type (at the moment `text/plain`, `text/html`, `text/x-objcstrings`, `application/json` only supported)
metadata |  | string | Аny resource data to identify the order: file name, file path, etc.
resource.data | Yes | string | Resource data
context | | object | Context for translator. Includes tone, limit, category
context.tone | | enum | Choose the tone of translation: FORMAL, INFORMAL. Or let our translators choose the tone themselves by specifying GUESS
context.limit | | integer | Limit of the allowed number of characters
context.category | | enum | Choose the category of translation: APPS, CRYPTO, CASINO, LEGAL, E_COMMERCE, FINANCE, GAMES, GENERAL, MEDIA, MEDICAL, SCIENCE, IT, TRAVEL
comment | | object | Comment for translator. Includes text, attachments
comment.text | | string | Text of comment
comment.attachments | | array | Array of image objects
comment.attachments.type | Yes | string | Image mime type (like image/png). Supported image types are png, jpeg, svg and gif
comment.attachments.data | Yes | string | Base64 encoded image

You can find language codes and corresponding language names [here](#supported-languages).

All prices are in US dollars.

# Rates

## Get Rates

```shell
curl "https://api.nitrotranslate.com/v1/rates" \
  -H "Content-Type: application/json"
```

> The above command returns JSON structured like this:

```json
[
  {"source_language": "en", "target_language": "ms", "rate": 15.4 },
  {"source_language": "en", "target_language": "tl", "rate": 15.4 },
  {"source_language": "en", "target_language": "is", "rate": 20.0 }
]
````

This endpoint retrieves all rates.

All prices are in US dollars.

### HTTP Request

`GET https://api.nitrotranslate.com/v1/rates`


# Supported languages

## Languages

Here you can view language codes and corresponding language names. Please note that you must specify the **language code** when placing your order.

Language code | Language
------------- | --------
ar | Arabic
az | Azerbaijani
be | Belarusian
bg | Bulgarian
bn | Bengali
ca | Catalan
cs | Czech
da | Danish
de | German
el | Greek
en | English
es-ES | Spanish
es-MX | Spanish (Mexico)
et | Estonian
fa | Persian
fi | Finnish
fr | French
he | Hebrew
hi | Hindi
hr | Croatian
hu | Hungarian
id | Indonesian
is | Icelandic
it | Italian
ja | Japanese
kk | Kazakh
ko | Korean
lt | Lithuanian
lv | Latvian
ml-IN | Malayalam
ms | Malay
my | Burmese
nl | Dutch
no | Norwegian
pl | Polish
pt-BR | Portuguese (Brazil)
pt-PT | Portuguese (Portugal)
ro | Romanian
ru | Russian
sk | Slovak
sl | Slovene
sr | Serbian (Cyrillic)
sr-CS | Serbian (Latin)
sv-SE | Swedish
ta | Tamil
th | Thai
tl | Tagalog (Philippines)
tr | Turkish
uk | Ukrainian
ur-PK | Urdu (Pakistan)
uz | Uzbek
vi | Vietnamese
zh-CN | Chinese (Simplified)
zh-TW | Chinese (Traditional)
af | Afrikaans
fr-CA | French (Canada)
hy-AM | Armenian
ka | Georgian
te | Telugu
tg | Tajik
ky | Kyrgyz

