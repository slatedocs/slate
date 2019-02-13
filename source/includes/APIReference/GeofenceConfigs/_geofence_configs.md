# Geofence Configs

## The Geofence Config Object

> **Example**

```json
{
  "id": 151,
  "type": "location",
  "type_id": 282316,
  "active": true,
  "enabled": true,
  "radius": 150,
  "last_modified": "2017-09-07T19:09:26+00:00",
 "created": "2017-09-07T19:09:26+00:00"
}
```

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Unique identifier of the geofence config. |
| **type**<br/>read-write | _String_ | The type of entity the geofence config is related to.  Can be `location`. |
| **type_id**<br/>read-write | _Int_ | The id of the entity the geofence config is related to. |
| **active**<br/>read-write | _Boolean_ | If true, this geofence config is active. If false, this geofence config is archived. |
| **enabled**<br/>read-write | _Boolean_ | Indicates whether a geofence for the associated entity should be enabled. |
| **radius**<br/>read-write | _Int_ | Configures the size of the geofence. |
| **last_modified**<br/>read-only | _String_ | Date/time when this geofence config was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **created**<br/>read-only | _String_ | Date/time when this geofence config was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |

