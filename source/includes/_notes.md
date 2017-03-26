# Notes
Just like entity values, notes are used to keep track of state on an entity. It could be
notes from due diligence, or notes from a meeting or a call. Or it could just be activity being
logged from a prospect's visit to your website.

## The note resource
A note object contains `content`, which is a string containing the note body. Apart from that,
a note can be associated with multiple people or organizations. Each person or organization will display
a linked note on their profiles.

> Example Response

```json
```


Attribute | Type | Description
--------- | ------- | -----------
id | integer | The unique identifier of the note object.
person_ids | integer[] | An array of unique identifiers of person objects that are associated with the note.
organization_ids | integer[] | An array of unique identifiers of organization objects that are associated with the note.
content | string | The string containing the content of the note.
creator_id | integer | The unique identifier of the person object who created the note.

## Create a new note
`POST /notes`

Creates a new note with the supplied parameters.

> Example Request

```shell
curl "https://api.affinity.vc/lists/450/list-entries?key=<API-KEY>"
```
> Example Response

```json
```

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
person_ids | integer[] | false | An array of unique identifiers of person objects that are associated with the new note.
organization_ids | integer[] | false | An array of unique identifiers of organization objects that are associated with the new note.
content | string | true | The string containing the content of the new note.

### Returns
The note object created through this request.
