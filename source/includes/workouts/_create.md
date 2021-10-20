## Create a Workout

Requires the `workouts_write` scope

Creates a workout for the authenticated user.

```shell
curl --header "Authorization: Bearer users-token-goes-here"  -X POST
  -d 'workout[name]="Friday fun"&
      workout[workout_token]=123&
      workout[workout_type_id]=40&
      workout[starts]=2015-08-12T09:00:00.000Z&
      workout[minutes]=12'  https://api.wahooligan.com/v1/workouts
```

> Sample Response:

``````json
{
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
```

### HTTP Request

`POST https://api.wahooligan.com/v1/workouts`

### Parameters

Parameter               | Type   | Required | Default | Description
---------               | ----   | -------- | ------- | -----------
workout[name]           | String | yes      |         | The name of the workout
workout[workout_type_id]| Number | yes      |         | The type of the workout - [Workout Types](#workout-types)
workout[starts]         | Time   | yes      |         | Start time
workout[minutes]        | Number | yes      |         | Duration of the workout in minutes
workout[workout_token]  | String | no       |         | Can be used by the application to identify the workout
workout[plan_id]        | Number | no       | null    | Id of the plan used in this workout
workout[workout_summary]| Object | no       |         | Include summary results - [Workout Summary](#create-a-workout-summary)
