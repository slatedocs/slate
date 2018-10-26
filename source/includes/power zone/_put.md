## Update Power Zone

```shell
curl --header "Authorization: Bearer users-token-goes-here"
     -X PUT -d power_zone[ftp]=195 https://api.wahooligan.com/v1/power_zone
```

> The above command returns JSON structured like this:

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
    "ftp": 195,
    "zone_count": null,
    "created_at": "2018-10-23T15:38:23.000Z",
    "updated_at": "2018-10-24T22:02:44.000Z"
}
```

Updates the current authenticated user.

### HTTP Request

`PUT http://api.wahooligan.com/v1/power_zone`

### Parameters

Parameter              | Type    | Required | Description
---------------------- | ----    | -------- | -----------
power_zone[zone_1]     | Number  | no       | Zone 1
power_zone[zone_2]     | Number  | no       | Zone 2
power_zone[zone_3]     | Number  | no       | Zone 3
power_zone[zone_4]     | Number  | no       | Zone 4
power_zone[zone_5]     | Number  | no       | Zone 5
power_zone[zone_6]     | Number  | no       | Zone 6
power_zone[zone_7]     | Number  | no       | Zone 7
power_zone[ftp]        | Number  | no       | FTP (Functional Threshold Power)
power_zone[zone_count] | Number  | no       | Zone Count, the number of zones supported for this user



