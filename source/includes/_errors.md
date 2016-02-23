# Errors

<aside class="notice">Whenever an error occurs our API should provide an errors node in the json response that is returned that will contain more information</aside>

```shell
curl "https://api.careerbuilder.com/consumer/some-request/id-of-a-missing-document"
  -H "Authorization: Bearer YOUR_HAPPY_TOKEN"
```

> Example JSON response generated on an error

```json
{  
   "page":-1,
   "page_size":-1,
   "total":0,
   "forensics":null,
   "errors":[  
      {  
         "type":404,
         "message":"Document not found",
         "code":404
      }
   ]
}
```
Our APIs use the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is poorly formed
401 | Unauthorized -- Your API credentials are wrong
403 | Forbidden -- You do not have authorization to access this resource
404 | Not Found -- The specified item could not be found
429 | Too Many Requests -- Your requesting too many kittens! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
521 | Service Error -- We had a problem with our server. Try again later.
567 | Service Error -- Our server is mis-configured
573 | Service Error -- Our server timed out trying to fulfil your request

