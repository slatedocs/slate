# Hello world example


> Example of Pricing component usage:

```javascript
{
   "name":"Hello World Data Product",
   "description":"Product catalogs published by standardization organizations.",
   "valueProposition": "selling sentence here",
   "rating":4.7,
   "ratingCount":1259,
   "activeUsers":123,
   "visibility":"public",
   "status":"Published",
   "version": "1.0",
   "dataStream":{
        "harmonized":true,
        "supportedPayload":{
         "currentValues":{
            "requestContext":"https://standards-ontotest.oftrust.net/v2/Context/DataProductParameters/ProductCatalog/",
            "responseContext":"https://standards-ontotest.oftrust.net/v2/Context/DataProductOutput/ProductCatalog/",
            "version":"2.0",
            "versionHistory":[
               "1.2",
               "2.0"
            ]
         },
         "historyValues":{
            "requestContext":"https://standards-ontotest.oftrust.net/v2/Context/DataProductParameters/ProductCatalog/",
            "responseContext":"https://standards-ontotest.oftrust.net/v2/Context/DataProductOutput/ProductCatalog/",
            "version":"2.0",
            "versionHistory":[
               "1.2",
               "2.0"
            ]
         },
         "predictionValues":{
            "requestContext":"https://standards-ontotest.oftrust.net/v2/Context/DataProductParameters/ProductCatalog/",
            "responseContext":"https://standards-ontotest.oftrust.net/v2/Context/DataProductOutput/ProductCatalog/",
            "version":"2.0",
            "versionHistory":[
               "1.2",
               "2.0"
            ]
         }
      }
   },
   "condition":[
      {
         "name":"Reselling limitation",
         "descriptionGeneral":"Information cannot be sold further. Only to be used within buying organization.",
      }
   ],
   "priceplan":[
      {
         "name":"Premium subscription 1 year",
         "currency":"EUR",
         "unitGroup":"Duration",
         "unit":"year",
         "quantity":1,
         "rate":1000
      },
      {
            "name":"Premium Package",
            "currency":"EUR",
            "unitGroup":"Transaction",
            "unit":"Transaction",
            "quantity":100000,
            "rule":{
               "maxQuantity":100000
            },
            "rate":100
         },
         {
            "name":"Extra Requests",
            "currency":"EUR",
            "unitGroup":"Transaction",
            "unit":"Transaction",
            "quantity":1,
            "rule":{
               "minQuantity":100001
            },
            "rate":0.5
         }
   ],
   "quality":[
      {
         "name":"Update frequency",
         "value":"Information is updated once per day."
      },
      {
         "name":"Uptime",
         "value":"99%"
      },
      {
         "name":"Response time",
         "value":"400 ms"
      }
   ],
   "service":[
      {
         "name":"Phone support hours",
         "descriptionGeneral":"Support is available between 08-16 weekdays.",
         "categorizationLocal":"Support",
         "categorizationPoT":"dataProduct"
      }
   ],
   "connector":[
      {
         "name":"Electrical devices catalog",
         "descriptionGeneral":"Catalog of electrical devices.",
         "version":"2.0",
         "monitoring":{
            "url":"https://status.uptimerobot.com/"
         },
      },
      {
         "name":"Furniture  catalog",
         "description":"Catalog of furniture.",
         "version":"3.0",
         "monitoring":{
            "url":"https://status.uptimerobot.com/"
        }
   ]
}
```