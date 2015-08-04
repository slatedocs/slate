## Comparisons

### Entity

`/datasets/{id}/comparisons/{id}/`

A Shoji Entity with the following "body" attributes:

Name | Type | Description
---- | ---- | -----------
name | string |
bases | array of cube input objects | one for each analysis to which the comparison applies
overlay | cube | input object defining the comparison data

See the Feature Guide for a discussion of the cube objects. POST one to the catalog (see below) to create a new comparison. GET to retrieve the complete Entity. PUT a new one to replace it. PATCH a subset of the attributes as desired. DELETE to remove the comparison.

The Entity also includes a "cube" link in its "catalogs" object; a GET on this link returns the output of the overlay cube. See "Cube" next.

#### Cube

`/datasets/{id}/comparisons/{id}/cube/`

A GET on this endpoint returns the output of the "overlay" cube query for the given comparison. The response will be a Crunch Cube with "dimensions" and "measures" members.

### Catalog

`/datasets/{id}/comparisons/`

A Shoji Catalog of comparison entities associated to the specified dataset.

#### GET catalog

When authenticated and authorized to view the given dataset, GET returns 200 status with a Shoji Catalog of the dataset's comparisons. If authorization is lacking, response will instead be 404.

Catalog tuples contain the following keys:

Name | Type | Description
---- | ---- | -----------
name | string | Human-friendly string identifier
bases | array of cube input objects | References to the dimensions and measures for which the comparison is valid
cube | URL | Link to generate the comparison data

The catalog looks something like this:

```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/datasets/5ee0a0/comparisons/",
    "specification": "https://beta.crunch.io/api/specifications/comparisons/",
    "description": "List of the comparisons for this dataset",
    "index": {
        "491fe3/": {
            "name": "All actors",
            "bases": [{
                "dimensions": [{"variable": "../variables/0f7378/"}, {"variable": "../variables/8451cb/"}],
                "measures": {"count": {"function": "cube_count", "args": []}}
            }],
            "cube": "491fe3/cube/"
        },
        "9942ce/": {
            "name": "Awareness: sector average",
            "bases": [{
                "dimensions": [{"variable": "../variables/bf31fc/"}],
                "measures": {"count": {"function": "cube_count", "args": []}}
            }],
            "cube": "9942ce/cube/",
        }
    }
}
```

#### PATCH catalog

Use PATCH to edit the "name" and/or "bases" of one or more comparisons. A successful request returns a 204 response. 

Authorization is required: you must have "edit" privileges on the dataset, as shown in the "permissions" object in the dataset's catalog tuple. If you try to PATCH and are not authorized, you will receive a 403 response and no changes will be made.

Because this catalog contains its entities rather than collecting them, do not PATCH to add or delete comparisons. POST to the catalog to create new comparisons, and DELETE individual comparison entities.

#### POST catalog

Use POST to add a new comparison entity to the catalog. A 201 indicates success and includes the URL of the newly-created comparison in the Location header.