# Errors

Bad requests receive an HTTP `4xx` response with a `message` describing the error.

Code | Description
---------- | -------
401 | Unauthorized – Authentication error
402 | Failed Request
403 | Forbidden
404 | Resource Not Found
422 | Unprocessable Entity – there was an issue parsing your request
429 | Rate Limit Exceeded – too many requests
5xx | Internal Server Error – there was a problem with our servers

If the request is successful, a `200` (OK) status code is returned, along with an optional body as documented in this API reference.