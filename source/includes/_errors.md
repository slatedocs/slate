# Errors

The go~mus API uses the following error codes:


Error Code | Meaning
---------- | -------
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The API endpoint requested is for administrators only
404 | Not Found -- The specified record could not be found
405 | Method Not Allowed -- You tried to access an API endpoint with an invalid method
429 | Too Many Requests -- You're requesting too much! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
