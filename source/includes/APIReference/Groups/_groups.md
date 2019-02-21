# Groups

## The Group Object

 > **Example**

```json
{
  "id": 6,
  "active": true,
  "name": "Group 1",
  "last_modified": "2018-08-19T16:29:28+00:00",
  "created": "2018-08-19T16:29:28+00:00",
  "manager_ids": [
    "300",
    "316"
  ]
}
```

Following is a list of the properties that belong to a group object, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | ID of this group. |
| **active**<br/>read-write | _Boolean_ | true or false. If false, this group is considered archived. |
| **name**<br/>read-write | _String_ | Name associated with this group |
| **last_modified**<br/>read-only | _String_ | Date/time when this group was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **created**<br/>read-only | _String_ | Date/time when this group was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **manager_ids**<br/>read-write | _Array_ | List of id's for the users allowed to manage this group |

