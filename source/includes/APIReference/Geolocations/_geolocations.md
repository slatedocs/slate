# Geolocations

## The Geolocation Object

> **Example**

```json
{
  "id": 185648268,
  "user_id": 29474,
  "accuracy": 21,
  "altitude": 0,
  "latitude": 43.6866258,
  "longitude": -116.3516646,
  "device_identifier": "",
  "source": "gps",
  "heading": 0,
  "speed": 0,  
  "created": "2018-08-16T17:56:57+00:00"
}
```

Following is a list of the properties that belong to a geolocation, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of geolocation. |
| **user_id**<br/>read-write | _Int_ | User id for the user that this geolocation belongs to. |
| **accuracy**<br/>read-write | _Int_ | Indicates the radius of accuracy around the geolocation in meters. |
| **altitude**<br/>read-write | _Float_ | Indicates the altitude of the geolocation in meters. |
| **latitude**<br/>read-write | _Float_ | Indicates the latitude of the geolocation in degrees. |
| **longitude**<br/>read-write | _Float_ | Indicates the longitude of the geolocation in degrees. |
| **speed**<br/>read-write | _Float_ | Indicates the speed of travel (meters per second) when the geolocation was recorded. |
| **heading**<br/>read-write | _Int_ | Indicates the heading of the geolocation in degrees. |
| **source**<br/>read-write | _String_ | Indicates how the GPS point was obtained. One of 'gps', 'wifi', or 'cell'. |
| **device_identifier**<br/>read-write | _String_ | Unique identifier (for the given client) for the device associated with this geolocation. |
| **created**<br/>read-only | _String_ | Date/time when this geolocation was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |

