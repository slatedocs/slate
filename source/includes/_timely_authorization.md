# Introduction

Welcome! Timely API helps you integrate your application with Timely. Following are the list of API’s available. For any help or support email support@timelyapp.com

# Authentication

OAuth2 Authentication: http://tools.ietf.org/html/rfc6749

Create a OAuth Application (only available to the Admin User):
https://timelyapp.com/:account_id/oauth_applications

Enter your application name and the redirect_url to your application.

Acquire the Application Id and Secret.

You can find the old api documentation [here](https://dev.timelyapp.com/v0)

> Base URL for all API's is:
https://api.timelyapp.com/1.1


# Authorization

<aside class="notice">
Timely's OAuth implementation supports the standard authorization code grant type. You should implement the application flow described below to obtain an authorization code and then exchange it for a token.
</aside>

## OAuth Code

```
Example Request: (try this in web browser)
https://api.timelyapp.com/1.1/oauth/authorize?response_type=code
&redirect_uri=your_redirect_uri&client_id=your_client_id
```

Users are redirected to request their Timely identity.

### HTTP Request

`GET /oauth/authorize`

### Compulsory Parameters

Parameter | Description
--------- | -----------
response_type | code
redirect_uri  | http://your-redirect-url/
client_id | your_application_id

If the user accepts your request, Timely will redirect back with the code parameter, which you need to use to get the token.

## OAuth Token

```shell
Example Request:
curl -X POST --data "redirect_uri=https://your-redirect_url/&code=your_response_code
&client_id=application_id&client_secret=application_secret&grant_type=authorization_code"
https://api.timelyapp.com/1.1/oauth/token
```

```json
{
  "access_token":"1886f011cd72eabc88d087eabd741b51a9059f5ba57c7bc439285fe86a4e465a",
  "token_type":"bearer",
  "refresh_token":"9db4d1a5d87c707b8125d8f93ad08091fb3ff8b93be901dbeaba968cf532ed9b"
}
```

```
200 OK
```

Users are redirected to request their Timely identity.

### HTTP Request

`POST /oauth/token`

### Compulsory Parameters

Parameter | Description
--------- | -----------
redirect_uri | http://your-redirect-url/
code  | your_response_code
client_id | your_application_id
client_secret | your_application_secret
grant_type | authorization_code

The response will be a token with a refresh token. Use the token to use the following API.
