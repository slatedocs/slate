# Authentication

## Authenticate a user

<aside class="notice">
You still need to send an [`Authorization` header](#authorization)
including an OAuth token when making requests to the Authentication API.
</aside>

Given a user whose username is `json_vanlue` and password is `brandingmatters`.

```shell
curl "https://www.codeschool.com/api/v1/authenticate"
  -H "Authorization: OAuth poopoopoo"
  -d "login=json_vanlue&password=brandingmatters"
```

> The above command returns JSON structured like this:

```json
{ "token": "W3To8xgVLWa44ykvL6QisB0fvoP4fDEpJmAuFgwh" }
```

This `token` is an OAuth Token you can use to make queries on
behalf of the user — for instance to the Course API in order to obtain
course videos only accessible to paying users.

Note that a `422 — Unprocessable Entity` status code will be returned in
the following cases:
- no credential parameters were sent
- the password doesn't match the login being sent

The purpose is to avoid leaking existing user emails and usernames through
the API endpoint. That said, we currently leak this information through
JavaScript validation on the website account sign up form.

### HTTP Request

`POST https://www.codeschool.com/api/v1/authentication`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
login     | yes      | The username or email of the user to authenticate
password  | yes      | The password of the user to authenticate

<aside class="warning">
If you use an email address for the `login` parameter, you need to URL
encode it: `salt+lick@yum.com` would become `salt%2Blick%40yum.com`.
</aside>
