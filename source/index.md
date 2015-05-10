---
title: Dirble API v.2

language_tabs:
  - shell

toc_footers:
  - <a href='https://dirble.com/users/apikeys'>Sign Up for a Developer Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcoem to Dirble API. This is a api for getting radio stations based on categories (read genres) and countries. You can also search, get similar stations and get played songs.

# Base url

All calls will go to http://api.dirble.com/v2/

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "http://api.dirble.com/v2/stations?token={your token}"
```

> Make sure to replace `{your token}` with your API token.

Dirble uses API keys to allow access to the API. You can register a new Dirble API token at our [developer portal](https://dirble.com/users/apikeys).

Kittn expects for the API key to be included in all API requests to the server in a param that looks like the following:

`?token={your token}`

<aside class="notice">
You must replace <code>{your token}</code> with your personal API key.
</aside>

# Stations

## Get All Stations

```shell
curl "http://api.dirble.com/v2/stations?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 10,
    "name": "Sr P3",
    "description": "",
    "country": "SE",
    "accepted": 1,
    "added": "2012-01-15T05:55:12.000+01:00",
    "website": "",
    "currentsong_reverse": null,
    "image": {
      "url": null,
      "thumb": {
        "url": null
      }
    },
    "created_at": "2012-01-15T05:55:12.000+01:00",
    "updated_at": "2015-04-11T14:10:45.000+02:00",
    "slug": "sr-p3",
    "disableSongChecks": false
  },
  {
    "id": 11,
    "name": "Digitally Imported Hardcore",
    "description": "",
    "country": "US",
    "accepted": 1,
    "added": "2012-01-15T05:56:48.000+01:00",
    "website": "",
    "currentsong_reverse": null,
    "image": {
      "url": null,
      "thumb": {
        "url": null
      }
    },
    "created_at": "2012-01-15T05:56:48.000+01:00",
    "updated_at": "2015-04-11T14:10:45.000+02:00",
    "slug": "digitally-imported-hardcore",
    "disableSongChecks": false
  }
  ...
]
```

This endpoint retrieves all stations.

### HTTP Request

`GET http://api.dirble.com/v2/stations`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 0 | show which per_page stations to show
per\_page | 20 | How many stations per page to show
offset | 5 |

## Get a Specific Station

```shell
curl "http://api.dirble.com/v2/station/10?token={your token}"
```

> The above command returns JSON structured like this:

```json
{
  "id": 10,
  "name": "Sr P3",
  "accepted": 1,
  "added": "2012-01-15T05:55:12.000+01:00",
  "country": "SE",
  "description": "",
  "image": {
    "image": {
      "url": null,
      "thumb": {
        "url": null
      }
    }
  },
  "slug": "sr-p3",
  "website": "",
  "streams": [
    {
      "id": 3,
      "stream": "http://http-live.sr.se/p3-mp3-192",
      "bitrate": 0,
      "content_type": "?",
      "status": 1,
      "Station_id": 10,
      "created_at": "2015-04-11T14:20:24.000+02:00",
      "updated_at": "2015-04-25T22:46:30.000+02:00",
      "timedout": true,
      "emptycounter": 3
    }
  ],
  "categories": [
    {
      "id": 17,
      "title": "Top 40",
      "description": "",
      "urlid": null,
      "created_at": "2015-04-11T13:49:53.000+02:00",
      "updated_at": "2015-04-11T13:49:53.000+02:00",
      "slug": "top-40",
      "ancestry": "5",
      "position": null
    }
  ],
  "station_songs": [
    {
      "id": "553bf51b7370612594513400",
      "name": "Musikguiden i P3",
      "title": "Tiger Bell - Gorilla Dance",
      "week": 17,
      "year": 2015,
      "station_id": 10,
      "info": null,
      "date": "2015-04-25T22:12:11+02:00"
    },
    {
      "id": "553bd9ae7370612594ed1900",
      "name": "Humorhimlen Lab",
      "title": "Circa Waves - T-Shirt Weather",
      "week": 17,
      "year": 2015,
      "station_id": 10,
      "info": null,
      "date": "2015-04-25T20:15:10+02:00"
    }
    ...
  ]
}
```

This endpoint retrieves a specific station.

<aside class="warning">In API v1 station had a streamurl and status variable. this is now inside the stream element in the streams array.</aside>

### HTTP Request

`GET http://api.dirble.com/v2/station/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the station to retrieve


## Get Similar Stations

```shell
curl "http://api.dirble.com/v2/station/10/similar?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 181,
    "name": "Sr P2",
    "description": "",
    "country": "SE",
    "accepted": 1,
    "added": "2012-03-28T21:28:20.000+02:00",
    "website": "http://www.sverigesradio.se",
    "currentsong_reverse": null,
    "image": {
      "url": "https://cdn.devality.com/station/181/original.png",
      "thumb": {
        "url": "https://cdn.devality.com/station/181/thumb_original.png"
      }
    },
    "created_at": "2012-03-28T21:28:20.000+02:00",
    "updated_at": "2015-04-11T14:11:00.000+02:00",
    "slug": "sr-p2",
    "disableSongChecks": false
  },
  {
    "id": 601,
    "name": "Nrk P3",
    "description": "",
    "country": "NO",
    "accepted": 1,
    "added": "2013-06-22T04:37:19.000+02:00",
    "website": "http://radio.nrk.no/direkte/p3",
    "currentsong_reverse": null,
    "image": {
      "url": null,
      "thumb": {
        "url": null
      }
    },
    "created_at": "2013-06-22T04:37:19.000+02:00",
    "updated_at": "2015-04-11T14:11:22.000+02:00",
    "slug": "nrk-p3",
    "disableSongChecks": false
  }
  ...
]
```

This endpoint retrieves similar stations.

### HTTP Request

`GET http://api.dirble.com/v2/station/<ID>/similar`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the station toi get similar stations from
