# Getting Started

Memorial Sloan Kettering Cancer Center's (MSK) [Direct Data Exchange Program](https://www.mskcc.org/research-programs/clinical-trial-direct-data-exchange-program) allows pre-approved sponsors to securely access and retrieve clinical trial data on demand through from MSK's HL7-FHIR server, also known as Blaze. The MSK Blaze API is organized around REST and each FHIR resource type currently supports [read](http://build.fhir.org/http.html#read) and [search](http://build.fhir.org/http.html#search) capabilities.

In order to make use of Blaze to consume clinical research data, you’ll need to be set up as an MSK “partner”. If you are interested in leveraging this API for a research study conducted at MSK, please send a request to [ctdata@mskcc.org](mailto:ctdata@mskcc.org) with your organization name and study number.

## Data Sources

Data supporting electronic direct data exchange is obtained from multiple MSK applications. The goal is always to integrate as close to the source application as possible. The integration decisions are made on a case-by-case basis per data domain. If unable to integrate directly with the source application, then only an approved enterprise solution such as the Institutional Data Warehouse (IDB) or Unified Data Fabric is leveraged to extract the data. 

## FHIR Capabilities & Version

MSK's FHIR Server capabilities, including which version MSK's resources are built in ([4.1.0](http://hl7.org/fhir/directory.html)), are specified in the Capability Statement.

```
GET /msk-apim/external/v1/crit/blaze/api/metadata
-H Authorization: Bearer {access_token} 
```

## Hosts

### Staging

```
https://apigateway.apps.stageapi.mskcc.org
```

### Production

```
https://apigateway.apps.prodapi.mskcc.org
```