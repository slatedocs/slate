# Field Value Changes

Field value changes allow you to see historical changes to the values of fields in Affinity.
This is especially useful for tracking progress through statuses (e.g. Lead --> Closed Won).

**Note:**
Not all fields can track historical changes; you can see if a field does so by looking at the
`track_changes` attribute in the [field resource](#get-fields). The API will return an
appropriate error if the field doesn't support historical tracking.

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

| Attribute     | Type           | Description                                                                                                                                                                                                                 |
| ------------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id            | integer        | The unique identifier of the field value change object.                                                                                                                                                                     |
| field_id      | integer        | The unique identifier of the field the value change is associated with.                                                                                                                                                     |
| entity_id     | integer        | The unique identifier of the person, organization, or opportunity object the field value change is associated with.                                                                                                         |
| list_entry_id | integer        | The unique identifier of the list entry object the field value change is associated with.                                                                                                                                   |
| action_type   | One of several | Describes the action behind this field value change. This attribute can take on several different types; see below for reference.                                                                                           |
| value         | One of many    | Represents the field's value. This attribute can take on many different types, depending on the field `value_type`. When the action type is Delete, value represents the old value; otherwise, it represents the new value. |

### Field Value Change action types

The action type specified below corresponds to the `action_type` of a field value change.
This attribute filters the field value changes that are returned. For example,
when an `action_type` of 0 is specified, all the field value change objects that are returned
will represent when a field value has been created.

| Action Type | Type   |
| ----------- | ------ |
| 0           | Create |
| 1           | Update |
| 2           | Delete |

## Get field values changes

> Example Request

```shell
curl "https://api.affinity.co/field-value-changes?field_id=236333" -u :<API-KEY>
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

`GET /field-value-changes`

Returns all field values changes attached to a specific field.

### Query Parameters

| Parameter   | Type    | Required | Description                                                                                               |
| ----------- | ------- | -------- | --------------------------------------------------------------------------------------------------------- |
| field_id    | integer | true     | A unique id that represents a field object whose field values changes are to be retrieved.                |
| action_type | integer | false    | An integer that filters field value changes that were created with this specific action type (see above). |

### Returns

An array of all the field values changes associated with the supplied field.
