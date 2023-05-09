Medicatation data is a complex data set that is captured in various MSK source systems (i.e. pharmacy, administered, etc.). To provide end users with the cleanest data set possible, MSK standardizes medication data to the [OMOP Common Data Model](https://www.ohdsi.org/data-standardization/){:target="blank"} and for simplicity, makes it available through one FHIR resource - [Medication Statement](http://hl7.org/fhir/2021Mar/medicationstatement.html){:target="blank"}. 

This is not a visit specific data element and does not require any adjudication by study staff.

## Request
```
GET /msk-apim/external/v2/crit/blaze/api/MedicationStatement
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
    "total": 453,
    "link": [
        {
            "relation": "self",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/MedicationStatement?researchstudy=FHIR-T&page=1"
        },
        {
            "relation": "first",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/MedicationStatement?researchstudy=FHIR-T&page=1"
        },
        {
            "relation": "last",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/MedicationStatement?researchstudy=FHIR-T&page=10"
        },
        {
            "relation": "previous",
            "url": "null"
        },
        {
            "relation": "next",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/MedicationStatement?researchstudy=FHIR-T&page=2"
        }
    ],
    "entry": [
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/MedicationStatement?researchstudy=FHIR-T&Id=1294555",
            "resource": {
                "resourceType": "MedicationStatement",
                "id": "1294555",
                "extension": [
                    {
                        "url": "https://hl7.org/fhir/StructureDefinition/workflow-researchStudy",
                        "valueCode": "FHIR-T"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/",
                        "valueCode": "C3861001"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/",
                        "valueCode": "40: end datetime derived: populated with idb.hml_client_prescription_hx.hcpx_hx_discontinued_dt when hcpr_status_type = 3 (Discontinued),18: days_supply derived: calculated by formula idb.hml_client_prescription.hcpr_duration_amt * (idb.hml_client_prescri"
                    }
                ],
                "identifier": [
                    {
                        "use": "official",
                        "system": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                        "value": "1294555drug_exposure"
                    }
                ],
                "status": "unknown",
                "medicationCodeableConcept": {
                    "coding": [
                        {
                            "system": "https://www.nlm.nih.gov/research/umls/rxnorm/index.html",
                            "code": "fexofenadine hydrochloride 180 MG Oral Tablet [Allegra]",
                            "display": "fexofenadine hydrochloride 180 MG Oral Tablet [Allegra]"
                        }
                    ],
                    "text": "fexofenadine hydrochloride 180 MG Oral Tablet [Allegra]"
                },
                "subject": {
                    "reference": "Patient/10081001"
                },
                "effectivePeriod": {
                    "start": "2018-02-02T08:38:55",
                    "end": "2018-05-23T08:29:30"
                },
                "note": [
                    {
                        "text": "Patient Self-Reported Medication: HML_CLIENT_PRESCRIPTION"
                    }
                ],
                "dosage": [
                    {
                        "text": "1 tab(s) orally once a day, As Needed",
                        "route": {
                            "text": "Oral route"
                        },
                        "method": {
                            "text": "180 milligram"
                        },
                        "doseAndRate": [
                            {
                                "doseQuantity": {
                                    "value": 180,
                                    "unit": "milligram"
                                },
                                "rateQuantity": {
                                    "unit": "Once daily"
                                }
                            }
                        ]
                    }
                ]
            }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/MedicationStatement?researchstudy=FHIR-T&Id=1427356",
            "resource": {
                "resourceType": "MedicationStatement",
                "id": "1427356",
                "extension": [
                    {
                        "url": "https://hl7.org/fhir/StructureDefinition/workflow-researchStudy",
                        "valueCode": "FHIR-T"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/",
                        "valueCode": "C3861001"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/",
                        "valueCode": "18: days_supply derived: calculated by formula idb.hml_client_prescription.hcpr_duration_amt * (idb.hml_client_prescription.hcpr_refills + 1)"
                    }
                ],
                "identifier": [
                    {
                        "use": "official",
                        "system": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                        "value": "1427356observation"
                    }
                ],
                "status": "unknown",
                "medicationCodeableConcept": {
                    "coding": [
                        {
                            "system": "https://www.nlm.nih.gov/research/umls/rxnorm/index.html",
                            "code": "calcium",
                            "display": "calcium"
                        }
                    ],
                    "text": "calcium"
                },
                "subject": {
                    "reference": "Patient/10081001"
                },
                "effectivePeriod": {
                    "start": "2018-01-31T10:45:45"
                },
                "note": [
                    {
                        "text": "Patient Self-Reported Medication: HML_CLIENT_PRESCRIPTION"
                    }
                ],
                "dosage": [
                    {
                        "method": {
                            "text": "milligram"
                        },
                        "doseAndRate": [
                            {
                                "doseQuantity": {
                                    "unit": "milligram"
                                }
                            }
                        ]
                    }
                ]
            }
        },
    ]
    }
    ```



### Field Definitions
| Field                                      | Description                                |
| -------------------------------------------| -------------------------------------------|
| `id`                                       |                                            |
| `extension[0].url`                         | Reference to structure definition          |
| `extension[0].valueCode`                   | MSK unique study number                    |
| `extension[1].url`                         | Reference to structure definition          |
| `extension[1].valueCode`                   | Sponsor Study Number                       |
| `extension[2].url`                         | Reference to structure definition          |
| `extension[2].valueCode`                   | A concatenation of applied OMOP rules      |
| `identifier.use`                           | Always `official`                          |
| `identifier.system`                        | Reference to structure definition          |
| `identifier.value`                         | {omop record ID}-{omop table}              |
| `status`                                   | Always `unknown`                           |
| `medicationCodeableConcept.coding.system`  | Reference to RxNorm                        |
| `medicationCodeableConcept.coding.code`    | RxNorm drug label                          |
| `medicationCodeableConcept.coding.display` | RxNorm drug label                          |
| `medicationCodeableConcept.text`           | RxNorm drug label                          |
| `subject.reference`                        | `Patient/` + Sponsor assigned subject ID   |
| `effectivePeriod.start`                    | Drug exposure start time                   |
| `effectivePeriod.end`                      | Drug exposure end time                     |
| `note.text`                                | Drug source type                           |
| `dosage.text`                              | Dosage directions                          |
| `dosage.route.text`                        | OMOP route concept                         |
| `dosgae.method.text`                       |                                            |
| `dosage.doseAndRate.doseQuantity.value`    | Dosage value                               |
| `dosage.doseAndRate.doseQuantity.unit`     | Dosage unit                                |
| `dosage.doseAndRate.rateQuantity.unit`     | Rate                                       |