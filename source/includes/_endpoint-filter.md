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
    "id": "1442ea",
    "owner_id": "https://beta.crunch.io/api/users/4152de/",
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
	"element": "shoji:entity",
	"self": "https://beta.crunch.io/api/datasets/ac64ef/filters/1442ea/",
	"body": {
        "id": "1442ea",
        "name": "My filter",
        "is_public": true,
        "expression": {},
        "last_update": "2015-12-31",
        "creation_time": "2015-11-12T12:34:56"
    }
}
```

PATCH an entity to edit its `expression`, `name`, or `is_public` attributes. Successful PATCH requests return 204 status. As with the POSTing new entities to the catalog, only the dataset's current editor can alter `is_public`.

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
that can be a JSON encoded object that can contain either the URL of a filter
(available through the Filters catalog) or a filter expression or a filter URL.

To filter using a filter URL using JSON pass in an object as the `filter`
parameter:

```json
{
    "filter": "http://beta.crunch.io/api/datasets/ac64ef/filters/28ef72/"
}
```

```http
GET /datasets/id/summary/?filter=%7B%22filter%22%3A%22http%3A%2F%2Fbeta.crunch.io%2Fapi%2Fdatasets%2Fac64ef%2Ffilters%2F28ef72%2F%22%7D HTTP/1.1
```

It is also possible to send straight filter URLs without a JSON wrapping:


```http
GET /datasets/id/summary/?filter=http%3A%2F%2Fbeta.crunch.io%2Fapi%2Fdatasets%2Fac64ef%2Ffilters%2F28ef72%2F HTTP/1.1
```

Or multiple filters that will be ANDed together

```http
GET /datasets/id/summary/?filter=http%3A%2F%2Fbeta.crunch.io%2Fapi%2Fdatasets%2Fac64ef%2Ffilters%2F28ef72%2F&filter=http%3A%2F%2Fbeta.crunch.io%2Fapi%2Fdatasets%2Fac64ef%2Ffilters%2F28ef72%2F HTTP/1.1
```


To filter using a filter expression, pass a Crunch filter expression as the
`filter` parameter, like:

```json
    {
        "function": "==",
        "args": [
            {"variable": "http://beta.crunch.io/api/datasets/ac64ef/variables/aae3c2/"},
            {"value": 1}
        ]
    }
```

```http
GET /datasets/id/summary/?filter=%7B%22function%22%3A%22%3D%3D%22%2C%22args%22%3A%5B%7B%22variable%22%3A%22http%3A%2F%2Fbeta.crunch.io%2Fapi%2Fdatasets%2Fac64ef%2Fvariables%2Faae3c2%2F%22%7D%2C%7B%22value%22%3A1%7D%5D%7D HTTP/1.1
```

Filter expressions can be combined with filter URLs to make reference to other filters, like so:


```json
    {
        "function": "and",
        "args": [
            {
                "filter": "http://beta.crunch.io/api/datasets/ac64ef/filters/28ef72/"
            },
           {
                "function": "==",
                "args": [
                    {"variable": "http://beta.crunch.io/api/datasets/ac64ef/variables/aae3c2/"},
                    {"value": 1}
                ]
            }
        ]
    }    
```

```http
GET /datasets/id/summary/?filter=%7B%22function%22%3A+%22and%22%2C+%22args%22%3A+%5B%7B%22filter%22%3A+%22http%3A%2F%2Fbeta.crunch.io%2Fapi%2Fdatasets%2Fac64ef%2Ffilters%2F28ef72%2F%22%7D%2C+%7B%22function%22%3A+%22%3D%3D%22%2C+%22args%22%3A+%5B%7B%22variable%22%3A+%22http%3A%2F%2Fbeta.crunch.io%2Fapi%2Fdatasets%2Fac64ef%2Fvariables%2Faae3c2%2F%22%7D%2C+%7B%22value%22%3A+1%7D%5D%7D%5D%7D HTTP/1.1
```
