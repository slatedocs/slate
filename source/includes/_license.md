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
         "definitions": "The purpose of this license is to determine the terms and conditions applicable to the licensing of the data product, whereby Licensor grants License holder the right to use the data.",
         "language": "en-us",
         "expiracyMonths":24,
         "termitationContitions": "After 14 days trial period, a written cancellation before 30 days is mandatory",
         "continuityConditions": "License will automatically continued without written (30 before) cancellation by licenser holder",
         "restrictions": "The license holder agrees not to, directly or indirectly, participate in the unauthorized use, disclosure or conversion of any confidential information.",
         "exclusivity": false,                 
         "GeographicalArea": [ 
            "EU",
            "US"
         ],
         "purposeofUse": "Creating BI dashboard solution for License holders customers (End Users).",
         "affiliatesRights": "Without limitations",
         "subContractorRights": "Without limitation",
         "modificationRights": "Without limitations",
         "ownership":"Data ownership will be retained in any condition by the licensor",
         "roalties":"  It is hereby agreed that License holder shall share with Licensor three percent (3%) of the revenues derives and receives from the usage their BI Dashbord solutions by the End Users."
         "payments": "License holder shall remit full payment within thirty (30) days after the end of each calendar month. Taxes (VAT 24 %) are included.",
         "IPRs": "Copyright is regulated in Finland by the Copyright Act (404/1961).",
         "usageRights": [
              "globalUsage"
         ]
                
            }
   "governance": {
         "qualityControl": "ISO 8000-61:2016 specifies the processes required for data quality management. The processes are used as a reference to enhance data quality and assess process capability or organizational maturity for data quality management.",
         "containsPersonalData": true,
         "dpaURL": "http://192.168.10.1/test/docs/dpaconditions.pdf",
         "audit": "Audit is conducted in accordance with the Petshop´s Data-audits ltd., www.petshopsdataaudits.com",
         "forceMajure": "Each party may suspend the fulfilment of its contractual obligations, when the said fulfilment is impossible or objectively too costly due to an unforeseeable impediment independent from the parties, such as for example: strike, boycott, lockout, fire, war (declared or not), civil war, riots and revolutions, requisitions, embargo, power blackouts, extraordinary breakage of machinery, delays in the delivery of components or raw materials.",
         "damages": "During the term of license, except for the force majeure or the Licensors reasons, the License holder is required to follow strictly in accordance with the Contract. If the License holder wants to terminate the license early, it needs to pay a certain amount of liquidated damages.",
         "confidentiality": "The Licensor undertakes to maintain confidentiality as regards all information of a technical (such as, by way of a non-limiting example, drawings, tables, documentation, formulas and correspondence) and commercial nature (including contractual conditions, prices, payment conditions) gained during the performance of this contract."          
   }
  }
}

  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| language | string | ISO 639-1 standard language codes | Licence language |

