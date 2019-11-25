# Errors

The SynBioHub API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
403 | Forbidden -- The endpoint is hidden for administrators only.
404 | Not Found -- The specified endpoint could not be found.
405 | Method Not Allowed -- You tried to access a endpoint with an invalid method.
406 | Not Acceptable -- You requested a format that isn't json.
410 | Gone -- The endpoint requested has been removed from our servers.
418 | I'm a teapot.
429 | Too Many Requests -- You're requesting too many endpoints! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
