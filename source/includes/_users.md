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

## User Sign Up

```shell
curl "https://www.codeschool.com/api/v1/users"
  -H "Authorization: OAuth poopoopoo"
  -d "user[email]=ada@lovelace.com&[user]password=bernouli"
```
> The above command returns JSON structured like this:

```json
{
  "user": {
    "id": 47,
    "email": "ada@lovelace.com",
    "twitter_name": null,
    "name": "ada@lovelace.com",
    "username": null,
    "token": "OAKCnKYoWP8amckAxHZ2KitlkRJQpLb0aV6YDHxI"
  }
}
```

This endpoint creates a User and returns it.

### HTTP Request

`POST https://www.codeschool.com/api/v1/users`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
user[email] | Yes | The prospective user's email address.
user[password] | Yes | The prospective user's password (must be longer than 6 characters).

## Reset Password for a User

Given a `login` which could either be the user's `username` or the
`email` address associated with their account.

```shell
curl "https://www.codeschool.com/api/v1/users/<login>/reset_password"
  -d
  -H "Authorization: OAuth poopoopoo"
```
> The above command doesn't return any body.

This endpoint sends a reset password to a single User.

### HTTP Request

`POST https://www.codeschool.com/api/v1/users/<username>/reset_password`

### Query Parameters

None.
