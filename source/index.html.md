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

url = "https://api.factmata.com/api/v0.1/score/url"

data = {
  'url': 'www.example.com/some-page'
}
headers = {
  'x-api-key': API_KEY
}
res = requests.post(url, headers=headers, json=data)
```

```shell
curl 'https://api.factmata.com/api/v0.1/score/url?url=https://example.com/page' \
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

`POST https://api.factmata.com/api/v0.1/score/url/?url=www.example.com/some-page`

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

url = "https://api.factmata.com/api/v0.1/score/url/"

data = {
  'url': 'www.example.com/some-page'
}

headers = {
  'x-api-key': API_KEY
}

res = requests.get(url, headers=headers, params=data)
```

```shell
curl 'https://api.factmata.com/api/v0.1/score/url?url=https://example.com/page' \
  -X GET \
  -H "Content-Type: application/json" \
  -H "x-api-key: API_KEY" 
```


> If the URL has finished processing, the JSON structured like this is returned:

```json
{
  "model_names_scores": [
    {
      "model": 7,
      "model_name": "hate",
      "score": 0.314
    },
    {
      "model": 8,
      "model_name": "hype",
      "score": 0.315
    },
    {
      "model": 10,
      "model_name": "bait",
      "score": 0.316
    },
    {
      "model": 11,
      "model_name": "racism",
      "score": 0.317
    },
    {
      "model": 14,
      "model_name": "sexism",
      "score": 0.317
    },
    {
      "model": 17,
      "model_name": "insult",
      "score": 0.318
    },
    {
      "model": 18,
      "model_name": "threat",
      "score": 0.319
    },
    {
      "model": 20,
      "model_name": "toxic",
      "score": 0.320
    },
    {
      "model": 22,
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

`GET https://api.factmata.com/api/v0.1/score/url/?url=www.example.com/some-page&partial_results=False`

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

url = "https://api.factmata.com/api/v0.1/score/domain"

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
curl 'https://api.factmata.com/api/v0.1/score/domain' \
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

`POST https://api.factmata.com/api/v0.1/score/domain/

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

url = "https://api.factmata.com/api/v0.1/score/domain/"

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
curl 'https://api.factmata.com/api/v0.1/score/domain/?domain='www.example.com'&domain='example.com'' \
  -H "x-api-key: API_KEY" 
```

> or you can use post with report flag for large amount of domains (not to hit query length limits)

```python
import requests

url = "https://api.factmata.com/api/v0.1/score/domain/"

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
curl 'https://api.factmata.com/api/v0.1/score/domain/' \
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
        "model": 7,
        "model_name": "hate",
        "score": 0.314
      },
      {
        "model": 8,
        "model_name": "hype",
        "score": 0.315
      },
      {
        "model": 10,
        "model_name": "bait",
        "score": 0.316
      },
      {
        "model": 11,
        "model_name": "racism",
        "score": 0.317
      },
      {
        "model": 14,
        "model_name": "sexism",
        "score": 0.317
      },
      {
        "model": 17,
        "model_name": "insult",
        "score": 0.318
      },
      {
        "model": 18,
        "model_name": "threat",
        "score": 0.319
      },
      {
        "model": 20,
        "model_name": "toxic",
        "score": 0.320
      },
      {
        "model": 22,
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

`GET https://api.factmata.com/api/v0.1/score/domain/?domain="www.example.com"&domain="example.com"`

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

# Opinions

Opinions endpoints provide with the ability to look at the narratives, opinions, themes that emerge in a topic
with various metrics.
As well as that, they can compare themes of 2 different topics.

## Authentication

The  API uses JWT tokens to authenticate requests. Login is performed via AWS Cognito. 
Once the JWT is received via Cognito, it should be passed in every API request via the Authorization 
header using the Bearer schema.

Example of a request after the authentication

```python
import requests

url = "https://api-gw.production.factmata.com/api/v1/intelligence/topic"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/api/v1/intelligence/topic' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```

<aside class="warning">
Do not share your API Key in publicly accessible platforms.
</aside>


## Pagination
All list endpoints give a response in the following format

```json
{
  "count": 5,
  "previous": 1,
  "next": 3,
  "result": [
    {
      "id": 1,
      "title": "Avon Hydra Fusion"
    },
    {
      "id": 2,
      "title": "Avon Hydra"
    }
  ]
}
```

### Response data
Name | Type | Description |
-----| -----| ----------- | -
count | int | Number of all elements
previous | int | Number of the previous pages, empty if there is no previous page
next | int | Number of the next pages, empty if there is no next page
result | list | List of objects limited by `page_size`

## Query params
Name | Type | Default | Description |
-----| -----| ------- | ----------- | -
page | int | 1 | Page to retrieve. Has to be more than 0
page_size | int | 20 | Size of the result. Has to be between 1 and 100

## Common errors
Code | Text | Description |
-----| ---- | ----------- | -
401 | {'message': 'Unauthorized'} | API Gateway response when the custom or Amazon Cognito authorizer failed to authenticate the caller.
403 | {'message': 'Access denied'} | API Gateway response for authorization failure. Access is denied by Amazon Cognito authorizer 
403 | {'message': 'Expired token'} | API Gateway response for an AWS authentication token expired error 
403 | {'message': 'Invalid API key'} API Gateway response for an invalid API key submitted for a method requiring an API key
403 | {'message': 'Invalid signature'} | API Gateway response for an invalid AWS signature error
403 | {'message': 'Missing authentication token'} | API Gateway response for a missing authentication token error, including the cases when the client attempts to invoke an unsupported API method or resource
403 | {'message': 'WAF filtered'} | API Gateway response when a request is blocked by AWS WAF
404 | {'message': 'Object with id $ID not found'} | The wrong id passed to detail endpoint

## Opinion Metrics
The following table lists the metrics currently generated reported by the ML
 pipelines and identifies which metrics are available for each product and entity type.

##  Metrics description by Factmata’s product type (Monitoring vs One-off) 
Name | Brands (Opinion monitoring) | Gov / Media (Opinion Intelligence)
-----| --------------------------- | -------------------------------- | -
negative_stance_score | yes | yes
positive_stance_score | yes | yes
outlierness_score | yes | yes
popularity_score | yes | yes
influencer_score | yes | yes
propaganda_score | no | yes
bot_generated_score | no | yes
threat_score | no | yes

## Metrics by entity type
Name | Theme | Narrative | Opinion | Opinion Maker | WebContent
-----| ----- | --------- | ------- | ------------- | ---------- | -
negative_stance_score | yes | yes | yes | no | no
positive_stance_score | yes | yes | yes | no | no
outlierness_score | yes | yes | no | no | no
popularity_score | yes | yes | yes | no | no
influencer_score | yes | yes | no | yes | no
propaganda_score | yes | yes | no | no | yes
bot_generated_score | yes | yes | yes | no | no
threat_score | yes | yes | no | no | no

## Metrics description
Name | Type | Range  
-----| ---- | ----- | -
negative_stance_score | float | 0.00 - 1.00
positive_stance_score | float | 0.00 - 1.00
outlierness_score | float | 0.00 - 1.00
popularity_score | yes | 0+
influencer_score | yes | 0+
propaganda_score | float | 0.00 - 1.00
bot_generated_score | float | 0.00 - 1.00
threat_score | float | 0.00 - 1.00

## API endpoints

## Topics

A topic is a subject for which Factmata generates insights for a customer.

## List topics


```python
import requests

url = "https://api-gw.production.factmata.com/api/v1/intelligence/topic"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/api/v1/intelligence/topic' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```

> Response example

```json
[
  {
    "id": 12,
    "title": "Avon Hydra Fusion",
    "created_at": "2019-01-01T00:00:00+00:00"
  }
]
```

Returns a list of topics tracked for a customer.

#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/topic`




## Detail topics


```python
import requests

url = f"https://api-gw.production.factmata.com/api/v1/intelligence/topic/{id}"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/api/v1/intelligence/topic/$ID' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```

> Response example

```json
{
  "id": 12,
  "title": "Avon Hydra Fusion",
  "created_at": "2019-01-01T00:00:00+00:00"
}
```

Returns a topic by its id.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/topic/:id`



## Themes

A theme is an aspect of a topic based on opinions that are most interesting or popular.

## List topic themes

```python
import requests

url = f"https://api-gw.production.factmata.com/v1/intelligence/topic/{topic_id}/theme"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/v1/intelligence/topic/$THEME_ID/theme' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```
> Response example

```json
[
  {
    "id": 1,
    "title": "cost",
    "metrics": {
      "negative_stance_score": 0.32324123,
      "positive_stance_score": 0.22623175,
      "outlierness_score": 0.296705679,
      "popularity_score": 0.56848747,
      "propaganda_score": 0.48008755,
      "threat_score": 0.08953477,
      "num_narratives": 65,
      "num_opinions": 120
    },
    "metrics_by_date": [
      {
        "recorded_on": "2018-09-06T00:00:00+00:00",
        "values": {
          "negative_stance_score": 0.41308644,
          "positive_stance_score": 0.48008755,
          "outlierness_score": 0.254146592,
          "popularity_score": 0.276934175,
          "propaganda_score": 0.090985734,
          "threat_score": 0.07531446
        }
      }
    ],
    "created_at": "2019-11-01T00:00:00+00:00",
    "oldest_webcontent_published_at": "2018-01-03T00:00:00+00:00",
    "newest_webcontent_published_at": "2018-04-23T00:00:00+00:00"
  }
]
```

Returns a list of themes in a topic.

#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/topic/:topicId/theme`



#### Query parameters
Name | Type | Description  
-----| ---- | ----------- | -
created_at_lt | ISO 8601 string | Filter by created_at, less than 
created_at_gt | ISO 8601 string | Filter by created_at, greater than  
created_at_lte | ISO 8601 string | Filter by created_at, less than or equal 
created_at_gte | ISO 8601 string | Filter by created_at, greater than or equal 
metrics_created_at_lt | ISO 8601 string | Filter metrics list by created_at,  less than
metrics_created_at_gt | ISO 8601 string | Filter metrics list by created_at,  greater than 
metrics_created_at_lte | ISO 8601 string | Filter metrics list by created_at,  less than or equal
metrics_created_at_gte | ISO 8601 string | Filter metrics list by created_at,  greater than or equal
sort_by | string | Sorting key. The default value is `num_narratives`. Supported values include the ones returned in the metrics array. Items in `metrics_by_date array` are sorted in chronological order based on `recorded_on`.


## Detail themes


```python
import requests

url = f"https://api-gw.production.factmata.com/api/v1/intelligence/theme/{id}"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/api/v1/intelligence/theme/$ID' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```

> Response example

```json
{
  "id": 1,
  "title": "cost",
  "metrics": {
    "negative_stance_score": 0.32324123,
    "positive_stance_score": 0.22623175,
    "outlierness_score": 0.296705679,
    "popularity_score": 0.56848747,
    "propaganda_score": 0.48008755,
    "threat_score": 0.08953477,
    "num_narratives": 65,
    "num_opinions": 120
  },
  "metrics_by_date": [
    {
      "recorded_on": "2018-09-06T00:00:00+00:00",
      "values": {
        "negative_stance_score": 0.41308644,
        "positive_stance_score": 0.48008755,
        "outlierness_score": 0.254146592,
        "popularity_score": 0.276934175,
        "propaganda_score": 0.090985734,
        "threat_score": 0.07531446
      }
    }
  ],
  "created_at": "2019-11-01T00:00:00+00:00",
  "oldest_webcontent_published_at": "2018-01-03T00:00:00+00:00",
  "newest_webcontent_published_at": "2018-04-23T00:00:00+00:00"
}
```

Return a theme by its id.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/theme/:id`

#### Query parameters
Name | Type | Description  
-----| ---- | ----------- | -
metrics_created_at_lt | ISO 8601 string | Filter metrics list by created_at,  less than
metrics_created_at_gt | ISO 8601 string | Filter metrics list by created_at,  greater than 
metrics_created_at_lte | ISO 8601 string | Filter metrics list by created_at,  less than or equal
metrics_created_at_gte | ISO 8601 string | Filter metrics list by created_at,  greater than or equal


## Narratives

A narrative describes the story that emerges in a topic theme.

## List narratives

```python
import requests

url = f"https://api-gw.production.factmata.com/v1/intelligence/topic/{topic_id}/theme/{theme_id}/narrative"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/v1/intelligence/topic/$TOPIC_ID/theme/$THEME_ID/narrative' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```
> Response example

```json
[
  {
    "id": 8,
    "title": "Cream based cosmetics",
    "metrics": {
      "negative_stance_score": 0.32324123,
      "positive_stance_score": 0.22623175,
      "outlierness_score": 0.296705679,
      "popularity_score": 0.56848747,
      "propaganda_score": 0.48008755,
      "threat_score": 0.08953477,
      "num_opinions": 223
    },
    "metrics_by_date": [
      {
        "recorded_on": "2018-09-06T00:00:00+00:00",
        "values": {
          "negative_stance_score": 0.41308644,
          "positive_stance_score": 0.48008755,
          "outlierness_score": 0.254146592,
          "popularity_score": 0.276934175,
          "propaganda_score": 0.090985734,
          "threat_score": 0.07531446
        }
      }
    ],
    "created_at": "2019-11-01T00:00:00+00:00",
    "oldest_webcontent_published_at": "2018-01-03T00:00:00+00:00",
    "newest_webcontent_published_at": "2018-04-23T00:00:00+00:00"
  }
]
```

Returns a list of narratives for a theme.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/topic/:topic_id/theme/:theme_id/narrative`



#### Query parameters
Name | Type | Description  
-----| ---- | ----------- | -
created_at_lt | ISO 8601 string | Filter by created_at, less than 
created_at_gt | ISO 8601 string | Filter by created_at, greater than  
created_at_lte | ISO 8601 string | Filter by created_at, less than or equal 
created_at_gte | ISO 8601 string | Filter by created_at, greater than or equal 
metrics_created_at_lt | ISO 8601 string | Filter metrics list by created_at,  less than
metrics_created_at_gt | ISO 8601 string | Filter metrics list by created_at,  greater than 
metrics_created_at_lte | ISO 8601 string | Filter metrics list by created_at,  less than or equal
metrics_created_at_gte | ISO 8601 string | Filter metrics list by created_at,  greater than or equal
sort_by | string | Sorting key. The default value is `num_opinions`. Supported values include the ones returned in the metrics array. Items in `metrics_by_date array` are sorted in chronological order based on `recorded_on`.


## Detail narratives


```python
import requests

url = f"https://api-gw.production.factmata.com/api/v1/intelligence/narrative/{id}"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/api/v1/intelligence/narrative/$ID' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```

> Response example

```json
{
  "id": 8,
  "title": "Cream based cosmetics",
  "metrics": {
    "negative_stance_score": 0.32324123,
    "positive_stance_score": 0.22623175,
    "outlierness_score": 0.296705679,
    "popularity_score": 0.56848747,
    "propaganda_score": 0.48008755,
    "threat_score": 0.08953477,
    "num_opinions": 223
  },
  "metrics_by_date": [
    {
      "recorded_on": "2018-09-06T00:00:00+00:00",
      "values": {
        "negative_stance_score": 0.41308644,
        "positive_stance_score": 0.48008755,
        "outlierness_score": 0.254146592,
        "popularity_score": 0.276934175,
        "propaganda_score": 0.090985734,
        "threat_score": 0.07531446,
        "num_opinions": 18
      }
    }
  ],
  "created_at": "2019-11-01T00:00:00+00:00",
  "oldest_webcontent_published_at": "2018-01-03T00:00:00+00:00",
  "newest_webcontent_published_at": "2018-04-23T00:00:00+00:00"
}
```

Return a narrative by its id.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/narrative/:id`

#### Query parameters
Name | Type | Description  
-----| ---- | ----------- | -
metrics_created_at_lt | ISO 8601 string | Filter metrics list by created_at,  less than
metrics_created_at_gt | ISO 8601 string | Filter metrics list by created_at,  greater than 
metrics_created_at_lte | ISO 8601 string | Filter metrics list by created_at,  less than or equal
metrics_created_at_gte | ISO 8601 string | Filter metrics list by created_at,  greater than or equal


## Opinions

An opinion is a claim made for a specific topic. Opinions are grouped within a narrative for a topic.

## List narrative opinions

```python
import requests

url = f"https://api-gw.production.factmata.com/v1/intelligence/narrative/{narrative_id}/opinion"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/v1/intelligence/narrative/:id/opinion' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```
> Response example

```json
[
  {
    "id": 199,
    "text": "acquia has a high cost  at 100k annually",
    "metrics": {
      "negative_stance_score": 0.41308644,
      "positive_stance_score": 0.48008755,
      "bot_generated_score": 0.254146592,
      "popularity_score": 0.276934175
    },
    "created_at": "2019-11-01T00:00:00+00:00",
    "opinion_makers": [
      {
        "id": 8,
        "url": "https://twitter.com/@raybae689",
        "influencer_score": 0.32
      }
    ],
    "webcontents": [
      {
        "type": "ARTICLE",
        "download_url": "https://api.factmata.com/v1/downloads/webcontents/53374d64-223d-11ea-978f-2e728ce88125.json",
        "author": "Roydon Ng",
        "author_url": "https://twitter.com/RoydonNg",
        "source": "christiantoday.com.au",
        "page_url": "https://christiantoday.com.au/news/democracy-cant-save-hong-kong.html",
        "resolved_page_url": null,
        "published_at": "2019-10-11T00:00:00+00:00",
        "metrics": {
          "propaganda_score": 0.03
        }
      }
    ]
  },
]
```

Returns a list of opinions for a narrative.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/narrative/:narrative_id/opinion`


#### Query parameters
Name | Type | Description  
-----| ---- | ----------- | -
sort_by | string | Sorting key. The default value is popularity_score. Supported values include the ones returned in the metrics array.


## Detail opinions

```python
import requests

url = f"https://api-gw.production.factmata.com/v1/opinion/{id}"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/api/v1/opinion/$ID' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```

> Response example

```json
{
  "id": 199,
  "text": "acquia has a high cost  at 100k annually",
  "metrics": {
    "negative_stance_score": 0.41308644,
    "positive_stance_score": 0.48008755,
    "bot_generated_score": 0.254146592,
    "popularity_score": 0.276934175
  },
  "created_at": "2019-11-01T00:00:00+00:00",
  "opinion_makers": [
    {
      "id": 8,
      "url": "https://twitter.com/@raybae689",
      "influencer_score": 0.32
    },
  ],
  "webcontents": [
    {
      "type": "ARTICLE",
      "download_url": "https://api.factmata.com/v1/downloads/webcontents/53374d64-223d-11ea-978f-2e728ce88125.json",
      "author": "Roydon Ng",
      "author_url": "https://twitter.com/RoydonNg",
      "source": "christiantoday.com.au",
      "page_url": "https://christiantoday.com.au/news/democracy-cant-save-hong-kong.html",
      "resolved_page_url": null,
      "published_at": "2019-10-11T00:00:00+00:00",
      "metrics": {
        "propaganda_score": 0.03
      }
    }
  ]
}
```

Returns an opinion by its ID.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/opinion/:id`


## Opinions makers

An opinion maker is a user that makes opinions with a stance towards a specific narrative.

## List opinion makers

```python
import requests

url = f"https://api-gw.production.factmata.com/v1/intelligence/opinion/{narrative_id}/opinion_maker"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/v1/intelligence/opinion/$OPINION_ID/opinion_maker' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```
> Response example

```json
[
  {
    "id": 8,
    "url": "https://twitter.com/@raybae689",
    "influencer_score": 0.32,
    "created_at": "2019-01-01T00:00:00+00:00"
  }
]
```

Returns a list of opinion makers for an opinion sorted by influencer_score in descending order.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/opinion/:opinion_id/opinion_maker`


## Detail opinion markers

```python
import requests

url = f"https://api-gw.production.factmata.com/v1/intelligence/opinion_maker/{id}"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/v1/intelligence/opinion_maker/$ID' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```

> Response example

```json
{
  "id": 8,
  "url": "https://twitter.com/@raybae689",
  "influencer_score": 0.32,
  "created_at": "2019-01-01T00:00:00+00:00"
}
```

Returns an opinion maker by its id.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/opinion_maker/:id`

## Comparisons

A comparison shows common themes for topics

## List comparisons

```python
import requests

url = f"https://api-gw.production.factmata.com/v1/intelligence/comparison"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/v1/intelligence/comparison' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```
> Response example

```json
[
  {
    "id": 1,
    "title": "Avon vs. Neutrogena",
    "created_at": "2019-01-01T00:00:00+00:00"
  }
]
```

Returns a list of comparisons.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/comparison`


## Detail comparisons

```python
import requests

url = f"https://3gg17c8hfh.execute-api.eu-west-1.amazonaws.com/production /v1/intelligence/comparison/{id}"

headers = {
  'X-API-KEY': f'Bearer {JWT_TOKEN}'
}
res = requests.get(url, headers=headers)
```

```shell
curl 'https://api-gw.production.factmata.com/v1/intelligence/comparison/$ID' \
  -H "Content-Type: application/json" \
  -H "X-API-KEY: Bearer $JWT_TOKEN" 
```

> Response example

```json
{
  "id": 1,
  "title": "Avon vs. Neutrogena",
  "created_at": "2019-01-01T00:00:00+00:00",
  "topics": [
    {
      "id": 12,
      "title": "Avon Hydra Fusion",
      "created_at": "2019-01-01T00:00:00+00:00",
      "themes": [
        {
          "id": 1,
          "title": "cost",
          "topic_id": 23,
          "metrics": {
            "negative_stance_score": 0.32324123,
            "positive_stance_score": 0.22623175,
            "outlierness_score": 0.296705679,
            "popularity_score": 0.56848747,
            "propaganda_score": 0.48008755,
            "threat_score": 0.08953477,
            "num_narratives": 65,
            "num_opinions": 120
          },
          "metrics_by_date": [
            {
              "recorded_on": "2018-09-06T00:00:00+00:00",
              "values": {
                "negative_stance_score": 0.41308644,
                "positive_stance_score": 0.48008755,
                "outlierness_score": 0.254146592,
                "popularity_score": 0.276934175,
                "propaganda_score": 0.090985734,
                "threat_score": 0.07531446
              }
            }
          ],
          "created_at": "2019-11-01T00:00:00+00:00",
          "oldest_webcontent_published_at": "2018-01-03T00:00:00+00:00",
          "newest_webcontent_published_at": "2018-04-23T00:00:00+00:00"
        }
      ]
    }
  ]
}
```

Returns a comparison by its ID.


#### HTTP Request

`GET https://api-gw.production.factmata.com/api/v1/intelligence/comparison/:id`

#### Query parameters
Name | Type | Description  
-----| ---- | ----------- | -
metrics_created_at_lt | ISO 8601 string | Filter metrics list by created_at,  less than
metrics_created_at_gt | ISO 8601 string | Filter metrics list by created_at,  greater than 
metrics_created_at_lte | ISO 8601 string | Filter metrics list by created_at,  less than or equal
metrics_created_at_gte | ISO 8601 string | Filter metrics list by created_at,  greater than or equal

