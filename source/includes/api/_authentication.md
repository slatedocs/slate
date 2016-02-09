# Authentication

> To authorize, use this code:

```http
POST /api/auth HTTP/1.1
Host: bizongo.in
Content-Type: application/json
Secret_token: Your_Client_Secret
Authorization: Your_Email_and_Password_base_64
```

> Make sure to replace `Your_Client_Secret` and  `Your_Email_and_Password_base_64` with your client_secret and basic authorization respectively. This is the success response for both user and admin apis

```http
HTTP/1.1 200 Ok
Content-Type: application/json
{
  "auth_token": "User_auth_token"
}
```
```http
HTTP/1.1 200 Ok
Content-Type: application/json
{
  "auth_token": "Admin_User_auth_token"
  "name": "Admin Full Name"
}
```

Bizongo uses secret-token to allow access to the Api  and sends back an Auth Token which can then be used to access APIs. You can check our client secret key in config/secrets.yml.example according to environment or contact Bizongo Admin about issues.

Bizongo expects 'secret-token' to be included in headers along with 'Authorization'  


`SECRET_TOKEN: Your_Client_Secret`

`Authorization: Your_Email_and_Password_base_64`


<aside class="notice">
You must replace <code>Your_Client_Secret</code> and <code>Your_Email_and_Password_base_64</code> with your client secret and email password respectively.
</aside>
