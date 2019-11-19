# Field Values

Field values are displayed in Affinity as the data in the cells of an Affinity
spreadsheet.

As an example for how a field value is created:

1.  Assume there exists a list of people called "Business Development Leads".
2.  A custom field called "Deal Size" is created on this list. Fields are visually displayed
    as columns.
3.  A person X is added to this list. This action creates a list entry for this person.
4.  A value, 50,000, is entered in the cell corresponding to person X in the Deal Size
    column.
5.  50,000 is now a field value tied to the list entry corresponding to person X,
    and the "Deal Size" field.

**Note:**

By default, Affinity creates some fields for you automatically. These include
Location, Industry, Job Titles, and more.

## The field value resource

> Example Response

```json
# Global Location Field Value
{
  "id":250616,
  "field_id":337,
  "list_entry_id":null,
  "entity_id":38706,
  "value":{
    "city":"San Francisco",
    "state":"California",
    "country":"United States",
    "continent":null,
    "street_address":null
  }
}

# List Specific Dropdown Field Value
{
  "id":177634,
  "field_id":751,
  "list_entry_id":605,
  "entity_id":38706,
  "value":{
    "id":71,
    "text":"Low",
    "rank":1,
    "color":4
  }
}
```

Each field value object has a unique `id`.

A field value also has `field_id`, `entity_id`, and `list_entry_id`
attributes that give it the appropriate associations, as noted in the example above.

A field value can take on many different kinds of values, depending on the
`field` value type (see [Fields](#fields) section).

| Attribute     | Type        | Description                                                                                                                                                     |
| ------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id            | integer     | The unique identifier of the field value object.                                                                                                                |
| field_id      | integer     | The unique identifier of the field the value is associated with.                                                                                                |
| entity_id     | integer     | The unique identifier of the person, organization, or opportunity object the field value is associated with.                                                    |
| list_entry_id | integer     | The unique identifier of the list entry object the field value is associated with. This only exists if the field the value is associated with is list-specific. |
| value         | One of many | The value attribute can take on many different types, depending on the field `value_type`. See below for reference.                                             |

### Field Value value types

The Field Type specified below corresponds to the `value_type` of a field.

| Value Type   | Type     | Description                                                                                                                                                                |
| ------------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dropdown     | string   | This represents a value in a dropdown field.                                                                                                                               |
| number       | integer  | This represents a value in a number field.                                                                                                                                 |
| person       | integer  | This represents a value in a person field.                                                                                                                                 |
| organization | integer  | This represents a value in an organization field.                                                                                                                          |
| location     | object   | This represents a value in a location field - it's an object comprising the following keys: `street_address`, `city`, `state`, `country`, all of which take string values. |
| date         | datetime | This represents a value in a date field.                                                                                                                                   |
| text         | string   | This represents a value in a text field.                                                                                                                                   |

## Get field values

> Example Request

```shell
curl "https://api.affinity.co/field-values?person_id=38706" -u :<API-KEY>
```

> Example Response

```json
[
  {
    "id":250616,
    "field_id":337,
    "list_entry_id":null,
    "entity_id":38706,
    "value":{
      "city":"San Francisco",
      "state":"California",
      "country":"United States",
      "continent":null,
      "street_address":null
    }
  },
  {
    "id":250615,
    "field_id":1284,
    "list_entry_id":null,
    "entity_id":38706,
    "value":"Computer Software"
  },
  {
    "id":32760,
    "field_id":198,
    "list_entry_id":null,
    "entity_id":38706,
    "value":38659
  },
  {
    "id":177634,
    "field_id":751,
    "list_entry_id":605,
    "entity_id":38706,
    "value":{
      "id":71,
      "text":"Low",
      "rank":1,
      "color":4
    }
  },
  ...
]
```

`GET /field-values`

Returns all field values attached to a `person`, `organization`, `opportunity`, or `list_entry`.

### Query Parameters

| Parameter       | Type    | Required | Description                                                                                |
| --------------- | ------- | -------- | ------------------------------------------------------------------------------------------ |
| person_id       | integer | custom\* | A unique id that represents a person object whose field values are to be retrieved.        |
| organization_id | integer | custom\* | A unique id that represents an organization object whose field values are to be retrieved. |
| opportunity_id  | integer | custom\* | A unique id that represents an opportunity object whose field values are to be retrieved.  |
| list_entry_id   | integer | custom\* | A unique id that represents a list entry object whose field values are to be retrieved.    |

**Note:**

1.  custom\*: Only one of `person_id`, `organization_id`, `opportunity_id`, or `list_entry_id` can be specified to the endpoint.
2.  If a `person_id`, `organization_id`, or `opportunity_id` is specified, the endpoint returns all field values tied to these entities - including those that are associated with all list entries that
    exist for the given person or organization. Opportunities can only have one list entry.

### Returns

An array of all the field values associated with the supplied `person`,
`organization`, `opportunity`, or `list_entry`.

## Create a new field value

> Example Request

```shell
curl "https://api.affinity.co/field-values" \
  -u :<API-KEY> \
  -d field_id=1284 \
  -d value="Architecture" \
  -d entity_id=38706
```

> Example Response

```json
{
  "id": 20406836,
  "field_id": 1284,
  "list_entry_id": null,
  "entity_id": 38706,
  "value": "Architecture"
}
```

`POST /field-values`

Creates a new field value with the supplied parameters.

### Payload Parameters

| Parameter     | Type    | Required | Description                                                                                                                                                                                       |
| ------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| field_id      | integer | true     | The unique identifier of the field (column) that the field value is associated with.                                                                                                              |
| entity_id     | integer | true     | The unique identifier of the entity (person, organization, or opportunity) that the field value is associated with.                                                                               |
| list_entry_id | integer | false    | The unique identifier of the list entry (list row) that the field value is associated with. Only specify the list_entry_id if the field that the field value is associated with is list specific. |
| value         | custom  | true     | See the [field value resource](#the-field-value-resource) section for all value types. The value specified must correspond to the `value_type` of the supplied `field`.                           |

### Returns

The field value resource that was just created through this request.

## Update a field value

> Example Request

```shell
curl "https://api.affinity.co/field-values/20406836" \
  -u :<API-KEY> \
  -d value="Healthcare" \
  -X "PUT"
```

> Example Response

```json
{
  "id": 20406836,
  "field_id": 1284,
  "list_entry_id": null,
  "entity_id": 38706,
  "value": "Healthcare"
}
```

`PUT /field-values/{field_value_id}`

Updates the existing field value with `field_value_id` with the supplied parameters.

**Note:**

If you are looking to add an existing organization to a list, please check the
[List Entries](#list-entries) section of the API.

### Path Parameters

| Parameter      | Type    | Required | Description                                                |
| -------------- | ------- | -------- | ---------------------------------------------------------- |
| field_value_id | integer | true     | The unique id of the field value that needs to be updated. |

### Payload Parameters

| Parameter | Type   | Required | Description                                                                                                                                                             |
| --------- | ------ | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| value     | custom | true     | See the [field value resource](#the-field-value-resource) section for all value types. The value specified must correspond to the `value_type` of the supplied `field`. |

### Returns

The field value object that was just updated through this request.

## Delete a field value

> Example Request

```shell
curl "https://api.affinity.co/field-values/20406836" \
  -u :<API-KEY> \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /field-values/{field_value_id}`

Deletes an field value with the specified `field_value_id`.

### Path Parameters

| Parameter      | Type    | Required | Description                                                |
| -------------- | ------- | -------- | ---------------------------------------------------------- |
| field_value_id | integer | true     | The unique id of the field value that needs to be deleted. |

### Returns

`{success: true}`.
