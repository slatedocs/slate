## Create a Workout Summary

Creates a workout summary and associates it with a workout. If a workout summary already exists for the workout then the workout summary is updated.

```shell
curl --header "Authorization: Bearer 414c6a44a5f8b918830b370db05" -X POST
  -d workout_summary[data]="Friday afternoon workout" https://api.wahooligan.com/v1/workouts/56519/workout_summary
```

> Sample Response:

``````json
{
    "id": 8297,
    "ascent_accum": null,
    "cadence_avg": null,
    "calories_accum": null,
    "distance_accum": null,
    "duration_active_accum": null,
    "duration_paused_accum": null,
    "duration_total_accum": null,
    "heart_rate_avg": null,
    "power_bike_np_last": null,
    "power_bike_tss_last": null,
    "power_avg": null,
    "speed_avg": null,
    "work_accum": null,
    "created_at": "2018-10-23T20:43:50.000Z",
    "updated_at": "2018-10-23T20:43:50.000Z",
    "file": {
        "url": "https://wahoo-cloud-web.s3.amazonaws.com/development/uploads/workout_file/file/EjA4DJCoIaG-f2fB2MLLLg/4_Mile_Segment_.fit"
    }
}
```

### HTTP Request

`POST https://api.wahooligan.com/v1/workouts/:id/workout_summary`

### Parameters

Parameter                                            | Type       | Description
---------------------------------------------------- | ---------- | -----------
workout_summary[ascent_accum]                        | decimal    | Ascent in meters
workout_summary[cadence_avg]                         | number     | Average rotations per minute
workout_summary[calories_accum]                      | decimal    | Calories (kCal)
workout_summary[distance_accum]                      | decimal    | Meters
workout_summary[duration_active_accum]               | number     | Seconds
workout_summary[duration_paused_accum]               | number     | Seconds
workout_summary[duration_total_accum]                | number     | Seconds
workout_summary[heart_rate_avg]                      | number     | bpm
workout_summary[power_avg]                           | decimal    | Watts
workout_summary[power_bike_np_last]                  | number     | Watts
workout_summary[power_bike_tss_last]                 | decimal    | unitless
workout_summary[speed_avg]                           | decimal    | Meters/Sec
workout_summary[work_accum]                          | number     | joules
workout_summary[file]                                | File       | Fit file

