---
title: Quick Start Guide to Using the GDC API

language_tabs:
  - shell: cURL
  - java: JAVA
  - python: Python
  

toc_footers:
  - <a href='#'>GDC API Appendix</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

**The GDC Application Programming Interface (API) provides developers with a programmatic interface to query and download GDC data as well as to submit data to GDC**

The GDC API is the external facing REST interface for the National Cancer Institute (NCI) Genomic Data Commons (GDC). The GDC API drives the GDC Data Portal and is made accessible to external developers for programmatic access to the same functionality found through the GDC Data Portal.  This includes searching for and downloading subsets of data files, metadata, and annotations based on specific parameters.  GDC API also allows programatic access for submission of dbGaP registered projects (studies) and its associated  data files, metadata, and annotations.

The GDC API allows developers to :
-
- Querying GDC data
- Downloading GDC data
- Submitting data to GDC

# Authentication

> Each GDC API request must include "X-Auth-Token" custom header.

```java
```

```python
import gdcapi

api = gdcapi.authorize('your_GDC_API_token')
```

```shell
# With shell, you can just pass the correct header with each request
export TOKEN='your_GDC_API_token'
curl -H 'X-Auth-Token:$TOKEN' -k -O https://gdc-api.nci.nih.gov/data/64cfcd9d-8a23-4f88-95b6-49c05c7cbde4

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 53.3M    0 53.3M    0     0   513k      0 --:--:--  0:01:46 --:--:-- 1208k
```

> Make sure to replace `your_GDC_API_token` with your GDC token.

Open data and metadata in GDC is can be downloaded via GDC API without authentication. However, in order to obtain access to controlled data available in GDC, researchers must first obtain an NIH eRA Commons account and authorization to access the data through the NIH database of Genotypes and Phenotypes (dbGaP). 

**How can I access controlled data in GDC?**

Once a researcher has obtained an eRA Commons account and dbGaP access, they can log into the GDC Data Portal and acquire an authentication token from the portal that will allow them to download the controlled data sets for which they have access via the GDC API.

To obtain the authentication token:

1. Log in to the GDC Data Portal by clicking the Login button at the top right of the page. This will redirect to the eRA Commons login page. 
2. Once logged in to the eRA Commons, the GDC Data Portal will recognize the user as logged in and display the username in place of the login button. 
3. Clicking the username will trigger a drop-down menu. From that menu, the option ‘Download Token’ may be selected, which will initiate an HTTPS download of a token file. 
4. This file will contain the authentication token to be used with any secure data access associated with the GDC.

<aside class="warning">
**Remember** —   The authentication token should be kept in a secure location, as it allows access to all data accessible by the associated user.
</aside>
**Token Expiration**
A token lasts for 1 month. Once it expires you will get a 401 HTTP error code.

Unauthorized access to data (for example invalid token) will produce the following error message:

HTTP/1.1 403 FORBIDDEN
    {
      "error": "You don't have access to the data"
    }

<aside class="info">
**Remember** —   Invalid credentials will result in a server error even if the data is open access.
</aside>
# GDC Endpoints

The GDC API is composed of multiple top level endpoints that can be used to query the API and retrieve data.

##Status Endpoint
```java

```

```python

```

```shell
curl -k 'https://gdc-api.nci.nih.gov/status'
```
> The above command returns JSON structured like this:

```json
{
  "status": "OK",
  "tag": "0.2.15",
  "version": 1
}
```
**Status** - https://gdc-portal.nci.nih.gov/status
### HTTP Request

`GET https://gdc-api.nci.nih.gov/status`

##Search and Retrieval Endpoints
The GDC search and retrieval endpoints all support the same query logic and will produce similarly structured json output 

```shell
$ curl -k 'https://gdc-api.nci.nih.gov/projects?pretty=true'
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "hits": [
      {
        "state": "legacy", 
        "project_id": "TARGET-AML", 
        "primary_site": "Blood", 
        "disease_type": "Acute Myeloid Leukemia", 
        "name": "Acute Myeloid Leukemia"
      }, 
       	...
      {
        "state": "legacy", 
        "project_id": "TCGA-LAML", 
        "primary_site": "Blood", 
        "disease_type": "Acute Myeloid Leukemia", 
        "name": "Acute Myeloid Leukemia"
      }
    ], 
    "pagination": {
      "count": 10, 
      "sort": "", 
      "from": 1, 
      "pages": 5, 
      "total": 44, 
      "page": 1, 
      "size": 10
    }
  }, 
  "warnings": {}
}
```
### Project Endpoint
The Projects endpoints provides overall access to all the data served by GDC organized by Project such project(study) name, program,disease, primary site and state.
  
**Projects** - https://gdc-portal.nci.nih.gov/projects
### HTTP Request

`GET https://gdc-api.nci.nih.gov/projects`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
facets | false | Provides a list document counts for each included facet
fields | false | Query option to specify which fields to include in the response 
filters| false | Query option filters specify criteria for the returned response
from   | false | allows to specify the first record to return from the set resulting of a query
size | false | determines the number of results to return
sort | false | specifies a field to sort the returned results by sort order: + use asc for ascending order + use des for descending order
pretty | false | Returns response with indentations and line breaks in a human-readable format


