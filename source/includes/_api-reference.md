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

## Authentication

> Example Request - make sure to replace **hello** with your credentials.

```javascript
var request = require("request");

var options = {
  headers: { authorization: 'Basic hello' }
  };
});
```

```csharp
var request = new RestRequest(Method.GET);
request.AddHeader("authorization", "Basic hello");
```

Authentication to the API is performed via HTTP Basic Auth and your Intelex user credentials. All API requests must be made over HTTPS and API requests without authentication will fail. Security on data is managed by the platform security configuration. API requests will maintain the same security settings you have configured in the platform for each user. 

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
204 | No Content -- Your request was successful, but we don't have anything more to tell you.
400 | Bad Request -- Something is wrong with your request
401 | Unauthorized -- Your credentials are wrong
403 | Forbidden -- You do not have permission to access the resource
404 | Not Found -- The object or navigation property you are trying to access doesn't exist
405 | Method Not Allowed -- We won't let you do that
500 | Internal Server Error -- We had a problem with our server. Try again later
501 | Not Implemented -- What you are trying to do doesn't work...yet.

## Versioning

When we make backwards-incompatible changes to the API, we release new versions. The current version is **v2** and can be determined with our API base path **/api/v2/**. Read our [Intelex platform release notes](https://community.intelex.com/library/knowledgebase/release-notes) to see our API changelog.

