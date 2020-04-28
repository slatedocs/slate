# Field Value Changes

The field value changes allow you to see historical changes to the values of fields in Affinity.
This is especially useful for tracking progress through statuses (e.g. Lead --> Closed Won).

**Note:**
Only certain fields have their historical values tracked; the API will return an appropriate
error if the field doesn't support historical tracking.

## The field value change resource

> Example Response

```json
{
  "id": 50822718,
  "field_id": 236333,
  "entity_id": 261131046,
  "list_entry_id": 15709964,
  "action_type": 0,
  "changer": {
    "id": 38706,
    "type": 0,
    "first_name": "Jane",
    "last_name": "Doe",
    "primary_email": "jane@gmail.com",
    "emails": ["jane@gmail.com"]
  },
  "changed_at": "2020-04-11T15:46:50.963-07:00",
  "value": {
    "id": 1607859,
    "text": "New",
    "rank": 1,
    "color": 0
  }
}
```

Each field value change object has a unique `id`.

A field value change also has `field_id`, `entity_id`, `list_entry_id` attributes that give it the
appropriate associations, as noted in the example above.

**Note:**
There are some extra attributes returned by this endpoint; they will be deprecated soon and
should not be used.

| Attribute     | Type           | Description                                                                                                                                                                                        |
| ------------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id            | integer        | The unique identifier of the field value object.                                                                                                                                                   |
| field_id      | integer        | The unique identifier of the field the value is associated with.                                                                                                                                   |
| entity_id     | integer        | The unique identifier of the person, organization, or opportunity object the field value is associated with.                                                                                       |
| list_entry_id | integer        | The unique identifier of the list entry object the field value is associated with. This only exists if the field the value is associated with is list-specific.                                    |
| action_type   | One of several | The action_type attribute can take on several different types. See below for reference.                                                                                                            |
| value         | One of many    | The value attribute can take on many different types, depending on the field `value_type`. When the action type is Delete, value represents the old value; otherwise, it represents the new value. |

### Field Value Change action types

The Action Type specified below corresponds to the `action_type` of a field value change.
This attribute is required, and filters the Field Value Changes that are returned. For example,
when an `action_type` of 0 is specified, all the Field Value Change objects that are returned
will represent when a Field Value has been created.

| Action Type | Type   |
| ----------- | ------ |
| 0           | Create |
| 1           | Update |
| 2           | Delete |

## Get field values changes

> Example Request

```shell
curl "https://api.affinity.co/field-values-changes?field_id=38706" -u :<API-KEY>
```

> Example Response

```json
[
  {
    "id": 50822718,
    "field_id": 236333,
    "entity_id": 261131046,
    "list_entry_id": 15709964,
    "action_type": 0,
    "changer": {
      "id": 38706,
      "type": 0,
      "first_name": "Jane",
      "last_name": "Doe",
      "primary_email": "jane@gmail.com",
      "emails": ["jane@gmail.com"]
    },
    "changed_at": "2020-04-11T15:46:50.963-07:00",
    "value": {
      "id": 1607859,
      "text": "New",
      "rank": 1,
      "color": 0
    }
  }
]
```

`GET /field-values`

Returns all field values attached to a `person`, `organization`, `opportunity`, or `list_entry`.

### Query Parameters

| Parameter   | Type    | Required | Description                                                                                               |
| ----------- | ------- | -------- | --------------------------------------------------------------------------------------------------------- |
| field_id    | integer | true     | A unique id that represents a field object whose field values changes are to be retrieved.                |
| action_type | integer | false    | An integer that filters field value changes that were created with this specific action type (see above). |

### Returns

An array of all the field values changes associated with the supplied field.
