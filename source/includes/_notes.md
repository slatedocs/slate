# Notes

## The note resource
Each list comprises a number of entries. Each list entry object has a creator, a list
that it belongs to, and the underlying entity it represents (this is a person or organization)
depending on the type of the list.

If you want to perform any operations on a list, like adding and removing entities, you must
use the list entry abstraction in order to achieve so!

**Note:**
The values corresponding to entity attributes (list-specific columns) do not live
inside the list entry, see the `Entity Values` section for more information. In simpler words,
if you are trying to update / create / delete a value in one of the custom columns, please refer
to the `Entity Values` section. The list entry API only allows you to see what's in a list, and add or remove
entries from it, but it does not allow you to update individual cells in the custom list-specific columns.


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


Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the list entry object.
list_id | integer | The unique identifier of the list on which the list entry resides.
creator_id | integer | The unique identifier of the user who created the list entry. If you create a list entry through the API, the user corresponding to the API token will be the creator by default.
entity_id | integer | The unique identifier of the entity corresponding to the list entry.
created_at | string, datetime | The time when the list entry was created.

## Get all list entries
`GET /lists/{list_id}/list-entries`

Fetches all the list entries in the list with the supplied list id.

> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries?key=<API-KEY>"
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

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list whose list entries are to be retrieved.

### Returns
An array of all the list entry resources corresponding to the provided list.
Each list entry in the array includes all the attributes as specified in the list entry resource
above.

## Get a specific list entry

`GET /lists/{list_id}/list-entries/{list_entry_id}`

Fetches a list entry with a specified id.

> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries/16367?key=<API-KEY>"
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

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list that contains the specified `list_entry_id`.
list_entry_id | integer | true| The unique id of the list entry object to be retrieved.

### Returns
The list entry object corresponding to the `list_entry_id`.

## Create a new list entry

`POST /lists/{list_id}/list-entries`

Creates a new list entry in the list with the supplied list id.

**Note:** A list can contain the same entity multiple times. Depending on your use case, before you add an entry,
you might want to make sure that it does not exist in the list already.

> Example Request

> Example Response

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list whose list entries are to be retrieved.
entity_id | integer | true| The unique id of the entity you want to add to this list.

### Returns
The list entry object that was just created through this request.

## Delete a specific list entry

`DELETE /lists/{list_id}/list-entries/{list_entry_id}`

Deletes a list entry with a specified `list_entry_id`.

**Note:** This will also delete all the entity values, if any, associated with the list entry.
Such entity values will only exist in entity attributes specific to this list.

> Example Request

```shell
```

> Example Response

```json
```

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list that contains the specified `list_entry_id`.
list_entry_id | integer | true| The unique id of the list entry object to be deleted.

### Returns
`{success: true}`.
