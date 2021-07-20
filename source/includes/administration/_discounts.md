## Discounts

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

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the discount.
`applyToNewCustomersOnly`<br/>*boolean* | If true, the discount will only be applied to organizations created after the discount..
`discountedProducts`<br/>*Map[UUID, BigDecimal]* | A mapping of the desired product IDs and discounts. To provide a 20 percent discount, set the discount value to 20.
`durationMonths`<br/>*integer* | Duration of the discount.
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".
`packageDiscount`<br/>*BigDecimal* | The discount applied to a package.
`discountScope`<br/>*enum* | The scope of the discount. It could be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`isDeactivated`<br/>*boolean* | Whether or not the discount is deactivated. Defaults to false..
`discountedCategories`<br/>*Map[UUID, BigDecimal]* | A mapping between the desired categories IDs and discounts. To provide a 20 percent discount, set the discount value to 20.
`name`<br/>*Map[String, String]* | Map of language short codes to name translations for the discount.
`appliedPricing`<br/>*Object* | The object representing the applied pricing owning the discount.
`appliedPricing.id`<br/>*UUID* | The UUID of the applied pricing.
`startDate`<br/>*date* | The start date of the discount.
`status`<br/>*enum* | The status of the discount. Possible values are : UPCOMING, CURRENT, ENDED.

Optional Query Parameters | &nbsp;
---------- | -----------
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".