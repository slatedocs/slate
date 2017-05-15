## Boxdata

Boxdata is the data that Crunch provides to the CrunchBox for rendering
web components that are made publicly available.  This endpoint provides
a catalog of data that has been precomputed to provide visualizations
cubes of json data.  Metadata associated with this raw computed data is accessed
and manipulated through this endpoint.

### Catalog

`/datasets/{id}/boxdata/`

A Shoji Catalog of boxdata for a given dataset.

#### GET catalog

When authenticated and authorized to view the given dataset, GET returns 200
status with a Shoji Catalog of boxdata associated with the dataset. If authorization is
lacking, response will instead be 404.

Catalog tuples contain the following keys:

Name | Type | Description
---- | ---- | -----------
title | string | Human friendly identifier
notes | string | Other information relevent for this CrunchBox
header | string | header information for the CrunchBox
footer | string | footer information for the CrunchBox
dataset | string | URL of the dataset associated with the CrunchBox
filters | object | A Crunch expression indicating which filters to include in the CrunchBox
where | object | A Crunch expression indicating which variables to include in the CrunchBox. An undefined value is equavilent to specifying all dataset variables.
creation_time | string | A timestamp of the date when this CrunchBox was created


```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/boxdata/",
    "index": {
        "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/boxdata/44a4d477d70c85da4b8298677e527ad8/": {
            "user_id": "00002",
            "footer": "This is for the footer",
            "notes": "just a couple of variables",
            "title": "z and str",
            "dataset": "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/",
            "header": "This is for the header",
            "creation_time": "2017-03-14T00:13:42.024000+00:00",
            "filters": {
                "function": "identify",
                "args": [
                    {
                        "filter": [
                            "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/filters/da9d86e43381443d9d708dc29c0c6308/",
                            "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/filters/80638457c8bd4731990eebdc3baee839/"
                        ]
                    }
                ]
            },
            "where": {
                "function": "identify",
                "args": [
                    {
                        "id": [
                            "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/variables/000002/",
                            "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/variables/000003/"
                        ]
                    }
                ]
            },
            "id": "44a4d477d70c85da4b8298677e527ad8"
        },
        "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/boxdata/75ff1d67ed698e0986f1c1c3daebf9a2/": {
            "user_id": "00002",
            "title": "xz",
            "dataset": "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/",
            "filters": null,
            "creation_time": "2017-03-14T00:13:42.024000+00:00",
            "where": {
                "function": "identify",
                "args": [
                    {
                        "id": [
                            "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/variables/000000/"
                        ]
                    }
                ]
            },
            "id": "75ff1d67ed698e0986f1c1c3daebf9a2"
        }
    }
}
```

#### POST catalog

Use POST to create a new datasource for crunchbox.  Note that new boxdata is only created when there is a new
 combination of where and filter data.  If the same variables and filteres are indicated by the POST data,
 the existing combination will result in a modification of metadata associated with the cube data.  This is to keep
 avoid recomputing analysis needlessly.

A POST to this resource must be a Shoji Entity with the following "body" attributes:

Name  | Description
----  | -----------
title | Human friendly identifier
notes | Other information relevent for this CrunchBox
header | header information for the CrunchBox
footer | footer information for the CrunchBox
dataset | URL of the dataset associated with the CrunchBox
filters | A Crunch expression indicating which **filters** to include
where | A Crunch expression indicating which **variables** to include
display_settings | Options to customize how it looks and behaves


```json

{
    "element": "shoji:entity",
    "body": {
        "where": {
            "function": "select",
            "args": [{
                "map": {
                  "000002": {"variable": "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/variables/000002/"},
                  "000003": {"variable": "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/variables/000003/"}
                }
            }]
        },
        "filters": [
          {"filter": "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/filters/da9d86e43381443d9d708dc29c0c6308/"},
          {"filter": "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/filters/80638457c8bd4731990eebdc3baee839/"}
        ],
        "force": false,
        "title": "z and str",
        "notes": "just a couple of variables",
        "header": "This is for the header",
        "footer": "This is for the footer"
    }
}
```

#### Display Settings

The `display_settings` member of a CrunchBox payload allows you to customize several aspects of how it will be displayed.

A `minBaseSize` member will suppress display of values in tables or graphs where the sample size is below a given threshold.

To customize a CrunchBox’s color scheme, you may include an optional `palette` member in the `display_settings` of the body of the request to create or edit the boxdata. There are four types of customization available.

```json
{"display_settings": {
    "minBaseSize": {"value": 50},
    "palette": {
        "brand": ["#111111", "#222222", "#333333"],
        "static_colors": ["#444444", "#555555", "#666666"],
        "base": ["#777777", "#888888", "#999999"],
        "category_lookup": {
            "category name": "#aaaaaa",
            "another category:": "bbbbbb"
        }
    }
}}
```

##### Brand

The CrunchBox interface uses three colors, in order. By default, these are Crunch brand colors of green, blue, and purple. These are used, for example, as the background colors at the top of the interface and the color of the filter selector.

##### Static colors

Include an array of `static_colors` and each categorical color will be taken from the list in order.

##### Base

If the number of categories exceeds the number of static colors, or no static colors are specified, “base” colors are used to generate a categorical palette. By default, these are also the Crunch green, blue, and purple, and are not overridden by `brand`. Each color is interpolated in HCL space from itself to Hue + 100, Lightness + 20; and then colors are ordered to maximize sequential absolute distance in L*a*b* space so adjacent colors can be easily distinguished.

##### Category Lookup

Finally, you may include an object where keys are exact category names that should always be assigned a specific color. Using semantically resonant colors in this manner is a boon for interpretation and is highly recommended when possible. For example, to ensure that the Green Party is a verdant shade, include a member such as `"Green": "#00dd00"`. Building a category lookup list requires some attention to the specific categories in a dataset; they must match exactly, and not partially; to ensure that “Green Party” is also green, include an additional `"Green Party"` key with the same value. Lookup values are processed **last**, replacing erstwhile static or generated colors.

### Entity

`/datasets/{id}/boxdata/{id}/`

This endpoint represents each of the boxdata entities listed in the catalog.

The body of any of the entities is the same as the catalog's tuple:

#### GET

Returns the body of the boxdata entity

```json
{
    "user_id": "00002",
    "footer": "This is for the footer",
    "notes": "just a couple of variables",
    "title": "z and str",
    "dataset": "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/",
    "header": "This is for the header",
    "filters": {
        "function": "identify",
        "args": [
            {
                "filter": [
                    "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/filters/da9d86e43381443d9d708dc29c0c6308/",
                    "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/filters/80638457c8bd4731990eebdc3baee839/"
                ]
            }
        ]
    },
    "where": {
        "function": "identify",
        "args": [
            {
                "id": [
                    "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/variables/000002/",
                    "https://beta.crunch.io/api/datasets/e7834a8b5aa84c50bcb868fc3b44fd22/variables/000003/"
                ]
            }
        ]
    },
    "id": "44a4d477d70c85da4b8298677e527ad8"
}
```

#### DELETE

Deletes the boxdata entity. Returns 204.
