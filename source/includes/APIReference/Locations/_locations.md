# Locations

## The Location Object

 > **Example**

```json
{
  "id": 65305,
  "addr1": "235 E Colchester Dr",
  "addr2": "101",
  "city": "Eagle",
  "state": "ID",
  "zip": "83616",
  "country": "US",
  "formatted_address": "235 E Colchester Dr 101, Eagle, ID 83616",
  "active": true,
  "latitude": 43.6700273,
  "longitude": -116.3520972,
  "place_id": "",
  "place_id_hash": "0ba5eaf96c5f63c3b76d5084c365b6e4",
  "label": "TSheets, East Colchester Drive, Eagle, ID, USA",
  "notes": "",
  "geocoding_status": "complete",
  "created": "2018-03-09T18:26:57+00:00",
  "last_modified": "2018-03-15T16:51:14+00:00",
  "linked_objects": {
    "jobcodes": [
      2589531
    ]
  },
  "geofence_config_id": null
}
```

Following is a list of the properties that belong to a location object, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of location. |
| **addr1**<br/>read-write | _String_ | The first line of the location's address |
| **addr2**<br/>read-write | _String_ | The second line of the location's address |
| **city**<br/>read-write | _String_ | The city of the location's address. |
| **state**<br/>read-write | _String_ | The state of the location's address |
| **zip**<br/>read-write | _String_ | The postal code of the location's address |
| **country**<br/>read-write | _String_ | The country of the location's address |
| **formatted_address**<br/>read-only | _String_ | Formatted address built from the objects addr1, addr2, city, state, and zip. If the location doesn't contain addr1, addr2, or city properties, the value will default what is set in the `label` property. |
| **active**<br/>read-write | _Boolean_ | If true, this location is active. If false, this location is archived. |
| **latitude**<br/>read-write | _Float_ | The latitude of the location (in signed degrees format). |
| **longitude**<br/>read-write | _Float_ | The longitude of the location (in signed degrees format). |
| **place_id_hash**<br/>read-only | _String_ | The MD5 hash of the unique id for the location returned from the geocoding service. |
| **label**<br/>read-only | _String_ | The formated name for the location. If the location was found using the geocode service the formated address will be saved in this field, otherwise it will be what the user has named the location. |
| **notes**<br/>read-write | _String_ | Notes related to the location. |
| **geocoding_status**<br/>read-only | _String_ | The geocoding status of this address. Will be one of: 'none', 'in_progress', 'retry', 'error', or 'complete'. |
| **last_modified**<br/>read-only | _String_ | Date/time when this location was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **created**<br/>read-only | _String_ | Date/time when this location was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **linked_objects**<br/>read-only | _Object_ | A key/value map of all the objects linked to this location and the corresponding object ids. |
| **geofence_config_id**<br/>read-only | _Int_ | Id of the [`geofence_config`](#the-geofence-config-object) associated with this location. |

