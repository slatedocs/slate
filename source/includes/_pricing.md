# Pricing

Pricing component.....

Mandatory elements and attributes are marked with **bolded names**. 

| Element name  | Type  | Options  | Description  |
|---|---|---|---|
| **name**  | string  | text content, max length 256 chars  | Attribute is the name of the data product.  | 
| **currency**  | string  | One of official [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency names. Three letters in capslock.  | The primary currency used in pricing. Platforms are assumed to use this as primary currency if currency conversions are used to display product pricing in different locations for various currencies  |
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
