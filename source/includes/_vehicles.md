
# Vehicles

## Get All Vehicles

```shell
curl "https://api.tier.app/vehicle"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "meta": {
    "rowCount": 1,
    "pageCount": 1
  },
  "data": [
    {
      "id": "5abfe41d-1e41-41bc-ae02-eb5f7240b30d",
      "state": "ACTIVE",
      "city": "VIENNA",
      "lastLocationUpdate": "2019-02-09T21:14:27Z",
      "lastStateChange": "2019-02-09T21:01:29Z",
      "batteryLevel": 64,
      "licencePlate": "11456",
      "vehicleNumber": "N2LSF1837C1370",
      "lat": 48.19821,
      "lng": 16.381173,
      "isUnlocked": false,
      "maxSpeed": 18,
      "zoneId": "BERLIN"
    }
  ]
}
```

This endpoint retrieves all the vehicles.

### HTTP Request

`GET https://api.tier.app/vehicle`

### Query Parameters

Parameter  | Description
--------- | -----------
lat | Latitude to search for vehicles within a given radius
lng | Longitude to search for vehicles within a given radius
radius | Radius in meter
