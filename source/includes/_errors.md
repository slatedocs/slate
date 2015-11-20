# Errors

<aside class="notice">The general format for errors returned by the API.</aside>

Slyce API uses the following error codes:

> Error response returned:

```json
{
  "error": 
  {
    "code": "GEN-NOT-FOUND",
    "http_code": 404,
    "message": "Resource Not Found"
  }
}
```


Error Code | Meaning
---------- | -------
400 | Bad Request -- Wrong arguments or parameters
401 | Unauthorized -- Your API key is invalid
403 | Forbidden -- The resource requested is hidden for administrators only
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- You tried to access a resource with an invalid method
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
