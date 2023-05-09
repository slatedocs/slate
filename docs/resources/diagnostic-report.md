Response assessments are available through FHIR's [Diagnostic Report](https://hl7.org/fhir/2021Mar/diagnosticreport.html){:target="blank"}. Most fields are available through extensions since they do not map directly to FHIR's Diagnostic Report fields. Lesions measured as part of the assessment are referenced within the array in the results section.

> **_NOTE:_** Assessments must be signed off by a Principal Investigator in order to be accessible through the FHIR server. The available data set is limited to studies using the RECIST 1.1 criteria. To request data using a different criteria, please contact us at <a href="mailto:ctdata@mskcc.org">ctdata@mskcc.org</a>.

## Request
```
GET /msk-apim/external/v2/crit/blaze/api/DiagnosticReport
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
        "value": "FHIR-T"
    },
    "type": "searchset",
    "total": 2,
    "link": [
        {
        "relation": "self",
        "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/DiagnosticReport?researchstudy=FHIR-T&page=1"
        },
        {
        "relation": "first",
        "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/DiagnosticReport?researchstudy=FHIR-T&page=1"
        },
        {
        "relation": "last",
        "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/DiagnosticReport?researchstudy=FHIR-T&page=2"
        },
        {
        "relation": "previous",
        "url": "null"
        },
        {
        "relation": "next",
        "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/DiagnosticReport?researchstudy=FHIR-T&page=2"
        }
    ],
    "entry": [
        {
        "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/DiagnosticReport?researchstudy=FHIR-T&Id=790",
        "resource": {
            "resourceType": "DiagnosticReport",
            "extension": [
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                "valueString": "FHIR-T"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#SponsorId",
                "valueString": "C3861001"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#CaseId",
                "valueInteger": 163
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#TrialName",
                "valueString": "FHIR-T"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#TrialArmName",
                "valueString": "RECIST 1.1"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#RevisionNumber",
                "valueInteger": 5
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#RevisionNumber",
                "valueInteger": 1
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#Name",
                "valueString": "Follow-up 2"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#Timepoint",
                "valueInteger": 2
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#CumulativeQuantityId",
                "valueString": "targetsum"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#CurrentValue",
                "valueDecimal": 37.6
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#Unit",
                "valueString": "mm"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromPrevious",
                "valueString": "-12.0 mm"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromBaseline",
                "valueString": "-42.3 mm"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromNadir",
                "valueString": "-12.0 mm"
            }
            ],
            "identifier": [
            {
                "system": "https://fhir.mskcc.org/structure-definitions/#AssessmentId",
                "value": "790"
            }
            ],
            "status": "final",
            "category": [
            {
                "coding": [
                {
                    "system": "http://hl7.org/fhir/ValueSet/diagnostic-service-sections",
                    "code": "RAD",
                    "display": "Radiology"
                }
                ],
                "text": "Radiology"
            }
            ],
            "subject": {
            "reference": "Patient/10081007"
            },
            "effectiveDateTime": "2006-10-13T09:31:24",
            "result": [
            {
                "reference": "Observation?researchstudy=FHIR-T&category=imaging&id=163-790-NT01",
                "display": "163-790-NT01"
            },
            {
                "reference": "Observation?researchstudy=FHIR-T&category=imaging&id=163-790-NT01a",
                "display": "163-790-NT01a"
            },
            {
                "reference": "Observation?researchstudy=FHIR-T&category=imaging&id=163-790-T01",
                "display": "163-790-T01"
            },
            {
                "reference": "Observation?researchstudy=FHIR-T&category=imaging&id=163-790-T02",
                "display": "163-790-T02"
            }
            ],
            "conclusion": "Partial Response"
        }
        },
        {
        "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/DiagnosticReport?researchstudy=FHIR-T&Id=792",
        "resource": {
            "resourceType": "DiagnosticReport",
            "extension": [
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                "valueString": "FHIR-T"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#SponsorId",
                "valueString": "C3861001"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#CaseId",
                "valueInteger": 163
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#TrialName",
                "valueString": "FHIR-T"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#TrialArmName",
                "valueString": "RECIST 1.1"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#RevisionNumber",
                "valueInteger": 5
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#RevisionNumber",
                "valueInteger": 2
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#Name",
                "valueString": "Baseline"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#Timepoint",
                "valueInteger": 0
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#CumulativeQuantityId",
                "valueString": "targetsum"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#CurrentValue",
                "valueDecimal": 79.9
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#Unit",
                "valueString": "mm"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromPrevious",
                "valueString": "--"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromBaseline",
                "valueString": "0.0 mm"
            },
            {
                "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromNadir",
                "valueString": "--"
            }
            ],
            "identifier": [
            {
                "system": "https://fhir.mskcc.org/structure-definitions/#AssessmentId",
                "value": "792"
            }
            ],
            "status": "final",
            "category": [
            {
                "coding": [
                {
                    "system": "http://hl7.org/fhir/ValueSet/diagnostic-service-sections",
                    "code": "RAD",
                    "display": "Radiology"
                }
                ],
                "text": "Radiology"
            }
            ],
            "subject": {
            "reference": "Patient/10081007"
            },
            "effectiveDateTime": "2006-05-02T11:09:13",
            "result": [
            {
                "reference": "Observation?researchstudy=FHIR-T&category=imaging&id=163-792-NT01",
                "display": "163-792-NT01"
            },
            {
                "reference": "Observation?researchstudy=FHIR-T&category=imaging&id=163-792-NT01a",
                "display": "163-792-NT01a"
            },
            {
                "reference": "Observation?researchstudy=FHIR-T&category=imaging&id=163-792-T01",
                "display": "163-792-T01"
            },
            {
                "reference": "Observation?researchstudy=FHIR-T&category=imaging&id=163-792-T02",
                "display": "163-792-T02"
            }
            ],
            "conclusion": "No"
           }
        }
    ]
    }
    ```

### Field Definitions

| Field                                      | Description                                                                                      |
| -------------------------------------------| -------------------------------------------                                                      |
| `extension[0].url`                         | Reference to structure definition                                                                |
| `extension[0].valueString`                 | MSK unique study number                                                                          |
| `extension[1].url`                         | Reference to structure definition                                                                |
| `extension[1].valueString`                 | Sponsor Study Number                                                                             |
| `extension[2].url`                         | Reference to structure definition                                                                |
| `extension[2].valueInteger`                | Case ID <br/>A case may relate to multiple assessments                                           |
| `extension[3].url`                         | Reference to structure definition                                                                |
| `extension[3].valueString`                 | MSK unique study number as entered in source system                                              |
| `extension[4].url`                         | Reference to structure definition                                                                |
| `extension[4].valueString`                 | Criteria used <br/>Currently only supporting `RECIST 1.1`                                        |
| `extension[5].url`                         | Reference to structure definition                                                                |
| `extension[5].valueInteger`                | Case revision number <br/>Only the highest revision number is available at any given time        |
| `extension[6].url`                         | Reference to structure definition                                                                |
| `extension[6].valueDateTime`               | Assessment revision date                                                                         |
| `extension[7].url`                         | Reference to structure definition                                                                |
| `extension[7].valueInteger`                | Assessment revision number <br/>Only the highest revision number is available at any given time  |
| `extension[8].url`                         | Reference to structure definition                                                                |
| `extension[8].valueString`                 | Assessment name `Baseline | Follow-up {1-25}`                                                    |
| `extension[9].url`                         | Reference to structure definition                                                                |
| `extension[9].valueInteger`                | Assessment number, a sequential value for each assessment                                        |
| `extension[10].url`                        | Reference to structure definition                                                                |
| `extension[10].valueString`                | Measurement type <br/>Currently only supporting `targetsum`                                      |
| `extension[11].url`                        | Reference to structure definition                                                                |
| `extension[11].valueInteger`               | Numerical result value of assessment                                                             |
| `extension[12].url`                        | Reference to structure definition                                                                |
| `extension[12].valueString`                | Unit of result value                                                                             |
| `extension[13].url`                        | Reference to structure definition                                                                |
| `extension[13].valueString`                | Change from previous assessment `+/- {value} mm`                                                 |
| `extension[14].url`                        | Reference to structure definition                                                                |
| `extension[14].valueString`                | Change from baseline `+/- {value} mm`                                                            |
| `extension[15].url`                        | Reference to structure definition                                                                |
| `extension[15].valueString`                | Change from nadir `+/- {value} mm`                                                               |
| `identifier.system`                        | Reference to structure definition                                                                |
| `identifier.value`                         | Unique assessment ID                                                                             |
| `status`                                   | always `final` <br/>Only assessments signed off by study PI are available through FHIR           |
| `category.coding.system`                   | Reference to FHIR coding system                                                                  |
| `category.coding.code`                     | always `RAD`                                                                                     |
| `category.coding.display`                  | always `Radiology `                                                                              |
| `category.text`                            | always `Radiology `                                                                              |
| `subject.reference`                        | `Patient/` + Sponsor assigned subject ID                                                         |
| `effectiveDateTime`                        | Datetime of assessment                                                                           |
| `result[]`                                 | Observations related to assessment                                                               |
| `conclusion`                               | Response classification <br/> `Non-CR/Non-PD | Progressive Disease | Undefined | Partial Response | Not Evaluable | Complete Response | Stable Disease | No | Yes` |
