# Organizations
An organization in Affinity represents an external company that your team is in touch with - this could be
an organization you're trying to invest in, you're trying to sell to, or just establish a relationship with.

An organization has many people associated with it - these are your team's points of contacts at that organization.
Just like people, organizations can be added to multiple lists and can be assigned entity values.

To make the data quality as good as possible, we actually have our own proprietary set of organizations database
that we have developed through third-party partnerships and us scraping the web. This helps in minimizing data entry for you
as you use Affinity's CRM products.

**Note:**

1. If you are looking to add / remove an organization to / from a list, please check out the `List Entry` section of the API.
2. If you are looking to modify an entity value (one of the cells on Affinity's spreadsheet), please check out the
`Entity Values` section of the API.

## The organization resource
Each organization object has a unique `id`. It also has a `name`, `domain` (the website of the organization), and
`persons` associated to it. The `domain` is an important attribute from an automation perspective, as this helps
Affinity's algorithm automatically link all the appropriate person objects (people with the same email domain
as the organization) to the organization.

Each organization also has a flag determining whether it's `global` or not. As mentioned above, we at Affinity maintain
our own set of global organizations that each customer has access to. Note that you cannot change the name or the domain
of a `global` organization. You also cannot delete a `global` organization.

Of course, if an organization is manually created by your team, all fields can be modified and the organization can be deleted.

> Example Response

```json
```


Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the organization object.
name | integer | The name of the organization (see below).
domain | string | The website name of the organization. This is used by Affinity to automatically associate person objects with an organization.
person_ids | string[] | An array of unique identifiers of person that are associated with the organization
global | boolean | Returns whether this organization is a part of Affinity's global dataset of organizations. This is always false if the organization was created by you.


## Search for organizations
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

## Get a specific organization

`GET /organizations/{organization_id}`

Fetches an organization with a specified `organization_id`.

> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries/16367?key=<API-KEY>"
```

> Example Response

```json
```

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
organization_id | integer | true | The unique id of the organization that needs to be retrieved.

### Returns
The organization object corresponding to the `organization_id`.

## Create a new organization

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

## Delete an organization

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

## Get global entity attributes

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
