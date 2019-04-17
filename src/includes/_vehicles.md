
# Vehicles

There are two basic use-cases for fetching vehicles:

  1. Fetching vehicles that can be rented during operating hours, see [`/vehicle` endpoint](#get-all-vehicles-in-a-zone)
  
  2. Fetching vehicles that should be picked up for charging them, please see [Pick-Up](#pick-up) and [Drop-Off](#drop-off) respectively

The following endpoints describe the former use case, to see vehicles during operating hours.

<aside class="notice">
Note that this endpoint still uses non-json-api compatible layout for backwards compatibility.
This will be remedied in the next version of the API. 
</aside>

## Get All Vehicles in a Zone

```shell
curl "https://platform.tier-services.io/v1/vehicle?zoneId=BERLIN"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "type": "vehicle",
      "id": "0160376e-d00a-4d47-8419-81c47c8855f3",
      "attributes": {
        "state": "ACTIVE",
        "lastLocationUpdate": "2019-04-02T14:23:02Z",
        "lastStateChange": "2019-04-02T05:20:47Z",
        "batteryLevel": 95,
        "lat": 48.213553,
        "lng": 16.382606,
        "maxSpeed": 20,
        "zoneId": "VIENNA",
        "code": 10050,
        "isRentable": true
      }
    },
  ]
}
```


This endpoint retrieves all the vehicles, which are currently available for rent. You must provide a
`zoneId` to retrieve vehicles.

### HTTP Request

`GET https://platform.tier-services.io/v1/vehicle?zoneId=BERLIN`

### Query Parameters

Parameter | Description
--------- | -----------
zoneId    | The Zone ID of the zone within which the vehicles are located


<aside class="notice">
Your API key may be limited to accessing certain zones only.
</aside>


## Get All Vehicles within Range

This endpoints get vehicles by geolocation (latitude and longitude). Vehicles
can be from multiple Zones in this mode, so you can also filter by zone
at the same time (recommended).

```shell
curl "https://platform.tier-services.io/v1/vehicle?lat=48.1&lng=16.3&radius=5000&zoneId=VIENNA"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "type": "vehicle",
      "id": "0160376e-d00a-4d47-8419-81c47c8855f3",
      "attributes": {
        "state": "ACTIVE",
        "lastLocationUpdate": "2019-04-02T14:23:02Z",
        "lastStateChange": "2019-04-02T05:20:47Z",
        "batteryLevel": 95,
        "lat": 48.213553,
        "lng": 16.382606,
        "maxSpeed": 20,
        "zoneId": "VIENNA",
        "code": 10050,
        "isRentable": true
      }
    },
  ]
}
```
 

### HTTP Request

`GET https://platform.tier-services.io/v1/vehicle?lat=48.1&lng=16.3&radius=5000`

### Query Parameters

Parameter  | Description
--------- | -----------
lat | Latitude to search for vehicles within a given radius
lng | Longitude to search for vehicles within a given radius
radius | Radius in meter


## Make vehicle flash

To make the lights of a vehicle flash so you can locate it more easily. You need to know
the id of the vehicle. Note that you may only flash the lights of vehicles that are in a
zone that you may access with your API key. 

### HTTP Request

`POST https://platform.tier-services.io/v1/vehicle/<vehicle-id>/flash`



```shell
curl -X POST "https://platform.tier-services.io/v1/vehicle/<vehicle-id>/flash"
  -H "x-api-key: TIER API KEY"
```

