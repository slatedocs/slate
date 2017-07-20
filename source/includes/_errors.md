# Error Handling

> 401 Unauthorized error response due to using a wrong token.

```text
HTTP/1.1 401 Unauthorized
Content-Type: application/json
Content-Length: 27

{"detail":"Invalid token."}
```

> 400 Bad Request error response due to missing parameters in the request. Note that the fields are included as keys, and the error messages for each field are included as a list after each key.

```text
HTTP/1.1 400 Bad Request
Content-Type: application/json
Content-Length: 94

{"amount": ["A valid integer is required."], "description": ["This field may not be blank."]}
```

Beyonic uses HTTP response status codes to indicate success or failure. When a request to our API is successful, Beyonic returns an HTTP response code in the 2XX range.
And when a request fails, Beyonic returns an HTTP response code in the _4XX_ or _5XX_ range.

In summary:

* Codes in the _2XX_ range mean that the request was processed successfully
* Codes in the _4XX_ range mean that something was wrong with the data that you sent. For example, you might have missed some required parameters, or you might be using a wrong API token.
* Codes in the _5XX_ range mean that something went wrong within Beyonic's servers.

In all cases, the response will include an appropriate status code and content-type. The body of the response will include any additional details regarding the nature of the error.

Most error responses will include a "detail" key in the body of the response, but some may include additional information, for example, they may include information about missing fields.

The examples to the right show some of the errors that might occur, including the status code and content-type in the response header, and the json-formatted details in the response body.

## Common Error Codes

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is malformed or is missing some required parameters.
401 | Unauthorized -- You are using an invalid API token.
403 | Forbidden -- You are attempting to access a resource that doesn't belong to you. Check that you are using the correct API token for the user who owns the resource.
404 | Not Found -- You are attempting to access a resource that doesn't exit. Check the url for your request.
405 | Method Not Allowed -- You are attempting to use an invalid method. For example, you might be trying to POST to a readonly endpoint.
406 | Not Acceptable -- You requested a format that isn't supported. Check the "Accept" header of your request, and try to ensure that you are using json format for your requests.
409 | Conflict -- You sent a duplicate request. Check your Duplicate-Check-Key
415 | Unsupported Media Type -- Check the content-type of the data you are sending.
429 | Throttled -- You are sending too many requests in a short period of time. Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

*Note*: always check the response body for details about the error.

## Handling errors

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6901");

try {
  $collection_requests = Beyonic_Collection_Request::getAll();
} catch (Beyonic_Exception $e) {
  echo $e->getMessage();
  print_r(json_decode($e->responseBody));
}
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6901'

try:
  collection_request = beyonic.CollectionRequest.get(23)
except beyonic.errors.ResponseError as e:
  print e
else:
  # No error, proceed with processing
  pass
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6901'

begin
  collection_request = Beyonic::CollectionRequest.get(23)
rescue RestClient::ExceptionWithResponse => e   # You probably want to use more specific RestClient codes like RestClient::Unauthorized, RestClient::ResourceNotFound, etc
  p e  # Print out the error
end
```

Your code should handle errors gracefully.

Beyonic's API libraries will raise an exception when an error occurs. So you should add exception handling to your requests as shown in the examples to the right.
