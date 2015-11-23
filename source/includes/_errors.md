# Errors

The Soloshot Cloud API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is bad - see error response for details.
401 | Unauthorized -- Your X-Auth-Token is missing, expired, or invalid.
403 | Forbidden -- You do not have access to the requested endpoint.
404 | Not Found -- The specified resource could not be found.
422 | Unprocessable Entity -- The process failed - see error response for details.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- An external service is down. Try again later.
