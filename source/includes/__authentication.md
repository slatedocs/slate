

# Authentication

> To authorize, we need to create an access token for your APIs:

```APIs
POST https://zoomsymbols.com/authenticate
```
> BODY 
```json
{
  "email": "your zoomsymbols email address",
  "password": "your zoomsymbols password",
}
```
> Response
```json
{
    "status": "Authorized",
    "access_token": {
        "accessToken": "xxxxx",
        "expiresAt": "2019-02-06T11:31:12.449Z"
    },
    "accepted_terms": false
}
````

> Make sure to replace `email and password` with your Zoomsymbols account.

Zoomsymbols uses API keys to allow access to the API. You can register a new Zoomsymbols API key at our [developer portal](https://dev.zoomsymbols.com/).

Zoomsymbols expects for the API key to be included in all API requests to the server in a header that looks like the following:

`access_token: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

