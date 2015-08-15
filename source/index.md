---
title: Dirble API v.2

language_tabs:
  - shell

toc_footers:
  - <a href='https://dirble.com/users/apikeys'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/dirble/api-doc'>Add, fix, contribute to this api-doc</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to Dirble API. This is a API for getting radio stations based on categories and countries. You can also search, get similar stations, and get previously played songs.

## Contribute
Have you made a framework or a wrapper on a specific programming language? [fork this repo](http://github.com/dirble/api-doc), add your code examples for your programming language and create a pull request.

If it is any issues in this doc, feel free to make a pull request.

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct param with each request
curl "http://api.dirble.com/v2/stations?token={your token}"
```

> Make sure to replace `{your token}` with your API token.

Dirble uses API keys to allow access to the API. You can register a new Dirble API token at our [developer portal](https://dirble.com/users/apikeys).

Dirble expects for the API key to be included in all API requests to the server in a param that looks like the following:

`?token={your token}`

<aside class="notice">
You must replace <code>{your token}</code> with your personal API key.
</aside>

# Pagination

Dirble API v.2 use a pagination to make it slow the pressure on the servers but also make it easier for you to not download heavy data every time.

Requests that have support for pagination have parameters like page, per-page and offset. You add this to the url like `?page=1&per_page=10` - this will show 10-20 of the data in the database.

For a real url with pagination, see here:
`http://api.dirble.com/v2/stations?page=1&per_page=10&token={your token}`

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
    "website": "",
    "image": {
      "url": null,
      "thumb": {
        "url": null
      }
    },
    "created_at": "2012-01-15T05:55:12.000+01:00",
    "updated_at": "2015-04-11T14:10:45.000+02:00",
    "slug": "sr-p3",
  },
  {
    "id": 11,
    "name": "Digitally Imported Hardcore",
    "description": "",
    "country": "US",
    "website": "",
    "image": {
      "url": null,
      "thumb": {
        "url": null
      }
    },
    "created_at": "2012-01-15T05:56:48.000+01:00",
    "updated_at": "2015-04-11T14:10:45.000+02:00",
    "slug": "digitally-imported-hardcore",
  },
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
offset | 0 |


## Get a Specific Station

```shell
curl "http://api.dirble.com/v2/station/10?token={your token}"
```

> The above command returns JSON structured like this:

```json
{
  "id": 10,
  "name": "Sr P3",
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
      "stream": "http://http-live.sr.se/p3-mp3-192",
      "bitrate": 0,
      "content_type": "?",
      "status": 1,
    }
  ],
  "categories": [
    {
      "id": 17,
      "title": "Top 40",
      "description": "",
      "slug": "top-40",
      "ancestry": "5",
    }
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
    "website": "http://www.sverigesradio.se",
    "image": {
      "url": "https://cdn.devality.com/station/181/original.png",
      "thumb": {
        "url": "https://cdn.devality.com/station/181/thumb_original.png"
      }
    },
    "created_at": "2012-03-28T21:28:20.000+02:00",
    "updated_at": "2015-04-11T14:11:00.000+02:00",
    "slug": "sr-p2",
  },
  {
    "id": 601,
    "name": "Nrk P3",
    "description": "",
    "country": "NO",
    "website": "http://radio.nrk.no/direkte/p3",
    "image": {
      "url": null,
      "thumb": {
        "url": null
      }
    },
    "created_at": "2013-06-22T04:37:19.000+02:00",
    "updated_at": "2015-04-11T14:11:22.000+02:00",
    "slug": "nrk-p3",
  },
  ...
]
```

This endpoint retrieves similar stations.

### HTTP Request

`GET http://api.dirble.com/v2/station/<ID>/similar`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the station to get similar stations from

## Get Songhistory for a Station

```shell
curl "http://api.dirble.com/v2/station/10/song_history?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": "553b14d16c6f634686af1700",
    "name": "P3 Musik",
    "title": "SOAK - Sea Creatures",
    "week": 17,
    "year": 2015,
    "station_id": 10,
    "info": null,
    "date": "2015-04-25T06:15:13+02:00"
  },
  {
    "id": "553b303c6c6f634686853600",
    "name": "Morgonpasset i P3",
    "title": "Axwell & Ingrosso - On My Way",
    "week": 17,
    "year": 2015,
    "station_id": 10,
    "info": null,
    "date": "2015-04-25T08:12:12+02:00"
  },
  ...
]
```

This endpoint retrieves song_history.

### HTTP Request

`GET http://api.dirble.com/v2/station/<ID>/song_history`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the station to get song_history from

# Categories

## Get All Categories

```shell
curl "http://api.dirble.com/v2/categories?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "title": "Trance",
    "description": "stations that plays commercial and other things in trance-music genre.",
    "slug": "trance",
    "ancestry": "14",
  },
  {
    "id": 2,
    "title": "Rock",
    "description": "simple rock. from elvis to metallica and like hardrock as iron maiden.",
    "slug": "rock",
    "ancestry": null,
  },
  {
    "id": 3,
    "title": "Dance",
    "description": "dance music, the new from 80's and 90's, like bubblegum and more.",
    "slug": "dance",
    "ancestry": "14",
  },
  ...
]
```

This endpoint retrieves all categories.

### HTTP Request

`GET http://api.dirble.com/v2/categories`

### Query Parameters

None parameters

## Get Primaries Categories

```shell
curl "http://api.dirble.com/v2/categories/primary?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 11,
    "title": "Classical",
    "description": "Classical music such as Mozart and Beethoven but also Greig and others.",
    "slug": "classical",
    "ancestry": null,
  },
  {
    "id": 49,
    "title": "Country",
    "description": "",
    "slug": "country",
    "ancestry": null,
  },
  {
    "id": 40,
    "title": "Decades",
    "description": "",
    "slug": "decades",
    "ancestry": null,
  },
  ...
]
```

This endpoint retrieves all primary categories.

### HTTP Request

`GET http://api.dirble.com/v2/categories/primary`

### Query Parameters

None parameters

## Get Child Categories

```shell
curl "http://api.dirble.com/v2/category/11/childs?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 24,
    "title": "Baroque",
    "description": "",
    "slug": "baroque",
    "ancestry": "11",
  },
  {
    "id": 26,
    "title": "Classical period music",
    "description": "",
    "slug": "classical-period-music",
    "ancestry": "11",
  }
]
```

This endpoint retrieves all child categories of specific primary category.

### HTTP Request

`GET http://api.dirble.com/v2/category/<ID>/childs`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
id | | (*Required*), id of primary category to show child categories of
page | 0 | show which per_page stations to show
per\_page | 20 | How many stations per page to show
offset | 0 |

## Get Categories as tree

```shell
curl "http://api.dirble.com/v2/categories/tree?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 11,
    "title": "Classical",
    "description": "Classical music such as Mozart and Beethoven but also Greig and others.",
    "urlid": null,
    "created_at": "2015-04-11T13:49:53.000+02:00",
    "updated_at": "2015-04-11T13:49:53.000+02:00",
    "slug": "classical",
    "ancestry": null,
    "position": null,
    "children": [
      {
        "id": 24,
        "title": "Baroque",
        "description": "",
        "urlid": null,
        "created_at": "2015-04-11T13:49:53.000+02:00",
        "updated_at": "2015-04-11T13:49:53.000+02:00",
        "slug": "baroque",
        "ancestry": "11",
        "position": null,
        "children": []
      },
      {
        "id": 26,
        "title": "Classical period music",
        "description": "",
        "urlid": null,
        "created_at": "2015-04-11T13:49:53.000+02:00",
        "updated_at": "2015-04-11T13:49:53.000+02:00",
        "slug": "classical-period-music",
        "ancestry": "11",
        "position": null,
        "children": []
      }
    ]
  },
  {
    "id": 49,
    "title": "Country",
    "description": "",
    "urlid": null,
    "created_at": "2015-04-11T13:49:53.000+02:00",
    "updated_at": "2015-04-11T13:49:53.000+02:00",
    "slug": "country",
    "ancestry": null,
    "position": null,
    "children": [
      {
        "id": 50,
        "title": "Bluegrass",
        "description": "",
        "urlid": null,
        "created_at": "2015-04-11T13:49:54.000+02:00",
        "updated_at": "2015-04-11T13:49:54.000+02:00",
        "slug": "bluegrass",
        "ancestry": "49",
        "position": null,
        "children": []
      },
      {
        "id": 51,
        "title": "Classic Country",
        "description": "",
        "urlid": null,
        "created_at": "2015-04-11T13:49:54.000+02:00",
        "updated_at": "2015-04-11T13:49:54.000+02:00",
        "slug": "classic-country",
        "ancestry": "49",
        "position": null,
        "children": []
      }
    ]
  },
  ...
]
```

This endpoint retrieves all categories structured as a tree.

### HTTP Request

`GET http://api.dirble.com/v2/categories/primary`

### Query Parameters

None parameters

## Get Category Stations

```shell
curl "http://api.dirble.com/v2/category/11/stations?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 12341,
    "name": "iradiophilly Symphony",
    "country": "US",
    "description": "",
    "image": {
      "image": {
        "url": "https://cdn.devality.com/station/12341/iradiophilly_logo_u_border.png",
        "thumb": {
          "url": "https://cdn.devality.com/station/12341/thumb_iradiophilly_logo_u_border.png"
        }
      }
    },
    "slug": "iradiophilly-symphony",
    "website": "http://www.iradiophilly.com/symphony",
    "created_at": "2015-03-16T04:01:25.000+01:00",
    "updated_at": "2015-04-12T03:23:47.000+02:00",
    "streams": [
      {
        "stream": "http://kmr.iad.streamguys1.com:80/symphony",
        "bitrate": 60,
        "content_type": "audio/mpeg",
        "status": 1,
      }
    ],
    "categories": [
      {
        "id": 11,
        "title": "Classical",
        "description": "Classical music such as Mozart and Beethoven but also Greig and others.",
        "slug": "classical",
        "ancestry": null
      },
      {
        "id": 26,
        "title": "Classical period music",
        "description": "",
        "slug": "classical-period-music",
        "ancestry": "11"
      }
    ]
  },
  {
    "id": 12314,
    "name": "Radio Munna",
    "country": "BD",
    "description": "",
    "image": {
      "image": {
        "url": null,
        "thumb": {
          "url": null
        }
      }
    },
    "slug": "radio-munna",
    "website": "http://radiomunna.com",
    "created_at": "2015-03-14T20:51:45.000+01:00",
    "updated_at": "2015-04-11T14:19:55.000+02:00",
    "streams": [
      {
        "stream": "http://77.92.64.44:8398/stream",
        "bitrate": 64,
        "content_type": "audio/mpeg",
        "status": 1,
      }
    ],
    "categories": [
      {
        "id": 18,
        "title": "Classic Rock",
        "description": "",
        "slug": "classic-rock",
        "ancestry": "2",
        "position": null
      },
      {
        "id": 48,
        "title": "Folk Rock",
        "description": "",
        "slug": "folk-rock",
        "ancestry": "46",
        "position": null
      },
      {
        "id": 46,
        "title": "Folk",
        "description": "",
        "slug": "folk",
        "ancestry": null,
        "position": null
      },
      {
        "id": 51,
        "title": "Classic Country",
        "description": "",
        "slug": "classic-country",
        "ancestry": "49",
      },
      {
        "id": 11,
        "title": "Classical",
        "description": "Classical music such as Mozart and Beethoven but also Greig and others.",
        "slug": "classical",
        "ancestry": null,
      },
      {
        "id": 49,
        "title": "Country",
        "description": "",
        "slug": "country",
        "ancestry": null,
      }
    ]
  },
  {
    "id": 11858,
    "name": "Classic  Jazz Paris  France",
    "country": "FR",
    "description": "",
    "image": {
      "image": {
        "url": null,
        "thumb": {
          "url": null
        }
      }
    },
    "slug": "classic-jazz-paris-france",
    "website": "",
    "created_at": "2015-01-02T17:54:04.000+01:00",
    "updated_at": "2015-04-11T14:19:35.000+02:00",
    "streams": [
      {
        "stream": "http://classicandjazz.ice.infomaniak.ch:80/classicandjazz-128.mp3",
        "bitrate": 128,
        "content_type": "audio/mpeg",
        "status": 1,
      }
    ],
    "categories": [
      {
        "id": 11,
        "title": "Classical",
        "description": "Classical music such as Mozart and Beethoven but also Greig and others.",
        "slug": "classical",
        "ancestry": null,
      },
      {
        "id": 12,
        "title": "Jazz",
        "description": "The classical music - Jazz.",
        "slug": "jazz",
        "ancestry": null,
      }
    ]
  },
  ...
]
```

This endpoint retrieves all stations of specific category.

<aside class="notice">
The category can be any category, both primary and child category.
</aside>

### HTTP Request

`GET http://api.dirble.com/v2/category/<ID>/stations`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
id | | (*Required*), id of category to get stations of
page | 0 | show which per_page stations to show
per\_page | 20 | How many stations per page to show
offset | 0 |

# Search

```shell
curl "http://api.dirble.com/v2/search/mental?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 8763,
    "name": "Hotmusic  Super 936",
    "country": "NL",
    "description": "",
    "image": {
      "image": {
        "url": null,
        "thumb": {
          "url": null
        }
      }
    },
    "slug": "hotmusic-super-936",
    "website": "http://www.super936.nl",
    "created_at": "2014-02-10T13:43:01.000+01:00",
    "updated_at": "2015-04-11T14:14:29.000+02:00",
    "streams": [
      {
        "stream": "http://95.97.83.199:8000",
        "bitrate": 192,
        "content_type": "audio/mpeg\r\n",
        "status": 1,
      }
    ],
    "categories": [
      {
        "id": 17,
        "title": "Top 40",
        "description": "",
        "slug": "top-40",
        "ancestry": "5",
      }
    ]
  },
  {
    "id": 12079,
    "name": "Radio GFM",
    "country": "DE",
    "description": "",
    "image": {
      "image": {
        "url": null,
        "thumb": {
          "url": null
        }
      }
    },
    "slug": "radio-gfm",
    "website": "http://www.radio-gfm.net/",
    "created_at": "2015-02-14T14:51:14.000+01:00",
    "updated_at": "2015-04-11T14:19:45.000+02:00",
    "streams": [
      {
        "stream": "http://streams.radio-gfm.net:8000/metal.mp3",
        "bitrate": 128,
        "content_type": "audio/mpeg",
        "status": 1,
      },
      {
        "stream": "http://streams.radio-gfm.net:8000/electro.mp3",
        "bitrate": 128,
        "content_type": "audio/mpeg",
        "status": 1,
      },
      {
        "stream": "http://streams.radio-gfm.net:8000/rockpop.mp3",
        "bitrate": 128,
        "content_type": "audio/mpeg",
        "status": 1,
      }
    ],
    "categories": [
      {
        "id": 2,
        "title": "Rock",
        "description": "simple rock. from elvis to metallica and like hardrock as iron maiden.",
        "slug": "rock",
        "ancestry": null,
      },
      {
        "id": 5,
        "title": "Pop",
        "description": "stations that normally play pop-music",
        "slug": "pop",
        "ancestry": null,
      },
      {
        "id": 14,
        "title": "Electronic",
        "description": "all computeriz made.",
        "slug": "electronic",
        "ancestry": null,
      }
    ]
  },
  {
    "id": 7909,
    "name": "Gotradio  Reggae",
    "country": "US",
    "description": "",
    "image": {
      "image": {
        "url": null,
        "thumb": {
          "url": null
        }
      }
    },
    "slug": "gotradio-reggae",
    "website": "http://www.gotradio.com",
    "created_at": "2014-01-23T12:38:04.000+01:00",
    "updated_at": "2015-04-11T14:13:45.000+02:00",
    "streams": [
      {
        "stream": "http://173.244.215.163:8470",
        "bitrate": 128,
        "content_type": "audio/mpeg\r\n",
        "status": 1,
      }
    ],
    "categories": [
      {
        "id": 9,
        "title": "Reggae",
        "description": "Who don't know Bob Marley?",
        "slug": "reggae",
        "ancestry": null,
      }
    ]
  }
  ...
]
```

This endpoint retrieves all stations of specific category.

### HTTP Request

`GET http://api.dirble.com/v2/search/<query>`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
query | | (*Required*), the search query to search on
page | 0 | show which 10 stations to show

# Countries

## Get All Countries

```shell
curl "http://api.dirble.com/v2/countries?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "country_code": "DZ",
    "Continent_id": 3,
  },
  {
    "country_code": "AO",
    "Continent_id": 3,
  },
  {
    "country_code": "BJ",
    "Continent_id": 3,
  },
  ...
]
```

This endpoint retrieves all countries.

### HTTP Request

`GET http://api.dirble.com/v2/countries`

### Query Parameters

None parameters

## Get All Continents

```shell
curl "http://api.dirble.com/v2/continents?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Europe",
    "slug": "europe",
  },
  {
    "id": 2,
    "name": "Asia",
    "slug": "asia",
  },
  {
    "id": 3,
    "name": "Africa",
    "slug": "africa",
  },
  {
    "id": 4,
    "name": "North America",
    "slug": "north-america",
  },
  {
    "id": 5,
    "name": "Oceania",
    "slug": "oceania",
  },
  {
    "id": 6,
    "name": "South Amerika",
    "slug": "south-amerika",
  }
]
```

This endpoint retrieves all continents.

### HTTP Request

`GET http://api.dirble.com/v2/continents`

### Query Parameters

None parameters

## Get Countries in Continents

```shell
curl "http://api.dirble.com/v2/continents/1/countries?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "country_code": "AL",
    "Continent_id": 1,
  },
  {
    "country_code": "AD",
    "Continent_id": 1,
  },
  {
    "country_code": "AM",
    "Continent_id": 1,
  },
  {
    "country_code": "AT",
    "Continent_id": 1,
  },
  {
    "country_code": "BY",
    "Continent_id": 1,
  },
  ...
]
```

This endpoint retrieves all continents.

### HTTP Request

`GET http://api.dirble.com/v2/continents/<continent>/countries`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
continent | | (*Required*), the continent id to get countries from
page | 0 | show which per_page stations to show
per\_page | 20 | How many stations per page to show
offset | 0 |

## Get Station from Country

```shell
curl "http://api.dirble.com/v2/countries/SE/stations?token={your token}"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 15,
    "name": "Neradio House  Trance",
    "accepted": 1,
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
    "slug": "neradio-house-trance",
    "website": "",
    "created_at": "2012-01-15T07:49:54.000+01:00",
    "updated_at": "2015-04-11T14:10:45.000+02:00",
    "streams": [
      {
        "stream": "http://fire1.neradio.com",
        "bitrate": 128,
        "content_type": "audio/mpeg\r\n",
        "status": 1,
      },
      {
        "stream": "http://fire2.neradio.com",
        "bitrate": 128,
        "content_type": "audio/mpeg\r\n",
        "status": 1,
      }
    ],
    "categories": [
      {
        "id": 1,
        "title": "Trance",
        "description": "stations that plays commercial and other things in trance-music genre.",
        "slug": "trance",
        "ancestry": "14",
      }
    ]
  },
  {
    "id": 25,
    "name": "Nrj Sweden",
    "accepted": 1,
    "country": "SE",
    "description": "",
    "image": {
      "image": {
        "url": "https://cdn.devality.com/station/25/original.png",
        "thumb": {
          "url": "https://cdn.devality.com/station/25/thumb_original.png"
        }
      }
    },
    "slug": "nrj-sweden",
    "website": "http://www.radioplay.se/nrj",
    "created_at": "2012-01-15T08:37:21.000+01:00",
    "updated_at": "2015-04-11T14:10:47.000+02:00",
    "streams": [
      {
        "stream": "http://194.16.21.227/nrj_se_mp3",
        "bitrate": 128,
        "content_type": "audio/mpeg",
        "status": 1,
      }
    ],
    "categories": [
      {
        "id": 3,
        "title": "Dance",
        "description": "dance music, the new from 80's and 90's, like bubblegum and more.",
        "slug": "dance",
        "ancestry": "14",
      },
      {
        "id": 6,
        "title": "Harddance",
        "description": "harddance as hardstyle, hardcore, gabber, speedcore, terrorcore, happy hardcore etc etc",
        "slug": "harddance",
        "ancestry": "14",
      },
      {
        "id": 23,
        "title": "House",
        "description": "",
        "slug": "house",
        "ancestry": "14",
      }
    ]
  },
  ...
]
```

This endpoint retrieves all stations from specified country.

### HTTP Request

`GET http://api.dirble.com/v2/countries/<code>/stations`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
code | | (*Required*), the country code for the country to get stations from
page | 0 | show which per_page stations to show
per\_page | 20 | How many stations per page to show
offset | 0 |
