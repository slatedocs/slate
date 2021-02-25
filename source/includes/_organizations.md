# Organizations

An organization in Affinity represents an external company that your team is in touch
with- this could be an organization you're trying to invest in, sell to, or establish a
relationship with.

An organization has many people associated with it - these are your team's points of
contacts at that organization. Just like people, organizations can be added to multiple
lists and can be assigned field values.

To make the data quality as good as possible, we have our own proprietary database of
organizations that we have developed through third-party partnerships and web scraping.
We use this database to minimize data entry for you as you use Affinity's CRM products.

**Note:**

1.  If you are looking to add or remove an organization from a list, please check out the
    [List Entries](#list-entries) section of the API.
2.  If you are looking to modify a field value (one of the cells on Affinity's
    spreadsheet), please check out the [Field Values](#field-values) section of the API.

## The organization resource

> Example Response

```json
{
  "id":64779194,
  "name":"Affinity",
  "domain":"affinity.co",
  "domains":["affinity.co"],
  "crunchbase_uuid":"ca0e6bd5-7de2-0a26-f648-0bf66e88b05c",
  "global":false,
  "person_ids":[89734, 117270, 138123, 274492, 304848, ...]
  "list_entries": [
    {
      "id": 389,
      "list_id": 26,
      "creator_id": 38603,
      "entity_id": 64779194,
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

Each organization object has a unique `id`. It also has a `name`, `domain` (the website
of the organization), and `persons` associated with it. The `domain` is an important
attribute from an automation perspective, as it helps Affinity automatically link all
the appropriate person objects to the organization.

Each organization also has a flag determining whether it's `global` or not. As mentioned
above, Affinity maintains its own database of global organizations that each customer has
access to. Note that you cannot change the name or the domain of a `global`
organization. You also cannot delete a `global` organization.

Of course, if an organization is manually created by your team, all fields can be
modified and the organization can be deleted.

Dates of the most recent and upcoming interactions with an organization are available in the
`interaction_dates` field. This data is only included when passing
`with_interaction_dates=true` as a query parameter to the `/organizations` or
the `/organizations/{organization_id}` endpoints.

| Attribute         | Type        | Description                                                                                                                                                                                                                                                                             |
| ----------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                | integer     | The unique identifier of the organization object.                                                                                                                                                                                                                                       |
| name              | integer     | The name of the organization (see below).                                                                                                                                                                                                                                               |
| domain            | string      | The website name of the organization. This is used by Affinity to automatically associate person objects with an organization.                                                                                                                                                          |
| domains           | string[]    | An array of all the websites associated with the organization. These are also used to automatically associate person objects with an organization.                                                                                                                                      |
| crunchbase_uuid   | string      | The [Crunchbase UUID](https://data.crunchbase.com/docs/uuid) of the organization                                                                                                                                                                                                        |
| person_ids        | string[]    | An array of unique identifiers of person that are associated with the organization                                                                                                                                                                                                      |
| global            | boolean     | Returns whether this organization is a part of Affinity's global dataset of organizations. This is always false if the organization was created by you.                                                                                                                                 |
| list_entries      | ListEntry[] | An array of list entry resources associated with the organization, only returned as part of the [Get a specific organization](#get-a-specific-organization) endpoint.                                                                                                                   |
| interaction_dates | object      | An object with six string date fields representing the most recent and upcoming interactions with this organization: `first_email_date`, `last_email_date`, `last_event_date`, `last_interacton_date`, `first_event_date`, and `next_event_date`. Only returned when passing `with_interaction_dates=true`. |
| interactions      | object      | An object with six fields nested underneath.  Each field corresponds to one of the six interactions, and includes nested fields for `date` and `person_ids` which indicates the internal people associated with that event (people only returned if passing `with_interaction_persons=true`).  Only returned when passing `with_interaction_dates=true`. |

## Search for organizations

`GET /organizations`

Searches your team's data and fetches all the organizations that meet the search criteria.
The search term can be a part of an organization's name or domain.

This result is paginated. An initial request returns an object with two fields:
`organizations` and `next_page_token`. `organizations` contains an array of organization
resources. The value of `next_page_token` should be sent as the query parameter
`page_token` in another request to retrieve the next page of results. While paginating
through results, each request must have identical query parameters other than the changing
`page_token`. Otherwise, an `Invalid page_token variable` error will be returned.

The absence of a `next_page_token` indicates that all the records have been fetched,
though its presence does not necessarily indicate that there are _more_ resources to be
fetched. The next page may be empty (but then `next_page_token` would be `null` to
confirm that there are no more resources).

Pass `with_interaction_dates=true` as a query parameter to include dates of the most
recent and upcoming interactions with organizations. When this parameter is included,
organizations with no interactions will not be returned in the response.
Pass `with_interaction_persons=true` as a query parameter if
`with_interaction_dates=true` to also get the internal persons associated with the
interaction.

You can filter by interaction dates by providing additional query parameters like
`min_last_email_date` or `max_next_event_date`. The value of these query parameters should
be ISO 8601 formatted date strings. The interaction dates are stored with timestamps,
so the `{min,max}_<interaction>_date` parameter can include or exclude timestamps to explicitly
filter the dataset. If a timestamp is not provided, the system will use the default value of 
`00:00:00`.

> Example Request

```shell
curl "https://api.affinity.co/organizations?term=affinity" -u :<API-KEY>
```

> Example Response

```json
{
  "organizations": [
    {
      "id":64779194,
      "name":"Affinity",
      "domain":"affinity.co",
      "domains":["affinity.co"],
      "crunchbase_uuid":null,
      "global":false
    },
    {
      "id":1513682,
      "name":"Brand Affinity Technologies",
      "domain":"brandaffinity.net",
      "domains":["brandaffinity.net"],
      "crunchbase_uuid":"035ed4bb-7a8c-f713-5032-91a81a4b4bb9",
      "global":true
    },
    ...
  ],
  "next_page_token": "eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9",
}
```

> Example pagination

```shell
# To get the second page of results, issue the following query:
curl --request GET  "https://api.affinity.co/organizations" \
  -u :<API-KEY> \
  -d page_token=eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9
```

> Example with interaction date

```shell
# To get the results between min_last_email_interaction_date and max_last_email_interaction_date, issue the following query:
curl --request GET "https://api.affinity.co/organizations" \
  -u :<API-KEY> \
  -d min_last_email_date=2021-01-01T00:00:00 \
  -d with_interaction_dates=true \
  -d max_last_email_date=2021-01-12T23:59:59
```

### Query Parameters

| Parameter                      | Type    | Required | Description                                                                                                                                                                                            |
| ------------------------------ | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| term                           | string  | false    | A string used to search all the organizations in your team's address book. This could be a name or a domain name.                                                                                      |
| with_interaction_dates         | boolean | false    | When true, interaction dates will be present on the returned resources. Only organizations that have interactions will be returned.                                                                    |
| with_interaction_persons       | boolean | false    | When true, persons for each interaction will be returned. Used in conjunction with `with_interaction_dates`                                                                   |
| `{min,max}_<interaction>_date` | string  | false    | Only returns organizations with the given interaction type above or below the given value. `interaction` can be one of `first_email`, `last_email`, `last_interaction`, `last_event`, `first_event`, or `next_event`. |
| page_size                      | number  | false    | How many results to return per page. (Default is the maximum value of 500.)                                                                                                                            |
| page_token                     | string  | false    | The `next_page_token` from the previous response required to retrieve the next page of results.                                                                                                        |

### Returns

An object with two fields: `organizations` and `next_page_token`. `organizations` maps to
an array of all the organization resources that match the search criteria.
`next_page_token` includes a token to be sent along with the next request as the
`page_token` parameter to fetch the next page of results. When `with_interaction_dates` is
passed in the returned resources will have `interaction_dates` fields.

## Get a specific organization

> Example Request

```shell
curl "https://api.affinity.co/organizations/64779194" -u :<API-KEY>
```

> Example Response

```json
{
  "id":64779194,
  "name":"Affinity",
  "domain":"affinity.co",
  "domains":["affinity.co"],
  "crunchbase_uuid":"ca0e6bd5-7de2-0a26-f648-0bf66e88b05c",
  "global":false,
  "person_ids":[89734, 117270, 138123, 274492, 304848, ...],
  "list_entries": [
    {
      "id": 389,
      "list_id": 26,
      "creator_id": 38603,
      "entity_id": 64779194,
      "created_at": "2015-12-11T02:26:56.537-08:00",
    },
    ...
  ],
}
```

`GET /organizations/{organization_id}`

Fetches an organization with a specified `organization_id`.

### Path Parameters

| Parameter                | Type    | Required | Description                                                             |
| ----------------------   | ------- | -------- | ----------------------------------------------------------------------- |
| organization_id          | integer | true     | The unique id of the organization that needs to be retrieved.           |
| with_interaction_dates   | boolean | false    | When true, interaction dates will be present on the returned resources. |
| with_interaction_persons | boolean | false    | When true, persons for each interaction will be returned. Used in
conjunction with `with_interaction_dates` |

### Returns

The organization object corresponding to the `organization_id`.

## Create a new organization

> Example Request

```shell
curl "https://api.affinity.co/organizations" \
  -u :<API-KEY> \
  -d name="Acme Corporation" \
  -d domain="acme.co" \
  -d person_ids[]=38706
```

> Example Response

```json
{
  "id": 120611418,
  "name": "Acme Corporation",
  "domain": "acme.co",
  "domains": ["acme.co"],
  "crunchbase_uuid": null,
  "global": false,
  "person_ids": [38706]
}
```

`POST /organizations`

Creates a new organization with the supplied parameters.

**Note:** If you are looking to add an existing organization to a list, please check
the [List Entries](#list-entries) section of the API.

### Payload Parameters

| Parameter  | Type      | Required | Description                                                                                  |
| ---------- | --------- | -------- | -------------------------------------------------------------------------------------------- |
| name       | string    | true     | The name of the organization.                                                                |
| domain     | string    | false    | The domain name of the organization.                                                         |
| person_ids | integer[] | false    | An array of unique identifiers of persons that the new organization will be associated with. |

### Returns

The organization resource that was just created by a successful request.

## Update an organization

> Example Request

```shell
curl "https://api.affinity.co/organizations/120611418" \
  -u :<API-KEY> \
  -d name="Acme Corp." \
  -d person_ids[]=38706 \
  -d person_ids[]=89734 \
  -X "PUT"
```

> Example Response

```json
{
  "id": 120611418,
  "name": "Acme Corp.",
  "domain": "acme.co",
  "domains": ["acme.co"],
  "crunchbase_uuid": null,
  "global": false,
  "person_ids": [38706, 89734]
}
```

`PUT /organizations/{organization_id}`

Updates an existing organization with `organization_id` with the supplied parameters.

**Note:**

If you are looking to add an existing organization to a list, please check the
[List Entries](#list-entries) section of the API.

If you are trying to add a person to an organization, the existing values for
`person_ids` must also be passed into the endpoint.

### Path Parameters

| Parameter       | Type    | Required | Description                                      |
| --------------- | ------- | -------- | ------------------------------------------------ |
| organization_id | integer | true     | The unique id of the organization to be updated. |

### Payload Parameters

| Parameter  | Type      | Required | Description                                                                              |
| ---------- | --------- | -------- | ---------------------------------------------------------------------------------------- |
| name       | string    | false    | The name of the organization.                                                            |
| domain     | string    | false    | The domain name of the organization.                                                     |
| person_ids | integer[] | false    | An array of unique identifiers of persons that the organization will be associated with. |

### Returns

The organization resource that was just updated through a successful request.

## Delete an organization

> Example Request

```shell
curl "https://api.affinity.co/organizations/120611418" \
  -u :<API-KEY> \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /organizations/{organization_id}`

Deletes an organization with a specified `organization_id`.

**Note:**

1.  An appropriate error will be returned if you are trying to delete a `global` organization.
2.  This will also delete all the field values, if any, associated with the organization.
    Such field values exist linked to either global or list-specific fields.

### Path Parameters

| Parameter       | Type    | Required | Description                                                 |
| --------------- | ------- | -------- | ----------------------------------------------------------- |
| organization_id | integer | true     | The unique id of the organization that needs to be deleted. |

### Returns

`{success: true}`.

## Get global fields

> Example Request

```shell
curl "https://api.affinity.co/organizations/fields" -u :<API-KEY>
```

> Example Response

```json
[
  {
    "id":662,
    "name":"Potential Users",
    "value_type":3,
    "allows_multiple":false,
    "dropdown_options":[]
  },
  {
    "id":700,
    "name":"Leads",
    "value_type":0,
    "allows_multiple":true,
    "dropdown_options":[]
  },
  {
    "id":2988,
    "name":"Last Funding Date",
    "value_type":4,
    "allows_multiple":false,
    "dropdown_options":[]
  },
  ...
]
```

`GET /organizations/fields`

Fetches an array of all the global fields that exist on organizations.
If you aren't sure about what fields are, please read the
[Fields](#fields) section first.

### Parameters

None.

### Returns

An array of the fields that exist on all organizations for your team.
