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
    "ascent_accum": 450.00,
    "calories_accum": 1500.00,
    "cadence_avg": 50.00,
    "distance_accum": 24909.71,
    "duration_active_accum": 179,
    "duration_paused_accum": 95,
    "duration_total_accum": 275,
    "heart_rate_avg": 124,
    "power_avg": 94.59,
    "power_bike_np_last": 150,
    "power_bike_tss_last": 304.90,
    "speed_avg": 10.75,
    "work_accum": 104148000,
    "file": {
        "url": "https://wahoo-cloud-web.s3.amazonaws.com/development/uploads/workout_file/file/EjA4DJCoIaG-f2fB2MLLLg/4_Mile_Segment_.fit"
    },
    "created_at": "2018-10-23T20:43:50.000Z",
    "updated_at": "2018-10-23T20:43:50.000Z"
}
```

### HTTP Request

`GET https://api.wahooligan.com/v1/workouts/:id/workout_summary`
