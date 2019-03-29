
# Drop-off

## Get drop-off locations for vehicles

```shell
curl "https://platform.tier-services.io/drop-off-location?zoneId=MALAGA
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
    "meta":
    {
        "rowCount": 1,
        "pageCount": 1
    },
    "data": [
        {
            "id": 269,
            "name": "En el centro",
            "lat": 36.7214791652503,
            "lng": -4.47999565124508,
            "address": "Av. Parménides, 1, 29010 Málaga, Spanien",
            "notice": "Amigo del scooter",
            "capacity": 1,
            "isActive": true,
            "created": "2019-01-16T17:11:53Z",
            "updated": "2019-01-16T17:11:53Z",
            "vehicleCount": 0
        },
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
