Lesions measured as part of a response assessment are mapped to FHIR's [Observation](https://hl7.org/fhir/2021Mar/observation.html){:target="blank"} resource. Most fields are available through extensions since they do not map directly to FHIR's Observation fields

## Request
```
GET /msk-apim/external/v2/crit/blaze/api/observation
-H Authorization: Bearer {access_token} 
-H x-partnerid: {partnerId}
```
### Query Parameters
| Parameters      | Type   | Is Required | Description                   |
| --------------- | ------ | ----------- | ----------------------------- |
| `category`      | string | true        | For lesion data use `imaging` |
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
        "total": 139,
        "link": [
            {
            "relation": "self",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?researchstudy=FHIR-T&category=imaging&page=1"
            },
            {
            "relation": "first",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?researchstudy=FHIR-T&category=imaging&page=1"
            },
            {
            "relation": "last",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?researchstudy=FHIR-T&category=imaging&page=3"
            },
            {
            "relation": "previous",
            "url": "null"
            },
            {
            "relation": "next",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?researchstudy=FHIR-T&category=imaging&page=2"
            }
        ],
        "entry": [
            {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?researchstudy=FHIR-T&category=imaging&Id=2441-10664-T02",
            "resource": {
                "resourceType": "Observation",
                "extension": [
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                    "valueString": "FHIR-T"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                    "valueString": "C3861001"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Organ",
                    "valueString": "Lymph node mediastinal"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Category",
                    "valueString": "Target"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#State",
                    "valueString": "Present"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SeriesNumber",
                    "valueInteger": 2
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SeriesDescription",
                    "valueString": "Standard 5mm"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#InstanceNumber",
                    "valueInteger": 26
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Modality",
                    "valueString": "CT"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Label",
                    "valueString": "Long ? short axis"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromPrevious",
                    "valueString": "--"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromBaseline",
                    "valueString": "--"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromNadir",
                    "valueString": "--"
                }
                ],
                "identifier": [
                {
                    "system": "https://fhir.mskcc.org/structure-definitions/#LesionIdentifier",
                    "value": "2441-10664-T02"
                }
                ],
                "status": "final",
                "category": [
                {
                    "coding": [
                    {
                        "system": "http://hl7.org/fhir/2021Mar/valueset-observation-category.html",
                        "code": "imaging",
                        "display": "Imaging"
                    }
                    ],
                    "text": "Imaging"
                }
                ],
                "subject": {
                "reference": "Patient/10081001"
                },
                "effectiveDateTime": "2020-08-25"
            }
            },
            {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?researchstudy=FHIR-T&category=imaging&Id=2441-10664-T02",
            "resource": {
                "resourceType": "Observation",
                "extension": [
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#IDB.Protocol",
                    "valueString": "FHIR-T"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SponsorID",
                    "valueString": "C3861001"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Organ",
                    "valueString": "Lymph node mediastinal"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Category",
                    "valueString": "Target"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#State",
                    "valueString": "Present"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SeriesNumber",
                    "valueInteger": 2
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#SeriesDescription",
                    "valueString": "Standard 5mm"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#InstanceNumber",
                    "valueInteger": 26
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Modality",
                    "valueString": "CT"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#Label",
                    "valueString": "Long ? short axis"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromPrevious",
                    "valueString": "--"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromBaseline",
                    "valueString": "--"
                },
                {
                    "url": "https://fhir.mskcc.org/structure-definitions/#ChangeFromNadir",
                    "valueString": "--"
                }
                ],
                "identifier": [
                {
                    "system": "https://fhir.mskcc.org/structure-definitions/#LesionIdentifier",
                    "value": "2441-10664-T02"
                }
                ],
                "status": "final",
                "category": [
                {
                    "coding": [
                    {
                        "system": "http://hl7.org/fhir/2021Mar/valueset-observation-category.html",
                        "code": "imaging",
                        "display": "Imaging"
                    }
                    ],
                    "text": "Imaging"
                }
                ],
                "subject": {
                "reference": "Patient/10081001"
                },
                "effectiveDateTime": "2020-08-25"
            }
            }
        ]
    }
    ```

### Field Definitions

| Field                                      | Description                                              |
| -------------------------------------------| -------------------------------------------              |
| `extension[0].url`                         | Reference to structure definition                        |
| `extension[0].valueString`                 | MSK unique study number                                  |
| `extension[1].url`                         | Reference to structure definition                        |
| `extension[1].valueString`                 | Sponsor Study Number                                     |
| `extension[2].url`                         | Reference to structure definition                        |
| `extension[2].valueString`                 | Organ as entered in source system                        |
| `extension[3].url`                         | Reference to structure definition                        |
| `extension[3].valueString`                 | Lesion measurement category `New lesion | Non-target | Target` |
| `extension[4].url`                         | Reference to structure definition                        |
| `extension[4].valueString`                 | Lesion state <br/> `Present | Defined | Stable/Improved | Disappeared | Undefined | Uneqv. prog. | Not evaluable | Not assessed | Too small` |                      
| `extension[5].url`                         | Reference to structure definition                        |
| `extension[5].valueInteger`                | Series number <br/>                                      |
| `extension[6].url`                         | Reference to structure definition                        |
| `extension[6].valueString`                 | Series description <br/>                                 |
| `extension[7].url`                         | Reference to structure definition                        |
| `extension[7].valueInteger`                | Instance number. <br/>                                   |   
| `extension[8].url`                         | Reference to structure definition                        |
| `extension[8].valueString`                 | Modality                                                 |
| `extension[9].url`                         | Reference to structure definition                        |
| `extension[9].valueString`                 | Label                                                    |
| `extension[10].url`                        | Reference to structure definition                        |
| `extension[10].valueString`                |                                                          |
| `extension[11].url`                        | Reference to structure definition                        |
| `extension[11].valueString`                | Change from previous assessment `+/- {value} mm`         |
| `extension[12].url`                        | Reference to structure definition                        |
| `extension[12].valueString`                | Change from baseline `+/- {value} mm`                    |
| `extension[13].url`                        | Reference to structure definition                        |
| `extension[13].valueString`                | Change from baseline `+/- {value} mm`                    |
| `identifier.system`                        | Reference to structure definition                        |
| `identifier.value`                         | Change from nadir `+/- {value} mm`                       |
| `status`                                   | always `final`                                           |
| `category.coding.system`                   | Reference to FHIR coding system                          |
| `category.coding.code`                     | always `imaging`                                         |
| `category.coding.display`                  | always `Imaging`                                         |
| `category.text`                            | always `Imaging`                                         |
| `subject.reference`                        | `Patient/` + Sponsor assigned subject ID                 |
| `effectiveDateTime`                        | Datetime of observation                                  |
| `valueQuantity.value`                      | Lesion measurement                                       |
| `valueQuantity.unit`                       | Lesion measurement unit                                  |