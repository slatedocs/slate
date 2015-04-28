# Overview

The PokitDok API allows you to perform X12 transactions, find healthcare providers, and get information on health care 
procedure pricing. The API uses JavaScript Object Notation ([JSON](http://json.org/)) for requests and responses and 
also allows batch processing of [ASC X12](http://x12.org/) 5010 compatible [EDI](http://www.x12.org/about/faqs.cfm#a1) 
files. All API traffic is encrypted over HTTPS and authentication is handled with OAuth2.

The API is designed according to REST (Representational State Transfer) principles. The available API calls are 
organized into Resources. These resources are represented by endpoints that clients can invoke to describe and modify 
their state. All resources have the same available top level parameters available for finer grained access.

```shell
#Here's an example of accessing a resource directly, using the "cURL" utility.
curl -i https://platform.pokitdok.com/api/v4/providers/?limit=20
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
{
    "meta": {
        "activity_id": "53d94ff156c02c67a0070096",
        "application_mode": "production",
        "rate_limit_cap": 1000,
        "rate_limit_reset": 1372700873,
        "rate_limit_amount": 122,
        "credits_billed": 1,
        "credits_remaining": 10000,
        "processing_time": 80,
        "next": "https://platform.pokitdok.com/api/v4/providers/?offset=20",
        "previous": null
    },
    "data": [{
        ...
    }]
}
```

The above is a truncated example that gets a list of providers from the Providers resource, and uses some common keyword 
arguments in the process. Notice that the response payload consists of a meta key and a data key. The meta key contains 
information regarding rate limiting, linked urls for convenient paging of lists, record counts, response time and API 
billing information. The data key contains an object, or list of objects returned from the resource.

The following is a list of values that are contained in the meta block, along with their types. Credit and rate limiting 
information is only included in the meta information for APIs that are billable and/or rate limited. Processing time is 
always included in the meta information.

Key | Type | Description
--- | ---- | -----------
activity_id | {uuid} | The id of the activity used to process the API request.
application_mode | {string} | Indicates if the application is configured for test or production use.
credits_billed | {int} | The amount of credits billed for this request
credits_remaining | {int} | The amount of credits remaining on your API account
next | {int} | A url pointing to the next page of results
previous | {int} | A url pointing to the previous page of results
processing_time | {int} | The time to process the request in milliseconds
rate_limit_amount | {int} | The amount of requests made during the current rate limit period
rate_limit_cap | {int} | The amount of requests available per hour
rate_limit_reset | {int} | The time (Unix Timestamp) when the rate limit amount resets

Below are the available keyword arguments that resources can use. All of these keywords can be added to collection 
requests from Resources - singular Resource (/resource/{id}) requests do not accept parameters intended to limit a list 
of responses.

Argument | Description
-------- | -----------
async | Whether the API call is asynchronous.  For Resources that offer both synchronous and asynchronous operation, a boolean can be used for this parameter to specify which mode of operation you desire; if the async parameter is omitted, the synchronous mode will be used. For POST requests, the async parameter should be included along with other JSON data being POSTed. When async is true, the API client has the option of including a callback URL so that it can be notified when the asynchronous processing is complete.
application_data | API client applications may include custom application data in requests to help support scenarios where an application is unable to store the activity id and wishes to include application specific data in their API requests so that the information will be stored on the request's activity and returned to the application in asynchronous callbacks. This can be useful for scenarios where you want to directly associate a PokitDok Platform API request with some identifier(s) in your system so that you can do direct lookups to associate responses with the appropriate information. For example, suppose you wish to fire off a number of eligibility or claims requests and want to include some identifiers specific to your application. By including the identifier(s) you need in the request's application_data section, you can easily do direct lookups using those identifiers when you receive the API response.
dir | The direction that a list is sorted, ascending or descending (only for collection requests)
limit | The number of Resources to return in a list (only for collection requests)
offset | The number of Resources to skip when paging through a list (only for collection requests)
sort | The field to sort the list of Resources by (only for collection requests)
