## Get Heart Rate Zone

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/heart_rate_zone
```

> The above command returns JSON structured like this:

``````json
{
    "id": 454,
    "zone_1": 120,
    "zone_2": 130,
    "zone_3": 140,
    "zone_4": 150,
    "zone_5": 160,
    "resting": 100,
    "created_at": "2018-10-23T20:39:41.000Z",
    "updated_at": "2018-10-24T22:22:23.000Z",
    "maximum": 180
}
```

Returns the heart rate zone for the current authenticated user.

### HTTP Request

`GET http://api.wahooligan.com/v1/heart_rate_zone`

