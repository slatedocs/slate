
Vital signs data are mapped to FHIR's [Observation](https://hl7.org/fhir/2021Mar/observation.html){:target="blank"} resource. Each record is mapped to a trial visit and pushed into the Clinical Research Data Warehouse.


## Request

```
GET /msk-apim/external/v2/crit/blaze/api/observation
-H Authorization: Bearer {access_token} 
-H x-partnerid: {partnerId}
```
### Query Parameters
| Parameters      | Type   | Is Required | Description                       |
| --------------- | ------ | ----------- | --------------------------------- |
| `category`      | string | true        | For vital signs use `vital-signs` |
| `researchstudy` | string | true        | MSK unique study number           |
| `x-partnerid`   | string | true        | MSK provided partner ID           |

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
            "total": 13,
            "link": [
                {
                  "relation": "self",
                  "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observation?category=vital-signs&researchstudy=FHIR-T&page=1"
                },
                {
                  "relation": "first",
                  "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observation?category=vital-signs&researchstudy=FHIR-T&page=1"
                },
                {
                  "relation": "last",
                  "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observation?category=vital-signs&researchstudy=FHIR-T&page=1"
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
                "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?category=vital-signs&researchstudy=FHIR-T&Id=500000832",
                "resource": {
                "resourceType": "Observation",
                "id": "500000832",
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
                    "value": "500000832"
                    }
                ],
                "status": "final",
                "category": [
                    {
                    "coding": [
                        {
                        "system": "http://hl7.org/fhir/2021Mar/valueset-observation-category.html",
                        "code": "vital-signs",
                        "display": "Vital Signs"
                        }
                    ],
                    "text": "Vital Signs"
                    }
                ],
                "code": {
                    "coding": [
                    {
                        "system": "https://fhir.mskcc.org/resources/vital-sign/#value-set",
                        "code": "",
                        "display": "Pulse/Heart Rate"
                    }
                    ],
                    "text": "Pulse/Heart Rate"
                },
                "subject": {
                    "reference": "Patient/10081004"
                },
                "encounter": {
                    "display": "CYCLE1_DAY1"
                },
                "effectiveDateTime": "2021-11-29T07:08:00",
                "issued": "2023-03-11T16:42:17+05:30",
                "performer": [
                    {
                    "display": "Practitioner/SHEINTUM"
                    }
                ],
                "valueQuantity": {
                    "value": 93,
                    "unit": "bpm",
                    "system": "https://ucum.org/"
                }
                }
            },
            {
                "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/Observation?category=vital-signs&researchstudy=FHIR-T&Id=500000833",
                "resource": {
                "resourceType": "Observation",
                "id": "500000833",
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
                    "value": "500000833"
                    }
                ],
                "status": "final",
                "category": [
                    {
                    "coding": [
                        {
                        "system": "http://hl7.org/fhir/2021Mar/valueset-observation-category.html",
                        "code": "vital-signs",
                        "display": "Vital Signs"
                        }
                    ],
                    "text": "Vital Signs"
                    }
                ],
                "code": {
                    "coding": [
                    {
                        "system": "https://fhir.mskcc.org/resources/vital-sign/#value-set",
                        "code": "",
                        "display": "Pulse Ox (SpO2)"
                    }
                    ],
                    "text": "Pulse Ox (SpO2)"
                },
                "subject": {
                    "reference": "Patient/10081004"
                },
                "encounter": {
                    "display": "CYCLE1_DAY1"
                },
                "effectiveDateTime": "2021-11-29T07:08:00",
                "issued": "2023-03-11T16:42:17+05:30",
                "performer": [
                    {
                    "display": "Practitioner/SHEINTUM"
                    }
                ],
                "valueQuantity": {
                    "value": 100,
                    "unit": "SpO2",
                    "system": "https://ucum.org/"
                }
              }
            }
        ]
    }
    
    ```
### Field Definitions

| Field                     | Description                                |
| ------------------------- | ------------------------------------------ |
| `id`                      | MSK Unique Identifier                      |
| `extension[0].url`        | Reference to structure definition          |
| `extension[0].valueCode`  | MSK unique Protocol number                 |
| `extension[1].url`        | Reference to structure definition          |
| `extension[1].valueCode`  | Sponsor Study Number                       |
| `identifier.system`       | Reference to structure definition          |
| `identifier.value`        | MSK Unique Identifier                      |
| `status`                  | Always `final`                             |
| `category.coding.system`  | FHIR observation documentation             |
| `category.coding.code`    | Always `vital-signs`                       |
| `category.coding.display` | Always `Vital Signs`                       |
| `category.text`           | Always `Vital Signs`                       |
| `code.coding.system`      |                                            |
| `code.coding.code`        | Loinc Code                                 |
| `code.coding.display`     | Vital Sign Item Type                       |
| `code.text`               | Vital Sign Item Type                       |
| `subject.reference`       | `Patient/` + Sponsor assigned subject ID   |
| `encounter.display`       | Protocol visit                             |
| `effectiveDateTime`       | Collection datetime                        |
| `issued`                  | CRT datetime                               |
| `performer.display`       | `Practitioner/` + Practitioner (CRT) ID    |
| `valueQuantity.value`     | Vital sign value                           |
| `valueQuantity.unit`      | Vital sign unit                            |
| `valueQuantity.system`    | UCUM Reference                             |


## Value Set

Values supported by MSK include but are not limited to:
<ul>
<li>Blood Pressure BP Systolic</li>
<li>Blood Pressure Diastolic</li>
<li>Blood Pressure Positioning</li>
<li>BSA m2</li>
<li>Height (centimeters)</li>
<li>Last recorded Height</li>
<li>Pulse Ox (SpO2)</li>
<li>Pulse/Heart Rate</li>
<li>Resp Rate</li>
<li>Temperature F</li>
<li>Temperature Temp C</li>
<li>Weight (kilograms)</li>
</ul>
