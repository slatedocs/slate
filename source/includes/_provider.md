# Data Holder

DataHolder **Object** describes the Organization legally allowed to create, develop and publish data products. *Data holder* means a legal person, public body, international organisation, or a natural person who is not a data subject with respect to the specific data in question, which, in accordance with applicable Union or national law, has the right to grant access to or to share certain personal data or non-personal data;  (Data Governance Act)

The *data holder* might not be the original IPR owner of the data used, but has rights operate with it. The contract or other agreement between Provider and possible data owner is not part of the standard as metadata or licence wise.

Mandatory attributes are listed in separate table and marked with **bolded names** and asterix **\***. Next to the mandatory attributes is an example. 

The same logic applies to the optional attributes as well. Optional attributes are listed in own table and an example is given in the right column. 

## Mandatory attributes and elements


> Example of Provider component mandatory attributes usage:

```javascript
   "dataHolder":
      {
         "legalName":"MindMote Oy",
         "businessId":"12243434-12",
         "email":"contact@mindmote.fi"
      }
      
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **legalName** **\*** | string  | text content, max length 256 chars  | The official name of the organization, e.g. the registered company name.  | 
|  **businessID** **\*** | string  | As defined in [RFC 5322](https://datatracker.ietf.org/doc/html/rfc5322)  | The business identifier code of the company. Often this is given to the company by authorized public sector organization managing register of businesses.  |
| **email** **\*** | string | - | Email to be used in contacting the organization. |

<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>


## Optional attributes and elements

> Example of Provider component with some of the voluntary attributes:

```javascript
   "dataHolder":
      {
         "taxID":"12243434-12",
         "vatID":"12243434-12",
         "logoURL":"https://mindmote.fi/logo.png",
         "description":"Digital Economy services and tools",
         "URL":"https://mindmote.fi",
         "telephone": "+35845 0232 2323",
         "streetAddress":"Koulukatu 1",
         "postalCode":"33100",
         "addressRegion":"Pirkanmaa",
         "addressLocality":"Tampere",
         "addressCountry":"Finland",
         "aggregateRating":"",
         "ratingCount":1245,
         "slogan":"",
         "parentOrganization":""
      }
      
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| taxID | string  | - | The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain. |
| vatID | string | - | The Value-added Tax ID of the organization or person. |
| logoURL | URL | Valid URL. See more from [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986). | The URL pointing to organisation logo. |
| description | string | Max length 512 chars | The introduction to the organization. Often contains information of what the organisation does and focuses on. |
| URL | URL | Valid URL. See more from [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986). | The URL of the organization's website.   |
| telephone | string | - | The telephone number.  |
| streetAddress | string | - | The street address. For example, 1600 Amphitheatre Pkwy.  |
| postalCode | string | - | The postal code. For example, 94043.  |
| addressRegion | string | - | The region in which the locality is, and which is in the country. For example, California or another appropriate first-level Administrative division |
| addressLocality | string | -  | The locality in which the street address is, and which is in the region. For example, Mountain View.  |
| addressCountry | string | two-letter ISO 3166-1 alpha-2 country code | The country.  |
| aggregateRating | string | - | The average rating based on multiple ratings or reviews. |
| ratingCount | integer | - | The amount of ratigns and reviews used in calculating the aggregateRating. |
| slogan | string | Max length 256 chars | The slogan of the organization. This is often related to showing the brand |
| parentOrganization | string | - | The larger organization that this organization is a subOrganization of, if any. |



<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>
