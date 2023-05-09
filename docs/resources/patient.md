Demographics data are mapped to FHIR's [Patient](http://hl7.org/fhir/patient.html){:target="blank"} resource. Data flows from MSK's Revenue Management System (RMS) into the Clinical Research Data Warehouse. Patients are identified by the sponsor subject ID.

## Request

```
GET /msk-apim/external/v2/crit/blaze/api/Patient
-H Authorization: Bearer {access_token}
-H x-partnerid: {partnerId}
```
### Query Parameters
| Parameters      | Type    | Is Required  | Description                          |
| --------------  | ------- | ------------ | ------------------------------------ |
| {id}            | string  | conditional* | Sponsor assigned subject ID          |
| `researchstudy` | string  | conditional* | MSK unique study number              |
| `x-partnerid`   | string  | true         | MSK provided partner ID              |

*Patient search requests require one of the following to return data: researchstudy or {id}. Patient requests submitted using {id} will return data only if that subject is part of the studies `x-partnerid` has access to.

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
        "value": "FHIR-T"
    },
    "type": "searchset",
    "total": 3,
    "link": [
        {
            "relation": "self",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/patient?researchstudy=FHIR-T&page=1"
        },
        {
            "relation": "first",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/patient?researchstudy=FHIR-T&page=1"
        },
        {
            "relation": "last",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/patient?researchstudy=FHIR-T&page=1"
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
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/patient/10081001",
            "resource": {
                "resourceType": "Patient",
                "id": "10081001",
                "extension": [
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                    "valueString": "FHIR-T"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Race",
                    "valueString": "White"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Ethnicity",
                    "valueString": "NON"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                    "valueString": "C3861001"
                  }
                ],
                "identifier": [
                  {
                    "system": "https://fhir.mskcc.org/structure-definitions/#SubjectStudyId",
                    "value": "10081001"
                  }
                ],
                "gender": "male",
                "birthDate": "1988"
            }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/patient/10081004",
            "resource": {
                "resourceType": "Patient",
                "id": "10081004",
                "extension": [
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                    "valueString": "FHIR-T"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Race",
                    "valueString": "White"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Ethnicity",
                    "valueString": "NON"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                    "valueString": "C3861001"
                  }
                ],
                "identifier": [
                  {
                    "system": "https://fhir.mskcc.org/structure-definitions/#SubjectStudyId",
                    "value": "10081004"
                  }
                ],
                "gender": "male",
                "birthDate": "1976"
            }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/patient/10081007",
            "resource": {
                "resourceType": "Patient",
                "id": "10081007",
                "extension": [
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                    "valueString": "FHIR-T"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Race",
                    "valueString": "White"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Ethnicity",
                    "valueString": "NON"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                    "valueString": "C3861001"
                  }
                ],
                "identifier": [
                  {
                    "system": "https://fhir.mskcc.org/structure-definitions/#SubjectStudyId",
                    "value": "10081007"
                  }
                ],
                "gender": "male",
                "birthDate": "1948"
            }
        }
    ]
    }
  
    ```

### Field Definitions

|  Field                        | Description                     |
| ----------------------------- | ----------------------------    |
| `id`                          | Sponsor assigned subject ID     |
| `extension[0].url`            | MSK Patient documentation       |
| `extension[0].valueCode`      | MSK Protocol number             |
| `extension[1].url`            | MSK Race documentation          |
| `extension[1].valueCode`      | MSK Race code                   |
| `extension[2].url`            | MSK Ethnicity documentation     |
| `extension[2].valueCode`      | MSK Ethnicity code              |
| `extension[3].url`            | MSK identifiers documentation   |
| `extension[3].valueCode`      | Sponsor Study Number            |
| `identifier.system`           | MSK Subject Study Number Documentation |
| `identifier.value`            | Subject Study Number            |
| `gender`                      | Gender                          |
| `birthDate`                   | Year of birth                   |