# Persons

The persons API allows you to manage all the contacts of your organization. These people
include anyone your team has ever been in email communications or meetings with, and all
the people that your team has added to Affinity either manually or through the API.
Affinity's data model also guarantees that only one person in your team's shared contact
list has a given email address.

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>If you are looking to add or remove a person from a list, please check out the <a href="#list-entries">List Entries</a> section of the API.</li>
    <li>If you are looking to modify a person's field values (one of the cells on Affinity's spreadsheet), please check out the <a href="#field-values">Field Values</a> section of the API.</li>
  </ul>
</aside>

## The Person Resource

> Example Response

```json
{
  "id": 38706,
  "type": 0,
  "first_name": "John",
  "last_name": "Doe",
  "primary_email": "john@affinity.co",
  "emails": [
    "john@affinity.co",
    "jdoe@alumni.stanford.edu",
    "johnjdoe@gmail.com",
  ],
  "organization_ids": [
    1687449,
    ...
  ],
  "opportunity_ids": [
    4,
    11,
    ...
  ],
  "list_entries": [
    {
      "id": 388,
      "list_id": 26,
      "creator_id": 38603,
      "entity_id": 38706,
      "created_at": "2015-12-11T02:26:56.537-08:00",
    },
    ...
  ],
  "interaction_dates": {
    "first_email_date": "2011-11-23T08:12:45.328-08:00",
    "last_email_date": "2012-03-04T05:06:07.890-08:00",
    "last_event_date": "2011-12-11T02:26:56.537-08:00",
    "last_interaction_date": "2012-03-04T05:06:07.890-08:00",
    "next_event_date": "2019-03-04T05:06:07.890-08:00",
    "first_event_date": "2012-01-01T08:18:00.329-08:00",
  },
  "interactions": {
    "first_email": {
      "date": "2011-11-23T08:12:45.328-08:00",
      "person_ids": [
        123
      ]
    },
    "last_email": {
      "date": "2012-03-04T05:06:07.890-08:00",
      "person_ids": [
        123
      ]
    },
    "last_event": {
      "date": "2011-12-11T02:26:56.537-08:00",
      "person_ids": [
        123
      ]
    },
    "last_interaction": {
      "date": "2012-03-04T05:06:07.890-08:00",
      "person_ids": [
        123,
        111
      ]
    },
    "next_event": {
      "date": "2019-03-04T05:06:07.890-08:00",
      "person_ids": [
        123,
        124,
        125
      ]
    },
    "first_event": {
      "date": "2012-01-01T08:18:00.329-08:00",
      "person_ids": [
        123
      ]
    }
  }
}
```

Each person resource is assigned a unique `id` and stores the name, type, and
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

The person resource `type` indicates whether a person is internal or
external to your team. Every internal person is a user of Affinity on your team, and all other
people are externals.

Dates of the most recent and upcoming interactions with a person are available in the
`interaction_dates` field. This data is only included when passing
`with_interaction_dates=true` as a query parameter to the `/persons` or
the `/persons/{person_id}` endpoints.

| Attribute         | Type        | Description                                                                                                                                                                                                                                                                                           |
| ----------------- | ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                     |
| id                | integer     | The unique identifier of the person object.                                                                                                                                                                                                                                                           |
| type              | integer     | The type of person (see below).                                                                                                                                                                                                                                                                       |
| first_name        | string      | The first name of the person.                                                                                                                                                                                                                                                                         |
| last_name         | string      | The last name of the person.                                                                                                                                                                                                                                                                          |
| emails            | string[]    | The email addresses of the person.                                                                                                                                                                                                                                                                    |
| primary_email     | string      | The email (automatically computed) that is most likely to the current active email address of the person.                                                                                                                                                                                             |
| organization_ids  | integer[]   | An array of unique identifiers of organizations that the person is associated with.                                                                                                                                                                                                                   |
| opportunity_ids   | integer[]   | An array of unique identifiers of opportunities that the person is associated with.                                                                                                                                                                                                             |
| list_entries      | ListEntry[] | An array of list entry resources associated with the person, only returned as part of the [Get a Specific Person](#get-a-specific-person) endpoint.                                                                                                                                                   |
| interaction_dates | object      | An object with six string date fields representing the most recent and upcoming interactions with this person: `first_email_date`, `last_email_date`, `last_event_date`, `last_interacton_date`, `first_event_date` and `next_event_date`. Only returned when passing `with_interaction_dates=true`.  |
| interactions      | object      | An object with six fields nested underneath.  Each field corresponds to one of the six interactions, and includes nested fields for `date` and `person_ids` which indicates the internal people associated with that event.  Only returned when passing `with_interaction_dates=true`.                |

### Person types

| Type     | Value | Description                                                                         |
| -------- | ----- | ----------------------------------------------------------------------------------- |
| external | 0     | Default value. All people that your team has spoken with externally have this type. |
| internal | 1     | All people on your team that have Affinity accounts will have this type.            |

## Search for Persons

`GET /persons`

Searches your teams data and fetches all the persons that meet the search criteria.
The search term can be part of an email address, a first name or a last name.

This result is paginated. An initial request returns an object with two fields: `persons`
and `next_page_token`. `persons` contains an array of person resources. The value of
`next_page_token` should be sent as the query parameter `page_token` in another request to
retrieve the next page of results. While paginating through results, each request must have
identical query parameters other than the changing `page_token`. Otherwise, an `Invalid page_token variable` error will be returned.

The absence of a `next_page_token` indicates that all the records have been fetched,
though its presence does not necessarily indicate that there are _more_ resources to be
fetched. The next page may be empty (but then `next_page_token` would be `null` to
confirm that there are no more resources).

Pass `with_interaction_dates=true` as a query parameter to include dates of the most
recent and upcoming interactions with persons. When this parameter is included, persons
with no interactions will not be returned in the response.
Pass `with_interaction_persons=true` as a query parameter if
`with_interaction_dates=true` to also get the internal persons associated with the
interaction.

You can filter by interaction dates by providing additional query parameters like
`min_last_email_date` or `max_next_event_date`. The value of these query parameters should
be ISO 8601 formatted date strings.

> Example Request

```shell
curl "https://api.affinity.co/persons?term=doe" -u :$APIKEY
```

> Example Response

```json
{
  "persons": [
    {
      "id": 38706,
      "type": 0,
      "first_name": "John",
      "last_name": "Doe",
      "primary_email": "john@affinity.co",
      "emails": [
        "john@affinity.co",
        "jdoe@alumni.stanford.edu",
        "johnjdoe@gmail.com",
      ]
    },
    {
      "id": 624289,
      "type": 1,
      "first_name": "Jane",
      "last_name": "Doe",
      "primary_email": "jane@gmail.com",
      "emails": [
        "jane@gmail.com"
      ]
    },
    ...
  ],
  "next_page_token": "eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9"
}
```

> Example Pagination

```shell
# To get the second page of results, issue the following query:
curl "https://api.affinity.co/persons?term=doe&page_token=eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9" -u :$APIKEY
```

> Example with Interaction Date

```shell
# To get the results between min_last_email_interaction_date and max_last_email_interaction_date, issue the following query:
curl "https://api.affinity.co/persons" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"min_last_email_date": "2021-01-01T00:00:00", "with_interaction_dates": true, "max_last_email_date": "2021-01-12T23:59:59"}'
```

### Query Parameters

| Parameter                      | Type    | Required | Description                                                                                                                                                                                                                                         |
| ------------------------------ | ------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| term                           | string  | false    | A string used to search all the persons in your team's address book. This could be an email address, a first name or a last name.                                                                                                                   |
| with_interaction_dates         | boolean | false    | When true, interaction dates will be present on the returned resources. Only persons that have interactions will be returned.                                                                                                                       |
| with_interaction_persons       | boolean | false    | When true, persons for each interaction will be returned. Used in conjunction with `with_interaction_dates`                                                                                                                                         |
| with_opportunities             | boolean | false    | When true, opportunity IDs associated with this person will be returned.                                                                                                                                                                            |
| min_`{interaction type}`_date  | string  | false    | Only returns persons with the given interaction type above the given value. `interaction type` can be one of `first_email`, `last_email`, `last_interaction`, `last_event`, `first_event`, or `next_event`. This would be used with max interation. |
| max_`{interaction type>`_date  | string  | false    | Only returns persons with the given interaction type below the given value. `interaction type` can be one of `first_email`, `last_email`, `last_interaction`, `last_event`, `first_event`, or `next_event`. This would be used with min interation. |
| page_size                      | number  | false    | How many results to return per page. (Default is the maximum value of 500.)                                                                                                                                                                         |
| page_token                     | string  | false    | The `next_page_token` from the previous response required to retrieve the next page of results.                                                                                                                                                     |

### Returns

An object with two fields: `persons` and `next_page_token`. `persons` maps to an array of
all the person resources that match the search criteria. Does not include the associated
`organization_ids` or `list_entries`. `next_page_token` includes a token to be sent along
with the next request as the `page_token` parameter to fetch the next page of results.
When `with_interaction_dates` is passed in the returned resources will have
`interaction_dates` fields.

## Get a Specific Person

> Example Request

```shell
curl "https://api.affinity.co/persons/38706" -u :$APIKEY
```

> Example Response

```json
{
  "id": 38706,
  "type": 0,
  "first_name": "John",
  "last_name": "Doe",
  "primary_email": "john@affinity.co",
  "emails": [
    "john@affinity.co",
    "jdoe@alumni.stanford.edu",
    "johndoe@gmail.com",
  ],
  "organization_ids": [1687449],
  "opportunity_ids": [
    4,
    11,
    ...
  ],
  "list_entries": [
    {
      "id": 388,
      "list_id": 26,
      "creator_id": 38603,
      "entity_id": 38706,
      "created_at": "2015-12-11T02:26:56.537-08:00",
    },
    ...
  ],
}
```

`GET /persons/{person_id}`

Fetches a person with a specified `person_id`.

### Path Parameters

| Parameter                | Type    | Required | Description                                                                                                 |
| ----------------------   | ------- | -------- | ----------------------------------------------------------------------------------------------------------- |
| person_id                | integer | true     | The unique ID of the person that needs to be retrieved.                                                     |
| with_interaction_dates   | boolean | false    | When true, interaction dates will be present on the returned resources.                                     |
| with_interaction_persons | boolean | false    | When true, persons for each interaction will be returned. Used in conjunction with `with_interaction_dates` |
| with_opportunities       | boolean | false    | When true, opportunity IDs associated with this person will be returned.                                      |

### Returns

The person resource corresponding to the `person_id`.

## Create a New Person

> Example Request

```shell
curl -X POST "https://api.affinity.co/persons" \
   -u :$APIKEY \
   -H "Content-Type: application/json" \
   -d '{"first_name": "Alice", "last_name": "Doe", "emails": ["alice@affinity.co"], "organization_ids": [1687449]}'
```

> Example Response

```json
{
  "id": 860197,
  "type": 0,
  "first_name": "Alice",
  "last_name": "Doe",
  "primary_email": "alice@affinity.co",
  "emails": ["alice@affinity.co"],
  "organization_ids": [1687449]
}
```

`POST /persons`

Creates a new person with the supplied parameters.

### Payload Parameters

| Parameter        | Type      | Required | Description                                                                                        |
| ---------------- | --------- | -------- | -------------------------------------------------------------------------------------------------- |
| first_name       | string    | true     | The first name of the person.                                                                      |
| last_name        | string    | true     | The last name of the person.                                                                       |
| emails           | string[]  | true     | The email addresses of the person. If there are no email addresses, please specify an empty array. |
| organization_ids | integer[] | false    | An array of unique identifiers of organizations that the person is associated with.                |

### Returns

The person resource was newly created from this successful request.

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>If one of the supplied email addresses conflicts with another person object, this request will fail and an appropriate error will be returned.</li>
    <li>If you are looking to add an existing person to a list, please check the <a href="#list-entries">List Entries</a> section of the API.</li>
  </ul>
</aside>

## Update a person

> Example Request

```shell
curl -X PUT "https://api.affinity.co/persons/860197" \
   -u :$APIKEY \
   -H "Content-Type: application/json" \
   -d '{"first_name": "Allison", "emails": ["allison@affinity.co", "allison@gmail.com"]}'
```

> Example Response

```json
{
  "id": 860197,
  "type": 0,
  "first_name": "Allison",
  "last_name": "Doe",
  "primary_email": "alice@affinity.co",
  "emails": ["alice@affinity.co", "allison@example.com", "allison@gmail.com"],
  "organization_ids": [1687449]
}
```

`PUT /persons/{person_id}`

Updates an existing person with `person_id` with the supplied parameters. Only attributes
that need to be changed must be passed in.

### Path Parameters

| Parameter | Type    | Required | Description                                           |
| --------- | ------- | -------- | ----------------------------------------------------- |
| person_id | integer | true     | The unique ID of the person that needs to be updated. |

### Payload Parameters

| Parameter        | Type      | Required | Description                                                                                        |
| ---------------- | --------- | -------- | -------------------------------------------------------------------------------------------------- |
| first_name       | string    | false    | The first name of the person.                                                                      |
| last_name        | string    | false    | The last name of the person.                                                                       |
| emails           | string[]  | false    | The email addresses of the person. If there are no email addresses, please specify an empty array. |
| organization_ids | integer[] | false    | An array of unique identifiers of organizations that the person is associated with                 |

### Returns

The person object that was just updated through this request.

<aside class="notice">
  <h6>Note</h6>
  <ul>
    <li>If you are looking to add an existing person to a list, please check the <a href="#list-entries">List Entries</a> section of the API.</li>
    <li>If you are trying to add a new email or organization to a person, the existing values for <code>emails</code> and <code>organization_ids</code> must also be supplied as parameters.</li>
  </ul>
</aside>

## Delete a Person

> Example Request

```shell
curl "https://api.affinity.co/persons/860197" \
  -u :$APIKEY \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /persons/{person_id}`

Deletes a person with a specified `person_id`.

### Path Parameters

| Parameter | Type    | Required | Description                                           |
| --------- | ------- | -------- | ----------------------------------------------------- |
| person_id | integer | true     | The unique ID of the person that needs to be deleted. |

### Returns

`{success: true}`.

<aside class="notice">
  <h6>Note</h6>
  <p>This will also delete all the field values, if any, associated with the person. Such field values exist linked to either global or list-specific fields.</p>
</aside>

## Get Global Person Fields

`GET /persons/fields`

Fetches an array of all the global fields that exist on people. If you aren't sure
about what fields are, please read the [Fields](#fields)
section first.

> Example Request

```shell
curl "https://api.affinity.co/persons/fields" -u :$APIKEY
```

> Example Response

```json
[
  {
    "id": 125,
    "name": "Use Case",
    "value_type": 2,
    "allows_multiple": true,
    "dropdown_options": []
  },
  {
    "id": 198,
    "name": "Referrers",
    "value_type": 0,
    "allows_multiple": true,
    "dropdown_options": []
  },
  {
    "id": 1615,
    "name": "Address",
    "value_type": 5,
    "allows_multiple": false,
    "dropdown_options": []
  },
  ...
]
```

### Parameters

None.

### Returns

An array of the global fields that exist on people for your team.
