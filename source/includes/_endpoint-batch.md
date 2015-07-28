## Batches

### Catalog

`/datasets/{id}/batches/`

A GET on this resource returns a Shoji Catalog enumerating the batches present in the Dataset. Each tuple in the index includes a "status" member, which may be one of "analyzing", "conflict", "importing" or "imported".

{
    "element": "shoji:catalog",
    "self": "...datasets/837498a/batches/",
    "index": {
        "0/": {"status": "imported"},
        "2/": {"status": "ready"},
        "3/": {"status": "importing"}
    }
}

A POST to this resource adds new rows as a batch. The payload can be be a Crunch Table, a Source or another dataset (provided that the authenticated user has view permissions). All added rows obtain the same batch id. A 201 indicates success, and returns the URL of the new batch in the Location header.

The batches appending can be optionally requested to be an asynchronous operation, an `async` key with `true` value will need to be added to the payload. The response will always be status 202 and will contain a Location header with pointing to the new batch's URL. The client can GET that URL to query its status.

Batches are created in `idle` status and will be advanced to `ready` status once their processing starts. If there was a problem in processing it, its status will be `conflict` or `error`.

Note that the status code will always be 202 for asynchronous or 201 for synchronous creation of the batch even if there were conflicts or not. So you need to GET the new batch's URL to see if the data is good to go (status `ready` or `error`).

A `workflow` key is optional; if skipped, an empty workflow will be used. If present, it must contain the ZZ9 commands to apply before attempting to append.

It is possible to have the appending happen on one step instead of two steps. To do this send an `autoappend` key set to True, that way the API will automatically append the batch on this same request.

Appending a dataset

Must contain the URL of a dataset that the current user can read. This action will create a Source entity mapping to such dataset. Its name and description will match the dataset's name and description respectively at that moment.

{
  dataset: <url>,
  workflow: <optional list>,
    async: <optional boolean>,
    autoappend: <optional boolean>
}

Appending a source

Must contain the URL of a source that a user can read.

{
  source: <url>,
  workflow: <optional list>,
    async: <optional boolean>,
    autoappend: <optional boolean>
}

Appending a Crunch Table

The variables IDs must match those of the target dataset since their types will be matched based on ID. The data is expected to match the target dataset's variable types. This action will create a new Source entity, its name and description will match those provided on the JSON response, if not provided they'll default to empty string.

{
  element: "crunch:table",
    name: <optional string>,
    description: <optional string>,
  data: {
    var_url_1: <list>,
    var_url_2: <list>
  },
  workflow: <optional list>,
    async: <optional boolean>,
    autoappend: <optional boolean>
}

### Entity

`/datasets/{id}/batches/{id}/`

A GET on this resource returns a Shoji Entity describing the batch, and a link to its Crunch Table (see next).

{
  source: <url>,
  workflow: <optional list>,
  revisions: <list>,
  conflicts: <object>,
  status: <string>
}

PATCH to the entity allows to edit its `status` attribute, will return a 204 status code.

If the status is `conflict`:

The only possible value to change to is `ready`. Will need to provide also a `workflow` key with new instructions on how to treat the source's data to resolve the conflicts. After finishing the batch status will be `ready`.

If the status is `ready`:

The only possible value to change to is `importing`. This will proceed to add the data provided from the source to the dataset. After finishing the batch's status will be "imported".

The conflicts object

Each batch has a .conflicts member. Its value is an object that describes the conflicts found on each variable. It consists on an object keyed by variable ID. The value for each of these variables is as follows:

{
  metadata: {
    name: <string>,
    alias: <string>,
    type: <string>,
    categories: <array>,
  },
  conflicts: [
  {
    message: <string>,
    resolution: <optional string>,
    resolved_by: <optional revision reference>
  }
]}

Each element will contain two members, `metadata` which will hold information of the variable on the source dataset (unless it is a variable that only exists on the target dataset), and a `conflicts` key.

The `conflicts` key  will contain an array with a list of individual conflicts that indicate what situations were found during batch preparation.

Each of these conflicts can be either resolved or not, this is determined by the presence of the "resolution" key. Those conflicts without it are unresolved and until all those have a resolution, the batch in general will remain in status `conflict`.

`/datasets/{id}/batches/{id}/table/{?offset,limit}`

A GET returns the rows of data from the Dataset for the identified batch as a Crunch Table.
