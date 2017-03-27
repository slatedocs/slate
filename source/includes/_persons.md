# Persons
The persons API allows you to manage all the contacts of your organization. These people
include anyone your team has ever been in email communications or meetings with, and all
the people that your team has added to Affinity either manually or through the API.
Affinity's data model also guarantees that only one person in your team's shared contact
list has a given email address.

**Note:**

1. If you are looking to add or remove a person from a list, please check out the
[List Entries](#list-entries) section of the API.
2. If you are looking to modify a person's entity values (one of the cells on Affinity's
spreadsheet), please check out the [Entity Values](#entity-values) section of the API.

## The person resource
> Example Response

```json
```

Each person resource is assigned a unique `id` and stores the name, phone numbers, and
email addresses of the person. A person resource also has access to a smart attribute
called `primary_email`. The value of `primary_email` is automatically computed by
Affinity's proprietary algorithms and refers to the email that is most likely to be the
current active email address of a person.

The person resource `organization_ids` is a collection of unique identifiers to the
person's associated organizations. Note that a person can be associated with multiple
organizations. For example, say your team has talked with organizations A and B. Person X
used to work at A and was your point of contact, but then changed jobs and started emailing
you from a new email address (corresponding to organization B).
In this case, Affinity will automatically associate person X with both
organization A and organization B.

Finally, the person resource `type` indicates whether a person is internal or
external to your team. Every internal person is a user of Affinity on your team, and all other
people are externals.

Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the person object.
type | integer | The type of person (see below).
first_name | string | The first name of the person.
last_name | string | The last name of the person.
emails | string[] | The email addresses of the person.
phone_numbers | string[] | The phone numbers of the person.
primary_email | string | The email (automatically computed) that is most likely to the current active email address of the person.
organization_ids | integer[] | An array of unique identifiers of organizations that the person is associated with.

### Person types

Type | Value | Description
--------- | ------- | -----------
external | 0 | Default value. All people that your team has spoken with externally have this type.
internal | 1 | All people on your team that have Affinity accounts will have this type.

## Search for persons
`GET /persons`

Searches your teams data and fetches all the persons that meet the search criteria.
The search term can be an email address, a first name or a last name.

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
term | string | true | A string used to search all the persons in your team's address book. This could be an email address, a first name or a last name.

### Returns
An array of all the person resources that match the search criteria.

## Get a specific person

`GET /persons/{person_id}`

Fetches a person with a specified `person_id`.

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
person_id | integer | true | The unique id of the person that needs to be retrieved.

### Returns
The person object corresponding to the `person_id`.

## Create a new person

`POST /persons`

Creates a new person with the supplied parameters.

**Note:**

1. If one of the supplied email addresses conflicts with another person object, this
request will fail and an appropriate error will be returned.
2. If you are looking to add an existing person to a list, please check the `List Entry` section
of the API.

> Example Request

> Example Response

### Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
first_name | string | true | The first name of the person.
last_name | string | true | The last name of the person.
emails | string[] | true | The email addresses of the person. If there are no email addresses, please specify an empty array.
phone_numbers | string[] | true | The phone numbers of the person. If there are no phone numbers, please specify an empty array.
organization_ids | integer[] | false | An array of unique identifiers of organizations that the person is associated with.

### Returns
The person object that was just created through this request.

## Update a person

`PUT /persons/{person_id}`

Updates an existing person with `person_id` with the supplied parameters.

**Note:**

If you are looking to add an existing person to a list, please check the `List Entry` section
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
first_name | string | true | The first name of the person.
last_name | string | true | The last name of the person.
emails | string[] | true | The email addresses of the person. If there are no email addresses, please specify an empty array.
phone_numbers | string[] | true | The phone numbers of the person. If there are no phone numbers, please specify an empty array.
organization_ids | integer[] | false | An array of unique identifiers of organizations that the person is associated with

### Returns
The person object that was just updated through this request.

## Delete a person

`DELETE /persons/{person_id}`

Deletes a person with a specified `person_id`.

**Note:** This will also delete all the entity values, if any, associated with the person.
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
person_id | integer | true | The unique id of the person that needs to be deleted.

### Returns
`{success: true}`.

## Get global entity attributes

`GET /persons/entity-attributes`

Fetches an array of all the global entity attributes that exist on people. If you aren't sure
about what entity attributes are, please read `this` section first.

> Example Request

```shell
```

> Example Response

```json
```

### Parameters
None.

### Returns
An array of the global entity attributes that exist on people for your team.
