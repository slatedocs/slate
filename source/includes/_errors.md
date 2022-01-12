# Errors

> Example 401 response:

```json
{
    "errors": [
        {
            "title": "Invalid authentication details",
            "status": 401,
            "code": "invalid_authentication"
        }
    ]
}
```

The HandsHQ API uses the following error codes:

There may be additional info given in the error in order to help fix the issue, for example if you have reached your limits of document creation.

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Your API token is wrong.
404 | Not Found -- The specified resource could not be found.
418 | I'm a teapot.
422 | The resource cannot be processed with the given request parameters
500 | Internal Server Error -- We had a problem with our server. Try again later.
