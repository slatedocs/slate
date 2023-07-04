# ACTS API Reference

The Intelex API[ACTS API] is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API responses, including errors.

## Getting Started

To begin using the Intelex API you will need:
*	Your own instance of the Intelex platform with the REST API enabled.
*	A valid Intelex ACTS user account
*	The full URL to your Intelex ACTS API and system
*	A basic understanding of the Intelex ACTS API Application.

>API Endpoint - replace **intelex_ACTS API url** with the full URL path to your Intelex system

```
https://*.actsapi.intelex.com
```

## Authentication
>Example Requests:

```CSharp 

//PostMan Body for Authentication Endpoint
{"client_id":"Client ID Data",
"client_secret":"Client Secret Data",
"audience":"https://*.intelex.com/API-release",
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

Intelex ACTS API utilizes tokens for authentication, and it uses the Auth0 for the authentication process. 
In which the client would be passing the client id and client secret to the auth0 validation endpoint along with those two things they would pass the audience and grant type as well. Which results in the access token of type bearer which has a time limit further this access token is used as authentication code to access all other ACTS – API’s.

The unique generated key can then be used to access the Intelex ACTS APIs - REST API and used to authenticate and prove that the user is who they claim to be.

All API requests must be made over HTTPS and API requests without authentication will fail. Security on data is managed by the platform security configuration.

API requests will maintain the same security settings you have configured in the platform for each user. Here we are having a authentication POST API which is used for generating the access token [bearer token] to which we can pass it on the required input parameters.

>Authentication API Endpoint - https: // dev-intelex.us.auth0.com/oauth/token 

## Data Format

The Intelex API - ACTS API only supports [JSON](http://www.json.org/) as the data format for requests and responses.

## Response Codes

The Intelex ACTS API's - REST API will respond with the following HTTP status codes:

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

When we make backwards-incompatible changes to the API, we release new versions. The current version of ACTS – API  is v1 and can be determined with our API base path /api/v1/.

>Example API Endpoint : https://*.intelex.com/API/**/v1/TableName


