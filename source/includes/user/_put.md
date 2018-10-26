## Update User

```shell
curl --header "Authorization: Bearer users-token-goes-here"
     -X PUT -d user[mobile]=7704106437 https://api.wahooligan.com/v1/user
```

> The above command returns JSON structured like this:

``````json
{
    "height": "2.0",
    "weight": "80.0",
    "id": 60462,
    "first": "Bob",
    "last": "Smith",
    "email": "bob.s@wahoofitness.com",
    "mobile": "7704106437",
    "created_at": "2018-10-23T15:38:23.000Z",
    "updated_at": "2018-10-24T20:46:40.000Z",
    "birth": "1980-10-02",
    "gender": 1
}
```

Updates the current authenticated user.

### HTTP Request

`PUT http://api.wahooligan.com/v1/user`

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



