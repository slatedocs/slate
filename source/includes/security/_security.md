# Security
All communication with Bandwidth APIs are done through secure channels that use HTTP with SSL, HTTPS.

## Finding Your API Account Credentials: UserId, Token, Secret
You can find the API credentials under the Account tab.

![creds](images/creds.png)

## Basic Authentication for REST Services
HTTP Basic authentication with your API token and API secret is required for access to Bandwidth API’s web services. To view your API tokens and secrets, log into the web site with your username and password, then view your profile page in the dashboard. Once you know your API token and secret, you’re ready to make web service requests. Basic authentication takes a username and password to send to the server, but don’t use your Bandwidth API web site username and password. Instead, use your API token in place of your username, and your API secret in place of your password. If you have the curl program installed, you can make a test call to the web service from the command-line. Substitute your API token and secret in the this command to view your user’s details. Almost all HTTP client libraries make basic authentication easy to use. Check your library’s documentation for details. If your HTTP library does not do basic authentication for you, consult the HTTP specification for the basic authentication scheme for implementation details. If you have the curl program installed, you can make a test call to the web service from the command-line. Substitute your API token and secret in the this command to view your user’s details.

### Examples

```shell
curl -u {token}:{secret} https://api.catapult.inetwork.com/v1/users/{user_id}
```

```javascript
var Bandwidth = require("node-bandwidth");

var client = new Bandwidth({
    userId    : "YOUR_USER_ID", // <-- note, this is not the same as the username you used to login to the portal
    apiToken  : "YOUR_API_TOKEN",
    apiSecret : "YOUR_API_SECRET"
});

// Promise
client.Account.get().then(function(info){});

// Callback
client.Account.get(function(err, info){});
```

## Permissions
Bandwidth API users are only allowed to read, modify, and delete resources they own. Attempts to access resources owned by other users through the API will result in an HTTP 403 “Forbidden” status.

## Setting Up Basic Auth for Callbacks
You can password protect your web server for Bandwidth Callbacks for example:

`https://username:password@yoursecurehost.com/yoursecureapp`

Modify the callback URL for your application. This can be done through the API ([see documentation](#applications)) or through the web portal on the “My Apps” tab. Select the Application you want to modify, and then click the “Edit” button.

![api](images/basic-auth.png)

Scroll down and edit either the “Call URL” or the “Messaging URL” (or both). The URL should be structured as follows:

`https://{username}:{password}@yourdomain.com/`

You must use HTTPS in order to use basic auth with App Platform callbacks, and your callback server should present a valid, trusted certificate. Your username and password should also be [URL Encoded](http://www.w3schools.com/tags/ref_urlencode.asp) to prevent special characters from being lost.

![api2](images/basic-auth2.png)

Basic Auth also works for Call and Messaging fallback URLs as well. In addition, you can also use Basic Auth in your callbacks for specific messages and calls that you create. For instance, if you want callback events for a specific outgoing message, when you create the message with a `POST` to the API and set the callback URL, you can add credentials to this URL as well. The same requirements (HTTPS, and URL Encoded) apply here as well.

When your application receives a callback from the App Platform, the “Authorization” header will now be set. The “Authorization” header will tell your application what type of authorization is being sent – in this case “Basic” – followed by a [Base64 Encoded](https://en.wikipedia.org/wiki/Base64) string containing the username and password, separated by a colon, that you configured in your callback URL.

![api3](basic-auth3.png)

Your application can now be written to only accept a request if it contains the expected credentials in the “Authorization” header, because only you will ever know the credentials. When you set the callback URL on the API (or on the web portal) the credentials are encrypted in transit, and they are also encrypted when they are stored in the database. They are also encrypted in transit between your application and the App Platform, so other parties cannot extract your credentials by inspecting your network traffic. This is why it is important to use a valid, trusted certificate on your application server, to ensure the security of your callbacks.
