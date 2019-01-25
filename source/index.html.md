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

# Scoring URLs

Scoring URLs using Factmata API works in two steps:

1. Submitting URL for scoring

2. Fetching the scores

## Submit a URL for scoring

To score a URL, it needs first needs to be submitted for scoring.

```python
import requests

data = {
  'url': 'www.example.com'
}

res = requests.post("URL", json=data)
```

```shell
curl "URL"
  -X POST
  -H "Content-Type: application/json"
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

`POST URL`

### Request Payload

Parameter | Description
--------- | -----------
url | A valid URL

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Fetch the scores of a URL

After a URL has been submitted for scoring, you can fetch the scores
using the following API

--Document the time gap and cases--


```python
import requests

data = {
  'url': 'www.example.com'
}
res = requests.get("URL", params=data)
```

```shell
curl "URL?url=www.example.com"
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

`GET URL?url=www.example.com&partial_results=False`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
url | None | A Valid URL. URL is required
partial_results | False | Optional Boolean flag if you want partial results
