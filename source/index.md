---
title: API Reference | NewsWhip

language_tabs:
  - shell
  - php

toc_footers:
  - <a href='#getting-api-access'>Sign Up for a Developer Key</a>
  - <p>© 2015 NewsWhip Media Ltd.</p>

includes:
  - errors

search: true
---

# Overview

Welcome to the NewsWhip API documentation. The NewsWhip API provides access to real time data trends, aggregate data, statistics, and social numbers for all content we have been tracking since January 1, 2014 - hundreds of millions of stories, fully categorized and ranked.

The NewsWhip API is language agnostic. Any HTTP client or library can be used with this API.

This documentation is open source. If you've found any errors, typos or would like to improve this document, feel free to send us a pull request: [GitHub](http://github.com/NewsWhip/slate).

# Authentication

All NewsWhip API endpoints require an API key. Your API key should be passed with each `GET` or `POST` request as a Query String.

`GET /v1/region/U.S./Politics/24?key=YOUR_API_KEY`

`POST /v1/articles?key=YOUR_API_KEY`

<aside class="warning">Your API key should be treated as a password. It should be kept secret at all times.</aside>

## Getting API Access

Our API is made available to NewsWhip clients and developers who wish to work with streams of trending content in any niche. Right now, it's powering widgets on major news sites, internal dashboards, and mobile apps in Europe and North America.

For details on getting access, email: [api@newswhip.com](mailto:api@newswhip.com).

# Rate Limits

Each API key is limited by default to 100 API requests per 5 minutes. Once you exceed this limit, calls will return: 

Error Code | Meaning
---------- | -------
429 | Too Many Requests -- You're requesting too many kittens! Slow down!

<aside class="notice">Contact us at api@newswhip.com if your application requires higher limits.</aside>

# API Endpoints

NewsWhip provides 2 different endpoints designed for different use cases, each available at varying commercial rates.

* `GET` requests: best suited for finding real-time trending articles in any niche and social network, with or without video and published in any country up to a week ago.
* `POST` requests: best suited for very precise article filtering, real-time analytics, aggregations and reporting. These APIs slice and dice our data in any form you want.

### HTTPS Endpoint
`https://api.newswhip.com/`

# GET Requests

The real-time GET API endpoints are designed to mirror Spike's functionality. You can get all trending content in any Niche or Region, ordered by any social metric.

There are 4 different endpoints:

* `GET /v1/region/{region}/{category}/{time_period}`
* `GET /v1/publisher/{publisher}/{time_period}`
* `GET /v1/local/{city}/All/{time_period}`
* `GET /v1/search?q={search_term}`

All 4 GET endpoints accept the following Query Parameters:

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
video_only | false | If set to true, the result will ONLY include content with embedded video.
sort_by | default | Defines how the articles are ranked. Accepts one of the following: `default`, `fb_likes`, `fb_shares`, `fb_comments`, `fb_total`, `twitter`, `linkedin`, `fb_tw_and_li`, `nw_score`, `nw_max_score`
size |  | Number of articles to be returned (including related articles).

To retrieve a full list of the available fields for each filter (regions, categories, publishers), access:

### Available Regions and Categories
`GET /v1/region`

### Sample of publishers we support
`GET /v1/publisher`

### Available cities and local regions
`GET /v1/local`


## GET /v1/region

> Get the top trending English content published in the last 24 hours

``` shell
curl "https://api.newswhip.com/v1/region/World/All/24?key=YOUR_API_KEY"
```

``` php
<?php 
require 'vendor/autoload.php';
use GuzzleHttp\Client;

$client = new Client();
$response = $client->get('https://api.newswhip.com/v1/region/World/All/24?key=YOUR_API_KEY', []);
echo $response->getBody();
?> 
```

```json
{
    "articles": [
        {
            "link": "http://www.wired.com/2014/11/time-dilation/",
            "headline": "Time Travel is Real. Here Are The People and Spacecraft Who Have Done It | WIRED",
            "excerpt": "Carl De Torres To get ahead in life, spend some time on the International Space Station. Why? Well, according to the theory of relativity, astronauts on the ISS age more slowly due to the spacecraft’s high orbital speed. It’s called time dilation, and it means that when they return they’re a bit younger than they…",
            "source": {
                "publisher": "wired.com",
                "link": "http://wired.com",
				"country_code": "us"
            },
            "nw_score": 378.6359090122582,
            "max_nw_score": 378.6359090122582,
            "fb_data": {
                "comment_count": 0,
                "like_count": 0,
                "share_count": 25,
                "total_count_delta": 25,
                "delta_period": 30,
                "delta_period_unit": "m"
            },
            "tw_data": {
                "tw_count": 118,
                "total_count_delta": 117,
                "delta_period": 30,
                "delta_period_unit": "m"
            },
            "li_data": {
                "li_count": 1,
                "total_count_delta": 0,
                "delta_period": 30,
                "delta_period_unit": "m"
            },
            "tw_creator": "wired",
            "uuid": "1065a790-70b0-11e4-8e64-22000b210c3e",
            "publication_timestamp": 1416486221961,
            "image_link": "http://www.wired.com/wp-content/uploads/2014/11/through-time-ft.jpg",
            "relatedStories": [
                
            ],
            "topics": [
                {
                    "id": 25,
                    "name": "Tech"
                },
                {
                    "id": 26,
                    "name": "Science"
                }
            ]
        }
	]
}
```

`GET /v1/region/{region}/{category}/{time_period}`

This endpoint retrieves all articles published in `{region}` and `{category}` within the `{time_period}`.

### Parameters

Parameter | Description
--------- | -----------
region | Filters articles published in `{region}`. See above for available countries. i.e. `U.S.`, `France`, `Ireland`
category | Filters articles by `{category}`. See above for available categories. i.e. `All`, `News`, `Pre-Viral`
time_period | Filters articles published within the last `{time_period}` hours. Valid `time_periods` range from 1 up to 168 hours

## GET /v1/publisher

> Get the top trending content published in the last 24 hours by the New York Times.

``` shell
curl "https://api.newswhip.com/v1/publisher/nytimes.com/24?key=YOUR_API_KEY"
```

``` php
<?php 
require 'vendor/autoload.php';
use GuzzleHttp\Client;

$client = new Client();
$response = $client->get('https://api.newswhip.com/v1/publisher/nytimes.com/24?key=YOUR_API_KEY', []);
echo $response->getBody();
?> 
```

`GET /v1/publisher/{publisher}/{time_period}`

This endpoint retrieves all articles published by `{publisher}` within the `{time_period}`.

### Parameters

Parameter | Description
--------- | -----------
publisher | Any domain or subdomain. i.e. `nytimes.com`, `blog.newswhip.com`.
time_period | Filters articles published within the last `{time_period}` hours. Valid `time_periods` range from 1 up to 168 hours

## GET /v1/local

> Get the top trending content published in Seattle, in the last 12 hours.

``` shell
curl "https://api.newswhip.com/v1/local/Seattle, WA/All/12?key=YOUR_API_KEY"
```

``` php
<?php 
require 'vendor/autoload.php';
use GuzzleHttp\Client;

$client = new Client();
$response = $client->get('https://api.newswhip.com/v1/local/Seattle, WA/All/12?key=YOUR_API_KEY', []);
echo $response->getBody();
?> 
```

`GET /v1/local/{city}/All/{time_period}`

This endpoint retrieves all articles published in `{city}` within the `{time_period}`.

### Parameters

Parameter | Description
--------- | -----------
city | Any city or local region. See above for available local regions. i.e. `New York, NY`, `London`, `Toronto`, `Hamburg-Schleswig-Holstein`.
time_period | Filters articles published within the last `{time_period}` hours. Valid `time_periods` range from 1 up to 168 hours

## GET /v1/search

> Get the top trending content published talking about `Tom Cruise`, in the last 24 hours.

``` shell
curl "https://api.newswhip.com/v1/search?q=Tom%20Cruise?key=YOUR_API_KEY"
```

``` php
<?php 
require 'vendor/autoload.php';
use GuzzleHttp\Client;

$client = new Client();
$response = $client->get('https://api.newswhip.com/v1/search?q=Tom%20Cruise?key=YOUR_API_KEY', []);
echo $response->getBody();
?> 
```

`GET /v1/search?q={search_term}`

This endpoint retrieves all articles talking about `{search_term}` in the last 24 hours.

### Parameters

Parameter | Description
--------- | -----------
search_term | Matches all stories containing `{search_term}`.

# POST Requests

The POST API endpoints are designed for increased flexibility and are much more powerful. With these server-side only endpoints your application gets full access to NewsWhip's database, including all content published within the last 6 months from any publisher in any supported language. Filtered, sorted and aggregated by any field you want.

There are 2 different endpoints:

* `POST /v1/articles` - provides content by matching it against a set of filters
* `POST /v1/stats` - provides stats on the content matching the filters provided

## POST /v1/articles

> Get the top trending content published by the NYTimes.com that talk about Barack Obama since a week ago

``` shell
curl -H "Content-Type: application/json" -X POST -d '{
    "filters": [
        "nytimes.com AND \"Barack Obama\""
    ]
}' "https://api.newswhip.com/v1/articles?key=YOUR_API_KEY"
```

```php
<?php 
require 'vendor/autoload.php';
use GuzzleHttp\Client;

$client = new Client();
$response = $client->post('https://api.newswhip.com/v1/articles?key=YOUR_API_KEY', [
	'headers' => ['Content-Type' => 'application/json'],
	'body' => '{
		"filters": [
			"nytimes.com AND \"Barack Obama\""
		]
	}']);
echo $response->getBody();
?> 
```

```json
{
    "articles": [
        {
            "link": "http://www.nytimes.com/politics/first-draft/2014/11/18/today-in-politics-40/",
            "headline": "Today in Politics",
            "excerpt": "In the Senate, an overhaul of domestic spying operations is on the line.",
            "source": {
                "publisher": "nytimes.com",
                "link": "http://nytimes.com",
				"country_code": "us"
            },
            "nw_score": 0,
            "max_nw_score": 778.9965224360006,
            "fb_data": {
                "comment_count": 12,
                "like_count": 3,
                "share_count": 30,
                "total_count_delta": 0,
                "delta_period": 1170,
                "delta_period_unit": "m"
            },
            "tw_data": {
                "tw_count": 410,
                "total_count_delta": 0,
                "delta_period": 1170,
                "delta_period_unit": "m"
            },
            "li_data": {
                "li_count": 1,
                "total_count_delta": 0,
                "delta_period": 1170,
                "delta_period_unit": "m"
            },
            "tw_creator": "null",
            "uuid": "0a7a12d0-6f1b-11e4-a9b8-22000b210c3e",
            "publication_timestamp": 1416312265853,
            "image_link": "http://graphics8.nytimes.com/images/2014/11/18/us/politics/18firstdraft-snowden/18firstdraft-snowden-videoSixteenByNine600.jpg",
            "relatedStories": [],
            "topics": [
                {
                    "id": 20,
                    "name": "Politics"
                },
                {
                    "id": 2,
                    "name": "News"
                }
            ]
        }
    ]
}
```

`POST /v1/articles`

This endpoint retrieves all articles matching the filters provided.

### Parameters

* Stories are filtered and sorted using the following `JSON` encoded parameters. 
* Required fields are denoted *. 
* Filtering by category or country requires ids which can be found here: [NewsWhip API](http://www.newswhip.com/api#regions-covered)

Parameter | Default | Type | Description
--------- | ------- | ---- | -----------
filters* |  | Array[String] | List of [Lucene QueryString](https://lucene.apache.org/core/4_10_2/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#package_description) filters to be applied to the articles. See available fields for filtering below.
from | A week ago | Unix timestamp in milliseconds | Filters articles published after `{from}`.
to | Now | Unix timestamp in milliseconds | Filters articles published before `{to}`.
language | Any | Two letter ISO 639-1 language code |
sort_by | default | String | One of the following: `default`, `fb_likes`, `fb_shares`, `fb_comments`, `fb_total`, `twitter`, `linkedin`, `fb_tw_and_li`, `nw_score`, `nw_max_score`, `created_at`.
video_only | false | 
default_field | Relevant fields | String | Field to be used when filtering by keywords (like `"Barack Obama"`) and no fields are used in the Query String.
size |   | Integer | Max number of articles to be returned.
find_related | true | Boolean | Related stories will be collapsed when set.

### Available fields for filtering

Field | Type 
----- | ---- 
headline |  |
summary |  |
authors |  |
<del>country</del> | Number. Deprecated: use country_code instead |
country_code | Two letter ISO 3166 country code |
language | Two letter ISO 639-1 language code |
categories | Number |
publisher | 
href | 

<aside class="notice">Due to historical reasons, the queryable fields `headline` and `summary` differ in naming from their `Article` counterparts `link` and `excerpt`.</aside>

## POST /v1/stats

> Get the top English language publishers that create the best performing content on Facebook about `"3d printing"` since a week ago

``` curl
curl -H "Content-Type: application/json" -X POST -d '{
    "filters": [
        "3d printing"
    ],
	"language" : "en",
	"sort_by" : "fb_total.sum",
	"aggregate_by" : "domain"
}' "https://api.newswhip.com/v1/stats?key=YOUR_API_KEY"
```

```php
<?php 
require 'vendor/autoload.php';
use GuzzleHttp\Client;

$client = new Client();
$response = $client->post('https://api.newswhip.com/v1/stats?key=YOUR_API_KEY', [
	'headers' => ['Content-Type' => 'application/json'],
	'body' => '{
		"filters": [
			"3d printing"
		],
		"language" : "en",
		"sort_by" : "fb_total.sum",
		"aggregate_by" : "domain"
	}']);
echo $response->getBody();
?> 
```

```json
[
    {
        "key": "news.discovery.com",
        "stats": {
            "fb_total": {
                "count": 3,
                "min": 20.0,
                "max": 19625.0,
                "avg": 6558.333333333333,
                "sum": 19675.0,
                "sum_of_squares": 3.85141925E8,
                "variance": 8.536890555555557E7,
                "std_deviation": 9239.529509426093
            },
            "twitter": {
                "count": 3,
                "min": 17.0,
                "max": 128.0,
                "avg": 69.0,
                "sum": 207.0,
                "sum_of_squares": 20517.0,
                "variance": 2078.0,
                "std_deviation": 45.58508528016593
            },
            "linkedin": {
                "count": 3,
                "min": 0.0,
                "max": 11.0,
                "avg": 7.333333333333333,
                "sum": 22.0,
                "sum_of_squares": 242.0,
                "variance": 26.888888888888886,
                "std_deviation": 5.185449728701348
            },
            "fb_shares": {
                "count": 3,
                "min": 15.0,
                "max": 1416.0,
                "avg": 482.6666666666667,
                "sum": 1448.0,
                "sum_of_squares": 2005570.0,
                "variance": 435556.2222222222,
                "std_deviation": 659.9668341835234
            },
            "fb_comments": {
                "count": 3,
                "min": 0.0,
                "max": 1164.0,
                "avg": 388.6666666666667,
                "sum": 1166.0,
                "sum_of_squares": 1354900.0,
                "variance": 300571.55555555556,
                "std_deviation": 548.2440656820241
            },
            "fb_likes": {
                "count": 3,
                "min": 3.0,
                "max": 17045.0,
                "avg": 5687.0,
                "sum": 17061.0,
                "sum_of_squares": 2.90532203E8,
                "variance": 6.4502098666666664E7,
                "std_deviation": 8031.319858321337
            },
            "pinterest": {
                "count": 3,
                "min": 0.0,
                "max": 1.0,
                "avg": 0.6666666666666666,
                "sum": 2.0,
                "sum_of_squares": 2.0,
                "variance": 0.22222222222222224,
                "std_deviation": 0.4714045207910317
            }
        },
        "total": 19904.0
    }
]
```

`POST /v1/stats`

This endpoint retrieves stats for articles matching your filters.

### Parameters

Stories are filtered and sorted using the following JSON encoded parameters. 
Required fields are denoted *. Filtering by category or country requires ids which can be found here: [NewsWhip API](http://www.newswhip.com/api#regions-covered)

Parameter | Default | Type | Description
--------- | ------- | ---- | -----------
filters* |  | Array[String] | List of Lucene QueryString filters to be applied to the articles. See available fields for filtering above.
from | A week ago | Unix timestamp in milliseconds | Filters articles published after {from}.
to | Now | Unix timestamp in milliseconds | Filters articles published before {to}.
language | Any | Two letter ISO 639-1 language code |
sort_by* |  | String.{aggregation_name}.{stat_value} | `{aggregation_name}` is one of `fb_likes`, `fb_shares`, `fb_comments`, `fb_total`, `twitter`, `linkedin`, `pinterest` and `{stat_value}` is one of `count`, `min`, `max`, `avg`, `sum`, `sum_of_squares`, `variance`, `std_dev`.
aggregate_by* |  | String | Groups all matched stories by any of the following: `publisher`, `domains`, `domain`, `language`, `authors`, `country`, `categories`
video_only | false | 
default_field | Relevant fields | String | Field to be used when filtering by keywords (like `"Barack Obama"`) and no fields are used in the Query String.
size |   | Integer | Max number of aggregations to be returned.

# Entities

## Article

Field | Description
--------- | -----------
link | 
headline |  
excerpt |  summary for the story
source.publisher |  domain of source publication
source.link |  website of source publication
<del>source.country</del> |  deprecated
source.country_code | country of source publication
nw_score | NewsWhip's current social speed for the story
fb_data | An object describing total and recent Facebook interactions
tw_data | An object describing total and recent Twitter interactions
li_data | An object describing total and recent LinkedIn interactions
tw_creator |  Nullable. Where available, the creator's Twitter handle as supplied through Twitter Cards
uuid |  NewsWhip's unique story identifier
publication_timestamp |  Timestamp representing when the article was published
image_link |  Where available, link to the source's featured image
relatedStories |  List of `Article` related to this story
topics | List of `Topic`

## Topic

Field | Description
--------- | -----------
id |  NewsWhip's unique id for this Topic
name |  English name for this topic


