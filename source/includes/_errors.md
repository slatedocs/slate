# Errors


The CheKin API uses the following error codes:

Also, in errors of type 400, extra details will be returned in JSON.

Error Code | Meaning
---------- | -------
400 | Bad Request -- Some validation has failed. Check error details and fix any issues in your data.
401 | Unauthorized -- Your user token is wrong or you don't have permissions over the resource targeted.
403 | Forbidden -- Your API Key is wrong.
404 | Not Found -- The resource could not be found. Check the provided ID.
405 | Method Not Allowed -- You tried to access a resource with an invalid method (POST / GET / PUT / PATCH).
406 | Not Acceptable -- You requested a format that isn't json nor multipart.
429 | Too Many Requests -- Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
