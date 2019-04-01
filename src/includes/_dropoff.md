
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


### HTTP Request

`GET https://platform.tier-services.io/drop-off-location?zoneId=MALAGA`

<aside class="notice">
This is the equivalent of the previously available `/shift` endpoint that would take
`lat` and `lng` parameters to get drop off locations.
</aside>

### Query Parameters

Parameter | Description
--------- | -----------
zoneId    | Required: The zone within which to look up vehicles that need to be picked up
