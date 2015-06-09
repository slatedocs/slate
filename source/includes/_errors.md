# Errors

The API follows HTTP Status Codes for error handling. As a body again JSON is returned. The "message" will provide more information about the specific error.


The API uses the following error codes:

> example error response:

```json
{
    "success": false,
    "message": "Forbidden, your auth token seems to be invalid"
}
```


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request was malformed
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The entity requested is hidden for administrators only
404 | Not Found -- The specified entity could not be found
405 | Method Not Allowed -- You tried to access a entity with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
410 | Gone -- The entity requested has been removed from our servers
418 | I'm a teapot
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
