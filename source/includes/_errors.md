# Errors

> Here is an example API error in JSON Format:

```json
{
  "status": 400,
    "errors": [
    {
      "message": "Bad Request"
    }
  ]
}
```

The Buttercoin API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request was malformed in some way
401 | Unauthorized -- The supplied authentication is invalid
403 | Forbidden -- The supplied authentication is not authorized to access this resource
404 | Not Found -- The specified endpoint could not be found
405 | Method Not Allowed -- You tried to access an endpoint with an invalid HTTP method
406 | Not Acceptable -- You requested a format that isn't json
415 | Unexpected Content Type -- There was a problem with the request's Content-Type 
420 | Enhance your calm -- We don't actually throw this error, it just seems like good advice
429 | Too Many Requests -- You have exceeded your request limit
500 | Internal Server Error -- Unexpected error handling API request. Please try again.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.












..

..

..

..

..

..

..

..

..

..

..

..

..

..

..
