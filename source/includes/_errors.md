# Errors

Recruiterbox API uses standard HTTP response codes to indicate success or failure of an API request.

HTTP Code | Meaning
---------- | -------
200 | OK - Request was successful
201 | Created - The resource was created successfully.
204 | No Content - In case of DELETE request, resource was deleted
400 | Bad Request -- Often missing a required parameter or specifying a wrong parameter
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The resource requested is hidden for administrators only
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- You tried to access a resource with an invalid method
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
