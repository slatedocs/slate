# Errors

> The API returns structured errors that look like:

```json
{
    "id": "error_id",
    "message": "Error description",
    "url": "More detailed information about how to resolve the error"
}
```


The API uses the following error codes:


Error Code | Meaning
---------- | -------
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
