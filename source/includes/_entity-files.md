# Entity Files

Entity files are files uploaded to a relevant entity. Possible files, for example, would be a pitch deck for an opportunity or a physical mail correspondence for a person.

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
{"success": true}
```

`POST /entity-files`

Uploads files attached to the entity with the given id.

The file will display on the entity's profile, provided that the entity is not a person internal to the user's organization.

### Path Parameters

Parameter | Type | Required | Description
--------- | ------- | ---------- | -----------
file | File | false | A singular file to be uploaded, formatted as form data (multipart/form-data).
files | File[] | false | An array of files to be uploaded, formatted as form data (multipart/form-data).
person_id | integer | false | The unique identifier of the person object to attach the file(s) to.
organization_id | integer | false | The unique identifier of the organization object to attach the file(s) to.
opportunity_id | integer | false | The unique identifier of the opportunity object to attach the file(s) to.

**Note:**

1. Files must be attached to a single entity, specified using one of the three entity id parameters (`person_id`, `organization_id`, and `opportunity_id`).
2. At least one file must be uploaded using the `file` or `files` parameters.

### Returns
`{"success": true}`
