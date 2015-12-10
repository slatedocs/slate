## Creating an Application

In order to use the TradeGecko API, you must first have a TradeGecko 
account, you can register a new application at 
[https://go.tradegecko.com/oauth/applications](https://go.tradegecko.com/oauth/applications).
After successfully creating a new application, you will be given a set of 2
unique keys: 

- APPLICATION ID
- APPLICATION SECRET

These keys are needed in order to obtain an access token to make the API calls.

TradeGecko is based on [version 22 of the OAuth 2.0 specification](http://tools.ietf.org/html/draft-ietf-oauth-v2-22).

If you are already familiar with OAuth, then all you really need to know
about are the two authentication endpoints. The authorization endpoint
and the token request endpoint.

These endpoints are:

- **https://api.tradegecko.com/oauth/authorize**
- **https://api.tradegecko.com/oauth/token**
