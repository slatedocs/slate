## Datasets
Datasets are the primary containers of statistical data in Crunch. Datasets
contain a collection of [variables](#variables), with which analyses can be
composed, saved, and exported. These analyses may include filters, which users
can define and persist. Users can also share datasets with each other.

Datasets are comprised of one or more batches of data uploaded to Crunch, and
additional batches can be appended to datasets. Similarly, variables from other
datasets can be joined onto a dataset.

As with other objects in Crunch, references to the set of dataset entities are
exposed in a catalog. This catalog can be organized and ordered.

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
crGET("https://app.crunch.io/api/datasets/")
```

```python
```

```json
{
    "element": "shoji:catalog",
    "self": "https://app.crunch.io/api/datasets/",
    "catalogs": {
        "by_name": "https://app.crunch.io/api/datasets/by_name/{name}/"
    },
    "views": {
        "search": "https://app.crunch.io/api/datasets/search/"
    },
    "orders": {
        "order": "https://app.crunch.io/api/datasets/order/"
    },
    "specification": "https://app.crunch.io/api/specifications/datasets/",
    "description": "Catalog of Datasets that belong to this user. POST a Dataset representation (serialized JSON) here to create a new one; a 201 response indicates success and returns the location of the new object. GET that URL to retrieve the object.",
    "index": {
        "https://app.crunch.io/api/datasets/cc9161/": {
            "owner_name": "James T. Kirk",
            "name": "The Voyage Home",
            "description": "Stardate 8390",
            "archived": false,
            "permissions": {
                "edit": false,
                "change_permissions": false,
                "add_users": false,
                "change_weight": false,
                "view": true
            },
            "size": {
                "rows": 1234,
                "columns": 67
            },
            "is_published": true,
            "id": "cc9161",
            "owner_id": "https://app.crunch.io/api/users/685722/",
            "start_date": "2286",
            "end_date": null,
            "creation_time": "1986-11-26T12:05:00",
            "modification_time": "1986-11-26T12:05:00",
            "current_editor": "https://app.crunch.io/api/users/ff9443/",
            "current_editor_name": "Leonard Nimoy"
        },
        "https://app.crunch.io/api/datasets/a598c7/": {
            "owner_name": "Spock",
            "name": "The Wrath of Khan",
            "description": "",
            "archived": false,
            "permissions": {
                "edit": true,
                "change_permissions": true,
                "add_users": true,
                "change_weight":true,
                "view": true
            },
            "size": {
                "rows": null,
                "columns": null
            },
            "is_published": true,
            "id": "a598c7",
            "owner_id": "https://app.crunch.io/api/users/af432c/",
            "start_date": "2285-10-03",
            "end_date": "2285-10-20",
            "creation_time": "1982-06-04T09:16:23.231045",
            "modification_time": "1982-06-04T09:16:23.231045",
            "current_editor": null,
            "current_editor_name": null
        }
    },
    "template": "{\"name\": \"Awesome Dataset\", \"description\": \"(optional) This dataset is awesome because I made it, and you can do it too.\"}"
}
```

`GET /datasets/`

When authenticated, GET returns 200 status with a Shoji Catalog of datasets to
which the authenticated user has access. Catalog tuples contain the following
attributes:

Name | Type | Default | Description
---- | ---- | ------- | -----------
name | string |  | Required. The name of the dataset
description | string | "" | A longer description of the dataset
id | string |  | The dataset's id
archived | bool | false | Whether the dataset is "archived" or active
permissions | object | `{"edit": false}` | Authorizations on this dataset; see [Permissions](#permissions)
owner_id | URL |  | URL of the user entity of the dataset's owner
owner_name | string | "" | That user's name, for display
size | object | `{"rows": null, "columns": null}` | Dimensions of the dataset
creation_time | ISO-8601 string |  | Datetime at which the dataset was created in Crunch
modification_time | ISO-8601 string | | Datetime of the last modification for this dataset globally
start_date | ISO-8601 string |  | Date/time for which the data in the dataset corresponds
end_date | ISO-8601 string |  | End date/time of the dataset's data, defining a start_date:end_date range
current_editor | URL or null | | URL of the user entity that is currently editing the dataset, or `null` if there is no current editor
current_editor_name | string or null | | That user's name, for display
is_published | boolean | true | Indicates if the dataset is published to viewers or not

<aside class="notice">
    A user may have access to a dataset because someone has shared it directly
    with him, or because someone has shared it with a team of which he is a
    member. If a user has access to a dataset from different sources, be it by
    multiple teams or by direct sharing, the final permissions they have on the
    dataset will be the maximum of all the permissions granted.
</aside>

#### Search

You can perform a cross-dataset search of dataset metadata (including variables) via the search endpoint.
This search will return associated variables, groups, and dataset metadata.  A query string, along with filtering
properties can be provided to the search endpoint in order to refine the results.  The query string provided is only
used in plain-text format, any non-text or numeric characters are ignored at this time.

Results are limited only to those
datasets the user has access to.  Offset and limit parameters are also provided in order to provide performance-chunking
options.  Variable metadata is returned with these limits based on crunch's internal index (pre-filter), but are filtered to include
only variable results that match the given search term (post-index-filter).
This means that there may be less variable search results provided than the limit provided by the user.

Here are the parameters that can be passed to the search endpoint.

Parameter             | Type        | Description
----------------------|-------------|------------------------------------------------
q                     | string      | query string
f                     | json Object | used to filter the output of the search (see below)
limit                 | integer     | limit the number of results returned by the api to less than this amount (default 1000)
offset                | integer     | offset into the search index to start gathering results from pre-filter
group_variables_limit | integer     | number of non-matching variable results inside matching group names to return (default 10)

Allowable filter parameters:

Parameter   | Type             | Description
------------|------------------|-------------------------------------------------
dataset_ids | array of strings | limit results to particular dataset_ids or urls (user must have read access to that dataset)
team        | string           | url or id  of the team to limit results (user must have read access to the team)
project     | strint           | url or id of the project to limit results (user must have access to the project)

<aside class="notice">
The query string can only be alpha-numeric characters (including underscores) logical operators are not allowed at this time.
</aside>


##### Fields Searched

Here is a list of the fields that are searched by the Crunch search endpoint

Field             | Type            | Description                                             | Post-Filter?
------------------|-----------------|-------------------------------------------------------- | ----------
category_names    | List of Strings | Category names (associated with categorical variables)  | yes
dataset_id        | String          | ID of the dataset                                       | no
description       | String          | description of the variable                             | yes
id                | String          | ID of the variable                                      | no
name              | String          | name of the variable                                    | yes
owner             | String          | owner's ID of the variable                              | no
subvar_names      | List of Strings | Names of the subvariables associated with the variable  | yes
users             | List of Strings | User IDs having read-access to the variable             | no
group_names       | List of Strings | group names (from the variable ordering) associated with the variable | yes
dataset_labels    | List of Objects | dataset_labels associated with the user associated with the variable | no
dataset_name      | String          | dataset_name associated with this variable              | no
dataset_owner     | String          | ID of the owner of the dataset associated with the variable | no
dataset_users     | List of Strings | User IDs having read-access to the dataset associated with the variable | no
dataset_teams     | List of Strings | Team IDs having read-access to the dataset associated with the variable | no
dataset_projects  | List of Strings | Project IDs having read-access to the dataset associated with the variable | no

<aside class="notice">
Post-filter indicates whether post-index results are filtered by the field noted.  If the given query string does not
match at least one of the Post-filter fields, then it will be eliminated from the results, which limits the results to a
reasonable number when the dataset attributes match but no variable attributes match.
</aside>


```http
GET /datasets/search/?q={query}&f={filter}&limit={limit}&offset={offset}&group_variables_list={group_variables_list}  HTTP/1.1
```

```json
{
   "element": "shoji:view",
    "self": "https://app.crunch.io/api/datasets/search/?q=blue",
    "description": "Returns a view with relevant search information",
    "value": {
        "groups": [
            {
                "group": "Search Results",
                "datasets": {
                    "https://app.crunch.io/api/datasets/173b4eec13f542588b9b0a9cbcd764c9/": {
                        "labels": [],
                        "name": "econ_few_columns_0",
                        "groups": {
                            "blue": {
                                "https://app.crunch.io/api/datasets/173b4eec13f542588b9b0a9cbcd764c9/variables/000004/": {
                                    "dataset_labels": [],
                                    "users": [
                                        "00004",
                                        "00002"
                                    ],
                                    "alias": "Gender",
                                    "dataset_end_date": null,
                                    "category_names": [
                                        "Male",
                                        "Female",
                                        "Skipped",
                                        "Not Asked",
                                        "No Data"
                                    ],
                                    "dataset_start_date": null,
                                    "name": "Gender",
                                    "dataset_description": "",
                                    "dataset_archived": false,
                                    "group_names": [
                                        "blue"
                                    ],
                                    "dataset": "https://app.crunch.io/api/datasets/173b4eec13f542588b9b0a9cbcd764c9/",
                                    "dataset_id": "173b4eec13f542588b9b0a9cbcd764c9",
                                    "dataset_created_time": null,
                                    "subvar_names": [],
                                    "dataset_name": "econ_few_columns_0",
                                    "description": "Are you male or female?"
                                },
                                "https://app.crunch.io/api/datasets/173b4eec13f542588b9b0a9cbcd764c9/variables/000003/": {
                                    "dataset_labels": [],
                                    "users": [
                                        "00004",
                                        "00002"
                                    ],
                                    "alias": "BirthYear",
                                    "dataset_end_date": null,
                                    "category_names": [],
                                    "dataset_start_date": null,
                                    "name": "BirthYear",
                                    "dataset_description": "",
                                    "dataset_archived": false,
                                    "group_names": [
                                        "blue"
                                    ],
                                    "dataset": "https://app.crunch.io/api/datasets/173b4eec13f542588b9b0a9cbcd764c9/",
                                    "dataset_id": "173b4eec13f542588b9b0a9cbcd764c9",
                                    "dataset_created_time": null,
                                    "subvar_names": [],
                                    "dataset_name": "econ_few_columns_0",
                                    "description": "In what year were you born?"
                                }
                            }
                        },
                        "description": ""
                    },
                    "https://app.crunch.io/api/datasets/4473ab4ee84b40b2a7cd5cab4548d584/": {
                        "labels": [],
                        "name": "simple_alltypes",
                        "description": ""
                    }
                },
                "variables": {
                    "https://app.crunch.io/api/datasets/4473ab4ee84b40b2a7cd5cab4548d584/variables/000000/": {
                        "dataset_labels": [],
                        "users": [
                            "00002"
                        ],
                        "alias": "x",
                        "dataset_end_date": null,
                        "category_names": [
                            "red",
                            "green",
                            "blue",
                            "4",
                            "8",
                            "9",
                            "No Data"
                        ],
                        "dataset_start_date": null,
                        "name": "x",
                        "dataset_description": "",
                        "dataset_archived": false,
                        "group_names": null,
                        "dataset": "https://app.crunch.io/api/datasets/4473ab4ee84b40b2a7cd5cab4548d584/",
                        "dataset_id": "bb987b45a5b04caba10dec4dad7b37a8",
                        "dataset_created_time": null,
                        "subvar_names": [],
                        "dataset_name": "export test 94",
                        "description": "Numeric variable with value labels"
                    }
                },
                "variable_count": 14,
                "totals": {
                    "variables": 4,
                    "datasets": 2
                }
            }
        ]
    }
}
```

The variables grouping displays metadata for all of the variables that matched.
The Datasets grouping displays metadata for all of the datasets where a variable or the dataset it self matched.  The "groups"
parameter of the dataset indicates any variable groups that matched, along with variables that did not match the search but are contained
within the variable grouping.  The group names that are indexed come from the variable ordering endpoint.

Use the `group_variables_limit` parameter to define how many group variables to expose in this parameter.
variable_count is the total number of variables that matched the crunch's search index.  This number can be used when considering
limit and offset parameters.  (limit + offset higher than variable_count will always return no results)
Totals group defines the number of variables and datasets that matched post-index-filtering.  This parameter is useful in order to limit
the amount of output of group names, since some groups may have thousands of variables, who's information is less relevent
since those variables do not match in this context.

#### Drafts

A dataset marked as `is_published: false` can only be accessed by dataset editors.
They will still be available on the catalog for all shared users but API clients
should know to display these to the appropriate users.

The `is_published` flag of a dataset can be changed by editors from the catalog or
directly on the dataset entity.

#### PATCH
```http
PATCH /api/datasets/ HTTP/1.1
Host: app.crunch.io
Content-Type: application/json
Content-Length: 231

{
    "element": "shoji:catalog",
    "index": {
        "https://app.crunch.io/api/datasets/a598c7/": {
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
    `https://app.crunch.io/api/datasets/a598c7/`=list(
        description="Stardate 8130.4"
    )
)
crPATCH("https://app.crunch.io/api/datasets/",
    body=toJSON(payload))
```
```shell
```
```python
```

`PATCH /datasets/`

Use PATCH to edit the "name", "description", "start_date", "end_date", or
"archived" state of one or more datasets. A successful request returns a 204
response. The attributes changed will be seen by all users with access to this
dataset; i.e., names, descriptions, and archived state are not merely attributes
 of your view of the data but of the datasets themselves.

Authorization is required: you must have "edit" privileges on the dataset(s)
being modified, as shown in the "permissions" object in the catalog tuples. If
you try to PATCH and are not authorized, you will receive a 403 response and no
changes will be made.

The tuple attributes other than "name", "description", and "archived" cannot be
modified here by PATCH. Attempting to modify other attributes, or including new
attributes, will return a 400 response. Changing permissions is accomplished by
PATCH on the permissions catalog, and changing the owner is a PATCH on the
dataset entity. The "owner_name" and "current_editor_name" attributes are
modifiable, assuming authorization, by PATCH on the associated user entity.
Dataset "size" is a cached property of the data, changing only if the number of
rows or columns in the dataset change. Dataset "id", "modification_time"
and "creation_time" are immutable/system generated.

When PATCHing, you may include only the keys in each tuple that are being
modified, or you may send the complete tuple. As long as the keys that cannot
be modified via PATCH here are not modified, the request will succeed.

Note that, unlike other Shoji Catalog resources, you cannot PATCH to add new
datasets, nor can you PATCH a null tuple to delete them. Attempting either will
return a 400 response. Creating datasets is allowed only by POST to the catalog,
 while deleting datasets is accomplished via a DELETE on the dataset entity.

##### Changing ownership

Any changes to the ownership of a dataset need to be done by the current editor.

Only the dataset owner can change the ownership to another user. This can be done
by PATCH request with the new owners' email of API URL. The new owner must have
advanced permissions on Crunch.

Other editors of the dataset can change the ownership of a dataset only to a
Project as long as they andthe current owner of the dataset are both editors
on such project.



#### POST
```http
POST /api/datasets/ HTTP/1.1
Host: app.crunch.io
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
Location: https://app.crunch.io/api/datasets/223fd4/

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

POST a JSON object to create a new Dataset; a 201 indicates success, and the
returned Location header refers to the new Dataset resource.

The body must contain a "name". You can also include a Crunch Table in a "table" key,
as discussed in the [Feature Guide](#metadata-document-csv). The full set of possible attributes to include when POSTing to create a new dataset entity are:


Name | Type | Description
---- | ---- | -----------
name | string | Human-friendly string identifier
description | string | Optional longer string
archived | boolean | Whether the variable should be hidden from most views; default: false
owner | URL | Provide a project URL to set the owner to that project; if omitted, the authenticated user will be the owner
notes | string | Blank if omitted. Optional notes for the dataset
start_date | date | ISO-8601 formatted date with day resolution
end_date | date | ISO-8601 formatted date with day resolution
is_published | boolean | If false, only project editors will have access to this dataset
weight_variables | array | Contains aliases of weight variables to start this dataset with; variables must be numeric type
table | object | Metadata definition for the variables in the dataset


### Other catalogs

In addition to `/datasets/`, there are a few other catalogs of datasets in the API:

#### Team datasets

`/teams/{team_id}/datasets/`

A Shoji Catalog of datasets that have been shared with this team. These datasets
are not included in the primary dataset catalog. See [teams](#teams) for more.

#### Project datasets

`/projects/{project_id}/datasets/`

A Shoji Catalog of datasets that belong to this project. These datasets
are not included in the primary dataset catalog. See [projects](#projects) for more.

#### Filter datasets by name

`/datasets/by_name/{dataset_name}/`

The `by_name` catalog returns (on GET) a Shoji Catalog that is a subset of
`/datasets/` where the dataset name matches the "dataset_name" value. Matches
are case sensitive.

Verbs other than GET are not supported on this subcatalog. PATCH and POST at
 the primary dataset catalog.

### Dataset order

The dataset order allows each user to organize the order in which their datasets
are presented.

This endpoint returns a `shoji:order`. Like all shoji orders, it may not contain
all available datasets. The catalog should always be the authoritative source
of available datasets.

Any dataset not present on the order graph should be considered to be at the
bottom of the root list in arbitrary order.

#### GET

`GET /datasets/{dataset_id}/order/`

```json

{
    "element": "shoji:order",
    "self": "/datasets/{dataset_id}/order/",
     "graph": [
        "dataset_url",
        {"group": [
            "dataset_url"
        ]}
     ]
}
```

#### PUT

Receives a complete `shoji:order` payload and replaces the existing graph
with the new one.

It cannot contain dataset references that are not in the dataset catalog, else
the API will return a 400 response.

Standard `shoji:order` graph validation will apply.

#### PATCH

Same semantics as PUT



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
name | string |  | Required. The name of the dataset
description | string | "" | A longer description of the dataset
notes | string | "" | Additional information you want to associate with this dataset
id | string |  | The dataset's id
archived | bool | false | Whether the dataset is "archived" or active
permissions | object | `{"edit": false}` | Authorizations on this dataset; see [Permissions](#permissions)
owner_id | URL |  | URL of the user entity of the dataset's owner
owner_name | string | "" | That user's name, for display
size | object | `{"rows": null, "columns": null}` | Dimensions of the dataset
creation_time | ISO-8601 string |  | Datetime at which the dataset was created in Crunch
start_date | ISO-8601 string |  | Date/time for which the data in the dataset corresponds
end_date | ISO-8601 string |  | End date/time of the dataset's data, defining a start_date:end_date range
current_editor | URL or null | | URL of the user entity that is currently editing the dataset, or `null` if there is no current editor
current_editor_name | string or null | | That user's name, for display

##### Dataset catalogs

A dataset contains a number of catalog resources that contain collections of
related objects. They are available under the `catalogs` attribute of the
dataset Shoji entity.

```json
{
  "batches": "http://app.crunch.io/api/datasets/c5d751/batches/",
  "joins": "http://app.crunch.io/api/datasets/c5d751/joins/",
  "parent": "http://app.crunch.io/api/datasets/",
  "variables": "http://app.crunch.io/api/datasets/c5d751/variables/",
  "actions": "http://app.crunch.io/api/datasets/c5d751/actions/",
  "savepoints": "http://app.crunch.io/api/datasets/c5d751/savepoints/",
  "weight_variables": "http://app.crunch.io/api/datasets/c5d751/weight_variables/",
  "filters": "http://app.crunch.io/api/datasets/c5d751/filters/",
  "multitables": "http://app.crunch.io/api/datasets/c5d751/multitables/",
  "comparisons": "http://app.crunch.io/api/datasets/c5d751/comparisons/",
  "forks": "http://app.crunch.io/api/datasets/c5d751/forks/",
  "decks": "http://app.crunch.io/api/datasets/c5d751/decks/",
  "permissions": "http://app.crunch.io/api/datasets/c5d751/permissions/"
}
```

Catalog name | Resource
------------ | --------
batches | Returns all the batches (successful and failed) used for this dataset. See [Batches](#batches).
joins | Contains the list of all datasets joined to the current dataset. See [Joins](#joins).
parent | Indicates the catalog where this dataset is found (project or main dataset catalog)
variables | Catalog of all public variables of this dataset. See [Variables](#variables).
actions | All actions executed on this dataset
savepoints | Lists the saved versions for this dataset. See [Versions](#versions).
weight_variables | Includes the available variables to be used as weight
filters | Makes available the public and user-created filters. See [Filters](#filters).
multitables | Similar to filters, displays all available multitables
comparisons | Contains all available comparisons. See [Comparisons](#comparisons).
forks | Returns all the forks created from this dataset
decks | The list of all decks on this dataset for the authenticated user
permissions | Returns the list of all users and teams with access to this dataset. See [Permissions](#permissions).

#### PATCH

`PATCH /datasets/{dataset_id}/`

See above about PATCHing the dataset catalog for all attributes duplicated on
the entity and the catalog. You may PATCH those attributes on the entity, but you
are encouraged to PATCH the catalog instead. The two attributes appearing on the
entity and not the catalog, "notes" is modifiable by PATCH here.

A successful PATCH request returns a 204 response. The attributes changed will be seen
by all users with access to this dataset; i.e., names, descriptions, and archived
state are not merely attributes of your view of the data but of the datasets themselves.

Authorization is required: you must have "edit" privileges on this dataset.
 If you try to PATCH and are not authorized, you will receive a 403 response
 and no changes will be made. If you have edit permissions but are not the
 current editor of this dataset, PATCH requests of anything other than
 "current_editor" will respond with 409 status. You will need first to PATCH to
 make yourself
  the current editor and then proceed to make the desired changes.

When PATCHing, you may include only the keys that are being
modified, or you may send the complete entity. As long as the keys that cannot be
modified via PATCH here are not modified, the request will succeed.

##### Changing dataset ownership

If you are the current editor of a dataset you can change its owner by PATCHing
the `owner` attribute witht he URL of the new owner.

Only Users, Teams or Projects can be set as owners of a dataset.

* Users: New owner needs to be advanced users to be owner of a dataset.
* Teams: Authenticated user needs to be a member of the team.
* Projects: Authenticated user needs to have edit permissions on the project.

##### Copying over from another dataset

In the needed case to copy over the work from another dataset to the
current one, it is possible to issue a PATCH request with the `copy_from`
attribute pointing to the URL of the source dataset to use.

```json
{
  "element": "shoji:entity",
  "body": {
    "copy_from": "htp://app.crunch.io/api/datasets/1234/"
  }
}
```


All dataset attributes, permissions, derivations, private variables, etc
will be brought over to the current dataset:

* Decks
* Filters
* Multitables
* Comparisons
* Personal variable order
* Derived variables
* Personal variables
* Permissions


#### DELETE

`DELETE /datasets/{dataset_id}/`

With sufficient authorization, a successful DELETE request removes the dataset
from the Crunch system and responds with 204 status.

#### Views

##### Applied filters

##### Cube

`/datasets/{id}/cube/?q`

See [Multidimensional Analysis](#multidimensional-analysis).

##### Export

```http
GET `/datasets/{id}/export/` HTTP/1.1
Host: app.crunch.io
```

GET returns a Shoji View of available dataset export formats.

```json
{
    "element": "shoji:view",
    "self": "https://app.crunch.io/api/datasets/223fd4/export/",
    "views": {
        "spss": "https://app.crunch.io/api/datasets/223fd4/export/spss/",
        "csv": "https://app.crunch.io/api/datasets/223fd4/export/csv/"
    }
}
```

A POST request on any of the export views will return 202 status with a `shoji:view`,
containing an attribute `url` pointing to the location of the exported file to
be downloaded; GET that URL to download the file.


```http
POST `/api/datasets/f2364cc66e604d63a3be3e8811fc902f/export/spss/` HTTP/1.1
```
```json
    {
      "where": {
        "function": "select",
        "args":[
          {
            "map": {
              "https://app.crunch.io/api/datasets/f2364cc66e604d63a3be3e8811fc902f/variables/000000/": {"variable": "https://app.crunch.io/api/datasets/f2364cc66e604d63a3be3e8811fc902f/variables/000000/"},
              "https://app.crunch.io/api/datasets/f2364cc66e604d63a3be3e8811fc902f/variables/000001/": {"variable": "https://app.crunch.io/api/datasets/f2364cc66e604d63a3be3e8811fc902f/variables/000001/"},
              "https://app.crunch.io/api/datasets/f2364cc66e604d63a3be3e8811fc902f/variables/000002/": {"variable": "https://app.crunch.io/api/datasets/f2364cc66e604d63a3be3e8811fc902f/variables/000002/"}
              }
          }
        ]
      }
    }
```
```http
HTTP/1.1 202 Accepted
Content-Length: 176
Access-Control-Allow-Methods: OPTIONS, AUTH, POST, GET, HEAD, PUT, PATCH, DELETE
Access-Control-Expose-Headers: Allow, Location, Expires
Content-Encoding: gzip
Location: https://crunch-io.s3.amazonaws.com/exports/dataset_exports/f2364cc66e604d63a3be3e8811fc902f/My_Dataset.sav?Signature=sOmeSigNaTurE%3D&Expires=1470265052&AWSAccessKeyId=SOMEKEY
```

To export a subset of the dataset, instead perform a POST request and include a JSON body with an optional
 "filter" expression for the rows and a "where" attribute to specify variables to include.

Attribute | Description | Example
--------- | ----------- | ------------------------------------
filter | A Crunch filter expression defining a filter for the given export | `{"function": "==", "args": [{"variable": "000000"}, {"value": 1}]}`
where  | A Crunch expression defining which variables to export. Refer to [Frame functions](#frame-functions) for the available functions to here. | `{"function": "select", "args": [{"map": {"000000": {"variable": 000000"}}}]}`
options | An object of extra settings, which may be format-specific. See below. | `{"use_category_ids": true}`

See ["Expressions"](#expressions) for more on Crunch expressions.

The following rules apply for all formats:

* The dataset's exclusion filter will be applied; however, any of the user's personal "applied filters" are not, unless they are explicitly included in the request.
* Hidden/discarded variables are not exported unless editors use a `where` clause, then it will be evaluated over all non hidden variables.
* Personal (private) variables are not exported unless indicated, then only the current user's personal variables will be exported
* Variables (columns) will be ordered in a flattened version of the dataset's hierarchical order.
* Derived variables will be exported with their values, without their functional links.

Some format-specific properties and options:

Format    | Attribute        | Description                                                      | Example
--------- | ---------------- | ---------------------------------------------------------------- | --------------------------
csv       | use_category_ids | instead of category names export the fields as their numeric ids | {"use_category_ids": true}
all       | include_personal | Will include the user's personal variables on the exported file  | {"include_personal": true}

For both types of responses, the "location" header is set to the location for the download, whether completed or not.  Besides
 looking for a 100 percent completion with progress requests, the user may also look for a non-404 response on this location.

###### SPSS

Categorical-array and multiple-response variables will be exported as "mrsets", as supported by SPSS.

###### CSV

Categorical variable values will be exported as the category name by default. To use the category ids as data values, include `"use_category_ids": true` in the `"options"` attribute of the POST body.

##### Summary

`/datasets/{id}/summary/{?filter}`

###### Query Parameters

Parameter | Description
--------- | -----------
filter | A Crunch filter expression

GET returns a Shoji View with summary information about this dataset containing
 its number of rows (weighted and unweighted, with and without your applied
 filters), as well as the number of variables and columns. The column count
 will differ from the variable count when derived and array variables are
 present--these variable types don't necessarily have their own columns of d
 ata behind them. The column count is useful for estimating load time and
 file size when exporting.

If a `filter` is included, the "filtered" counts will be with respect to that
expression. If omitted, your applied filters will be used.

```json
{
	"element": "shoji:view",
	"self": "https://app.crunch.io/api/datasets/223fd4/summary/",
	"value": {
		"unweighted": {
			"filtered": 2000,
			"total": 2000
		},
        "weighted": {
            "filtered": 2000.0,
            "total": 2000.0
        },
		"variables": 529,
		"columns": 530
	}
}
```


#### Fragments

##### Table

##### State

##### Exclusion

`/datasets/{id}/exclusion/`

Exclusion filters allow you to drop rows of data without permanently deleting them.

GET on this resource returns a Shoji Entity with a filter "expression" attribute
in its body. Rows that match the filter expression will be excluded from all views of the data.

PATCH the "expression" attribute to modify. An empty "expression" object, like
 `{"body": {"expression": {}}}`, is equivalent to "no exclusion", i.e. no rows
 are dropped.

##### Stream

##### Settings

`/datasets/{id}/settings/`

The dataset settings allow editors to store dataset wide permissions and
configurations for it.

Will always return all the available settings with default values a dataset
can have.


```json
{
    "element": "shoji:entity",
    "self": "https://app.crunch.io/api/datasets/223fd4/settings/",
    "body": {
        "viewers_can_export": false,
        "viewers_can_change_weight": false,
        "weight": "https://app.crunch.io/api/datasets/223fd4/variables/123456/"
    }
}
```

To make changes, clients should PATCH the settings they wish to change with new
values. Additional settings are not allowed, the server will return a 400
response.


Setting | Description
--------|------------
viewers_can_export | When false, only editor can export; else, all users with view access can export the data
viewers_can_change_weight | When true, all users with access can set their own personal weight; else, the editor configured `weight` will be applied to all without option to change
weight | Default initial weight for all new users on this dataset, and when `viewers_can_change_weight` is false, this variable will be the always-applied weight for all viewers of the dataset.


##### Preferences

`/datasets/{id}/preferences/`

The dataset preferences provide API clients with a key/value store for settings
or customizations each would need for each user.

By default, all dataset preferences start out with only a `weight` key
 set to `null`, unless otherwise set. Clients can PATCH to add additional attributes.

```json
{
    "element": "shoji:entity",
    "self": "https://app.crunch.io/api/datasets/223fd4/preferences/",
    "body": {
      "weight": null
    }
}
```

To delete attributes from the preferences resources, PATCH them with `null`.

Preferences are unordered; clients should not assume that they are ordered.

###### Weight

If the dataset has `viewers_can_change_weight` setting set to false, then
all users' preferences `weight` will be set to the dataset wide configured
weight without option to change it. Attempts to modify it will return a 403
response.


##### Primary key

`/datasets/{dataset_id}/pk/`

###### URL Parameters

Parameter | Description
--------- | -----------
dataset_id | The id of the dataset

Setting a primary key on a dataset causes updates (particularly streamed
updates) mentioning existing rows to be updated instead of new rows being
inserted.  A primary key can only be set on a variable that is type "numeric" or "text" and that has no duplicate or missing values,
and it can only be set after that variable has been added to the dataset.

###### GET
```http
GET /api/datasets/{dataset_id}/pk/ HTTP/1.1
Host: app.crunch.io

--------
200 OK
Content-Type:application/json;charset=utf-8

{
    "element": "shoji:entity",
    "body": {
        "pk": ["https://app.crunch.io/api/datasets/{dataset_id}/variables/000001/"],
    }
}
```
```shell
```
```r
```
```python
>>> # "ds" is dataset via pycrunch
>>> ds.pk.body.pk
['https://app.crunch.io/api/datasets/{dataset_id}/variables/000001/']
```

`GET /datasets/{dataset_id}/pk/`

GET on this resource returns a Shoji Entity.  It contains one body key: ``pk``,
which is an array. The "pk" member indicates the URLs of the variables
in the dataset which comprise the primary key.  If there is no primary key for
this dataset, the ``pk`` value will be ``[]``.

###### POST
```http
POST /api/datasets/{dataset_id}/pk/ HTTP/1.1
Host: app.crunch.io
Content-Type: application/json
Content-Length: 15

{"pk": ["https://app.crunch.io/api/datasets/{dataset_id}/variables/000001/"]}

--------
204 No Content
```
```python
>>> # "ds" is dataset via pycrunch
>>> ds.pk.post({'pk':['https://app.crunch.io/api/datasets/{dataset_id}/variables/000001/']})
>>> ds.pk.body.pk
['000001']
```

`POST /datasets/{dataset_id}/pk/`

When POSTing, set the body to a JSON object containing the key "pk" to modify
the primary key. The "pk" key should be a list containing zero or more variable URLs.
The variables referenced must be either text or numeric type
and must have no duplicate or missing values.  Setting pk to ``[]`` is
equivalent to deleting the primary key for a dataset.

<aside class="notice">
    We currently support only a single primary key variable, so the POST payload
    array should be of length zero or one.
</aside>


###### DELETE
```http
DELETE /api/datasets/{dataset_id}/pk/ HTTP/1.1
Host: app.crunch.io

--------
204 No Content
```
```shell
```
```r
```
```python
>>> # "ds" is dataset via pycrunch
>>> ds.pk.delete()
>>> ds.pk.body.pk
[]
```

`DELETE /datasets/{dataset_id}/pk/`

DELETE the "pk" resource to delete the primary key for this dataset.  Upon
success, this method returns no body and a 204 response code.

#### Catalogs

##### Actions

##### Batches

`/datasets/{dataset_id}/batches/`

See [Batches](#batches) and the feature guides for [importing](#importing-data) and [appending](#appending-data).

##### Decks

`/datasets/{dataset_id}/decks/`

See [Decks](#decks).

##### Comparisons

##### Filters

`/datasets/{dataset_id}/filters/`

See [Filters](#filters).

##### Forks

##### Joins

##### Multitables

##### Permissions

`/datasets/{dataset_id}/permissions/`

See [Permissions](#permissions).

##### Savepoints

`/datasets/{dataset_id}/savepoints/`

See [Versions](#versions).

##### Variables

`/datasets/{dataset_id}/variables/`

See [Variables](#variables).

##### Weight variables
