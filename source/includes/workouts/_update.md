## Update a Workout

Requires the `workouts_write` scope

Updates a workout for the authenticated user.

```shell
curl --header "Authorization: Bearer users-token-goes-here" -X PUT
  -d workout[name]="Friday afternoon" https://api.wahooligan.com/v1/workouts/56519
```

> Sample Response:

``````json
{
  "id": 56519,
  "starts": "2015-08-12T09:00:00.000Z",
  "minutes": 12,
  "name": "Friday afternoon",
  "plan_id": null,
  "workout_token": "123",
  "workout_type_id": 40,
  "workout_summary": null,
  "created_at": "2018-10-23T20:41:55.000Z",
  "updated_at": "2018-10-23T20:41:55.000Z"
}
```


### HTTP Request

`POST https://api.wahooligan.com/v1/workouts`

### Query Parameters

Parameter               | Type   | Required | Description
---------               | ----   | -------- | -----------
workout[name]           | String | no       | The name of the workout
workout[workout_token]  | String | no       | Can be used by the application to identify the workout
workout[starts]         | Time   | no       | Start time
workout[minutes]        | Number | no       | Duration of the workout in minutes
workout[plan_id]        | Number | no       | Id of the plan used in this workout
workout[workout_type_id]| Number | no       | The type of the workout - [Workout Types](#workout-types)
workout[workout_summary]| Object | no       | Include summary results - [Workout Summary](#update-a-workout-summary)
