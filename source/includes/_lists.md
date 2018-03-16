# Lists
Lists are the primary data structure that you can interact with in Affinity. Each list
manages a collection of either people or organizations. We call people or organizations
"entities".

A list in Affinity is easily represented as a spreadsheet. The rows of the spreadsheet
are the list entries, and each list entry corresponds to a single person in a list of
people, or organization in a list of organizations.

Lists in Affinity can also have any number of custom attributes. These attributes allow
you to fully customize your workflow and model the data for your use case. We call these
attributes "fields", and each fields represents a column in the
spreadsheet representation.

As a simple example:
A list called "Important People" might have 25 people in it. Two of the columns in the
sheet could be "Title" and "Industry".

This list would have 25 "list entries". Each list entry would be associated with a single
person entity. Furthermore, the list would have two "fields" with the names
"Title" and "Industry".

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
type | integer | The type of the entities contained within the list. A list can contain people or organizations, but not both.
name | string | The title of the list that is displayed in Affinity.
public | boolean | If the list is publicly accessible to all users in your team, this is true. Otherwise, this is false.
owner_id | integer | The unique id of the internal person who created this list.
list_size | integer | The number of list entries contained within the list.

### List types

List Type | Value | Description
--------- | ------- | -----------
person | 0 | Type specifying a list of people.
organization | 1 | Type specifying a list of organizations.

## Get all lists

> Example Request

```shell
# Returns an array of all lists that you have access to.
curl "https://api.affinity.co/lists" -u :<API-KEY>
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
    "name": "My List of Organizations",
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
array includes the `id`, `name`, and `type` (refer to the
[list resource](#the-list-resource) above for further help).

## Get a specific list

> Example Request

```shell
# Returns the list with the specified `list_id`
curl "https://api.affinity.co/lists/450" -u :<API-KEY>
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
  "fields": [
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

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
list_id | integer | true | The unique id of the list object to be retrieved.

### Returns
The details of the list resource corresponding to the list id specified in the path
parameter. These details include an array of the fields that are specific
to this list. An appropriate error is returned if an invalid list is supplied.
