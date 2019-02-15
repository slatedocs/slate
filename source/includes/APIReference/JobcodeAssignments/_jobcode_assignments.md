# Jobcode Assignments

## The Jobcode Assignments Object

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Unique identifier of the jobcode assignment |
| **user_id**<br/>read-write | _Int_ | Id of the user to whom the jobcode assignment pertains |
| **jobcode_id**<br/>read-write | _Int_ | Id of the jobcode to which the jobcode assignment pertains |
| **active**<br/>read-write | _Boolean_ | Specifier for whether the jobcode assignment is in-force or archived |
| **last_modified**<br/>read-only | _String_ | Date/time when this jobcode assignment was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **created**<br/>read-only | _String_ | Date/time when this jobcode assignment was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |

