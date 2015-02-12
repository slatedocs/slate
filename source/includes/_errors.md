# Errors

The Tether API uses the following error codes:


Code | Meaning
---------- | -------
400 | Bad Request -- Your request is corrupted or misses required parameters
401 | Unauthorized -- Authorization header is malformed (API key is wrong / missing)
403 | Forbidden -- API key doesn't have required permission for this request (see <a href="#permissions">permissions</a>)
404 | Not Found -- The specified action could not be found
405 | Method Not Allowed -- You tried to access an action with an invalid method
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.