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
            "streaming": "no",
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
            "streaming": "no",
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
size | object | `{"rows": 0, "columns": 0, "unfiltered_rows": 0}` | Dimensions of the dataset
creation_time | ISO-8601 string |  | Datetime at which the dataset was created in Crunch
modification_time | ISO-8601 string | | Datetime of the last modification for this dataset globally
start_date | ISO-8601 string |  | Date/time for which the data in the dataset corresponds
end_date | ISO-8601 string |  | End date/time of the dataset's data, defining a start_date:end_date range
streaming | string | Possible values "no", "finished" and "streaming" to enable/disable streaming
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
streaming | string | Only "streaming", "finished" and "no" available values to define if a dataset will accept streaming data or not
is_published | boolean | If false, only project editors will have access to this dataset
weight_variables | array | Contains aliases of weight variables to start this dataset with; variables must be numeric type. 
table | object | Metadata definition for the variables in the dataset
maintainer | URL | User URL that will be the maintainer of this dataset in case of system notifications; if omitted, the authenticated user will be the maintainer
settings | object | [Settings object](#settings) containing `weight`, `viewers_can_export`, `viewers_can_change_weight`, `viewers_can_share`, `dashboard_deck`, and/or `min_base_size` attributes. If a "weight" is specified, it will be automatically added to "weight_variables" if not already specified there.


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
size | object | `{"rows": 0, "unfiltered_rows", "columns": 0}` | Dimensions of the dataset
creation_time | ISO-8601 string |  | Datetime at which the dataset was created in Crunch
start_date | ISO-8601 string |  | Date/time for which the data in the dataset corresponds
end_date | ISO-8601 string |  | End date/time of the dataset's data, defining a start_date:end_date range
streaming | string | Possible values are "no", "finished" and "streaming" to determine if a dataset is streamed or not
current_editor | URL or null | | URL of the user entity that is currently editing the dataset, or `null` if there is no current editor
current_editor_name | string or null | | That user's name, for display
maintainer | URL | The URL of the dataset maintainer. Will always point to a user
app_settings | object | `{}` | A place for API clients to store values they need per dataset; It is recommended that clients namespace their keys to avoid collisions

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
filters | Makes available the public and user-created filters. See [Filters](#filters).
multitables | Similar to filters, displays all available multitables. See [Multitables](#mulitables)
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
    "copy_from": "https://app.crunch.io/api/datasets/1234/"
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

The response will be a `shoji:entity` containing as a body an object with
keys for each entity type that uas not been copied. In the case of variables
these entities will display their name, alias and owner (if personal).

All the URLs will refer to entities on the source dataset.

```json
{
    "element": "shoji:entity",
    "body": {
        "variables": {
            "https://app.crunch.io/dataset/1234/variables/abc/": {
                "name": "Variable name",
                "alias": "Variable alias",
                "owner_url": "https://app.crunch.io/users/qwe/",
                "owner_name": "Angus MacGyver"
            },
            "https://app.crunch.io/dataset/1234/variables/cde/": {
                "name": "Variable name",
                "alias": "Variable alias",
                "owner_url": null,
                "owner_name": null
            }
        },
        "filters": {
            "https://app.crunch.io/filters/abcd/": {
                "name": "filter name",
                "owner_url": "http://app.crunch.io/users/qwe/"
            },
            "http://app.crunch.io/filters/cdef/": {
                "name": "filter name",
                "owner_url": "https://app.crunch.io/users/qwe/"
            }
        }
    }
}
```


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

A POST request on any of the export views will return 202 status with a Progress response in the body and a Location header pointing to the location of the exported file to be downloaded. Poll the progress URL for status on the completion of the export. When complete, GET the Location URL from the original response to download the file.


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

Format    | Attribute           | Description                                                                         | Default
--------- | --------------------| ----------------------------------------------------------------------------------- | --------------------------
csv       | use_category_ids    | Export categorical data as its numeric IDs instead of category names?                    | false
csv       | missing_values      | If present, will use the specified string to indicate missing values. If omitted, will use the missing reason strings   | _omitted_
csv       | header_field        | Use the variable's alias/name/description in the CSV header row,  or `null` for no header row          | "alias"
spss      | var_label_field     | Use the variable's name/description as SPSS variable label                          | "description"
spss      | prefix_subvariables | Prefix subvariable labels with the parent array variable's label?            | false
all       | include_personal    | Include the user's personal variables in the exported file?                     | false

###### SPSS

Categorical-array and multiple-response variables will be exported as "mrsets", as supported by SPSS. If
the `prefix_subvariables` option is set to `true`, then the subvariables' labels will be prefixed with the 
parent's label.

To pick which variable field to use on the `label` field on the SPSS variables, use the `var_label_field` in the
`options` attribute in the POST body. The only valid fields are `description` and `name`.

###### CSV

By default, categorical variable values will be exported using the category name 
and missing values will use their corresponding reason string for all variables.

The missing values will be exported with their configured missing reason in
the CSV file. If specified on the `missing_values` export option, then all
missing values on all columns will use such string instead of the reason.

To control the output of the header row, use the `header_field` option. Valid values for this option are:

 * alias (default)
 * name
 * description
 * `null` - Sending `null` will make the resulting CSV without a header row.

Refer to the options described on the table above for the `csv` format to change this behavior.


##### Match

The match endpoint provides a list of matches indicating which variables match amongst the datasets provided.  To use it,
send a post request representing an ordered list of datasets you would like to match. Include the "minimum_matches"
parameter in your graph if you would like to limit the output of the matches based on the number of datasets matching.
The default minim_matches is 2. Currently, only alias is utilized to match the variables to one another. 

The result of a match endpoint request can be one of two things. If the same match has been completed previously, the
api with return a 201 status code and a Location header to the existing results. Otherwise, the endpoint will return 
a 202 status code, with a Progress result that provides status information as the match is completed. Either request will 
result in the location header being set to the URI for staticly generated comparison result that can be accessed with the 
match is completed.

The results are a Shoji Entity with an attribute `matches`. The matches are listed by order of the
number of variables matched. Each variable inside the matches will contain the dataset, the variable id and the confidence
that the variable matches the others in the list. The order of the variables inside the matches returned will match
 the order of the datasets provided. The first variable will also contain some additional information
to allow previewing a match. To retrieve complete details about all the matching variables the endpoints
listed in `metadata` field can be called, those provide all the matching metadata chunked by groups of matches.


```http
POST /datasets/match/ HTTP/1.1
```
```json
{
    "element": "shoji:entity",
    "body":  {
        "datasets": [
            "http://app.crunch.io/api/datasets/8274bf/",
            "http://app.crunch.io/api/datasets/699a33/",
            "http://app.crunch.io/api/datasets/8274bf/",
            "http://app.crunch.io/api/datasets/699a33/"                   
        ],
         "minimum_matches": 3
    }
}
```

Response:

```http
201 Created
Host: app.crunch.io
Location: http://app.crunch.io/api/datasets/matches/394d9e/
```

```http
GET /api/datasets/matches/394d9e/
```

```json
{

    "element": "shoji:order",
    "self": "http://app.crunch.io:50976/api/datasets/match/3c7df5/", 
    "body": {
        "matches": [
            [
                {
                    "alias": "SomeVariable", 
                    "confidence": 1, 
                    "name": "Some Variable", 
                    "variable": "521b5c014e1e474fa5173d95000bd6e9", 
                    "desc": "This is some variable", 
                    "dataset": "8274bfb842d645728a49634414b999c4"
                }, 
                {
                    "variable": "3fa1d3358888474eb949ae586e80f9a4", 
                    "confidence": 1, 
                    "dataset": "699a3315c3f347d4923257380938f9b9"
                }
            ],
            [
                {
                    "alias": "AnotherVariableThatHasMatches", 
                    "confidence": 1, 
                    "name": "Another Variable", 
                    "variable": "234e8e76d0e1a32667ab33bc30a9900", 
                    "desc": "This is another variable", 
                    "dataset": "8274bfb842d645728a49634414b999c4"
                }, 
                {
                    "variable": "9373729ac990b009e0a90dca99092789", 
                    "confidence": 1, 
                    "dataset": "699a3315c3f347d4923257380938f9b9"
                }
            ],
            ...
        ], 
        "metadata": [
            "http://app.crunch.io/api/datasets/match/3c7df5/0-500/"
        ]
    }
}

```


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

###### Stream lock

When a dataset is configured to receive streaming data, the /stream/ endpoint
will accept POST requests to append new rows to the streaming queue.

A dataset is able to receive streaming data while its `streaming` attribute is 
set to `streaming`.

While a dataset is receiving streams, any other kind of append is disabled 
returning 409 if attempted. Only streaming data is allowed.

The following operations are forbidden on a dataset while it is accepting
streaming rows in order to protect the schema.

 * Deleting public non derived variables
 * Casting variables (Includes changing resolution on datetime variables)
 * Changing variable aliases
 * Deleting categories from categorical variables
 * Changing ID of category IDs
 * Removing subvariables from arrays

To change the streaming configuration of the dataset, PATCH the entity's 
`streaming` attribute to either `finished` or `no` according to the following 
table:

Value | Allows schema changes | Accepts streaming rows | Next state
------|-----------------------|------------------------|------------
`streaming` | No | Yes | `finished`
`finished` | No | No | `no`
`no` | Yes | No | - 

Note that the only allowed sequence of states for the  `streaming` attribute
is `streaming` -> `finished` -> `no`. It cannot be set in any other sequence.


###### Sending rows

`/datasets/{id}/stream/`

Stream allows for sending data to a dataset as it is gathered.

GET on this resource returns a Shoji Entity with two attributes in its body:

```json
{
    "element": "shoji:entity",
    "self": "https://app.crunch.io/api/datasets/223fd4/stream/",
    "description": "A stream for this Dataset. Each stream acts as a write buffer, from which Sources are periodically made and appended as Batches to the owning Dataset.",
    "body":{
        "pending_messages": 1,
        "received_messages": 8
    }
}
```
Attribute | Description
--------|------------
pending_messages | The number of messages the stream has that have yet to be appended to the dataset (note: a message might contain more than one row, each POST that is made to `/datasets/{id}/stream/` will result in a single message).
received_messages | The total number of messages that this stream has received.

POST to this endpoint to add rows. The payload should be a multi line string
where each line contains a json representation of objects indicating the
value for each variable keyed by **alias**.

```
{"alias1": 1, "alias2": "value", "alias3": 0}
{"alias1": 99, "alias2": "other", "alias3": 2}
{"alias1": 10, "alias2": "empty", "alias3": 1}
```

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
        "viewers_can_share": true,
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
viewers_can_share | When true, all users with access can share the dataset with other users or teams; Defaults to `True`
weight | Default initial weight for all new users on this dataset, and when `viewers_can_change_weight` is false, this variable will be the always-applied weight for all viewers of the dataset.
dashboard_deck | When set, points to a deck that will become publicly visible and be used as dashboard by the web client


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

##### Users

`/datasets/{dataset_id}/users/`

This catalog exposes the full list of users that have access to the dataset
via the different sources:

 * When the dataset belongs to a project, as project members
 * Members of teams that are shared with the dataset
 * Direct shares to specific users
 
This endpoint only supports GET, the response will be a catalog with each user
as member with the tuple indicating the coalesced permissions and information
about the type of access:

Attribute             | Description
--------------------- | -----------
name                  | Name of the user
email                 | Email of the user
teams                 | URLs of teams with dataset access this user belongs to
last_accessed         | Timestamp of last access to dataset via web app
project_member        | If dataset is part of a project and this user too
coalesced_permissions | Permissions this user has to this access, combining all sources

```json

{
  "https://app.crunch.io/api/users/411aa32a075b4b57bf25a4ace1baf920/": {
    "name": "Jean-Luc Picard", 
    "last_accessed": "2017-02-25T00:00:00+00:00",
    "teams": [
      "https://app.crunch.io/api/teams/c6dbeb7c57e34dd08ab2316f3363e895/", 
      "https://app.crunch.io/api/teams/d0abf4e933fc44e38190247ae4d593f9/"
    ], 
    "project_member": false, 
    "email": "jeanluc@crunch.io", 
    "coalesced_permissions": {
      "edit": true, 
      "change_permissions": true, 
      "view": true
    }
  }, 
  "https://app.crunch.io/api/users/60f18c51699b4ba992721197743286a4/": {
    "name": "William Riker", 
    "last_accessed": null, 
    "teams": [
      "https://app.crunch.io/api/teams/d0abf4e933fc44e38190247ae4d593f9/"
    ], 
    "project_member": false, 
    "email": "number1@crunch.io", 
    "coalesced_permissions": {
      "edit": false, 
      "change_permissions": false, 
      "view": true
    }
  }, 
  "https://app.crunch.io/api/users/80d89e4e876344ecb46c528a910e3877/": {
    "name": "Geordi La Forge", 
    "last_accessed": "2017-01-31T00:00:00+00:00", 
    "teams": [
      "https://app.crunch.io/api/teams/c6dbeb7c57e34dd08ab2316f3363e895/", 
      "https://app.crunch.io/api/teams/d0abf4e933fc44e38190247ae4d593f9/"
    ], 
    "project_member": true, 
    "email": "geordilf@crunch.io", 
    "coalesced_permissions": {
      "edit": true, 
      "change_permissions": true, 
      "view": true
    }
  }
}

```

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
