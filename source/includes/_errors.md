# Errors

The API follows HTTP Status Codes for error handling. As a body again JSON is returned. The "message" will provide more information about the specific error.


The API uses the following error codes:

> example error response:

```json
{
    "success": false,
    "message": "Forbidden, your auth token seems to be invalid"
}
```

```php
<?php
try {
    // code that might result in an error from the API
} catch (\Productsup\Exceptions\ServerException $e) {
    // A exception at the API Server happened, should not happen but may be caused by a short down time
    // You may want to retry it later, if you keep getting this kind of exceptions please notice us.
    throw new Exception('Error at the productsup API, retry later');
} catch (\Productsup\Exceptions\ClientException $e) {
    // Most likely some of the data you provided was malformed
    // The error codes follow http status codes, @see http://en.wikipedia.org/wiki/List_of_HTTP_status_codes#4xx_Client_Error
    // The message may give more information on what was wrong:
    echo $e->getCode().' '.$e->getMessage();
} catch (\Exception $e) {
    // Exceptions not within the Productsup namespace are not thrown by the client, so these exceptions were most likely
    // thrown from your application or another 3rd party application

    // however, if you don't catch Productsup exceptions explicitly, you can catch them all like this
    echo $e->getCode().' '.$e->getMessage();
    throw $e;
}
```


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request was malformed
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The entity requested is hidden for administrators only
404 | Not Found -- The specified entity could not be found
405 | Method Not Allowed -- You tried to access a entity with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
410 | Gone -- The entity requested has been removed from our servers
418 | I'm a teapot
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
