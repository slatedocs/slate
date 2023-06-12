# Notes

Just like field values, notes are used to keep track of state on an entity. They could be
notes manually taken from due diligence, a meeting, or a call. Or, notes could be used to
store logged activity from a prospect's visit to your website.

## The Note Resource

> Example Response

```json
{
  "id": 22984,
  "creator_id": 860197,
  "person_ids": [38706, 89734],
  "is_meeting": false,
  "mentioned_person_ids": [49817, 78624],
  "organization_ids": [64779194],
  "opportunity_ids": [117],
  "parent_id": null,
  "content": "Had a lunch meeting with Jane and John today. They are looking to invest.",
  "type": 0,
  "created_at": "2017-03-28 00:38:41 -0700",
  "updated_at": "2017-04-03 00:38:41 -0700"
}
```

A note object contains `content`, which is a string containing the note body. In
addition, a note can be associated with multiple people, organizations, or opportunities.
Each person, organization, or opportunity will display linked notes on their profiles.

| Attribute        | Type      | Description                                                                                                                                                                                                                                                                                                                               |
| ---------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id               | integer   | The unique identifier of the note object.                                                                                                                                                                                                                                                                                                 |
| creator_id       | integer   | The unique identifier of the person object who created the note.                                                                                                                                                                                                                                                                          |
| person_ids       | integer[] | An array of unique identifiers of person objects that are associated with the note.                                                                                                                                                                                                                                                       |
| organization_ids | integer[] | An array of unique identifiers of organization objects that are associated with the note.                                                                                                                                                                                                                                                 |
| opportunity_ids  | integer[] | An array of unique identifiers of opportunity objects that are associated with the note.                                                                                                                                                                                                                                                  |
| parent_id        | integer   | The unique identifier of the note that this note is a reply to. If this field is `null`, the note is not a reply. Note replies will never have values for `opportunity_ids`, `person_ids`, and `organization_ids`. Only the parent note is associated with an entity. You can fetch the parent note resource to identify the root entity. |
| content          | string    | The string containing the content of the note.                                                                                                                                                                                                                                                                                            |
| type             | integer   | The type of the note. The supported types are 0 and 2, which represent plain text and HTML notes, respectively.                                                                                                                                                                                                                           |
| created_at       | datetime  | The string representing the time when the note was created.                                                                                                                                                                                                                                                                               |
| updated_at       | datetime  | The string representing the last time the note was updated.                                                                                                                                                                                                                                                                               |

### Formatting `content` as HTML

> Example `content` payload

```html
<p>
  This is normal text. <strong> But this is bold! </strong>
  <span style="color: rgb(255, 0, 0);"> And this is red! </span>
</p>
```

If you would like to format your notes, create them with `type` equal to `2`, as described in [Create a New Note](#create-a-new-note). All currently supported formatting options are described below.

| Style            | Formatting                      | Example                                                                                |
| ---------------- | ------------------------------- | -------------------------------------------------------------------------------------- |
| Paragraph        | `<p>` element                   | `<p>I am a paragraph!</p>`                                                             |
| Bold             | `<strong>` element              | `<p><strong>This text is bold</strong></p>`                                            |
| Italics          | `<em>` element                  | `<p><em>This text is italicized</em></p>`                                              |
| Underlined       | `<u>` element                   | `<p><u>This text is underlined</u></p>`                                                |
| Ordered lists    | `<ol>` + `<li>` elements        | `<ol><li>First item</li><li>Second item</li></ol>`                                     |
| Unordered lists  | `<ul>` + `<li>` elements        | `<ul><li>An item</li><li>Another item</li></ul>`                                       |
| Background color | `background-color` inline style | `<p><span style="background-color: rgb(255, 0, 0);"> The background is red</span></p>` |
| Font color       | `color` inline style            | `<p><span style="color: rgb(255, 0, 0);"> The text color is red</span></p>`            |

## Get All Notes

> Example Request

```shell
curl "https://api.affinity.co/notes" -u :$APIKEY
```

> Example Response

```json
[
  {
    "id": 22984,
    "creator_id": 860197,
    "person_ids": [38706,89734],
    "is_meeting": false,
    "mentioned_person_ids": [49817, 78624],
    "organization_ids": [64779194],
    "opportunity_ids": [117],
    "parent_id":  null,
    "content": "Had a lunch meeting with Jane ... ",
    "type": 0,
    "created_at": "2017-03-28 00:38:41 -0700",
    "updated_at": "2017-04-03 00:38:41 -0700"
  },
  {
    "id": 22983,
    "creator_id": 860196,
    "person_ids": [],
    "is_meeting": false,
    "mentioned_person_ids": [7237],
    "organization_ids": [64779194],
    "opportunity_ids": [115],
    "parent_id":  null,
    "content": "Had a **lunch meeting** @ Google ... ",
    "type": 2,
    "created_at": "2018-03-28 00:38:41 -0700",
    "updated_at": null
  },
  ...
]
```

`GET /notes`

Returns all notes attached to a `person`, `organization`, `opportunity`.

### Query Parameters

| Parameter       | Type    | Required | Description                                                                                     |
| --------------- | ------- | -------- | ----------------------------------------------------------------------------------------------- |
| person_id       | integer | false    | A unique identifier that represents a Person that was tagged in the retrieved notes.            |
| organization_id | integer | false    | A unique identifier that represents an Organization that was tagged in the retrieved notes.     |
| opportunity_id  | integer | false    | A unique identifier that represents an Opportunity that was tagged in the retrieved notes.      |
| creator_id      | integer | false    | A unique identifier that represents an Affinity user whose created notes should be retrieved.   |
| page_size       | number  | false    | How many results to return per page. (Default is the maximum value of 500.)                     |
| page_token      | string  | false    | The `next_page_token` from the previous response required to retrieve the next page of results. |

### Returns

An array of all the note resources available to you.

## Get a Specific Note

> Example Request

```shell
# Returns the note with the specified `note_id`
curl "https://api.affinity.co/notes/22984" -u :$APIKEY
```

> Example Response

```json
{
  "id": 22984,
  "creator_id": 860197,
  "person_ids": [38706,89734],
  "is_meeting": false,
  "mentioned_person_ids": [49817, 78624],
  "organization_ids": [64779194],
  "opportunity_ids": [117],
  "parent_id":  null,
  "content": "Had a lunch meeting with Jane ... ",
  "type": 0,
  "created_at": "2017-03-28 00:38:41 -0700",
  "updated_at": "2017-04-03 00:38:41 -0700",
},
```

`GET /notes/{note_id}`

Gets the details for a specific note given the existing note id.

### Path Parameters

| Parameter | Type    | Required | Description                                               |
| --------- | ------- | -------- | --------------------------------------------------------- |
| note_id   | integer | true     | The unique identifier of the note object to be retrieved. |

### Returns

The details of the note resource corresponding to the note ID specified in the path
parameter. An appropriate error is returned if an invalid note is supplied.

## Create a New Note

> Example Request (JSON)

```shell
curl -X POST "https://api.affinity.co/notes" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"person_ids": [38706, 624289], "organization_ids": [120611418], "opportunity_ids": [167], "content": "Had a lunch meeting with Jane and John today. They want to invest in Acme Corp."}'
```

> Example Request (Form)

```shell
curl -X POST "https://api.affinity.co/notes" \
  -u :$APIKEY \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "person_ids[]=38706&person_ids[]=624289&organization_ids[]=120611418&opportunity_ids[]=167&content=Had a lunch meeting with Jane and John today. They want to invest in Acme Corp."
```

> Example Response

```json
{
  "id": 22985,
  "creator_id": 860197,
  "person_ids": [38706, 89734],
  "is_meeting": false,
  "mentioned_person_ids": null,
  "organization_ids": [64779194],
  "opportunity_ids": [117],
  "parent_id": null,
  "content": "Had a lunch meeting with Jane ... ",
  "type": 0,
  "created_at": "2017-03-28 00:38:41 -0700",
  "updated_at": null
}
```

> Example Request Creating An HTML-Type Note (JSON)

```shell
curl -X POST "https://api.affinity.co/notes" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"person_ids": [38706, 624289], "organization_ids": [120611418], "opportunity_ids": [167], "type": 2, "content": "Had a <strong>lunch meeting<strong> with Jane and John today. They want to invest in Acme Corp."}'
```

> Example Request Creating An HTML-Type Note (Form)

```shell
curl -X POST "https://api.affinity.co/notes" \
  -u :$APIKEY \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "person_ids[]=38706&person_ids[]=624289&organization_ids[]=120611418&opportunity_ids[]=167&type=2&content=Had a <strong>lunch meeting<strong> with Jane and John today. They want to invest in Acme Corp."
```

> Example Response

```json
{
  "id": 22986,
  "creator_id": 860197,
  "person_ids": [38706, 89734],
  "is_meeting": false,
  "mentioned_person_ids": null,
  "organization_ids": [64779194],
  "opportunity_ids": [117],
  "parent_id": null,
  "content": "Had a **lunch meeting** with Jane ... ",
  "type": 2,
  "created_at": "2017-03-28 00:38:41 -0700",
  "updated_at": null
}
```

> Example Request with parent_id

```shell
curl -X POST "https://api.affinity.co/notes" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"person_ids": [38706], "organization_ids": [120611418], "parent_id": 22984, "content": "This is a <strong> reply </strong>to the previous note.", "type":2}'
```

> Example Response

```json
{
  "id": 22987,
  "creator_id": 860197,
  "person_ids": [],
  "is_meeting": false,
  "mentioned_person_ids": null,
  "organization_ids": [],
  "opportunity_ids": [],
  "parent_id": 22984,
  "content": "This is a reply to the previous note. Because a parent_id was supplied, the supplied person_ids, organization_ids, and opportunity_ids were ignored.",
  "type": 2,
  "created_at": "2017-03-29 00:38:41 -0700",
  "updated_at": null
}
```

`POST /notes`

Creates a new note with the supplied parameters.

Set the `type` parameter to 2 to create an HTML note. See [here](https://support.affinity.co/hc/en-us/articles/360016292631-Rich-text-formatting-for-notes-within-Affinity) for more information on the sorts of rich text formatting we support in notes. Please note that `<a>` tags aren't currently clickable inside the Affinity web app &mdash; though full links are.

It is possible to create a <strong>reply</strong> to an existing note by setting `parent_id`. The parent note should not have a `parent_id` itself. It is possible for a single parent note to have multiple reply notes &mdash; They just get displayed in order of creation. `opportunity_ids`, `person_ids`, and `organization_ids` will be ignored when a `parent_id` is provided.

### Path Parameters

| Parameter        | Type      | Required | Description                                                                                                                                                                                                                           |
| ---------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| content          | string    | true     | The string containing the content of the new note. See [formatting options](#formatting-content-as-html) for HTML support.                                                                                                            |
| person_ids       | integer[] | false    | An array of unique identifiers of person objects that are associated with the new note.                                                                                                                                               |
| organization_ids | integer[] | false    | An array of unique identifiers of organization objects that are associated with the new note.                                                                                                                                         |
| opportunity_ids  | integer[] | false    | An array of unique identifiers of opportunity objects that are associated with the new note.                                                                                                                                          |
| type             | integer   | false    | The type of the new note. Defaults to 0. The types 0 and 2 represent plain text and HTML notes, respectively. If submitting as HTML, see the [formatting options](#formatting-content-as-html).                                       |
| parent_id        | integer   | false    | The unique identifier of the note to which the newly created note should reply. See comments above.                                                                                                                                   |
| creator_id       | integer   | false    | The ID of a Person resource who should be recorded as the author of the note. Must be a person who can access Affinity. If not provided the creator defaults to the owner of the API key.                                             |
| created_at       | datetime  | false    | A string (formatted according to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) representing the creation time to be recorded for the note. If not provided, defaults to the current time. Does not support times in the future. |

### Returns

The note resource created through this request.

<aside class="notice">
  <h6>Note</h6>
  <p>When creating a note using the API, the user corresponding to the API token will be the creator by default.</p>
</aside>

<aside class="notice">
  <h6>Note</h6>
  <p>To ensure that <code>content</code> gets encoded properly, it is recommended to submit as either <code>application/json</code> or <code>application/x-www-form-urlencoded</code> instead of query parameters.</p>
</aside>

## Update a Note

> Example Request

```shell
curl -X PUT "https://api.affinity.co/notes/22984" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"content": "Had another meeting with Jane and John today"}'
```

> Example Response

```json
{
  "id": 22984,
  "creator_id": 860197,
  "person_ids": [38706, 89734],
  "is_meeting": false,
  "mentioned_person_ids": [49817, 78624],
  "organization_ids": [64779194],
  "opportunity_ids": [117],
  "parent_id": null,
  "content": "Had another meeting with Jane ... ",
  "type": 0,
  "created_at": "2017-03-28 00:38:41 -0700",
  "updated_at": "2017-04-03 00:38:41 -0700"
}
```

`PUT /notes/{notes_id}`

Updates the content of an existing note with `note_id` with the supplied `content` parameter.

### Path Parameters

| Parameter | Type    | Required | Description                                         |
| --------- | ------- | -------- | --------------------------------------------------- |
| note_id   | integer | true     | The unique ID of the note that needs to be updated. |

### Payload Parameters

| Parameter | Type   | Required | Description                  |
| --------- | ------ | -------- | ---------------------------- |
| content   | string | true     | The new content of the note. |

### Returns

The note object that was just updated through this request.

<aside class="notice">
  <h6>Note</h6>
  <p>You cannot update the content of a note that has mentions. You also cannot update the content of a note associated with an email.<br/>You cannot update the type of a note.</p>  
</aside>

## Delete a Note

> Example Request

```shell
curl "https://api.affinity.co/notes/22984" \
  -u :$APIKEY \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /notes/{note_id}`

Deletes a note with a specified `note_id`.

### Path Parameters

| Parameter | Type    | Required | Description                                         |
| --------- | ------- | -------- | --------------------------------------------------- |
| note_id   | integer | true     | The unique ID of the note that needs to be deleted. |

### Returns

`{success: true}`.

<aside class="notice">
  <h6>Note</h6>
  <p>An appropriate error will be returned if you are not the creator of the note you are trying to delete.</p>
</aside>
