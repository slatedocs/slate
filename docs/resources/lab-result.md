Laboratory data are mapped to FHIR's [Observation](https://hl7.org/fhir/2021Mar/observation.html){:target="blank"} resource. Data are ingested into the Clinical Research Data Warehouse via HL7 message from MSK's Laboratory Information System (LIS) and mapped to a trial visit by clinical research staff.

> **_NOTE:_** If available in the source data, a LOINC code is mapped to `code.coding.code`, otherwise the `code.coding.code` does not appear in the response. Please refer to the protocol specific Data Transfer Specification for a list of test names and LOINC codes relevant to your study.

For guidance on mapping [LOINC](https://www.cdisc.org/kb/articles/loinc-and-sdtm) codes to [CDISC](https://datascience.cancer.gov/resources/cancer-vocabulary/cdisc-terminology) or for additional test information, such as the analyte measured or specimen type upon which the observation was made, check out [LOINC's FHIR terminology service](https://loinc.org/fhir/). 


## Request
```
GET /msk-apim/external/v2/crit/blaze/api/observation
-H Authorization: Bearer {access_token} 
-H x-partnerid: {partnerId}
```
### Query Parameters
| Parameters      | Type   | Is Required | Description                   |
| --------------- | ------ | ----------- | ----------------------------- |
| `category`      | string | true        | For lab data use `laboratory` |
| `researchstudy` | string | true        | MSK unique study number       |
| `x-partnerid`   | string | true        | MSK provided partner ID       |

For a list of optional filtering parameters visit the [Searching page](/searching).

### Example Code

=== "C# "

    ``` c# linenums="1"
    var client = new RestClient("BASE_URL_PLUS_API_PATH?category={A2}&researchstudy={A1}");
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
    conn.request("GET", "API_PATH?category={A2}&researchstudy={A1}", payload, headers)
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
        "total": 103,
        "link": [
            {
              "relation": "self",
              "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?category=laboratory&researchstudy=FHIR-T&page=1"
            },
            {
              "relation": "first",
              "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?category=laboratory&researchstudy=FHIR-T&page=1"
            },
            {
              "relation": "last",
              "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?category=laboratory&researchstudy=FHIR-T&page=3"
            },
            {
              "relation": "previous",
              "url": "null"
            },
            {
              "relation": "next",
              "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?category=laboratory&researchstudy=FHIR-T&page=2"
            }
            ],
    "entry": [
        {
                "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?category=laboratory&researchstudy=FHIR-T&Id=500009866",
                "resource": {
                "resourceType": "Observation",
                "id": "500009866",
                "extension": [
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                    "valueString": "FHIR-T"
                  },
                  {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                    "valueString": "C3861001"
                  }
                ],
                "identifier": [
                  {
                    "system": "https://fhir.mskcc.org/structure-definitions/#LAB_RESULTS.LR_RESULT_GUID",
                    "value": "500009866"
                  }
                ],
                "status": "final",
                "category": [
                  {
                    "coding": [
                      {
                        "system": "http://hl7.org/fhir/2021Mar/valueset-observation-category.html",
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
                      "system": "https://loinc.org",
                      "code": "704-7",
                      "display": "ABAS"
                    }
                  ],
                  "text": "ABAS"
                },
                "subject": {
                  "reference": "Patient/10081007"
                },
                "encounter": {
                  "display": "CYCLE1_DAY1"
                },
                "effectiveDateTime": "2021-12-14T02:03:00",
                "issued": "2022-02-15T09:47:08+05:30",
                "performer": [
                  {
                    "display": "Practitioner/YAN"
                  }
                ],
                "valueQuantity": {
                  "value": 0,
                  "unit": "K/mcL"
                },
                "referenceRange": [
                  {
                    "text": "0.0-0.2"
                  }
              ]
           }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?category=laboratory&researchstudy=FHIR-T&Id=500009867",
            "resource": {
            "resourceType": "Observation",
            "id": "500009867",
            "extension": [
                {
                "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                "valueString": "FHIR-T"
                },
                {
                "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                "valueString": "C3861001"
                }
            ],
            "identifier": [
                {
                "system": "https://fhir.mskcc.org/structure-definitions/#LAB_RESULTS.LR_RESULT_GUID",
                "value": "500009867"
                }
            ],
            "status": "final",
            "category": [
                {
                "coding": [
                    {
                    "system": "http://hl7.org/fhir/2021Mar/valueset-observation-category.html",
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
                    "system": "https://loinc.org",
                    "code": "711-2",
                    "display": "AEOS"
                }
                ],
                "text": "AEOS"
            },
            "subject": {
                "reference": "Patient/10081007"
            },
            "encounter": {
                "display": "CYCLE1_DAY1"
            },
            "effectiveDateTime": "2021-12-14T02:03:00",
            "issued": "2022-02-15T09:47:08+05:30",
            "performer": [
                {
                "display": "Practitioner/YAN"
                }
            ],
            "valueQuantity": {
                "value": 0.3,
                "unit": "K/mcL"
            },
            "referenceRange": [
                {
                "text": "0.0-0.7"
                }
            ]
          }
        }
      ]
    }
  
    ```
### Field Definitions

| Field                      | Description                                |
| -------------------------- | ------------------------------------------ |
| `id`                       | MSK Unique Identifier                      |
| `extension[0].url`         | FHIR Structure Definition documentation    |
| `extension[0].valueCode`   | MSK IRB Protocol Number                    |
| `extension[1].url`         | FHIR Structure Definition documentation    |
| `extension[1].valueCode`   | Sponsor Study Number                       |
| `identifier.system`        | FHIR Structure Definition documentation    |
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
| `effectiveDateTime`        | Specimen collection datetime               |
| `issued`                   | Specimen datetime                          |
| `valueQuantity.value`      | Numeric result                             |
| `valueQuantity.unit`       | Test Unit                                  |
| `valueString`              | Text result                                |
| `referenceRange.text`      | Reference range                            |
| `encounter.display`        | Protocol visit                             |
| `performer.display`        | `Practitioner/` + Practitioner (CRT) ID    |
