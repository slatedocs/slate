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

Each batch has a "conflicts" member. Its value is an object that describes the conflicts found on each variable. It consists on an object keyed by variable ID. The value for each of these variables is as follows:

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
        "resolution": "<optional string>",
    }]
}
```

Each element will contain four members: `metadata` which will hold information of the variable on the target dataset (unless it is a variable that only exists on the source dataset), `source_id` and `source_metadata`, which describe the corresponding variable in the source frame (if any), and a `conflicts` member.

The `conflicts` member will contain an array with a list of individual conflicts that indicate what situations were found during batch preparation. This array will be empty if there were no conflicts.

Each of these conflicts can be either resolved or not, this is determined by the presence of the "resolution" key. Those conflicts without it are unresolved and until all those have a resolution, the batch in general will remain in status `conflict`.

#### Table

`/datasets/{id}/batches/{id}/table/{?offset,limit}`

A GET returns the rows of data from the Dataset for the identified batch as a Crunch Table.
