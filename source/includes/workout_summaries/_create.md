## Create a Workout Summary

Requires the `workouts_write` scope

Creates a workout summary and associates it with a workout. If a workout summary already exists for the workout then the workout summary is updated.

```shell
curl --header "Authorization: Bearer users-token-goes-here" -X POST
  -d workout_summary[power_avg]="240.52" https://api.wahooligan.com/v1/workouts/56519/workout_summary
```

> Sample Response:

``````json
{
    "id": 8297,
    "ascent_accum": "450.00",
    "cadence_avg": "50.00",
    "calories_accum": "1500.00",
    "distance_accum": "24909.71",
    "duration_active_accum": "179.00",
    "duration_paused_accum": "95.00",
    "duration_total_accum": "275.24",
    "heart_rate_avg": "124.54",
    "power_bike_np_last": "150.00",
    "power_bike_tss_last": "304.90",
    "power_avg": "94.59",
    "speed_avg": "10.75",
    "work_accum": "1041480.00",
    "created_at": "2018-10-23T20:43:50.000Z",
    "updated_at": "2018-10-23T20:43:50.000Z",
    "file": {
        "url": "https://server.com/4_Mile_Segment_.fit"
    }
}
```

### HTTP Request

`POST https://api.wahooligan.com/v1/workouts/:id/workout_summary`

### Parameters

Parameter                                            | Type       | Description
---------------------------------------------------- | ---------- | -----------
workout_summary[ascent_accum]                        | decimal    | Ascent in meters
workout_summary[cadence_avg]                         | decimal    | Average rotations per minute
workout_summary[calories_accum]                      | decimal    | Calories (kCal)
workout_summary[distance_accum]                      | decimal    | Meters
workout_summary[duration_active_accum]               | decimal    | Seconds
workout_summary[duration_paused_accum]               | decimal    | Seconds
workout_summary[duration_total_accum]                | decimal    | Seconds
workout_summary[heart_rate_avg]                      | decimal    | bpm
workout_summary[power_avg]                           | decimal    | Watts
workout_summary[power_bike_np_last]                  | decimal    | Watts
workout_summary[power_bike_tss_last]                 | decimal    | unitless
workout_summary[speed_avg]                           | decimal    | Meters/Sec
workout_summary[work_accum]                          | decimal    | joules
workout_summary[file]                                | File       | Fit file

