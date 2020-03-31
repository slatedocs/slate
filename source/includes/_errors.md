# Errors

The SynBioHub API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- The server could not understand the request due to invalid syntax. 
401 | Unauthorized -- This endpoint is reserved for valid users only.
403 | Forbidden -- The currently logged in user is not authorized to this endpoint.
404 | Not Found -- The requested resource could not be found.
409 | Conflict -- This response is sent when a request conflicts with the current state of the server.
422 | Unprocessable Entity -- The request was well-formed but was unable to be followed due to semantic errors. 
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- The server is not ready to handle the request.
