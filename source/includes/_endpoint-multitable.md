## Multitables

### Catalog

`/datasets/{dataset_id}/multitables/`

#### GET

```json
{
    "element": "shoji:catalog",
    "self": "/api/datasets/123/multitables/",
    "specification": "/api/specifications/multitables/",
    "description": "List of multitable definitions for this dataset",
    "index": {
        "/api/datasets/123/multitables/7ab1e/": {
            "is_public": false,
            "owner_id": "/api/users/b055/",
            "name": "Basic Demographics",
            "id": "7ab1e"
        }
    }
}
```

GET on this resource returns a Shoji Catalog with the list of Multitables that the
current user can use on this Dataset.

This index contains two kinds of multitables: those that belong to the dataset, denoted by the `is_public` tuple attribute; and those that belong to the current user. Personal multitables are those created by the authenticated user, and they cannot be accessed by other users. Dataset multitables are available to all users who are authorized to view the dataset.

#### POST

POST a Shoji Entity to this catalog to create a new multitable definition. 
Entities must include a `name` and `template`; the [template](#template-query) 
must contain a series of objects with a `query` and optionally 
[`transform`](#transforming-analyses-for-presentation). If omitted, `is_public` 
defaults to `false`. A successful POST yields a 201 response
that will contain a Location header with the URL of the newly created multitable.

All users with access to the dataset can create personal multitable definitions; 
however, only the current dataset editor can create public multitables 
(`is_public: true`) which everyone with access to the dataset can see. 
Attempting to create a public multitable when not the current dataset editor 
results in a 403 response.

##### Copying Multitables between datasets

It is possible to copy over a multitables between datasets as long as the 
permissions allow it.

Multitable copying requires that all the variables present in the `template`
of the origin multitable exist on the target dataset and that they all have
the same type.

POST a shoji entity to the catalog with indicating the URL of the multitable
to copy:

```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Name of my copy",
        "multitable": "/api/datasets/123/multitables/7ab1e/"
    }
}
```

As shown in the example, it is possible to assign a new name to the copy.
By default all copies will be private unless specified in the body.

#### PATCH

There are no elements of the catalog that can be changed via PATCH.

### Entity

`/datasets/{dataset_id}/multitables/{multitable_id}/`

#### GET

```json
{
    "element": "shoji:entity",
    "self": "datasets/123/multitables/7ab1e/",
    "views": {
        "tabbook": "/datasets/123/multitables/7ab1e/tabbook/"
    },
    "specification": "https://app.crunch.io/api/specifications/multitables/",
    "description": "Detail information for one multitable definition",
    "body": {
        "name": "Basic Demographics",
        "user": "/api/users/b055/",
        "template": [{
            "query": [{
                "variable": "/datasets/123/variables/abc/"
            }]
        }, {
            "query": [{
                "variable": "/datasets/123/variables/def/"
            }]
        }],
        "is_public": false,
        "id": "7ab1e"
    }
}
```

GET on this resource returns a Shoji entity containing the requested multitable definition.

#### PATCH

PATCH the entity to edit its `name`, `template`, or `is_public` attributes. Successful PATCH requests
return 204 status. As with the POSTing new entities to the catalog, only the dataset's current editor can alter `is_public`.

The `template` attribute must contain a valid multitable definition.

#### Views

Multitable entities have a "tabbook" view. See below.
