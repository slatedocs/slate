## Get Authenticated User

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/user
```

> Sample Response:

``````json
{
  "id": 60462,
  "height": "2.0",
  "weight": "80.0",
  "first": "Bob",
  "last": "Smith",
  "email": "sample@test-domain.com",
  "mobile": null,
  "birth": "1980-10-02",
  "gender": 1,
  "heart_rate_zone":
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
    },
  "power_zone":
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
    },
  "created_at": "2018-10-23T15:38:23.000Z",
  "updated_at": "2018-10-24T20:46:40.000Z"
}
```

Returns the authenticated user along with power and heart rate zone records.

### HTTP Request

`GET https://api.wahooligan.com/v1/user`

