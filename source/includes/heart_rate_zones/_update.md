## Update Heart Rate Zones

```shell
curl --header "Authorization: Bearer users-token-goes-here"
     -X PUT -d heart_rate_zone[resting]=90 https://api.wahooligan.com/v1/heart_rate_zone
```

> Sample Response:

``````json
{
    "id": 454,
    "zone_1": 120,
    "zone_2": 130,
    "zone_3": 140,
    "zone_4": 150,
    "zone_5": 160,
    "resting": 90,
    "created_at": "2018-10-23T20:39:41.000Z",
    "updated_at": "2018-10-24T22:22:23.000Z",
    "maximum": 180
}
```

Updates the heart rate zone record of the authenticated user.

### HTTP Request

`PUT https://api.wahooligan.com/v1/power_zone`

### Parameters

Parameter                  | Type     | Required | Description
-------------------------- | -------- | -------- | -----------
heart_rate_zone[zone_1]    | Number   | no       | Zone 1
heart_rate_zone[zone_2]    | Number   | no       | Zone 2
heart_rate_zone[zone_3]    | Number   | no       | Zone 3
heart_rate_zone[zone_4]    | Number   | no       | Zone 4
heart_rate_zone[zone_5]    | Number   | no       | Zone 5
heart_rate_zone[resting]   | Number   | no       | Resting heart rate
heart_rate_zone[maximum]   | Number   | no       | Maximum heart rate
