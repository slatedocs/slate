---
title: SafetyCulture API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='http://safetyculture.io'>SafetyCulture</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors
  - usecases

search: true
---

# Introduction

> As you scroll through the page, you can follow these code snippets to try the API for yourself.

The SafetyCulture API gives you direct access to your data in the SafetyCulture platform.

The API supports read-only access to your audit data and attached images or media. Audits can be retrieved individually,
or can be searched by a set of parameters. The search parameters include the last modification date of an audit,
allowing you to use the API for tasks such as extracting all audits from the system, and retrieving new and updated
audits periodically.

The SafetyCulture API is currently available under a limited access trial. Please contact 
[SafetyCulture Support](http://www.safetyculture.io/support/safetyculture/contact) if you are interested in early
access.

# Getting Started

In this section, we will provide a quick guide to getting started with the SafetyCulture API. We will walk through
the process of obtaining an authorisation token, using it to authorise a request, and searching available audits.

The examples use the `curl` application to allow them to be run from the command-line wherever `curl` is installed.

For more information on the structure of each request, see to the reference sections in the navigation.

## Generating an Authorisation Token

```shell
curl \
  -X POST \
  -d username=example@safetyculture.io \
  -d password=secret \
  -d grant_type=password \
  "https://api.safetyculture.io/auth"
```

To get started with the API, you will need to generate an authorisation token. This token is used to authorise all
requests you make so that you will not need to use or store your username and password in your own scripts or
applications.

Following the example, you will POST the `username` and `password` fields along with the field `grant_type` with a value
of `password` to the `https://api.safetyculture.io/auth` endpoint.

```json
{
    "access_token": "b7f8f791920c1618ace0e24b4d52ce260473dad870e7bd56b869f8d2f26e554d", 
    "token_type": "Bearer"
}
```

The `access_token` is your secret token for authorising all requests to the API, and has access to all the same audits
as the username normally does.

<aside class="notice">
Keep the token safe! You will not be able to retrieve it again without generating a new token, and you may only generate
a limited number for a single account.
</aside>

## Authorising a Request

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id" \
  -H "Authorization: Bearer b7f8f791920c1618ace0e24b4d52ce260473dad870e7bd56b869f8d2f26e554d"
```

You can use the authorisation token to make requests to the API by passing it in the `Authorization` HTTP header using
the format `Authorization: Bearer b7f8f791920c1618ace0e24b4d52ce260473dad870e7bd56b869f8d2f26e554d`. This header needs
to be passed on every request.
 
If the header is forgotten, then the API will respond with a 401 HTTP error code, indicating the user is not
authorised.

## Searching for available audits

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id&field=modified_at" \
  -H "Authorization: Bearer ..."
```

> The response will look like the following:

```json
{
  "count": 2,
  "total": 2,
  "audits": [
    {
      "audit_id": "audit_01ca38a821504cda885736cccbb9ba40",
      "modified_at": "2015-03-17T03:16:31.072Z"
    },
    {
      "audit_id": "audit_853C17E6040B43DA1DFDDD8E6A4D6D3A",
      "modified_at": "2015-03-24T06:31:47.203Z"
    }
  ]
}
```

To search for audits using the API, make a GET request to the `https://api.safetyculture.io/audits/search` endpoint.

By default the audits will be returned in ascending order from the earliest to latest, limited to the first 1000 audits.

You can pass the list of fields that you want included, as well as a number of other parameters to narrow the request.
For more information on the available search options, see the [Search Audits](#search-audits) reference.

> Search available audits in a given period of time:

```shell
curl "https://api.safetyculture.io/audits/search"\
"?field=audit_id&field=modified_at"\
"&modified_after=2015-01-01T00:00:00.000Z"\
"&modified_before=2015-04-01T00:00:00.000Z" \
  -H "Authorization: Bearer ..."
```

> Or search audits based on a particular template:

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id"\
"&template=template_37afc5890aa94e778bbcde4fc4cbe480" \
  -H "Authorization: Bearer ..."
```


<aside class="notice">
You must pass at least the audit_id field to the request, or you will receive a 400 HTTP error code indicating a bad
request was made. 
</aside>

## Retrieving an audit

```shell
curl "https://api.safetyculture.io/audits/audit_01ca38a821504cda885736cccbb9ba40" \
  -H "Authorization: Bearer ..."
```

> The above command returns JSON structured like this:

```json
{
  "template_id": "template_BB29F82814B64F559A33BF7CAA519787",
  "audit_id": "audit_01ca38a821504cda885736cccbb9ba40",
  "created_at": "2015-05-01T01:13:20.584Z",
  "modified_at": "2015-06-30T05:03:40.754Z",
  "audit_data": {
  }
}
```

Once you have found the list of audits that you'd like to retrieve, you can fetch them individually using the
`https://api.safetyculture.io/audits/<audit_id>` endpoint. You can use the audit ID retrieved from a previous search, or
by opening it in the SafetyCulture website to edit and looking at the URL, e.g.:

`https://app.safetyculture.io/#/iauditor/audits/<audit_id>`

The JSON returned from this endpoint is a complete representation of the audit data, including the template that it was
based from. A description of the audit JSON format can be found in the [Get Audit](#get-audit) reference.

> The audit will also contain media attached to particular items:

```json
    {
      "media": [
        {
          "date_created": "2015-06-24T22:59:59.000Z",
          "file_ext": "jpg",
          "label": "no label",
          "media_id": "9E3BD015-6275-4668-BAF1-296B2F38444C",
          "href": "https://api.safetyculture.io/audits/audit_01ca38a821504cda885736cccbb9ba40/media/9E3BD015-6275-4668-BAF1-296B2F38444C"
        }
      ]
    }
```

A particular section of interest is the media section as you can see in the snippet. These references can be used to
determine how to retrieve the media from the API.

## Retrieving media from an audit

```shell
curl "https://api.safetyculture.io/audits/audit_01ca38a821504cda885736cccbb9ba40/media/9E3BD015-6275-4668-BAF1-296B2F38444C" \
  -o 9E3BD015-6275-4668-BAF1-296B2F38444C.jpg \
  -H "Authorization: Bearer ..."
```

> In this case, the response will not be JSON, but the actual media file with an appropriate `Content-Type` header.

After retrieving the audits that you would like to use, you may want to retrieve their associated media (including 
photos, images, drawings and signatures). To fetch a piece of media, you will need the audit ID, and the media ID within
the audit which can be retrieved from the audit JSON as described above.

The media is downloaded directly, so you should save the output to a file with an appropriate name. For example, you
can use the values from the media item in the audit JSON to construct the filename `<media_id>.<file_ext>`.

Repeat the request for as many of the media items in the audit that you need.

## Next steps

This concludes a basic walkthrough of the audit retrieval methods of the SafetyCulture API. Read on to the following
sections to learn about all of the available requests and parameters, or take a look at the [Use Cases](#use-cases)
for examples of API tasks that you might like to try.

<aside class="success">
If you have any questions, please contact 
<a href="http://www.safetyculture.io/support/safetyculture/contact">SafetyCulture Support</a>.
</aside>

# Making Requests

```shell
curl "https://api.safetyculture.io/" \
  -H "User-Agent: MySafetyCultureClient/1.0"
```

If you are writing your own client or sending requests via the command line, you should always ensure that an
appropriate `User-Agent` header is sent. For example, for a client called `MySafetyCultureClient` version `1.0`, you
might use a user agent of `MySafetyCultureClient/1.0` as in the example snippet.

```shell
curl "https://api.safetyculture.io/" \
  -H "Accept: application/json"
```

You must also send the `Accept` header to indicate what content type is desired. This should be `application/json` or
a wildcard such as `*/*`.


# Authentication

The API requires an authorisation token for each request. This token is initially generated by making a request to the
`https://api.safetyculture.io/auth` endpoint with your username and password. After this initial request, you will use
the authorisation token, and will not need to use your own username and password.

<aside class="warning">
Avoid storing your SafetyCulture username and password in scripts that access the API.
</aside>

Once you have obtained a token, it is passed in the `Authorization` header on ach request to the API, for example:
`Authorization: Bearer b7f8f791920c1618ace0e24b4d52ce260473dad870e7bd56b869f8d2f26e554d`.

The SafetyCulture API uses [OAuth 2.0](https://tools.ietf.org/html/rfc6749) as the means of authorisation for individual
requests. The initial authorisation uses the
[Resource Owner Password Credentials Grant](https://tools.ietf.org/html/rfc6749#section-4.3) method and does not currently
support any other flows.

The token used by the API is a [Bearer token](https://tools.ietf.org/html/rfc6750). It should be considered as a
"personal access token" that you control yourself, for your own account. A pre-registered client ID and secret are not
required to create an authorisation token at this time.

The token expires after 1 month of inactivity. After that point you will need to create a new token. If the token makes
any API requests within that period then it will not expire until it is revoked by the owner.

There is a limit on the number of personal access tokens you can create. You should only create them as needed, and
revoke them when they are no longer in use.

## Request Authorisation Token

```shell
curl \
  -X POST \
  -d username=example@safetyculture.io \
  -d password=secret \
  -d grant_type=password \
  "https://api.safetyculture.io/auth"
```

> The response will look like the following:

```json
{
    "access_token": "b7f8f791920c1618ace0e24b4d52ce260473dad870e7bd56b869f8d2f26e554d", 
    "token_type": "Bearer"
}
```

To generate an authorisation token, you must make a request to the `https://api.safetyculture.io/auth` endpoint with a
valid username and password that has access to the SafetyCulture API. This request follows the Resource Owner Password 
Credentials Grant method of OAuth 2.0.
 
<aside class="warning">
These parameters should only be placed in the body of the POST request. They should not be added as URL parameters, as
the password will not be transmitted securely. You must use a POST request, and not a GET request (which will
respond with a 405 HTTP status code).
</aside>

### HTTP Request

`POST https://api.safetyculture.io/auth`

### Request Body

The body should use the content type `application/x-www-form-urlencoded` with the following required parameters in the
body:

Parameter    | Description
---------    | -----------
`username`   | The SafetyCulture username requesting an authorisation token
`password`   | The password of the SafetyCulture user
`grant_type` | Only `password` is supported as a value

You do not supply a client ID and client secret at present.

### Response

The response will have the content type `application/json` and include the following parameters:

Parameter      | Description
---------      | -----------
`access_token` | The token that can be used in the authorisation header for future requests
`token_type`   | The type of access token returned. Will always be `Bearer`

### Errors

The errors for this method follow the OAuth specification. If an OAuth error occurs, the status code will be
`400 Bad Request` and the format of the body will differ from other API errors:

Parameter           | Description
---------           | -----------
`error`             | The error code that occurred, such as `invalid_grant`
`error_description` | A human readable description of the error code

Other standard errors may occur. For example, you may receive a `403 Forbidden` if the user in question doesn't have
access to the SafetyCulture API.

# Audits

The SafetyCulture API contains a read-only interface to your audit data. There are methods to retrieve audits, their
media, and to search for particular audits.

## Search Audits

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id&field=modified_at" \
  -H "Authorization: Bearer ..."
```

> The above command returns JSON structured like this:

```json
{
  "count": 2,
  "total": 2,
  "audits": [
    {
      "audit_id": "audit_01ca38a821504cda885736cccbb9ba40",
      "modified_at": "2015-03-17T03:16:31.072Z"
    },
    {
      "audit_id": "audit_853C17E6040B43DA1DFDDD8E6A4D6D3A",
      "modified_at": "2015-03-24T06:31:47.203Z"
    }
  ]
}
```

The audit search endpoint allows you to retrieve the audit IDs and modification date of audits that meet a certain
criteria. It is possible to request audits between given dates, based on a particular template, and whether or not to
include archived audits.

This allows you to find particular audits, to gradually retrieve the audit IDs of every audit that you have access to,
or to retrieve audits updated since your last search.

In the request, you must specify the fields that you want to return. The field `audit_id` is required, but you can also
include `modified_at`. Multiple `field` elements can be provided.

> Searching by modification date:

```shell
curl "https://api.safetyculture.io/audits/search"\
"?field=audit_id&field=modified_at"\
"&modified_after=2015-01-01T00:00:00.000Z" \
  -H "Authorization: Bearer ..."

curl "https://api.safetyculture.io/audits/search"\
"?field=audit_id&field=modified_at"\
"&modified_after=2015-01-01T00:00:00.000Z"\
"&modified_before=2015-04-01T00:00:00.000Z" \
  -H "Authorization: Bearer ..."
```

To search between dates, use the `modified_before` and `modified_after` parameters. This will find audits between
the dates given.

The dates should be formatted according to ISO 8601 and include the date, time and timezone. For example,
`2015-04-01T00:00:00.000Z` or `2015-04-01T00:00+1000`.

<aside class="notice">
Be aware that if you include a timezone, you must URL encode the <code>+</code> sign as <code>%2B</code> in any URL
parameters.
</aside>

The modification dates used for searching are related to SafetyCulture's cloud storage and include latest sync times,
modifications through the SafetyCulture website, and other system modifications. This means that the date may not
match the last date that the audit was modified. This will ensure that you may consistently find all of the audits
modified since your last search, even if they are synced some time after they are last changed.

> Searching by template:

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id"\
"&template=template_37afc5890aa94e778bbcde4fc4cbe480" \
  -H "Authorization: Bearer ..."

curl "https://api.safetyculture.io/audits/search?field=audit_id"\
"&template=template_37afc5890aa94e778bbcde4fc4cbe480"\
"&template=template_FCB63052F0D445AEB52F25DE6BEB8D40" \
  -H "Authorization: Bearer ..."
```

Searching by template allows you to find all of the audits created from a certain template. You may specify one or more
`template` parameters to search for. The template ID can be obtained from an audit, or by opening it for editing in
SafetyCulture, e.g.: `https://app.safetyculture.io/#/iauditor/templates/<template_id>`

> Including archived audits:

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id&archived=both" \
  -H "Authorization: Bearer ..."
```

By default, archived audits are not included in the search. The `archived` parameter allows you to decide whether to
search only archived audits (`true`), not search archived audits (`false`), or search all audits including those
archived (`both`).

The number of results returned defaults to 1000 at a time, which is the maximum allowed. It is possible to customise
the `limit` parameter to retrieve fewer audits in each request. The limit is a maximum, and fewer audits may be returned
than the limit, even if there are more available within the search parameters. This can occur if two or more audits
have the same `modified_at` across the limit boundary, in which case no audits with that timestamp are returned,
allowing you to correctly retrieve the next "page" using the `modified_after` parameter.

The audits are returned in ascending order from the earliest first, up to the limit specified. More audits can be
retrieved by repeating the search, using the `modified_at` of the last audit as the `modified_after` parameter to the
next request.

### HTTP Request

`GET https://api.safetyculture.io/audits/search`

### Query Parameters

Parameter         | Description
---------         | -----------
`field`           | Field(s) of the audit to retrieve. Valid values are `audit_id` and `modified_at`. Multiple field parameters may be specified. `audit_id` must be specified.
`modified_before` | Only search for audits where `modified_at` is before the given date. The date should be specified in full form ISO 8601 format, e.g. `2015-04-01T00:00:00.000Z`
`modified_after`  | Only search for audits where `modified_at` is after the given date. The date should be specified in full form ISO 8601 format, e.g. `2015-04-01T00:00:00.000Z`
`template`        | Only search for audits that were created from the given template. For example: `template_37afc5890aa94e778bbcde4fc4cbe480`
`archived`        | Whether to search archived audits. Valid values are `true` (search only archived audits), `false` (do not search archived audits) or `both` (search all audits including those archived). The default is `false`.
`limit`           | The maximum number of audits to retrieve. The maximum value is `1000`. The default is also `1000`.

### Response

The response will have the content type `application/json` and include the following parameters:

Parameter      | Description
---------      | -----------
`audits`       | An array of audits matching the search results. Each audit is an object containing the fields specified in the request.
`count`        | The number of audits returned by this request.
`total`        | The total number of audits that could have been returned by this search if it were unlimited.

<aside class="notice">
If the <code>total</code> is greater than the <code>count</code>, more audits can be retrieved by either increasing the
<code>limit</code>, or repeating the search with a new <code>modified_after</code> value.
</aside>


## Get Audit

```shell
curl "https://api.safetyculture.io/audits/audit_01ca38a821504cda885736cccbb9ba40" \
  -H "Authorization: Bearer ..."
```

> The above command returns JSON structured like this:

```json
{
  "template_id": "template_BB29F82814B64F559A33BF7CAA519787",
  "audit_id": "audit_01ca38a821504cda885736cccbb9ba40",
  "created_at": "2015-05-01T01:13:20.584Z",
  "modified_at": "2015-06-30T05:03:40.754Z",
  "audit_data": {
  }
}
```

> The full JSON object is much larger, including information in the `audit_data` and other fields.

This endpoint retrieves a specific audit.

...

### HTTP Request

`GET https://api.safetyculture.io/audits/<audit ID>`

### URL Parameters

Parameter | Description
--------- | -----------
audit ID | The ID of the audit to retrieve

