# Persons
As the name describes, persons represent all the people in your team's address book. This includes
all the people your team has ever been in email communications or meetings with, and also includes
all the people that your team manually (or through the API) added to Affinity. Affinity is modeled so that only one person in your team's shared contact list can have a given email address.

**Note:**

1. If you are looking to add / remove a person to / from a list, please check out the `List Entry` section of the API.
2. If you are looking to modify an entity value (one of the cells on Affinity's spreadsheet), please check out the
`Entity Values` section of the API.

## The person resource
Each person object has a unique `id`. It also has a `first_name`, `last_name`, `phone_numbers`, `emails` and
`organizations` it is associated to. Lastly, there is a smart attribute called `primary_email` that is also
returned by the API. `primary_email` is automatically computed by Affinity's proprietary algorithms and refers to the email that is most likely to be the current active email address of a person.

Note that a person can be associated to multiple organizations. For example, say your team had talked with
organization A and B. Person X used to work at A and was your point of contact, but then changed jobs and started emailing
you from a new address (corresponding to organization B). In this case, Affinity will automatically associate X with both A and B.

Finally, each person can either be internal or external to your team. Every internal person is a user of Affinity on your team, everyone
else is demarcated as external.
> Example Response

```json
```


Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the person object.
type | integer | The type of person (see below).
first_name | string | The first name of the person.
last_name | string | The last name of the person.
emails | string[] | The email addresses of the person.
phone_numbers | string[] | The phone numbers of the person.
primary_email | string | The email (automatically computed) that is most likely to the current active email address of the person.
organization_ids | integer[] | An array of unique identifiers of organizations that the person is associated with

### Person types

Type | Value | Description
--------- | ------- | -----------
external | 0 | Default value. All people that your team has spoken with externally have this type.
internal | 1 | All people on your team that have Affinity accounts (or had Affinity accounts) will have this type.

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
organization_ids | integer[] | false | An array of unique identifiers of organizations that the person is associated with

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
