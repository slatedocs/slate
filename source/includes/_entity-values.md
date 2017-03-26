# Entity Values
An entity value in Affinity represents a value that is tied to an entity (person or organization), and if applicable
is also tied to a list entry. Think of an entity value as a value in a cell on the Affinity spreadsheets - each of those
numerous values are all entity values.

An entity value is tied to a few entities: the first is the column that it belongs in - this is the entity attribute,
the second is the person or company that it is a value for, and lastly, if the entity attribute is list-specific, the entity value
is also tied to the list entry.

Here is an example: Say you have a list called "Business Development Leads", and this is a list of people.
You created a column (entity attribute) called "Deal Size", entered a person X to this list, and noted a value for the Deal Size.
This value you just entered is an entity value!

By default, Affinity brings you entity values in the form of Location, Industry and Job Titles for People on the global team level as well.

## The entity value resource
Each entity value object has a unique `id`.

It also has a `entity_attribute_id` and `list_entry_id` that tie it to appropriate associations.

Finally, an entity value can take on many different kinds of values, depending on the `entity_attribute` value type (see here).
> Example Response

```json
```


Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the organization object.
entity_attribute_id | integer | The name of the organization (see below).
list_entry_id | string | The website name of the organization. This is used by Affinity to automatically associate person objects with an organization.
value | One of many | The value attribute can take on many different types, depending on the entity attribute `value_type`. See below for reference.


Attribute | Type | Entity Attribute Value Type | Description
--------- | ------- | ------------------------- | -------------
value | string | 0 | This represents a value in a dropdown field - it's just a string of characters.
value | integer | 1 | This represents a value in a number field - it's just a number.
value | integer | 2 | This represents a value in a person field - it's a unique id that represents a person object.
value | integer | 3 | This represents a value in an organization field - it's a unique id that represents an organization object.
value | object | 4 | This represents a value in a location field - it's an object comprising the following keys: `street_address`, `city`, `state`, `country`.
value | datetime | 5 | This represents a value in a date field - it's a datetime object.
value | string | 6 | This represents a value in a text field - it's a long string of characters.


## Get entity values
`GET /organizations`

Searches your teams data and fetches all the organizations that meet the search criteria.
The search term can be a name or a domain name.

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
term | string | true | A string used to search all the organizations in your team's address book. This could be a name or a domain name.

### Returns
An array of all the organization objects that match the search criteria.

## Create a new entity value

`POST /organizations`

Creates a new organization with the supplied parameters.

**Note:** If you are looking to add an existing organization to a list, please check the `List Entry` section
of the API.

> Example Request

> Example Response

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
name | string | true | The name of the organization.
domain | string | false | The domain name of the organization.
person_ids | integer[] | false | An array of unique identifiers of persons that the new organization will be associated with.

### Returns
The organization object that was just created through this request.

## Update an organization

`PUT /organizations/{organization_id}`

Updates an existing organization with `organization_id` with the supplied parameters.

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
name | string | true | The name of the organization.
domain | string | false | The domain name of the organization.
person_ids | integer[] | false | An array of unique identifiers of persons that the organization will be associated with.

### Returns
The organization object that was just updated through this request.

## Update an entity value

`GET /organizations/entity-attributes`

Fetches an array of all the global entity attributes that exist on organizations.
If you aren't sure about what entity attributes are, please read `this` section first.

> Example Request

```shell
```

> Example Response

```json
```

### Parameters
None.

### Returns
An array of the global entity attributes that exist on organizations for your team.

## Delete an entity value

`DELETE /organizations/{organization_id}`

Deletes an organization with a specified `organization_id`.

**Note:**

1. An appropriate error will be returned if you are trying to delete a `global` organization.
2. This will also delete all the entity values, if any, associated with the organization.
Such entity values exist linked to either global or list-specific entity attributes.

> Example Request

```shell
```

> Example Response

```json
```

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
organization_id | integer | true | The unique id of the organization that needs to be deleted.

### Returns
`{success: true}`.
