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
    "owner_id": http://...../users/owner_id/,
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
    "id": "ac64ef..."
    "dataset_id": "8c6c9e3..."
    "version": "master__tip",
    "name": "Fitler name",
    "is_exclusion": false,
    "is_public": false,
    "expression": {....}
    "last_update": "2015-12-31...."
}
```

PATCH will allow to edit the `expression`, `name` and `is_public` attribute of
the entity. As with the catalog, only the current editor can make filters public.
The `expression` attribute must contain a valid ZCL filter expression.


### Applied filters

`/datasets/{id}/filters/{id}/applied/`

A Shoji order containing the filters applied by the current user.
