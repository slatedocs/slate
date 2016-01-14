## Filters

### Catalog

`/datasets/{id}/filters/`

GET on this resource returns a Shoji Catalog with the list of Filters that the
current user can use on this Dataset.

This index contains two kinds of filters: public and private, denoted by the `is_public` tuple attribute. Private filters are those created by the authenticated user, and they cannot be accessed by other users. Public filters are available to all users who are authorized to view the dataset.

```json
{
    "name": "My filter",
    "is_public": true,
    "id": "1442EA...",
    "owner_id": "https://beta.crunch.io/api/users/{owner_id}/",
}
```

The only tuple attribute editable via PATCHing the catalog is the "name". A 204 response indicates a successful PATCH. Attempting to PATCH any other attribute will
return a 400 response.

POST a Shoji Entity to this catalog to create a new filter. Entities must include a `name` and an
`expression`. If omitted, `is_public` defaults to False. A successful POST yields a 201 response
that will contain a Location header with the URL of the newly created filter.

All users with access to the dataset can create private filters; however, only the current dataset editor can create public filters (`is_public: true`). Attempting to create a public filter when not the current dataset editor results in a 403 response.

### Entity

`/datasets/{id}/filters/{id}/`

GET this resource to return a Shoji Entity containing the requested filter.

```json
{
    "id": "ac64ef",
    "dataset_id": "8c6c9e3",
    "version": "master__tip",
    "name": "Filter name",
    "is_public": false,
    "expression": {},
    "last_update": "2015-12-31"
}
```

PATCH an entity to edit its `expression`, `name` or `is_public` attributes. Successful PATCH requests return 204 status. As with the POSTing new entities to the catalog, only the dataset's current editor can alter `is_public`.

The `expression` attribute must contain a valid Crunch filter expression.

<!-- Discuss valid crunch filter expressions -->

See [expressions](#expressions) in the Object Reference for more details.

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
