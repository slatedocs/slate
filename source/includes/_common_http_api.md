## Accept Header

You also need to define that you accept JSON-formatted responses by providing the Accept HTTP header:

`Accept: application/json`

Alternatively, if you are unable to customize headers, you may add `format=json` GET parameter.

## Resource identifiers

Unless stated otherwise, all the resources in the system are identified with a [Universally Unique Identifier (UUID)][UUID]. It is always represented as a string ID, in lower case and including dashes.

For example: `9ae65e7d-56c5-11e5-af8d-6c4008c08dfe`

## Paginated Collections

Some of the API endpoints return paginated collections. Unless stated otherwise, all these endpoints accept the following optional GET parameters.

Parameter  | Type    | Default  | Description
:----------|:--------|----------|------------
`page`     | integer | `1`      | Which page of the results to return. If omitted, the first page with index 1 is returned.
`page_size`| integer | (varies) | Maximum number of returned objects per page. The default value and limitations depend on the API end-point.

> An example of a JSON response with a paginated collection

```json
{
  "count": 13,
  "per_page": 5,
  "num_pages": 3,
  "current_page": 1,
  "next_page": 2,
  "previous_page": null,
  "next_page_url": "https://service.giosg.com/api/v5/examples?page=2",
  "previous_page_url": null,
  "results": [
    {"name": "Example Resource 1"},
    {"name": "Example Resource 2"},
    {"name": "Example Resource 3"},
    {"name": "Example Resource 4"},
    {"name": "Example Resource 5"}
  ]
}
```

Paginated collections are objects with the following attributes.

Attribute | Type | Description
:---------|:-----|------------
`count` | integer | The total number of objects matching the query. This may be much larger than the number of the actually returned objects in this response.
`per_page` | integer | Maximum number of objects per page. The actual number of returned objects on the last page may be fewer than this number. This equals to the `page_size` GET parameter or its default value.
`num_pages` | integer | The total number of pages for the matching query results. In practice, this is same than `count` / `per_page`, rounded up.
`current_page` | integer | The index of the current page. The counting starts from one (1).
`next_page` | integer | Index of the next available page. This is `null` if the current page is the last page.
`previous_page` | integer | Index of the previous available page. This is `null` if the current page is the first page.
`next_page_url` | string | For convenience, ready-to-use URL for requesting the next page. This is `null` if the current page is the last page.
`previous_page_url` | string | For convenience, ready-to-use URL for requesting the previous page. This is `null` if the current page is the first page
`results` | array of objects | The list containing the results for the current page. Each item is an object whose attributes depend on the returned resource type.

## Ordering Collections

A [paginated collection][] can usually be ordered by using an `ordering` attribute.

The allowed sorting criteria depends on the endpoint, but the basic usage is always the same. You have an allowed set of sorting attributes, e.g. `first_name`, `last_name` and `created_at`. You may then choose the primary sorting key and any secondary sorting keys with a comma-separated string, e.g. `last_name,first_name`.

Any sorting order is ascending by default, but may be reverted to descending order by prefixing with a minus (`-`) character, e.g. `-created_at` or `last_name,-created_at`.

## Date/time format

Unless stated otherwise, all the date/times returned by API endpoints are ISO-8601 strings with format `YYYY-MM-DDTHH:MM:SS.MSS`, for example: `2015-08-31T16:32:17.879Z`. Also, any date/time URL parameters or attributes send as a request payload accept this same format.

Unless stated otherwise, the times are expressed in UTC timezone!
