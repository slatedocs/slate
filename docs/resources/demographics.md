Demographics data are mapped to FHIR's [Patient](http://hl7.org/fhir/patient.html){:target="blank"} resource. Data flows from MSK's Revenue Management System (RMS) into the Clinical Research Data Warehouse. Patients are identified by the sponsor subject ID.

## Required Parameters
```
GET /msk-apim/external/v1/crit/blaze/api/Patient
-H Authorization: Bearer {access_token} 
```

## Example Request

## Example Response

## Field Definitions

|  Field                        | Description                     |
| ----------------------------- | ----------------------------    |
| `id`                          | Sponsor assigned subject ID     |
| `extension[0].url`            | FHIR Patient documentation      |
| `extension[0].valueCode`      | MSKCC IRB Protocol Number       |
| `extension[1].url`            | FHIR Race documentation         |
| `extension[1].valueCode`      | FHIR Race code                  |
| `extension[2].url`            | FHIR Ethnicity documentation    |
| `extension[2].valueCode`      | FHIR Ethnicity code             |
| `extension[3].url`            | MSKCC identifiers documentation |
| `extension[3].valueCode`      | Sponsor Study Number            |
| `identifier.system`           |
| `identifier.value`            | Data Source                     |
| `gender`                      | Gender                          |
| `birthDate`                   | Year of birth                   |