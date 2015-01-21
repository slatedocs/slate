---
title: Contently API Reference

language_tabs:
  - shell

toc_footers:
  #- <a href='#'>Sign Up for a Developer Key</a>
  #- <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Welcome to the Contently API. You can use our API to access your publication's stories and to mark things as published.

The current version of the API is v1. When backwards-incompatible changes are made to the API, we will bump the version number in the request path.

The current API endpoint is:

`https://api.contently.com/v1/`


# Authentication

> To authorize, specify the API key in the header:

```shell
curl --get https://api.contently.com/v1/stories \
   -H "Contently-Api-Key: <API_KEY>" \
   -d status=completed
```

> Make sure to replace `<API_KEY>` with your API key.

You authenticate with the Contently API by specifying your publication's API key in the request header. The API key should be kept secret.

To change or reset your API key reach out to your account manager.

# Errors

> The body of the JSON response will contain an error message:

```shell
{
    "error": "Helpful error message"
}
```

When something goes wrong, we will respond with the appropriate HTTP status code.

| Error | What it means |
| ----- | ------------- |
| 200 OK | Everything worked as expected. |
| 400 Bad Request | Often missing a required parameter or updating a record with an invalid value. |
| 401 Unauthorized | No valid API key provided. |
| 403 Forbidden | Request understood but the action was invalid. |
| 404 Not Found | The requested item doesn't exist (It was deleted or never existed). |
| 500's | Something went wrong on our end. |

# Pagination

> 'Link' header format:

```shell
Link:
<https://api.contently.com/v1/stories?status=completed&page=4&per_page=25>; rel="next",
<https://api.contently.com/v1/stories?status=completed&page=2&per_page=25>; rel="prev",
<https://api.contently.com/v1/stories?status=completed&page=1&per_page=25>; rel="first",
<https://api.contently.com/v1/stories?status=completed&page=10&per_page=25>; rel="last"
```

> A request for a specific page of stories looks like:

```shell
curl --get https://api.contently.com/v1/stories \
       -H "Contently-Api-Key: <API_KEY>" \
       -d status=completed \
       -d per_page=50 \
       -d page=2
```

Every response from an endpoint that returns a collection includes pagination information based on the request. This data can give you information about your previous request, but should not be used for traversing results (see 'Link Header' below)

The following pagination information is included in the response header:

Header key | Description
--------- | ------- | -----------
X-Page | An Integer illustrating the current page number.
X-Per-Page |  An Integer that specifies the page you want.
X-Total |  An Integer specifying the total number of records that matched your request.

#### Link header

We include a [link header](https://tools.ietf.org/html/rfc5988) that makes traversing pages easy by returning the next, previous, first and last pages. If there is no previous or next page, those links will be omitted. Similarly, if you are currently requesting the first or last pages, the respective links will also be omitted.

#### Making a request

You can specify the following parameters:

Parameter | Default | Description
--------- | ------- | -----------
per_page | 25 | A positive Integer that specifies the number of records per page, max is 100.
page | 1 | A positive Integer that specifies the page you want.

# Stories

## Querying stories

```shell
# GET /stories

curl --get https://api.contently.com/v1/stories \
       -H "Contently-Api-Key: <API_KEY>" \
       -d status=completed
 ```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "title": "Example story",
    "published_to_url": "http://example.com",
    "publication":{
      "id": 1,
      "name": "Example publication"
    },
    "creator":{
      "id": 1,
      "first_name": "Rando",
      "last_name": "Calrissian",
      "email": "rando@example.com"
    },
    "contributors":[
    {
      "id": 1,
      "first_name": "Rando",
      "last_name": "Calrissian",
      "email": "rando@example.com"
    }
    ],
    "story_fields": [
      {
        "id": 1,
        "name": "Twitter",
        "content": "<p>HTML content</p>"
      }
    ],
    "due_at": 1421771582,
    "publish_at": 1421771582,
    "created_at": 1421771582,
    "published_at": 1421771582,
    "last_modified_at": 1421771582,
    "completed_at": 1421771582,
    "content": "<p>HTML body of story</p>",
    "brief": "Story description text",
    "status": "completed",
    "url": "https://contently.com/stories/1",
    "story_attributes": [
      {
        "name": "Attribute name",
        "value": "Attribute value"
      }
    ],
    "assets": [
      {
        "id": 1,
        "url": "https://s3.amazonaws.com/path_to_file",
        "name": "filename.png",
        "created_at": 1421771582,
        "updated_at": 1421771582
      }
    ]
  }
]
```

> You can also specify multiple statuses at once:

```shell
# GET /stories

curl --get https://api.contently.com/v1/stories \
       -H "Contently-Api-Key: <API_KEY>" \
       -d "status[]=completed&status[]=published"
```

> Specifying a sort:

```shell
curl --get https://api.contently.com/v1/stories \
       -H "Contently-Api-Key: <API_KEY>" \
       -d status=completed \
       -d sort_by=last_modified_at \
       -d sort_direction=asc
```

> Specifying a date range:

```shell
curl --get https://api.contently.com/v1/stories \
  -H "Contently-Api-Key: <API_KEY>" \
  -d status=completed \
  -d 'date_range[start]=1420732536&date_range[end]=1420646154&date_range[type]=completed_at'
```

There is a single endpoint available for querying stories.

`https://api.contently.com/v1/stories`

This endpoint returns an array of objects representing stories (details to the side).

Parameter | Required | Default | Description | Valid values
---- | ---- | ---- | -------- | ---------
status | Yes |  | A String that specifies status of the stories you want. | completed, published
sort_by | No | created_at | A String specifying the attribute of a story that you want to sort by. | See valid date fields below
sort_direction | No | desc | A String specifying whether you want the sorted stories to be returned in ascending or descending order. | asc, desc
date_range | No | | A JSON object representing the date range | See 'Specifying a date range below'

<aside class="warning">Remember: 'status' is a *required* parameter - failing to provide it will result in a 400 error</aside>

### Specifying a date range

You can query for certain dates ranges by including a JSON object containing the relevent data along with your request.

Only one **date_range** parameter can be specified per request.

If you choose to specify a date range, here are the required parameters:

Parameter | Required | Default | Description | Valid values
---- | ---- | ---- | -------- | ---------
start | Yes | | Unix timestamp | Any valid date
end | Yes | | Unix timestamp | Any valid date
type | Yes | | A String specifying the date attribute of a story that you want to search by, only one can be specified per request. | See valid date fields

### Valid date fields

<aside class="notice">All date / time fields are in [unix time](http://en.wikipedia.org/wiki/Unix_time)  - an Integer representing seconds since midnight Jan 1, 1970</aside>

Field name | Description
---- | ----
due_at | The date the first version of the story is due.
publish_at | The planned publish date for the story.
published_at | The date the story was actually published or marked published.
completed_at | The date the story was completed.
created_at | The date the story was created.
last_modified_at | The last time this story was edited (includes things like changing the title or brief, but also actions like marking published).


## Story details

```shell
# GET /stories/:id

curl --get https://api.contently.com/v1/stories/:id \
   -H "Contently-Api-Key: <API_KEY>"
```

Returns fields for the specified story (see JSON structure of a story above).

<aside class="notice">Note that the story must be either 'completed' or 'published', otherwise a 404 will be returned.</aside>

## Marking stories published

```shell
# PUT /stories/:id/mark_published

curl -X PUT https://api.contently.com/v1/stories/:id/mark_published \
       -H "Contently-Api-Key: <API_KEY>" \
       -H "Content-Length:0" \
       -d published_to_url=http://example.com \
       -d published_at=1420732536
```

> If you are using cURL, you must also specify the Content-Length in the header (any value will do).

**If you are integrating the Contently API with your CMS, it is vital that you notify the Contently platform that a story has been published. This allows us to display the published_to_url on the platform and provide analytics data for the story.**

This endpoint updates the specified story, changing its status to 'published' and adding an item to the story's audit log (visible on the Contently platform) documenting the change. It enables analytics tracking and makes sure that published data on the platform is always up to date. It returns the story object if the update succeeded or an error message otherwise.

If a story is already 'published', you must include the **published_at** date in the request if you wish to override the existing date.

<aside class="notice">Note that attemping to mark published a story that is not currently 'completed' or 'published' will result in a 403 error.</aside>

Parameter | Required | Default | Description | Valid values
---- | ---- | ---- | -------- | ---------
published_to_url | No | | A String indicating the URL where the story was published | A valid URL beginning with 'http://' or 'https://'
published_at | No | The time the request is made (if the story has not already been published) | Unix timestamp indicating the time the story was pubilshed | Any valid date

