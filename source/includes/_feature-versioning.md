## Versioning Datasets

<aside class="notice">Experimental</aside>

All Crunch datasets keep track of the changes you make to them, from the initial import, through name changes and deriving new variables, to appending new rows. You can review the changes to see who did what and when, revert to a previous version, "fork" a dataset to make a copy of it, make changes to the copy, and merge those changes back into the original dataset.

### Actions

The list of changes are available in the `dataset/{id}/actions/` catalog. GET it and sort/filter by the "datetime" and/or "user" members as desired. Follow the links to an individual action entity to get exact details about what changed.

### Savepoints

You can snapshot the current state of the dataset at any time with a POST to `datasets/{id}/savepoints/`. This marks the current point in the actions history, allowing you to provide a description of your progress. You can then revert to any savepoint (throwing away any changes since that time) with a POST to `/datasets/{dataset_id}/savepoints/{version_id}/revert/`.

### Forking and Merging

A common pattern when collaborating on a dataset is for one person to make changes on their own and then, when all is ready, share the whole set of changes back to the other collaborators. Crunch implements this with two mechanisms: the ability to "fork" a dataset to make a copy, and then "merge" any changes made to it back to the original dataset.

To fork a dataset, POST a new fork entity to the dataset's forks catalog. The 201 response will include a Location header with the URL of the new dataset that has been forked from the current one.

```python
>>> ds.forks.index
{}
>>> forked_ds = ds.forks.create({"body": {"name": "My fork"}}).refresh()
>>> ds.forks.index.keys() == [forked_ds.self]
True
>>> ds.forks.index[forked_ds.self]["name"]
"My fork"
```

```http
POST /api/datasets/{id}/forks/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
Content-Length: 231

{
    "element": "shoji:entity",
    "body": {"name": "My fork"}
}

----

HTTP/1.1 201 Created
Location: https://beta.crunch.io/api/datasets/{forked_id}/
```

The forked dataset can then be viewed and altered like the original; however, those changes do not alter the original until you merge them back with a POST to `datasets/{id}/actions/`.

```python
ds.actions.post({
    "element": "shoji:entity",
    "body": {"dataset": forked_ds.self, "autorollback": True}
})
```

```http
POST /api/datasets/{id}/actions/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json
Content-Length: 231

{
    "element": "shoji:entity",
    "body": {
        "dataset": {forked ds URL},
        "autorollback": true
    }
}

----

HTTP/1.1 204 No Content

*or*

HTTP/1.1 202 Accepted
Location: https://beta.crunch.io/api/progress/{progress_id}/
```

The POST to the actions catalog tells the original dataset to replay a set of actions; since we specify a "dataset" url, we are telling it to replay all actions from the forked dataset. Crunch keeps track of which actions are already common between the two datasets, and won't try to replay those. You can even make further changes to the forked dataset and merge again and again.

Use the "autorollback" member to tell Crunch how to handle merge conflicts. If an action cannot be replayed on the original dataset (typically because it has had conflicting changes or has been rolled back), then if "autorollback" is true (the default), the original dataset will be reverted to the previous state before any of the new changes were applied. If "autorollback" is false, the dataset is left in the half-merged state, which allows you to investigate the problem, repair it if possible (in either dataset as needed), and then POST again to continue the merge.

Per-user settings (filters, decks and slides, variable permissions etc) are copied to the new dataset when you fork. However, changes to them are not merged back at this time. Please reach out to us as you experiment so we can fine-tune which details to fork and merge as we discover use cases.

Merging actions may take a few seconds, in which case the POST to actions/ will return 204 when finished. Merging many or large actions, however, may take longer, in which case the POST will return 202 with a Location header containing the URL of a [progress resource](#progress).
