### Applied Pricings

The applied pricing allows the assignment of pricing to organization with a determined scope.

<!-------------------- LIST APPLIED PRICINGS -------------------->
#### List applied pricings

`GET /applied_pricings`

Retrieves a list of applied pricings configured in the system.

```shell
# Retrieve applied pricing list
curl "https://cloudmc_endpoint/rest/applied_pricings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the pricing.
`name`<br/>*Object* | The name object in each language for the pricing.
`description`<br/>*string* | The description object in each language for the pricing.
`supportedCurrencies`<br/>*Array[string]* | List of the currencies which are supported by this pricing.
`productCatalogs`<br/>*Array[Object]* | List of product catalog objects which are attached to this pricing.
`organization.id`<br/>*UUID* | UUID of the organisation to which belongs the pricing.
`pricingProducts`<br/>*Array[Object]* | The list of product pricings assigned to the pricing.
`pricingProducts.id`<br/>*UUID* | UUID of the product pricing.
`pricingProducts.unitPrice`<br/>*double* | The unit price of the product.
`pricingProducts.product`<br/>*Object* | The product attached to this product pricing element.
`pricingProducts.cogs`<br/>*double* | The Cost Of Goods Sold (COGS) of the product.
`pricingProducts.currency`<br/>*string* | The currency of the pricing.


<!-------------------- GET APPLIED PRICING -------------------->
#### Retrieve an applied pricing

`GET /applied_pricings/:id`

Retrieve an applied pricing's details.

```shell
# Retrieve an applied pricing
curl "https://cloudmc_endpoint/rest/applied_pricings/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the pricing.
`name`<br/>*Object* | The name object in each language for the pricing.
`description`<br/>*string* | The description object in each language for the pricing.
`supportedCurrencies`<br/>*Array[string]* | List of the currencies which are supported by this pricing.
`productCatalogs`<br/>*Array[Object]* | List of product catalog objects which are attached to this pricing.
`organization.id`<br/>*UUID* | UUID of the organisation to which belongs the pricing. It is more detailed.
`pricingProducts`<br/>*Array[Object]* | The list of product pricings assigned to the pricing.
`pricingProducts.id`<br/>*UUID* | UUID of the product pricing.
`pricingProducts.unitPrice`<br/>*double* | The unit price of the product.
`pricingProducts.product`<br/>*Object* | The product attached to this product pricing element.
`pricingProducts.cogs`<br/>*double* | The Cost Of Goods Sold (COGS) of the product.
`pricingProducts.currency`<br/>*string* | The currency of the pricing.

<!-------------------- CREATE APPLIED PRICING -------------------->
#### Create applied pricing

`POST /applied_pricings`

Create a new pricing.

```shell
# Creates a new pricing
curl -X POST "https://cloudmc_endpoint/rest/applied_pricings" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{

}
```
> The above command return JSON structured like this:

```js
{

}
```

Required | &nbsp;
------- | -----------
`ownerOrganization.id` <br/>*UUID* | The UUID of the organization the applied pricing belongs to. 
`pricingDefinition.id` <br/>*UUID* | the UUID of the pricing that will be used in the applied pricing.
`scopeQualifier` <br/>*string* | The scope qualifier for the applied pricing. Possible values are : ORG_BASE, ORG_TREE, ORG_SUB, ORG_TOPLEVEL, TAG_ANYMATCH, GLOBAL.
`currency` <br/>*String* | The currency used for the applied pricing. The value is a ISO 4217 currency code that is part of the pricing selected. 
`startDate` <br/>*Date* | The start date for the applied pricing.
`billingDay` <br/>*int*| The billing day of the month.

Optional | &nbsp;
------- | -----------
`endDate` <br/>*Date* | The end date for the applied pricing. 
`organization.id` <br/>*UUID* | The UUID of the organization that the scope is targeting. Only required for scopes : ORG_BASE, ORG_TREE, ORG_SUBS. 
`tags` <br/>*Array[string]* | The list of tags to be scoped when the scope qualifier is TAGS_ANY_MATCH. 
