
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
customerStartLocation | { "lat": 52, "lng": 13 } | The location of the customer as reported by their mobile phone (optional)
customerInfo | {"extenalCustomerId": "your unique customer id"} | Your id of the customer on whos behalf the rental is started
pricing | {"id": pricingId} | Optional. The assumed pricing to start this rental with. If the pricing has changed, the rental start will be rejected
    

## Get rentals

Retrieve an active of past rental by the rental id (UUID)

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

### HTTP Request

`GET https://platform.tier-services.io/v1/rental/<rental-id>`

## End rentals
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
### HTTP Request

`POST https://platform.tier-services.io/v1/rental/<rental-id>/end`

### Required Post Data

Field     | Content | Note 
--------- | ------- | ---------
customerEndLocation | { "lat": 52, "lng": 13 } | The location of the customer as reported by their mobile phone
state | ENDED
force | true | optional

The force switch can be used to override ending the rental, even when the vehicle is outside the business area or cannot be reached. This should only be used for integration in a customer support tool and not be allowed for the user



##Rental-specific error codes

>The command to start a rental

```json
{
  "method": "POST",
  "path": "/api/rental",
  "headers": {
    "Authorization": "Token samson",
    "Content-Type": "application/json"
  },
  "body": {
    "firebaseId": "abcdefg123456",
    "customerStartLocation": {
      "lng": 53.3,
      "lat": 13.2
    },
    "vehicle": {
      "vehicleCode": 123456
    }
  }
}
```
> returns a JSON structured like this if **the customer is blocked**:

```json
  "body": {
    "errors": [
      {
        "code": "CustomerBlocked",
        "title": "Customer is blocked",
        "status": "403"
      }
    ]
  }
}
```

> returns a JSON structured like this if **no running rental exists for this customer**:

```json
  "body": {
    "errors": [
      {
        "code": "RentalNotFound",
        "title": "No running rental found",
        "status": "404"
      }
    ]
  }
}
```

> returns a JSON structured like this if **the customer does not exist**:

```json
  "body": {
    "errors": [
      {
        "code": "CustomerNotFound",
        "title": "Customer not found",
        "status": "404"
      }
    ]
  }
}
```

> returns a JSON structured like this if **no vehicle with this code exists**:

```json
  "body": {
    "errors": [
      {
        "code": "VehicleNotFound",
        "title": "Vehicle not found",
        "status": "404"
      }
    ]
  }
}
```

> returns a JSON structured like this if **the vehicle is not reachable**:

```json
  "body": {
    "errors": [
      {
        "code": "VehicleNotReachable",
        "title": "Vehicle is not reachable",
        "status": "409"
      }
    ]
  }
}
```

> returns a JSON structured like this if **the customer already has a running rental**:

```json
  "body": {
    "errors": [
      {
        "code": "AlreadyRunningRentalExists",
        "title": "User has already a running rental",
        "status": "409"
      }
    ]
  }
}
```

> returns a JSON structured like this if **the vehicle with this code is not available**:

```json
  "body": {
    "errors": [
      {
        "code": "VehicleNotAvailable",
        "title": "Vehicle is not available",
        "status": "409"
      }
    ]
  }
}
```

> returns a JSON structured like this if **the customer has no valid payment method**:

```json
  "body": {
    "errors": [
      {
        "code": "NoValidPaymentMethod",
        "title": "User does not have a valid payment method",
        "status": "409"
      }
    ]
  }
}
```

The Tier API can respond with the following vehicle specific error codes when **starting** a rental:

Error Code | Meaning
---------- | -------
403 | Customer is blocked
404 | No running rental exists for this customer
404 | Customer does not exist
404 | No vehicle with this code exists
409 | Vehicle is not reachable
409 | Customer already has a running rental
409 | Vehicle with this code is not available
409 | Customer has no valid payment method

>The PATCH call to end a rental

```json
{
  "method": "PATCH",
  "path": "/api/rental/ee3a0c6c-9cc5-4bf1-8fb3-b3428b8bc1ce",
  "headers": {
    "Authorization": "Token samson",
    "Content-Type": "application/json"
  },
  "body": {
    "state": "ENDED",
    "customerEndLocation": {
      "lng": 53.3,
      "lat": 13.2
    }
  }
}

```

> returns a JSON structured like this if the vehicle is **outside of the business area**:

```json
  "body": {
    "errors": [
      {
        "code": "VehicleOutOfBusinessZone",
        "title": "Outside of business zone",
        "status": "409"
      }
    ]
  }
}
```

> returns a returns JSON structured like this if the vehicle is **inside a no parking zone**:

```json
  "body": {
    "errors": [
      {
        "code": "VehicleInNoParkingZone",
        "title": "Inside of no parking zone",
        "status": "409"
      }
    ]
  }
}
```

The Tier API can respond with the following vehicle specific error codes when **ending** a rental:

Error Code | Meaning
---------- | -------
409 | Vehicle is located outside of the business area
409 | Vehicle is located inside of a no parking zone