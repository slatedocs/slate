## Workout Summary

Requires the `offline_data` scope

> Sample Workout Summary Webhook Message

```JSON
{
  "event_type": "workout_summary",
  "webhook_token": <webhook_token>,
  "user": {
    "id": 60462
  },
  "workout_summary": {
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
    },
    "workout": {
      "id": 56519,
      "starts": "2015-08-12T09:00:00.000Z",
      "minutes": 12,
      "name": "Friday Fun",
      "created_at": "2018-10-23T20:41:55.000Z",
      "updated_at": "2018-10-23T20:41:55.000Z",
      "plan_id": null,
      "workout_token": "123",
      "workout_type_id": 40
    }
  }     
}
```
