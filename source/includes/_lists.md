# Lists

Lists are the primary data structure that you can interact with in Affinity. Each list
manages a collection of either people, organizations or opportunities. We call people, 
organizations and opportunities "entities".

A list in Affinity is easily represented as a spreadsheet. The rows of the spreadsheet
are the list entries, and each list entry corresponds to a single person in a list of
people, an organization in a list of organizations or an opportunity in a list of opportunities.

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

## The List Resource

> Example Response

```json
{
  "id": 450,
  "type": 0,
  "name": "My List of People",
  "public": true,
  "owner_id": 38706,
  "creator_id": 38901,
  "list_size": 67,
  "additional_permissions": [
    {
      "internal_person_id": 38706,
      "role_id": 0
    }
  ]
}
```

| Attribute | Type    | Description                                                                                                   |
| --------- | ------- | ------------------------------------------------------------------------------------------------------------- |
| id        | integer | The unique identifier of the list object.                                                                     |
| type      | integer | The type of the entities contained within the list. A list can contain people or organizations, but not both. |
| name      | string  | The title of the list that is displayed in Affinity.                                                          |
| public    | boolean | If the list is publicly accessible to all users in your team, this is true. Otherwise, this is false.         |
| owner_id  | integer | The unique ID of the internal person who owns this list.                                                      |
| creator_id| integer | The unique ID of the internal person who created the list. If you create a list through the API, the user corresponding to the API token will be the creator. |
| list_size | integer | The number of list entries contained within the list.                                                         |
| additional_permissions  | object[] | The list of additional permissions that are associated with this list. Permissions, if any, should have `internal_person_id` which is the unique ID of the internal person and `role_id` which is the role type ID.                                         |

### List Types

| List Type    | Value | Description                              |
| ------------ | ----- | ---------------------------------------- |
| person       | 0     | Type specifying a list of people.        |
| organization | 1     | Type specifying a list of organizations. |
| opportunity  | 8     | Type specifying a list of opportunities. |

### Role Types

| Role Type IDs  | Description                              |
| -------------- | ---------------------------------------- |
| 0     | Admin role. |
| 1     | Basic role. |
| 2     | Standard role. |

Refer to <a href="https://support.affinity.co/hc/en-us/articles/360029432951-List-Level-Permissions" target="_blank">List Level Permissions</a> for more details on `Admin`, `Basic` and `Standard` roles.

## Get All Lists

> Example Request

```shell
# Returns an array of all lists that you have access to.
curl "https://api.affinity.co/lists" -u :$APIKEY
```

> Example Response

```json
[
  {
    "id": 450,
    "type": 0,
    "name": "My List of People",
    "public": true,
    "owner_id": 38706,
    "list_size": 67
  },
  {
    "id": 383,
    "type": 1,
    "name": "My List of Organizations",
    "public": true,
    "owner_id": 38706,
    "list_size": 50
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

## Get a Specific List

> Example Request

```shell
# Returns the list with the specified `list_id`
curl "https://api.affinity.co/lists/450" -u :$APIKEY
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

| Parameter | Type    | Required | Description                                       |
| --------- | ------- | -------- | ------------------------------------------------- |
| list_id   | integer | true     | The unique ID of the list object to be retrieved. |

### Returns

The details of the list resource corresponding to the list ID specified in the path
parameter. These details include an array of the fields that are specific
to this list. An appropriate error is returned if an invalid list is supplied.

## Create a New List

> Example Request

```shell
curl -X POST “https://api.affinity.co/lists” \
   -u :$APIKEY \
   -H "Content-Type: application/json" \
   -d '{ "name": "My List of Organizations", "type": 1, "is_public": true, "owner_id": 38706, "additional_permissions": [ {"internal_person_id": 38701, "role_id": 0}, {"internal_person_id": 38703, "role_id": 1}, {"internal_person_id": 38900, "role_id": 0} ]}'
```

> Example Response

```json
{
  "id": 383,
  "type": 1,
  "name": "My List of Organizations",
  "public": true,
  "owner_id": 38706,
  "creator_id": 38701,
  "list_size": 0,
  "additional_permissions": [
    {
      "internal_person_id": 38701,
      "role_id": 0
    },
    {
      "internal_person_id": 38703,
      "role_id": 1
    },
    {
      "internal_person_id": 38900,
      "role_id": 0
    }
  ]
}
```

`POST /lists`

Creates a new list with the supplied parameters.

### Payload Parameters

| Parameter        | Type      | Required | Description                                                                                        |
| ---------------- | --------- | -------- | -------------------------------------------------------------------------------------------------- |
| name  | string | true     | The title of the list that is displayed in Affinity. |
| type | integer | true    | The type of the entities contained within the list. A list can contain people or organizations, but not both. |
| is_public  | boolean | true     | When true, the list is publicly accessible to all users in your team. |
| owner_id  | integer | false     | The unique ID of the internal person who is assigned this list. |
| additional_permissions  | object[] | false     | The list of additional permissions that are associated with this list. See the [List Resource](#the-list-resource) section for more details on permissions. |

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>If the owner_id is not provided, the user corresponding to the API token will be considered as the owner, which is the same as the creator.</li>
    <li>Owner of the list will have Admin permissions. Additional permissions can be set for the creator and other users if required.</li>
  </ul>
</aside>

### Returns

The list resource that was just created through this request.