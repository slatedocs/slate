# Errors

<aside class="notice">These errors have evolved with the API's and business' requirements. Verify these errors frequently</aside>

The DNA API uses the following error codes:


Error Code | Description
--------- | -----------
400 | Bad Request – Your request sucks!
401	| Unauthorized – Your token key is wrong or has expired.
403	| Forbidden – The object requested is hidden for your Scope.
404	| Not Found – The specified object could not be found, invalid URL.
405	| Method Not Allowed – You tried to access an object with an invalid method.
406	| Not Acceptable – You requested an invalid parameter or your parameters are not validated.
410	| Gone – The object you requested has been removed from our servers.
418	| Undefined Error.
429	| Too Many Requests – You’re making too much requests! Slow down!
500	| Internal Server Error – We had a problem with our server. Try again later.
503	| Service Unavailable – We’re temporarily offline for maintenance. Please try again later.
