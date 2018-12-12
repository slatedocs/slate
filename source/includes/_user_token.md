# Signup & get a Token

> To get a user token, use this code:


```shell
curl -X POST \
  https://api.chekin.io/api/v1/users/tools/signup/ \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "testing@chekin.io",
    "password": "mypassword123"
  }'
```

> The above command returns JSON structured like this:

```json
  {
      "id": 1257,
      "email": "testing@chekin.io",
      "language": "es",
      "token": "c7901b5d947541a1c870d472b644cf9ee5945e37"
  }
```

To get your token and start using the API you will need to signup with an email and password. 

### HTTP Request

`POST https://api.chekin.io/api/v1/users/tools/signup/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
email | true | A valid email.
password | true | A password for your account.

CheKin expects for the user token to be included in all authenticated API requests to the server in a header that looks like the following:

`Authorization: Token c7901b5d947541a1c870d472b644cf9ee5945e37`


