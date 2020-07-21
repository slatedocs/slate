# Entity Files

Entity files are files uploaded to a relevant entity. Possible files, for example, would be a pitch deck for an opportunity or a physical mail correspondence for a person.

## The entity file resource

> Example Response

```json
{
  "id": 43212,
  "name": "JohnDoeFriends.csv",
  "size": 993,
  "person_id": 10,
  "organization_id": null,
  "opportunity_id": null,
  "created_at": "2011-01-25T09:59:35.288-08:00",
  "uploader_id": 10
}
```

| Attribute      | Type     | Description                                                                 |
| -------------- | -------- | --------------------------------------------------------------------------- |
| id             | integer  | The unique identifier of the entity file object.                            |
| name           | string   | The name of the file.                                                       |
| size           | string   | The size of the file in bytes.                                              |
| person_id       | integer  | The unique identifier of the person corresponding to the entity file.       |
| organization_id | integer  | The unique identifier of the organization corresponding to the entity file. |
| opportunity_id  | integer  | The unique identifier of the opportunity corresponding to the entity file.  |
| uploader_id     | integer  | The unique identifier of the user who created the entity file.              |
| created_at     | datetime | The time when the entity file was created.                                  |

## Get all files

> Example Request

```shell
curl "https://api.affinity.co/entity-files" -u :<API-KEY>
```

> Example Response

```json
{
    "entity_files": [
        {
            "id": 43212,
            "name": "JohnDoeFriends.csv",
            "size": 993,
            "person_id": 142,
            "organization_id": null,
            "opportunity_id": null,
            "created_at": "2011-01-25T09:59:35.288-08:00",
            "uploader_id": 10
        },
        {
            "id": 131,
            "name": "Import.csv",
            "size": 227224,
            "person_id": 38654,
            "organization_id": null,
            "opportunity_id": null,
            "created_at": "2019-01-13T12:52:51.539-08:00",
            "uploader_id": 101
        },
        ...
    ],
    "next_page_token": "eyJwYXJhbXMiOnt9LCJwYWdlX3NpemUiOjUwMCwib2Zmc2V0Ijo1MDB9",
}
```

> Example pagination

```shell
# To get the second page of results, issue the following query:
curl "https://api.affinity.co/entity-files?page_token=eyJwYXJhbXMiOnsidGVybSI6IiJ9LCJwYWdlX3NpemUiOjUsIm9mZnNldCI6MTB9" -u :<API-KEY>
```

`GET /entity-files`

Returns all entity files within your organization. This result will be
an object with two fields: `entity_files` and `next_page_token`. `entity_files` maps to an
array of all the entity file resources. The value of `next_page_token` should be sent as the
query parameter `page_token` in another request to retrieve the next page of results. While
paginating through results, each request must have identical query parameters other than the
changing `page_token`. Otherwise, an `Invalid page_token variable` error will be returned.

The absence of a `next_page_token` indicates that all the records have been fetched,
though its presence does not necessarily indicate that there are _more_ resources to be
fetched. The next page may be empty (but then `next_page_token` would be `null` to
confirm that there are no more resources).

Can optionally be filtered to return only entity files associated with a specific `person`,
`organization`, or `opportunity`.

### Query Parameters

| Parameter       | Type    | Required | Description                                                                                     |
| --------------- | ------- | -------- | ----------------------------------------------------------------------------------------------- |
| page_size       | number  | false    | How many results to return per page. (Default is the maximum value of 500.)                     |
| page_token      | string  | false    | The `next_page_token` from the previous response required to retrieve the next page of results. |
| person_id       | integer | false    | A unique id that represents a Person whose associated files should be retrieved.                |
| organization_id | integer | false    | A unique id that represents an Organization whose associated files should be retrieved.         |
| opportunity_id  | integer | false    | A unique id that represents an Opportunity whose associated files should be retrieved.          |

### Returns

An object with two fields: `entity_files` and `next_page_token`. `entity_files` maps to an
array of all the entity file resources. See description for more details on pagination.

## Get a specific file

> Example Request

```shell
curl "https://api.affinity.co/entity-files/43212" -u :<API-KEY>
```

> Example Response

```json
{
  "id": 43212,
  "name": "GoogleFriends.csv",
  "size": 993,
  "person_id": null,
  "organization_id": 10,
  "opportunity_id": null,
  "created_at": "2011-01-25T09:59:35.288-08:00",
  "uploader_id": 10
}
```

`GET /entity-files/{entity_file_id}`

Fetches an entity with a specified `entity_file_id`.

### Path Parameters

| Parameter      | Type    | Required | Description                                                  |
| -------------- | ------- | -------- | ------------------------------------------------------------ |
| entity_file_id | integer | true     | The unique id of the entity file that needs to be retrieved. |

### Returns

The entity file resource corresponding to the `entity_file_id`.

## Download File

> Example Request

```shell
curl "https://api.affinity.co/entity-files/download/12345" \
  -u :<API-KEY> \
  --location place_to_store_file.png
```

`GET /entity-files/download/{entity_file_id}`

Downloads an entity file with a specified `entity_file_id`

### Path Parameters

| Parameter      | Type    | Required | Description                                                   |
| -------------- | ------- | -------- | ------------------------------------------------------------- |
| entity_file_id | integer | true     | The unique id of the entity file that needs to be downloaded. |

### Returns

The actual entity file corresponding to the `entity_file_id`.

## Upload files

> Example Request

```shell
curl "https://api.affinity.co/entity-files" \
  -u :<API-KEY> \
  -F files[]=@Pitch.pdf \
  -F files[]=@10_01_18_meeting.txt \
  -F person_id=4113456
```

> Example Response

```json
{ "success": true }
```

`POST /entity-files`

Uploads files attached to the entity with the given id.

The file will display on the entity's profile, provided that the entity is not a person internal to the user's organization.

### Path Parameters

| Parameter       | Type    | Required | Description                                                                     |
| --------------- | ------- | -------- | ------------------------------------------------------------------------------- |
| file            | File    | false    | A singular file to be uploaded, formatted as form data (multipart/form-data).   |
| files           | File[]  | false    | An array of files to be uploaded, formatted as form data (multipart/form-data). |
| person_id       | integer | false    | The unique identifier of the person object to attach the file(s) to.            |
| organization_id | integer | false    | The unique identifier of the organization object to attach the file(s) to.      |
| opportunity_id  | integer | false    | The unique identifier of the opportunity object to attach the file(s) to.       |

**Note:**

1.  Files must be attached to a single entity, specified using one of the three entity id parameters (`person_id`, `organization_id`, and `opportunity_id`).
2.  At least one file must be uploaded using the `file` or `files` parameters.

### Returns

`{"success": true}`
