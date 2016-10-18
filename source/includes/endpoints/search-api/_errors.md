### Errors

The search API uses the following error codes:

Error Code | Status | Meaning
---------- | ------ | -------
200 | success | The request has succeeded.
404 | Not Found | The origin server did not find a current representation for the target resource or is not willing to disclose that one exists.
405 | Method Not Allowed | The method received in the request-line is known by the origin server but not supported by the target resource.
406 | Not Acceptable | The target resource does not have a current representation that would be acceptable to the user agent, according to the proactive negotiation header fields received in the request, and the server is unwilling to supply a default representation.
413 | Payload Too Large | The server is refusing to process a request because the request payload is larger than the server is willing or able to process. Limit is 10mb.
422 | Unprocessable Entity | The server understands the content type of the request entity, and the syntax of the request entity is correct but was unable to process the contained instructions.
503 | Service Unavailable | The server is currently unable to handle the request due to a temporary overload or scheduled maintenance, which will likely be alleviated after some delay.
