## Get Authenticated User

Requires `user_read` scope

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
  "birth": "1980-10-02",
  "gender": 1,
  "created_at": "2018-10-23T15:38:23.000Z",
  "updated_at": "2018-10-24T20:46:40.000Z"
}
```

Returns the authenticated user along with email if email scope is included.

### HTTP Request

`GET https://api.wahooligan.com/v1/user`

