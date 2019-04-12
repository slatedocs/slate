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
    "heart_rate_avg": null,
    "calories_accum": null,
    "created_at": "2018-10-23T20:43:50.000Z",
    "updated_at": "2018-10-23T20:43:50.000Z",
    "power_avg": null,
    "distance_accum": null,
    "cadence_avg": null,
    "ascent_accum": null,
    "cadence_max": null,
    "descent_accum": null,
    "duration_active_accum": null,
    "duration_paused_accum": null,
    "duration_total_accum": null,
    "elevation_avg": null,
    "elevation_max": null,
    "elevation_min": null,
    "elevation_last": null,
    "grade_avg": null,
    "grade_max": null,
    "grade_min": null,
    "heart_rate_max": null,
    "heart_rate_min": null,
    "hemoglobin_saturated_pct_avg": null,
    "hemoglobin_saturated_pct_max": null,
    "hemoglobin_saturated_pct_min": null,
    "hemoglobin_total_concentration_avg": null,
    "hemoglobin_total_concentration_max": null,
    "hemoglobin_total_concentration_min": null,
    "lat_last": null,
    "lat_first": null,
    "lng_last": null,
    "lng_first": null,
    "ma_gct_avg": null,
    "ma_gct_max": null,
    "ma_gct_min": null,
    "ma_smoothness_avg": null,
    "ma_smoothness_max": null,
    "ma_smoothness_min": null,
    "ma_vert_ocs_avg": null,
    "ma_vert_ocs_max": null,
    "ma_vert_ocs_min": null,
    "power_max": null,
    "power_min": null,
    "power_bike_if_last": null,
    "power_bike_lr_balance_avg": null,
    "power_bike_np_last": null,
    "power_bike_tss_last": null,
    "pressure_barom_avg": null,
    "pressure_barom_max": null,
    "pressure_barom_min": null,
    "speed_avg": null,
    "speed_max": null,
    "temperature_avg": null,
    "temperature_max": null,
    "temperature_min": null,
    "tiz_hr1_accum": null,
    "tiz_hr2_accum": null,
    "tiz_hr3_accum": null,
    "tiz_hr4_accum": null,
    "tiz_hr5_accum": null,
    "torque_bike_avg": null,
    "torque_bike_max": null,
    "work_accum": null,
    "data": "Friday afternoon ",
    "kilo_joules_avg": null,
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
workout_summary[cadence_max]                         | number     | Max rotations per minute
workout_summary[calories_accum]                      | decimal    | Calories (kCal)
workout_summary[descent_accum]                       | decimal    | Meters
workout_summary[distance_accum]                      | decimal    | Meters
workout_summary[duration_active_accum]               | number     | Seconds
workout_summary[duration_paused_accum]               | number     | Seconds
workout_summary[duration_total_accum]                | number     | Seconds
workout_summary[elevation_avg]                       | decimal    | Meters
workout_summary[elevation_max]                       | decimal    | Meters
workout_summary[elevation_min]                       | decimal    | Meters
workout_summary[elevation_last]                      | decimal    | Meters
workout_summary[grade_avg]                           | decimal    | percentage
workout_summary[grade_max]                           | decimal    |
workout_summary[grade_min]                           | decimal    |
workout_summary[heart_rate_avg]                      | number     | bpm
workout_summary[heart_rate_max]                      | number     | bpm
workout_summary[heart_rate_min]                      | number     | bpm
workout_summary[hemoglobin_saturated_pct_avg]        | decimal    | percentage
workout_summary[hemoglobin_saturated_pct_max]        | decimal    | percentage
workout_summary[hemoglobin_saturated_pct_min]        | decimal    | percentage
workout_summary[hemoglobin_total_concentration_avg]  | decimal    | g/dL
workout_summary[hemoglobin_total_concentration_max]  | decimal    | g/dL
workout_summary[hemoglobin_total_concentration_min]  | decimal    | g/dL
workout_summary[kilo_joules_avg]                     | decimal    |
workout_summary[lat_last]                            | decimal    |
workout_summary[lat_first]                           | decimal    |
workout_summary[lng_last]                            | decimal    |
workout_summary[lng_first]                           | decimal    |
workout_summary[ma_gct_avg]                          | decimal    | Seconds
workout_summary[ma_gct_max]                          | decimal    | Seconds
workout_summary[ma_gct_min]                          | decimal    | Seconds
workout_summary[ma_smoothness_avg]                   | number     |
workout_summary[ma_smoothness_max]                   | number     |
workout_summary[ma_smoothness_min]                   | number     |
workout_summary[ma_vert_ocs_avg]                     | decimal    | Meters
workout_summary[ma_vert_ocs_max]                     | decimal    | Meters
workout_summary[ma_vert_ocs_min]                     | decimal    | Meters
workout_summary[power_avg]                           | decimal    | Watts
workout_summary[power_max]                           | number     | Watts
workout_summary[power_min]                           | number     | Watts
workout_summary[power_bike_if_last]                  | decimal    | intensity factor
workout_summary[power_bike_lr_balance_avg]           | decimal    | percentage
workout_summary[power_bike_np_last]                  | number     | Watts
workout_summary[power_bike_tss_last]                 | decimal    | unitless
workout_summary[pressure_barom_avg]                  | number     | newtons per meter squared
workout_summary[pressure_barom_max]                  | number     |
workout_summary[pressure_barom_min]                  | number     |
workout_summary[speed_avg]                           | decimal    | Meters/Sec
workout_summary[speed_max]                           | decimal    | Meters/Sec
workout_summary[temperature_avg]                     | decimal    | degrees celsius
workout_summary[temperature_max]                     | decimal    | degrees celsius
workout_summary[temperature_min]                     | decimal    | degrees celsius
workout_summary[tiz_hr1_accum]                       | number     | Seconds
workout_summary[tiz_hr2_accum]                       | number     | Seconds
workout_summary[tiz_hr3_accum]                       | number     | Seconds
workout_summary[tiz_hr4_accum]                       | number     | Seconds
workout_summary[tiz_hr5_accum]                       | number     | Seconds
workout_summary[torque_bike_avg]                     | decimal    | newton / meters
workout_summary[torque_bike_max]                     | decimal    | newton / meters
workout_summary[work_accum]                          | number     | joules
workout_summary[reps_accum]                          | number     | unitless
workout_summary[data]                                | String     | Holds raw fields + additional fields
workout_summary[file]                                | File       | Fit file

