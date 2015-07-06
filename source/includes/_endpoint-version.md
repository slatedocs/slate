## Versions

Datasets have a collection of versions, points in time to which you can roll back. 

### Catalog

#### GET

`GET /datasets/{dataset_id}/savepoints/?limit,skip`

When authenticated, GET returns 200 status with a (paginated) Shoji Catalog of versions to which the dataset can be reverted. Catalog tuples contain the following attributes:

Name | Type | Default | Description
---- | ---- | ------- | -----------
user_display_name | string | "" | The name of the user who saved this version
description | string | | An informative note about the version, as in a commit message
version | string |  | An internal identifier for the saved version
last_update | datetime | | Timestamp for when the version was created
revert | url | | URL to POST to in order to roll back to this version. See below.

Query parameters:

Name | Type | Default | Description
---- | ---- | ------- | -----------
limit | integer | 10 | How many versions to include in the catalog response
skip | integer | 0 | How many versions to skip before returning `limit` versions

For pagination purposes, catalog tuples are sorted from most to least recent. However, since JSON objects are unordered, you cannot rely on the order of the tuples within the payload you receive.

#### POST

`POST /datasets/{dataset_id}/savepoints/`

To create a new version, POST a JSON object to the versions catalog. Object attributes may contain: 

Name | Type | Required | Description
---- | ---- | -------- | -----------
description | string | No | An informative note about the version, as in a commit message

A successful POST will return 201 status with the URL of the newly created version entity in the Location header. If the current user is not an editor of the dataset, POSTing will return a 403 status. 

#### PATCH

No version attributes may be modified by PATCHing the catalog. PATCH will return a 405 status. 

### Entity

#### GET

`GET /datasets/{dataset_id}/savepoints/{version_id}/`

Version entities expose a subset of attributes found in the catalog tuples:

Name | Type | Default | Description
---- | ---- | ------- | -----------
user_display_name | string | "" | The name of the user who saved this version
description | string | | An informative note about the version, as in a commit message
version | string |  | An internal identifier for the saved version

#### PATCH

`PATCH /datasets/{dataset_id}/savepoints/{version_id}/`

The version's "description" may be modified by PATCHing its entity. A successful request returns 204 status. If the current user is not an editor of the dataset, PATCHing will return a 403 status. 

### Reverting

`POST /datasets/{dataset_id}/savepoints/{version_id}/revert/`

To roll back to a saved version, POST an empty body to the version's "revert" URL, found both inside the catalog tuple and in the "views" attribute of the entity. A successful request will return 204 status.
