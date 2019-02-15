# Files

## The Files Object

> **Example**

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
    "file_description": "on-site selfie",
    "image_rotation": "0"
  }
}
```

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Unique identifier of the file |
| **file_name**<br/>read-write | _String_ | Name of the file |
| **file_data**<br/>write-only | _String_ | File contents (Base64-encoded) |
| **uploaded_by_user_id**<br/>read-only | _Int_ | Id of the user who uploaded the file |
| **active**<br/>read-only | _Boolean_ | If false, this file is considered deleted. |
| **size**<br/>read-only | _Int_ | Size of the file in bytes |
| **created**<br/>read-only | _String_ | Date/time when this customfield was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). |
| **last_modified**<br/>read-only | _String_ | Date/time when this customfield was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). |
| **linked_objects**<br/>read-only | _Object_ | This is a key/value map of all the objects linked to this file and the corresponding object ids. |
| **meta_data**<br/>read-write | _Object_ | This is a key/value map of any additional data associated with this file. List of allowed keys |


