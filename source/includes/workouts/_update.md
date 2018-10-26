## Update a Workout

Updates a workout for the authenticated user.

```shell
curl --header "Authorization: Bearer 414c6a44a5f8b918830b370db05" -X PUT
  -d workout[name]="Friday afternoon" api.lvh.me:3000/v1/workouts/56519
```

> The above command returns JSON structured like this:

``````json
{
    "id": 56519,
    "starts": "2015-08-12T09:00:00.000Z",
    "minutes": 12,
    "name": "Friday afternoon",
    "created_at": "2018-10-23T20:41:55.000Z",
    "updated_at": "2018-10-23T20:41:55.000Z",
    "plan_id": null,
    "workout_token": "123",
    "workout_type_id": 40
}
```


### HTTP Request

`POST http://api.wahooligan.com/cloud-api/workouts`

### Query Parameters

Parameter               | Type   | Required | Description
---------               | ----   | -------- | -----------
workout[name]           | String | no       | The name of the workout
workout[workout_token]  | String | no       | Can be used by the application to identify the workout
workout[workout_type_id]| Number | no       | The type of the workout
workout[starts]         | Time   | no       | Start time
workout[minutes]        | Number | no       | Minutes is the duration of the workout
workout[plan_id]        | Number | no       | Id of the plan option used in this workout
