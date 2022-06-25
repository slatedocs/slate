In order to make use of Blaze, you’ll need to be set up as an MSK “partner” so that you can consume clinical research data. If you would like to request access to data for a research study at MSK, please send a request to rtmcritds@mskcc.org.

Authentication is based on the Client Credentials grant. This means that clients will need to generate an access token and supply it in the headers of each request being made. Once you are established as a partner, you’ll be given a `client_id` and a `client_secret`, which you will use for generating tokens and using them to make authenticated requests to the server.

## Protocol Access

All data access is restricted on a per protocol basis. It is assumed that incoming requests to Blaze always contains a researchstudy parameter, which identifies what research study the client is requesting data for. This information is used in combination with the researchstudy parameter to authorize requests.

## Generating Access Tokens
```
POST /msk-apim/external/msk-oidc/oauth2/token
```
This endpoint is use to to generate an access token, **access tokens** must be included in all resources endpoints.

| Parameters    | Description                          |
| :---------- | :----------------------------------- |
| `client_id`       | :material-check: Unique Sponsor MSK FHIR Blaze ClientID  |
| `client_secret`       |:material-check: Unique Sponsor MSK FHIR Blaze ClientSecret |
| `grant_type`    | :material-check: Use value: client_credentials |
| `scope`         |:material-check:  Use value: full|
   

=== "C# - RestSharp"

    ``` c#
    var client = new RestClient("BASE_URL_PLUS_TOKEN_PATH");
    client.Timeout = -1;
    var request = new RestRequest(Method.POST);
    request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
    request.AddParameter("client_id", "MSK_PROVIDED_CLIENTID");
    request.AddParameter("client_secret", "MSK_PROVIDED_SECRET");
    request.AddParameter("grant_type", "client_credentials");
    request.AddParameter("scope", "full");
    IRestResponse response = client.Execute(request);
    Console.WriteLine(response.Content);
    ```

=== "Python"

    ``` python
    import http.client

    conn = http.client.HTTPSConnection("BASE_URL")
    payload = 'client_id=MSK_PROVIDED_CLIENTID&client_secret=MSK_PROVIDED_SECRET&grant_type=client_credentials&scope=full'
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
    }
    conn.request("POST", "/msk-apim/external/msk-oidc/oauth2/token", payload, headers)
    res = conn.getresponse()
    data = res.read()
    print(data.decode("utf-8"))
    ```



Response Example
```json
{
    "token_type": "Bearer",
    "access_token": "AAIgYjViOTE2M2I4NDllNjZjOWQ5NjU0NjhkNmNhYzRkODYq65uQhqOGeqVSCDv0lXV26qPr9cfIal10SXlRiw0RDTAbBgqeRMSTbL6EqQSPIxCVYRwBWyaITs9QJG375CCmVX2bux4ocVUlGiGHg5qrXIAOESCGor32u89RVZxfw7I",
    "scope": "full",
    "expires_in": 3600,
    "consented_on": 1656086348
}
```




> Note: MSK HL7 FHIR server only exposes JSON.