
# Vehicles

There are two basic use-cases for fetching vehicles:

  1. Fetching vehicles that can be rented during operating hours
  2. Fetching vehicles that should be picked up for charging them

The following endpoints describe the former use case, to see vehicles during operating hours, if you're looking for the endpoints for 
pick-up and drop-off, please see [Pick-Up](#pick-up) and [Drop-Off](#drop-off) 

## Get All Vehicles Within Range (in meters)

```shell
curl "https://platform.tier-services.io/vehicle?lat=48.1&lng=16.3&radius=5000"
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
      "lastLocationUpdate": "2019-02-09T21:14:27Z",
      "lastStateChange": "2019-02-09T21:01:29Z",
      "batteryLevel": 64,
      "licencePlate": "11456",
      "lat": 48.19821,
      "lng": 16.381173,
      "maxSpeed": 18,
      "zoneId": "BERLIN",
      "code": "11942"
    }
  ]
}
```

This endpoint retrieves all the vehicles, which are currently available for rent or are 
currently in an active rent if `isUnlocked` is `true`. The `code` is also provided 

### HTTP Request

`GET https://platform.tier-services.io/vehicle?lat=48.1&lng=16.3&radius=5000`

### Query Parameters

Parameter  | Description
--------- | -----------
lat | Latitude to search for vehicles within a given radius
lng | Longitude to search for vehicles within a given radius
radius | Radius in meter

## Get All Vehicles Assigned Within A Zone

```shell
curl "https://platform.tier-services.io/vehicle"
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
      "lastLocationUpdate": "2019-02-09T21:14:27Z",
      "lastStateChange": "2019-02-09T21:01:29Z",
      "batteryLevel": 64,
      "licencePlate": "11456",
      "lat": 48.19821,
      "lng": 16.381173,
      "maxSpeed": 18,
      "zoneId": "BERLIN",
      "code": "11942"
    }
  ]
}
```


This endpoint retrieves all the vehicles, which are currently available for rent. You must provide a
`zoneId` to retrieve vehicles. Your API key may be limited to accessing certain zones only.

### HTTP Request

`GET https://platform.tier-services.io/vehicle?zoneId=BERLIN`

## Make vehicle flash

To make the lights of a vehicle flash so you can locate it more easily. You need to know
the id of the vehicle. Note that you may only flash the lights of vehicles that are in a
zone that you may access with your API key. 

### HTTP Request

`POST https://platform.tier-services.io/vehicle/47372/flash`



```shell
curl -X POST "https://platform.tier-services.io/vehicle/47372/flash"
  -H "x-api-key: TIER API KEY"
```

