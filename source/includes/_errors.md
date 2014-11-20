# Errors

The NewsWhip API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request could not be parsed
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- Your API kye is not allowed to access this resource
429 | Too Many Requests -- Enhance your calm or contact us for higher limits!
500 | Internal Server Error -- We had a problem with our server. Please try again later.
503 | Service Unavailable -- We're temporarily offline for maintanance. Please try again later.

# More Information

## Server side Caching

* `GET` queries are cached (per API Key) for a small amount of time. Usually about 3 minutes. Check the HTTP headers sent by our servers for an exact metric.
* `POST` queries are never cached.

## CORS support

* `GET` endpoints support 1 `Cross-origin resource sharing` per API key. Contact api@newswhip.com to set this up.
* `POST` endpoints are server-side only.

## JSONP

We don't currently support JSONP.