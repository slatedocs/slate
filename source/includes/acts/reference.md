## Reference

The Intelex ACTS API provides endpoints in ACTS, with it's own URL for access. If you currently use the Intelex API, you will not be able to use the ACTS API unless you have Admin access to ACTS. At the same time, you can use the ACTS API without any permission for Intelex V6.  

Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, Token based authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API responses, including errors.

### Getting Started with ACTS API

>API Endpoint - replace **intelex_acts_api_url** with the full URL path to your Intelex ACTS API system

```
https://intelex_acts_api_url/api/v1
```

To begin using the Intelex API you will need:

* A valid Intelex ACTS user account
* The full URL to your Intelex ACTS API and system
* The full URL to authentication endpoint
* Understanding of the Intelex ACTS Application.

### ACTS API Authentication

>Example Requests:

```CSharp 
//JSON Body for Authentication Endpoint
{"client_id":"Client ID Data",
"client_secret":"Client Secret Data",
"audience":"https://intelex_acts_api_url/api",
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

Intelex's ACTS API uses tokens based authentication. Only ACTS Admin users can access the API. 

During the authentication process, the client provides the 'client id' and 'client secret' to the authentication endpoint, along with the audience and grant type, as demonstrated above. In response, the API furnishes an access token that comes with a specified time limit. This authentication is exclusively applicable to admin users. After successful authentication, users gain unrestricted access to all ACTS API endpoints.

All interactions with the API are required to occur via HTTPS, and any API requests lacking proper authentication will result in failure. Data security is meticulously overseen by the ACTS platform, ensuring that API requests grant identical administrative access as enjoyed by authenticated ACTS admin users.

The user authentication endpoint uses a POST to generate the access token [bearer token].

### ACTS API Versioning

When we make backwards-incompatible changes to the API, we release new versions. The current version of the ACTS API  is v1 and can be determined with our API base path /api/v1/.

>Example API endpoint : https://intelex_acts_api_url/api/v1

### API's and Associated Database Tables 

This ACTS API release includes 11 GET enpoints and 4 POST endpoints, along with the authentication endpoint described above. The tables that can be queried and updated are as follows. 

Database Tables supporting GET requests 

1. Operation 					   
2. Equipment				    
3. Emission Type			     
4. Emission Category
5. Equipment Status
6. Unit
7. Attribute Type 
8. Equipment Type
9. Compound

Database Tables supporting POST requests 

1. Equipment
2. Operation
3. Facility
4. Facility Attribute