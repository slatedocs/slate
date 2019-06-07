# User

## Authenticate

```shell
curl --data-binary '{"id":"1", "method":"user.Authenticate", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 client.genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"jwt_access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiJiYmJuN2x2YXRhYWcwMjZpdjJtZyIsIk9yZ0lEIjoiZmlsdGVyZWQiLCJHcm91cElEIjoiZmlsdGVyZWQtZ2xvYmFsZmlsdGVyIn0.e7A_2EQLwS3v7dOVTq0I5afjnmSWYfqmBngFOlRsaJI",
		"refresh_token": "wZk2AnHuCuMplJ2P52a3hK0nZ2CfnQEWH1jLR7Nk"
	},
	"id": "json"
}
```

Authenticates the user and generates an access token and a refresh token.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/auth`

<aside class="success">
Returns — Access Token Model — structure containing the JWT access token and refresh token
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object

## Refresh

```shell
curl --data-binary '{"id":"1", "method":"user.Refresh", "params":"boBCItwS5gvkXgmdJ0vJm7qs2EEgqNV7LVzrY13A", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer refresh_token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"jwt_access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiJiYmJuN2x2YXRhYWcwMjZpdjJtZyIsIk9yZ0lEIjoiZmlsdGVyZWQiLCJHcm91cElEIjoiZmlsdGVyZWQtZ2xvYmFsZmlsdGVyIn0.e7A_2EQLwS3v7dOVTq0I5afjnmSWYfqmBngFOlRsaJI",
		"refresh_token": "wZk2AnHuCuMplJ2P52a3hK0nZ2CfnQEWH1jLR7Nk"
	},
	"id": "json"
}
```

Regenerates a new JWT access token for the client.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/auth`

### Parameters

Type | Description
------- | -----------
 string | the refresh_token which was issued by `user.Refresh` method

<aside class="success">
Returns — Access Token Model — structure containing the JWT access token and refresh token
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32003 | Mandatory JWT Claim missing
-32019 | Token has expired
-32020 | Refresh token has expired
-32606 | Invalid arguments
-32600 | The JSON sent is not a valid Request object
-32603 | Internal Server Error

