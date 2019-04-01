
# Zones

## Get All Zones near a specific location

```shell
curl "https://platform.tier-services.io/zone?lat=40&lng=-3"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "type": "zones",
      "id": "MADRID",
      "attributes": {
        "name": "MADRID",
        "lng": -3.690478,
        "lat": 40.451744,
        "polygon": [
          {
            "lng": -3.690478,
            "lat": 40.451744
          },
          {
            "lng": -3.690084,
            "lat": 40.451697
          },
          {
            "lng": -3.690389,
            "lat": 40.452475
          },
          {
            "lng": -3.690478,
            "lat": 40.451744
          }
        ],
        "country": "SPAIN",
        "zoneType": "root",
        "parentId": "MADRID",
      }
    }
  ]
}

```

This endpoint retrieves all the zones that limits the range of the scooter. Outside of a business zone
the speed will automatically be reduced and will only be restored once entering the business zone again.
Within a business zone there are constrained zones which limit the capability of the vehicle like maximum
speed and the capability to park the vehicle. The reduced speed is currently fixed and set to 5km/h.

The provided coordinates describe a polygon.

### HTTP Request

`GET https://platform.tier-services.io/zone?lat=40&lng=-3`

### Query Parameters

Parameter  | Description
--------- | -----------
lat | Latitude to search for zones nearby
lng | Longitude to search for zones nearby


## Get All Zones by type

```shell
curl "https://platform.tier-services.io/zone?type=root"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "type": "zones",
      "id": "MADRID",
      "attributes": {
        "name": "MADRID",
        "lng": -3.690478,
        "lat": 40.451744,
        "polygon": [
          {
            "lng": -3.690478,
            "lat": 40.451744
          },
          {
            "lng": -3.690084,
            "lat": 40.451697
          },
          {
            "lng": -3.690389,
            "lat": 40.452475
          },
          {
            "lng": -3.690478,
            "lat": 40.451744
          }
        ],
        "country": "SPAIN",
        "zoneType": "root",
        "parentId": "MADRID",
      }
    }
  ]
}

```

This endpoint retrieves all the zones filtered by type.
The provided coordinates describe a polygon.

### HTTP Request

`GET https://platform.tier-services.io/zone?type=root`

### Query Parameters

Parameter  | Description
--------- | -----------
type | possible types are root, business, warehouse, constrained

### Types
Parameter   | Description
----------- | -----------
root        | The zone to which all other zone types are attached, e.g. BERLIN
business    | An area in which customers can rent a vehicle
warehouse   | An area in which scooters are in MAINTENANCE
constrained | An area which may only allow reduced speed (may overlap with the business zone)

<aside class="notice">
Your client does not need to implement additional functionality for the constraint zones. These
constraints are either enforced by endpoints (e.g. parking is rejected) or by automations
(e.g. speed is reduced). It is yet essential to inform your users about those areas to provide a
good user experience.
</aside>
