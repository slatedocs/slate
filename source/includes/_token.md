# Token

## Refresh

```shell
curl --data-binary '{"id":1, "method":"token.Refresh", "params":"refresh_token", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer jwt_access_token'
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
	"id": 1
}
```

Regenerates a new JWT access token for the client.

<aside class="notice">
When a new JWT access token is generated, previous tokens get invalidated.
</aside>

### HTTP Request

`POST https://api.sec.filtered.com/v2/jsonrpc/mgp`

### Parameters

Type | Description
------- | -----------
 string | the refresh_token extractable from the JWT access token

<aside class="success">
Returns — Access Token Model — structure containing the JWT access token and refresh token
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32003 | Mandatory JWT Claim missing
-32020 | Refresh token has expired
-32606 | Invalid arguments
-32603 | Internal Server Error
