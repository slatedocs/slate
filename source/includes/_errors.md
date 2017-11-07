# Errors

The Kudos Client API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request contained invalid data. The Error message should explain why.
401 | Unauthorized -- Your API key is wrong/invalid.
403 | Forbidden -- The request is out of scope for your API key.
406 | Not Acceptable -- You requested a format that isn't json.
429 | Too Many Requests -- You're making too many requests! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
