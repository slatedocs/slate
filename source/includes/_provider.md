# Provider

Provider **ELEMENT** describes the Organization legally allowed to create, develop and publish data products. The provider might not be the original IPR owner of the data used, but has rights operate with it. The contract or other agreement between Provider and possible data owner is not part of the standard as metadata or licence wise.

Mandatory attributes are listed in separate table and marked with **bolded names** and asterix **\***. Next to the mandatory attributes is an example. 

The same logic applies to the optional attributes as well. Optional attributes are listed in own table and an example is given in the right column. 



## Mandatory attributes and elements


> Example of Provider component mandatory attributes usage:

```javascript
   "Provider":
      {
         "legalName":"MindMote Oy",
         "businessId":"12243434-12",
         "email":"contact@mindmote.fi"
      }
      
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **legalName** **\*** | string  | text content, max length 256 chars  | The official name of the organization, e.g. the registered company name.  | 
| 
|  **businessID** **\*** | string  | -  | The business identifier code of the company. Often this is given to the company by authorized public sector organization managing register of businesses.  |
| **email** **\*** | string | - | Email to be used in contacting the organization. |



## Optional attributes and elements

> Example of Provider component with some of the voluntary attributes:

```javascript
   "Provider":
      {
         "taxID":"12243434-12",
         "vatID":"12243434-12",
         "logoURL":"https://mindmote.fi/logo.png",
         "description":"Digital Economy services and tools",
         "url":"https://mindmote.fi"
         "telephone":"+35845 0232 2323",
         "streetAddress":"Koulukatu 1",
         "postalCode":"33100",
         "addressRegion":"Pirkanmaa"
         "addressLocality":"Tampere",
         "addressCountry":"Finland",
         "aggregateRating":"",
         "slogan":"",
         "parentOrganization":""
      }
      
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| taxID | string  | - | The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain. |
| vatID | string | - | The Value-added Tax ID of the organization or person. |
|  |  |  |  |