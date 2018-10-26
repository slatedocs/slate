## Get User

```shell
curl --header "Authorization: Bearer users-token-goes-here" https://api.wahooligan.com/v1/user
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
    "mobile": null,
    "created_at": "2018-10-23T15:38:23.000Z",
    "updated_at": "2018-10-24T20:46:40.000Z",
    "birth": "1980-10-02",
    "gender": 1
}
```

Returns the current authenticated user.

### HTTP Request

`GET http://api.wahooligan.com/v1/user`

