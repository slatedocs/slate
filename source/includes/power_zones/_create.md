## Create a Power Zone

Requires the `power_zones_write` scope

Creates a power zone for the authenticated user.

```shell
curl --header "Authorization: Bearer users-token-goes-here"  -X POST
  -d 'power_zone[zone_1]=100
      power_zone[zone_2]=120&
      power_zone[zone_3]=120&
      power_zone[zone_4]=120&
      power_zone[zone_5]=120&
      power_zone[zone_6]=120&
      power_zone[zone_7]=120&
      power_zone[ftp]=400&
      power_zone[zone_count]=8&
      power_zone[workout_type_id]=10&
      power_zone[workout_type_family_id]=6&
      power_zone[workout_type_location_id]=8&
      power_zone[critical_power]=324'  https://api.wahooligan.com/v1/power_zones
```

> Sample Response:

``````json
{
  "id": 1,
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

`POST https://api.wahooligan.com/v1/power_zones`

### Parameters

Parameter                            | Type   | Required | Default | Description
---------                            | ----   | -------- | ------- | -----------
power_zone[zone_1]                   | Number | no       |         | Power Zone Value
power_zone[zone_2]                   | Number | no       |         | Power Zone Value
power_zone[zone_3]                   | Number | no       |         | Power Zone Value
power_zone[zone_4]                   | Number | no       |         | Power Zone Value
power_zone[zone_5]                   | Number | no       |         | Power Zone Value
power_zone[zone_6]                   | Number | no       |         | Power Zone Value
power_zone[zone_7]                   | Number | no       |         | Power Zone Value
power_zone[zone_count]               | Number | no       |         | Power Zone Total Count
power_zone[ftp]                      | Number | no       |         | Functional Threshold Power
power_zone[critical_power]           | Number | no       |         | MMP/Best average power
power_zone[workout_type_id]          | Number | no       |         | ID of the Workout Type
power_zone[workout_type_family_id]   | Number | no       |         | ID of the Workout Type
power_zone[workout_type_location_id] | Number | no       |         | ID of the Workout Type
