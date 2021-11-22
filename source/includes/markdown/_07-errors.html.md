<hr>
<section>

# Errors

> Missing authorization header

```http
GET https://app.asana.com/api/1.0/users/me HTTP/1.1
```
```http
HTTP/1.1 401 Not Authorized
{
  "errors": [
  {
    "message": "Not Authorized"
  }
  ]
}
```

<span class="description">
Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases,
the API should return an HTTP Status Code that indicates the nature of the failure (below), with a response body in
JSON format containing additional information.
</span>

In the event of a server error the response body will contain an error phrase. These phrases are automatically generated
using the [node-asana-phrase](https://github.com/Asana/node-asana-phrase) library and can be used by Asana support to
quickly look up the incident that caused the server error.

> Bad request parameters

```http
GET https://app.asana.com/api/1.0/tasks HTTP/1.1
Authorization: Bearer <personal_access_token>
```
```http
HTTP/1.1 400 Bad Request
{
  "errors": [
  {
    "message": "workspace: Missing input"
  }
  ]
}
```

> Asana had a problem

```http
GET https://app.asana.com/api/1.0/users/me HTTP/1.1
Authorization: Bearer <personal_access_token>
```
```http
HTTP/1.1 500 Server Error
{
  "errors": [
  {
    "message": "Server Error",
    "phrase": "6 sad squid snuggle softly"
  }
  ]
}
```
<br></br>

| Code | Meaning | Description |
|---|---|---|
| <span>200</span> | **Success** | If data was requested, it will be available in the `data` field at the top level of the response body. |
| <span>201</span> | **Created** <br> <small>(for object creation)</small> | Its information is available in the data field at the top level of the response body. The API URL where the object can be retrieved is also returned in the `Location` header of the response. |
| <span>400</span> | **Bad Request** | This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again. |
| <span>401</span> | **Unauthorized** | A valid authentication token was not provided with the request, so the API could not associate a user with the request. This error also occurs if an app makes a request to a workspace that has disabled that particular app. |
| <span>402</span> | **Payment Required** | The request was valid, but the queried object or object mutation specified in the request is only available to premium organizations and workspaces. |
| <span>403</span> | **Forbidden** | The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to. |
| <span>404</span> | **Not Found** | Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist. |
| <span>429</span> | **Too Many Requests** | You have exceeded one of the enforced rate limits in the API. See the [documentation on rate limiting](/docs/rate-limits) for more information. |
| <span>451</span> | **Unavailable For Legal Reasons** | This request was blocked for legal reasons, commonly caused by embargoed IP addresses. |
| <span>500</span> | **Internal Server Error** | There was a problem on Asana's end. |

<br></br>

In the event of an error, the response body will contain an errors field at the top level. This contains an array of at
least one error object, described below:

| Example | Description |
|---|---|
| message | `project: Missing input` Message providing more detail about the error that occurred, if available. |
| phrase | `6 sad squid snuggle softly` **500 errors only**. A unique error phrase which can be used when contacting developer support to help identify the exact occurrence of the problem in Asana's logs. |

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
