# Errors

The SynBioHub API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Server cannot or will not process the request due to something that is perceived to be a client error
401 | Unauthorized -- This endpoint is reserved for valid users only.
403 | Forbidden -- The endpoint is hidden for administrators only.
404 | Not Found -- The specified endpoint could not be found.
405 | Method Not Allowed -- You tried to access a endpoint with an invalid method.
406 | Not Acceptable -- You requested a format that isn't json.
410 | Gone -- The endpoint requested has been removed from our servers.
422 | Unprocessable Entity -- Unable to be processed. 
429 | Too Many Requests -- You're requesting too many endpoints! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
