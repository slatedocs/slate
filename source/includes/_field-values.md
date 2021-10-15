# Field Values

Field values are displayed in Affinity as the data in the cells of an Affinity spreadsheet.

As an example for how a field value is created:

1.  Assume there exists a list of people called "Business Development Leads".
2.  A custom field called "Deal Size" is created on this list. Fields are visually displayed as columns.
3.  A person X is added to this list. This action creates a list entry for this person.
4.  A value, 50,000, is entered in the cell corresponding to person X in the Deal Size column.
5.  50,000 is now a field value tied to the list entry corresponding to person X, and the "Deal Size" field.

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>By default, Affinity creates some fields for you automatically. These include Location, Industry, Job Titles, and more. See the <a href="#default-fields">Default Fields</a> section for more information.</li>
    <li>Opportunities cannot have global field values</li>
  </ul>
</aside>

## The Field Value Resource

> Example Response (Global Location Field Value)

```json
{
  "id": 250616,
  "field_id": 337,
  "list_entry_id": null,
  "entity_id": 38706,
  "value": {
    "city": "San Francisco",
    "state": "California",
    "country": "United States",
    "continent": null,
    "street_address": null
  }
}
```

> Example Response (List Specific Dropdown Field Value)

```json
{
  "id": 177634,
  "field_id": 751,
  "list_entry_id": 605,
  "entity_id": 38706,
  "value": {
    "id": 71,
    "text": "Low",
    "rank": 1,
    "color": 4
  }
}
```


Each field value object has a unique `id`.

A field value also has `field_id`, `entity_id`, and `list_entry_id`
attributes that give it the appropriate associations, as noted in the example above.

A field value can take on many different kinds of values, depending on the
`field` value type (see [Fields](#fields) section).

<aside class="notice">
  <h6>Note</h6>
  <p>When retrieving Field Values from a specific cell in your Affinity list, it may be helpful to think about it as an XY coordinate system. The X coordinate is the List Entry <span class="bold">or</span> Entity and the Y coordinate is the Field ID. You will need to have both to find the appropriate Field Value ID.</p>
</aside>


| Attribute     | Type        | Description                                                                                                                                                     |
| ------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id            | integer     | The unique identifier of the field value object.                                                                                                                |
| field_id      | integer     | The unique identifier of the field the value is associated with.                                                                                                |
| entity_id     | integer     | The unique identifier of the person, organization, or opportunity object the field value is associated with.                                                    |
| list_entry_id | integer     | The unique identifier of the list entry object the field value is associated with. This only exists if the field the value is associated with is list-specific. |
| value         | One of many | The value attribute can take on many different types, depending on the field `value_type`. See below for reference.                                             |

### Field Value Value Types

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

## Get Field Values

> Example Request

```shell
curl "https://api.affinity.co/field-values?person_id=38706" -u :$APIKEY
```

> Example Response

```json
[
  {
    "id": 250616,
    "field_id": 337,
    "list_entry_id": null,
    "entity_id": 38706,
    "value": {
      "city": "San Francisco",
      "state": "California",
      "country": "United States",
      "continent": null,
      "street_address": null
    }
  },
  {
    "id": 250615,
    "field_id": 1284,
    "list_entry_id": null,
    "entity_id": 38706,
    "value": "Computer Software"
  },
  {
    "id": 32760,
    "field_id": 198,
    "list_entry_id": null,
    "entity_id": 38706,
    "value": 38659
  },
  {
    "id": 177634,
    "field_id": 751,
    "list_entry_id": 605,
    "entity_id": 38706,
    "value": {
      "id": 71,
      "text": "Low",
      "rank": 1,
      "color": 4
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

### Returns

An array of all the field values associated with the supplied `person`,
`organization`, `opportunity`, or `list_entry`.

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>Only one of <code>person_id</code>, <code>organization_id</code>, <code>opportunity_id</code>, or <code>list_entry_id</code> can be specified to the endpoint.</li>
    <li>If a <code>person_id</code>, <code>organization_id</code>, or <code>opportunity_id</code> is specified, the endpoint returns all field values tied to these entities - including those that are associated with all list entries that exist for the given person or organization. Opportunities can only have one list entry.</li>
    <li>
      <p>Smart fields cannot be retrieved using the field values endpoint. Smart field values can be retrieved using the <code>with_interaction_dates</code> parameter on the <code><a href="#get-a-specific-person">GET /persons/{person_id}</a></code> or <code><a href="#get-a-specific-organization">GET /organizations/{organization_id}</a></code> endpoints. The people associated with smart fields can be retrieved using the <code>with_interaction_persons</code> on the <code><a href="#get-a-specific-person">GET /persons/{person_id}</a></code> or <code><a href="#get-a-specific-organization">GET /organizations/{organization_id}</a></code> endpoints.</p>
    </li>
  </ul>
</aside>


## Create a New Field Value

> Example Request

```shell
curl -X POST "https://api.affinity.co/field-values" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"field_id": 1284, "value": "Architecture", "entity_id": 38706}'
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
| value         | custom  | true     | See the [Field Value Resource](#the-field-value-resource) section for all value types. The value specified must correspond to the `value_type` of the supplied `field`.                           |
| list_entry_id | integer | false    | The unique identifier of the list entry (list row) that the field value is associated with. Only specify the `list_entry_id` if the field that the field value is associated with is list specific. |

### Returns

The field value resource that was just created through this request.

## Update a Field Value

> Example Request

```shell
curl -X PUT "https://api.affinity.co/field-values/20406836" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"value": "Healthcare"}'
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

### Path Parameters

| Parameter      | Type    | Required | Description                                                |
| -------------- | ------- | -------- | ---------------------------------------------------------- |
| field_value_id | integer | true     | The unique id of the field value that needs to be updated. |

### Payload Parameters

| Parameter | Type   | Required | Description                                                                                                                                                             |
| --------- | ------ | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| value     | custom | true     | See the [Field Value Resource](#the-field-value-resource) section for all value types. The value specified must correspond to the `value_type` of the supplied `field`. |

### Returns

The field value object that was just updated through this request.

<aside class="notice">
  <h6>Notes</h6>
  <p>When updating a specific field value make sure to use the field_value_id and not the <code>field_id</code>.</p>
</aside>

## Delete a Field Value

> Example Request

```shell
curl "https://api.affinity.co/field-values/20406836" \
  -u :$APIKEY \
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
