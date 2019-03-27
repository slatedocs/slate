
# Itineraries

## Get Itineraries of current shift in a 30km radius around a point

```shell
curl "https://platform.tier-services.io/shift?lat=52.521916&lng=13.410312"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "0ad1397b-1c4d-4eca-a363-6f58e87785d3",
       "vehicleCode": 10008,
       "state": "TO_PICKUP",
       "lat": 52.539705,
       "lng": 13.400786,
       "resolution": "CLAIMED"
    },
    {
        "id": "2e522240-406e-4211-a146-5b252cd05040",
        "vehicleCode": 10015,
        "state": "LOW_BATTERY",
        "lat": 52.526688,
        "lng": 13.394346
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
