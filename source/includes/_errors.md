# Errors

The TradeGecko API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
402 | Payment Required -- Your subscription has lapsed
403 | Forbidden -- The resource requested is hidden for administrators only
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- We currently support GET, PUT, POST, PATCH and DELETE
406 | Not Acceptable -- You requested a format that isn't json
422 | Unprocessable Entity -- There was an issue parsing your json
429 | Too Many Requests -- You are allowed 300 requests per 300 seconds.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable (Time out) -- The server is overloaded or down for maintenance.
