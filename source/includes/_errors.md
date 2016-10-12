## Errors

> Response

```json
{
	"responseCode": 500,
	"error": {
		"code": 5000,
		"message": "your request could not be completed"
	}
}
```

### HTTP Codes
| HTTP Code							 | Description |
| ------------ |------------------------------------------|
| 200 OK	| The request was successful, we updated/created the resource and the responded body contains the representation. |
| 204 OK DELETED	| The request was successful; the resource was deleted. |
| 400 BAD REQUEST | The data given in the POST or PUT failed validation. Inspect the response body for details. |
| 401 UNAUTHORIZED	| The supplied credentials, if any, are not sufficient to create or update the resource.	|
| 402 REQUEST FAILED	| The parameters were valid but the request failed. |
| 404 NOT FOUND | Not found (or unauthorized).	|
| 405 METHOD NOT ALLOWED	| You can't POST or PUT to the resource.	|
| 429 TOO MANY REQUESTS | Your application is sending too many simultaneous requests. |
| 500 SERVER ERROR	| We couldn't create or update the resource. Please try again.	|
