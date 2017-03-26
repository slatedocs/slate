# Entity Values
You can think of an entity value as a value in a cell on the Affinity spreadsheets.

Here is a quick example:

1. You have a list of people called "Business Development Leads".
2. You create an entity attribute called "Deal Size" on this list. Note that entity attributes are
visually rendered as columns on the list.
3. You enter a person X to this list. This creates a list entry for this person.
4. Now you enter a value, say, 50,000 in the cell corresponding to person X in the Deal Size column.
5. 50,000 is now an entity value tied to the list entry corresponding to person X, and the "Deal Size" entity attribute.

Further, on sign-up, Affinity creates many entity attributes for you automatically: namely Location, Industry, Job Titles and so on.

## The entity value resource
Each entity value object has a unique `id`.

It also has a `entity_attribute_id`, `entity_id`, `list_entry_id` that tie it to appropriate associations as noted in the example above.

An entity value can take on many different kinds of values, depending on the `entity_attribute` value type (see here).
> Example Response

```json
```


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
`GET /entity-values`

Returns all entity values attached to a `person`, `organization` or `list_entry`.

> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries?key=<API-KEY>"
```
> Example Response

```json
```

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
person_id | integer | custom* | A unique id that represents a person object whose entity values are to be retrieved.
organization_id | integer | custom* | A unique id that represents an organization object whose entity values are to be retrieved.
list_entry_id | integer | custom* | A unique id that represents a list entry object whose entity values are to be retrieved.

**Note:**

1. custom*: Only one of `person_id`, `organization_id`, `list_entry_id` can be specified to the endpoint.
2. If a `person_id` or `organization_id` is specified, the endpoint returns all entity values tied to these entities - including those that are associated with list entries as well.


### Returns
An array of all the entity values associated to the supplied `person`, `organization` or `list_entry`.

## Create a new entity value

`POST /entity-values`

Creates a new entity value with the supplied parameters.

> Example Request

> Example Response

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
entity_attribute_id | integer | true | The name of the organization.
entity_id | integer | true | The domain name of the organization.
list_entry_id | integer | false | An array of unique identifiers of persons that the new organization will be associated with.
value | custom | true | Please see here for all value types. The value specified must correspond to the `value_type` of the supplied `entity_attribute`.

### Returns
The entity value object that was just created through this request.

## Update an entity value

`PUT /entity-values/{entity_value_id}`

Updates an existing entity value with `entity_value_id` with the supplied parameters.

**Note:**

If you are looking to add an existing organization to a list, please check the `List Entry` section
of the API.

> Example Request

```shell
```

> Example Response

```json
```

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
entity_value_id | integer | true | The unique id of the entity value that needs to be updated.
value | custom | true | Please see here for all value types. The value specified must correspond to the `value_type` of the `entity_attribute` associated with this `entity_value`.

### Returns
The entity value object that was just updated through this request.

## Delete an entity value

`DELETE /entity-values/{entity_value_id}`

Deletes an entity value with the specified `entity_value_id`.

> Example Request

```shell
```

> Example Response

```json
```

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
entity_value_id | integer | true | The unique id of the entity value that needs to be deleted.

### Returns
`{success: true}`.
