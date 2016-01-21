# Errors

## Error codes

Mifiel API uses the following error codes:

Error Code      | Meaning
--------------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your authorization header is wrong
402 | Payment Required -- Your request needs a paid plan or your paid plan has expired.
404 | Not Found -- The specified object could not be found
405 | Method Not Allowed -- You tried to access an invalid method
406 | Not Acceptable -- You requested a format isn't supported
410 | Gone -- The kitten requested has been removed from our servers
422 | Unprocessable Entity -- Something happend when we tried to save your request.
429 | Too Many Requests -- You're requesting too many kittens! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.

## Error Handling

All errors follow the [JSend](http://labs.omniti.com/labs/jsend) specification. Included in the body if any error response (_e.g. non-200 status code_) will be an error object in the form:

### When a client sends an unspected request

> Example JSON __fail__ response:

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

### For server errors

> Example JSON __error__ response:

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
