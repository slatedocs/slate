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

#### Appending rows to a batch

<aside class="notice">
RFC: this section discusses how Crunch <i>may</i> work in the future. Crunch.io makes no guarantees about whether it does so now or whether it eventually will do so. Comments on the usability of such a feature are requested from interested parties.
</aside>

Existing datasets are best sent to Crunch as a single Source, or a handful of subsequent Sources if gathered monthly or on some other schedule. Sometimes however you want to "stream" data to Crunch as it is being gathered, even one row at a time, rather than in a single post-processing phase. You do *not* want to make each row its own batch (it's simply not worth the overhead).

Instead, you should pick a batch and append rows to it. Typically, this is "batch 0", which exists for all datasets and is initially empty. When you append a Source or other Dataset as the sections above describe, those become "batch 2" and higher, but "batch 0" is left alone. You may use it for all row-by-row appends, or you may create additional batches to segment your data as you see fit. For example, you might create a new batch whenever your schema changes significantly (you are not required to do so), or when you re-field a survey after an idle period, or whatever makes sense to you. Alternately, you may make your own variables to segment your rows. Crunch uses a (mostly hidden) `__batch_id__` variable to keep track of which rows belong to which batch, and it's your choice whether and how to take advantage of it.

To append one or more rows to an existing batch, simply POST a Crunch Table to the batch's table endpoint (`/datasets/{id}/batches/{id}/table/`):

```json
{
  "element": "crunch:table",
    "data": {
      "var_url_1": [1, 2, 3, ...],
      "var_url_2": ["a", "b", "c", ...]
    }
}
```

The variable URLs must correspond to existing variables in the dataset, and the data must match the target variable types, so that we can process the row as quickly as possible. We want no casting or other guesswork slowing us down here. Among other things, this means that categorical values must be represented as Crunch's assigned category ids, not names or numeric values.

Note that this format is column-major, and therefore allows you to send more than one row at a time if you prefer. For example, your data collection system may already post-process row data in, say, 5 minute or 1 hour increments. The more rows you can send together, the less overhead spent processing each one and the more you can send in a given time.

As when creating a new batch, don't worry about sending values for derived variables; Crunch will fill these out for you for each row using the data you send.

<aside class='warning'>
When you create a new batch by uploading a CSV or SPSS file, or when you import rows from another dataset, Crunch backs up your original data in a Source resource. If you revert your dataset to a point before appending that batch, your original file is still available at its Source URI to re-append.

This is **not** true when appending rows directly to an existing batch. There is no corresponding Source, and if you revert your dataset to an older savepoint, Crunch does *not* retain the rows you streamed. You will have to re-stream the lost rows (or better, send them as a new batch to increase their safety).
</aside>
