
# Vehicles

## Get All Vehicles

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


This endpoint retrieves all the vehicles, which are currently available for rent or are 
currently in an active rent if `isUnlocked` is `true`. The `code` is also provided 

### HTTP Request

`GET https://platform.tier-services.io/vehicle`

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
curl "https://platform.tier-services.io/vehicle?zone=BERLIN"
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

`GET https://platform.tier-services.io/vehicle?zone=BERLIN`

### Query Parameters

Parameter  | Description
--------- | -----------
zone | a zone of type `root`
