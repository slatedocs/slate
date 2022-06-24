In order to make use of Blaze, you’ll need to be set up as an MSK “partner” so that you can consume clinical research data. If you would like to request access to data for a research study at MSK, please send a request to rtmcritds@mskcc.org.

Authentication is based on the Client Credentials grant. This means that clients will need to generate an access token and supply it in the headers of each request being made. Once you are established as a partner, you’ll be given a `client_id` and a `client_secret`, which you will use for generating tokens and using them to make authenticated requests to the server.

## Protocol Access

All data access is restricted on a per protocol basis. It is assumed that incoming requests to Blaze always contains a researchstudy parameter, which identifies what research study the client is requesting data for. This information is used in combination with the researchstudy parameter to authorize requests.

## Generating Access Tokens

To generate access tokens, partners need to make a POST request to the appropriate endpoint using the MSK provided `client_id` and `client_secret`.

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

## Making Requests

To make requests, include the bearer token you generated in your requests as a part of the Authorization header and an additional x-partnerid header must also be included.

> Note: MSK HL7 FHIR server only exposes JSON.