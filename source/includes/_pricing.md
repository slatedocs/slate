# Pricing

Pricing component.....


| Element name  | Type  | Options  | Description  |
|---|---|---|---|
| name  | string  | text content, max length 256 chars  | Attribute is the name of the data product.  | 
|   |   |   |   |
|   |   |   |   |

> Example of Pricing component usage:

```javascript
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
       }
   ]
```
