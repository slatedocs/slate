# License

The data product may be exploited e.g. by licensing its use and exploitation to third parties. Machine-readable license as part of the specification is implemented for this purpose. It can be used to conclude various agreements regarding data protection, processing and intellectual property rights (IPR). Data can be protected by one or more intellectual property rights. Principle is that when a third party (Data User) exploits the data, it must have a license or other right from Data Holder to exploit to the data.

> Example of License Object usage:


```javascript
  
"license": {
   "scope": {
         "definition": "The purpose of this license is to determine the terms and conditions applicable to the licensing of the data product, whereby Data Holder grants Data User the right to use the data.",
         "language": "en-us",
         "permanent": false,
         "expiracyDate": "2022-12-15T00:00:00+02:00",
         "terminationContitions": "Cancellation before 30 days.",
         "continuityConditions": "Expired license will automatically continued without written cancellation (termination) by Data Holder",
         "restrictions": "Data User agrees not to, directly or indirectly, participate in the unauthorized use, disclosure or conversion of any confidential information.",      
         "geographicalArea": [ 
            "EU",
            "US"
         ],
         "modificationRight": true,
         "resellingRight": true,
         "roalties": "It is hereby agreed Data User shall share with Data Holder three percent (3%) of the revenues derives and receives from the usage their BI Dashbord solutions by the End Users.",
         "paymentsData User shall remit full payment within thirty (30) days after the end of each calendar month. Taxes (VAT 24 %) are included. Invoice will be electronical",
         "copyrights": "Copyright is regulated in Finland by the Copyright Act (404/1961). Data is property of Mindmote Oy."
            }
   "governance": {
         "containsPersonData": true,
         "dpaURL": "http://192.168.10.1/dpaconditions",
         "audit": "Audit is conducted in accordance with the Petshop´s Data-audits ltd., www.petshopsdataaudits.com",
         "forceMajeure": "Each party may suspend the fulfilment of its contractual obligations, when the said fulfilment is impossible or objectively too costly due to an unforeseeable impediment independent from the parties, such as for example: strike, boycott, lockout, fire, war (declared or not), civil war, riots and revolutions, requisitions, embargo, power blackouts, extraordinary breakage of machinery, delays in the delivery of components or raw materials.",
         "damages": "During the term of license, except for the force majeure or the Data Holders reasons, Data User is required to follow strictly in accordance with the Contract. If Data User wants to terminate the license early, it needs to pay a certain amount of liquidated damages.",
         "confidentiality": "Data User undertakes to maintain confidentiality as regards all information of a technical (such as, by way of a non-limiting example, drawings, tables, documentation, formulas and correspondence) and commercial nature (including contractual conditions, prices, payment conditions) gained during the performance of this license."          
   }
  }
}

  
```
| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| definition | string | The purpose of the license | License language |
| language | string | ISO 639-1 standard language codes | License language |
| permanent | boolean | ISO 639-1 standard language codes | License language |
| expiracyDate | string | ISO 639-1 standard language codes | License language |
| termitationContitions | string | ISO 639-1 standard language codes | License language |
| continuityConditions | string | ISO 639-1 standard language codes | License language |
| restrictions | string | ISO 639-1 standard language codes | License language |
| geographicalArea | string | ISO 639-1 standard language codes | License language |
| modificationRights | boolean | ISO 639-1 standard language codes | License language |
| resellingRights | boolean | ISO 639-1 standard language codes | License language |
| royalties | string | ISO 639-1 standard language codes | License language |
| copyrights | string | ISO 639-1 standard language codes | License language |
| containsPersonData | boolean | ISO 639-1 standard language codes | License language |
| dpaURL| string | ISO 639-1 standard language codes | License language |
| audit | string | ISO 639-1 standard language codes | License language |
| forceMajeure | string | ISO 639-1 standard language codes | License language |
| damages| string | ISO 639-1 standard language codes | License language |
| confidentiality | string | ISO 639-1 standard language codes | License language |








