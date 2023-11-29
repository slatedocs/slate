# API Reference

The Intelex API is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API responses, including errors.

## Getting Started

> API Endpoint - replace **intelex_url** with the full URL path to your Intelex system

```
https://intelex_url/api/v2/
```

To begin using the Intelex API you will need:

* Your own instance of the Intelex platform with the REST API enabled
* A valid Intelex system user account
* The full URL to your Intelex system
* A basic understanding of the [Intelex Application model](https://community.intelex.com/library/knowledgebase/help/Content/Getting%20Started/Application%20Builder.htm). 

## Authentication

> Example Requests:

```javascript
// Basic Authentication
var request = require("request");

var options = {
  headers: { Authorization: "Basic [insert credentials here]" }
  };


//ApiKey Authentication
var request = require("request");

var options = {
  headers: { Authorization: "ApiKey [insert key here]" }
  };


// Secure Access Token Authentication
var request = require("request");

var options = {
  headers: { Authorization: "Bearer [insert Access token here]" }
  };
```

```csharp

// Basic Authentication
var request = new RestRequest(Method.GET);

request.AddHeader("Authorization", "Basic [insert credentials here]");


// ApiKey Authentication
var request = new RestRequest(Method.GET);

request.AddHeader("Authorization", "ApiKey [insert key here]");


// Secure Access Token Authentication
var request = new RestRequest(Method.GET);
 
request.AddHeader("Authorization", "Bearer [insert Access token here]");
```

Intelex utilizes three methods for authentication to the API- Basic, ApiKey and Secure.

Basic authentication is performed via HTTP Basic Auth and your Intelex user credentials (Username:Password). The credentials are then verified by Intelex and access will be granted or denied accordingly.

ApiKey authentication can be performed by generating API access key(s) from the Intelex User Profile menu (note that this page is only accessible to full-access and admins on the site). 
The unique generated key can then be used to access the Intelex REST API and used to authenticate and prove that the user is who they claim to be.

For both HTTP Basic Auth and ApiKey authentication, access to Intelex apps and data is constrained by the user's existing access, set up and managed in Intelex. 

Secure token based authentication is supported in V6 API (Feature needs to be enabled by Intelex Team). Only Admin and full-access users can access the API.

During the authentication process, the client provides the ‘client id’ and ‘client secret’ to the authentication endpoint, along with the audience and grant type, as shown in the example. In response, the API furnishes an access token that comes with a specified time limit of the token expiration. After successful authentication, clients gain access to V6 API endpoints.

All API requests must be made over HTTPS and API requests without authentication will fail. Security on data is managed by the platform security configuration. 
API requests will maintain the same security settings you have configured in the platform for each user.

>Example Requests:

```CSharp 
Body for Authentication Endpoint
{"client_id":"Client ID Data",
"client_secret":"Client Secret Data",
"audience":"https://api.intelex.com/v6/",
"grant_type":"client_credentials"}
```

>Example Response:

```json
{
    "access_token": "Generated Bearer Access Token Used For Validation",
    "expires_in": "Token Expiry Time In Seconds",
    "token_type": "Bearer"
}
```

### Get endpoint, secured client id and client secret

Login to the V6 application. Navigate to System Administration, User Administration, and then Navigate to API Access.
Select the secured API from the API Access page; the endpoint, client id and client secret will be displayed on the details page. Use these to obtain an access token via API end point.

## Data Format

The Intelex API only supports [JSON](http://www.json.org/) as the data format for requests and responses.

## Response Codes

> Example error response

```json
{
  "error": {
    "code": "string",
    "message": "string"
  }
}
```

The Intelex REST API will respond with the following HTTP status codes:

Response Code | Meaning
---------- | -------
200 | Success -- Enjoy your data!
201 | Created -- We created the record!
204 | No Content -- Your request was successful, but we don't have anything more to tell you
400 | Bad Request -- Something is wrong with your request
401 | Unauthorized -- Your credentials are wrong
403 | Forbidden -- You do not have permission to access the resource
404 | Not Found -- The object or navigation property you are trying to access doesn't exist
405 | Method Not Allowed -- We won't let you do that
429 | Too Many Requests -- You have sent too many requests and have to wait till you can send more
500 | Internal Server Error -- We had a problem with our server. Try again later
501 | Not Implemented -- What you are trying to do doesn't work...yet.

## Versioning

When we make backwards-incompatible changes to the API, we release new versions. The current version is **v2** and can be determined with our API base path **/api/v2/**. Read our [Intelex platform release notes](https://community.intelex.com/library/knowledgebase/release-notes) to see our API changelog.

## API Rate Limiting / Quotas
To ensure Intelex Platform is reliable and has the expected performance for all users, we limit the number of API calls an API user (or application) can make within a given time period. If the limit is exceeded, the API user may be throttled and subsequent requests within the same period will fail (status code 429).

### Limit
The Intelex Platform API Rate limit is **2 requests per second**.

### Quota headers
Quota details may be passed back to the API user/application via response headers.

Header | Description | Sample value
---------- | ------- | -------
X-RateLimit-Limit	| The request limit per specified unit of time.	| 100
X-RateLimit-Remaining	| The remaining number of requests that API consumers can send in the current time window. | 75
X-RateLimit-Reset	| The UTC epoch timestamp indicating the time of the next quota reset. Sent only when quota remains. | 1521214822
X-RateLimit-Next | The UTC epoch timestamp indicating the time of the next quota reset. Sent only when quota is full.	 |1521215291