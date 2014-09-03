# Caching

Certain endpoints can returned cached responses for your client to avoid
downloading the entire response again if it hasn't changed since you
last requested it.

This is commonly called Conditional GET and is based on two response headers:
- `Last-Modified`
- `ETag`

These headers are sent back with every cacheable endpoint response.

If you store their values locally on the client-side and send them back
as the following request headers in any subsequent request, you may
will a response with the `304 - Not Modified` status code and no body
if the response has not changed since your previous request:
- `If-Modified-Since`
- `If-None-Match`

<aside class="warning"> The value returned inside the `ETag` header is
a quoted string containing random numbers and letters (the entity tag).
You **must** send it back as a quoted string within the `If-None-Match`
request header for the conditional GET request to be valid.
</aside>

You may send either (or both) of these conditional GET headers in order
to attempt to receive a cached response.
