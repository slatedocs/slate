# Groups

## The Group Object

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Unique identifier of the group |
| **active**<br/>read-write | _Boolean_ | If false, this group is considered archived |
| **name**<br/>read-write | _String_ | Name associated with this group |
| **last_modified**<br/>read-only | _String_ | Date/time when this group was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **created**<br/>read-only | _String_ | Date/time when this group was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **manager_ids**<br/>read-write | _String[]_ | List of id's for the users allowed to manage the group |

