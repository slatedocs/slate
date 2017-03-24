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


Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the list entry object.
list_id | integer | The unique identifier of the list on which the list entry resides.
creator_id | integer | The unique identifier of the person who created the list entry. 
entity_id | integer | The unique identifier of the entity corresponding to the list entry. 
created_at | string, datetime | The time when the list entry was created.

## Get all list entries

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

Parameter | Type | Description
--------- | ------- | -----------
list_id | integer | The unique id of the list object to be retrieved.

### Returns

## Create a new list entry

> Example Request

> Example Response

### Path Parameters

Parameter | Type | Description
--------- | ------- | -----------
list_id | integer | The unique id of the list object to be retrieved.

### Query Parameters

### Returns

## Get a specific list entry

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

### Path Parameters

Parameter | Type | Description
--------- | ------- | -----------
list_id | integer | The unique id of the list object to be retrieved.
list_entry_id | integer | The unique id of the list entry object to be retrieved.

### Returns

## Delete a specific list entry

> Example Request

> Example Response

### Parameters

### Returns
