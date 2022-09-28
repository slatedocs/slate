Laboratory data are mapped to FHIR's [Observation](http://hl7.org/fhir/StructureDefinition/Observation){:target="blank"} resource. Laboratory data are obtained via HL7 message from MSK's Laboratory Information System (LIS). Data are mapped to a trial visit and pushed into the Clinical Research Data Warehouse.

> **_NOTE:_** If available in the source data, a LOINC code is mapped to `code.coding.code`, otherwise the `code.coding.code` does not appear in the response. Please refer to the protocol specific Data Transfer Specification for more information.

## Required Parameters
```
GET /msk-apim/external/v2/crit/blaze/api/observations
-H Authorization: Bearer {access_token} 
```

| Parameters      | Required/Optional | Description                   |
| --------------- | ----------------- | ----------------------------- |
| `researchstudy` | required          | MSK unique study number       |
| `category`      | required          | For lab data, use `laboratory`|
| `x-partnerid`   | required          | MSK provided partner ID       |

For a list of optional filtering parameters visit the [Searching page](/searching).

## Example Request

=== "C# "

    ``` c# linenums="1"
    var client = new RestClient("BASE_URL_PLUS_API_PATH?category={A2}&x-partnerid={A3}&researchstudy={A1}");
    client.Timeout = -1;
    var request = new RestRequest(Method.GET);
    request.AddHeader("Authorization", "Bearer {ACCESS_TOKEN}");
    IRestResponse response = client.Execute(request);
    Console.WriteLine(response.Content);
    ```

=== "Python"

    ``` python linenums="1"
    import http.client

    conn = http.client.HTTPSConnection("BASE_URL")
    payload = ''
    headers = {
    'Authorization': 'Bearer {ACCESS_TOKEN}'
    }
    conn.request("GET", "API_PATH?category={A2}&x-partnerid={A3}&researchstudy={A1}", payload, headers)
    res = conn.getresponse()
    data = res.read()
    print(data.decode("utf-8"))
    ```

## Example Response

??? success "Successful Payload Example"
    ```json
      {
        "resourceType": "Bundle",
        "identifier": {
            "system": "https://datapedia.mskcc.org/index.php/IDB.PROTOCOL",
            "value": "FHIR-T"
        },
        "type": "searchset",
        "total": 2,
        "link": [
            {
                "relation": "self",
                "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observations?category=laboratory&researchstudy=FHIR-T&x-partnerid={A3}&page=1"
            },
            {   
                "relation": "first",
                "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observations?category=laboratory&researchstudy=FHIR-T&x-partnerid={A3}&page=1"
            },
            {
                "relation": "last",
                "url": null
            },
            {
                "relation": "previous",
                "url": null
            },
            {
                "relation": "next",
                "url": null
            }
            ],
    "entry": [
        {
            "id": 500009814,
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observations/500009814",
            "resource": {
                "id": 500009814,
                "resourceType": "Observation",
                "extension": [
                    {
                        "valueCode": "FHIR-T",
                        "url": "http://hl7.org/fhir/StructureDefinition/workflow-researchStudy"
                    }
                ],
                "identifier": [
                    {
                        "system": "https://datapedia.mskcc.org/index.php/LAB_RESULTS.LR_RESULT_GUID",
                        "value": 500009814
                    }
                ],
                "status": "final",
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                                "code": "laboratory",
                                "display": "Laboratory"
                            }
                        ],
                        "text": "Laboratory"
                    }
                ],
                "code": {
                    "coding": [
                        {
                            "system": "http://loinc.org",
                            "code": "704-7",
                            "display": "ABAS"
                        }
                    ],
                    "text": "ABAS"
                },
                "subject": {
                    "reference": "Patient/10081007"
                },
                "effectiveDateTime": "2021-12-07T08:06:00+00:00",
                "issued": "2021-12-07T08:06:00+00:00",
                "referenceRange": [
                    {
                        "text": "0.0-0.2"
                    }
                ]
            }
        },
        {
            "id": 500009863,
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observations/500009863",
            "resource": {
                "id": 500009863,
                "resourceType": "Observation",
                "extension": [
                    {
                        "valueCode": "FHIR-T",
                        "url": "http://hl7.org/fhir/StructureDefinition/workflow-researchStudy"
                    }
                ],
                "identifier": [
                    {
                        "system": "https://datapedia.mskcc.org/index.php/LAB_RESULTS.LR_RESULT_GUID",
                        "value": 500009863
                    }
                ],
                "status": "final",
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                                "code": "laboratory",
                                "display": "Laboratory"
                            }
                        ],
                        "text": "Laboratory"
                    }
                ],
                "code": {
                    "coding": [
                        {
                            "system": "http://loinc.org",
                            "code": "13945-1",
                            "display": "URBC"
                        }
                    ],
                    "text": "URBC"
                },
                "subject": {
                    "reference": "Patient/10081007"
                },
                "effectiveDateTime": "2021-12-07T08:18:00+00:00",
                "issued": "2021-12-07T08:18:00+00:00",
                "valueQuantity": {
                    "value": 4,
                    "unit": "/HPF"
                },
                "referenceRange": [
                    {
                        "text": "0-3"
                    }
                ]
            }
        }
    ]
    }
  
    ```
## Field Definitions

| Field                      | Description                                |
| -------------------------- | ------------------------------------------ |
| `id`                       | MSK Unique Identifier                      |
| `extension[0].url`         | FHIR researchStudy extension documentation |
| `extension[0].valueCode`   | MSK IRB Protocol Number                    |
| `extension[1].url`         |                                            |
| `extension[1].valueCode`   | Sponsor Study Number                       |
| `identifier.system`        |                                            |
| `identifier.value`         | MSK Unique Identifier                      |
| `status`                   | Hardcoded to `final`                       |
| `category.coding.system`   | FHIR Observation category documentation    |
| `category.coding.code`     | FHIR Observation category code             |
| `category.coding.display`  | FHIR Observation category display          |
| `category.text`            | FHIR Observation category                  |
| `code.coding.system`       | LOINC documentation                        |
| `code.coding.code`         | LOINC code                                 |
| `code.coding.display`      | MSK test code                              |
| `code.text`                | MSK test code                              |
| `subject.reference`        | `Patient/` + Sponsor assigned subject ID   |
| `encounter.display`        | Protocol visit                             |
| `effectiveDateTime`        | Specimen collection datetime               |
| `issued`                   | Specimen datetime                          |
| `valueQuantity.value`      | Numeric result                             |
| `valueQuantity.unit`       | Test Unit                                  |
| `valueString`              | Text result                                |
| `referenceRange.text`      | Reference range                            |
