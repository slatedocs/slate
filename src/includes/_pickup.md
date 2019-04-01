
# Pick-Up

## Pick-Up locations for all vehicles in a zone

```shell
curl "https://platform.tier-services.io/pick-up-location?zoneId=BERLIN"
  -H "x-api-key: TIER API KEY"
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

`GET https://platform.tier-services.io/pick-up-location?zoneId=BERLIN`

<aside class="notice">
This is an alias for the deprecated endpoint <code>/shift/current</code> which can be called with <code>lat</code> and
<code>lng</code> geocoordinates
</aside>

### Query Parameters

Parameter | Description
--------- | -----------
zoneId    | Required: The zone within which to look up vehicles that need to be picked up

alternatively the endpoint can be called using geocoordinates (deprecated)

Parameter | Description
--------- | -----------
lat       | Required: Latitude for specifying center of search radius
lng       | Required: Longitude for specifying center of search radius


## Mark a vehicle as Picked-Up

Using this endpoint, you mark a scooter as picked up. Marking a scooter as picked up
will unlock the scooter for 5 minutes so that the ranger can move the scooter easier
to their transportation vehicle.

<aside class="notice">
You must send the geo location of the ranger using the `lat` and `lng` parameters.
This makes sure that the ranger is not accidentally marking the wrong vehicle as picked up.
</aside>

```shell
curl "https://platform.tier-services.io/rental/start"
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

`GET https://platform.tier-services.io/pick-up-location?zoneId=BERLIN`

<aside class="notice">
This is an alias for the deprecated endpoint <code>/shift/current</code> which can be called with <code>lat</code> and
<code>lng</code> geocoordinates
</aside>

### Query Parameters

Parameter | Description
--------- | -----------
zoneId    | Required: The zone within which to look up vehicles that need to be picked up
