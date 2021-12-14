# License

The data product may be exploited by licensing its use and exploitation to third parties. Machine-readable licence as part of the specification is implemented for this purpose. It can be used to conclude various agreements regarding data protection, processing and intellectual property rights (IPR). Data can be protected by one or more intellectual property rights. Principle is that when a third party exploits the data, it must have a licence to the data. 

> Example of license component usage:

```javascript
  
"license": {
  "licensor":{
         "taxID":"12243434-12",
         "vatID":"12243434-12",
         "logoURL":"https://mindmote.fi/logo.png",
         "description":"Digital Economy services and tools",
         "URL":"https://mindmote.fi"
         "telephone":"+35845 0232 2323",
         "streetAddress":"Koulukatu 1",
         "postalCode":"33100",
         "addressRegion":"Pirkanmaa"
         "addressLocality":"Tampere",
         "addressCountry":"Finland"
   }
   "scope":{
         "expiracy":24,
         "Restrictions": "The license holder agrees not to, directly or indirectly, participate in the unauthorized use, disclosure or conversion of any confidential information.",
         "transferability": true,
         "GeographicalArea": [ 
            "EU",
            "US"
         ],
         "purposeofUse": "",
         "affiliatesRights": "",
         "subContractorRights": "",
         "modificationRights": "",
         "Distribution": "",
         "ownership":"".
         "usageRights": [
              "globalUsage"
         ]
                
            }
   "governance": {
         "dpa": "",
         "audit": "",
         "forceMajure": "",
         "damages": "",
         "disclaimer": ""
     
   }
  }
}

  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| composer | string | any | A name of the package manager, composer or tool |
| format | string  | any |  Type of script language|
| status | string  | Options for unit are: announcement, draft, development, testing, acceptance, production, sunset, retired |
| DeploymentScriptURL | URL | Valid URL  | 	The URL of the deployment script. |
| DeploymentDocumentationURL | URL | Valid URL  | 	The URL of the deployment documentation |

