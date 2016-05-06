# Errors

<aside class="notice">All GoRaise API responses use industry standard HTTP response codes to match their response type.</aside>

The GoRaise API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The data requested is hidden for administrators only
404 | Not Found -- The specified data could not be found
405 | Method Not Allowed -- You tried to access data with an invalid method
406 | Not Acceptable -- You requested a format that isn't offered
410 | Gone -- The data requested has been removed from our servers
418 | I'm a teapot
429 | Too Many Requests -- You're requesting too much data! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
