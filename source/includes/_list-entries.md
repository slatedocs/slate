# List Entries

## The List Entry Resource

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
    "primary_email": "jdoe@jdoe.com",
    "emails": ["jdoe@jdoe.com", "jdoe2@jdoe2.com"]
  },
  "created_at": "2017-01-16T16:34:03.539-08:00"
}
```

Each list comprises a number of entries. Each list entry has a creator, a list
that it belongs to, and the underlying entity it represents depending on the type of the
list (people, organizations or opportunities).

Operations like adding and removing entities from a list can be accomplished using the
list entry abstraction.

| Attribute  | Type     | Description                                                                                                                                                                       |
| ---------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id         | integer  | The unique identifier of the list entry object.                                                                                                                                   |
| list_id    | integer  | The unique identifier of the list on which the list entry resides.                                                                                                                |
| creator_id | integer  | The unique identifier of the user who created the list entry. If you create a list entry through the API, the user corresponding to the API token will be the creator by default. |
| entity_id  | integer  | The unique identifier of the entity corresponding to the list entry.                                                                                                              |
| entity     | object   | Object containing entity-specific details like name, email address, domain etc. for the entity corresponding to `entity_id`.                                                      |
| created_at | datetime | The time when the list entry was created.                                                                                                                                         |

<aside class="notice">
  <h6>Note</h6>
  <p>Although list entries correspond to rows in an Affinity spreadsheet, the values associated with the entity are not stored inside the list entry resource. If you are trying to update, create, or delete a value in one of the custom columns for this list entry, please refer to the <a href="#field-values">Field Values</a> section. The list entry API is only used for getting, adding, or removing entities from a list. It does not handle updating individual cells in columns.</p>
</aside>

## Get All List Entries

> Example Request

```shell
curl "https://api.affinity.co/lists/450/list-entries" -u :$APIKEY
```

> Example Response

```json
[
  {
    "id": 64608,
    "list_id": 450,
    "creator_id": 287843,
    "entity_id": 62034,
    "created_at": "2017-05-04T10:44:31.525-08:00",
    "entity": {
      "type": 0,
      "first_name": "Affinity",
      "last_name": "Team",
      "primary_email": "team@affinity.co",
      "emails": [
        "team@affinity.co"
      ],
    },
  },
  {
    "id": 53510,
    "list_id": 450,
    "creator_id": 38596,
    "entity_id": 241576,
    "created_at": "2017-02-22T15:22:21.125-08:00",
    "entity": {
      "type": 0,
      "first_name": "John",
      "last_name": "Doe",
      "primary_email": "jdoe@stanford.edu",
      "emails": [
        "jdoe@stanford.edu"
      ],
    },
  },
  ...
]
```

> Example Response with Pagination

```json
{
  "list_entries": [
    {
      "id": 64608,
      "list_id": 450,
      "creator_id": 287843,
      "entity_id": 62034,
      "created_at": "2017-05-04T10:44:31.526-08:00",
      "entity": {
        "type": 0,
        "first_name": "Affinity",
        "last_name": "Team",
        "primary_email": "team@affinity.co",
        "emails": [
          "team@affinity.co"
        ],
      },
    },
    {
      "id": 53510,
      "list_id": 450,
      "creator_id": 38596,
      "entity_id": 241576,
      "created_at": "2017-02-22T15:22:21.125-08:00",
      "entity": {
        "type": 0,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "jdoe@stanford.edu",
        "emails": [
          "jdoe@stanford.edu"
        ],
      },
    },
    ...
  ],
  "next_page_token": "eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9"
}
```

`GET /lists/{list_id}/list-entries`

If no page size is specified, fetches all the list entries in the list with the supplied
list id. If a page size is specified, fetches up to that number of list entries in the
list with the supplied list id.

### Path Parameters

| Parameter | Type    | Required | Description                                                       |
| --------- | ------- | -------- | ----------------------------------------------------------------- |
| list_id   | integer | true     | The unique ID of the list whose list entries are to be retrieved. |

### Query Parameters

| Parameter  | Type    | Required | Description                                                                                     |
| ---------- | ------- | -------- | ----------------------------------------------------------------------------------------------- |
| page_size  | integer | false    | How many results to return per page. (Default is to return all results.)                        |
| page_token | string  | false    | The `next_page_token` from the previous response required to retrieve the next page of results. |

### Returns

If the `page_size` is not passed in as a parameter, an array of all the list entry
resources corresponding to the provided list will be returned.
If the `page_size` is passed in as a parameter, an object with two fields: `list_entries`
and `next_page_token` are returned. `list_entries` maps to an array of up to `page_size`
list entries. `next_page_token` includes a token to be sent along with the next request
as the `page_token` parameter to fetch the next page of results.
Each list entry in the both cases includes all the attributes as specified in the
[List Entry Resource](#the-list-entry-resource) section above.

## Get a Specific List Entry

`GET /lists/{list_id}/list-entries/{list_entry_id}`

Fetches a list entry with a specified id.

> Example Request

```shell
curl "https://api.affinity.co/lists/450/list-entries/16367" -u :$APIKEY
```

> Example Response

```json
{
  "id": 16367,
  "list_id": 450,
  "creator_id": 38596,
  "entity_id": 241576,
  "created_at": "2017-02-22T15:22:21.125-08:00",
  "entity": {
    "type": 0,
    "first_name": "John",
    "last_name": "Doe",
    "primary_email": "jdoe@stanford.edu",
    "emails": ["jdoe@stanford.edu"]
  }
}
```

### Path Parameters

| Parameter     | Type    | Required | Description                                                            |
| ------------- | ------- | -------- | ---------------------------------------------------------------------- |
| list_id       | integer | true     | The unique ID of the list that contains the specified `list_entry_id`. |
| list_entry_id | integer | true     | The unique ID of the list entry object to be retrieved.                |

### Returns

The list entry object corresponding to the `list_entry_id`.

## Create a New List Entry

> Example Request

```shell
curl -X POST “https://api.affinity.co/lists/450/list-entries” \
   -u :$APIKEY \
   -H "Content-Type: application/json" \
   -d '{"entity_id": 38706}'
```

> Example Response

```json
{
  "id": 53510,
  "list_id": 450,
  "creator_id": 38596,
  "entity_id": 38706,
  "created_at": "2017-02-22T15:22:21.125-08:00",
  "entity": {
    "type": 0,
    "first_name": "John",
    "last_name": "Doe",
    "primary_email": "jdoe@stanford.edu",
    "emails": ["jdoe@stanford.edu"]
  }
}
```

`POST /lists/{list_id}/list-entries`

Creates a new list entry in the list with the supplied list id.

### Path Parameters

| Parameter | Type    | Required | Description                                                       |
| --------- | ------- | -------- | ----------------------------------------------------------------- |
| list_id   | integer | true     | The unique ID of the list whose list entries are to be retrieved. |

### Payload Parameters

| Parameter  | Type    | Required | Description                                                                                                                                                                                     |
| ---------- | ------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| entity_id  | integer | true     | The unique ID of the person or organization to add to this list. Opportunities **cannot** be created using this endpoint. See note below.                                                       |
| creator_id | integer | false    | The ID of a Person resource who should be recorded as adding the entry to the list. Must be a person who can access Affinity. If not provided the creator defaults to the owner of the API key. |

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>Opportunities <span class="bold">cannot</span> be created using this endpoint. Instead use the <code><a href="#create-a-new-opportunity">POST /opportunities</a></code> endpoint.</li>
    <li>Person and company lists can contain the same entity multiple times. Depending on your use case, before you add an entry, you may want to verify whether or not it exists in the list already.</li>
  </ul>
</aside>

### Returns

The list entry resource that was just created through this request.

## Delete a Specific List Entry

> Example Request

```shell
curl "https://api.affinity.co/lists/450/list-entries/56517" \
   -u :$APIKEY \
   -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /lists/{list_id}/list-entries/{list_entry_id}`

Deletes a list entry with a specified `list_entry_id`.

### Path Parameters

| Parameter     | Type    | Required | Description                                                            |
| ------------- | ------- | -------- | ---------------------------------------------------------------------- |
| list_id       | integer | true     | The unique ID of the list that contains the specified `list_entry_id`. |
| list_entry_id | integer | true     | The unique ID of the list entry object to be deleted.                  |

### Returns

The JSON object `{"success": true}`.

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>This will also delete all the field values, if any, associated with the list entry. Such field values will only exist in fields specific to this list.</li>
    <li>If the list entry belongs to an Opportunity list, then the opportunity that the list entry is associated with will also be deleted.</li>
  </ul>
</aside>
