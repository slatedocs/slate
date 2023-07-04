# Interactions

The interactions API allows you to manage interactions.

**These endpoints are only available to Enterprise tier customers**. Please reach out to
[support@affinity.co](support@affinity.co) if you are interested in getting access.

## The Interactions Resource

Different types of interactions have different interaction resources.
Note the combination of ID and type for an interaction is unique.

> Example Response

```json
# Meeting/Call type
{
    "date": "2022-02-22T11:15:29.758-08:00",
    "id": 3007,
    "attendees": [
        "john@affinity.co",
        "yen@alice.com"
    ],
    "start_time": "2022-02-22T11:15:29.758-08:00",
    "end_time": null,
    "updated_at": null,
    "manual_creator_id": 2,
    "title": "Manually logged event",
    "type": 0,
    "notes": [
        7
    ],
    "persons": [
        {
            "id": 443,
            "type": 1,
            "first_name": "John",
            "last_name": "Doe",
            "primary_email": "john@affinity.co",
            "emails": [
                "john@affinity.co"
            ]
        },
        {
            "id": 2021,
            "type": 0,
            "first_name": "Alice",
            "last_name": "Yen",
            "primary_email": "yen@alice.com",
            "emails": [
                "yen@alice.com"
            ]
        }
    ]
}

# Chat message type
{
    "id": 7267,
    "date": "2022-02-22T11:50:20.126-08:00",
    "direction": 0,
    "manual_creator_id": 443,
    "persons": [
        {
            "id": 443,
            "type": 1,
            "first_name": "John",
            "last_name": "Doe",
            "primary_email": "john@affinity.co",
            "emails": [
                "john@affinity.co"
            ]
        },
        {
            "id": 2021,
            "type": 0,
            "first_name": "Alice",
            "last_name": "Yen",
            "primary_email": "yen@alice.com",
            "emails": [
                "yen@alice.com"
            ]
        }
    ],
    "type": 2,
    "notes": [
        7462534
    ]
}

# Email type
{
    "date": "2021-02-04T09:43:39.717-08:00",
    "id": 417,
    "subject": "John <-> Alice",
    "type": 3,
    "from": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "to": [
        {
            "id": 2021,
            "type": 0,
            "first_name": "Alice",
            "last_name": "Yen",
            "primary_email": "yen@alice.com",
            "emails": [
                "yen@alice.com"
            ]
        }
    ],
    "cc": [],
    "direction": 0
}
```

| Attribute         | Type      | Description                                                                                                                                      |
| ----------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| id                | integer   | The identifier of the interaction. Note the ID is not unique across different types of interactions.                                             |
| manual_creator_id | integer   | The unique identifier of the person object who created the interaction.                                                                          |
| persons           | object[]  | The list of persons who are associated with the interaction.                                                                                     |
| type              | integer   | The type of interaction. This can be one of many values, as described in the table below.                                                        |
| logging_type      | integer   | The logging type of interaction.                                                                                                                 |
| attendees         | string[]  | The list of person emails that attended the event.                                                                                               |
| date              | datetime  | The time when the interaction happens.                                                                                                           |
| start_time        | datetime  | The time when event starts.                                                                                                                      |
| end_time          | datetime  | The time when event ends.                                                                                                                        |
| title             | string    | The title of event.                                                                                                                              |
| notes             | integer[] | The list of note IDs that are associated with the event.                                                                                         |
| direction         | integer   | The direction of the interaction. Only relevant for `type == 2` and `type == 3`. This can be one of two values, as described in the table below. |

### Interactions Types

| Type         | Value | Description                                 |
| ------------ | ----- | ------------------------------------------- |
| Meeting      | 0     | Type specifying a meeting interaction.      |
| Call         | 1     | Type specifying a call interaction.         |
| Chat message | 2     | Type specifying a chat message interaction. |
| Email        | 3     | Type specifying a email interaction.        |

### Direction Types

| Type     | Value | Description                                    |
| -------- | ----- | ---------------------------------------------- |
| Sent     | 0     | The interaction is sent by an internal person. |
| Received | 1     | The interaction is sent by an external person. |

### Logging Types

| Type   | Value | Description                                                                              |
| ------ | ----- | ---------------------------------------------------------------------------------------- |
| All    | 0     | Type specifying both automatically logged interactions and manually logged interactions. |
| Manual | 1     | Type specifying only manually logged interactions                                        |

## Get All Interactions

> Example Request

```shell
curl "https://api.affinity.co/interactions?organization_id=1609909&type=3&start_time=2021-01-01T07:00:00Z&end_time=2021-02-25T21:00:00Z&" -u :$APIKEY
```

> Example Response

```json
{
  "emails": [
    {
      "date": "2021-02-04T09:43:39.717-08:00",
      "id": 417,
      "subject": "John <-> Alice",
      "type": 3,
      "from": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": ["john@affinity.co"]
      },
      "to": [
        {
          "id": 2021,
          "type": 0,
          "first_name": "Alice",
          "last_name": "Yen",
          "primary_email": "yen@alice.com",
          "emails": ["yen@alice.com"]
        }
      ],
      "cc": [],
      "direction": 0
    },
    {
      "date": "2021-02-02T12:55:19.801-08:00",
      "id": 265,
      "subject": "Alfred <-> Alice",
      "type": 3,
      "from": {
        "id": 1012,
        "type": 1,
        "first_name": "Alfred",
        "last_name": "Hickey",
        "primary_email": "alfredhickeyshmcneax@affinity.co",
        "emails": ["alfredhickeyshmcneax@affinity.co"]
      },
      "to": [
        {
          "id": 2021,
          "type": 0,
          "first_name": "Alice",
          "last_name": "Yen",
          "primary_email": "yen@alice.com",
          "emails": ["yen@alice.com"]
        }
      ],
      "cc": [],
      "direction": 0
    }
  ],
  "next_page_token": "eyJwYXJhbXMiOnsiY29tcGxldGVyX2lkIjpudWxsLCJvd25lcl9pZCI6bnVsbCwiY3JlYXRvcl9"
}
```

`GET /interactions`

Returns all interactions that meet the query parameters.

### Query Parameters

| Parameter          | Type    | Required | Description                                                                                                                                                         |
| ------------------ | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| type               | integer | true     | The type of interactions to be retrieved.                                                                                                                           |
| logging_type       | integer | false    | The logging type of interactions to be retrieved.                                                                                                                   |
| person_id          | integer | false    | A unique identifier that represents an external Person that was involved in the interactions.                                                                       |
| organization_id    | integer | false    | A unique identifier that represents an Organization that was involved in the interactions.                                                                          |
| opportunity_id     | integer | false    | A unique identifier that represents an Opportunity that was involved in the interactions.                                                                           |
| internal_person_id | integer | false    | A unique identifier that represents an internal person that was involved in the interactions.                                                                       |
| direction          | integer | false    | The direction of the interactions. Only applies to chat message and email.                                                                                          |
| start_time         | string  | true     | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the start of the time range for the interactions to be retrieved. |
| end_time           | string  | true     | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the end of the time range for the interactions to be retrieved.   |
| page_size          | number  | false    | How many results to return per page. (Default is the maximum value of 500.)                                                                                         |
| page_token         | string  | false    | The `next_page_token` from the previous response required to retrieve the next page of results.                                                                     |

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>One <code>person_id</code>, <code>organization_id</code> or <code>opportunity_id</code> must be specified per request.</li>
    <li>Only one <code>type</code> of interaction can be specified per request.</li>
    <li>An error will be returned if an internal person is used in the <code>person_id</code> parameter.</li>
  </ul>
</aside>

### Returns

An array of all the interactions filtered by query parameters. `next_page_token` includes a
token to be sent along with the next request as the `page_token` parameter to fetch
the next page of results.

<aside class="notice">
  <h6>Note</h6>
  <p>Interactions in the API response may not be visible on a CRM profile page if they have the exact same timestamp as another interaction.</p>
</aside>

## Get a Specific Interaction

> Example Request

```shell
# Returns the interactions with the specified `id`
curl "https://api.affinity.co/interactions/15326?type=2" -u :$APIKEY
```

> Example Response

```json
{
  "id": 7267,
  "date": "2022-02-22T11:50:20.126-08:00",
  "direction": 0,
  "manual_creator_id": 64056952,
  "persons": [
    {
      "id": 443,
      "type": 1,
      "first_name": "John",
      "last_name": "Doe",
      "primary_email": "john@affinity.co",
      "emails": ["john@affinity.co"]
    },
    {
      "id": 2021,
      "type": 0,
      "first_name": "Alice",
      "last_name": "Yen",
      "primary_email": "yen@alice.com",
      "emails": ["yen@alice.com"]
    }
  ],
  "type": 2,
  "notes": [7462534]
}
```

`GET /interactions/{id}`

Gets the details for a specific interaction given the existing ID and type.

### Path Parameters

| Parameter | Type    | Required | Description                                               |
| --------- | ------- | -------- | --------------------------------------------------------- |
| id        | integer | true     | The identifier of the interaction object to be retrieved. |
| type      | integer | true     | The type of interaction to be retrieved.                  |

### Returns

The details of the interaction corresponding to the ID and type specified in the path
parameter. An appropriate error is returned if an invalid ID and type are supplied.

## Create a New Interaction

> Example Request

```shell
curl -X POST "https://api.affinity.co/interactions" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"person_ids": [443, 2021], "type": 0, "date": "2021-02-07T10:56:29.546-08:00", "content": "Create interaction from external API."}'
```

> Example Response

```json
{
  "date": "2021-02-07T10:56:29.546-08:00",
  "id": 3007,
  "attendees": ["john@affinity.co", "yen@alice.com"],
  "start_time": "2021-02-07T10:56:29.546-08:00",
  "end_time": null,
  "updated_at": null,
  "manual_creator_id": 443,
  "title": "Manually logged event",
  "type": 0,
  "notes": [7],
  "persons": [
    {
      "id": 443,
      "type": 1,
      "first_name": "John",
      "last_name": "Doe",
      "primary_email": "john@affinity.co",
      "emails": ["john@affinity.co"]
    },
    {
      "id": 2021,
      "type": 0,
      "first_name": "Alice",
      "last_name": "Yen",
      "primary_email": "yen@alice.com",
      "emails": ["yen@alice.com"]
    }
  ]
}
```

`POST /interactions`

Creates a new interaction with the supplied parameters.

### Path Parameters

| Parameter  | Type      | Required | Description                                                                                                                                                                                     |
| ---------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| type       | integer   | true     | The type of interaction to be created. Only meetings (`type == 0`), calls (`type == 1`) and chat messages (`type == 2`) are supported.                                                          |
| person_ids | integer[] | true     | The list of person IDs that are associated with the event. At least one internal person ID must be included (see [Person Resource](#the-person-resource) for more details on internal persons). |
| content    | string    | true     | The string containing the content of the new interaction.                                                                                                                                       |
| direction  | integer   | false    | The direction of the chat message to be created. Only applies to chat messages (`type == 2`).                                                                                                   |
| date       | string    | true     | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the date time the interaction occurred.                                                       |

### Returns

The interaction created through this request.

<aside class="notice">
  <h6>Note</h6>
  <p>When creating an interaction using the API, the user corresponding to the API token will be the creator by default.</p>
</aside>

## Update an Interaction

> Example Request

```shell
curl -X PUT "https://api.affinity.co/interaction/3007" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"type": 0, "date": "2022-02-07T10:56:29.546-08:00", "content": "Update interaction from external API."}'
```

> Example Response

```json
{
  "date": "2022-02-07T10:56:29.546-08:00",
  "id": 3007,
  "attendees": ["john@affinity.co", "yen@alice.com"],
  "start_time": "2022-02-07T10:56:29.546-08:00",
  "end_time": null,
  "updated_at": null,
  "manual_creator_id": 443,
  "title": "Manually logged event",
  "type": 0,
  "notes": [7],
  "persons": [
    {
      "id": 443,
      "type": 1,
      "first_name": "John",
      "last_name": "Doe",
      "primary_email": "john@affinity.co",
      "emails": ["john@affinity.co"]
    },
    {
      "id": 2021,
      "type": 0,
      "first_name": "Alice",
      "last_name": "Yen",
      "primary_email": "yen@alice.com",
      "emails": ["yen@alice.com"]
    }
  ]
}
```

`PUT /interactions/{id}`

Updates the content of an existing interaction with the supplied parameters.

<aside class="notice">
  <h6>Note</h6>
  <p>Updating the content of an interaction using the API is not supported when mentioned IDs are in the content.</p>
</aside>

### Path Parameters

| Parameter | Type    | Required | Description                              |
| --------- | ------- | -------- | ---------------------------------------- |
| id        | integer | true     | The ID of the interaction to be updated. |

### Payload Parameters

| Parameter  | Type      | Required | Description                                                                                                                               |
| ---------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| type       | integer   | true     | The type of interaction to be updated.                                                                                                    |
| person_ids | integer[] | true     | The list of person IDs that are associated with the event.                                                                                |
| content    | string    | false    | The string containing the content of the interaction.                                                                                     |
| date       | string    | false    | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the date time the interaction occurred. |

### Returns

The interaction object that was just updated through this request.

## Delete an Interaction

> Example Request

```shell
curl "https://api.affinity.co/interaction/22984?type=0" \
  -u :$APIKEY \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /interaction/{id}`

Deletes the interaction with the specified `id`.

### Path Parameters

| Parameter | Type    | Required | Description                                     |
| --------- | ------- | -------- | ----------------------------------------------- |
| id        | integer | true     | The unique ID of the interaction to be deleted. |
| type      | integer | true     | The type of interaction to be deleted.          |

### Returns

`{success: true}`.
