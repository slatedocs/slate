## Get a Workout Summary

Returns the workout summary object for a workout. When a workout is created, the workout summary will be empty until it is updated.

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/workouts/:id/workout_summary
```
> Sample Response:

``````json
{
    "id": 8297,
    "ascent_accum": null,
    "calories_accum": null,
    "cadence_avg": null,
    "distance_accum": null,
    "duration_active_accum": null,
    "duration_paused_accum": null,
    "duration_total_accum": null,
    "heart_rate_avg": null,
    "power_avg": null,
    "power_bike_np_last": null,
    "power_bike_tss_last": null,
    "speed_avg": null,
    "work_accum": null,
    "file": {
        "url": "https://wahoo-cloud-web.s3.amazonaws.com/development/uploads/workout_file/file/EjA4DJCoIaG-f2fB2MLLLg/4_Mile_Segment_.fit"
    },
    "created_at": "2018-10-23T20:43:50.000Z",
    "updated_at": "2018-10-23T20:43:50.000Z"
}
```

### HTTP Request

`GET https://api.wahooligan.com/v1/workouts/:id/workout_summary`
