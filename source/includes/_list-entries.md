# List Entries

## The list entry resource

> Example Response

```json
{
  "id": 16367,
  "list_id": 450,
  "creator_id": 38706,
  "entity_id": 287125,
  "entity": {
    "type": 1,
    "first_name": "John",
    "last_name": "Doe",
    "phone_numbers": [ ],
    "primary_email": "jdoe@jdoe.com",
    "emails": [
      "jdoe@jdoe.com",
      "jdoe2@jdoe2.com",
    ],
  },
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
is only used for getting, adding, or removing entities from a list. It does not
handle updating individual cells in columns.

Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the list entry object.
list_id | integer | The unique identifier of the list on which the list entry resides.
creator_id | integer | The unique identifier of the user who created the list entry. If you create a list entry through the API, the user corresponding to the API token will be the creator by default.
entity_id | integer | The unique identifier of the entity corresponding to the list entry.
entity | object | Object containing entity-specific details like name, email address, domain etc. for the entity corresponding to `entity_id`.
created_at | datetime | The time when the list entry was created.

## Get all list entries

> Example Request

```shell
curl "https://api.affinity.co/lists/450/list-entries" -u :<API-KEY>
```
> Example Response

```json
[
  {
    "id": 64608,
    "list_id": 222,
    "creator_id": 287843,
    "entity_id": 62034,
    "created_at": "2017-05-04 10:44:31 -0700",
    "entity": {
      "type": 0,
      "first_name": "Affinity",
      "last_name": "Team",
      "phone_numbers": [ ],
      "primary_email": "team@affinity.co",
      "emails": [
        "team@affinity.co"
      ],
    },
  },
  {
    "id": 53510,
    "list_id": 222,
    "creator_id": 38596,
    "entity_id": 241576,
    "created_at": "2017-02-22 15:22:21 -0800",
    "entity": {
      "type": 0,
      "first_name": "John",
      "last_name": "Doe",
      "phone_numbers": [ ],
      "primary_email": "jdoe@stanford.edu",
      "emails": [
        "jdoe@stanford.edu"
      ],
    },
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
curl "https://api.affinity.co/lists/450/list-entries/16367" -u :<API-KEY>
```

> Example Response

```json
{
  "id": 53510,
  "list_id": 222,
  "creator_id": 38596,
  "entity_id": 241576,
  "created_at": "2017-02-22 15:22:21 -0800",
  "entity": {
    "type": 0,
    "first_name": "John",
    "last_name": "Doe",
    "phone_numbers": [ ],
    "primary_email": "jdoe@stanford.edu",
    "emails": [
      "jdoe@stanford.edu"
    ],
  },
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
curl "https://api.affinity.co/lists/450/list-entries" \
   -u :<API-KEY> \
   -d entity_id=38706
 ```

> Example Response

```json
{
  "id": 53510,
  "list_id": 222,
  "creator_id": 38596,
  "entity_id": 241576,
  "created_at": "2017-02-22 15:22:21 -0800",
  "entity": {
    "type": 0,
    "first_name": "John",
    "last_name": "Doe",
    "phone_numbers": [ ],
    "primary_email": "jdoe@stanford.edu",
    "emails": [
      "jdoe@stanford.edu"
    ],
  },
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
entity_id | integer | true| The unique id of the entity (person, organization, or opportunity) to add to this list.
creator_id | integer | false | The id of a Person resource who should be recorded as adding the entry to the list. Must be a person who can access Affinity. If not provided the creator defaults to the owner of the API key.

### Returns
The list entry resource that was just created through this request.

## Delete a specific list entry
> Example Request

```shell
curl "https://api.affinity.co/lists/450/list-entries/56517" \
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

**Note:**

1. This will also delete all the field values, if any, associated with the list entry.
Such field values will only exist in fields specific to this list.
2. If the list entry belongs to an Opportunity list, then the opportunity that the list
entry is associated with will also be deleted.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list that contains the specified `list_entry_id`.
list_entry_id | integer | true| The unique id of the list entry object to be deleted.

### Returns
The JSON object `{"success": true}`.
