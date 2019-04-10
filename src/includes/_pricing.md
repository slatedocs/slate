
# Pricing

## Get the pricing information for a zone

```shell
curl "https://platform.tier-services.io/v1/pricing/?zoneId=BERLIN"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "type": "pricing",
    "id": "BERLIN",
    "attributes": {
      "currency": "EUR",
      "rentalStartPrice": "1.00",
      "rentalRunningPricePerMinute": "1.00",
      "rentalPausedPricePerMinute": "1.00"
    }
  }
}

```

This endpoint returns the pricing for a certain zone.

The `currency` is a [3-letter ISO 4217 code](https://en.wikipedia.org/wiki/ISO_4217).

`rentalStartPrice` is the price for unlocking a scooter to start a rental,
`rentalRunningPricePerMinute` is the price to pay for each started minute and
`rentalPausedPricePerMinute` is the price to pay for each started minute in which the vehicle has
been paused ("parked").




### HTTP Request

`GET https://platform.tier-services.io/v1/pricing?zoneId=BERLIN`

### Query Parameters

Parameter  | Description
--------- | -----------
zoneId | The zone identifier
