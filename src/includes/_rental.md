
# Rentals

## Start rentals

```shell
curl "https://platform.tier-services.io/rental/start"
  -X POST
  -H "x-api-key: TIER API KEY"
  -d '{
      	"data": {
          vehicleId: UUID,
          customerLocation: {
            lat: 52,
            lng: 13.2,
          }
        }
      }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "type": "rental",
    "id": "some-long-uuid",
    "attributes": {
      "consumerRentalStartLocation": {
        "lat": 0,
        "lng": 0
      },
      "consumerRentalStopLocation": {
        "lat": 0,
        "lng": 0
      },
      "cost": 0,
      "currencyCode": "string",
      "drivenDistance": 0,
      "startedAt": "2019-02-17T20:19:18.995Z",
      "state": "string",
      "stoppedAt": "2019-02-17T20:19:18.995Z",
      "usageTime": 0,
      "vehicleCode": 0
    }
  }
}
```

This endpoint provides the ability to start and stop a rental for an available
vehicle provided by the code of the vehicle.

### HTTP Request

`POST https://platform.tier-services.io/rental/start`

### Errors

The Tier API uses the following error codes:

Error Code | Meaning
---------- | -------
404 | Not Found -- the vehicle code provided could not be found
409 | Conflict -- the vehicle cannot be rented, possibly taken or damaged


## End rentals

```shell
curl "https://platform.tier-services.io/rental/some-long-uuid/end"
  -X POST
  -H "x-api-key: TIER API KEY"
  -d '{
      	"data": {
          customerLocation: {
            lat: 52,
            lng: 13,
          }
        }
      }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "type": "rental",
    "id": "some-long-uuid",
    "attributes": {
      "consumerRentalStartLocation": {
        "lat": 0,
        "lng": 0
      },
      "consumerRentalStopLocation": {
        "lat": 0,
        "lng": 0
      },
      "cost": 0,
      "currencyCode": "string",
      "drivenDistance": 0,
      "startedAt": "2019-02-17T20:19:18.995Z",
      "state": "string",
      "stoppedAt": "2019-02-17T20:19:18.995Z",
      "usageTime": 0,
      "vehicleCode": 0
    }
  }
}
```

This endpoint provides the ability to start and stop a rental for an available
vehicle provided by the code of the vehicle.

### HTTP Request

`POST https://platform.tier-services.io/rental/<rental-id>/end`
