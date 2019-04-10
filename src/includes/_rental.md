
# Rentals

The `/v1/rental` endpoint provides the ability to start and stop a rental for an available
vehicle, given that you have the vehicle Id (`UUID`) of the vehicle you want to start a rental for. 

## Start rentals

When starting a rental, you must also provide a unique customer id, which will be used to identify 
for which of your customers you have started a rental.

```shell
curl "https://platform.tier-services.io/v1/rental/start"
  -X POST
  -H "x-api-key: TIER API KEY"
  -d '{
      	"data": {
          "vehicle": {
            "vehicleId": UUID,
          },
          "customerStartLocation": {
            "lat": 52,
            "lng": 13,
          },
          "customerInfo": {
            "extenalCustomerId": "your unique customer id" 
          }
        }
      }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "4a35a1bd-fa1a-4b56-ab8d-4b93a2f7534b",
    "type": "rental",
    "attributes": {
      "rideDurationMin": null,
      "pauseDurationMin": null,
      "cost": null,
      "state": "RUNNING",
      "startedAt": "2019-03-01T14:06:41.939949Z",
      "endedAt": null,
      "customerStartLocation": {
        "lat": 52,
        "lng": 13
      },
      "customerEndLocation": null,
      "vehicleStartLocation": {
        "lat": 52,
        "lng": 13
      },
      "vehicleEndLocation": null,
      "vehicle": {
        "vehicleId": "d62ee238-6fe3-4a9a-9db7-7f235e39e1fc",
        "vehicleCode": 15779
      },
      "stateHistory": [
        {
          "createdAt": "2019-03-01T14:06:41.939949Z",
          "state": "RUNNING"
        }
      ]
    }
  }
}
```

### HTTP Request

`POST https://platform.tier-services.io/v1/rental/start`

### Required Post Data

Field     | Content | Note 
--------- | ------- | ---------
vehicle   | {"vehicleId": UUID} | The vehicle that shall be rented
customerStartLocation | { "lat": 52, "lng": 13 } | The location of the customer as reported by their mobile phone
customerInfo | {"extenalCustomerId": "your unique customer id"} | Your id of the customer on whos behalf the rental is started
    

### Errors

The Tier API uses the following error codes:

Error Code | Meaning
---------- | -------
404 | Not Found -- the vehicle code provided could not be found
409 | Conflict -- the vehicle cannot be rented, possibly taken or damaged

## Get rentals

Retrieve an active of past rental by the rental id (UUID)

### HTTP Request

`GET https://platform.tier-services.io/v1/rental/<rental-id>`

```shell
curl "https://platform.tier-services.io/v1/rental/4a35a1bd-fa1a-4b56-ab8d-4b93a2f7534b"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "4a35a1bd-fa1a-4b56-ab8d-4b93a2f7534b",
    "type": "rental",
    "attributes": {
      "rideDurationMin": null,
      "pauseDurationMin": null,
      "cost": null,
      "state": "RUNNING",
      "startedAt": "2019-03-01T14:06:41.939949Z",
      "endedAt": null,
      "customerStartLocation": {
        "lat": 52,
        "lng": 13
      },
      "customerEndLocation": null,
      "vehicleStartLocation": {
        "lat": 52,
        "lng": 13
      },
      "vehicleEndLocation": null,
      "vehicle": {
        "vehicleId": "d62ee238-6fe3-4a9a-9db7-7f235e39e1fc",
        "vehicleCode": 15779
      },
      "stateHistory": [
        {
          "createdAt": "2019-03-01T14:06:41.939949Z",
          "state": "RUNNING"
        }
      ]
    }
  }
}
```

## End rentals

### HTTP Request

`POST https://platform.tier-services.io/v1/rental/<rental-id>/end`

### Required Post Data

Field     | Content | Note 
--------- | ------- | ---------
customerEndLocation | { "lat": 52, "lng": 13 } | The location of the customer as reported by their mobile phone
    

```shell
curl "https://platform.tier-services.io/v1/rental/4a35a1bd-fa1a-4b56-ab8d-4b93a2f7534b/end"
  -X POST
  -H "x-api-key: TIER API KEY"
  -d '{
    "data": {
      "customerEndLocation": {
        "lat": 52,
        "lng": 13,
      },
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "4a35a1bd-fa1a-4b56-ab8d-4b93a2f7534b",
    "type": "rental",
    "attributes": {
      "rideDurationMin": 14,
      "pauseDurationMin": 0,
      "cost": {
        "total": {
          "amount": "3.10",
          "currency": "EUR"
        },
        "unlock": {
          "amount": "1.00",
          "currency": "EUR"
        },
        "ride": {
          "amount": "2.10",
          "currency": "EUR"
        },
        "pause": {
          "amount": "0.00",
          "currency": "EUR"
        }
      },
      "state": "ENDED",
      "startedAt": "2019-03-01T14:06:41.939949Z",
      "endedAt": "2019-03-01T14:20:17.413018Z",
      "customerStartLocation": {
        "lat": 52,
        "lng": 13
      },
      "customerEndLocation": {
        "lat": 52.1,
        "lng": 13.1
      },
      "vehicleStartLocation": {
        "lat": 52,
        "lng": 13
      },
      "vehicleEndLocation": {
        "lat": 52.1,
        "lng": 13.1
      },
      "vehicle": {
        "vehicleId": "d62ee238-6fe3-4a9a-9db7-7f235e39e1fc",
        "vehicleCode": 15779
      },
      "stateHistory": [
        {
          "createdAt": "2019-03-01T14:06:41.939949Z",
          "state": "RUNNING"
        },
        {
          "createdAt": "2019-03-01T14:20:17.413018Z",
          "state": "ENDED"
        }
      ]
    }
  }
}
```

