# Getting Started

The MSK Blaze API is organized around REST. Each FHIR resource type currently supports [read](http://build.fhir.org/http.html#read) and [search](http://build.fhir.org/http.html#search) capabilities.

## Authentication

In order to make use of Blaze, you’ll need to be set up as an MSK “partner” so that you can consume clinical research data. If you would like to request access to data for a research study at MSK, please send a request to rtmcritds@mskcc.org.

Authentication is based on the Client Credentials grant. This means that clients will need to generate an access token and supply it in the headers of each request being made. Once you are established as a partner, you’ll be given a `client_id` and a `client_secret`, which you will use for generating tokens and using them to make authenticated requests to the server.

## Generating Tokens

To generate access tokens, partners need to make a POST request to the appropriate endpoint using the MSK provided `client_id` and `client_secret`:

## Hosts

### Staging

```
https://test/
```

### Production

```
https://test/
```

Request
```
POST /msk-apim/external/msk-oidc/oauth2/token HTTP/1.1
Host: 
Content-Type:
client_id=
client_secret=
grant_type=
scope=
```

Response
```json
{
    "token_type": "",
    "access_token": "",
    "scope": "",
    "expires_in": ,
    "consented_on": 
}
```

