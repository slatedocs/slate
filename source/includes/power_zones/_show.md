## Get a Power Zone

Requires the `power_zones_read` scope

Returns a power zone for the current authenticated user.

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/power_zones/56519
```

> Sample Response:

``````json
{
  "id": 56519,
  "user_id": 1,
  "zone_1": 100,
  "zone_2": 120,
  "zone_3": 140,
  "zone_4": 150,
  "zone_5": 200,
  "zone_6": 300,
  "zone_7": 400,
  "ftp": 400,
  "zone_count": 8,
  "workout_type_id": 10,
  "workout_type_family_id": 6,
  "workout_type_location_id": 8,
  "critical_power": 324,
  "originator_type": 0,
  "fitness_app_id": 6,
  "created_at": "2016-01-27T16:18:53.927Z",
  "updated_at": "2016-01-27T16:18:53.927Z"
}
```

### HTTP Request

`GET https://api.wahooligan.com/v1/power_zones/:id`
