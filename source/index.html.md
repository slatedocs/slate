---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>


search: true
---

# Introduction

-- Introduction --

Welcome to the Factmata API!

# Authorization

Factmata API is authorized using API Key. If you don't have a key please contact info@factmata.com to get one set up.

The API_KEY is accepted as a request header `x-api-key`.

Do not share you API Key in publicly accessible platforms.

# Scoring URLs

Scoring URLs using Factmata API works in two steps:

## 1. Submitting URL for scoring
   
    Before a URL can be scored, it needs to be scraped, and then scored by our model_names.
    And hence the URL needs to be submitted first.

## 2. Fetching the scores

    After the URL has been submitted, the results will be available in some time.

    URL Scoring is complete when it has been scored by all model_names.

    During the time between submission and fetching, URL might already have 
    been scored by some model_names, while some are still are processing. In this case,
    the user has the option to fetch the partial scores.


## Submit an URL for scoring

To score a URL, it first needs to be submitted.

```python
import requests

url = "https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/url"

data = {
  'url': 'www.example.com/some-page'
}
headers = {
  'x-api-key': API_KEY
}
res = requests.post(url, headers=headers, json=data)
```

```shell
curl 'https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/url?url=https://example.com/page' \
  -X POST \
  -H "Content-Type: application/json" \
  -H "x-api-key: API_KEY" 
```

> When the URL is successfully submitted for processing, the following response is returned

```json
STATUS: 202
```
```json
{"answer": "Request Sent Successfully"}
```

> If the URL is already being processed, the following response is returned

```json
STATUS: 200
```
```
{ "answer": "URL is being processed" }
```

### HTTP Request

`POST https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/url/?url=www.example.com/some-page`

### Request Payload

Parameter | Description
--------- | -----------
url | A valid URL string. This parameter is `required`. In case the URL is malformed or absent, request is aborted with status `422`. If the URL has already been submitted for scoring, status `200` is returned.

<aside class="notice">
URL once submitted once, does not need to be submitted again
</aside>

<aside class="notice">
Currently only English web-pages are scored.
</aside>

<aside class="warning">
URL must contain a path along with the domain/subdomain name. 
</aside>

## Fetch the scores of a URL

After a URL has been submitted for scoring, you can fetch the scores
using this API.


```python
import requests

url = "https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/url/"

data = {
  'url': 'www.example.com/some-page'
}

headers = {
  'x-api-key': API_KEY
}

res = requests.get(url, headers=headers, params=data)
```

```shell
curl 'https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/url?url=https://example.com/page' \
  -X GET \
  -H "Content-Type: application/json" \
  -H "x-api-key: API_KEY" 
```


> If the URL has finished processing, the JSON structured like this is returned:

```json
{
  "model_names_scores": [
    {
      "model": "7",
      "model_name": "hate",
      "score": 0.314
    },
    {
      "model": "8",
      "model_name": "hype",
      "score": 0.315
    },
    {
      "model": "10",
      "model_name": "bait",
      "score": 0.316
    },
    {
      "model": "11",
      "model_name": "racism",
      "score": 0.317
    },
    {
      "model": "14",
      "model_name": "sexism",
      "score": 0.317
    },
    {
      "model": "17",
      "model_name": "insult",
      "score": 0.318
    },
    {
      "model": "18",
      "model_name": "threat",
      "score": 0.319
    },
    {
      "model": "20",
      "model_name": "toxic",
      "score": 0.320
    },
    {
      "model": "22",
      "model_name": "obscene",
      "score": 0.320
    }
  ],
  "combined_score": 0.320
}
```

> If `partial_results` flag is set and the URL is still processing, the following response is returned

```json
{
  "model_names_scores": [
    {
      "model_name": "hate",
      "score": 0.314
    },
    ## At this stage only model_name 1 has finished processing
  ]
}
```

> If the `partial_results` flag is not set and the URL is still processing, the following response is returned 

```json
STATUS: 202
```
```json
{
  "answer": "Please try again later"
}
```

### HTTP Request

`GET https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/url/?url=www.example.com/some-page&partial_results=False`

Fetching the scores has the following use cases:

### URL is fully processed 

When the URL is fully processed, all the model_name scores, as well as the `combined score` are returned.

### URL is partially processed, `partial_results` is True

The case when GET request is made, but only some model_names have finished scoring the URL, the user can fetch the scores of the `finished` model_names using the `partial_results` query parameter.
When `partial_results` is set to `True`, scores from model_names that have finished processing are returned.

### URL is partially processed, `partial_results` is False

In this case, no scores are returned, and the API returns status code `202`
### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
url | None | A valid URL string. This parameter is `required`. In case the URL is malformed or absent, request is aborted with status `422`. If the URL has already been submitted for scoring, status `200` is returned.
partial_results | False | Optional Boolean flag if partial results are wanted

# Scoring domains

Scoring domains using Factmata API works in two steps:

## 1. Submitting domains for scoring
   
    Before domains can be scored, they need to be crawled, and the crawled urls need to be
    scraped, and then the urls are scored by our model_names. Hence, the domains 
    need to be submitted first.

## 2. Fetching the scores

    After the domains have been submitted, the results will be available in some time.

    Domain Scoring is complete when all of the urls have been scored by all model_names.

    During the time between submission and fetching, some domains might already have 
    been scored, while other are still processing. In this case,
    the user has the option to fetch the partial scores.


## Submit domains for scoring

To score domains, they first needs to be submitted.

```python
import requests

url = "https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/domain"

data = {
  'domain': [
    'www.example.com',
    'example.com',
  ],
  'threshold': 5,
  'crawl_number': 100
}
headers = {
  'x-api-key': API_KEY
}
res = requests.post(url, headers=headers, json=data)
```

```shell
curl 'https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/domain' \
  --data '{"domain": ["www.example.com", "example.com"], "threshold": 5, "crawl_number": 100}' \
  -X POST \
  -H "Content-Type: application/json" \
  -H "x-api-key: API_KEY" 
```

> When the domains are successfully submitted for processing, the following response is returned

```json
STATUS: 202
```
```json
{"answer": "request sent successfully, added 2 domains: example.com, www.example.com"}

```

> If the domains are already being processed, the following response is returned

```json
STATUS: 406
```
```json
{"answer": "domains are already processing"}
```
> If the domains are already successfully processed, the following response is returned

```json
STATUS: 406
```
```json
{"answer": "These domains are successfully processed, send GET"}
```

### HTTP Request

`POST https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/domain/

### Request Payload

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
domain | True | None | A valid domain string. In case any of the domains is malformed, request is aborted with status `422`. If all of the domains are already successfully processed in the last 90 days, status `406` is returned. If all of the domains are already processing, status `406` is returned.
threshold | False | 5 | The minimum number of crawled urls for the domains.
crawl_number | False | 100 | The desired number of crawled urls for the domains.
report | False | False | Flag to treat the endpoint as the GET endpoint (in order to send domains in body and not in a query string).

<aside class="notice">
Only new domains will be submitted from the domain list.
</aside>

<aside class="notice">
Domain is submitted once per 90 days, does not need to be submitted again in this period.
</aside>

<aside class="notice">
Currently only English web-pages are scored.
</aside>

<aside class="notice">
In case of a very big list of domains (100+), 504 status can be returned. 
It does not mean that the request failed.
</aside>

<aside class="warning">
A domain must not contain a protocol (http, https) or a subroute (example.com/page/1). 
</aside>

## Fetch the scores for domains

After domains have been submitted for scoring, you can fetch the scores.
using this API.


```python
import requests

url = "https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/domain/"

data = {
  'domain': [
    'www.example.com',
    'example.com',
  ],
}

headers = {
  'x-api-key': API_KEY
}

res = requests.get(url, headers=headers, params=data)
```

```shell
curl 'https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/domain/?domain='www.example.com'&domain='example.com'' \
  -H "x-api-key: API_KEY" 
```

> or you can use post with report flag for large amount of domains (not to hit query length limits)

```python
import requests

url = "https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/domain/"

data = {
  'domain': [
    'www.example.com',
    'example.com',
  ],
  'report': True
}

headers = {
  'x-api-key': API_KEY
}

res = requests.post(url, headers=headers, params=data)
```

```shell
curl 'https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/domain/' \
  --data '{"domain": ["www.example.com", "example.com"], "report": true}' \
  -X POST \
  -H "Content-Type: application/json" \
  -H "x-api-key: API_KEY" 
```

> If the domain has finished processing, the JSON structured like this is returned:

```json
{
  "domain": "example.com", 
  "status": "success",
  "score": {
    "model_names_scores": [
      {
        "model": "7",
        "model_name": "hate",
        "score": 0.314
      },
      {
        "model": "8",
        "model_name": "hype",
        "score": 0.315
      },
      {
        "model": "10",
        "model_name": "bait",
        "score": 0.316
      },
      {
        "model": "11",
        "model_name": "racism",
        "score": 0.317
      },
      {
        "model": "14",
        "model_name": "sexism",
        "score": 0.317
      },
      {
        "model": "17",
        "model_name": "insult",
        "score": 0.318
      },
      {
        "model": "18",
        "model_name": "threat",
        "score": 0.319
      },
      {
        "model": "20",
        "model_name": "toxic",
        "score": 0.320
      },
      {
        "model": "22",
        "model_name": "obscene",
        "score": 0.320
      }
    ],
    "URLs": ["https://example.com/feed/", "https://example.com/about/", ...],
    "Example URL": "https://example.com/feed/", 
    "Domain Score": 0.32
  }, 
  "dt_created": "2019-12-11T14:38:35.246635+00:00",
  "dt_updated": "2019-12-14T07:30:08.748324+00:00"
}
```

> If a domain is still processing, the following response is returned

```json
{
   "domain": "example.com", 
   "status": "progress",
   "score": null,
   "dt_created": "2019-12-19T09:42:11.110089+00:00", 
   "dt_updated": "2019-12-19T09:42:11.110094+00:00"
}
```

> If a domain is absent, the following response is returned

```json
{
   "domain": "example.com", 
   "status": "absent"
}
```

> If a domain finished with an error, the following response is returned

```json
{
  "domain": "example.com", 
  "status": "error",
  "score": "Error message", 
  "dt_created": "2019-11-04T13:24:12.213925+00:00", 
  "dt_updated": "2019-11-05T00:45:06.583050+00:00"
}
```


### HTTP Request

`GET https://t7zcyk5xx0.execute-api.eu-west-1.amazonaws.com/production/api/v0.1/score/domain/?domain="www.example.com"&domain="example.com"`

Fetching the scores has the following use cases:

### Domain is successfully processed 

Status `success` and `score` with model_name scores are returned.

### Domain is processed with an error

Status `error` and `score` containing the error message are returned.

### Domain is still processing

Status `progress` is returned.

### Domain is absent

Status `absent` is returned.


Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
domain | None | True | A valid domain string. In case ant of the domains are malformed, request is aborted with status `422`. 

