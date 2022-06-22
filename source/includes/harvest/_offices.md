# Offices

## The office object

An organization’s offices.

> With `render_as=list` (default)

```json
{
  "id": 47012,
  "name": "New York",
  "location": {
      "name": "New York, United States"
  },
  "primary_contact_user_id": 485538,
  "parent_id": 50849,
  "parent_office_external_id": "parent-1",
  "child_ids": [
      50891,
      50852
  ],
  "child_office_external_ids": [
      "child-1",
      "child-2"
  ],
  "external_id": "12345"
}
```

> With `render_as=tree`

```json
{
  "id": 47012,
  "name": "New York",
  "location": {
      "name": "New York, United States"
  },
  "primary_contact_user_id": 485538,
  "external_id": "12345",
  "children": [
      {
          "id": 50891,
          "name": "Utica",
          "location": {
              "name": "Utica, New York, United States"
          },
          "primary_contact_user_id": 336474,
          "external_id": "45647",
          "children": []
      },
      {
          "id": 50852,
          "name": "New York City",
          "location": {
              "name": "New York, New York, United States"
          },
          "primary_contact_user_id": 676259,
          "external_id": "67890",
          "children": []
      }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The office's unique identifier |
| name | The office's name |
| location | The office's location |
| external_id | An arbitrary ID provided by an external source; does not map to another entity in Greenhouse.
| parent_office_external_id | The external_id of this office's parent.
| parent_office_child_ids | the external_ids of this office's children. Note the order of this array may not match the order of the child_ids array. If there are five children and none of them have parent ids, this array will contain five null indices. 

## GET: List Offices

```shell
curl 'https://harvest.greenhouse.io/v1/offices'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

> With `render_as=list` (default)

```json
[
  {
    "id": 50891,
    "name": "Utica",
    "location": {
        "name": "Utica, New York, United States"
    },
    "primary_contact_user_id": 336474,
    "parent_id": 47012,
    "parent_office_external_id": "parent-1",
    "child_ids": [],
    "child_office_external_ids": [],
    "external_id": "45647"
  },
  {
    "id": 47012,
    "name": "New York",
    "location": {
        "name": "New York, United States"
    },
    "primary_contact_user_id": 485538,
    "parent_id": 50849,
    "parent_office_external_id": "parent-2",
    "child_ids": [
        50891,
        50852
    ],
    "child_office_external_ids": [
        "child-office-1",
        nil
    ],
    "external_id": "12345"
  },
  {
    "id": 50852,
    "name": "New York City",
    "location": {
        "name": "New York, New York, United States"
    },
    "primary_contact_user_id": 676259,
    "parent_id": 47012,
    "parent_office_external_id": "parent-1",
    "child_ids": [],
    "child_office_external_ids": [],
    "external_id": "67890"
  }
]
```

> With `render_as=tree`

```json
[
  {
    "id": 50891,
    "name": "Utica",
    "location": {
        "name": "Utica, New York, United States"
    },
    "primary_contact_user_id": 336474,
    "parent_id": 47012,
    "parent_office_external_id": "parent-1",
    "child_ids": [],
    "child_office_external_ids": [],
    "external_id": "45647"
  },
  {
    "id": 47012,
    "name": "New York",
    "location": {
        "name": "New York, United States"
    },
    "primary_contact_user_id": 485538,
    "parent_id": 50849,
    "parent_office_external_id": "parent-2",
    "child_ids": [
        50891,
        50852
    ],
    "child_office_external_ids": [
        "child-office-1",
        nil
    ],
    "external_id": "12345"
  },
  {
    "id": 50852,
    "name": "New York City",
    "location": {
        "name": "New York, New York, United States"
    },
    "primary_contact_user_id": 676259,
    "parent_id": 47012,
    "parent_office_external_id": "parent-1",
    "child_ids": [],
    "child_office_external_ids": [],
    "external_id": "67890"
  }
]
```

List all of an organization's offices.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/offices`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| render_as | This parameter defines how to represent the list of offices. The default value is 'list', which returns a flat list of offices.  If this is set to 'tree', offices are represented in a tree-like structure where they may include sub-offices as `children`
| external_id | If supplied, only return office(s) with that external ID.

<br>
[See noteworthy response attributes.] (#the-office-object)


## GET: Retrieve Office

```shell
curl 'https://harvest.greenhouse.io/v1/offices/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 47012,
  "name": "New York",
  "location": {
      "name": "New York, United States"
  },
  "primary_contact_user_id": 485538,
  "parent_id": 50849,
  "parent_office_external_id": "parent-1",
  "child_ids": [
      50891,
      50852
  ],
  "child_office_external_ids": [
      "child-office-1",
      nil
  ],
  "external_id": "12345"
}
```

> With `render_as=tree`

```json
{
  "id": 47012,
  "name": "New York",
  "location": {
      "name": "New York, United States"
  },
  "primary_contact_user_id": 485538,
  "external_id": "12345",
  "children": [
      {
          "id": 50891,
          "name": "Utica",
          "location": {
              "name": "Utica, New York, United States"
          },
          "primary_contact_user_id": 336474,
          "external_id": "45647",
          "children": []
      },
      {
          "id": 50852,
          "name": "New York City",
          "location": {
              "name": "New York, New York, United States"
          },
          "primary_contact_user_id": 676259,
          "external_id": "67890",
          "children": []
      }
  ]
}
```

Retrieve an office by its ID.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/offices/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the office to retrieve

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| render_as | This parameter defines how to represent the list of offices. The default value is 'list', which returns a flat list of offices.  If this is set to 'tree', offices are represented in a tree-like structure where they may include sub-offices as `children`

<br>
[See noteworthy response attributes.] (#the-office-object)

## PATCH: Edit Office

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/offices/{id}'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```
{
   "name": "Research and Development",
   "location": "New York, NY",
   "external_id": "1234567890"
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 50891,
  "name": "Utica",
  "location": {
      "name": "Utica, New York, United States"
  },
  "primary_contact_user_id": 336474,
  "parent_id": 47012,
  "parent_office_external_id": "parent-1",
  "child_ids": [],
  "child_office_external_id": [],
  "external_id": "45647"
}
```

Edit an office’s basic information.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/offices/{id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
name | Yes | string | The office’s name. If included, this cannot be blank.
location | No | string | The office’s location.
external_id* | No | string | The office’s external ID. If included, this must be unique to this office within the organization.

\* - If the external id feature is not enabled for your organization, attempting to edit this field will raise an API Error.


## POST: Add Office

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/offices'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "name": "Brooklyn",
  "parent_id": 47012,
  "primary_contact_user_id": 336474,
  "location": "Brooklyn, NY"
}

or

{
  "name": "Brooklyn",
  "external_parent_id": "parent-1",
  "primary_contact_user_id": 336474,
  "location": "Brooklyn, NY"
}

```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 58028,
  "name": "Brooklyn",
  "location": {
      "name": "Brooklyn, NY"
  },
  "primary_contact_user_id": 336474,
  "parent_id": 47012,
  "parent_office_external_id": "parent-1",
  "child_ids": [],
  "child_office_external_id": [],
  "external_id": null
}
```

Create a new office

### HTTP Request

`POST https://harvest.greenhouse.io/v1/offices`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.  Must be a user who can create offices.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
`name` |  yes | string | The name of your new office.  Must be less than 255 characters and unique within your organization.
`location` | no | string | This is a text representation of the office's location.  This is free-form text.  It is not geo-located.
`primary_contact_user_id` | no | number | The id of the user who will be the primary in-house contact for this office.  This user must be a site-admin.
`parent_id`* | no | number | The office id for the new office to be nested under.  If this isn't included, the office will be created at the top level.
`external_parent_id`** | no | string | The external id for the parent office. This can be used instead of parent_id, but only one of this or parent_id may be included. If both are included, this will fail. 
`external_id`** | no | string | The external_id for the office.

\* - The tiered office feature is available only for customers with the Advanced or Expert Greenhouse Recruiting package. Use of this field will return an error for other Greenhouse Recruiting customers.

\** - The external_id feature is available only for customers with the Expert Greenhouse Recruiting package. Use of this field will return an error for other Greenhouse Recruiting customers.
