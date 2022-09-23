Authentication is based on the Client Credentials grant. After being registered as a partner, your oganization will receive a `client_id` and a `client_secret`. These keys are required to generate tokens and make authenticated requests to the server. Valid access tokens are expected in the headers of each request.

## Protocol Access

All data access is granted on a per protocol basis therefore, it is expected that incoming requests to Blaze always contain a `researchstudy` parameter. The value passed into this parameter in combination with the "partner" credentials are used to validate and authorize requests.

## Generating Access Tokens

**Access tokens** must be included in all resources endpoints. To generate a token use the following endpoint and listed parameters:
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