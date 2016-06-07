## Batches

### Catalog

`/datasets/{id}/batches/`

A GET on this resource returns a Shoji Catalog enumerating the batches present in the Dataset. Each tuple in the index includes a "status" member, which may be one of "analyzing", "conflict", "error", "importing", "imported", or "appended".

```json
{
    "element": "shoji:catalog",
    "self": "...datasets/837498a/batches/",
    "index": {
        "0/": {"status": "appended"},
        "2/": {"status": "error"},
        "3/": {"status": "importing"}
    }
}
```

A POST to this resource adds a new batch. The payload can be be a Crunch Table (with variable metadata, row data, or both), the URI of a Source, or the URI of another dataset (provided that the authenticated user has view permissions). All added rows regardless of source obtain the same batch id. A 201 indicates success, and returns the URL of the new batch in the Location header.

If the append operation takes more than two minutes, 202 is returned instead and the batch will continue being appended in the background. The Location header is still returned, pointing to the new batch's URL. The client can GET that URL to query its status.

Batches are created in `analyzing` status and will be advanced through `importing`, `imported`, and `appended` status if there are no problems. If there was a problem in processing it, its status will be `conflict` or `error`.

Note that the status code will always be 202 for asynchronous or 201 for synchronous creation of the batch whether there were conflicts or not. So you need to GET the new batch's URL to see if the data is good to go (status `appended`).

#### Appending a dataset

Must contain the URL of a dataset that the current user can read. This action will create a Source entity mapping to such dataset. Its name and description will match the dataset's name and description respectively at that moment.

```json
{
  "dataset": "<url>"
}
```

#### Appending a source

Must contain the URL of a source that a user can read.

```json
{
  "source": "<url>"
}
```

#### Appending a Crunch Table

The variables IDs must match those of the target dataset since their types will be matched based on ID. The data is expected to match the target dataset's variable types. This action will create a new Source entity, its name and description will match those provided on the JSON response, if not provided they'll default to empty string.

```json
{
  "element": "crunch:table",
    "name": "<optional string>",
    "description": "<optional string>",
    "data": {
      "var_url_1": [1, 2, 3, ...],
      "var_url_2": ["a", "b", ...]
    }
}
```


#### Checking if an append will cause problems

`/datasets/{id}/batches/compare/`


An append cannot proceed if there are any situations on the datasets involved
that will cause ambiguous situations. If such datasets were to be appended
the server will return a 409 response.

It is possible to verify for this conditions before trying the append using
the batches compare endpoint.

```
GET /datasets/4bc6af/batches/compare/?dataset=http://beta.crunch.io/api/datasets/3e2cfb/
```

The response will contain a conflicts key that can contain either `current`, 
`incoming` or `union` depending of the type and location of the problem. The response status
will always be 200, with conflicts, described below, or an empty body.

 * `current` refers to issues find on the dataset where new data would be added
 * `incoming` has issues on the far dataset that contains the new data to add
 * `union` expresses problems on the combined variables(metadata) of the final dataset after append.

```json

{
    "union": {...},
    "current": {...},
    "incoming": {...}
}

```

A successful response will not contain any of the keys returning an empty object.


```json

{}

```


The possible keys in the conflicts and verifications made are:

* **Subvariables in multiple arrays**: Indicates a problem in the original data. A variable is used as a subvariable in one or more datasets.
* **Subvariables without a parent array**: Will contain the IDs of variables that are marked as subvariables, but don’t belong in any array.
* **Variables missing alias**: All variables should have a valid alias string. This will indicate the IDs of those that don’t.
* **Variables missing name**:  All variables should have a valid name string. This will indicate the IDs of those that don’t.
* **Variables with duplicate alias**: In the event of two or more variables sharing an alias, they will be reported here. When this occurs as a _union_ conflict, it is likely that names and aliases of a variable or subvariable in _current_ and _incoming_ are swapped (e.g., VariantOne:AliasOne, Variant1:Alias1 in current but VariantOne:Alias1, Variant1:AliasOne in incoming).
* **Variables with duplicate name**: Variable names should be unique across non subvariables.
* **Subvariable in different arrays per dataset**: If a subvariable is used for different arrays that are impossible to match, it will be reported here. User action will be needed to fix this.

For each of these, a list of variable IDs will be made available indicating the
conflicting entities. _Union_ conflicting ids generally refer to variables in 
the _current_ dataset and may be referenced by alias in _incoming_.


### Entity

`/datasets/{id}/batches/{id}/`

A GET on this resource returns a Shoji Entity describing the batch, and a link to its Crunch Table (see next).

```json
{
    "conflicts": {},
    "source_children": {},
    "target_children": {},

    "source_columns": 3500,
    "source_rows": 235490,
    "target_columns": 3499,
    "target_rows": 120000,
    "error": "",
    "progress": 100.0,
    "source": "<url>",
    "status": "appended"
}
```

#### The conflicts object

Each batch has a "conflicts" member describing any unresolvable differences found between variables in the two datasets. On a successful append, this object will be empty; if the batch status is "conflict", the object will contain conflict information keyed by id of the variable in the target dataset. The conflict data for each variable follows this shape:

```json
{
    "metadata": {
        "name": "<string>",
        "alias": "<string>",
        "type": "<string>",
        "categories": [{}],
    },
    "source_id": "<id of the matching variable in the source frame",
    "source_metadata": {
        "name, etc": "as above"
    },
    "conflicts": [{
        "message": "<string>",
    }]
}
```

Each conflict has four attributes: `metadata` about the variable on the target dataset (unless it is a variable that only exists on the source dataset), `source_id` and `source_metadata`, which describe the corresponding variable in the source frame (if any), and a `conflicts` member. The `conflicts` member contains an array with a list of individual conflicts that indicate what situations were found during batch preparation. 

If there are conflicts in your batch, address the conflicting issues in your datasets, DELETE the batch entity from the failed append attempt, and POST a new one.

#### Table

`/datasets/{id}/batches/{id}/table/{?offset,limit}`

A GET returns the rows of data from the Dataset for the identified batch as a Crunch Table.
