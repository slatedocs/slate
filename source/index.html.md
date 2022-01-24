---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.castupload.com'>&larr; back to Castupload</a>

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Kittn API
---

# Authentication

> To authorize, use this code:

```shell
curl "api_endpoint_here" \
  -H "Authorization: Token token=API_KEY"
```

Castupload uses API keys to allow access to the API. You can request an API key with [our support](http://www.castupload.com/contact/new).

Castupload expects the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Token token=API_KEY`

<aside class="notice">
You must replace <code>API_KEY</code> with your personal API key.
</aside>

# Cross origin resource sharing

The API supports Cross Origin Resource Sharing (CORS) for AJAX requests from any origin.

Here's a sample request sent from a browser hitting [https://www.example.com/](https://www.example.com/):

```
$ curl -I https://www.castupload.com/api/v1/actor_profiles -H "Origin: https://www.example.com"
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET
```

# Rate limits

Rate limits are enforced on a per IP address basis. Currently we allow up to 300 requests within a 5 minute period. If this quota is exceeded your IP will be throttled for the remainder of this period. In this case the API will return an error responses that shows up as status code `429`.

Along with the status code the following `RateLimit` response header fields will be returned:

```
Ratelimit-Limit: 300
Ratelimit-Remaining: 0
Ratelimit-Reset: 1597048500
```

* `Ratelimit-Limit`: the request-quota associated to your client (defaults to 300)
* `Ratelimit-Reset`: the timestamp when the quota resets

# Actor profiles

## Get all actor profiles

```shell
curl "https://www.castupload.com/api/v1/actor_profiles" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "John Doe",
    "gender": "m"
  },
  {
    "id": 2,
    "name": "Jane Doe",
    "gender": "f"
  }
]
```

This endpoint retrieves all actor profiles available with the access rights of the API key. Most of the time it is scoped to a talent agency.

### Pagination

This API endpoint is paginated, following the proposed [RFC-8288](https://tools.ietf.org/html/rfc8288) standard for Web linking.

The pagination information is included in response HTTP headers, namely `Total` (total entries), `Per-Page` (entries per page) and `Link` (containing links to corresponding pages). The current page can be set using the `page`-parameter.

### HTTP Request

`GET https://www.castupload.com/api/v1/actor_profiles`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Page to display - see "Pagination" above 
include_picture | false | If set to true, the result will include the profile picture thumbnail in a field named `main_picture_url_tile`.
picture_version | null | Can be set to `original`, `large` or `thumb` to change the included picture version. The picture will be included in a field named `picture_url`. _(Only applies if `include_picture` is true)_
fields | name,gender | Can be used to modify the fields included in the response. Possible values are: `age`, `gender`, `first_name`, `last_name`, `name`, `professions`.
order | id | Changes the order of returned results. Possible values are: `id`, `name`, `last_name`
gender | null | Allows filtering by gender. Possible values are: `m`, `f`, `i`.

### Response fields

Field | Type | Description
--------- | ------- | -----------
id | number | Unique ID of the actor profile
age | number |
gender | string | `f` for female, `m` for male, `i` for diverse
name | string | Full name (ie. first & last name) _name can be retrieved separately by using the fields parameter_
first_name | string |
last_name | string |
professions | array of strings | list of professions, eg. `["schauspieler", "synchronsprecher"]`
main_picture_url_tile | string | profile picture url (thumbnail version)
picture_url | string | profile picture url of specified version
castupload_url | string | url of the profile on castupload
castupload_professional_url | string | url of the profile on castupload professional (only available when connected)

## Get a specific actor profile

```shell
curl "https://www.castupload.com/api/v1/actor_profiles/123" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this:

```json
{
  "id": 162,
  "first_name": "John",
  "last_name": "Doe",
  "castupload_url": "https://www.castupload.com/actors/john-doe",
  "castupload_professional_url": "https://www.pro.castupload.com/profil/castupload/162",
  "acting_age_from": 35,
  "acting_age_to": 45,
  "year_of_birth": 1980,
  "age": 41,
  "height": 170,
  "weight": 60,
  "state_code": "DE-RP",
  "accommodation_options": [
    "Berlin",
    "Frankfurt",
    "Köln"
  ],
  "homepage_url": "www.example.com",
  "imdb_link": "https://www.imdb.com/name/nm0000001",
  "imdb_id": "nm0000001",
  "facebook_page": "Castupload",
  "twitter_handle": "Castupload",
  "instagram_username": "castupload",
  "filmmakers_url": null,
  "sv_url": null,
  "talent_agency_id": 1,
  "updated_at": "2021-06-22T16:14:11.519+02:00",
  "native_dialect": "rheinisch",
  "place_of_birth": "Darmstadt",
  "city": "Mainz",
  "gender": "m",
  "eye_color": "braun",
  "hair_color": "braun",
  "hair_length": "mittel",
  "ethnic_appearances": [
    "mitteleuropaisch"
  ],
  "figure": "normal",
  "pitch": "bariton",
  "nationalities": [
    "DE"
  ],
  "languages": {
    "deutsch": "muttersprachlich",
    "englisch": "fliessend"
  },
  "dialects": {
    "hessisch": "kann",
    "rheinisch": "kann"
  },
  "accents": {
    "osterreichisch": "kann"
  },
  "instruments": {
    "gitarre": "gut"
  },
  "sports": [
    "buhnenkampf"
  ],
  "dances": {
    "freestyle": "gut"
  },
  "professions": [
    "schauspieler"
  ],
  "singing": {
    "jazz": "grundkenntnisse"
  },
  "drivers_licenses": [
    "pkw-klasse-b-be"
  ],
  "licenses": [
    "fallschirmspringer-lizenz"
  ],
  "country": "DE",
  "state": "DE-RP",
  "pictures": [
    {
      "id": 140,
      "copyright": "Jane Doe",
      "created_at": "2021-06-21T16:18:41.087+02:00",
      "url": "https://static.castupload.com/production/b6ac24ef-7bbc-4486-bfc9-89fdce3a9fde.png",
      "versions": {
        "original": "https://static.castupload.com/production/b6ac24ef-7bbc-4486-bfc9-89fdce3a9fde.png",
        "large": "https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/b6ac24ef-7bbc-4486-bfc9-89fdce3a9fde.png/755095922e94f912e6691c63f7aef9887d069f13c5dc84b581bbabea6761f7d5/c_limit,f_jpg,h_1200,q_80,w_1200",
        "thumb": "https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/b6ac24ef-7bbc-4486-bfc9-89fdce3a9fde.png/8cbb163eb48e440b5e9715e0c551180817f76c7072fd205df3c320bae08548e8/c_crop,f_jpg,h_370,q_80,w_370,x_0,y_0/c_fill,g_North,h_190,w_190"
      },
      "orientation": "square",
      "dimensions": [
        370,
        370
      ],
      "crop_coordinates": {
        "x": 0,
        "y": 0,
        "w": 500,
        "h": 500
      },
      "main_picture": true,
      "year": 2021,
      "recorded_at": "2020-06-22T11:51:51.363+02:00"
    },
    {
      "id": 141,
      "copyright": "",
      "created_at": "2021-06-21T16:18:47.460+02:00",
      "url": "https://static.castupload.com/production/5c5a1832-3ee4-495d-bfb0-03694dab0bd2.png",
      "versions": {
        "original": "https://static.castupload.com/production/5c5a1832-3ee4-495d-bfb0-03694dab0bd2.png",
        "large": "https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/5c5a1832-3ee4-495d-bfb0-03694dab0bd2.png/c323525480481e940c6b95eced100afa1b3c23ef2af4431df592b0e492de2211/c_limit,f_jpg,h_1200,q_80,w_1200",
        "thumb": "https://d205pfv3qf1itp.cloudfront.net/s3/castupload-com/production/5c5a1832-3ee4-495d-bfb0-03694dab0bd2.png/e63279986f8a8b40f0d1a99bb14c69918a749a34750248578a95ee17fdc58da7/c_fill,f_jpg,g_North,h_190,q_80,w_190"
      },
      "orientation": "landscape",
      "dimensions": [
        365,
        360
      ],
      "main_picture": false,
      "year": 2021,
      "recorded_at": null
    }
  ],
  "external_showreel": "https://www.youtube.com/watch?v=xxxx",
  "external_showreels": [
    "https://www.youtube.com/watch?v=xxxx",
    "https://vimeo.com/xxxx"
  ],
  "showreels": [
    {
      "name": "Showreel 2021",
      "url": "https://www.castupload.com/actors/john-doe/showreels/15",
      "type": "video"
    },
    {
      "name": "Showreel 2020",
      "url": "https://www.castupload.com/actors/john-doe/showreels/16",
      "type": "video"
    },
    {
      "name":"Audioreel 2021",
      "url":"https://www.castupload.com/actors/john-doe/showreels/17",
      "type":"audio"
    }
  ],
  "vita": {
    "primary_education": [
      {
        "name": "ABC School",
        "year_from": 2012
      }
    ],
    "award": [
      {
        "info": "",
        "name": "Avanca Film Festival - Best Performance",
        "year_from": 2017,
        "year_to": 2017,
        "award_nominated": true
      }
    ],
    "education": [
      {
        "info": "",
        "name": "123 School",
        "year_from": 2013,
        "year_to": 2014
      }
    ],
    "film": [
      {
        "info": "",
        "name": "Schneeflöckchen",
        "year_from": 2019,
        "year_to": 2020,
        "role": "Jack",
        "role_type": "supporting",
        "distributor": "",
        "director": "Adolfo Kolmerer",
        "producer": "",
        "caster": ""
      },
      {
        "info": "",
        "name": "The Harmonica ",
        "year_from": 2018,
        "year_to": 2018,
        "role": "Felix",
        "role_type": "leading",
        "distributor": "",
        "director": "",
        "producer": "Deutsche Film- und Fernsehakademie Berlin",
        "caster": ""
      }
    ],
    "television": [
      {
        "info": "",
        "name": "Mord mit Aussicht",
        "year_from": 2015,
        "year_to": 2016,
        "role": "Robert",
        "role_type": "misc",
        "distributor": "",
        "director": "",
        "producer": "",
        "caster": ""
      }
    ],
    "theatre": [],
    "audio": [],
    "other": [],
    "internet": [],
    "commercial": []
  }
}
```

This endpoint retrieves a specific actor profile.

### HTTP Request

`GET https://www.castupload.com/api/v1/actor_profiles/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the actor profile to retrieve

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
enum | null | If set to `translate` attributes are translated if possible (eg. gender will be `male` or `männlich` instead of `m`). _Note that hash and array attributes (eg. dances / sports) will be joined to a comma-separated string when translating attributes._
locale | en | Translates attributes with closed lists, free text fields are only available in the entry language. Possible values are: `en`, `de`, `fr`, `it`, `es`, `pl`, `ro`, `ru`, `tr`. _This parameter only has an effect when `enum` is set to `translate`._

### Response fields

See example response to the right for an overview of included fields. Please note:

- It is not guaranteed that the exemplary JSON structure shown is complete. Additional fields may be added without notice.
- The field `external_showreel` is still supported but deprecated. It is recommended to use the array of `external_showreels` instead.


# Talent agencies

## Get talent agency data

```shell
curl "https://www.castupload.com/api/v1/talent_agencies/123" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Example agency",
  "homepage_url": "https://www.example.com",
  "imdb_link": "https://pro.imdb.com/company/co0000001",
  "imdb_id": "co0000001",
  "showreel_url": "https://www.example.com/showreel",
  "twitter_handle": "@example_agency",
  "public_email": "info@example.com",
  "picture_url": "https://static.castupload.com/example.png",
  "address": {
    "city": "Mainz",
    "country": "DE",
    "fax": null,
    "line1": "Wallstr. 11",
    "line2": "",
    "phone": "49613163691950",
    "zipcode": "55122"
  }
}
```

This endpoint retrieves a specific talent agency.

### HTTP Request

`GET https://www.castupload.com/api/v1/talent_agencies/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the talent agency to retrieve

### Response fields

See example response to the right for an overview of included fields.
