## Versioning Datasets

<aside class="notice">Experimental</aside>

All Crunch datasets keep track of the changes you make to them, from the initial import, through name changes and deriving new variables, to appending new rows. You can review the changes to see who did what and when, revert to a previous version, "fork" a dataset to make a copy of it, make changes to the copy, and merge those changes back into the original dataset.

### Actions

The list of changes are available in the `dataset/{id}/actions/` catalog. GET it and sort/filter by the "datetime" and/or "user" members as desired. Follow the links to an individual action entity to get exact details about what changed.

#### Viewing Changes Diff

Through the actions catalog it's possible to retrieve the differences of a "fork" dataset from its "upstream" dataset.

Two endpoints are provided to do so, the `dataset/{id}/actions/since_forking` and the `dataset/{id}/actions/upstream_delta` endpoints.

The `dataset/{id}/actions/since_forking` endpoint will return the state of the fork and the upstream and the
the list of actions that were performed on the fork since the two diverged.

```python
>>> forkds.actions.since_forking
pycrunch.shoji.View(**{
    "self": "https://app.crunch.io/api/datasets/051ebb979db44523822ffe29236a6670/actions/since_forking/",
    "value": {
        "dataset": {
            "modification_time": "2017-02-16T11:01:41.807000+00:00",
            "revision": "58a586950183667486130f0c",
            "id": "051ebb979db44523822ffe29236a6670",
            "name": "My fork"
        },
        "actions": [
            {
                "hash": "2a863871-c809-4cad-a20c-9fea86b9e763",
                "state": {
                    "failed": false,
                    "completed": true,
                    "played": true
                },
                "params": {
                    "variable": "fab0c81d16b442089cc50019cf610961",
                    "definition": {
                        "alias": "var1",
                        "type": "text",
                        "name": "var1",
                        "id": "fab0c81d16b442089cc50019cf610961"
                    },
                    "dataset": {
                        "id": "051ebb979db44523822ffe29236a6670",
                        "branch": "master"
                    },
                    "values": [
                        "sample sentence",
                        "sample sentence",
                        "sample sentence",
                        "sample sentence",
                        "sample sentence",
                        "sample sentence",
                        "sample sentence"
                    ],
                    "owner_id": null
                },
                "key": "Variable.create"
            }
        ],
        "upstream": {
            "modification_time": "2017-02-16T11:01:40.131000+00:00",
            "revision": "58a586940183667486130efc",
            "id": "2730c0744cba4d7c9acc9f3551380e49",
            "name": "My Dataset"
        }
    },
    "element": "shoji:view"
})
```

```http
GET /api/datasets/5de96a/actions/since_forking HTTP/1.1
Host: app.crunch.io
Content-Type: application/json
Content-Length: 1769

{
    "element": "shoji:view",
    "value": {
        "dataset": {
            "modification_time": "2017-02-16T11:01:41.807000+00:00",
            "revision": "58a586950183667486130f0c",
            "id": "051ebb979db44523822ffe29236a6670",
            "name": "My fork"
        },
        "actions": [
            {
                "hash": "2a863871-c809-4cad-a20c-9fea86b9e763",
                "state": {
                    "failed": false,
                    "completed": true,
                    "played": true
                },
                "params": {
                    "variable": "fab0c81d16b442089cc50019cf610961",
                    "definition": {
                        "alias": "var1",
                        "type": "text",
                        "name": "var1",
                        "id": "fab0c81d16b442089cc50019cf610961"
                    },
                    "dataset": {
                        "id": "051ebb979db44523822ffe29236a6670",
                        "branch": "master"
                    },
                    "values": [
                        "sample sentence",
                        "sample sentence",
                        "sample sentence",
                        "sample sentence",
                        "sample sentence",
                        "sample sentence",
                        "sample sentence"
                    ],
                    "owner_id": null
                },
                "key": "Variable.create"
            }
        ],
        "upstream": {
            "modification_time": "2017-02-16T11:01:40.131000+00:00",
            "revision": "58a586940183667486130efc",
            "id": "2730c0744cba4d7c9acc9f3551380e49",
            "name": "My Dataset"
        }
    }
}
```

The `dataset/{id}/actions/upstream_delta` endpoint usage and response matches the one of
the other endpoint, but the returned actions are instead the ones that were performed
on the upstream since the two diverged.

### Savepoints

You can snapshot the current state of the dataset at any time with a POST to
`datasets/{id}/savepoints/`. This marks the current point in the actions
history, allowing you to provide a description of your progress.

The response will contain a Location header that will lead to the new version created.

In case creating the new version can be created fast enough a 201 response will be issued,
when the new version takes too long a 202 response will be issued and the creation will proceed in background.
In case of a 202 response the body will be a Shoji:view containing a progress URL 
where you may query the progress.

```python
>>> svp = ds.savepoints.create({"body": {"description": "TestSVP"}})
pycrunch.shoji.Entity(**{
    "body": {
        "creation_time": "2017-05-09T14:18:07.761000+00:00", 
        "version": "master__000003", 
        "user_name": "captain-68305620", 
        "description": "", 
        "last_update": "2017-05-09T14:18:07.761000+00:00"
    }, 
    "self": "http://local.crunch.io:19404/api/datasets/5283e3f4e3d645c0a750c09e854bdcb1/savepoints/6fbe47c97d8e4290a0c09227d6d6b63a/", 
    "views": {
        "revert": "http://local.crunch.io:19404/api/datasets/5283e3f4e3d645c0a750c09e854bdcb1/savepoints/6fbe47c97d8e4290a0c09227d6d6b63a/revert/"
    }, 
    "element": "shoji:entity"
})
```

There is no guarantee that creating a savepoint will lead to a savepoint that points
to the exact revision the dataset was when the POST was issued. This is because
the dataset might have moved forward in the meanwhile. For this reason instead
of reponding with a `Location` header that points to an exact savepoint, the
POST savepoints endpoint will respond with `Location` header that points to 
`/progress/{operation_id}/result` URL, which when accessed will
redirect to the nearest savepoint for that revision.

#### Reverting savepoints

You can revert to any savepoint version (throwing away any changes since that
time) with a POST to `/datasets/{dataset_id}/savepoints/{version_id}/revert/`.

It will return a 202 response with a Shoji:view containing a progress URL on
its value where the asynchronous job's status can be observed.

### Forking and Merging

A common pattern when collaborating on a dataset is for one person to make changes on their own and then, when all is ready, share the whole set of changes back to the other collaborators. Crunch implements this with two mechanisms: the ability to "fork" a dataset to make a copy, and then "merge" any changes made to it back to the original dataset.

To fork a dataset, POST a new fork entity to the dataset's forks catalog.
 
```python
>>> ds.forks.index
{}
>>> forked_ds = ds.forks.create({"body": {"name": "My fork"}}).refresh()
>>> ds.forks.index.keys() == [forked_ds.self]
True
>>> ds.forks.index[forked_ds.self]["name"]
"My fork"
```

The response will be a 201 response if the fork could happen in the allotted time limit for the request or a 202 if the fork requires too much time and is going to continue in background.
Both cases will include a Location header with the URL of the new dataset that has been forked from the current one.

```http
POST /api/datasets/{id}/forks/ HTTP/1.1
Host: app.crunch.io
Content-Type: application/json
Content-Length: 231

{
    "element": "shoji:entity",
    "body": {"name": "My fork"}
}

----

HTTP/1.1 201 Created
Location: https://app.crunch.io/api/datasets/{forked_id}/
```

In case of a 202, in addition to the Location headers with the URL of the fork that is going to be created, the response will contain a Shoji view with the url of the endpoint that can be polled
to track fork completion

```http
POST /api/datasets/{id}/forks/ HTTP/1.1
Host: app.crunch.io
Content-Type: application/json
Content-Length: 231

{
    "element": "shoji:entity",
    "body": {"name": "My fork"}
}

----

HTTP/1.1 202 Accepted
Location: https://app.crunch.io/api/datasets/{forked_id}/
...
{
    "element": "shoji:view",
    "value": "/progress/{progress_id}/"
}
```

The forked dataset can then be viewed and altered like the original; however, those changes do not alter the original until you merge them back with a POST to `datasets/{id}/actions/`.

```python
ds.actions.post({
    "element": "shoji:entity",
    "body": {"dataset": forked_ds.self, "autorollback": True}
})
```

```http
POST /api/datasets/5de96a/actions/ HTTP/1.1
Host: app.crunch.io
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
```

```json
{
    "element": "shoji:view",
    "self": "https://app.crunch.io/api/datasets/5de96a/actions/",
    "value": "https://app.crunch.io/api/progress/912ab3/"
}
```

The POST to the actions catalog tells the original dataset to replay a set of
actions; since we specify a "dataset" url, we are telling it to replay all
actions from the forked dataset. Crunch keeps track of which actions are
already common between the two datasets, and won't try to replay those. You can
even make further changes to the forked dataset and merge again and again.

Use the "autorollback" member to tell Crunch how to handle merge conflicts. If
an action cannot be replayed on the original dataset (typically because it 
had conflicting changes or has been rolled back), then if "autorollback" is 
true (the default), the original dataset will be reverted to the previous 
state before any of the new changes were applied. If "autorollback" is false, 
the dataset is left to the last action that it could successfully play, 
which allows you to investigate the problem, repair it if possible (in either dataset as needed), 
and then POST again to continue the merge from that point.

Per-user settings (filters, decks and slides, variable permissions etc) are copied to the new dataset when you fork. However, changes to them are not merged back at this time. Please reach out to us as you experiment so we can fine-tune which details to fork and merge as we discover use cases.

Merging actions may take a few seconds, in which case the POST to actions/ will return 204 when finished. Merging many or large actions, however, may take longer, in which case the POST will return 202 with a Location header containing the URL of a [progress resource](#progress).

#### Filtered Merges

When merging actions it is possible to provide a filter to select which actions should
be replayed from the other dataset. It is currently possible to filter them by `key` and by `hash`.

When filtering by `hash`, only the provided actions will be merged:

```python
ds.actions.post({
    "element": "shoji:entity",
    "body": {"dataset": forked_ds.self,
             "filter": {"hash": ["000003"]}}
})
```

When filtering by `key`, only the actions that are part of that category will be merged:

```python
ds.actions.post({
    "element": "shoji:entity",
    "body": {"dataset": forked_ds.self,
             "filter": {"key": ["Variable.create"]}}
})
```

##### Recording the filtered actions

If you know that you are going to merge from the same two datasets multiple times
it is possible to tell crunch to remember the filtered actions so that a subsequent
merge to the same target won't try to apply them again if they were skipped in a previous merge.

This behaviour can be changed by providing `remember: True` option to the filter,
which means that the filtered actions will be recorded and a subsequent merge won't
try to apply them to the target if they are not explicitly filtered again.

```python
ds.actions.post({
    "element": "shoji:entity",
    "body": {"dataset": forked_ds.self,
             "remember": True,
             "filter": {"key": ["Variable.create"]}}
})
```

Note that only the actions skipped during this merge are recorded, so the previous example
won't skipp all the `Variable.create` actions forever, but will only remember the action
that was skipped at that time.
