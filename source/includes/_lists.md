# Lists

## The list resource

> Example Response

```json
{
  "id": 450,
  "type": 0,
  "name": "My List of People",
  "public": true,
  "owner_id": 38706,
  "list_size": 67
}
```

Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the list object.
type | integer | The type of the entities contained within the list. 
name | string | The title of the list that is displayed in Affinity.
public | boolean | True if the list is public and false if the list is private.
owner_id | integer | The id of the internal person that owns this list.
list_size | integer | The number of entities contained within the list.

### List types

List Type | Value | Description
--------- | ------- | -----------
person | 0 | Type specifying a list of people.
company | 1 | Type specifiying a list of organizations.

## Get all lists

> Example Request

```shell
curl "https://api.affinity.vc/lists?key=<API-KEY>"
```

> Example Response

```json
[
  {
    "id": 450,
    "name": "My List of People",
    "type": 0,
  },
  {
    "id": 383,
    "name": "My List of Companies",
    "type": 1,
  },
  ...
]
```

`GET /lists`

Returns a collection of all the lists visible to you. 

### Parameters
None

### Returns
An array of all the list resources for lists visible to you. Each list resource in the
array includes the list id, list title, and entity type. 

## Get a specific list

> Example Request

```shell
curl "https://api.affinity.vc/lists/450?key=<API-KEY>"
```

> Example Response

```json
{
  "id": 450,
  "type": 0,
  "name": "My List of People",
  "public": true,
  "owner_id": 38706,
  "list_size": 67
  "entity_attributes": [
    {
      "id": 1625,
      "name": "Status",
      "value_type": 7,
      "allows_multiple": false,
      "dropdown_options": [
        {
          "id": 886,
          "text": "Interested",
          "rank": 1,
          "color": 0
        }
      ]
    },
    {
      "id": 1626,
      "name": "Owners",
      "value_type": 0,
      "allows_multiple": true,
      "dropdown_options": [],
    },
    ...
  ]
}
```

`GET /lists/{list_id}`

Gets the details for a specific list given the existing list id.

### Path Parameters

Parameter | Type | Description
--------- | ------- | -----------
list_id | integer | The unique id of the list object to be retrieved.

### Returns
The details of the list resource corresponding to the list id specified in the path
parameter. These details include an array of the entity attributes that are specific
to the entities on the list. If an invalid list id is supplied, an error is returned.
