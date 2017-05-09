# Errors

> The API returns structured errors that look like:

```shell
{
    "id": "error_id",
    "message": "Error description",
    "url": "More detailed information about how to resolve the error"
}
```


The API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- The input in the request is invalid. Check error message and URL for help fixing the request.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
