# Errors

The DirtyLemon API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request
401 | Unauthorized -- The request has not been applied because it lacks valid authentication credentials for the target resource.
403 | Forbidden -- The server understood the request but refuses to authorize it.
404 | Not Found -- The specified resource could not be found.
404 | Routing Error --	Nothing exists at this endpoint.
422 | Record Invalid	-- The request was unacceptable, all required parameters are present, but some parameters are invalid.
422 | Record Not Unique --	The request was unacceptable due to a non-unique attribute.
422 | Parameter Missing	-- The request was unacceptable due to missing a required parameter.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
