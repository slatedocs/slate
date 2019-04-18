
# Zones

Zones define the locations in which vehicles can operate.
There are 4 kinds of zones:

  - root zones
  - business zones
  - constrained zones
  - warehouse zones

Each of them have different meanings.

### Root Zone

 - A root zone is a container for zones. A root zone usually created for a single
   city, e.g. BERLIN.
 - A root zone has a center (lat/lng), but no shape (polygon).
 - A root zone has pricing, while the other zones do not. That means that the pricing
for a certain area have to determined using the root zone.

### Business Zone
 - A business zone is the zone in which scooters may operate.
 - A root zone may contain multiple business zones; A business zone is associated
   with exactly one root zone
 - Scooters outside a business zone are slowed down to 5 km/h

### Constrained Zone
 - A root zone may contain multiple constrained zones. A constraint zone must be
   associated with exactly one root zone
 - A Constrained zone may overlap with business zone
 - Scooters inside a constrained zone may have reduced speed and/or it may not
   be allowed to end the rental inside it

### Warehouse Zone
 - A root zone may contain multiple warehouse zones; A warehouse zone is associated
   with exactly one root zone
 - Warehouse zones and business zones should not overlap
 - Scooters inside a warehouse zone are automatically transitioned into the
   `MAINTENANCE` state, in which they cannot be rented.

## Get All Zones near a specific location

```shell
curl "https://platform.tier-services.io/v1/zone?lat=40&lng=-3"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "type": "zone",
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

`GET https://platform.tier-services.io/v1/zone?lat=40&lng=-3`

### Query Parameters

Parameter  | Description
--------- | -----------
lat | Latitude to search for zones nearby
lng | Longitude to search for zones nearby


## Get All Zones by type

```shell
curl "https://platform.tier-services.io/v1/zone?type=root"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "type": "zone",
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

`GET https://platform.tier-services.io/v1/zone?type=root`

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
