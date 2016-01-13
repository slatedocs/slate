## Filters

### Catalog

`/datasets/{id}/filters/`

GET on this resource returns a Shoji Catalog with the list of Filters that the
current user can use on thie Dataset.

This index is compound of two kind of filters, public and private filters.
The private filters available are those created by the logged in user, while
the public filters are those that have been made public by the dataset editor.

```json
{
    "name": "My filter",
    "is_public": true,
    "id": "1442EA...",
    "owner_id": "http://...../users/owner_id/",
}
```

PATCH to this resource allows only to edit the filters' `name` attribute.
A 204 response indicates success, attempting to edit any other attribute will
return a 400 response.


POST to this catalog allows to create new filters. Only the current dataset
editor can create public filters (`is_public: true`), else a 403 response will
be returned.
All viewers can create private filters. They must indicate a `name` and an 
`expression` as well as `is_public` set to False. Success is a 201 response
that will contain a Location header with the URL of the newly created filter.

### Entity

`/datasets/{id}/filters/{id}/`

This resource will return the body of the requested filter as a Shoji Entity.

```json
{
    "id": "ac64ef"
    "dataset_id": "8c6c9e3"
    "version": "master__tip",
    "name": "Filter name",
    "is_exclusion": false,
    "is_public": false,
    "expression": {}
    "last_update": "2015-12-31"
}
```

PATCH will allow to edit the `expression`, `name` and `is_public` attribute of
the entity. As with the catalog, only the current editor can make filters public.
The `expression` attribute must contain a valid ZCL filter expression.


### Applied filters

`/datasets/{id}/filters/applied/`

A Shoji order containing the filters applied by the current user.

```json
{
    "element": "shoji:order",
    "self": "http://beta.crunch.io/api/datasets/ac64ef/filters/applied/",
    "graph": [
        "http://beta.crunch.io/api/datasets/ac64ef/filters/28ef72/",
        "http://beta.crunch.io/api/datasets/ac64ef/filters/0ac6e1/",
    ]
}
```


### Filtering endpoints

Some endpoints will support filtering, they will accept a `filter` GET parameter
that should be a JSON encoded object that can contain either the URL of a filter
(available through the Filters catalog) or a filter expression.

To filter using a filter URL, pass the following JSON object as the `filter` 
parameter:

```json
{
    "filter": "http://....."
}
```

```http
GET /datasets/id/summary/?filter=%7B%22filter%22%3A+%22http%3A%2F%2F...crunch.io%2Fdatasets%2Fid%2Ffilters%2Fid%2F%22%7D HTTP/1.1
```

To filter using a filter expression, pass the following JSON object as the 
`filter` parameter:

```json
{
    "expression": {"function": "..", "args": ....}
}
```


```http
GET /datasets/id/summary/?filter=%7B%22expression%22%3A+%7B%22function%22%3A+%22%3D%3D%22%2C+%22args%22%3A+%5B%7B%22variable%22%3A+%22id%22%7D%2C+%7B%22value%22%3A+%22xx%22%7D%5D%7D%7D HTTP/1.1
```

