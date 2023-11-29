# Errors

<aside class="notice">
  Encountering errors is a natural part of interacting with the Esoko's APIs. This section provides insights into the various error codes you might encounter and their meanings. Understanding these codes will help you troubleshoot and enhance your integration experience.
</aside>


Error  Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid. Please check the parameters and try again.
401 | Unauthorized -- Your API key is incorrect. Ensure you are using a valid API key in the request header.
403 | Forbidden -- The requested resource is restricted. Please contact the administrator for access.
404 | Not Found -- The specified resource could not be found. Double-check your parameters.
405 | Method Not Allowed -- You tried to access the resource with an invalid method. Please use a valid HTTP method.
406 | Not Acceptable -- You requested a format that isn't JSON. Ensure your request accepts JSON.
410 | Gone -- The requested resource has been removed from our servers.
429 | Too Many Requests -- You're requesting resources too frequently! Please slow down.
500 | Internal Server Error -- We had a problem with our server while processing your request. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

