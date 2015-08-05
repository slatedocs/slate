## Datasets
Datasets are the primary containers of statistical data in Crunch. Datasets contain a collection of [variables](#variables), with which analyses can be composed, saved, and exported. These analyses may include filters, which users can define and persist. Users can also share datasets with each other.

Datasets are comprised of one or more batches of data uploaded to Crunch, and additional batches can be appended to datasets. Similarly, variables from other datasets can be joined onto a dataset.

As with other objects in Crunch, references to the set of [dataset entities](#dataset-entity) are exposed in a catalog. This catalog can be organized and ordered.

### Catalog

#### GET
```http
GET /datasets/ HTTP/1.1
```
```shell
```
```r
library(crunch)
login()

# Upon logging in, a GET /datasets/ is done automatically, to populate:
listDatasets() # Shows the names of all datasets you have
listDatasets(refresh=TRUE) # Refreshes that list (and does GET /datasets/)

# To get the raw Shoji object, should you need it,
crGET("https://beta.crunch.io/api/datasets/")
```

```python
```

```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/datasets/",
    "views": {
        "order": "https://beta.crunch.io/api/datasets/order/"
    },
    "index": {
        "https://beta.crunch.io/api/datasets/cc9161/": {
            "owner_display_name": "James T. Kirk",
            "name": "The Voyage Home",
            "description": "Stardate 8390",
            "archived": false,
            "permissions": {
                "edit": false
            },
            "id": "cc9161",
            "owner_id": "https://beta.crunch.io/api/users/685722/"
        },
        "https://beta.crunch.io/api/datasets/a598c7/": {
            "owner_display_name": "Spock",
            "name": "The Wrath of Khan",
            "description": "",
            "archived": false,
            "permissions": {
                "edit": true
            },
            "id": "a598c7",
            "owner_id": "https://beta.crunch.io/api/users/af432c/"
        }
    }
}
```

`GET /datasets/`

When authenticated, GET returns 200 status with a Shoji Catalog of datasets to which the authenticated user has access. Catalog tuples contain the following attributes:

Name | Type | Default | Description
---- | ---- | ------- | -----------
name | string |  | Required. The name of the dataset
description | string | "" | A longer description of the dataset
id | string |  | The dataset's id
archived | bool | false | Whether the dataset is "archived" or active
permissions | object | {"edit": false} | Authorizations on this dataset
owner_id | url |  | URL of the user entity of the dataset's owner
owner_display_name | string | "" | That user's name, for display

<aside class="notice">
    A user may have access to a dataset because someone has shared it directly with him, or because someone has shared it with a team of which he is a member. If a user has access to a dataset from different sources, be it by multiple teams or by direct sharing, the final permissions they have on the dataset will be the maximum of all the permissions granted.
</aside>

#### PATCH
```http
PATCH /api/datasets/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
Content-Length: 231

{
    "element": "shoji:catalog",
    "index": {
        "https://beta.crunch.io/api/datasets/a598c7/": {
            "description": "Stardate 8130.4"
        }
    }
}

```

```http
HTTP/1.1 204 No Content
```
```r
library(crunch)
login()

# Dataset objects contain information from
# the catalog tuple and the dataset entity.
# Editing attributes by <- assignment will
# PATCH or PUT the right payload to the
# right place--you don't have to think about
# catalogs and entities.
ds <- loadDataset("The Wrath of Khan")
description(ds)
## [1] ""
description(ds) <- "Stardate 8130.4"
description(ds)
## [1] "Stardate 8130.4"

# If you needed to touch HTTP more directly,
# you could:
payload <- list(
    `https://beta.crunch.io/api/datasets/a598c7/`=list(
        description="Stardate 8130.4"
    )
)
crPATCH("https://beta.crunch.io/api/datasets/",
    body=toJSON(payload))
```
```shell
```
```python
```

`PATCH /datasets/`

Use PATCH to edit the "name", "description", or "archived" state of one or more datasets. A successful request returns a 204 response. The attributes changed will be seen by all users with access to this dataset; i.e., names, descriptions, and archived state are not merely attributes of your view of the data but of the datasets themselves.

Authorization is required: you must have "edit" privileges on the dataset(s) being modified, as shown in the "permissions" object in the catalog tuples. If you try to PATCH and are not authorized, you will receive a 403 response and no changes will be made. 

The tuple attributes other than "name", "description", and "archived" cannot be modified here by PATCH. Attempting to modify other attributes, or including new attributes, will return a 400 response. Changing permissions is accomplished by PATCH on the permissions catalog, and changing the owner is a PATCH on the dataset entity. The "owner_display_name" is modifiable, assuming authorization, by PATCH on the associated user entity. Dataset "id" is immutable.

When PATCHing, you may include only the keys in each tuple that are being modified, or you may send the complete tuple. As long as the keys that cannot be modified via PATCH here are not modified, the request will succeed.

Note that, unlike other Shoji Catalog resources, you cannot PATCH to add new datasets, nor can you PATCH a null tuple to delete them. Attempting either will return a 400 response. Creating datasets is allowed only by POST to the catalog, while deleting datasets is accomplished via a DELETE on the dataset entity.

#### POST
```http
POST /api/datasets/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
Content-Length: 88

{
    "element": "shoji:entity",
    "body": {
        "name": "Trouble with Tribbles",
        "description": "Stardate 4523.3"
    }
}

```

```http
HTTP/1.1 201 Created
Location: https://beta.crunch.io/api/datasets/223fd4/

```
```r
library(crunch)
login()

# To create just the dataset entity, you can
ds <- createDataset("Trouble with Tribbles",
    description="Stardate 4523.3")

# More likely, you'll have a data.frame or
# similar object in R, and you'll want to send
# it to Crunch. To do that, 
df <- read.csv("~/tribbles.csv")
ds <- newDataset(df, name="Trouble with Tribbles",
    description="Stardate 4523.3")
```
```shell
```
```python
```

`POST /datasets/`

POST a JSON object to create a new Dataset; a 201 indicates success, and the returned Location header refers to the new Dataset resource.

The body must contain a "name", and additional parameters "description" and "archived" are allowed. You can also include a Crunch Table in a "table" key, as discussed in the Feature Guide. Sending any other attribute will return a 400 response.

### Entity

#### GET

`GET /datasets/{dataset_id}/`

##### URL Parameters

Parameter | Description
--------- | -----------
dataset_id | The id of the dataset

##### Dataset attributes

Name | Type | Default | Description
---- | ---- | ------- | -----------
name | string | | Required. The name of the dataset
description | string | "" | A longer description of the dataset

#### PATCH

`PATCH /datasets/{dataset_id}/`

#### DELETE

`DELETE /datasets/{dataset_id}/`
