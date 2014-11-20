---
title: API Reference | NewsWhip

language_tabs:
  - curl

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Overview

Welcome to the NewsWhip API documentation. The NewsWhip API provides access to real time data trends, aggregate data, statistics, and social numbers for all content we track.

The NewsWhip's API is language agnostic. Any HTTP client or library can be used with this API.

This documentation is open source. Feel free to send us a pull request if you've found any errors or would like to improve this document: [GitHub](http://github.com/NewsWhip/slate).

# Authentication

All NewsWhip API endpoints require an API key. Your API key should be passed with each `GET` or `POST` request as a Query String.

`GET /v1/region/U.S./Politics/24?key=YOUR_API_KEY`

`POST /v1/articles?key=YOUR_API_KEY`

To request an API key [send us an email at api@newswhip.com](mailto:api@newswhip.com). Our API plans are custom tailored to fit your business, your application and your budget. 

<aside class="warning">Your API key should be treated as a password. It should be kept secret at all times.</aside>

# Rate Limits

Each API key is limited by default to a 100 API requests per 5 minutes. Once you exceed this limit, calls will return: 

Error Code | Meaning
---------- | -------
429 | Too Many Requests -- You're requesting too many kittens! Slow down!

<aside class="notice">Contact us at api@newswhip.com if your application requires higher limits.</aside>

# API Endpoints

NewsWhip provides 2 different endpoints designed for different use cases, each, available at different commercial rates.

* `GET` requests: best suited for finding real-time trending articles in any niche and social network, with or without video and published in any country up to a week ago.
* `POST` requests: best suited for very precise article filtering, real-time analytics, aggregations and reporting. These APIs slice and dice our data in any form you want.

### HTTPS Endpoint
`https://api.newswhip.com/`

# GET Requests

The real-time GET API endpoints are designed to mirror Spike's functionality. You can get all trending content in any niche or Region, ordered by any social metric.

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

### All available Regions and Categories
`GET /v1/region`

### Sample of publishers we support
`GET /v1/publisher`

### All cities and local regions we currently support
`GET /v1/local`


## GET Content by Region

> Get the top trending English content published in the last 24 hours

``` curl
curl "https://api.newswhip.com/v1/region/World/All/24"
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
                "country": "U.S."
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
region | Filters articles published in that {region}. See above for available countries. i.e. `U.S.`, `France`, `Ireland`
category | Filters articles by `{category}`. See above for available categories. i.e. `All`, `News`, `Pre-Viral`
time_period | Filters articles published within the last `{time_period}` hours. Valid time_periods range from 1 to 168 hours

## GET Content by Publisher

> Get the top trending content published in the last 24 hours by the New York Times.

``` curl
curl "https://api.newswhip.com/v1/publisher/nytimes.com/24"
```

`GET /v1/publisher/{publisher}/{time_period}`

This endpoint retrieves all articles published by `{publisher}` within the `{time_period}`.

### Parameters

Parameter | Description
--------- | -----------
publisher | Any domain or subdomain. i.e. `nytimes.com`, `blog.newswhip.com`.
time_period | Filters articles published within the last `{time_period}` hours. Valid time_periods range from 1 to 168 hours

## GET Content by Local Region

> Get the top trending content published in Seattle, in the last 12 hours.

``` curl
curl "https://api.newswhip.com/v1/publisher/nytimes.com/12"
```

`GET /v1/local/{city}/All/{time_period}`

This endpoint retrieves all articles published in `{city}` within the `{time_period}`.

## GET Search

> Get the top trending content published talking about `Tom Cruise`, in the last 24 hours.

```curl
curl "https://api.newswhip.com/v1/search?q=Tom%20Cruise"
```

`GET /v1/search?q={search_term}`

This endpoint retrieves all articles talking about `{search_term}`.

### Parameters

Parameter | Description
--------- | -----------
search_term | Matches all stories containing `{search_term}`.

# POST Requests

The POST API endpoints are designed for much more flexibility and are much more powerful. With these server-side only endpoints your application gets full access to NewsWhip's database, including all content published within the last 6 months from any publisher and any supported language. Filtered, sorted and aggregated by any field you want.

There are 2 different endpoints:

* `POST /v1/articles` - provides the content that match all your filters
* `POST /v1/stats` - provides stats on the stories that match your filters

## POST /v1/articles

> Get the top trending content published by the NYTimes.com that talk about Barack Obama since a week ago

```curl
curl -H "Content-Type: application/json" -X POST -d '{
    "filters": [
        "nytimes.com AND \"Barack Obama\""
    ]
}' "https://api.newswhip.com/v1/articles"
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
                "country": "U.S."
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

`GET /v1/articles`

This endpoint retrieves all articles matching your filters.

### Parameters

Stories are filtered and sorted using the following JSON encoded parameters. 
Required fields are denoted *. Filtering by category or country requires ids which can be found at the end of this document: // TODO

Parameter | Default | Type | Description
--------- | ------- | ---- | -----------
filters* | false | Array[String] | List of Lucene QueryString filters to be applied to the articles' content. See available fields for filtering below.
from | A week ago | Unix timestamp in milliseconds | Filters articles published after {from}.
to | Now | Unix timestamp in milliseconds | Filters articles published before {to}.
sort_by | default | String | One of the following: `default`, `fb_likes`, `fb_shares`, `fb_comments`, `fb_total`, `twitter`, `linkedin`, `fb_tw_and_li`, `nw_score`, `nw_max_score`.
video_only | false | 
default_field | Relevant fields only | String | Field to use by default when searching filtering by keywords like "Barack Obama" and no field is specified.
size |   | Integer | Max number of articles to be returned.
find_related | true | Boolean | Related stories will be collapsed when set.

### Available fields for filtering

Field | Type 
----- | ---- 
headline |  |
summary |  |
authors |  |
country | Number |
language | Two letter ISO 639-1 language code |
categories | Number |
publisher | 
href | 

## POST /v1/stats

> Get the top trending content published talking about `Tom Cruise`, in the last 24 hours.

``` curl
curl "https://api.newswhip.com/v1/search?q=Tom%20Cruise"
```

`GET /v1/search?q={search_term}`

This endpoint retrieves all articles talking about `{search_term}`.

# Entities

## Article

Field | Description
--------- | -----------
link | 
headline |  
excerpt |  summary for the story
source.publisher |  domain of source publication
source.link |  website of source publication
source.country |  country of source publication
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