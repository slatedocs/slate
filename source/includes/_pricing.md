# Data Pricing

Pricing is the process whereby a business sets the price at which it will sell its products and services. Pricing **ELEMENT** consists of mandatory and optional attributes. This element contains pricing plans related data to be used for example in displaying the items in a marketplace. If needed the standard metadata is converted to marketplace internal format. We encourage all data product owners to enforce usage of this standard.  

Mandatory attributes are listed in separate table and marked with **bolded names** and asterix **\***. Next to the mandatory attributes is an example. 

The same logic applies to the optional attributes as well. Optional attributes are listed in own table and an example is given in the right column. 

Supported pricing models include:

1. recurring time period based (day, week, month, year) plans
2. one time payments plans
3. pay-as-you-go plans


<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>

## Mandatory attributes and elements

> Example of Pricing component usage with manadatory elements and attributes:

```javascript
   "pricing":[
      {
         "name":"Premium subscription 1 year",
         "priceCurrency":"EUR",
         "price":"50.00",
         "billingDuration": "year",
         "unit": "recurring",
         "maxTransactionQuantity":"unlimited"
      },
      {
         "name":"Premium Package Monthly",
         "priceCurrency":"EUR",
         "price":"5.00", 
         "billingDuration": "month",
         "unit": "recurring",
         "maxTransactionQuantity":10000
       },
       {
         "name":"Freemium Package",
         "priceCurrency":"EUR",
         "price":"0.00", 
         "billingDuration": "month",
         "unit": "recurring",
         "maxTransactionQuantity":1000
       }
   ]
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **name**  | string | max length 256 chars | **REQUIRED** The name of the product. |
| **name**  | string  | text content, max length 256 chars  | **REQUIRED** Attribute is the name of the data product.  | 
| **name**  | string |  max length 256 chars | **REQUIRED** The name of the product. |
| **priceCurrency** | string  |  Use standard formats: [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency format e.g. "USD"; Ticker symbol for cryptocurrencies e.g. "BTC"  | **REQUIRED** The primary currency used in pricing. Platforms are assumed to use this as primary currency if currency conversions are used to display product pricing in different locations for various currencies  |
|  **price** | string  | -  | **REQUIRED** The offer price of a product, or of a price component. Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols.  |
| **billingDuration** | string  | options: instant, day, week, month, year  | **REQUIRED** Specifies for how long this price (or price component) will be billed. Can be used, for example, to model the contractual duration of a subscription or payment plan. |
| **unit** | string | one-time-payment, pay-per-use, recurring | **REQUIRED** One-time-payment is for single time purchase purposes, further purchaces are not intended to continue under same agreement. Pay-per-use is intended for continuous usage and price set is for each successful usage action. Recurrring is intended for continuous time period plans|
| **maxTransactionQuantity** | string |  either "unlimited" or a number (Integer) | **REQUIRED** The maximum transaction quantity for the given billing duration. Use this to define for example monthly (or any other period) request limit to the data product |
|  |  |  |  |

<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>

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
         "additionalPrice":0.02
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
| valueAddedTaxPercentage  | Integer  | Number percentage value, range 0-100 | Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols.   |
| validFrom  | DateTime  |  A combination of date and time in [ISO 8601](https://www.ionos.com/digitalguide/websites/web-development/iso-8601/) format yyyy-MM-dd'T'HH:mm:ss.SSSZ. | The date when the item becomes valid. |
| validTo  | DateTime  | A combination of date and time in [ISO 8601](https://www.ionos.com/digitalguide/websites/web-development/iso-8601/) format yyyy-MM-dd'T'HH:mm:ss.SSSZ.  | The date after when the item is not valid. |
| additionalPrice  | string  | -  | This is used to define fees for usage which exceeds the defined max transaction quantity. This value is for each additional transaction. Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator. Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols. |


<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>
