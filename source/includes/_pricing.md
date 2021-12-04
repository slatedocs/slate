# Pricing

Pricing is the process whereby a business sets the price at which it will sell its products and services. Pricing **ELEMENT** consists of mandatory and optional attributes. Mandatory attributes are listed in separate table and marked with **bolded names** and asterix **\***. Next to the mandatory attributes is an example. The same logic applies to the optional attributes as well. Optional attributes are listed in own table and an example is given in the right column. 

Supported pricing models include:

1. recurring time period based (day, week, month, year) plans
2. one time payments plans
3. pay-as-you-go plans


## Mandatory attributes and elements

> Example of Pricing component usage with manadatory elements and attributes:

```javascript
   "pricing":[
      {
         "name":"Premium subscription 1 year",
         "priceCurrency":"EUR",
         "price":"50.00",
         "billingDuration": "year",
         "billingType": "recurring"
      },
      {
         "name":"Premium Package Monthly",
         "priceCurrency":"EUR",
         "price":"5.00", 
         "billingDuration": "month",
         "billingType": "recurring"
       }
   ]
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **name** **\*** | string  | text content, max length 256 chars  | Attribute is the name of the data product.  | 
| **priceCurrency** **\*** | string  | Use standard formats: [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency format e.g. "USD"; Ticker symbol for cryptocurrencies e.g. "BTC"  | The primary currency used in pricing. Platforms are assumed to use this as primary currency if currency conversions are used to display product pricing in different locations for various currencies  |
|  **price** **\*** | string  | -  | The offer price of a product, or of a price component. Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols.  |
| **billingDuration** **\*** | Duration  | instant, day, week, month, year  | Specifies for how long this price (or price component) will be billed. Can be used, for example, to model the contractual duration of a subscription or payment plan. |
| **unit** **\*** | string | one-time-payment, pay-per-use, recurring | One-time-payment is for single time purchase purposes, further purchaces are not intended to continue under same agreement. Pay-per-use is intended for continuous usage and price set is for each successful usage action. Recurrring is intended for continuous time period plans|
| **maxTransactionQuantity** **\*** | Integer | - | The maximum transaction quantity for the given billing duration. Use this to define for example monthly (or any other period) request limit to the data product |
|  |  |  |  |


## Optional attributes and elements

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
         "maxPrice":"20.00",
         "valueAddedTaxIncluded": false
       }
   ]
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
|  minPrice | string  | -  | The highest price if the price is a range. If dynamic pricing is used with this product, this is the lowest price allowed. Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols. |
|  maxPrice | string  | -  | The lowest price if the price is a range. If dynamic pricing is used with this product, this is the highest price allowed. Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols. |
| valueAddedTaxIncluded  | boolean  | true/false  | Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.  |
| validFrom  | DateTime  |  A combination of date and time in [ISO 8601](https://www.ionos.com/digitalguide/websites/web-development/iso-8601/) format yyyy-MM-dd'T'HH:mm:ss.SSSZ. | The date when the item becomes valid. |
| validTo  | DateTime  | A combination of date and time in [ISO 8601](https://www.ionos.com/digitalguide/websites/web-development/iso-8601/) format yyyy-MM-dd'T'HH:mm:ss.SSSZ.  | The date after when the item is not valid. |
| additionalPrice  | string  | -  | This is used to define fees for usage which exceeds the defined max transaction quantity. This value is for each additional transaction. Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols. |
|   |   |   |   |
