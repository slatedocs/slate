# Authentication

> Example request access_token with `client_credentials` grant

```shell
curl http://103.29.150.136:80/bingo-alpha/oauth/token
	-u serverClientId:
	-d "grant_type=client_credentials"
```

> Example response access_token with `client_credentials` grant

```shell
{
  "access_token": "d42b1074-881c-4ea1-a42c-36ba3c40fac4",
  "token_type": "bearer",
  "expires_in": 3599,
  "scope": "write"
}
```

> Example request access_token with `password` grant

```shell
curl http://103.29.150.136:80/bingo-alpha/oauth/token
	-u serverClientId:
	-d "grant_type=client_creedntials&username=users_username&password=users_password"
```

> Example response access_token with `password` grant

```shell
{
  "access_token": "4e959195-3b1e-4e0d-bcb0-be11bacdc684",
  "token_type": "bearer",
  "refresh_token": "9df5b973-74c3-42fe-a501-9b090072fe6c",
  "expires_in": 3599,
  "scope": "write"
}
```

> Make sure to replace `serverClientId` and the blank password with yours. 
Also make sure to replace `users_username` and `users_password` with your users credential.

Bingo API uses [OAuth 2](https://tools.ietf.org/html/rfc6749) to authenticate and authorize access to the API. Therefore, to access the API, you need to have `Client Id` and  `Client Secret` to obtain access_token. You need to provide access_token in each request for our resources. You can get those credential by register at our [developer portal](http://example.com/developers).

Bingo API leverages two type of OAuth 2 grant_type : `client_credentials` and `password` grant. You will use `client_credentials` grant to register a new **merchant** or **customer**. If you want to access resources belong to either **merchant** or **customer**, you will use `password` grant.

<aside class="notice">
We will only put a note on resources that you must provide acces_token obtained using <code>client_credentials</code> because they are fewer. Otherwise, the resource must be accessed using <code>password</code> grant access_token.
</aside>