## Get a Workout Summary

Returns the workout summary object for a workout. When a workout is created, the workout summary will be empty until it is updated.

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/workouts/:id/workout_summary
```
> Sample Response:

``````json
{
    "id": 8297,
    "heart_rate_avg": null,
    "calories_accum": null,
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
    "data": "random",
    "kilo_joules_avg": null,
    "file": {
        "url": "https://wahoo-cloud-web.s3.amazonaws.com/development/uploads/workout_file/file/EjA4DJCoIaG-f2fB2MLLLg/4_Mile_Segment_.fit"
    },
    "created_at": "2018-10-23T20:43:50.000Z",
    "updated_at": "2018-10-23T20:43:50.000Z"
}
```

### HTTP Request

`GET https://api.wahooligan.com/v1/workouts/:id/workout_summary`
