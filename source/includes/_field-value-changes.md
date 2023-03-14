# Field Value Changes

Field value changes allow you to see historical changes to the values of fields in Affinity.
This is especially useful for tracking progress through statuses (e.g. Lead --> Closed Won).

## Supported field types

Not all fields can track historical changes. The following field types support tracking of
historical changes.

### Multi-valued Fields

| Value | Type         |
| ----- | ------------ |
| 0     | Person       |
| 1     | Organization |
| 3     | Number       |
| 5     | Location     |

### Single valued fields

| Value | Type            |
| ----- | --------------- |
| 0     | Person          |
| 1     | Organization    |
| 3     | Number          |
| 4     | Date            |
| 5     | Location        |
| 7     | Ranked Dropdown |

<aside class="notice">
  <h6>Note</h6>
  <p>You can also see if a field does so by looking at the <code>track_changes</code> attribute in the <a href="#get-fields">Field Resource</a>. The API will return an appropriate error if the field doesn't support historical tracking.</p>
</aside>

## The Field Value Change Resource

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
| 1           | Delete |
| 2           | Update |

<aside class="notice">
  <h6>Note</h6>
  <p>There are some extra attributes returned by this endpoint; they will be deprecated soon and should not be used.</p>
</aside>

## Get Field Values Changes

> Example Request

```shell
curl "https://api.affinity.co/field-value-changes?field_id=236333" -u :$APIKEY
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

Returns all field values changes attached to a specific field. Field value changes can be filtered by `action_type`, `person`, `organization`, `opportunity` or `list_entry` by passing in the appropriate parameter.

### Query Parameters

| Parameter       | Type    | Required | Description                                                                                               |
| --------------- | ------- | -------- | --------------------------------------------------------------------------------------------------------- |
| field_id        | integer | true     | A unique ID that represents a field object whose field values changes are to be retrieved.                |
| action_type     | integer | false    | An integer that filters field value changes that were created with this specific action type (see above). |
| person_id       | integer | false    | A unique ID that represents a person object whose field value changes are to be retrieved.                |
| organization_id | integer | false    | A unique ID that represents an organization object whose field value changes are to be retrieved.         |
| opportunity_id  | integer | false    | A unique ID that represents an opportunity object whose field value changes are to be retrieved.          |
| list_entry_id   | integer | false    | A unique ID that represents a list entry object whose field value changes are to be retrieved.            |

### Returns

An array of all the field values changes associated with the supplied field and `person`, `organization`, `opportunity` or `list_entry` if specified.

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>Only one of <code>person_id</code>, <code>organization_id</code>, <code>opportunity_id</code>, or <code>list_entry_id</code> can be specified to the endpoint.</li>
    <li>If a <code>person_id</code>, <code>organization_id</code>, or <code>opportunity_id</code> is specified, the endpoint returns all field value changes tied to these entities.</li>
    <li>If a <code>list_entry_id</code> is specified, the result is filtered by the <code>person_id</code>, <code>organization_id</code> or <code>opportunity_id</code> which is tied to the specified <code>list_entry_id</code>.</li>
  </ul>
</aside>
