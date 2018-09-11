# Errors
## HTTP Status Codes

We use common HTTP status codes included in the response header to indicate success or failure.

**Code** | **Description** 
------------ | ------------- 
200 | OK. Successful request.
201 | OK. Resource created.
400 | Bad request. Request message data did not pass validation.  
401 | Unauthorised. Not authorised to access requested data.  
403 | Forbidden. Access to requested data is forbidden. 
404 | Not Found. Requested resource does not exist.
408 | Timeout. Operation timed out. 
422 | Unprocessable entity. Request message data did not pass validation.
500 | TransferWise server error.


## Validation Errors

> Example Validation Error:

```json
{
    "errors": [
        {
            "code": "error.route.not.supported",
            "message": "This route is not supported",
            "arguments": [
                "CNY-EUR"
            ]
        }
    ]
}
```

Data validation or violation of business rules related errors. Response could contain multiple errors.



## Authentication Errors

> Example Authentication Error:

```json
{
    "error": "unauthorized",
    "error_description": "Full authentication is required to access this resource"
}
```

Security related errors.


## System Errors

> Example System Error:

```json
{
  "timestamp": "2017-02-02T13:07:39.644+0000",
  "status": 500,
  "error": "Internal Server Error",
  "exception": "java.lang.NullPointerException",
  "message": "No message available",
  "path": "/v1/quotes/106031/account-requirements"
}
```

Something went wrong in our side.
