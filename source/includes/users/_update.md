## Update User

Requires the `user_write` scope

```shell
curl --header "Authorization: Bearer users-token-goes-here"
     -X PUT -d user[gender]=1 https://api.wahooligan.com/v1/user
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
  "birth": "1980-10-02",
  "gender": 1,
  "created_at": "2018-10-23T15:38:23.000Z",
  "updated_at": "2018-10-24T20:46:40.000Z"
}
```

Updates the current authenticated user.


### HTTP Request

`PUT https://api.wahooligan.com/v1/user`

###  Parameters

Parameter    | Type    | Required | Description
---------    | ----    | -------- | -----------
user[email]  | String  | no       | Well formed email address, must be unique in the system
user[first]  | String  | no       | First name
user[last]   | String  | no       | Last name
user[height] | Decimal | no       | Height in meters
user[weight] | Decimal | no       | Weight in kilograms
user[birth ] | Date    | no       | Date of birth formatted as YYYY-MM-DD
user[gender] | 0,1,2,3 | no       | Use 0 for male, 1 for female, 2 for other, and 3 for prefer not to say



