
# Drop-off

## Get drop-off locations for vehicles

Get a list of locations that where vehicles should be dropped off. The `capacity` tells you how many
vehicles can be placed at this position and `vehicleCount` tells you how many vehicles are already
in place.

```shell
curl "https://platform.tier-services.io/v1/drop-off-location?zoneId=MALAGA"
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

`GET https://platform.tier-services.io/v1/drop-off-location?zoneId=MALAGA`

<aside class="notice">
This is the equivalent of the previously available <code>/shift</code> endpoint that would take
<code>lat</code> and <code>lng</code> parameters to get drop off locations.
</aside>

### Query Parameters

Parameter | Description
--------- | -----------
zoneId    | Required: The zone within which to look up vehicles that need to be picked up



## Mark a vehicle as Dropped-Off

Using this endpoint, you mark a scooter as dropped off.

<aside class="notice">
You must send the geo location of the ranger using the `lat` and `lng` parameters.
This makes sure that the ranger is not accidentally marking the wrong vehicle as dropped off.
</aside>

```shell
curl "https://platform.tier-services.io/v1/vehicle/<vehicle-uuid>/drop-off"
  -X POST
  -H "x-api-key: TIER API KEY"
  -d '{
        lat: 52,
        lng: 13.2,
      }'
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "type": "pick_up_location",
      "id": "67706356-dfb9-42de-91b3-7596e965f53e",
      "attributes": {
        "zoneId": "MALAGA",
        "resolution": "CLAIMED",
        "resolvedBy": "KFdtTVSAD7gH3tPsWLHywur01yD3",
        "resolvedAt": "2019-04-01T08:55:22.876Z",
        "lat": 36.723758,
        "lng": -4.419298
      },
      "relationships": {
        "vehicle": {
          "type": "vehicle",
          "id": "08118943-8fe3-4b9a-8c1f-eb59de648b59"
        }
      }
    }
  ],
  "included": [
    {
      "type": "vehicle",
      "id": "08118943-8fe3-4b9a-8c1f-eb59de648b59",
      "attributes": {
        "lat": 36.723758,
        "lng": -4.419298,
        "code": 14234,
        "zoneId": "MALAGA",
        "state": "PICKED_UP"
      }
    }
  ]
}
```


### HTTP Request

`POST https://platform.tier-services.io/v1/vehicle/<vehicle-uuid>/pick-up`


### Request Body

Parameter | Description
--------- | -----------
lat       | Required: The location of the ranger picking up the scooter
lng       | Required: The location of the ranger picking up the scooter
