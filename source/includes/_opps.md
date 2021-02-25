# Opportunities

An opportunity in Affinity represents a potential future sale or deal for your team. It
can have multiple people - your team's main points of contacts for the opportunity - and
organization(s) associated with it. Opportunities are generally used to track the progress
of and revenue generated from sales and deals in your pipeline with a specific organization.

Unlike people and organizations, an opportunity can only belong to a single list and, thus,
does not have global fields. This list must be provided at the creation of the opportunity.
If the list or list entry containing the opportunity gets deleted, then the opportunity subsequently gets
deleted. If a user does not have permission to access a list with opportunities, the user cannot view
any of those opportunities.

**Note:**

1.  If you are looking to remove an opportunity from a list, note that deleting an opportunity
    is the same as removing an opportunity from a list because an opportunity can only exist on
    a single list with a single list entry.
2.  If you are looking to modify a field value (one of the cells on Affinity's
    spreadsheet), please check out the [Field Values](#field-values) section of the API.

## The opportunity resource

> Example Response

```json
{
  "id": 117,
  "name": "Affinity Opp",
  "person_ids": [38706],
  "organization_ids": [21442],
  "list_entries": [
    {
      "id": 442313,
      "creator_id": 38706,
      "list_id": 4974,
      "entity_id": 117,
      "entity_type": 8,
      "created_at": "2018-03-03T23:02:46.412-08:00"
    }
  ]
}
```

Each opportunity object has a unique `id`. It also has a `name`, `persons_ids` and
`organization_ids` associated with it, and an array of `list_entries`. An important attribute to note
is `list_entries`. Because an opportunity can only belong to a single list, `list_entries`
can only have one list entry.

Of course, all fields can be modified and the opportunity can be deleted.

| Attribute        | Type        | Description                                                                                     |
| ---------------- | ----------- | ----------------------------------------------------------------------------------------------- |
| id               | integer     | The unique identifier of the opportunity object.                                                |
| name             | string      | The name of the opportunity (see below).                                                        |
| person_ids       | number[]    | An array of unique identifiers for persons that are associated with the opportunity             |
| organization_ids | number[]    | An array of unique identifiers for organizations that are associated with the opportunity       |
| list_entries     | ListEntry[] | An array of list entry resources associated with the opportunity (at most 1 list entry). If the user corresponding to the API key does not have access to the list, this will be empty. |

## Search for opportunities

`GET /opportunities`

Searches your team's data and fetches all the opportunities that meet the search criteria.
The search term can be a part of an opportunity's name.

This result is paginated. An initial request returns an object with two fields:
`opportunities` and `next_page_token`. `opportunities` contains an array of opportunity
resources. The value of `next_page_token` should be sent as the query parameter
`page_token` in another request to retrieve the next page of results. While paginating
through results, each request must have identical query parameters other than the changing
`page_token`. Otherwise, an `Invalid page_token variable` error will be returned.

The absence of a `next_page_token` indicates that all the records have been fetched,
though its presence does not necessarily indicate that there are _more_ resources to be
fetched. The next page may be empty (but then `next_page_token` would be `null` to
confirm that there are no more resources).

> Example Request

```shell
curl "https://api.affinity.co/opportunities?term=affinity" -u :<API-KEY>
```

> Example Response

```json
{
  "opportunities": [
    {
      "id": 121,
      "name": "Affinity Opp",
      "person_ids": [3526824],
      "organization_ids": [128367168],
      "list_entries": [
        {
          "id": 442313,
          "creator_id": 1124736,
          "list_id": 4974,
          "entity_id": 121,
          "entity_type": 8,
          "created_at": "2018-03-03T23:02:46.412-08:00"
        },
      ],
    },
    {
      "id": 150,
      "name": "Affinity Opp 2",
      "person_ids": [5326214],
      "organization_ids": [128367168],
      "list_entries": [
        {
          "id": 442421,
          "creator_id": 1124736,
          "list_id": 4974,
          "entity_id": 150,
          "entity_type": 8,
          "created_at": "2018-03-08T23:02:46.412-08:00"
        },
      ],
    },
    ...
  ],
  "next_page_token": "eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9",
}
```

> Example pagination

```shell
# To get the second page of results, issue the following query:
curl "https://api.affinity.co/opportunities?term=affinity&page_token=eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9" -u :<API-KEY>
```

### Query Parameters

| Parameter  | Type   | Required | Description                                                                                          |
| ---------- | ------ | -------- | ---------------------------------------------------------------------------------------------------- |
| term       | string | false    | A string used to search all the opportunities in your team's database. This could be part of a name. |
| page_size  | number | false    | How many results to return per page. (Default is the maximum value of 500.)                          |
| page_token | string | false    | The `next_page_token` from the previous response required to retrieve the next page of results.      |

### Returns

An object with two fields: `opportunities` and `next_page_token`. `opportunities` maps to
an array of all the opportunity resources that match the search criteria.
`next_page_token` includes a token to be sent along with the next request as the
`page_token` parameter to fetch the next page of results.

## Get a specific opportunity

> Example Request

```shell
curl "https://api.affinity.co/opportunities/117" -u :<API-KEY>
```

> Example Response

```json
{
  "id": 121,
  "name": "Affinity Opp",
  "person_ids": [3526824],
  "organization_ids": [128367168],
  "list_entries": [
    {
      "id": 442313,
      "creator_id": 1124736,
      "list_id": 4974,
      "entity_id": 121,
      "entity_type": 8,
      "created_at": "2018-03-03T23:02:46.412-08:00"
    },
  ],
}
```

`GET /opportunities/{opportunity_id}`

Fetches an opportunity with a specified `opportunity_id`.

### Path Parameters

| Parameter      | Type    | Required | Description                                                  |
| -------------- | ------- | -------- | ------------------------------------------------------------ |
| opportunity_id | integer | true     | The unique id of the opportunity that needs to be retrieved. |

### Returns

The opportunity object corresponding to the `opportunity_id`.

## Create a new opportunity

> Example Request

```shell
curl "https://api.affinity.co/opportunities" \
  -u :<API-KEY> \
  -d name="Penny Opportunity" \
  -d list_id=6645 \
  -d person_ids[]=38706 \
  -d organization_ids[]=21442
```

> Example Response

```json
{
  "id": 50,
  "name": "Penny Opportunity",
  "person_ids": [38706],
  "organization_ids": [21442],
  "list_entries": [
    {
      "id": 999886,
      "creator_id": 1127776,
      "list_id": 6645,
      "entity_id": 50,
      "entity_type": 8,
      "created_at": "2018-03-07T16:32:35.794-08:00"
    }
  ]
}
```

`POST /opportunities`

Creates a new opportunity with the supplied parameters.

### Payload Parameters

| Parameter        | Type      | Required | Description                                                                                                               |
| ---------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------- |
| name             | string    | true     | The name of the opportunity.                                                                                              |
| list_id          | integer   | true     | An unique identifier of the list that the new opportunity will be associated with. This list must be of type opportunity. |
| person_ids       | integer[] | false    | An array of unique identifiers of persons that the new opportunity will be associated with.                               |
| organization_ids | integer[] | false    | An array of unique identifiers of organizations that the new opportunity will be associated with.                         |

### Returns

The opportunity resource that was just created by a successful request (without `person_ids` and `organization_ids`).

## Update an opportunity

> Example Request

```shell
curl "https://api.affinity.co/opportunities/120611418" \
  -u :<API-KEY> \
  -d name="Penny Opp" \
  -d person_ids[]=38706 \
  -d person_ids[]=89734 \
  -X "PUT"
```

> Example Response

```json
{
  "id": 50,
  "name": "Penny Opp",
  "person_ids": [38706, 89734],
  "organization_ids": [21442],
  "list_entries": [
    {
      "id": 999886,
      "creator_id": 1127776,
      "list_id": 6645,
      "entity_id": 50,
      "entity_type": 8,
      "created_at": "2018-03-07T16:32:35.794-08:00"
    }
  ]
}
```

`PUT /opportunities/{opportunity_id}`

Updates an existing opportunity with `opportunity_id` with the supplied parameters.

**Note:**

If you are trying to add a person to an opportunity, the existing values for
`person_ids` must also be passed into the endpoint.

If you are trying to add an organization to an opportunity, the existing values for
`organization_ids` must also be passed into the endpoint.

### Path Parameters

| Parameter      | Type    | Required | Description                                     |
| -------------- | ------- | -------- | ----------------------------------------------- |
| opportunity_id | integer | true     | The unique id of the opportunity to be updated. |

### Payload Parameters

| Parameter        | Type      | Required | Description                                                                                   |
| ---------------- | --------- | -------- | --------------------------------------------------------------------------------------------- |
| name             | string    | false    | The name of the opportunity.                                                                  |
| person_ids       | integer[] | false    | An array of unique identifiers of persons that the opportunity will be associated with.       |
| organization_ids | integer[] | false    | An array of unique identifiers of organizations that the opportunity will be associated with. |

### Returns

The opportunity resource that was just updated through a successful request.

## Delete an opportunity

> Example Request

```shell
curl "https://api.affinity.co/opportunities/120611418" \
  -u :<API-KEY> \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /opportunities/{opportunity_id}`

Deletes an opportunity with a specified `opportunity_id`.

**Note:**

1.  This will also delete all the field values, if any, associated with the opportunity.

### Path Parameters

| Parameter      | Type    | Required | Description                                                |
| -------------- | ------- | -------- | ---------------------------------------------------------- |
| opportunity_id | integer | true     | The unique id of the opportunity that needs to be deleted. |

### Returns

`{success: true}`.
