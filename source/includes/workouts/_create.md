## Create a Workout

Creates a workout for the authenticated user.

```shell
curl --header "Authorization: Bearer 414c6a44a5f8b918830b370db05"  -X POST
  -d 'workout[name]="Friday fun"&
      workout[workout_token]=123&
      workout[workout_type_id]=40&
      workout[starts]=2015-08-12T09:00:00.000Z&
      workout[minutes]=12'  api.lvh.me:3000/v1/workouts
```

> The above command returns JSON structured like this:

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

`POST http://api.wahooligan.com/cloud-api/workouts`

### Parameters

Parameter               | Type   | Required | Default | Description
---------               | ----   | -------- | ------- | -----------
workout[name]           | String | yes      |         | The name of the workout
workout[workout_token]  | String | yes      |         | Can be used by the application to identify the workout
workout[workout_type_id]| Number | yes      |         | The type of the workout
workout[starts]         | Time   | yes      |         | Start time
workout[minutes]        | Number | yes      |         | Minutes is the duration of the workout
workout[plan_id]        | Number | no       | null    | Id of the plan option used in this workout
