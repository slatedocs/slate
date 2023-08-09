# ACTS API Reference

The Intelex ACTS API provides endpoints in ACTS, with it's own URL for access. If you currently use the Intelex API, you will not be able to use the ACTS API unless you have Admin access to ACTS. At the same time, you can use the ACTS API without any permission for Intelex V6.  

Our ACTS API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API responses, including errors.

## Getting Started

To begin using the Intelex API you will need:
*	A valid Intelex ACTS user account
*	The full URL to your Intelex ACTS API and system
*	A basic understanding of the Intelex ACTS API Application.

>API Endpoint - replace **intelex_ACTS API url** with the full URL path to your Intelex system

```
https://{tenant}.actsapi.intelex.com
```

## Authentication

>Example Requests:

```CSharp 

//JSON Body for Authentication Endpoint
{"client_id":"Client ID Data",
"client_secret":"Client Secret Data",
"audience":"https://{tenant}.intelex.com/API-release",
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

Intelex's ACTS API uses Auth0 tokens for authentication. Only ACTS Admin users can access the API. 

During Auth0 authentication, the client passes 'client id' and 'client secret' to the auth0 validation endpoint, along with the audience and grant type, as shown above. The API returns a bearer-type access token with a time limit. Only ACTS admin users will be authenticated. Once authenticated, users have access to all ACTS API endpoints. 

All API requests must be made over HTTPS, and API requests without authentication will fail. Security on data is managed by the ACTS platform, and API requests will provide the same admin access available to logged in ACTS admin users. 

The user authentication endpoint uses a POST to generate the access token [bearer token]. 

>Authentication API Endpoint - https: // dev-intelex.us.auth0.com/oauth/token 

## Data Format

The ACTS API only supports [JSON](http://www.json.org/) for requests and responses.

## Response Codes

The ACTS API will respond with the following HTTP status codes:

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

When we make backwards-incompatible changes to the API, we release new versions. The current version of the ACTS API  is v1 and can be determined with our API base path /api/v1/.

>Example API Endpoint : https://{tenant}.actsapi.intelex.com/API/**/v1/TableName