# Geolocations

## The Geolocation Object

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Unique identifier of the geolocation |
| **user_id**<br/>read-write | _Int_ | Unique identifier of the user to which this geolocation belongs |
| **accuracy**<br/>read-write | _Int_ | The radius of accuracy around the geolocation (in meters) |
| **altitude**<br/>read-write | _Float_ | The altitude of the geolocation (in meters) |
| **latitude**<br/>read-write | _Float_ | The latitude of the geolocation (in degrees) |
| **longitude**<br/>read-write | _Float_ | The longitude of the geolocation (in degrees) |
| **speed**<br/>read-write | _Float_ | The speed of travel at time of geolocation recording (in meters per second) |
| **heading**<br/>read-write | _Int_ | The heading of the geolocation (in degrees) |
| **source**<br/>read-write | _String_ | The source by which the geolocation was obtained.  Can be `gps`, `wifi`, or `cell` |
| **device_identifier**<br/>read-write | _String_ | Unique identifier for the device associated with this geolocation |
| **created**<br/>read-only | _String_ | Date/time when this geolocation was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`) |



