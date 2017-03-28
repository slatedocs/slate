# Entity Values
Entity values are displayed in Affinity as the data in the cells of an Affinity 
spreadsheet.

As an example for how an entity value is created:

1. Assume there exists a list of people called "Business Development Leads".
2. A custom entity attribute called "Deal Size" is created on this list. Entity 
attributes are visually displayed as columns.
3. A person X is added to this list. This action creates a list entry for this person.
4. A value, 50,000, is entered in the cell corresponding to person X in the Deal Size 
column.
5. 50,000 is now an entity value tied to the list entry corresponding to person X, 
and the "Deal Size" entity attribute.

**Note:**

By default, Affinity creates some entity attributes for you automatically. These include
Location, Industry, Job Titles, and more.

## The entity value resource

> Example Response

```json
# Global Location Entity Value
{
  "id":250616,
  "entity_attribute_id":337,
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

# List Specific Dropdown Entity Value
{
  "id":177634,
  "entity_attribute_id":751,
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

Each entity value object has a unique `id`.

An entity value also has `entity_attribute_id`, `entity_id`, and `list_entry_id` 
attributes that give it the appropriate associations, as noted in the example above.

An entity value can take on many different kinds of values, depending on the 
`entity_attribute` value type (see [Entity Attributes](#entity-attributes) section).

Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the entity value object.
entity_attribute_id | integer | The unique identifier of the entity attribute the value is associated with.
entity_id | integer | The unique identifier of the person or organization object the entity value is associated with.
list_entry_id | integer | The unique identifier of the list entry object the entity value is associated with. This only exists if the entity attribute the value is associated with is list-specific.
value | One of many | The value attribute can take on many different types, depending on the entity attribute `value_type`. See below for reference.

### Entity Value value types
The Field Type specified below corresponds to the `value_type` of an entity attribute.

Value Type | Type | Description
-------------------------------- | ------- | -------------
dropdown | string | This represents a value in a dropdown field.
number | integer | This represents a value in a number field.
person | integer | This represents a value in a person field.
organization | integer | This represents a value in an organization field.
location | object | This represents a value in a location field - it's an object comprising the following keys: `street_address`, `city`, `state`, `country`, all of which take string values.
date | datetime | This represents a value in a date field.
text | string | This represents a value in a text field.


## Get entity values

> Example Request

```shell
curl "https://api.affinity.vc/entity-values?key=<API-KEY>&person_id=38706"
```
> Example Response

```json
[
  {
    "id":250616,
    "entity_attribute_id":337,
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
    "entity_attribute_id":1284,
    "list_entry_id":null,
    "entity_id":38706,
    "value":"Computer Software"
  },
  {
    "id":32760,
    "entity_attribute_id":198,
    "list_entry_id":null,
    "entity_id":38706,
    "value":38659
  },
  {
    "id":177634,
    "entity_attribute_id":751,
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
`GET /entity-values`

Returns all entity values attached to a `person`, `organization` or `list_entry`.

### Query Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
person_id | integer | custom* | A unique id that represents a person object whose entity values are to be retrieved.
organization_id | integer | custom* | A unique id that represents an organization object whose entity values are to be retrieved.
list_entry_id | integer | custom* | A unique id that represents a list entry object whose entity values are to be retrieved.

**Note:**

1. custom*: Only one of `person_id`, `organization_id`, `list_entry_id` can be specified to the endpoint.
2. If a `person_id` or `organization_id` is specified, the endpoint returns all entity values tied to these entities - including those that are associated with all list entries that 
exist for the given person or organization.


### Returns
An array of all the entity values associated with the supplied `person`, 
`organization` or `list_entry`.

## Create a new entity value

> Example Request

```shell
curl "https://api.affinity.vc/entity-values?key=<API-KEY>" \
  -d entity_attribute_id=1284 \
  -d value="Architecture" \
  -d entity_id=38706
```

> Example Response

```json
{
  "id":20406836,
  "entity_attribute_id":1284,
  "list_entry_id":null,
  "entity_id":38706,
  "value":"Architecture"
}
```

`POST /entity-values`

Creates a new entity value with the supplied parameters.

### Query Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
entity_attribute_id | integer | true | The unique identifier of the entity attribute (column) that the entity value is associated with.
entity_id | integer | true | The unique identifier of the entity (person or company) that the entity value is associated with. 
list_entry_id | integer | false | The unique identifier of the list entry (list row) that the entity value is associated with. Only specify the list_entry_id if the entity attribute that the entity value is associated with is list specific.
value | custom | true | See the [entity value resource](#the-entity-value-resource) section for all value types. The value specified must correspond to the `value_type` of the supplied `entity_attribute`.

### Returns
The entity value resource that was just created through this request.

## Update an entity value

> Example Request

```shell
curl "https://api.affinity.vc/entity-values/20406836?key=<API-KEY>" \
  -d value="Healthcare"
  -X "PUT"
```

> Example Response

```json
{
  "id":20406836,
  "entity_attribute_id":1284,
  "list_entry_id":null,
  "entity_id":38706,
  "value":"Healthcare"
}
```

`PUT /entity-values/{entity_value_id}`

Updates the existing entity value with `entity_value_id` with the supplied parameters.

**Note:**

If you are looking to add an existing organization to a list, please check the 
[List Entries](#list-entries) section of the API.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
entity_value_id | integer | true | The unique id of the entity value that needs to be updated.

### Query Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
value | custom | true | See the [entity value resource](#the-entity-value-resource) section for all value types. The value specified must correspond to the `value_type` of the supplied `entity_attribute`.

### Returns
The entity value object that was just updated through this request.

## Delete an entity value

> Example Request

```shell
curl "https://api.affinity.vc/entity-values/20406836?key=<API-KEY>" \
  -X "DELETE"
```

> Example Response

```json
{"success": true}
```

`DELETE /entity-values/{entity_value_id}`

Deletes an entity value with the specified `entity_value_id`.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
entity_value_id | integer | true | The unique id of the entity value that needs to be deleted.

### Returns
`{success: true}`.
