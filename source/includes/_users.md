# Users

## Get current User

Given a `token` you obtain from using the Authentication endpoint,
you can query the User endpoint in order to obtain data about this user.

```shell
curl "https://www.codeschool.com/api/v1/user"
  -H "Authorization: OAuth token_from_authentication_endpoint"
```
> The above command returns JSON structured like this:

```json
{
  "user": {
    "twitter_name": talonpowthesecond,
    "name": "Talon Powlowski II",
    "id": 4,
    "email": "saul@oberbrunnerbosco.net",
    "username": "Retta1"
  }
}
```

This endpoint retrieves the current User.

### HTTP Request

`GET https://www.codeschool.com/api/v1/user`

### Query Parameters

None.



## Reset Password for a User

Given a `login` which could either be the user's `username` or the
`email` address associated with their account.

```shell
curl "https://www.codeschool.com/api/v1/users/<username>/reset_password"
  -d
  -H "Authorization: OAuth poopoopoo"
```
> The above command doesn't return any body.

This endpoint sends a reset password to a single User.

### HTTP Request

`POST https://www.codeschool.com/api/v1/users/<username>/reset_password`

### Query Parameters

None.
