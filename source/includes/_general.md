Using the API
=============

## Authentication

You need to provide a valid API key in order access the API. You can create an API key from "API keys" section in your company settings:

*Log in to Console → Settings Menu → Company → API keys*

Once you have obtained your API key, define the Authorization HTTP header for all your API requests:

`Authorization: Token 12d5da2085267caa5e41594a47b47e08fcef2530`

<aside class="notice">
The string in the end of the header should be replaced with your API key.
</aside>

Alternatively, if you are unable to customize headers, you may add the token as a GET parameter: `token=12d5da2085267caa5e41594a47b47e08fcef2530`. However, we strongly recommend using HTTP headers.


## Accept Header

You also need to define that you accept JSON-formatted responses by providing the Accept HTTP header:

`Accept: application/json`

Alternatively, if you are unable to customize headers, you may add `format=json` GET parameter.

## Paginated Collections

Some of the API endpoints return paginated collections. Unless stated otherwise, all these endpoints accept the following optional GET parameters.

Parameter  | Type    | Default  | Description
:----------|:--------|----------|------------
`page`     | integer | `1`      | Which page of the results to return. If omitted, the first page with index 1 is returned.
`page_size`| integer | (varies) | Maximum number of returned objects per page. The default value and limitations depend on the API end-point.

Those API endpoints that return paginated collections return an object with the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`count` | integer | The total number of objects matching the query. This may be much larger than the number of the actually returned objects in this response.
`per_page` | integer | Maximum number of objects per page. The actual number of returned objects on the last page may be fewer than this number. This equals to the 'page_size' GET parameter or its default value.
`num_pages` | integer | The total number of pages for the matching query results. In practice, this is same than count / per_page, rounded up.
`current_page` | integer | The index of the current page. The counting starts from one (1).
`next_page` | integer | Index of the next available page. This is null if the current page is the last page.
`previous_page` | integer | Index of the previous available page. This is `null` if the current page is the first page.
`next_page_url` | string | For convenience, ready-to-use URL for requesting the next page. This is `null` if the current page is the last page.
`previous_page_url` | string | For convenience, ready-to-use URL for requesting the previous page. This is `null` if the current page is the first page
`results` | array of objects | The list containing the results for the current page

## Ordering Collections

[Paginated collection][] can usually be ordered by using a `ordering` attribute. The allowed sorting criteria depends on the endpoint, but the basic usage is always the same. You have an allowed set of sorting attributes, e.g. `first_name`, `last_name` and `created_at`. You may then choose the primary sorting key and any secondary sorting keys with a comma-separated string, e.g. `last_name,first_name`. Any sorting order is ascending by default, but may be reverted to descending order by prefixing with a minus (`-`) character, e.g. `-created_at` or `last_name,-created_at`.

## Date/time format

All the date/times are defined in ISO-8601 format strings, for example: `2015-06-12T12:34:56.000000Z`
