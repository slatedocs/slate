# Errors

<aside class="notice">
  Errors are returned as HTTP response status codes
</aside>

The Wahoo Fitness API uses the following error codes:

Code | Meaning
---------- | -------
400     | Bad Request -- Your request is invalid.
401     | Unauthorized -- Your API key is wrong.
403     | Forbidden -- You do not have access to the specified resource.
404     | Not Found -- The specified resource could not be found.
405     | Method Not Allowed -- You tried to access a resource with an invalid method.
406     | Not Acceptable -- You requested a format that isn't json.
410     | Gone -- The resource requested has been removed from our servers.
422     | Unprocessable Entity -- One or more parameters supplied are missing or invalid or your app is not approved.
429     | Too Many Requests -- You are sending too many requests in short period of time.
500     | Internal Server Error -- We had a problem with our server. Try again later.
503     | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
