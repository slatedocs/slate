
# Authentication

[callstats.io]({{site.callstats.backend-url}}) offers two authentication
methods:

1. Basic over HTTPS (requires only client implementation)

2. Third Party Authentication (requires changes in both the client and origin server).


## Basic Authentication over HTTPS

The application requires an `AppID` and `AppSecret` to authenticate with [callstats.io]({{site.callstats.backend-url}}). The origin server is expected to pass the `userID` for each endpoint in a WebRTC call. The `callstats.js` internally implements a 4-way handshake, comprising of the following steps request-challenge-response-success/failure. If successful, the callstats.js generates a token valid for {{site.callstats.auth_token_validity}}. The `token` is  subsequently used by the callstats.js to send event and measurement data to [callstats.io]({{site.callstats.backend-url}}).

### Whitelisting

[callstats.io]({{site.callstats.backend-url}}) uses the “Origin” header in the HTTP request to fetch the request’s origin. [RFC6454](http://tools.ietf.org/html/rfc6454#section-4) explains the algorithm used by user-agents to compute the “Origin” header.

[callstats.io]({{site.callstats.backend-url}}) compares the Origin URL sent by the HTTP user-agent in the authentication message with the stored Origin URL for that particular AppID. If the origins match, callstats.io returns a new token and associates the token to the requesting userID. Alternatively, if the origins does not match, callstats.io rejects the request, and denies access to that particular user-agent.

## Third-party Authentication

Instead of relying only on the endpoint for authentication, the callstats.io also implements OAuth, which requires the origin server to handle the challenge-response step of the authentication setup instead of the endpoint.
