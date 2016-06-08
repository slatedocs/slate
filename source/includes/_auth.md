
# Authentication

callstats.io offers basic authentication over HTTPS (requires only client implementation). In the near future Third-party authentication method will be available. 


## Basic Authentication over HTTPS

The application requires an `AppID` and `AppSecret` to authenticate with callstats.io. The origin server is expected to pass the `userID` for each endpoint in a WebRTC call. The `callstats.js` internally implements a 4-way handshake, based on simple [challenge-response](https://en.wikipedia.org/wiki/Challenge%E2%80%93response_authentication) protocol. If successful, the callstats.js generates a token valid for 2 hours. The `token` is  subsequently used by the callstats.js to send event and measurement data to callstats.io.

### White-listing (Optional but highly recommended)

callstats.io uses the “Origin” header in the HTTP request to fetch the request’s origin. [RFC6454](http://tools.ietf.org/html/rfc6454#section-4) explains the algorithm used by user-agents to compute the “Origin” header.

callstats.io compares the Origin URL sent by the HTTP user-agent in the authentication message with the stored Origin URL for that particular AppID. If the origins match, callstats.io returns a new token and associates the token to the requesting userID. Alternatively, if the origins does not match, callstats.io rejects the request, and denies access to that particular user-agent.
