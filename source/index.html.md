---
title: API Reference

language_tabs: # must be one of https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers
  - shell

toc_footers:
  - <a href='https://www.filmmakers.eu'>&larr; back to Filmmakers</a>

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Kittn API
---

# Introduction

Filmmakers provides a RESTful JSON API with token-based authentication. You can request an API key with [our support](https://www.filmmakers.eu/contact/new). The permission scope of the API key varies depending on the use case, so when contacting us be sure to specify the desired use case (e.g. you plan on using Filmmakers data for a website).

# Authentication

Once you have been issued an API key you can use the following code to authorize requests:

```shell
curl "api_endpoint_here" \
  -H "Authorization: Token token=API_KEY"
```

Filmmakers expects the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Token token=API_KEY`

<aside class="notice">
You must replace <code>API_KEY</code> with your personal API key.
</aside>

# Cross origin resource sharing

The API supports Cross Origin Resource Sharing (CORS) for AJAX requests from any origin.

Here's a sample request sent from a browser hitting [https://www.example.com/](https://www.example.com/):

```
$ curl -I https://www.filmmakers.eu/api/v1/actor_profiles -H "Origin: https://www.example.com"
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET
```

# Rate limits

Rate limits are enforced on a per IP address basis. Currently Filmmakers allows up to 300 requests within a 5 minute period. If this quota is exceeded your IP will be throttled for the remainder of this period. In this case the API will return an error responses that shows up as status code `429`.

Along with the status code the following `RateLimit` response header fields will be returned:

```
Ratelimit-Limit: 300
Ratelimit-Remaining: 0
Ratelimit-Reset: 1597048500
```

* `Ratelimit-Limit`: the request-quota associated to your client (defaults to 300)
* `Ratelimit-Reset`: the timestamp when the quota resets

# Webhooks

A webhook is an endpoint on your server that receives requests from Filmmakers, notifying you about events for actor profiles such as a profile edit. This requires a new endpoint on your server such as <https://www.example.com/webhooks/filmmakers> which should be publicly accessible and allow unauthenticated POST requests. Note that HTTPS URLs are required for all webhook endpoints.

**Read the event data**

Filmmakers sends the event data in the request body. Each event is structured as an Event object with a type, timestamp, and related Filmmakers resource nested under data (currently only an actor profile id - see example on the right)

```json
{
  "type": "actor_profile.updated"
  "created": 1633887337,
  "data": {
    "id": 123
  }
}
```

There are currently two event types: `actor_profile.updated` and `actor_profile.deleted`. Note that update events are grouped if they occur within a reasonable timeframe, e.g. you might only receive 1 webhook if an actor profile is updated several times within a short timeframe.

**Return a 200 response**

Send a successful 200 response to Filmmakers as quickly as possible because the event is retried with an exponential back off if a response isn't sent within a reasonable time. This means that you should write any long-running processes as code that can run asynchronously outside the webhook endpoint.

**Verify requests are sent by Filmmakers**

```
X-Signature: t=1492774577, v1=5257a869e7ecebeda32affa62cdca3fa51cad7e77a0e56ff536d0ce8e108d8bd
```

All webhook events are signed by including a signature in each event's header. This allows you to verify that the events were sent by Filmmakers, not by a third party. The Api key is used as secret to sign webhook events. Signatures are generated using a hash-based message authentication code (HMAC) with SHA-256.

The `X-Signature` header included in each signed event contains a timestamp and one signature. The timestamp is prefixed by `t=`, and the signature is prefixed by a scheme. Schemes start with `v`, followed by an integer. Currently, the only signature scheme is `v1`.

You can verify the signature on your side as follows (see example on the right in Ruby):

```ruby
# Step 1: Extract the timestamp and signatures from the header
signature = request.headers["X-Signature"]
  .split(",")
  .map { |part| part.split("=") }
  .to_h
# (this returns a hash like { "t" => 1492774577, "v1" => "5257a86..." })

# Step 2: Prepare the signed_payload string
payload = request.body.read
signed_payload = "#{signature['t']}.#{payload}"

# Step 3: Determine the expected signature
expected_signature = OpenSSL::HMAC.hexdigest(
  OpenSSL::Digest.new("sha256"),
  "YOUR_FILMMAKERS_API_KEY",
  signed_payload
)

# Step 4: Compare the signatures
expected_signature == signature["v1"]
```

**⚠ Webhooks are not yet generally available. If you are interested in using them please contact our support**


# Changelog
- (2023-08-17) **ActorProfile#index**: Added possibility to filter by `updated_at`
- (2023-05-31) **ActorProfile#index**:
  - Also emit `picture_copyright` if `include_picture` is specified
  - Add query field `representative`
- (2023-04-26) **ActorProfile#show**: Add `filmmakers_url` and `filmmakers_cd_url` (formerly `castupload_url` and `castupload_professional_url`)
- (2022-12-06) **ActorProfile#show**: Add `unions`
- (2022-09-09) **ActorProfile#index**: Add `updated_at` as selectable field
- (2022-01-26) **ActorProfile#show**: Add `pitches`, `figures`, `native_dialects`, `sport_skills`, `special_skills`
- (2022-01-12) **ActorProfile#show**: Add new fields `station` / `theatre` / `writer` to Vita

# Actor profiles

## Get all actor profiles

```shell
curl "https://www.filmmakers.eu/api/v1/actor_profiles" \
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

`GET https://www.filmmakers.eu/api/v1/actor_profiles`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Page to display - see "Pagination" above
include_picture | false | If set to true, the result will include the profile picture thumbnail in a field named `main_picture_url_tile`.
picture_version | null | Can be set to `original`, `large` or `thumb` to change the included picture version. The picture will be included in a field named `picture_url`. _(Only applies if `include_picture` is true)_
fields | name,gender | Can be used to modify the fields included in the response. Possible values are: `age`, `gender`, `first_name`, `last_name`, `name`, `professions`, `languages`, `representative`, `updated_at`.
order | id | Changes the order of returned results. Possible values are: `id`, `name`, `last_name`
gender | null | Allows filtering by gender. Possible values are: `m`, `f`, `i`.
updated_at[gte] | null | Allows filtering for profiles updated since the passed timestamp. Passed as an integer Unix timestamp.

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
languages | JSON Object | format `{ "language": "skill level" }`
updated_at | string | format ISO 8601
main_picture_url_tile | string | profile picture url (thumbnail version)
picture_url | string | profile picture url of specified version
picture_copyright | string | copyright information for the profile picture
representative | JSON Object | "id" and "name" of the agent representing the actor

## Get a specific actor profile

```shell
curl "https://www.filmmakers.eu/api/v1/actor_profiles/123" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this:

```json
{
  "id": 162,
  "first_name": "John",
  "last_name": "Doe",
  "filmmakers_url": "https://www.filmmakers.eu/actors/john-doe",
  "filmmakers_cd_url": "https://cd.filmmakers.eu/profil/castupload/162",
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
  "facebook_page": "Filmmakers",
  "twitter_handle": "Filmmakers",
  "instagram_username": "Filmmakers",
  "filmmakers_url": null,
  "sv_url": null,
  "wikipedia_url": "https://de.wikipedia.org/wiki/My_Page",
  "agency_profile_url": "https://www.my-agency/my-profile",
  "talent_agency_id": 1,
  "representative": {
    "id": 123,
    "name": "Jane Roe"
  },
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
  "special_skills": {
    "403": "gut"
  },
  "unions": [
    "bffs"
  ],
  "pictures": [
    {
      "id": 140,
      "copyright": "Jane Doe",
      "created_at": "2021-06-21T16:18:41.087+02:00",
      "url": "https://static.filmmakers.eu/production/b6ac24ef-7bbc-4486-bfc9-89fdce3a9fde.png",
      "versions": {
        "original": "https://static.filmmakers.eu/production/b6ac24ef-7bbc-4486-bfc9-89fdce3a9fde.png",
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
      "url": "https://static.filmmakers.eu/production/5c5a1832-3ee4-495d-bfb0-03694dab0bd2.png",
      "versions": {
        "original": "https://static.filmmakers.eu/production/5c5a1832-3ee4-495d-bfb0-03694dab0bd2.png",
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
      "url": "https://www.filmmakers.eu/actors/john-doe/showreels/15",
      "type": "video"
    },
    {
      "name": "Showreel 2020",
      "url": "https://www.filmmakers.eu/actors/john-doe/showreels/16",
      "type": "video"
    },
    {
      "name":"Audioreel 2021",
      "url":"https://www.filmmakers.eu/actors/john-doe/showreels/17",
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

`GET https://www.filmmakers.eu/api/v1/actor_profiles/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the actor profile to retrieve

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
enum | null | If set to `translate` attributes are translated if possible (e.g. gender will be `male` or `männlich` instead of `m`). _Note that hash and array attributes (eg. dances / sports) will be joined to a comma-separated string when translating attributes._
locale | en | Translates attributes with closed lists, free text fields are only available in the entry language. Possible values are: `en`, `de`, `fr`, `it`, `es`, `pl`, `ro`, `ru`, `tr`. _This parameter only has an effect when `enum` is set to `translate`._

### Response fields

See example response to the right for an overview of included fields. Please note:

- It is not guaranteed that the exemplary JSON structure shown is complete. Additional fields may be added without notice.
- **Deprecation**: `external_showreel` is deprecated. Use `external_showreels` instead.
- **Deprecation**: `pitch` is deprecated. Use `pitches` instead.
- **Deprecation**: `figure` is deprecated. Use `figures` instead.
- **Deprecation**: `native_dialect` is deprecated. Use `native_dialects` instead.
- **Deprecation**: `castupload_url` is deprecated. Use `filmmakers_url` instead.
- **Deprecation**: `castupload_professional_url` is deprecated. Use `filmmakers_cd_url` instead.

# Talent agencies

## Get talent agency data

```shell
curl "https://www.filmmakers.eu/api/v1/talent_agencies/123" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Example agency",
  "short_name": "Agency",
  "homepage_url": "https://www.example.com",
  "imdb_link": "https://pro.imdb.com/company/co0000001",
  "imdb_id": "co0000001",
  "showreel_url": "https://www.example.com/showreel",
  "twitter_handle": "@example_agency",
  "public_email": "info@example.com",
  "picture_url": "https://static.filmmakers.eu/example.png",
  "address": {
    "city": "Mainz",
    "country": "DE",
    "fax": null,
    "line1": "Wallstr. 11",
    "line2": "",
    "phone": "49613163691950",
    "zipcode": "55122"
  },
  "employees": [
    {
      "id": 1,
      "first_name": "John",
      "last_name": "Doe",
      "phone": "49613163691950",
      "email": "info@example.com",
      "role": "role",
      "picture_url": "https://static.filmmakers.eu/example.png"
    }
  ]
}
```

This endpoint retrieves a specific talent agency.

### HTTP Request

`GET https://www.filmmakers.eu/api/v1/talent_agencies/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the talent agency to retrieve

### Response fields

See example response to the right for an overview of included fields.

# Blog posts

## Get all blog posts

```shell
curl "https://www.filmmakers.eu/api/v1/blog_posts" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 36,
    "title": "Blog post title"
  },
  {
    "id": 35,
    "title": "Blog post title"
  }
]

```

This endpoint retrieves all blog posts available with the access rights of the API key.

### Pagination

This API endpoint is paginated, following the proposed [RFC-8288](https://tools.ietf.org/html/rfc8288) standard for Web linking.

The pagination information is included in response HTTP headers, namely `Total` (total entries), `Per-Page` (entries per page) and `Link` (containing links to corresponding pages). The current page can be set using the `page`-parameter.

### HTTP Request

`GET https://www.filmmakers.eu/api/v1/blog_posts`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Page to display - see "Pagination" above

### Response fields

Field | Type | Description
--------- | ------- | -----------
id | number | Unique ID of the blog post
title | string | Title of the blog post

## Get a specific blog post

```shell
curl "https://www.filmmakers.eu/api/v1/blog_posts/123" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this:

```json
{
  "id": 123,
  "title": "Blog post title",
  "note": "Blog post note",
  "publication_date": "2019-09-02T12:44:19.776+02:00",
  "source": null,
  "body": "Blog post body",
  "body_html": "<div>Blog post body<figure class=\"attachment attachment--preview attachment--jpg\"><div class=\"image-wrapper\"><img src=\"https://www.filmmakers.eu/rails/active_storage/representations/redirect/abc/image.jpg\"><div class=\"image-caption\"><span title=\"© Acme inc\">© Acme inc</span></div></div></figure></div>",
  "images": [
    {
      "url": "https://xxx.cloudfront.net/83570365-9d0f-4165-85c6-df1dd48adb1f.jpeg",
      "copyright": "Acme inc"
    },
    {
      "url": "https://xxx.cloudfront.net/83570365-9d0f-4165-85c6-df1dd48adb1f.jpeg",
      "copyright": "Abc inc"
    }
  ]
}

```

This endpoint retrieves a specific blog post.

### HTTP Request

`GET https://www.filmmakers.eu/api/v1/blog_posts/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the blog post to retrieve

### Response fields

See example response to the right for an overview of included fields

Field | Type | Description
--------- | ------- | -----------
title | string | title of the blog post
note | string | optional comment on the post
body | string | plain text representation of the blog post body with line breaks, **but no HTML markup**
body_html | string |  blog post body with **HTML markup**, includes images with copyright information. Following example CSS can be used to show copyright over the image at the top left corner: `.image-wrapper { position: relative; } .image-caption { position: absolute; top: 0; left: 0; z-index: 1; }`
publication_date | datetime | publication date of this post
source | string | original source of the post - e.g. a newspaper in case an article was shared from an external url. Will be null in case of internal posts, i.e. posts written by the entity themselves.
source.url | string | url of the source article
source.publication_date | datetime | date of publication of original (may be null if source date cannot be determined)
images[].url | string | image url
images[].cover | boolean | true if image is a cover image; default: `false`
images[].copyright | string | image copyright


# Attributes

## Get all attributes

```shell
curl "https://www.filmmakers.eu/api/v1/attributes/" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns an Array structured like this:

```json
[
  "accent_skill",
  "accents",
  "dances",
  "dialect_skill",
  "dialects",
  "drivers_licenses",
  ...
]
```

This endpoint retrieves all possible profile attributes that are closed lists like languages or nationalities as well as attributes for credits/vita.

For countries ISO 3166-1 alpha-2 codes are used <https://en.wikipedia.org/wiki/ISO_3166-2>. For federal states (states/subdivisions) ISO 3166-2 are used, e.g. for Germany: <https://en.wikipedia.org/wiki/ISO_3166-2:DE>. Since the ISO lists are standardized (and extensive), they are not present in this endpoint for the time being.

## Get key/value pairs for attributes

```shell
curl "https://www.filmmakers.eu/api/v1/attributes/xxx" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this (e.g. for nationalities):

```json
{
  "AD":"Andorran",
  "AE":"United Arab Emirates",
  "AF":"Afghan",
  "AG":"Antigua and Barbuda",
  "AL":"Albanian",
  "AM":"Armenian",
  "AO":"Angolan",
  "AR":"Argentinean",
  "AT":"Austrian",
  "AU":"Australian",
  ...
}
```

This endpoint retrieves all possible key/value pair for one of the attributes. Pass one of the supported locales (see above) as param to retrieve localized values.


