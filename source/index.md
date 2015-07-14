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

> Create an authorisation token using your SafetyCulture username and password:

```shell
curl \
  -X POST \
  -d "username=example@safetyculture.io&password=secret&grant_type=password" \
  "https://api.safetyculture.io/auth"
```

To get started with the API, you will need to generate an authorisation token. This token is used to authorise all
requests you make so that you will not need to use or store your username and password in your own scripts or
applications.

Following the example, you will POST the `username` and `password` fields along with the field `grant_type` with a value
of `password` to the `https://api.safetyculture.io/auth` endpoint.

> The response will look like the following:

```json
{
    "access_token": "b7f8f791920c1618ace0e24b4d52ce260473dad870e7bd56b869f8d2f26e554d", 
    "token_type": "Bearer"
}
```

The `access_token` is your secret token for authorising all requests to the API, and has access to all the same audits
as the username normally does.

<aside class="notice">
Keep the token safe! You will not be able to retrieve it again without generating a new token.
</aside>

## Authorising a Request

> Search available audits using the authorisation token:

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

> Search available audits:

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

> You can also search available audits in a given period of time:

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id&field=modified_at&modified_after=2015-03-17T03:16:31.072Z&modified_before=2015-04-01T00:00:00.000Z" \
  -H "Authorization: Bearer ..."
```


<aside class="notice">
You must pass at least the audit_id field to the request, or you will receive a 400 HTTP error code indicating a bad
request was made. 
</aside>

## Retrieving an audit

> Retrieving a single audit

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

`https://app.safetyculture.io/#/iauditor/audits/audit_01ca38a821504cda885736cccbb9ba40`

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

> Use the media IDs from a previously retrieved audit to find the URL to retrieve it via the API:

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

# Authentication

To get started with the API, you will need to generate a authorisation token. This token is used to authorise all
requests you make so that you will not need to use your username and password.

<aside class="warning">
Avoid storing your SafetyCulture username and password in scripts that access the API.
</aside>

The SafetyCulture API uses [OAuth 2.0](https://tools.ietf.org/html/rfc6749) as the means of authorisation for individual
requests. The initial authorisation uses the
[Resource Owner Password Credentials](https://tools.ietf.org/html/rfc6749#section-4.3) method and does not currently
support any other flows.

The token used by the API is a [Bearer token](https://tools.ietf.org/html/rfc6750).

...

## Generating an Authorisation Token

...

# Audits

...

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

...

### HTTP Request

`GET https://api.safetyculture.io/audits/search`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
field |  | ...
modified_before | | ...
modified_after | | ...

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

