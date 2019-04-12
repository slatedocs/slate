## Get Power Zones

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/power_zone
```

> Sample Response:

``````json
{
    "id": 56785,
    "zone_1": 95,
    "zone_2": 105,
    "zone_3": 115,
    "zone_4": 125,
    "zone_5": 135,
    "zone_6": 145,
    "zone_7": 155,
    "ftp": 190,
    "zone_count": null,
    "created_at": "2018-10-23T15:38:23.000Z",
    "updated_at": "2018-10-24T22:02:44.000Z"
}
```

Returns the power zone record for the authenticated user.

### HTTP Request

`GET https://api.wahooligan.com/v1/power_zone`


