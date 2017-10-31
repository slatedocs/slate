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

1. If you are looking to add or remove an organization from a list, please check out the
[List Entries](#list-entries) section of the API.
2. If you are looking to modify a field value (one of the cells on Affinity's
spreadsheet), please check out the [Field Values](#field-values) section of the API.

## The organization resource

> Example Response

```json
{
  "id":64779194,
  "name":"Affinity",
  "domain":"affinity.co",
  "global":false,
  "person_ids":[89734, 117270, 138123, 274492, 304848, ...]
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

Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the organization object.
name | integer | The name of the organization (see below).
domain | string | The website name of the organization. This is used by Affinity to automatically associate person objects with an organization.
person_ids | string[] | An array of unique identifiers of person that are associated with the organization
global | boolean | Returns whether this organization is a part of Affinity's global dataset of organizations. This is always false if the organization was created by you.


## Search for organizations

`GET /organizations`

Searches your team's data and fetches all the organizations that meet the search criteria.
The search term can be a part of an organization's name or domain.

This result is paginated. An initial request returns an object with two fields:
`organizations` and `next_page_token`. `organizations` contains an array of organization
resources. The value of `next_page_token` should be sent as the query parameter
`page_token` in another request to retrieve the next page of results. While paginating
through results each request must have identical query parameters other than the changing
`page_token`, otherwise an `Invalid page_token variable` error will be returned.

The absence of a `next_page_token` indicates that all the records have been fetched,
though its presence does not necessarily indicated that there are _more_ resources to be
fetched. The next page may be empty (but then would `next_page_token` would be `null` to
confirm that there are no more resources).

> Example Request

```shell
curl "https://api.affinity.vc/organizations?term=affinity" -u :<API-KEY>
```
> Example Response

```json
{
  "organizations": [
    {
      "id":64779194,
      "name":"Affinity",
      "domain":"affinity.co",
      "global":false
    },
    {
      "id":1513682,
      "name":"Brand Affinity Technologies",
      "domain":"brandaffinity.net",
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
curl "https://api.affinity.vc/organizations?term=affinity&page_token=eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9" -u :<API-KEY>
```

### Query Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
term | string | false | A string used to search all the organizations in your team's address book. This could be a name or a domain name.
page_size | number | false | How many results to return per page. (Default is the maximum value of 500.)
page_token | string | false | The `next_page_token` from the previous response required to retrieve the next page of results.

### Returns
An object with two fields: `organizations` and `next_page_token`. `organizations` maps to
an array of all the organization resources that match the search criteria.
`next_page_token` includes a token to be sent along with the next request as the
`page_token` parameter to fetch the next page of results.

## Get a specific organization

> Example Request

```shell
curl "https://api.affinity.vc/organizations/64779194" -u :<API-KEY>
```

> Example Response

```json
{
  "id":64779194,
  "name":"Affinity",
  "domain":"affinity.co",
  "global":false,
  "person_ids":[89734, 117270, 138123, 274492, 304848, ...]
}
```

`GET /organizations/{organization_id}`

Fetches an organization with a specified `organization_id`.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
organization_id | integer | true | The unique id of the organization that needs to be retrieved.

### Returns
The organization object corresponding to the `organization_id`.

## Create a new organization

> Example Request

```shell
curl "https://api.affinity.vc/organizations" \
  -u :<API-KEY> \
  -d name="Acme Corporation" \
  -d domain="acme.co" \
  -d person_ids[]=38706
```

> Example Response

```json
{
  "id":120611418,
  "name":"Acme Corporation",
  "domain":"acme.co",
  "global":false,
  "person_ids":[38706]
}
```

`POST /organizations`

Creates a new organization with the supplied parameters.

**Note:** If you are looking to add an existing organization to a list, please check
the [List Entries](#list-entries) section of the API.

### Payload Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
name | string | true | The name of the organization.
domain | string | false | The domain name of the organization.
person_ids | integer[] | false | An array of unique identifiers of persons that the new organization will be associated with.

### Returns
The organization resource that was just created by a successful request.

## Update an organization

> Example Request

```shell
curl "https://api.affinity.vc/organizations/120611418" \
  -u :<API-KEY> \
  -d name="Acme Corp." \
  -d person_ids[]=38706 \
  -d person_ids[]=89734 \
  -X "PUT"
```

> Example Response

```json
{
  "id":120611418,
  "name":"Acme Corp.",
  "domain":"acme.co",
  "global":false,
  "person_ids":[38706,89734]
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

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
organization_id | integer | true | The unique id of the organization to be updated.

### Payload Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
name | string | false | The name of the organization.
domain | string | false | The domain name of the organization.
person_ids | integer[] | false | An array of unique identifiers of persons that the organization will be associated with.

### Returns
The organization resource that was just updated through a successful request.

## Delete an organization

> Example Request

```shell
curl "https://api.affinity.vc/organizations/120611418" \
  -u :<API-KEY> \
  -X "DELETE"
```

> Example Response

```json
{"success": true}
```

`DELETE /organizations/{organization_id}`

Deletes an organization with a specified `organization_id`.

**Note:**

1. An appropriate error will be returned if you are trying to delete a `global` organization.
2. This will also delete all the field values, if any, associated with the organization.
Such field values exist linked to either global or list-specific fields.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
organization_id | integer | true | The unique id of the organization that needs to be deleted.

### Returns
`{success: true}`.

## Get global fields

> Example Request

```shell
curl "https://api.affinity.vc/organizations/fields" -u :<API-KEY>
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
