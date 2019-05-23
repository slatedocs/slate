---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

-- Introduction --

Welcome to the Factmata API!

# Authorization

Factmata API is authorized using API Key. If you don't have a key please contact info@factmata.com to get one set up.

The API_KEY is accepted as a request header `x-api-key`.

Do not share you API Key in publicly accessible platforms.

```shell

curl https://www.factmata.com \
-H "x-api-key: API_KEY"
```

# Scoring URLs

Scoring URLs using Factmata API works in two steps:

## 1. Submitting URL for scoring
   
    Before a URL can be scored, it needs to be scraped, and then scored by our models.
    And hence the URL needs to be submitted first.

## 2. Fetching the scores

    After the URL has been submitted, the results will be available in some time.

    URL Scoring is complete when it has been scored by all models.

    During the time between submission and fetching, URL might already have 
    been scored by some models, while some are still are processing. In this case,
    the user has the option to fetch the partial scores.


## Submit a URL for scoring

To score a URL, it needs first needs to be submitted.

```python
import requests

data = {
  'url': 'www.example.com'
}
headers = {
  'x-api-key': API_KEY
}
res = requests.post("URL", headers=headers, json=data)
```

```shell
curl https://www.factmata.com 
  -X POST 
  -H "Content-Type: application/json" 
  -H "x-api-key: API_KEY"
  -d '{"url": "www.example.com"}'
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
STATUS: 299
```
```
{ "answer": "URL is being processed" }
```

### HTTP Request

`POST https://www.factmata.com`

### Request Payload

Parameter | Description
--------- | -----------
url | A valid URL string. This parameter is `required`. In case the URL is malformed or absent, request is abortd with status `422`. If the URL has already been submitted for scoring, status `299` is returned.

<aside class="notice">
URL once submitted once, does not need to be submitted again
</aside>

<aside class="notice">
After submitting the URL, the average time before it is fully processed is `x ms`
</aside>

## Fetch the scores of a URL

After a URL has been submitted for scoring, you can fetch the scores
using this API.




```python
import requests

data = {
  'url': 'www.example.com'
}

headers = {
  'x-api-key': API_KEY
}

res = requests.get("URL", headers=headers, params=data)
```

```shell
curl "URL?url=www.example.com"
  - H "x-api-key: API_KEY"
  -X GET
```


> If the URL has finished processing, the JSON structured like this is returned:

```json
{
  "models_scores": [
    {
      "model": 1,
      "score": 0.314
    },
    {
      "model": 2,
      "score": 0.314
    },
    ...
  ],
  "combined_score": 0.1414
}
```

> If `partial_results` flag is set and the URL is still processing, the following response is returned

```json
{
  "models_scores": [
    {
      "model": 1,
      "score": 0.314
    },
    ## At this stage only model 1 has finished processing
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

`GET http://www.example.com?url=www.example.com&partial_results=False`

Fetching the scores has the following use cases:

### URL is fully processed 

When the URL is fully processed, all the model scores, as well as the `combined score` are returned.

### URL is partially processed, `partial_results` is True

The case when GET request is made, but only some models have finished scoring the URL, the user can fetch the scores of the `finished` models using the `partial_results` query parameter.
When `partial_results` is set to `True`, scores from models that have finished processing are returned.

### URL is partially processed, `partial_results` is False

In this case, no scores are returned, and the API returns status code `202`
### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
url | None | A valid URL string. This parameter is `required`. In case the URL is malformed or absent, request is abortd with status `422`. If the URL has already been submitted for scoring, status `299` is returned.
partial_results | False | Optional Boolean flag if partial results are wanted
