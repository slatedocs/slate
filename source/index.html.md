---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://www.castupload.com'>&larr; back to Castupload</a>

search: true

code_clipboard: true
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

## Get a specific actor profile

```shell
curl "https://www.castupload.com/api/v1/actor_profiles/123" \
  -H "Authorization: Token token=API_KEY"
```

> The above command returns JSON structured like this:

```json
{
  "id": 268,
  "first_name": "John",
  "last_name": "Doe",
  "castupload_url": "https://www.castupload.com/actors/john-doe",
  "acting_age_from": 32,
  "acting_age_to": 38,
  "year_of_birth": 1985,
  // ...
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
enum | null | If set to `translate` attributes are translated if possible (eg. gender will be `male` or `männlich` instead of `m`).
locale | en | Translates attributes with closed lists, free text fields are only available in the entry language. Possible values are: `en`, `de`, `fr`, `it`, `es`, `pl`, `ro`, `ru`, `tr`. _This parameter only has an effect when `enum` is set to `translate`._

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
