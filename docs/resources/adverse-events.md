Adverse event data are mapped to FHIR's [Adverse Event](http://hl7.org/fhir/adverseevent.html){:target="blank"} resource. This is not a visit specific data element and does not require any adjudication by study staff.

## Required Parameters
```
GET /msk-apim/external/v1/crit/blaze/api/AdverseEvent
-H Authorization: Bearer {access_token} 
```

| Parameters      | Required/Optional | Description                          |
| --------------  | ----------------- | ------------------------------------ |
| `researchstudy` | required          | MSK unique study number  |
| `category`      | required          | Default value: **vital-signs** |
| `x-partnerid`   | required          | suply given partnerid|

For a list of optional filtering parameters visit the [Searching page](/searching).


## Example Request

## Example Response

## Field Definitions

| Field                                               | Description                                |
| --------------------------------------------------- | ------------------------------------------ |
| `id`                                                |                                            |
| `extension[0].url`                                  | MSKCC identifiers documentation            |
| `extension[0].valueCode`                            | Sponsor Study Number                       |
| `identifier.system`                                 |                                            |
| `identifier.value`                                  | Data Source                                |
| `actuality`                                         |                                            |
| `event.coding.system`                               |                                            |
| `event.coding.display`                              |                                            |
| `subject.reference`                                 | Patient/ + Sponsor assigned subject ID     |
| `subject.display`                                   | Sponsor assigned subject ID                |
| `date`                                              | Adverse Event Start Date                   |
| `outcome.coding.system`                             | FHIR Adverse Event Outcome documentation   |
| `outcome.coding.code`                               |                                            |
| `outcome.coding.display`                            |                                            |
| `suspectEntity.causality.assessment.coding.system`  | FHIR Adverse Event Causality documentation |
| `suspectEntity.causality.assessment.coding.display` |                                            |
| `suspectEntity.causality.productRelatedness`        |                                            |
| `study.reference`                                   | Study/ + MSKCC IRB Number                  |
| `study.identifier.value`                            |                                            |
| `study.display`                                     | hardcoded to AdverseEvent                  |