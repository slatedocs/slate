## The Files Object

> **Example**: Files Object

```json
{
  "id": 47765,
  "uploaded_by_user_id": 317046,
  "file_name": "IMG_20181004_214839.png",
  "active": true,
  "size": 369302,
  "last_modified": "2018-10-05T03:57:49+00:00",
  "created": "2018-10-05T03:57:49+00:00",
  "linked_objects": {
    "timesheets": [
      "730045"
    ]
  },
  "meta_data": {
    "file_description": "",
    "image_rotation": "0"
  }
}
```

Following is a list of the properties that belong to a file object, and a description of each.

Name | Access | Type | Format | Description
---- | ------ | ---- | ------ | -----------
`id` | R/O | _Int_ | | Unique identifier of the file
`file_name` | R/W | _String_ | | Name of the file
`file_data` | W/O | _String_ | Base64-encoded | File contents
`uploaded_by_user_id` | R/O | _Int_ | | Id of the user who uploaded the file
`active` | R/O | _Boolean_ | | If false, this file is considered deleted.
`size` | R/O | _Int_ | | Size of the file in bytes
`created` | R/O | _DateTime_ | ISO8601 | Date/time when this customfield was created
`last_modified` | R/O | _DateTime_ | ISO8601 | Date/time when this customfield was last modified
`linked_objects` | R/O | _Object_ | Map: string -> string[] | This is a key / value map of all the objects linked to this file and the corresponding object ids.
`meta_data` | R/W | _Object_ | Map: string -> variant | This is a key / value map of any additional data associated with this file. List of allowed keys


