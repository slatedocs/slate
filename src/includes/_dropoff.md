
# Drop-off

## Get drop-off locations for vehicles

Get a list of locations that where vehicles should be dropped off. The `capacity` tells you how many
vehicles can be placed at this position and `vehicleCount` tells you how many vehicles are already
in place.

```shell
curl "https://platform.tier-services.io/drop-off-location?zoneId=MALAGA
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
    "data": [
      {
        "type": "drop_off_location",
        "id": 269,
        "attributes": {
          "name": "En el centro",
          "lat": 36.7214791652503,
          "lng": -4.47999565124508,
          "address": "Av. Parménides, 1, 29010 Málaga, Spanien",
          "capacity": 1,
          "vehicleCount": 0
        }
      }
    ]
}
```

This endpoint retrieves all the vehicles, which have to be picked up for charging
in a 30km radius around a given latitude and longitude.

### HTTP Request

`GET https://platform.tier-services.io/shift?lat=52.521916&lng=13.410312`

### Query Parameters

Parameter  | Description
--------- | -----------
lat | Required: Latitude for specifying center of search radius
lng | Required: Longitude for specifying center of search radius
