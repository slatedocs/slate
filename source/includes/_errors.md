# Errors

The Yoyo Wallet API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request - A required parameter is missing, or the submitted data is invalid
401 | Unauthorized - No valid API key provided (ie you can’t be authenticated)
403 | Forbidden - Request is not authorised (eg you don’t have permission to perform this action).
404 | Not Found - Could not find the resource requested
405 | Method Not Allowed -- Request with an invalid method
415 | Unsupported media type - Request has invalid content-type header
429 | Too many requests - Rate limiting
500 | Server error - Unanticipated server error
503 | Service unavailable - If the service is down for maintenance
