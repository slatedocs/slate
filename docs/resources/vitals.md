
Vitals data are mapped to FHIR's [Observation](http://hl7.org/fhir/StructureDefinition/Observation){:target="blank"} resource. Data are mapped to a trial visit and pushed into the Clinical Research Data Warehouse.


## Required Parameters

```
GET /msk-apim/external/v1/crit/blaze/api/observations
-H Authorization: Bearer {access_token} 
```

|# | Parameters    | Description                          |
|:-| :---------- | :----------------------------------- |
|A1| `researchstudy`       | :material-check: MSK unique study number  |
|A2|`category`       |:material-check: Default value: **vital-signs** |
|A3|`x-partnerid` |:material-check: suply given partnerid|
|A4|Filter: Optional Parameters go to [Filter page](/../searching) |

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
                    "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/observations?category=laboratory&researchstudy=FHIR-T&x-partnerid={A3}&page=1"
                },
                {   
                    "relation": "first",
                    "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/observations?category=laboratory&researchstudy=FHIR-T&x-partnerid={A3}&page=1"
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
                "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/observations/500009814",
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
                "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/observations/500009863",
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

| Field                     | Description                                |
| ------------------------- | ------------------------------------------ |
| `id`                      | MSKCC Unique Identifier                    |
| `extension[0].url`        | FHIR researchStudy extension documentation |
| `extension[0].valueCode`  | MSKCC IRB Protocol Number                  |
| `extension[1].url`        | MSKCC identifiers documentation            |
| `extension[1].valueCode`  | Sponsor Study Number                       |
| `identifier.system`       |                                            |
| `identifier.value`        | MSKCC Unique Identifier                    |
| `category.coding.system`  | FHIR observation documentation             |
| `category.coding.code`    | hardcoded to `vital-signs`                 |
| `category.coding.display` | hardcoded to `Vital Signs`                 |
| `category.text`           | hardcoded to `Vital Signs`                 |
| `code.coding.system`      | Loinc documentation                        |
| `code.coding.code`        | Vital Sign Value                           |
| `code.coding.display`     | Vital Sign Item Type                       |
| `code.text`               | Vital Sign Item Type                       |
| `subject.reference`       | `Patient/` + Sponsor assigned subject ID   |
| `encounter.display`       | Protocol visit                             |
| `effectiveDateTime`       | Collection datetime                        |
| `issued`                  | Collection datetime                        |