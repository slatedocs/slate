# Requests and Responses

Shiftboard Web Services are based on the [JSON-RPC 2.0
specification](http://jsonrpc.org/spec.html), with some extensions.
At this time, only GET requests are supported (except for [batch requests](#batch-requests), which use POST), with formatting based
on the [JSON-RPC Over HTTP specification's GET
request](http://jsonrpc.org/historical/json-rpc-over-http.html#get).

## Selection Criteria

Methods that may apply selection criteria take a `select` attribute.
The value of this attribute is an object with method-dependent
attributes.  The `select` attribute is optional for some methods
and required for others.  Default values may apply for some methods.

## Batches

There are three kinds of "batching" in the API: [Pagination](#pagination), [Performance Batching](#performance-batching), and [Batch Requests](#batch-requests).

### Pagination

Methods that return paginated results optionally take a page
attribute.  The value of this attribute is an object with `batch`
and `start` attributes.  `batch` specifies the number of records
to be returned with each request and must be between 1 and 1000.
If not specified, the default is 10.  `start` specifies the record
number with which results should start.  If not specified, the
default is 1.

The response results may include a `count` attribute giving the
total number of records matching the selection criteria, if available.

If records were found, it will include a `page` attribute giving a
pagination object (in the format used by the page request attribute)
for `this` page, the `next` page, and/or the `prev` page, as
applicable.

For example, to perform an initial request with a page size of 25,
include a `page` attribute in your request:

`page: {batch:25}`

If there is more than one page of results available, the response
will include a page attribute like this:

`page: {next: {batch:"25",start:26}, this: {batch:"25",start:1}}`

Use the value of the `next` attribute as the `page` attribute to get another page:

`page: {batch:"25",start:26}`

and you will get a response including this:

`
page: {next: {batch:"25",start:51},
prev: {batch:"25",start:1},
this: {batch:"25",start:26}
`

(The `next` attribute will only be present if in fact there is yet
another page of data available.)

### Performance Batching

```JSON
location.create
{
 workgroup:1,
 name:"General Electric",
 zip:"12345",
 batch:true
}

location.create
{
 workgroup:1,
 name:"White House",
 address:"1600 Pennsylvania Ave NW",
 city:"Washington",
 state:"District of Columbia",
 batch:true
}

system.endBatch
{}
```

This second type of batching involves speeding up requests: if a large number of non-interdependent requests will be sent, a batch attribute can be specified to enable them to be processed more quickly, with a system.endBatch request sent at the end to perform necessary operations that were deferred.

This mode should not be used when processing interdependent requests, for example, adding locations and also adding shifts that use those locations or adding workgroup relationships to those locations.

### Batch Requests

> Request example:

```JSON
[
  {
    "id": 1,
    "jsonrpc": "2.0",
    "method": "shift.list",
    "params": {
      "select": {
        "end_date": "2018-01-31",
        "start_date": "2018-01-01"
      }
    }
  },
  {
    "id": 2,
    "jsonrpc": "2.0",
    "method": "location.create",
    "params": {
      "workgroup": 1,
      "name": "General Electric",
      "zip": "12345"
    }
  }
]
```

> Response example (abbreviated):

```JSON
[
  {
    "id": "1",
    "jsonrpc": "2.0",
    "result": {
      "shifts": [
        {
          "end_date": "2018-01-08T17:00:00",
          "id": "1111111",
          "start_date": "2018-01-08T09:00:00",
          "timezone": "Pacific Time (US/Can) (GMT-08:00)",
          "workgroup": "1"
        }
      ]
    },
  },
  {
    "id": "2",
    "jsonrpc": "2.0",
    "result": {
      "id": "284442"
    }
  }
]

```

The third type of batching is for sending multiple individual API calls in a single request. The API supports the [JSON-RPC 2.0
specification for batches](http://www.jsonrpc.org/specification#batch), using [POST requests](http://jsonrpc.org/historical/json-rpc-over-http.html#post), where instead of supplying a JSON object of parameters, an array of objects is supplied.

Each object in the array contains the [jsonrpc](#jsonrpc), [id](#id), [method](#method), and [params](#params) keys.  The [access_key_id](#access_key_id) and [signature](#signature) parameters are put in the query string, not in the POST contents. The [request signature](#request-signature) is for the entire POST contents.

Responses will also be an array, with the "id" in the response object matching the "id" in the request object. If no "id" is supplied in a request object, no response will be given for that part of the request.

## Requests

### Request Format

A Shiftboard Web Services API request is issued via an HTTP GET request (or POST, for batch requests) to https://api.shiftdata.com.  Each request may have the following components:

####id

An integer or string.  Not used except in that a response should
return the same value as passed in the request.  This field can be
used by the client to correlate a response with its request.

For [batch requests](#batch-requests), no results will be returned for an individual request unless an id is supplied for that request.

####jsonrpc

Version of the JSON-RPC specification for this request. Must always be the string "*2.0*".

####method

A string giving the name of the procedure to be invoked.

####params

A object ([RFC 4627](http://www.ietf.org/rfc/rfc4627.txt)) that
holds the actual parameter values for the invocation of the procedure.
All Shiftboard Web Services API methods require params, minimally
an empty object (`{}`).  See [Objects](#objects) and Common Attributes.

####access_key_id

A 36 character string identifying the client to the Shiftboard Web
Services API.  May be provided either in the GET request query
string or in a cookie.

####signature

A 28 character digital signature authenticating the source of this
request, computed as described below.  May be provided either in
the GET request query string or in a cookie.

Those components that may contain characters other than alphanumerics,
'-', '.', '_', or '~' should be URI encoded ([RFC
3986](http://www.ietf.org/rfc/rfc3986.txt)), as is normal for an
HTTP GET request query string.

### Request Signature

Each request is digitally signed by taking components of the request
and computing an HMAC SHA1 signature for them using a secret Signature
Key (which itself should never be transmitted).  The calculated
signature is then base64 encoded.  The HMAC SHA1 algorithm is
described in [RFC 2104](http://www.ietf.org/rfc/rfc2104.txt).

The data to be signed for GET requests is composed of four parts concatenated with no separator:

* The 6 character string `method`
* The name of the method being called
* The 6 character string `params`
* The text being passed as params, prior to any base64 or URI encoding

Example: given the method name `echo`, the params "{ }", the data
to be signed is "methodechoparams{ }".  Given a signature key
"*Xuzh+MDxcW9/CLPD1Z2wiSX51LVrQrStEZPQWk0P*", the resulting
base64-encoded HMAC SHA1 signature is "*gJ5Oy1E5W4u9XpjWyMoJytlScU8=*".
Given an API access key of "*g57a67b3b-34e4-4c07-a8ca-e7ecb77a7f33*",
a complete request would be

`https://api.shiftdata.com/?id=885&jsonrpc=2.0&method=echo&params=eyB9&signature=gJ5Oy1E5W4u9XpjWyMoJytlScU8%3D&access_key_id=57a67b3b-34e4-4c07-a8ca-e7ecb77a7f33`

For POST requests, the data to be signed is simply the entire contents of the POST request.

## Responses

### Response Format

The response to a Shiftboard Web Services API request is a object
([RFC 4627](http://www.ietf.org/rfc/rfc4627.txt)) with the following
attributes:

####id

The id provided in the request. If an error prevented the request from being parsed, this attribute may be null.

####jsonrpc

Version of the JSON-RPC specification for this response. Will always be the string "*2.0*".

####result

A object providing the results of the request. Only present when the request was successful. Contents are method-dependent: see [Objects](#objects) and Common Attributes.

####error

A object providing error information. Only present when the request failed.

####seconds

If provided, number of seconds spent processing the request and formatting a response.

### Successful Responses

The attributes returned in response results vary; see [Objects](#objects).

### Error Responses

A properly formatted and authorized request should not result in an error; please contact Shiftboard Support for assistance.

