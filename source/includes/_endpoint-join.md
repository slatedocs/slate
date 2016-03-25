## Joins

### Catalog

`/datasets/{id}/joins/`

A GET on this resource returns a Shoji Catalog enumerating the joins present in the Dataset. Each tuple in the index includes a "left_key" and a "right_key" member, each of which MUST be a variable URI. The left_key MUST be a variable in the current dataset, and the right_key SHOULD be a variable in another dataset. Both variables MUST be unique, and should be values taken from the same domain. For example, you might have a principal dataset which is a survey, with a respondent_id variable as a unique key. If you join a separate demographic dataset that has a unique column of the same respondent ids, you might see:

```json
{
    "element": "shoji:catalog",
    "self": "...datasets/837498a/joins/",
    "index": {
        "...datasets/837498a/joins/demo/": {
            "left_key": "...datasets/837498a/variables/1ef71d/",
            "right_key": "...datasets/de3095/variables/19471d/"
    }
}
```

A PATCH to this resource may add joins (by including new index members), alter existing joins (by replacing existing index members), or deleting joins (by setting existing members to null). A 204 indicates success. As with any Shoji Catalog, the URI of each entity in the index is the key.

Variables in joined datasets may then be used in analyses as if they were part of the principal dataset, simply by using their URI in this join's variables catalog (see below). The joined dataset includes one row for each row in the principal dataset, by taking the key in the principal and looking up the corresponding key and row in the subordinate dataset. Rows in the principal which have no corresponding row in the subordinate are filled with the "No Data" missing value.

In order to create or alter a new join, the authenticated user will need to have reading access to the right dataset otherwise the server will respond with a 400 error.

The variable url sent for the left key must be a valid url for the current dataset. It is not allowed to use a different dataset as a left table.

### Entity

`/datasets/{id}/joins/{id}/`

A GET on this resource returns a Shoji Entity describing the join, and a link to its Crunch Table (see next). Currently, the Join entity only contains the batch_id for its frame, and therefore isn't very useful for clients. The entity resource is not editable; PATCH the joins catalog instead.

### Joined variables catalog

`/datasets/{id}/joins/{id}/variables/`

A variables catalog which describes variables in the subordinate dataset. See Variables for more details.