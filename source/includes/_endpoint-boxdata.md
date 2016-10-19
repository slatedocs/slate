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
header | header information for the CrunchBox
footer | footer information for the CrunchBox
dataset | URL of the dataset associated with the CrunchBox
filters | A Crunch expression indicating which filters to include in the CrunchBox
where | A Crunch expression indicating which variables to include in the CrunchBox


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
 the existing combination will result in a modification of metadata associated with the cube data.

##### POST parameters

Name | Type | Description
---- | ---- | -----------
title | string | Human friendly identifier
notes | string | Other information relevent for this CrunchBox
header | header information for the CrunchBox
footer | footer information for the CrunchBox
dataset | URL of the dataset associated with the CrunchBox
filters | A Crunch expression indicating which filters to include in the CrunchBox
where | A Crunch expression indicating which variables to include in the CrunchBox


```json

{
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
    "force": false,
    "title": "z and str",
    "notes": "just a couple of variables",
    "header": "This is for the header",
    "footer": "This is for the footer"
}