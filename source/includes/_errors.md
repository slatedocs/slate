# Errors

Chartboost APIs use the following error codes:

Error Code | Meaning
---------- | -------
400 | **Bad Request** -- Your request is formatted incorrectly or contains bad values.
403 | **Forbidden** -- You have supplied an incorrect signature or are using an invalid API token.
404 | **Not Found** -- The resource could not be found.
405 | **Method Not Allowed** -- You are using an invalid HTTP method for the resource.
500 | **Internal Server Error** -- We had a problem with our server. Try again later.
503 | **Service Unavailable** -- We're temporarily offline for maintenance. Please try again later.

If your call receives a `5xx` HTTP error code, your server should retry the request using an exponential back-off: Try again in 5 seconds, then 10 seconds, then 20 seconds, then 40 seconds, etc.. Set a max number of retries or TTL that can accomodate temporary server outages (recommended: 24 hour TTL).
