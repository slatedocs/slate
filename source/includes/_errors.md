# Errors

The Code School API uses the following error codes:


Error Code | Status | Meaning
---------- | ------ | -------
400 | Bad Request           | Malformed request syntax.
401 | Unauthorized          | Wrong or missing OAuth token
404 | Not Found             | The resource you're trying to fetch doesn't exist
406 | Not Acceptable        | You requested a format we don't return, we only return JSON.
422 | Unprocessable Entity  | The request is properly formatted but can't be satisfied.
500 | Internal Server Error | We had a problem with our server. Try again later.
503 | Service Unavailable   | We're temporarially offline for maintenance. Try again later.
