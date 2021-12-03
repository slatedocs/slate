# Pricing

Pricing component.....

Mandatory elements and attributes are marked with **bolded names** and asterix **\***. 


### Mandatory attributes and elements

> Example of Pricing component usage with manadatory elements and attributes:

```javascript
   "pricing":[
      {
         "name":"Premium subscription 1 year",
         "priceCurrency":"EUR",
         "price":"10.00"
      },
      {
         "name":"Premium Package",
         "priceCurrency":"EUR",
         "price":"10.00"
       }
   ]
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **name** **\*** | string  | text content, max length 256 chars  | Attribute is the name of the data product.  | 
| **priceCurrency** **\*** | string  | Use standard formats: [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency format e.g. "USD"; Ticker symbol for cryptocurrencies e.g. "BTC"  | The primary currency used in pricing. Platforms are assumed to use this as primary currency if currency conversions are used to display product pricing in different locations for various currencies  |
|  **price** **\*** | string  | -  | The offer price of a product, or of a price component. Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols.  |
|   |   |   |   |


### Optional attributes and elements

> Example of Pricing component usage with some of the optional elements and attributes:

```javascript
   "pricing":[
      {
         "name":"Premium subscription 1 year",
         "priceCurrency":"EUR",
         "price":"10.00",
         "minPrice":"5.00",
         "maxPrice":"15.000"
      },
      {
         "name":"Premium Package",
         "priceCurrency":"EUR",
         "price":"10.00",
         "maxPrice":"20.00"
       }
   ]
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
|  minPrice | string  | -  | The highest price if the price is a range. If dynamic pricing is used with this product, this is the lowest price allowed. |
|  maxPrice | string  | -  | The lowest price if the price is a range. If dynamic pricing is used with this product, this is the highest price allowed. |
| valueAddedTaxIncluded  | boolean  | true/false  | Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.  |
|   |   |   |   |
