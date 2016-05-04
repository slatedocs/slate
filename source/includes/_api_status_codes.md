# API Status Codes

The API responds to requests with different HTTP status codes depending on the result from the request. Error responses may also include an error message in the body to assist the client in resolving the problem.

## 2xx Success

These codes are returned for requests that were understood and processed successfully.

| Code | Definition | Purpose |
| --- | --- | --- |
| **200** | **OK** | For successful **GET** and **PUT** requests. |
| **201** | **Created** | For a successful **POST** request. |
| **202** | **Accepted** | For a request that resulted in a scheduled task being created to perform the actual request. |
| **204** | **No Content** | For a successful request that produced no response (such as **DELETE** requests). |

## 3xx Redirection

These codes are returned for requests that have resulted in the client needing to take further action to complete the request.

| Code | Definition | Purpose |
| --- | --- | --- |
| **301** | **Moved Permanently** | When the API routes have changed (unlikely) or if the incoming request is not secure (http) then it will be redirect to the secure (https) version. |
| **302** | **Found** | When the resource was found at a different location. When a request to a deprecated version of the API is received, a **302 Found** response will be issued to the current API version. |
| **304** | **Not Modified** | If an **If-Modified-Since** header is sent in the request and the resource has not been modified since the specified date, then this response will be sent. See resource specific pages for support for the **If-Modified-Since** header. |

## 4xx Client Error

| Code | Definition | Purpose |
| --- | --- | --- |
| **400** | **Bad Request** | Issued when a malformed request was sent. Examples follow.|
|||*   Invalid syntax
|||*   Missing required data
|||*   Webhook requests missing **Content-Type** in the HTTP header.
|
| **401** | **Unauthorized** | This response is sent when your client failed to provide credentials or its credentials were invalid. |
| **403** | **Forbidden** | Returned when permissions do not allow the operation or when the operation exceeds a limit.
|||*   Check your app in **My Apps** to review the OAuth scopes you requested and if they support the request that you made.
|||*   Changes to the store owner's account can cause this error, including a change to the email address. Revert those changes to correct this issue.
|||*   This error can also occur when your request exceeds a limit imposed on the resource in question. For example, a store cannot exceed 16,000 categories. Refer to the documentation of the resource in question for more information.
|
| **404** | **Not Found** | When a particular resource doesn’t exist or couldn’t be found. |
| **405** | **Method Not Allowed** | The resource was found, but doesn’t support the request method. Issued when either a specific method isn’t yet implemented on a resource, or the resource doesn’t support the method at all. For example, a **PUT** on **/orders** is invalid, but **PUT** on **/orders/{_id_}** is valid. |
| **406** | **Not Acceptable** | When the client specifies a response content type in the **Accept** header that is not supported. |
| **409** | **Conflict** | A change requested by the client is being rejected due to a condition imposed by the server. The exact reasons response for this will vary from one resource to the next. Examples may include attempting to delete a category which would result in products being orphaned. Additional information about the conflict and how to resolve it may be available in the **details** section of the response. |
| **413** | **Request Entity Too Large** | When the client requests too many objects. For example, the **limit** parameter exceeded the maximum. |
| **415** | **Unsupported Media Type** | Returned due to issues with the **Content-Type** header.
|||*   It specifies an unsupported content type.
|||*   It is missing (except the webhooks resource, which returns a 400 in this case).
 |
| **429** | **Too Many Requests** | When an OAuth client exceeds the rate limit for API requests to a store. |

## 5xx Server Error

These codes are returned for requests that could not be processed due to an internal error with the API or server.

| Code | Definition | Purpose |
| --- | --- | --- |
| **500** | **Internal Server Error** | When an error has occurred within the API. |
| **501** | **Not Implemented** | When a request method is sent that is not supported by the API (e.g., **TRACE**, **PATCH**). |
| **503** | **Service Unavailable** | When the store is marked as “Down for Maintenance” or the store is being upgraded to a new version. |
| **507** | **Insufficient Storage** | When the store has reached a limitation for the resource according to their Bigcommerce plan (e.g., 500 product limit). |
| **509** (Deprecated) | **Bandwidth Limit Exceeded** | Returned to apps using Basic Authentication that have exceeded their [rate limits](/api/rate-limits/basic). |
