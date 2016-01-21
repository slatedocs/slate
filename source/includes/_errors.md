# Errors

## Error codes

Mifiel API uses the following error codes:

Error Code      | Meaning
--------------- | -------
400 | Bad Request -- Your request had an error. (more info in the `errors` response param)
401 | Unauthorized -- Your authorization header is wrong.
402 | Payment Required -- Your request requires a paid plan. If you already have a plan, it may have expired.
404 | Not Found -- The specified object could not be found.
405 | Method Not Allowed -- You tried to access an invalid method.
406 | Not Acceptable -- You requested a format that isn't supported.
410 | Gone -- The requested object has been removed from our servers.
422 | Unprocessable Entity -- Something happened when we tried to save your request.
429 | Too Many Requests -- You're making too many requests! Slow down!
500 | Internal Server Error -- We had a problem in our servers. Please try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

## Error Handling

All errors follow the [JSend](http://labs.omniti.com/labs/jsend) specification. Following are examples of error objects found in the body of error responses (_e.g. non-200 status code_).

### When a client sends an unexpected request:

> JSON Example __fail__ response:

```json
  {
    "status": "fail",
    "errors": [
      "Document#29f3cb01-744d-4eae-8718-213aec8a1678 not found"
    ]
  }
```

Field   | Type    |  Description
------- | ------- | ------------
status  | String  | `fail`
errors  | Array   | Array of error messages

### For server errors:

> JSON Example __error__ response:

```json
  {
    "status": "error",
    "message": "500: Internal Server Error" 
  }
```

Field   | Type    |  Description
------- | ------- | ------------
status  | String  | `error`
message | String  | A descriptive message
