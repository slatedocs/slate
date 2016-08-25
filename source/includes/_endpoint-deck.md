## Decks

Decks allow you to store [analyses](#analysis) for future reference or for export.
Decks correspond to a single dataset, and they are personal to each user unless they have been set as "public". Each deck contains a list of slides, and each slide contains analyses.

### Catalog

`/datasets/{id}/decks/`

#### GET

A GET request on the catalog endpoint will return all the decks available for
this dataset for the current user. This includes decks created by
the user, as well as public decks shared with all users of the dataset.

```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/datasets/223fd4/decks/",
    "index": {
        "https://beta.crunch.io/api/datasets/cc9161/decks/4fa25/": {
          "name": "my new deck",
          "creation_time": "1986-11-26T12:05:00",
          "id": "4fa25",
          "is_public": false,
          "owner_id": "https://beta.crunch.io/api/users/abcd3/",
          "owner_name": "Real Person"
        },
        "https://beta.crunch.io/api/datasets/cc9161/decks/2b53e/": {
          "name": "Default deck",
          "creation_time": "1987-10-15T11:45:00",
          "id": "2b53e",
          "is_public": true,
          "owner_id": "https://beta.crunch.io/api/users/4cba5/",
          "owner_name": "Other Person"
        }
    },
    "order": "https://beta.crunch.io/api/datasets/223fd4/decks/order/"
}
```

The decks catalog tuples contain the following keys:


Name | Type | Description
---- | ---- | -----------
name | string | Human-friendly string identifier
creation_time | timestamp | Time when this deck was created
id | string | Global unique identifier for this deck
is_public | boolean | Indicates whether this is a public deck or not
owner_id | url | Points to the owner of this deck
owner_name | string | Name of the owner of the deck (referred by `owner_id`)

To determine if a deck belongs to the current user, check the `owner_id` attribute.

#### POST

POST a shoji:entity to create a new deck for this dataset. The only required body attribute is "name"; other attributes are optional.

```json
{
    "element": "shoji:entity",
    "self": "https://beta.crunch.io/api/datasets/223fd4/decks/",
    "body": {
        "name": "my new deck",
        "description": "This deck will contain analyses for a variable",
        "is_public": false
    }
}
```

```http
HTTP/1.1 201 Created
Location: https://beta.crunch.io/api/datasets/223fd4/decks/2b3c5e/

```

The `shoji:entity` POSTed accepts the following keys

Name | Type | required | Description
---- | ---- | -----------
name | string | Yes | Human-friendly string identifier
description | string | No | Optional longer string with additional notes
is_public | boolean | No | If `true`, all users with view access to this dataset will be able to read and export this deck and its analyses; if `false`, the default value, the deck remains private for the current user only.


#### PATCH

It is possible to bulk-edit many decks at once by PATCHing a shoji:catalog to
the decks' catalog.

```json
{
    "element": "shoji:catalog",
    "index": {
        "https://beta.crunch.io/api/datasets/cc9161/decks/4fa25/": {
          "name": "Renamed deck",
          "is_public": true,
        }
    },
    "order": "https://beta.crunch.io/api/datasets/223fd4/decks/order/"
}
```

The following attributes are editable via PATCHing this resource:

 * name
 * description
 * is_public

For decks that the current user owns, "name", "description", and "is_public" are editable. Users with edit permissions on the dataset may edit "name" and "description" of public decks, but they cannot edit "is_public" unless they own the deck. Other deck attributes are not editable and will respond with 400 status if the request tries to change them.

On success, the server will reply with a 204 response.

### Entity

`/datasets/{id}/decks/{id}/`

#### GET

GET a deck entity resource to return a shoji:entity with all of its attributes:

```json
{
    "element": "shoji:entity",
    "self": "https://beta.crunch.io/api/datasets/223fd4/decks/223fd4/",
    "body": {
        "name": "Presentation deck",
        "id": "223fd4",
        "creation_time": "1987-10-15T11:45:00",
        "description": "Explanation about the deck",
        "is_public": false,
        "owner_id": "https://beta.crunch.io/api/users/abcd3/",
        "owner_name": "Real Person"
    }
}
```

Name | Type | Description
---- | ---- | -----------
name | string | Human-friendly string identifier
id | string | Global unique identifier for this deck
creation_time | timestamp | Time when this deck was created
description | string | Longer annotations for this deck
is_public | boolean | Indicates whether this is a public deck or not
owner_id | url | Points to the owner of this deck
owner_name | string | Name of the owner of the deck (referred by `owner_id`)

#### PATCH

To edit a deck, PATCH it with a
shoji:entity. The server will return a 204 response on success or 400
if the request is invalid.

```json
{
    "element": "shoji:entity",
    "self": "https://beta.crunch.io/api/datasets/223fd4/decks/223fd4/",
    "body": {
        "name": "Presentation deck",
        "id": "223fd4",
        "creation_time": "1987-10-15T11:45:00",
        "description": "Explanation about the deck"
    }
}
```
```http
HTTP/1.1 204 No Content
```

As with the catalog, for decks that the current user owns, "name", "description", and "is_public" are editable. Users with edit permissions on the dataset may edit "name" and "description" of public decks, but they cannot edit "is_public" unless they own the deck. Other deck attributes are not editable.

#### DELETE

To delete a deck, DELETE the deck's entity URL. On success, the server returns
a 204 response.

### Order

`/datasets/{id}/decks/order/`

The deck order resource allows the user to arrange how API clients, such as the web application, will present the deck catalog. The deck order contains all decks that are visible to the current user, both personal and public. Unlike many other
`shoji:order` resources, this order does not allow grouping or nesting: it
will always be a flat list of slide URLs.

#### GET

Returns a [Shoji Order](#shoji-order) response.

```json
{
  "element": "shoji:order",
  "self": "https://beta.crunch.io/api/datasets/223fd4/decks/order/",
  "graph": [
    "https://beta.crunch.io/api/datasets/223fd4/decks/1/",
    "https://beta.crunch.io/api/datasets/223fd4/decks/2/",
    "https://beta.crunch.io/api/datasets/223fd4/decks/3/"
  ]
}

```

#### PATCH

PATCH the order resource to change the order of the decks. A 204 response indicates success.

If the PATCH payload contains only a subset of available decks, those
decks not referenced will be appended at the bottom of the top level graph in arbitrary
order.

```json
{
  "element": "shoji:order",
  "self": "https://beta.crunch.io/api/datasets/223fd4/decks/order/",
  "graph": [
    "https://beta.crunch.io/api/datasets/223fd4/decks/1/",
    "https://beta.crunch.io/api/datasets/223fd4/decks/3/"
  ]
}
```

Including invalid URLs, such as URLs of decks that are not present in the catalog, will
 return a 400 response from the server.

The deck order should always be a flat list of URLs. Nesting or grouping is not
supported by the web application. Server will return a 400 response if the order supplied in the PATCH request has nesting.

## Slides

Each deck contains a catalog of slides into which analyses are saved.

### Catalog

`/datasets/{id}/decks/{deck_id}/slides/`

#### GET

Returns a `shoji:catalog` with the slides for this deck.

```json

{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/datasets/123/decks/123/slides/",
    "orders": {
        "flat": "https://beta.crunch.io/api/datasets/123/decks/123/slides/flat/"
    },
    "specification": "https://beta.crunch.io/api/specifications/slides/",
    "description": "A catalog of the Slides in this Deck",
    "index": {
        "https://beta.crunch.io/api/datasets/123/decks/123/slides/123/": {
            "analysis_url": "https://beta.crunch.io/api/datasets/123/decks/123/slides/123/analyses/123/",
            "subtitle": "z",
            "display": {
                "value": "table"
            },
            "title": "slide 1"
        },
        "https://beta.crunch.io/api/datasets/123/decks/123/slides/456/": {
            "analysis_url": "https://beta.crunch.io/api/datasets/123/decks/123/slides/456/",
            "subtitle": "",
            "display": {
                "value": "table"
            },
            "title": "slide 2"
        }
    }
}

```

Each tuple on the slides catalog contains the following keys:

Name | Type | Description
---- | ---- | -----------
analysis_url | url | Points to the first (and typically only) analysis contained on this slide
title | string | Optional title for the slide
subtitle | string | Optional subtitle for the slide
display | object | Stores settings used to load the analysis

#### POST

To create a new slide, POST an analysis to the slides catalog. The payload, described in the [below](#analyses) section, should be wrapped as a shoji:entity.

On success, the server returns a 201 response with a Location header containing the URL of the newly created slide entity.

Only a `query` field is required to create a new slide; other attributes are optional.


Name | Type | Description
---- | ---- | -----------
query | object | Contains a valid analysis query, required
title | string | Optional title for the slide
subtitle | string | Optional subtitle for the slide
display_settings | object | Contains a set of attribtues to be interpreted by the client to render and export the analysis
query_environment | object | Contains the `weight` and `filter` applied during the analysis, they will be applied up on future evaluation/render/export

#### PATCH

It is possible to bulk-edit several slides at once by PATCHing a shoji:catalog
to this endpoint.

The only editable attributes with this method are:

 * title
 * subtitle

Other attributes should be considered read-only.

Submitting invalid attributes or references to other slides results in a 400 error response.

### Entity

`/datasets/223fd4/decks/slides/a126ce/`

Each slide in the Slide Catalog contains reference to its first analysis.

#### GET

```json
{
    "element": "shoji:entity",
    "self": "/api/datasets/123/decks/123/slides/123/",
    "catalogs": {
        "analyses": "/api/datasets/123/decks/123/slides/123/analyses/"
    },
    "description": "Returns the detail information for a given slide",
    "body": {
        "deck_id": "123",
        "subtitle": "z",
        "title": "slide 1",
        "analysis_url": "/api/datasets/123/decks/123/slides/123/analyses/123/",
        "display": {
            "value": "table"
        },
        "id": "123"
    }
}
```

#### DELETE

Perform a DELETE request on the Slide entity resource to delete the slide and its analyses.

#### PATCH

It is possible to edit a slide entity by PATCHing with a shoji:entity.

The editable attributes are:

 * title
 * subtitle

The other attributes are considered read-only.


### Order

`/datasets/223fd4/decks/slides/flat/`

The owner of the deck can specify the order of its slides. As with deck order, the slide order must be a flat list of slide URLs.


#### GET

Returns the list of all the slides in the deck.

```json
{
    "element": "shoji:order",
    "self": "/api/datasets/123/decks/123/slides/flat/",
    "description": "Order of the slides on this deck",
    "graph": [
        "/api/datasets/123/decks/123/slides/123/",
        "/api/datasets/123/decks/123/slides/456/"
    ]
}
```

#### PATCH

To make changes to the order, a client should PATCH the full `shoji:order`
resource to the endpoint with the new order on its `graph` attribute.

Any slide not mentioned on the payload will be added at the end of the graph
in arbitrary order.


```json
{
    "element": "shoji:order",
    "self": "/api/datasets/123/decks/123/slides/flat/",
    "description": "Order of the slides on this deck",
    "graph": [
        "/api/datasets/123/decks/123/slides/123/",
        "/api/datasets/123/decks/123/slides/456/"
    ]
}
```

This is a flat order: grouping or nesting is not allowed. PATCHing with a nested order will generate a 400 response.

## Analysis

Each slide contains one or more analyses. An analysis -- a table or graph with some specific combination of variables
defining measures, rows, columns, and tabs; settings such as percentage
direction and decimal places -- can be saved to a _deck_, which can then be
exported, or the analysis can be reloaded in whole in the application or even
exported as a standalone embeddable result.

An analysis is defined by a _query_, _query environment_, and _display settings_.
To save an analysis, `POST` these to a deck.

<aside class="notice">
Analysis queries are described in detail in the
[feature guide](#multidimensional-analysis). [Filters](#filters) may contain a
mix of stored filters or expressions. Expressions may contain an optional
`name` which may be used to label results.
</aside>

Display settings can be anything a client may need to reproduce the view of the
data returned from the query. The settings the Crunch web client uses are shown
here, but other clients are free to store other attributes as they see fit.
Display settings should be objects with a `value` member.


```json
{
    "query": {
        "dimensions" : [],
        "measures": {}
    },
    "query_environment": {
        "filter": [
            {"filter": "<url>"},
            {"function": "expression", "args": [], "name": "(Optional)"}
        ],
        "weight": "url"
    },
    "display_settings": {
        "decimalPlaces": {
            "value": 0
        },
        "percentageDirection": {
            "value": "colPct"
        },
        "vizType": {
            "value": "table"
        },
        "countsOrPercents": {
            "value": "percent"
        },
        "uiView": {
        	"value": "expanded"
	    }
    }
}
```

Name | Description
-----|-------------
query | Includes the query body for this analysis
query_environment | An object with a `weight` and `filters` to be used for rendering/evaluating this analysis
display_settings | An object containing client specific instructions on how to recreate the analysis


### PATCH

To edit an analysis, PATCH its URL with a shoji:entity.

The editable attributes are:

 * query
 * query_environment
 * display_settings

Providing invalid values for those attributes or extra attributes will be rejected with a 400 response from the server.

### DELETE

It is possible to delete analyses from a slide as long as there is always
one analysis left.

Attempting to delete the last analysis of a slide will cause a 409 response
from the server indicating the problem.
