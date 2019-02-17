
# Rentals

## Start and stop rentals

```shell
curl "https://platform.tier-services.io/rental"
  -X POST
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
	"data": {
	  "consumerIdentifier" : "external-party-identifier",
    "consumerRentalStartLocation": {
      "lat": 0,
      "lng": 0
    },
    "vehicleCode": 47382
  }
}
```

This endpoint provides the ability to start and stop a rental for an available
vehicle provided by the code of the vehicle.

### HTTP Request

`POST https://platform.tier-services.io/rental`
