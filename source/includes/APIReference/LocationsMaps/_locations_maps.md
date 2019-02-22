# Locations Maps

## The Locations Map Object

 > **Example**

```json
{
  "id": 102839,
  "x_table": "job_codes",
  "x_id": 2597003,
  "location_id": 237053,
  "created": "2018-06-20T14:14:26+00:00",
  "last_modified": "2018-08-01T10:31:16+00:00"
}
```

Following is a list of the properties that belong to a locations map object, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of locations map. |
| **x_table**<br/>read-write | _String_ | The name of the entity the location is mapped to. |
| **x_id**<br/>read-write | _Int_ | The id of the entity the location is mapped to. |
| **location_id**<br/>read-write | _Int_ | The id of the location that is mapped to the entity. |
| **last_modified**<br/>read-only | _String_ | Date/time when this locations map was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **created**<br/>read-only | _String_ | Date/time when this locations map was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |

