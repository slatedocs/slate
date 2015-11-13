# Errors

LocalStack API uses the following error codes:


Error Code | Meaning
---------- | -------
401 | Unauthorized -- Your API key is wrong or not provided
403 | Forbidden -- The API key does not have access to the requested action or your subscription has elapsed.
404 | Not Found –- The requested action does not exist.
408 | Request Timeout –- The request took too long to complete on our side. Please reduce the amount of information you are requesting, or try again later.
429 | Too Many Requests -- You have exceeded your provisioned rate limit. If this becomes a regular occurrence, please contact us to have your rate limit increased.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
