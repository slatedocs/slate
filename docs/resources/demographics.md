Demographics data are mapped to FHIR's [Patient](http://hl7.org/fhir/patient.html){:target="blank"} resource. Data flows from MSK's Revenue Management System (RMS) into the Clinical Research Data Warehouse. Patients are identified by the sponsor subject ID.

## Required Parameters

```
GET /msk-apim/external/v1/crit/blaze/api/Patient
-H Authorization: Bearer {access_token}
```

| Parameters      | Required/Optional | Description                          |
| --------------  | ----------------- | ------------------------------------ |
| `researchstudy` | required          | MSK unique study number              |
| `x-partnerid`   | required          | MSK provided partner ID              |


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
    "total": 3,
    "link": [
        {
            "relation": "self",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/patients?researchstudy=FHIR-T&page=1"
        },
        {
            "relation": "first",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/patients?researchstudy=FHIR-T&page=1"
        },
        {
            "relation": "last",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/patients?researchstudy=FHIR-T&page=1"
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
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/patient/10081001",
            "resource": {
                "resourceType": "Patient",
                "id": "10081001",
                "extension": [
                    {
                        "url": "https://www.hl7.org/fhir/patient.html",
                        "valueCode": "FHIR-T"
                    },
                    {
                        "url": "http://terminology.hl7.org/CodeSystem/v3-Race",
                        "valueCode": "White"
                    },
                    {
                        "url": "http://terminology.hl7.org/ValueSet/v3-Ethnicity",
                        "valueCode": "NON"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#SponsorID",
                        "valueCode": "C3861001"
                    }
                ],
                "identifier": [
                    {
                        "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                        "value": "MSK Revenue Management System (RMS) via Clinical Research Database (CRDB) integration"
                    }
                ],
                "gender": "male",
                "birthDate": "1988"
            }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/patient/10081004",
            "resource": {
                "resourceType": "Patient",
                "id": "10081004",
                "extension": [
                    {
                        "url": "https://www.hl7.org/fhir/patient.html",
                        "valueCode": "FHIR-T"
                    },
                    {
                        "url": "http://terminology.hl7.org/CodeSystem/v3-Race",
                        "valueCode": "White"
                    },
                    {
                        "url": "http://terminology.hl7.org/ValueSet/v3-Ethnicity",
                        "valueCode": "NON"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#SponsorID",
                        "valueCode": "C3861001"
                    }
                ],
                "identifier": [
                    {
                        "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                        "value": "MSK Revenue Management System (RMS) via Clinical Research Database (CRDB) integration"
                    }
                ],
                "gender": "male",
                "birthDate": "1976"
            }
        },
        {
            "fullUrl": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/patient/10081007",
            "resource": {
                "resourceType": "Patient",
                "id": "10081007",
                "extension": [
                    {
                        "url": "https://www.hl7.org/fhir/patient.html",
                        "valueCode": "FHIR-T"
                    },
                    {
                        "url": "http://terminology.hl7.org/CodeSystem/v3-Race",
                        "valueCode": "White"
                    },
                    {
                        "url": "http://terminology.hl7.org/ValueSet/v3-Ethnicity",
                        "valueCode": "NON"
                    },
                    {
                        "url": "https://mskcc.github.io/critfhirdeveloper/identifiers/#SponsorID",
                        "valueCode": "C3861001"
                    }
                ],
                "identifier": [
                    {
                        "system": "https://msk-blaze-docs.readthedocs.io/en/latest/",
                        "value": "MSK Revenue Management System (RMS) via Clinical Research Database (CRDB) integration"
                    }
                ],
                "gender": "male",
                "birthDate": "1948"
            }
        }
    ]
    }
  
    ```

## Field Definitions

|  Field                        | Description                     |
| ----------------------------- | ----------------------------    |
| `id`                          | Sponsor assigned subject ID     |
| `extension[0].url`            | FHIR Patient documentation      |
| `extension[0].valueCode`      | MSK unique study number         |
| `extension[1].url`            | FHIR Race documentation         |
| `extension[1].valueCode`      | FHIR Race code                  |
| `extension[2].url`            | FHIR Ethnicity documentation    |
| `extension[2].valueCode`      | FHIR Ethnicity code             |
| `extension[3].url`            | MSK identifiers documentation   |
| `extension[3].valueCode`      | Sponsor Study Number            |
| `identifier.system`           |
| `identifier.value`            | Data Source                     |
| `gender`                      | Gender                          |
| `birthDate`                   | Year of birth                   |