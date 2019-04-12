## Update User

```shell
curl --header "Authorization: Bearer users-token-goes-here"
     -X PUT -d user[mobile]=7704106437 https://api.wahooligan.com/v1/user
```

> Sample Response:

``````json
{
  "id": 60462,
  "height": "2.0",
  "weight": "80.0",
  "first": "Bob",
  "last": "Smith",
  "email": "bob.s@wahoofitness.com",
  "mobile": "7704106437",
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

Updates the current authenticated user.

<aside class="notice">
  There are separate endpoints for updating power and heart rate zones.
</aside>

### HTTP Request

`PUT https://api.wahooligan.com/v1/user`

###  Parameters

Parameter    | Type    | Required | Description
---------    | ----    | -------- | -----------
user[email]  | String  | no       | Well formed email address, must be unique in the system
user[first]  | String  | no       | First name
user[last]   | String  | no       | Last name
user[mobile] | String  | no       | Mobile number
user[height] | Decimal | no       | Height in meters
user[weight] | Decimal | no       | Weight in kilograms
user[birth ] | Date    | no       | Date of birth formatted as YYYY-MM-DD
user[gender] | 0 or 1  | no       | Use 0 for male, 1 for female



