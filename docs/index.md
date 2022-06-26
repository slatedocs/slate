# Getting Started

Memorial Sloan Kettering Cancer Center (MSK) allows pre-approved sponsors to securely access and retrieve clinical trial data on demand from the MSK HL7 FHIR server, also known as Blaze. The MSK Blaze API is organized around REST. Each FHIR resource type currently supports [read](http://build.fhir.org/http.html#read) and [search](http://build.fhir.org/http.html#search) capabilities.

## Data Sources

Data supporting electronic direct data extraction is obtained from multiple MSK applications. The goal is always to integrate as close to the source application as possible. The integration decisions are made on a case-by-case basis per data domain. If unable to integrate directly with the source application, then only an approved enterprise solution such as the Institutional Data Warehouse (IDB) or Unified Data Fabric will be leveraged to extract the data. 

## FHIR Version

MSK's resources are built according [FHIR version ***](http://hl7.org/fhir/directory.html)

## Hosts

### Staging

```
https://apigateway.apps.stageapi.mskcc.org
```

### Production

```
https://apigateway.apps.prodapi.mskcc.org
```



