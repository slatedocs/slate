## Get a Workout Summary

Requires the `workouts_read` scope

Returns the workout summary object for a workout. When a workout is created, the workout summary will be empty until it is updated.

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/workouts/:id/workout_summary
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
    "duration_paused_accum": "95.25",
    "duration_total_accum": "275.00",
    "heart_rate_avg": "100.00",
    "power_bike_np_last": "150.00",
    "power_bike_tss_last": "304.90",
    "power_avg": "94.59",
    "speed_avg": "10.75",
    "work_accum": "1041480.00",
    "file": {
        "url": "https://server.com/4_Mile_Segment_.fit"
    },
    "created_at": "2018-10-23T20:43:50.000Z",
    "updated_at": "2018-10-23T20:43:50.000Z"
}
```

### HTTP Request

`GET https://api.wahooligan.com/v1/workouts/:id/workout_summary`
