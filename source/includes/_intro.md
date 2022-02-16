# Introduction 
<aside class="notice">
This documentation is currently in draft. Be aware that small changes may be made before it reaches it's first version.
</aside>

Welcome to the SIERA API. You can use the SIERA API to access and modify Assets, Meter and Consumption data. 

This page helps you to understand the requirements of the API, common errors, the format of data sent and received and other details related to security and operation of the API.

We provide [an OpenAPI specification description](https://api.sieraglobal.com/swagger/v1/swagger.json) which can be imported into programs such as [Postman](https://www.postman.com/) to help you get started with the API.

## Requirements

To use the latest version of the REST API you will need a valid account with SIERA. This can be obtained by contacting [SIERA Support](mailto:support@sieraglobal.com).

## Request format

Request parameters should be provided using the `application/json` Content-Type. The only exception is the IDs of entities or assets which are part of the URLs.

Unless otherwise documented all responses are JSON-encoded `Content-Type: application/json`.

All endpoints require a bearer token must be specified in the header of the request. How to obtain a bearer token is explained in [authentication](#authentication).

## Response types

Most endpoints will return a standard HTTP status code to reflect the result of the API call. Where an endpoint produces a different response code, or has additional information about a response code it will be written against the endpoint's information.

| Code | Text              | Description                                                                                                |
| ---- | ----------------- | ---------------------------------------------------------------------------------------------------------- |
| 200  | Ok                | Success, assets returned in the response body                                                              |
| 201  | Created           | Success, the uploaded entity has been successfully created                                                 |
| 404  | Not Found         | The requested item does not exist                                                                          |
| 429  | Too Many Requests | The request was refused due excessive use                                                                  |
| 5xx  | Server Error      | An error has occurred on our servers. Wait a few minutes and try again or notify us if the errors continue |

## Rate limiting

The SIERA API enforces a rate limit on the number of requests allowed within certain time frames. The limits are:

| Time frame | Number of requests allowed |
| ---------- | -------------------------- |
| 1 second   | 2                          |
| 15 minutes | 100                        |
| 12 hours   | 1,000                      |
| 7 days     | 10,000                     |

For every request that is made the number of further requests allowed in the largest available time frame will be returned in the headers of the response along with the datetime the limit will be reset, for example:

`x-rate-limit-limit: 7d`  
`x-rate-limit-remaining: 9991`  
`x-rate-limit-reset: 2021-12-29T15:21:09.3213831Z`  

If the limit is exceeded the caller will receive a HTTP status code of `429 Too Many Requests` along with a response body indicating the limit exceeded such as `API calls quota exceeded! maximum admitted 2 per 1s.`