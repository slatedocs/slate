# Error Codes

The invoicing.services API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Check your request parameters.
401 | Unauthorized -- Check your API key
403 | Forbidden -- The requested object is hidden for administrators only
404 | Not Found -- Your API key is valid but there is no related user on our servers.
405 | Method Not Allowed -- You tried to access with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
410 | Gone -- The requested object has been removed
418 | I'm a teapot
429 | Too Many Requests -- Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
