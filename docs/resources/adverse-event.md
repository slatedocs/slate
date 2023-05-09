Adverse event data are mapped to FHIR's [Adverse Event](http://hl7.org/fhir/adverseevent.html){:target="blank"} resource. This is not a visit specific data element and does not require any adjudication by study staff.

> **_NOTE:_** The data set available does not currently include lab toxicities.

## Request
```
GET /msk-apim/external/v2/crit/blaze/api/AdverseEvent
-H Authorization: Bearer {access_token} 
-H x-partnerid: {partnerId}
```
### Query Parameters
| Parameters      | Type   | Is Required | Description                          |
| --------------  | ------ | ----------- | ------------------------------------ |
| `researchstudy` | string | true        | MSK unique study number              |
| `x-partnerid`   | string | true        | MSK provided partner ID              |

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
    "total": 1041,
    "link": [
        {
          "relation": "self",
          "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/adverseevent?researchstudy=FHIR-T&_count=3&page=1"
        },
        {
          "relation": "first",
          "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/adverseevent?researchstudy=FHIR-T&_count=3&page=1"
        },
        {
          "relation": "last",
          "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/adverseevent?researchstudy=FHIR-T&_count=3&page=347"
        },
        {
          "relation": "previous",
          "url": "null"
        },
        {
          "relation": "next",
          "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/adverseevent?researchstudy=FHIR-T&_count=3&page=2"
        }
    ],
    "entry": [
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/adverseevent?researchstudy=FHIR-T&page=1&_count=3&Id=10081004",
            "resource": {
            "resourceType": "AdverseEvent",
            "id": "10081004",
            "extension": [
                {
                "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                "valueString": "C3861001"
                },
                {
                "url": "https://fhir.mskcc.org/structure-definitions/#StartDate",
                "valueString": "07/05/2021"
                },
                {
                "url": "https://fhir.mskcc.org/structure-definitions/#AdverseEventSequenceNumber",
                "valueInteger": 1
                },
                {
                "url": "https://fhir.mskcc.org/structure-definitions/#VerifiedIndicator",
                "valueInteger": 0
                },
                {
                "url": "https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm#Grade",
                "valueInteger": 1
                },
                {
                "url": "https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm",
                "valueDecimal": 5.0
                },
                {
                "url": "https://fhir.mskcc.org/structure-definitions/#AEOngoing",
                "valueInteger": 0
                }
            ],
            "identifier": {
                "system": "https://fhir.mskcc.org/structure-definitions/",
                "value": "FHIR-T-FHIR-00002-41-1"
            },
            "actuality": "actual",
            "event": {
                "coding": [
                {
                    "system": "https://www.meddra.org",
                    "display": "Abdominal pain"
                }
                ]
            },
            "subject": {
                "reference": "Patient/10081004",
                "display": "10081004"
            },
            "date": "2021-07-05T00:00:00",
            "outcome": {
                "coding": [
                {
                    "system": "http://hl7.org/fhir/2021Mar/valueset-adverse-event-outcome.html",
                    "code": "ongoing",
                    "display": "Ongoing"
                }
                ]
            },
            "suspectEntity": [
                {
                "causality": [
                    {
                    "assessment": {
                        "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess",
                            "display": "Possible"
                        }
                        ]
                    },
                    "productRelatedness": "PF-06801591"
                    }
                ]
                }
            ],
            "study": [
                {
                "reference": "Study/FHIR-T"
                }
            ]
            }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/adverseevent?researchstudy=fhir-t&page=1&_count=3&Id=10081004",
            "resource": {
            "resourceType": "AdverseEvent",
            "id": "10081004",
            "extension": [
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                "valueString": "C3861001"
              },
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#StartDate",
                "valueString": "07/05/2021"
              },
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#AdverseEventSequenceNumber",
                "valueInteger": 1
              },
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#VerifiedIndicator",
                "valueInteger": 0
              },
              {
                "url": "https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm#Grade",
                "valueInteger": 1
              },
              {
                "url": "https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm",
                "valueDecimal": 5.0
              },
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#AEOngoing",
                "valueInteger": 0
              }
            ],
            "identifier": {
              "system": "https://fhir.mskcc.org/structure-definitions/",
              "value": "FHIR-T-FHIR-00002-41-1"
            },
            "actuality": "actual",
            "event": {
              "coding": [
                {
                  "system": "https://www.meddra.org",
                  "display": "Abdominal pain"
                }
              ]
            },
            "subject": {
              "reference": "Patient/10081004",
              "display": "10081004"
            },
            "date": "2021-07-05T00:00:00",
            "outcome": {
              "coding": [
                {
                  "system": "http://hl7.org/fhir/2021Mar/valueset-adverse-event-outcome.html",
                  "code": "ongoing",
                  "display": "Ongoing"
                }
              ]
            },
            "suspectEntity": [
              {
                "causality": [
                  {
                    "assessment": {
                      "coding": [
                        {
                          "system": "http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess",
                          "display": "Possible"
                        }
                      ]
                    },
                    "productRelatedness": "PF-06801591"
                  }
                ]
              }
            ],
            "study": [
              {
                "reference": "Study/FHIR-T"
              }
            ]
          }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/adverseevent?researchstudy=fhir-t&page=1&_count=3&Id=10081004",
            "resource": {
            "resourceType": "AdverseEvent",
            "id": "10081004",
            "extension": [
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                "valueString": "C3861001"
              },
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#StartDate",
                "valueString": "07/05/2021"
              },
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#AdverseEventSequenceNumber",
                "valueInteger": 1
              },
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#VerifiedIndicator",
                "valueInteger": 0
              },
              {
                "url": "https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm#Grade",
                "valueInteger": 1
              },
              {
                "url": "https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm",
                "valueDecimal": 5.0
              },
              {
                "url": "https://fhir.mskcc.org/structure-definitions/#AEOngoing",
                "valueInteger": 0
              }
            ],
            "identifier": {
              "system": "https://fhir.mskcc.org/structure-definitions/",
              "value": "FHIR-T-FHIR-00002-41-1"
            },
            "actuality": "actual",
            "event": {
              "coding": [
                {
                  "system": "https://www.meddra.org",
                  "display": "Abdominal pain"
                }
              ]
            },
            "subject": {
              "reference": "Patient/10081004",
              "display": "10081004"
            },
            "date": "2021-07-05T00:00:00",
            "outcome": {
              "coding": [
                {
                  "system": "http://hl7.org/fhir/2021Mar/valueset-adverse-event-outcome.html",
                  "code": "ongoing",
                  "display": "Ongoing"
                }
              ]
            },
            "suspectEntity": [
              {
                "causality": [
                  {
                    "assessment": {
                      "coding": [
                        {
                          "system": "http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess",
                          "display": "Possible"
                        }
                      ]
                    },
                    "productRelatedness": "PF-06801591"
                  }
                ]
              }
            ],
            "study": [
              {
                "reference": "Study/FHIR-T"
              }
            ]
          }
        }
      ]
    }
  
    ```

### Field Definitions

| Field                                               | Description                                                |
| --------------------------------------------------- | ---------------------------------------------------------- |
| `id`                                                |                                                            |
| `extension[0].url`                                  | MSK identifiers documentation                              |
| `extension[0].valueCode`                            | Sponsor Study Number                                       |
| `extension[1].url`                                  | MSK identifiers documentation                              |
| `extension[1].valueCode`                            | Start date as it appears in the source system              |
| `extension[2].url`                                  | MSK identifiers documentation                              |
| `extension[2].valueCode`                            | End date as it appears in the source system                |
| `extension[3].url`                                  | MSK identifiers documentation                              |
| `extension[3].valueCode`                            | System generated sequential sub number of an adverse event |
| `extension[4].url`                                  | MSK identifiers documentation                              |
| `extension[4].valueCode`                            | Whether or not an event was verified in the source system  |
| `extension[5].url`                                  | Common Terminology Criteria for Adverse Events (CTCAE)     |
| `extension[5].valueCode`                            | Grade of the Adverse Event                                 |
| `extension[6].url`                                  | Common Terminology Criteria for Adverse Events (CTCAE)     |
| `extension[6].valueCode`                            | Adverse Event Version                                      |
| `extension[7].url`                                  | MSK identifiers documentation                              |
| `extension[7].valueCode`                            | Whether or not an event is Ongoing                         |
| `identifier.system`                                 | MSK Structural Definitions documentation                   |
| `identifier.value`                                  | Protocol Number - MRN - Adverse Event No - Sequence No     |
| `actuality`                                         | hardcoded to `Actual`                                      |
| `event.coding.system`                               | MedDRA documentation                                       |
| `event.coding.display`                              | Adverse Event Toxicity                                     |
| `subject.reference`                                 | Patient/ + Sponsor assigned subject ID                     |
| `subject.display`                                   | Sponsor assigned subject ID                                |
| `date`                                              | Adverse Event Start Date                                   |
| `outcome.coding.system`                             | FHIR Adverse Event Outcome documentation                   |
| `outcome.coding.code`                               |                                                            |
| `outcome.coding.display`                            |                                                            |
| `suspectEntity.causality.assessment.coding.system`  | FHIR Adverse Event Causality documentation                 |
| `suspectEntity.causality.assessment.coding.display` |                                                            |
| `suspectEntity.causality.productRelatedness`        | Investigational agent                                      |
| `study.reference`                                   | Study/ + MSK unique study number                           |
| `study.identifier.value`                            |                                                            |
| `study.display`                                     | hardcoded to `AdverseEvent`                                |