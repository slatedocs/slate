# Errors

The SimplyPrint API uses the following HTTP error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Your API key is wrong.
403 | Forbidden -- Request not allowed.
404 | Not Found -- Endpoint not found.
405 | Method Not Allowed -- You tried to access an endpoint with an invalid method.
406 | Not Acceptable -- You requested a format that isn't json.
410 | Gone -- The endpoint requested has been removed from our servers.
429 | Too Many Requests -- You're requesting too much - slow down
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

## Error Response

> Error response example:

```json
{
  "status": false,
  "message": "No API key provided, or not logged in"
}
```

When an error occurs, the API will return a JSON object with the following fields:

Field | Description | Type
----- | ----------- | ----
status | The status of the request | Boolean
message | A message describing the error | String|null
