# User Token Authentication

> To get a user token, use this code:


```shell
curl -X POST \
  https://api.chekin.io/api/v1/users/token/create/ \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'content-type: multipart/form-data;' \
  -F email=usersemail@domain.com \
  -F password=userspassword
```

> The above command returns JSON structured like this:

```json
  {
    "auth_token": "yourUserTokenHere"
  }
```

> Make sure to replace `yourApiKeyhere` with your API key in headers.

To act in behalf of a CheKin user through the CheKin API, and access to his data, you will need to generate a user token. 
To get a token do a `POST` to the tokens endpoint at `https://api.chekin.io/api/v1/users/token/create/` sending user email and password and you will get the token as response. 

CheKin expects for the user token to be included in all authenticated API requests to the server in a header that looks like the following:

`Authorization: Token yourUserTokenHere`

<aside class="notice">
You must replace <code>yourUserTokenHere</code> with your user token.
</aside>
