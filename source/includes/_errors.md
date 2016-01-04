# Errors

Bingo API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is malformed
401 | Unauthorized -- Your credential is wrong
403 | Forbidden -- You don't have permission to access the resource
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- You tried to access a resource with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
409 | Conflict -- The resource you sent is already exist
429 | Too Many Requests -- You're requesting too many kittens! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.

## Error Object
Every api response with error status code will have a response body that tells more detail about the error.
The error has following format :

Attribute | Format | Description
--------- | ------ | -----------
type | String | TBD
code | String | TBD
param | String | TBD
message | String | A human-readable providing details about the error. These message can be shown to your users.

> Error body example

```
{
	"type": "",
	"code": "",
	"param": "",
	"message": "Card(s) not found"
}
```
