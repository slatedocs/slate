## Workout Summary

Requires the `offline_data` scope

> Sample Workout Summary Webhook Message

``````json
{
  "event_type": "workout_summary",
  "webhook_token": <webhook_token>,
  "user": {
    "id": 60462
  },
  "workout_summary": {
    "id": 8297,
    "ascent_accum": 450.00,
    "cadence_avg": 50.00,
    "calories_accum": 1500.00,
    "distance_accum": 24909.71,
    "duration_active_accum": 179,
    "duration_paused_accum": 95,
    "duration_total_accum": 275,
    "heart_rate_avg": 124,
    "power_bike_np_last": 150,
    "power_bike_tss_last": 304.90,
    "power_avg": 94.59,
    "speed_avg": 10.75,
    "work_accum": 104148000,
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
