## Get Heart Rate Zones

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/heart_rate_zone
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
    "resting": 100,
    "maximum": 180,
    "created_at": "2018-10-23T20:39:41.000Z",
    "updated_at": "2018-10-24T22:22:23.000Z"
}
```

Returns the heart rate zone record for the authenticated user.

### HTTP Request

`GET https://api.wahooligan.com/v1/heart_rate_zone`

