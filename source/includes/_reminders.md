# Reminders

The reminders API allows you to manage reminders.

## The Reminder Resource

A reminder object contains `content`, which is a string containing the reminder content.
In addition, a person, organization or opportunity can be tagged to the reminder.

> Example Response

```json
{
    "id": 15326,
    "type": 1,
    "created_at": "2021-11-18T14:34:53.218-08:00",
    "completed_at": null,
    "content": "Reply email to Alice",
    "due_date": "2021-12-18T14:34:53.217-08:00",
    "reset_type": 1,
    "reminder_days": 30,
    "status": 2,
    "creator": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "owner": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "completer": null,
    "person": {
        "id": 2021,
        "type": 0,
        "first_name": "Alice",
        "last_name": "Yen",
        "primary_email": "yen@alice.com",
        "emails": [
            "yen@alice.com"
        ]
    },
    "organization": null,
    "opportunity": null
}
```

| Attribute     | Type     | Description                                                                                           |
| ------------- | -------- | ----------------------------------------------------------------------------------------------------- |
| id            | integer  | The unique identifier of the reminder object.                                                         |
| creator       | object   | The person object who created the reminder.                                                           |
| person        | object   | The person object tagged in the reminder.                                                             |
| organization  | object   | The organization object tagged in the reminder.                                                       |
| opportunity   | object   | The opportunity object tagged in the reminder.                                                        |
| owner         | object   | The person object who was assigned to the reminder.                                                   |
| completer     | object   | The person object who completed the reminder.                                                         |
| type          | integer  | The type of reminder.                                                                                 |
| reset_type    | integer  | The reset type of the recurring reminder.                                                             |
| status        | integer  | Current status of the reminder.                                                                       |
| created_at    | datetime | The time when the reminder was created.                                                               |
| contect       | string   | The string containing the content of the reminder.                                                    |
| due_date      | datetime | The due date of the reminder.                                                                         |
| completed_at  | datetime | The time when the reminder was completed.                                                             |
| reminder_days | integer  | When a recurring reminder is completed or reset, the number of days before the reminder is due again. |

### Reminder Types

| Type      | Value | Description                           |
| --------- | ----- | --------------------------------------|
| One-time  | 0     | Type specifying a one time reminder.  |
| Recurring | 1     | Type specifying a recurring reminder. |

### Reminder Reset Types

| Type         | Value | Description                                               |
| ------------ | ----- | ----------------------------------------------------------|
| Interaction  | 0     | Recurring reminder that can be reset by email or meeting. |
| Email        | 1     | Recurring reminder that can be reset by an email.         |
| Meeting      | 2     | Recurring reminder that can be reset by a meeting.        |

### Reminder Status Types

| Type      | Value | Description                                               |
| --------- | ----- | ----------------------------------------------------------|
| Completed | 0     | Reminder that has been marked as completed.               |
| Active    | 1     | Reminder that has not been completed and is not past due. |
| Overdue   | 2     | Reminder that has not been completed and is past due.     |

## Get All Reminders

> Example Request

```shell
curl "https://api.affinity.co/reminders?page_size=2&status=2" -u :$APIKEY
```

> Example Response

```json
{
    "reminders": [
        {
            "id": 15562,
            "type": 1,
            "created_at": "2021-11-22T09:31:52.415-08:00",
            "completed_at": null,
            "content": "Recurring reminder",
            "due_date": "2021-12-22T09:31:52.415-08:00",
            "reset_type": 0,
            "reminder_days": 30,
            "status": 2,
            "creator": {
                "id": 443,
                "type": 1,
                "first_name": "John",
                "last_name": "Doe",
                "primary_email": "john@affinity.co",
                "emails": [
                    "john@affinity.co"
                ]
            },
            "owner": {
                "id": 443,
                "type": 1,
                "first_name": "John",
                "last_name": "Doe",
                "primary_email": "john@affinity.co",
                "emails": [
                    "john@affinity.co"
                ]
            },
            "completer": null,
            "person": null,
            "organization": {
                "id": 4904,
                "name": "organization",
                "domain": null,
                "domains": [],
                "crunchbase_uuid": null,
                "global": false
            },
            "opportunity": null
        },
        {
            "id": 15326,
            "type": 1,
            "created_at": "2021-11-18T14:34:53.218-08:00",
            "completed_at": null,
            "content": "Reply email to Alice",
            "due_date": "2021-12-18T14:34:53.217-08:00",
            "reset_type": 1,
            "reminder_days": 30,
            "status": 2,
            "creator": {
                "id": 443,
                "type": 1,
                "first_name": "John",
                "last_name": "Doe",
                "primary_email": "john@affinity.co",
                "emails": [
                    "john@affinity.co"
                ]
            },
            "owner": {
                "id": 443,
                "type": 1,
                "first_name": "John",
                "last_name": "Doe",
                "primary_email": "john@affinity.co",
                "emails": [
                    "john@affinity.co"
                ]
            },
            "completer": null,
            "person": {
                "id": 2021,
                "type": 0,
                "first_name": "Alice",
                "last_name": "Yen",
                "primary_email": "yen@alice.com",
                "emails": [
                    "yen@alice.com"
                ]
            },
            "organization": null,
            "opportunity": null
        }
    ],
    "next_page_token": "eyJwYXJhbXMiOnsiY29tcGxldGVyX2lkIjpudWxsLCJvd25lcl9pZCI6bnVsbCwiY3JlYXRvcl9"
}
```

`GET /reminders`

Returns all reminders that meet the query parameters. 

### Query Parameters

| Parameter       | Type    | Required | Description                                                                                                                                                    |
| --------------- | ------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| person_id       | integer | false    | A unique identifier that represents a Person that was tagged in the retrieved reminders.                                                                       |
| organization_id | integer | false    | A unique identifier that represents an Organization that was tagged in the retrieved reminders.                                                                |
| opportunity_id  | integer | false    | A unique identifier that represents an Opportunity that was tagged in the retrieved reminders.                                                                 |
| creator_id      | integer | false    | A unique identifier that represents an internal person whose created reminders should be retrieved.                                                            |
| owner_id        | integer | false    | A unique identifier that represents an internal person that was assigned to the retrieved reminders.                                                           |
| completer_id    | integer | false    | A unique identifier that represents an internal person whose completed reminders should be retrieved.                                                          |
| type            | integer | false    | The type of reminders to be retrieved.                                                                                                                         |
| reset_type      | integer | false    | The reset type of reminders to be retrieved. Required when `type == 1`.                                                                                        |
| status          | integer | false    | The status of reminders to be retrieved.                                                                                                                       |
| due_before      | string  | false    | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the date that reminders to be retrieved are due before.      |
| due_after       | string  | false    | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the date that reminders to be retrieved are due after.       |
| page_size       | number  | false    | How many results to return per page. (Default is the maximum value of 500.)                                                                                    |
| page_token      | string  | false    | The `next_page_token` from the previous response required to retrieve the next page of results.                                                                |

### Returns

An array of all the reminders filtered by query parameters. `next_page_token` includes a
token to be sent along with the next request as the `page_token` parameter to fetch
the next page of results.

## Get a Specific Reminder

> Example Request

```shell
# Returns the reminder with the specified `reminder_id`
curl "https://api.affinity.co/reminders/15326" -u :$APIKEY
```

> Example Response

```json
{
    "id": 15326,
    "type": 1,
    "created_at": "2021-11-18T14:34:53.218-08:00",
    "completed_at": null,
    "content": "Reply email to Alice",
    "due_date": "2021-12-18T14:34:53.217-08:00",
    "reset_type": 1,
    "reminder_days": 30,
    "status": 2,
    "creator": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "owner": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "completer": null,
    "person": {
        "id": 2021,
        "type": 0,
        "first_name": "Alice",
        "last_name": "Yen",
        "primary_email": "yen@alice.com",
        "emails": [
            "yen@alice.com"
        ]
    },
    "organization": null,
    "opportunity": null
}
```

`GET /reminders/{reminder_id}`

Gets the details for a specific reminder given the existing reminder id.

### Path Parameters

| Parameter   | Type    | Required | Description                                                   |
| ----------- | ------- | -------- | ------------------------------------------------------------- |
| reminder_id | integer | true     | The unique identifier of the reminder object to be retrieved. |

### Returns

The details of the reminder corresponding to the reminder id specified in the path
parameter. An appropriate error is returned if an invalid reminder id is supplied.

## Create a New Reminder

> Example Request

```shell
curl -X POST "https://api.affinity.co/reminders" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"owner_id": 443, "person_id": 2021, "type": 0, "due_date": "2021-11-30", "content": "Create reminder from external API."}'
```

> Example Response

```json
{
    "id": 15385,
    "type": 0,
    "created_at": "2022-02-01T09:36:07.316-08:00",
    "completed_at": null,
    "content": "Create reminder from external API",
    "due_date": "2021-11-30T00:00:00.000-08:00",
    "reset_type": null,
    "reminder_days": null,
    "status": 2,
    "creator": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "owner": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "completer": null,
    "person": {
        "id": 2021,
        "type": 0,
        "first_name": "Alice",
        "last_name": "Yen",
        "primary_email": "yen@alice.com",
        "emails": [
            "yen@alice.com"
        ]
    },
    "organization": null,
    "opportunity": null
}
```

`POST /reminders`

Creates a new reminder with the supplied parameters.

### Path Parameters

| Parameter       | Type    | Required | Description                                                                                                                                                              |
| --------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| owner_id        | integer | true     | A unique identifier that represents an internal person that is assigned to the reminder.                                                                                 |
| content         | string  | false    | The string containing the content of the new reminder.                                                                                                                   |
| type            | integer | true     | The type of reminder to be created.                                                                                                                                      |
| reset_type      | integer | false    | The reset type of reminder to be created. Required when `type == 1`.                                                                                                     |
| person_id       | integer | false    | A unique identifier that represents a Person that is tagged in the reminder to be created.                                                                               |
| organization_id | integer | false    | A unique identifier that represents an Organization that is tagged in the reminder to be created.                                                                        |
| opportunity_id  | integer | false    | A unique identifier that represents an Opportunity that is tagged in the reminder to be created.                                                                         |
| due_date        | string  | false    | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the due date of the reminder to be created. Required when `type == 0`. |
| reminder_days   | integer | false    | When a recurring reminder is completed or reset, the number of days before the reminder is due again. Required when `type == 1`.                                         |
| is_completed    | integer | false    | Indicator if the reminder has been completed.                                                                                                                            |

Note that at most one of `person_id`, `organization_id` or `opportunity_id` can be specified.

### Returns

The reminder created through this request.

<aside class="notice">
  <h6>Note</h6>
  <p>If you create a reminder through the API, the user corresponding to the API token will be the creator by default.</p>
</aside>

## Update a Reminder

> Example Request

```shell
curl -X PUT "https://api.affinity.co/reminders/15385" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"type": 1, "reset_type": 0, "reminder_days": 30}'
```

> Example Response

```json
{
    "id": 15385,
    "type": 1,
    "created_at": "2022-02-01T09:36:07.316-08:00",
    "completed_at": null,
    "content": "Create reminder from external API",
    "due_date": "2021-11-30T00:00:00.000-08:00",
    "reset_type": 0,
    "reminder_days": 70,
    "status": 2,
    "creator": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "owner": {
        "id": 443,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "john@affinity.co",
        "emails": [
            "john@affinity.co"
        ]
    },
    "completer": null,
    "person": {
        "id": 2021,
        "type": 0,
        "first_name": "Alice",
        "last_name": "Yen",
        "primary_email": "yen@alice.com",
        "emails": [
            "yen@alice.com"
        ]
    },
    "organization": null,
    "opportunity": null
}
```

`PUT /reminders/{reminder_id}`

Updates the content of an existing reminder with `reminder_id` with the supplied parameters.

### Path Parameters

| Parameter   | Type    | Required | Description                                             |
| ----------- | ------- | -------- | ------------------------------------------------------- |
| reminder_id | integer | true     | The unique id of the reminder to be updated.            |

### Payload Parameters

| Parameter     | Type    | Required | Description                                                                                                                                                              |
| ------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| owner_id      | integer | false    | A unique identifier that represents an internal person that is assigned to the reminder.                                                                                 |
| content       | string  | false    | The string containing the content of the new reminder.                                                                                                                   |
| type          | integer | false    | The type of reminder to be updated.                                                                                                                                      |
| reset_type    | integer | false    | The reset type of reminder to be updated. Required when `type == 1`.                                                                                                     |
| due_date      | string  | false    | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the due date of the reminder to be updated. Required when `type == 0`. |
| reminder_days | integer | false    | When a recurring reminder is completed or reset, the number of days before the reminder is due again. Required when `type == 1`.                                         |
| is_completed  | integer | false    | Indicator if the reminder has been completed.                                                                                                                            |

### Returns

The reminder object that was just updated through this request.

## Delete a Reminder

> Example Request

```shell
curl "https://api.affinity.co/reminders/22984" \
  -u :$APIKEY \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /reminders/{reminder_id}`

Deletes the reminder with the specified `reminder_id`.

### Path Parameters

| Parameter   | Type    | Required | Description                                             |
| ----------- | ------- | -------- | ------------------------------------------------------- |
| reminder_id | integer | true     | The unique id of the reminder to be deleted.            |

### Returns

`{success: true}`.
