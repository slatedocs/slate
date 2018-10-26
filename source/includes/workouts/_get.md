## Get a Workout

Returns a workout for the current authenticated user.

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/workouts/56519
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

`GET http://api.wahooligan.com/v1/workouts/:id`
