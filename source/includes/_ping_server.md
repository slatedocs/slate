# Ping Server
## `GET /api/ping`

> [ GET /api/ping ]

> All API interactions will require your Sendle ID and your API Key as username and password for HTTP Basic Authentication (Make sure to replace **sendleID** and **APIKey** with your Sendle ID & API key.)

```shell
  curl 'https://www.sendle.com/api/ping'
  -u sendleID:APIKey
```

Sendle uses your **Sendle ID** together with your own **API Key** to grant access to the server. Together this allows you to access the API so that you may book and follow up with orders, as well as view past orders you have sent or received.

For this initial example, we'll simply ping the server.

You must include your credentials in every request, or you will be denied. If you only you include your `Sendle ID`, you will be prompted to enter your API key (password).

### OK Response

> Status 200:

```json
  {
    "ping":"pong"
  }
```

When the api receives a request with a `Sendle ID` and an `API Key` the server responds with a `JSON` string containing the relevant details.

### Without Credentials
> No Sendle ID AND No API Key

```shell
  curl 'https://www.sendle.com/api/ping'
```

> Response:

```json
  HTTP Basic: Access denied.
```

> Response With incorrect Credentials:

```json
  {
    "error":"unauthorised",
    "error_description":"The authorisation details are not valid. Either the Sendle ID or API key are incorrect."
  }
```

<aside class='warning'>Errors are covered in detail in the <a href="#errors">Errors</a> Section (see sidebar)</aside>
