# Errors

The Constructor.io API uses the following error codes across all requests:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid
401 | Unauthorized -- Your API token is wrong
403 | Forbidden -- You are not authorized to access the requested resource
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- You tried to access a resource with an invalid method
429 | Too Many Requests -- You're making too many requests
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
