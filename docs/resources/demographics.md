Demographics data are mapped to FHIR's [Patient](http://hl7.org/fhir/patient.html){:target="blank"} resource. Data is pulled into the Clinical Research Data Warehouse from MSK's Revenue Management System (RMS). Patients are identified by the sponsor subject ID.

## Required Parameters

## Example Request

## Example Response

## Field Definitions

|  Field                        | Description                  |
| ----------------------------- | ---------------------------- |
| `Sponsor assigned subject ID` | FD\_SUBJECT\_STUDY\_ID       |
| `extension[0].url`            | FHIR Patient documentation   |
| `extension[0].valueCode`      | MSKCC IRB Protocol Number    |
| `extension[1].url`            | FHIR Race documentation      |
| `extension[1].valueCode`      | FHIR Race code               |
| `extension[2].url`            | FHIR Ethnicity documentation |
| `extension[2].valueCode`      | FHIR Ethnicity code          |
| `extension[3].url`            |
| `extension[3].valueCode`      | Sponsor Study Number         |
| `identifier.system`           |
| `identifier.value`            |
| `gender`                      | Gender                       |
| `birthDate`                   | Year of birth                |