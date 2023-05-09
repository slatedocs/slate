Response assessments are available through FHIR's [Group]( https://hl7.org/fhir/R4/group.html){:target="blank"}.

## Request
```
GET /msk-apim/external/v2/crit/blaze/api/Group
-H Authorization: Bearer {access_token} 
-H x-partnerid: {partnerId}
```
### Query Parameters
| Parameters      | Type   | Is Required | Description                   |
| --------------- | ------ | ----------- | ----------------------------- |
| `researchstudy` | string | true        | MSK unique study number       |
| `x-partnerid`   | string | true        | MSK provided partner ID       |

For a list of optional filtering parameters visit the [Searching page](/searching).

### Example Code

=== "C# "

    ``` c# linenums="1"
    var client = new RestClient("BASE_URL_PLUS_API_PATH?researchstudy={A1}");
    client.Timeout = -1;
    var request = new RestRequest(Method.GET);
    request.AddHeader("Authorization", "Bearer {ACCESS_TOKEN}");
    request.AddHeader("x-partnerid", "{partnerId}");
    IRestResponse response = client.Execute(request);
    Console.WriteLine(response.Content);
    ```

=== "Python"

    ``` python linenums="1"
    import http.client

    conn = http.client.HTTPSConnection("BASE_URL")
    payload = ''
    headers = {
    'Authorization': 'Bearer {ACCESS_TOKEN}',
    'x-partnerid': '{partnerId}'
    }
    conn.request("GET", "API_PATH?researchstudy={A1}", payload, headers)
    res = conn.getresponse()
    data = res.read()
    print(data.decode("utf-8"))
    ```


## Response

??? success "Successful Payload Example"
    ```json
    {
        "resourceType": "Bundle",
        "identifier": {
            "system": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
            "value": "fhir-t"
        },
        "type": "searchset",
        "total": 3,
        "link": [
        {
            "relation": "self",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/group?researchstudy=fhir-t&page=1"
        },
        {
            "relation": "first",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/group?researchstudy=fhir-t&page=1"
        },
        {
            "relation": "last",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/group?researchstudy=fhir-t&page=1"
        },
        {
            "relation": "previous",
            "url": "null"
        },
        {
            "relation": "next",
            "url": "null"
        }
        ],
        "entry": [
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/group?researchstudy=fhir-t",
            "resource": {
            "resourceType": "Group",
            "identifier": [
                {
                "use": "usual",
                "system": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                "value": "FHIR-T"
                }
            ],
            "type": "person",
            "member": [
                {
                "entity": {
                    "reference": "Patient/10081001"
                }
                },
                {
                "entity": {
                    "reference": "Patient/10081004"
                }
                },
                {
                "entity": {
                    "reference": "Patient/10081007"
                }
                }
            ]
          }
        }
      ]
    }
    ```

### Field Definitions

| Field                                      | Description                                                                                      |
| -------------------------------------------| -------------------------------------------                                                      |
| `identifier.use`                           | always `Usual `                                                                                  |
| `identifier.system`                        | Reference to structure definition                                                                |
| `identifier.value`                         | Unique research study number                                                                     |
| `type`                                     | always `person`                                                                                  |
| `member[x].entity.reference`               | `Patient/` + subject study ID                                                                    |