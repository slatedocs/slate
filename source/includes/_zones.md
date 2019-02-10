
# Zones

## Get All Zones

```shell
curl "https://api.tier.app/zone"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
	"data": [{
		"lastTimeUpdated": "2019-02-09T22:38:46+00:00",
		"definition": {
			"lat": 52.5200,
			"lng": 13.405
		},
		"zone": "BERLIN",
		"businessZones": [{
			"coordinates": [{
					"lng": 2.368090152740479,
					"lat": 48.841517296129474
				},
				{
					"lng": 2.3735404014587407,
					"lat": 48.844454635874015
				},
				{
					"lng": 2.3721671104431157,
					"lat": 48.84798486433429
				},
				{
					"lng": 2.3709225654602055,
					"lat": 48.85063943219613
				}
			]
		}],
		"contrainedZones": [{
			"coordinates": [{
					"lng": 2.368090152740479,
					"lat": 48.841517296129474
				},
				{
					"lng": 2.3735404014587407,
					"lat": 48.844454635874015
				},
				{
					"lng": 2.3721671104431157,
					"lat": 48.84798486433429
				},
				{
					"lng": 2.3709225654602055,
					"lat": 48.85063943219613
				}
			],
			"constrain": ["noParking", "reducedSpeed"]
		}]

	}]
}
```

This endpoint retrieves all the zones that limits the range of the scooter. Outside of a business zone
the speed will automatically be reduced and will only be restored once entering the business zone again.
Within a business zone there are constrained zones which limit the capability of the vehicle like maximum
speed and the capability to park the vehicle. The reduced speed is currently fixed and set to 5kmh.

The provided coordinates describe a polygone.

<aside class="notice">
There is no additional functionality for the client to implement for the constraint zones. Those constraints are either enforced by endpoints (e.g. parking is rejected)
or by automatisms. It is yet essential to inform anyone about those areas to provide a good UX.
</aside>

### HTTP Request

`GET https://api.tier.app/zone`

### Query Parameters

Parameter  | Description
--------- | -----------
lat | Latitude to search for zones nearby
lng | Longitude to search for zones nearby
