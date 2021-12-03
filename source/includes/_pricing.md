# Pricing

Pricing component.....

Mandatory elements and attributes are marked with **bolded names** and asterix **\***. 

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **name** **\*** | string  | text content, max length 256 chars  | Attribute is the name of the data product.  | 
| **priceCurrency** **\*** | string  | Use standard formats: [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency format e.g. "USD"; Ticker symbol for cryptocurrencies e.g. "BTC"  | The primary currency used in pricing. Platforms are assumed to use this as primary currency if currency conversions are used to display product pricing in different locations for various currencies  |
|  **price** **\*** | string  | -  | The offer price of a product, or of a price component. Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols.  |
|  minPrice | string  | -  | The highest price if the price is a range. If dynamic pricing is used with this product, this is the lowest price allowed. |
|  maxPrice | string  | -  | The lowest price if the price is a range. If dynamic pricing is used with this product, this is the highest price allowed. |
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
