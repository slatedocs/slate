# Errors

The SMARTSolar API uses the following response codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Please check your request for errors
401 | Unauthorized -- Your token is invalid or not present
403 | Forbidden -- Your user is not allowed to access this resource. If you believe you should have permission please contact a.alhakim@bboxx.co.uk
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- The method is not allowed at this endpoint
500 | Internal Server Error -- We had a problem with our server. Please contact d.mclean@bboxx.co.uk with exact details of your request.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
