# List Entries

## The list entry resource

> Example Response

```json
{
  "id": 16367,
  "list_id": 450,
  "creator_id": 38706,
  "entity_id": 287125,
  "created_at": "2017-01-16 16:34:03 -0800"
}
```

Each list comprises a number of entries. Each list entry has a creator, a list
that it belongs to, and the underlying entity it represents depending on the type of the
list (people or organizations).

Operations like adding and removing entities from a list can be accomplished using the
list entry abstraction.

**Note:**
Although list entries correspond to rows in an Affinity spreadsheet, the values
associated with the entity are not stored inside the list entry resource. If you are
trying to update, create, or delete a value in one of the custom columns for this list
entry, please refer to the [Field Values](#field-values) section. The list entry API
is only used for getting, adding, or removing entities from a lst. It does not
handle updating individual cells in columns.

Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the list entry object.
list_id | integer | The unique identifier of the list on which the list entry resides.
creator_id | integer | The unique identifier of the user who created the list entry. If you create a list entry through the API, the user corresponding to the API token will be the creator by default.
entity_id | integer | The unique identifier of the entity corresponding to the list entry.
created_at | datetime | The time when the list entry was created.

## Get all list entries

> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries" -u :<API-KEY>
```
> Example Response

```json
[
  {
    "id": 56515,
    "list_id": 450,
    "creator_id": 38706,
    "entity_id": 312898,
    "created_at": "2017-03-23 11:42:15 -0700"
  },
  {
    "id": 16367,
    "list_id": 450,
    "creator_id": 38599,
    "entity_id": 287125,
    "created_at": "2017-01-16 16:34:03 -0800"
  },
  ...
]
```

`GET /lists/{list_id}/list-entries`

Fetches all the list entries in the list with the supplied list id.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list whose list entries are to be retrieved.

### Returns
An array of all the list entry resources corresponding to the provided list.
Each list entry in the array includes all the attributes as specified in the
[list entry resource](#the-list-entry-resource) section above.

## Get a specific list entry

`GET /lists/{list_id}/list-entries/{list_entry_id}`

Fetches a list entry with a specified id.

> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries/16367" -u :<API-KEY>
```

> Example Response

```json
{
  "id": 16367,
  "list_id": 450,
  "creator_id": 38599,
  "entity_id": 287125,
  "created_at": "2017-01-16 16:34:03 -0800"
}
```

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list that contains the specified `list_entry_id`.
list_entry_id | integer | true| The unique id of the list entry object to be retrieved.

### Returns
The list entry object corresponding to the `list_entry_id`.

## Create a new list entry
> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries" \
   -u :<API-KEY> \
   -d entity_id=38706
 ```

> Example Response

```json
{
  "id": 56517,
  "list_id": 450,
  "creator_id": 38706,
  "entity_id": 38706,
  "created_at": "2017-03-26 16:27:51 -0700"
}
```

`POST /lists/{list_id}/list-entries`

Creates a new list entry in the list with the supplied list id.

**Note:** A list can contain the same entity multiple times. Depending on your use case, before you add an entry,
you might want to make sure that it does not exist in the list already.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list whose list entries are to be retrieved.
entity_id | integer | true| The unique id of the entity (person or company) to add to this list.

### Returns
The list entry resource that was just created through this request.

## Delete a specific list entry
> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries/56517" \
   -u :<API-KEY> \
   -d entity_id=38706 \
   -X "DELETE"
 ```

> Example Response

```json
{"success": true}
```

`DELETE /lists/{list_id}/list-entries/{list_entry_id}`

Deletes a list entry with a specified `list_entry_id`.

**Note:** This will also delete all the field values, if any, associated with the list entry.
Such field values will only exist in fields specific to this list.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list that contains the specified `list_entry_id`.
list_entry_id | integer | true| The unique id of the list entry object to be deleted.

### Returns
The JSON object `{"success": true}`.
