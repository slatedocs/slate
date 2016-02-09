# Authentication

> To authorize, use this code:

```http
POST /api/auth HTTP/1.1
Host: bizongo.in
Content-Type: application/json
Secret-Token: YOUR SECRET KEY
Authorization: YOUR EMAIL AND PASSWORD BASE 64 ENCODED
```

> Make sure to send `Secret-Token` and `Authorization` with your client secret and basic authorization respectively. These are the success responses for both `User` and `Admin` APIs

```http
HTTP/1.1 200 OK
Content-Type: application/json
{ "auth_token": "User_auth_token" }
```

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "auth_token": "Admin_User_auth_token",
  "name": "Admin Full Name"
}
```

Bizongo uses a secret token to allow access to the API and sends back an Auth Token which can then be used to access APIs. You can check our client secret key in config/secrets.yml.example according to environment or contact Bizongo Admin about issues.

Bizongo expects the header `Secret-Token` to be included in headers along with `Authorization`

`Secret-Token: YOUR SECRET KEY`

`Authorization: YOUR EMAIL AND PASSWORD BASE 64 ENCODED`
