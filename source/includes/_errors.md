# Errors

Errors are returned as an error message object along with the appropriate HTTP status code:

```shell
{                                                                                                                                                                                                                                         
  "message": "Not found.",                                                                                                                                                                                                                
  "code": 404                                                                                                                                                                                                                             
} 
```

The following error codes are used:

Error Code | Meaning
---------- | -------
400 | Bad Request
401 | Unauthorized -- Your client_id is wrong or the user has not granted access yet
403 | Forbidden
404 | Not Found -- The specified id could not be resolved
405 | Method Not Allowed -- PUT / PATCH / POST will be implemented in /v2
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
