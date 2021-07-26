## Discounts

The discount allows the assignment of a percentage discount or credit to an applied pricing.

<!-------------------- LIST DISCOUNTS -------------------->
### List discounts

`GET /applied_pricings/:applied_pricing_id/discounts?type=:type`

Retrieves the list of discounts associated with an applied pricing.

```shell
# Retrieve applied pricing list
curl "https://cloudmc_endpoint/rest/applied_pricings/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts?type=PERCENTAGE" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "applyToNewCustomersOnly": true,
      "discountedProducts": {},
      "durationMonths": 22354,
      "type": "PERCENTAGE",
      "packageDiscount": 20.0,
      "discountScope": "ALL_PRODUCTS",
      "isDeactivated": true,
      "discountedCategories": {},
      "name": {
        "en": "Summer Discount",
        "fr": "Réduction Estival"
      },
      "id": "18db7bc6-8be1-48bb-bab1-77a7d696fa3b",
      "appliedPricing": {
        "id": "efd32752-c6f2-45cf-b494-cc6be8a45845"
      },
      "startDate": "2021-07-20T15:57:16.132Z",
      "status": "CURRENT"
    }
  ]
}
```
Optional Query Parameters | &nbsp;
---------- | -----------
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the discount.
`discountedProducts`<br/>*Map[UUID, BigDecimal]* | A mapping of the desired priced product IDs and discounts. All pricing products specified will have the discount value applied to them.
`durationMonths`<br/>*integer* | Duration of the discount once it has been applied to a customer. If not provided the discount will last indefinitely, or until credit values are reached.
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".
`packageDiscount`<br/>*BigDecimal* | The discount value that will be applied to all products within the applied pricing.
`discountScope`<br/>*enum* | The scope of the discount. It could be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`isDeactivated`<br/>*boolean* | Whether or not the discount is deactivated. Defaults to false.
`discountedCategories`<br/>*Map[UUID, BigDecimal]* | A mapping between category IDs and discount values. All pricing products within a category will have the discount value applied to them.
`name`<br/>*Map[String, String]* | The name translations of the discount.
`appliedPricing`<br/>*Object* | The applied pricing being discounted.
`appliedPricing.id`<br/>*UUID* | The UUID of the applied pricing.
`applyToNewCustomersOnly`<br/>*boolean* | If true, the discount will only be applied to organizations created after the discount start date.
`startDate`<br/>*date* | The start date of the discount.
`cutoffDate`<br/>*date* | The date on which the discount will no longer be available to customers who have not already received it. If not provided, the discount will always be available after the start date.
`status`<br/>*enum* | The status of the discount. Possible values are: UPCOMING, CURRENT, ENDED.

<!-------------------- GET DISCOUNT -------------------->
### Get discount

`GET /applied_pricings/:applied_pricing_id/discounts/:id`

Retrieves a discount's details.

```shell
# Retrieve applied pricing list
curl "https://cloudmc_endpoint/rest/applied_pricings/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts/08695c90-3e41-4be8-a3a3-df964620ba62" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "applyToNewCustomersOnly": true,
      "discountedProducts": {},
      "durationMonths": 22354,
      "type": "PERCENTAGE",
      "packageDiscount": 20.0,
      "discountScope": "ALL_PRODUCTS",
      "isDeactivated": true,
      "discountedCategories": {},
      "name": {
        "en": "Summer Discount",
        "fr": "Réduction Estival"
      },
      "id": "18db7bc6-8be1-48bb-bab1-77a7d696fa3b",
      "appliedPricing": {
        "id": "efd32752-c6f2-45cf-b494-cc6be8a45845"
      },
      "startDate": "2021-07-20T15:57:16.132Z",
      "status": "CURRENT"
    }
  ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the discount.
`discountedProducts`<br/>*Map[UUID, BigDecimal]* | A mapping of the desired priced product IDs and discounts. All pricing products specified will have the discount value applied to them.
`durationMonths`<br/>*integer* | Duration of the discount once it has been applied to a customer. If not provided the discount will last indefinitely, or until credit values are reached.
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".
`packageDiscount`<br/>*BigDecimal* | The discount value that will be applied to all products within the applied pricing.
`discountScope`<br/>*enum* | The scope of the discount. It could be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`isDeactivated`<br/>*boolean* | Whether or not the discount is deactivated. Defaults to false.
`discountedCategories`<br/>*Map[UUID, BigDecimal]* | A mapping between category IDs and discount values. All pricing products within a category will have the discount value applied to them.
`name`<br/>*Map[String, String]* | The name translations of the discount.
`appliedPricing`<br/>*Object* | The applied pricing being discounted.
`appliedPricing.id`<br/>*UUID* | The UUID of the applied pricing.
`applyToNewCustomersOnly`<br/>*boolean* | If true, the discount will only be applied to organizations created after the discount start date.
`startDate`<br/>*date* | The start date of the discount.
`cutoffDate`<br/>*date* | The date on which the discount will no longer be available to customers who have not already received it. If not provided, the discount will always be available after the start date.
`status`<br/>*enum* | The status of the discount. Possible values are: UPCOMING, CURRENT, ENDED.

<!-------------------- CREATE DISCOUNT -------------------->
### Create discount

`POST /applied_pricings/:applied_pricing_id/discounts`

Creates a new discount 

```shell
# Creates a new discount
curl -X POST "https://cloudmc_endpoint/rest/applied_pricings/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts" \
   -H "MC-Api-Key: your_api_key"
```
> Request body example:

```json
{
  "name": {
    "en": "Summer Discount",
    "fr": "Réduction Estival"
  },
  "startDate": "2021-07-23T00:00:00.000Z",
  "type": "PERCENTAGE",
  "durationMonths": 4,
  "discountedProducts": {},
  "discountedCategories": {
    "8cf73cc0-b86e-49b4-a102-6102894f7955": 2, 
    "00358632-5c9a-4164-a9a9-df271a9c06a9": 22
  },
  "discountScope": "CATEGORIES", 
  "cutoffDate": "2021-07-24T00:00:00.000Z",
  "applyToNewCustomersOnly": false,
}
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
      "applyToNewCustomersOnly": false,
      "discountedProducts": {},
      "durationMonths": 4,
      "type": "PERCENTAGE",
      "discountScope": "CATEGORIES",
      "discountedCategories": {
        "8cf73cc0-b86e-49b4-a102-6102894f7955": 2, 
        "00358632-5c9a-4164-a9a9-df271a9c06a9": 22
      },  
      "name": {
        "en": "Summer Discount",
        "fr": "Réduction Estival"
      },
      "id": "18db7bc6-8be1-48bb-bab1-77a7d696fa3b",
      "appliedPricing": {
        "id": "efd32752-c6f2-45cf-b494-cc6be8a45845"
      },
      "startDate": "2021-07-23T00:00:00.000Z",
      "cutoffDate": "2021-07-24T00:00:00.000Z",
  }
}
```

Required | &nbsp;
------- | -----------
`name`<br/>*Map[String, String]* | The name translations of the discount.
`type`<br/>*enum* | The type of the discount. It can be either "PERCENTAGE" or "CREDIT".
`startDate`<br/>*date* | The start date of the discount.
`applyToNewCustomersOnly`<br/>*boolean* | If true, the discount will only be applied to organizations created after the discount start date.
`discountScope`<br/>*enum* | The scope of the discount. It can be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`packageDiscount`<br/>*BigDecimal* | The discount value that will be applied to all products within the applied pricing. Only required if the scope is "ALL_PRODUCTS". The value must be between (0,100] for a percentage discount and greater than 0 for a credit.
`discountedCategories`<br/>*Map[UUID, BigDecimal]* | A mapping between category IDs and discount values. All pricing products within a category will have the discount value applied to them. Required to be non-empty if scope is "CATEGORIES". All discount values must be between (0,100] for a percentage discount and greater than 0 for a credit.
`discountedProducts`<br/>*Map[UUID, BigDecimal]* | A mapping of the desired priced product IDs and discount values. All pricing products specified will have the discount value applied to them. Required to be non-empty if scope is "PRODUCTS". All discount values must be between (0,100] for a percentage discount and greater than 0 for a credit.

Optional | &nbsp;
------- | -----------
`cutoffDate`<br/>*date* | The date on which the discount will no longer be available to customers who have not already received it. If not provided, the discount will always be available after the start date. 
`durationMonths`<br/>*integer* | Duration of the discount once it has been applied to a customer. If not provided the discount will last indefinitely, or until credit values are reached.

<!-------------------- EDIT DISCOUNT -------------------->
### Edit discount

`PUT /applied_pricings/:applied_pricing_id/discounts/:id`

Edit an existing discount that hasn't ended. Only the name and cutoff date can be edited for current discount. All fields can be edited for upcoming discounts.

```shell
# Edit an existing discount
curl -X PUT "https://cloudmc_endpoint/rest/applied_pricings/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts/08695c90-3e41-4be8-a3a3-df964620ba62" \
   -H "MC-Api-Key: your_api_key"
```
> Request body example:

```json
{
  "name": {
    "en": "End of summer Discount",
    "fr": "Réduction estival fin d'été"
  },
  "durationMonths": 4,
  "discountedProducts": {},
  "discountedCategories": {
    "8cf73cc0-b86e-49b4-a102-6102894f7955": 2, 
    "00358632-5c9a-4164-a9a9-df271a9c06a9": 22
  },
  "discountScope": "CATEGORIES", 
  "cutoffDate": "2021-08-24T00:00:00.000Z",
  "applyToNewCustomersOnly": false,
}
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
      "applyToNewCustomersOnly": false,
      "discountedProducts": {},
      "durationMonths": 4,
      "type": "PERCENTAGE",
      "discountScope": "CATEGORIES",
      "discountedCategories": {
        "8cf73cc0-b86e-49b4-a102-6102894f7955": 2, 
        "00358632-5c9a-4164-a9a9-df271a9c06a9": 22
      },  
      "name": {
        "en": "End of summer Discount",
        "fr": "Réduction estival fin d'été"
      },
      "id": "18db7bc6-8be1-48bb-bab1-77a7d696fa3b",
      "appliedPricing": {
        "id": "efd32752-c6f2-45cf-b494-cc6be8a45845"
      },
      "startDate": "2021-07-23T00:00:00.000Z",
      "cutoffDate": "2021-08-24T00:00:00.000Z",
      "status": "UPCOMING"
  }
}
```

Optional | &nbsp;
------- | -----------
`name`<br/>*Map[String, String]* | The name translations of the discount.
`startDate`<br/>*date* | The start date of the discount.
`applyToNewCustomersOnly`<br/>*boolean* | If true, the discount will only be applied to organizations created after the discount start date.
`discountScope`<br/>*enum* | The scope of the discount. It can be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`packageDiscount`<br/>*BigDecimal* | The discount value that will be applied to all products within the applied pricing. Only required if the scope is "ALL_PRODUCTS". The value must be between (0,100] for a percentage discount and greater than 0 for a credit.
`discountedCategories`<br/>*Map[UUID, BigDecimal]* | A mapping between category IDs and discount values. All pricing products within a category will have the discount value applied to them. Required to be non-empty if scope is "CATEGORIES". All discount values must be between (0,100] for a percentage discount and greater than 0 for a credit.
`discountedProducts`<br/>*Map[UUID, BigDecimal]* | A mapping of the desired priced product IDs and discount values. All pricing products specified will have the discount value applied to them. Required to be non-empty if scope is "PRODUCTS". All discount values must be between (0,100] for a percentage discount and greater than 0 for a credit.
`cutoffDate`<br/>*date* | The date on which the discount will no longer be available to customers who have not already received it. If not provided, the discount will always be available after the start date. 
`durationMonths`<br/>*integer* | Duration of the discount once it has been applied to a customer. If not provided the discount will last indefinitely, or until credit values are reached.