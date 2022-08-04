In order to make use of Blaze, you’ll need to be set up as an MSK “partner” so that you can consume clinical research data. If you would like to request access to data for a research study at MSK, please send a request to [rtmcritds@mskcc.org](mailto:rtmcritds@mskcc.org).

Authentication is based on the Client Credentials grant. This means that clients will need to generate an access token and supply it in the headers of each request being made. Once you are established as a partner, you will receive a `client_id` and a `client_secret`, which you will use to generate token make authenticated requests to the server.

## Protocol Access

All data access is granted on a per protocol basis therefore, it is a requirement that incoming requests to Blaze always contain a `researchstudy` parameter. The value passed into this parameter in combination with the "partner" credentials are used to validate and authorize requests.

## Generating Access Tokens

**Access tokens** must be included in all resources endpoints. To generate a token using the following endpoint,
```
POST /msk-apim/external/msk-oidc/oauth2/token
```


| Parameter       | Required/Optional | Description                                                |
| --------------- | ----------------- |----------------------------------------------------------- |
| `client_id`     |  required         | MSK provided unique client ID                              |
| `client_secret` |  required         | MSK provided unique client secret                          |
| `grant_type`    |  required         | Use value: `client_credentials`             |
| `scope`         |  required         | Use value: `full`                          |
   

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



## Response Example

> **_NOTE:_** MSK HL7 FHIR server only exposes data in JSON format.

```json
{
    "token_type": "Bearer",
    "access_token": "AAIgYjViOTE2M2I4NDllNjZjOWQ5NjU0NjhkNmNhYzRkODYq65uQhqOGeqVSCDv0lXV26qPr9cfIal10SXlRiw0RDTAbBgqeRMSTbL6EqQSPIxCVYRwBWyaITs9QJG375CCmVX2bux4ocVUlGiGHg5qrXIAOESCGor32u89RVZxfw7I",
    "scope": "full",
    "expires_in": 3600,
    "consented_on": 1656086348
}
```