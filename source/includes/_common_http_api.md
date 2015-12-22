## Accept Header

You also need to define that you accept JSON-formatted responses by providing the Accept HTTP header:

`Accept: application/json`

Alternatively, if you are unable to customize headers, you may add `format=json` GET parameter.

## Resource identifiers

Unless stated otherwise, all the resources in the system are identified with a [Universally Unique Identifier (UUID)][UUID]. It is always represented as a string ID, in lower case and including dashes.

For example: `9ae65e7d-56c5-11e5-af8d-6c4008c08dfe`

## Paginated collections

Some of the API endpoints return paginated collections. That means that for large collections of resources, not all resources are returned in a single response, but the response contains an URL that can be used to fetch the next chunk (page) of results.

> An example of a JSON response with a paginated collection

```json
{
  "next": "https://service.giosg.com/api/v5/examples?page=2",
  "previous": null,
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
`next` | string | Full URL for requesting the next page. This is `null` if the current page is the last page.
`previous` | string | Full URL for requesting the previous page. This is `null` if the current page is the first page
`results` | array of objects | The list containing the result resources for the current page. Each item is an object whose attributes depend on the returned resource type.

## Ordering collections

A [paginated collection][] can usually be ordered by using an `ordering` attribute.

The allowed sorting criteria depends on the endpoint, but the basic usage is always the same. You have an allowed set of sorting attributes, e.g. `first_name`, `last_name` and `created_at`. You may then choose the primary sorting key and any secondary sorting keys with a comma-separated string, e.g. `last_name,first_name`.

Any sorting order is ascending by default, but may be reverted to descending order by prefixing with a minus (`-`) character, e.g. `-created_at` or `last_name,-created_at`.

## Date/time format

Unless stated otherwise, all the date/times returned by API endpoints are ISO-8601 strings with format `YYYY-MM-DDTHH:MM:SS.MSSZ`, for example: `2015-08-31T16:32:17.879Z`. Also, any date/time URL parameters or attributes send as a request payload accept this same format.

Unless stated otherwise, the times are expressed in UTC timezone!
