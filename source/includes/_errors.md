# Errors

The Sunlight API uses the following error codes:


Code | Meaning
---------- | -------
200 | Ok -- The request was successful.
201 | Created -- The resource was successfully created.
202 | Accept -- The resource was asynchronously created
204 | No Content - The server successfully processed the request and is not returning any content.
400 | Bad Request -- Your request sucks.
401 | Unauthorized -- Your API key is wrong.
403 | Forbidden -- The requested is hidden for administrators only.
404 | Not Found -- The specified kitten could not be found.
422 | Unprocessable Entity -- The request was well-formed but was unable to be followed due to semantic errors.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
