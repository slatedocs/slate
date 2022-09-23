Adverse event data are mapped to FHIR's [Adverse Event](http://hl7.org/fhir/adverseevent.html){:target="blank"} resource. This is not a visit specific data element and does not require any adjudication by study staff.

## Required Parameters
```
GET /msk-apim/external/v1/crit/blaze/api/AdverseEvent
-H Authorization: Bearer {access_token} 
```

| Parameters      | Required/Optional | Description                          |
| --------------  | ----------------- | ------------------------------------ |
| `researchstudy` | required          | MSK unique study number              |
| `x-partnerid`   | required          | MSK provided partner ID              |

For a list of optional filtering parameters visit the [Searching page](/searching).
## Example Request
=== "C# "

    ``` c# linenums="1"
    var client = new RestClient("BASE_URL_PLUS_API_PATH?researchstudy={A1}&x-partnerid={A2}");
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
    conn.request("GET", "API_PATH?researchstudy={A1}&x-partnerid={A2}", payload, headers)
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
        "system": "https://mskcc.github.io/critfhirdeveloper/identifiers/#IDB.Protocol",
        "value": "FHIR-T"
    },
    "type": "searchset",
    "total": 1041,
    "link": [
        {
            "relation": "self",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/adverseevent?researchstudy=FHIR-T&_count=3&page=1"
        },
        {
            "relation": "first",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/adverseevent?researchstudy=FHIR-T&_count=3&page=1"
        },
        {
            "relation": "last",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/adverseevent?researchstudy=FHIR-T&_count=3&page=347"
        },
        {
            "relation": "previous",
            "url": "null"
        },
        {
            "relation": "next",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/adverseevent?researchstudy=FHIR-T&_count=3&page=2"
        }
    ],
    "entry": [
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/adverseevent?researchstudy=FHIR-T&Id=10081004",
            "resource": {
                "resourceType": "AdverseEvent",
                "id": "10081004",
                "extension": [
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#SponsorID",
                        "valueCode": "C3861001"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#StartDate",
                        "valueCode": "07/05/2021"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#EventSequenceNo",
                        "valueCode": "1"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#Verified",
                        "valueCode": "0"
                    }
                ],
                "identifier": {
                    "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                    "value": "MSK Revenue Management System (RMS) via Clinical Research Database (CRDB) integration"
                },
                "actuality": "actual",
                "event": {
                    "coding": [
                        {
                            "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                            "display": "Abdominal pain"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/10081004",
                    "display": "10081004"
                },
                "date": "2021-07-05",
                "outcome": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/adverse-event-outcome",
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
                        "reference": "Study/FHIR-T",
                        "identifier": {
                            "value": "10000081"
                        },
                        "display": "AdverseEvent"
                    }
                ]
            }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/adverseevent?researchstudy=FHIR-T&Id=10081004",
            "resource": {
                "resourceType": "AdverseEvent",
                "id": "10081004",
                "extension": [
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#SponsorID",
                        "valueCode": "C3861001"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#StartDate",
                        "valueCode": "07/05/2021"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#EventSequenceNo",
                        "valueCode": "1"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#Verified",
                        "valueCode": "0"
                    }
                ],
                "identifier": {
                    "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                    "value": "MSK Revenue Management System (RMS) via Clinical Research Database (CRDB) integration"
                },
                "actuality": "actual",
                "event": {
                    "coding": [
                        {
                            "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                            "display": "Abdominal pain"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/10081004",
                    "display": "10081004"
                },
                "date": "2021-07-05",
                "outcome": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/adverse-event-outcome",
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
                        "reference": "Study/FHIR-T",
                        "identifier": {
                            "value": "10000081"
                        },
                        "display": "AdverseEvent"
                    }
                ]
            }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/adverseevent?researchstudy=FHIR-T&Id=10081004",
            "resource": {
                "resourceType": "AdverseEvent",
                "id": "10081004",
                "extension": [
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#SponsorID",
                        "valueCode": "C3861001"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#StartDate",
                        "valueCode": "07/05/2021"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#EventSequenceNo",
                        "valueCode": "1"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#Verified",
                        "valueCode": "0"
                    }
                ],
                "identifier": {
                    "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                    "value": "MSK Revenue Management System (RMS) via Clinical Research Database (CRDB) integration"
                },
                "actuality": "actual",
                "event": {
                    "coding": [
                        {
                            "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                            "display": "Abdominal pain"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/10081004",
                    "display": "10081004"
                },
                "date": "2021-07-05",
                "outcome": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/adverse-event-outcome",
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
                        "reference": "Study/FHIR-T",
                        "identifier": {
                            "value": "10000081"
                        },
                        "display": "AdverseEvent"
                    }
                ]
            }
        }
    ]
    }
  
    ```

## Field Definitions

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
| `identifier.system`                                 |                                                            |
| `identifier.value`                                  | Data Source                                                |
| `actuality`                                         |                                                            |
| `event.coding.system`                               |                                                            |
| `event.coding.display`                              |                                                            |
| `subject.reference`                                 | Patient/ + Sponsor assigned subject ID                     |
| `subject.display`                                   | Sponsor assigned subject ID                                |
| `date`                                              | Adverse Event Start Date                                   |
| `outcome.coding.system`                             | FHIR Adverse Event Outcome documentation                   |
| `outcome.coding.code`                               |                                                            |
| `outcome.coding.display`                            |                                                            |
| `suspectEntity.causality.assessment.coding.system`  | FHIR Adverse Event Causality documentation                 |
| `suspectEntity.causality.assessment.coding.display` |                                                            |
| `suspectEntity.causality.productRelatedness`        |                                                            |
| `study.reference`                                   | Study/ + MSK unique study number                           |
| `study.identifier.value`                            |                                                            |
| `study.display`                                     | hardcoded to `AdverseEvent`                                |