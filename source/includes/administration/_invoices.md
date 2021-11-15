## Invoices

Note: Creating, deleting and updating invoices is not supported.

<!-------------------- GET INVOICE -------------------->
### Get customer invoices by reseller ID

`GET /invoices/find/:reseller_id/customer_invoices`

Retrieve a list of invoices belonging to the customers of the reseller specified.

```shell
# Retrieve customer invoices list
curl "https://cloudmc_endpoint/rest/invoices/find/efd32752-c6f2-45cf-b494-cc6be8a45845/customer_invoices?includeAllSubOrgs=false&billingCycle=07-2021" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
 "data": [{
  "draftedDate": "2021-07-27T00:00:00Z",
  "createdDate": "2021-07-27T00:00:00Z",
  "status": "DRAFT",
  "organization": {
   "name": "org_name",
   "id": "289ec5fb-0970-44e3-bca8-777a691e23c7"
  },
  "id": "20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb",
  "detail": {
      "total": 138.98,
      "adjustments": [],
      "adjustmentAggregations": [
        {
          "amount": 0,
          "before": 120.88,
          "cumulativeAmount": -599.14,
          "after": 120.88,
          "type": "PERCENTAGE",
        },
        {
          "amount": 0,
          "subtype": "QUEBEC QST/TVQ",
          "before": 138.98,
          "cumulativeAmount": 12.06,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "subtype": "CANADA GST/TPS",
          "before": 138.98,
          "cumulativeAmount": 6.04,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "before": 138.98,
          "cumulativeAmount": 18.1,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "before": 138.97,
          "cumulativeAmount": 0,
          "after": 138.98,
          "type": "CREDIT",
        },
      ],
      "endDate": "2021-10-08T00:00:00Z",
      "currency": "CAD",
      "subTotal": 120.87,
      "categories": [
        {
          "total": 138.97,
          "adjustments": [
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -72.0,
              "before": 720.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "packageDiscount": 10.0,
                "adjustmentReferenceId": "625b78d8-ed4c-4004-8f8c-ab8073979714",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "all product discount",
                },
                "subtype": "",
                "id": "625b78d8-ed4c-4004-8f8c-ab8073979714",
                "credit": false,
                "startDate": "2021-10-06T00:00:00Z",
              },
              "after": 648.0,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -162.0,
              "before": 648.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "cutoffDate": "2022-01-20T00:00:00Z",
                "adjustmentReferenceId": "cc8b2e31-0050-4e09-9f76-7fa2f9c86381",
                "discountScope": "CATEGORIES",
                "discountedCategories": {
                  "5e111681-3025-4fc0-9890-b85512f7cb97": 5,
                  "d88a106d-608f-48f4-a6be-a97f9f6c29c5": 25,
                  "f989c36f-ca07-43eb-90e4-b263446a0e51": 10,
                  "ceb6e3b8-36bf-4e10-a309-671d65bab26b": 12,
                  "b740f674-0594-49fb-9b0a-f3e0f91b2aa5": 30,
                  "b4fefd4a-f447-4a72-9c2d-34e35232b89d": 15,
                },
                "name": {
                  "en": "Category discount",
                },
                "subtype": "",
                "id": "cc8b2e31-0050-4e09-9f76-7fa2f9c86381",
                "credit": false,
                "startDate": "2021-07-07T00:00:00Z",
              },
              "after": 486.0,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -24.3,
              "before": 486.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "durationDays": 60,
                "type": "PERCENTAGE",
                "cutoffDate": "2021-09-16T00:00:00Z",
                "adjustmentReferenceId": "dfbe71e2-113d-4212-a315-b8d755ef02d4",
                "discountScope": "CATEGORIES",
                "discountedCategories": {
                  "5e111681-3025-4fc0-9890-b85512f7cb97": 5,
                  "d88a106d-608f-48f4-a6be-a97f9f6c29c5": 5,
                  "f989c36f-ca07-43eb-90e4-b263446a0e51": 10,
                },
                "name": {
                  "en": "test-categories",
                },
                "subtype": "",
                "id": "dfbe71e2-113d-4212-a315-b8d755ef02d4",
                "credit": false,
                "startDate": "2021-09-16T00:00:00Z",
              },
              "after": 461.7,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -304.72,
              "before": 461.7,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "packageDiscount": 66.0,
                "adjustmentReferenceId": "ebb7f584-7bb2-4a41-90e7-9cc1eb428b95",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "gui's special",
                },
                "subtype": "",
                "id": "ebb7f584-7bb2-4a41-90e7-9cc1eb428b95",
                "credit": false,
                "startDate": "2021-08-23T00:00:00Z",
              },
              "after": 156.98,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -36.11,
              "before": 156.98,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "durationDays": 60,
                "type": "PERCENTAGE",
                "packageDiscount": 23.0,
                "cutoffDate": "2021-08-29T00:00:00Z",
                "adjustmentReferenceId": "f3b579a2-b37f-4a55-bfbe-bc07973eb242",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "new-discount",
                },
                "subtype": "",
                "id": "f3b579a2-b37f-4a55-bfbe-bc07973eb242",
                "credit": false,
                "startDate": "2021-08-13T00:00:00Z",
              },
              "after": 120.87,
              "type": "PERCENTAGE",
            },
          ],
          "adjustmentAggregations": [
            {
              "amount": -599.13,
              "before": 720.0,
              "cumulativeAmount": -599.13,
              "after": 120.87,
              "type": "PERCENTAGE",
            },
            {
              "amount": 0,
              "subtype": "QUEBEC QST/TVQ",
              "before": 138.97,
              "cumulativeAmount": 12.06,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "subtype": "CANADA GST/TPS",
              "before": 138.97,
              "cumulativeAmount": 6.04,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "before": 138.97,
              "cumulativeAmount": 18.1,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "before": 138.97,
              "cumulativeAmount": 0,
              "after": 138.97,
              "type": "CREDIT",
            },
          ],
          "name": {
            "en": "Compute",
          },
          "subTotal": 120.87,
          "categoryId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
          "products": [
            {
              "total": 738.1,
              "unit": {
                "unit": "UNIT",
                "name": {},
              },
              "adjustments": [
                {
                  "itemId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
                  "amount": 6.04,
                  "before": 720.0,
                  "source": {
                    "discountScope": "PRODUCTS",
                    "type": "TAX",
                    "adjustmentReferenceId": "",
                  },
                  "after": 726.04,
                  "type": "TAX",
                },
                {
                  "itemId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
                  "amount": 12.06,
                  "before": 726.04,
                  "source": {
                    "discountScope": "PRODUCTS",
                    "type": "TAX",
                    "adjustmentReferenceId": "",
                  },
                  "after": 738.1,
                  "type": "TAX",
                },
              ],
              "adjustmentAggregations": [
                {
                  "amount": 0,
                  "before": 720.0,
                  "cumulativeAmount": 0,
                  "after": 720.0,
                  "type": "PERCENTAGE",
                },
                {
                  "amount": 12.06,
                  "subtype": "QUEBEC QST/TVQ",
                  "before": 726.04,
                  "cumulativeAmount": 12.06,
                  "after": 738.1,
                  "type": "TAX",
                },
                {
                  "amount": 6.04,
                  "subtype": "CANADA GST/TPS",
                  "before": 720.0,
                  "cumulativeAmount": 6.04,
                  "after": 726.04,
                  "type": "TAX",
                },
                {
                  "amount": 18.1,
                  "before": 720.0,
                  "cumulativeAmount": 18.1,
                  "after": 738.1,
                  "type": "TAX",
                },
                {
                  "amount": 0,
                  "before": 738.1,
                  "cumulativeAmount": 0,
                  "after": 738.1,
                  "type": "CREDIT",
                },
              ],
              "productId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
              "price": "1.00",
              "usage": 720.0,
              "name": {
                "en": "Container (1 vCPU, 2Gi RAM, 5Gi Root Disk)",
              },
              "subTotal": 720.0,
              "sku": "CCM-1M02",
              "taxCode": "SW053000",
              "categoryId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
            },
          ],
        },
      ],
      "startDate": "2021-09-08T00:00:00Z",
    }
 }]
}
```

Optional Query Parameters | &nbsp;
---------- | -----------
`includeAllSubOrgs`<br/>*boolean* | Whether or not to include sub-organizations of sub-organizations or just direct sub-organizations of the reseller.
`billingCycle`<br/>*String* | The cycle which the invoice belongs to. Format is `MM-YYYY`

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`invoiceId`<br/>*string* | The human readable id.
`status`<br/>*enum* | The status of the invoice. Possible values are: USAGE_PENDING, DRAFT, ISSUED, OVERDUE, PAID, VOID.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted. Is null if status is still USAGE_PENDING.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before taxes and credits.
`detail.total`<br/>*string* | The invoice total after discounts, taxes, and credits.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustments.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustments.before`<br/>*string* | The invoice total before the adjustment was applied.
`detail.adjustments.after`<br/>*string* | The invoice total after the adjustment was applied.
`detail.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustmentAggregations.before`<br/>*string* | The invoice total before the adjustments were applied.
`detail.adjustmentAggregations.after`<br/>*string* | The invoice total after the adjustments were applied.
`detail.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the invoice, its categories and their products.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period.
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.subTotal`<br/>*string* | A string with the category subtotal, before taxes and credits.
`detail.categories.total`<br/>*string* | A string with the category subtotal, after taxes and credits.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the category. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustments.itemId`<br/>*UUID* | The category id.
`detail.categories.adjustments.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustments.before`<br/>*string* | The category total before the adjustment was applied.
`detail.categories.adjustments.after`<br/>*string* | The category total after the adjustment was applied.
`detail.categories.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustmentAggregations.before`<br/>*string* | The category total before the adjustments were applied.
`detail.categories.adjustmentAggregations.after`<br/>*string* | The category total after the adjustments were applied.
`detail.categories.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the category and its products.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.subTotal`<br/>*string* | A string with the product subtotal, before taxes and credits.
`detail.categories.products.total`<br/>*string* | A string with the product total, after taxes and credits.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the period.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`detail.categories.products.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.products.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustments.itemId`<br/>*UUID* | The product id.
`detail.categories.products.adjustments.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustments.before`<br/>*string* | The product total before the adjustment was applied.
`detail.categories.products.adjustments.after`<br/>*string* | The product total after the adjustment was applied.
`detail.categories.products.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.products.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.products.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustmentAggregations.before`<br/>*string* | The product total before the adjustments were applied.
`detail.categories.products.adjustmentAggregations.after`<br/>*string* | The product total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.cumulativeAmount`<br/>*string* | The adjustment amount applied to the product total.

<!-------------------- LIST INVOICES -------------------->
### List invoices of organization

`GET /invoices?organization_id=:organization_id&billingCycle=MM-YYYY`

Retrieve the list of invoices associated with an organization.

```shell
# Retrieve list of invoices of an organization
curl "https://cloudmc_endpoint/rest/invoices?organization_id=289ec5fb-0970-44e3-bca8-777a691e23c7&billingCycle=07-2021" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [{
  "draftedDate": "2021-07-27T00:00:00Z",
  "createdDate": "2021-07-27T00:00:00Z",
  "status": "ISSUED",
  "organization": {
   "name": "org_name",
   "id": "289ec5fb-0970-44e3-bca8-777a691e23c7"
  },
  "id": "20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb",
  "detail": {
      "total": 138.98,
      "adjustments": [],
      "adjustmentAggregations": [
        {
          "amount": 0,
          "before": 120.88,
          "cumulativeAmount": -599.14,
          "after": 120.88,
          "type": "PERCENTAGE",
        },
        {
          "amount": 0,
          "subtype": "QUEBEC QST/TVQ",
          "before": 138.98,
          "cumulativeAmount": 12.06,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "subtype": "CANADA GST/TPS",
          "before": 138.98,
          "cumulativeAmount": 6.04,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "before": 138.98,
          "cumulativeAmount": 18.1,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "before": 138.97,
          "cumulativeAmount": 0,
          "after": 138.98,
          "type": "CREDIT",
        },
      ],
      "endDate": "2021-10-08T00:00:00Z",
      "currency": "CAD",
      "subTotal": 120.87,
      "categories": [
        {
          "total": 138.97,
          "adjustments": [
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -72.0,
              "before": 720.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "packageDiscount": 10.0,
                "adjustmentReferenceId": "625b78d8-ed4c-4004-8f8c-ab8073979714",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "all product discount",
                },
                "subtype": "",
                "id": "625b78d8-ed4c-4004-8f8c-ab8073979714",
                "credit": false,
                "startDate": "2021-10-06T00:00:00Z",
              },
              "after": 648.0,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -162.0,
              "before": 648.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "cutoffDate": "2022-01-20T00:00:00Z",
                "adjustmentReferenceId": "cc8b2e31-0050-4e09-9f76-7fa2f9c86381",
                "discountScope": "CATEGORIES",
                "discountedCategories": {
                  "5e111681-3025-4fc0-9890-b85512f7cb97": 5,
                  "d88a106d-608f-48f4-a6be-a97f9f6c29c5": 25,
                  "f989c36f-ca07-43eb-90e4-b263446a0e51": 10,
                  "ceb6e3b8-36bf-4e10-a309-671d65bab26b": 12,
                  "b740f674-0594-49fb-9b0a-f3e0f91b2aa5": 30,
                  "b4fefd4a-f447-4a72-9c2d-34e35232b89d": 15,
                },
                "name": {
                  "en": "Category discount",
                },
                "subtype": "",
                "id": "cc8b2e31-0050-4e09-9f76-7fa2f9c86381",
                "credit": false,
                "startDate": "2021-07-07T00:00:00Z",
              },
              "after": 486.0,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -24.3,
              "before": 486.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "durationDays": 60,
                "type": "PERCENTAGE",
                "cutoffDate": "2021-09-16T00:00:00Z",
                "adjustmentReferenceId": "dfbe71e2-113d-4212-a315-b8d755ef02d4",
                "discountScope": "CATEGORIES",
                "discountedCategories": {
                  "5e111681-3025-4fc0-9890-b85512f7cb97": 5,
                  "d88a106d-608f-48f4-a6be-a97f9f6c29c5": 5,
                  "f989c36f-ca07-43eb-90e4-b263446a0e51": 10,
                },
                "name": {
                  "en": "test-categories",
                },
                "subtype": "",
                "id": "dfbe71e2-113d-4212-a315-b8d755ef02d4",
                "credit": false,
                "startDate": "2021-09-16T00:00:00Z",
              },
              "after": 461.7,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -304.72,
              "before": 461.7,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "packageDiscount": 66.0,
                "adjustmentReferenceId": "ebb7f584-7bb2-4a41-90e7-9cc1eb428b95",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "gui's special",
                },
                "subtype": "",
                "id": "ebb7f584-7bb2-4a41-90e7-9cc1eb428b95",
                "credit": false,
                "startDate": "2021-08-23T00:00:00Z",
              },
              "after": 156.98,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -36.11,
              "before": 156.98,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "durationDays": 60,
                "type": "PERCENTAGE",
                "packageDiscount": 23.0,
                "cutoffDate": "2021-08-29T00:00:00Z",
                "adjustmentReferenceId": "f3b579a2-b37f-4a55-bfbe-bc07973eb242",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "new-discount",
                },
                "subtype": "",
                "id": "f3b579a2-b37f-4a55-bfbe-bc07973eb242",
                "credit": false,
                "startDate": "2021-08-13T00:00:00Z",
              },
              "after": 120.87,
              "type": "PERCENTAGE",
            },
          ],
          "adjustmentAggregations": [
            {
              "amount": -599.13,
              "before": 720.0,
              "cumulativeAmount": -599.13,
              "after": 120.87,
              "type": "PERCENTAGE",
            },
            {
              "amount": 0,
              "subtype": "QUEBEC QST/TVQ",
              "before": 138.97,
              "cumulativeAmount": 12.06,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "subtype": "CANADA GST/TPS",
              "before": 138.97,
              "cumulativeAmount": 6.04,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "before": 138.97,
              "cumulativeAmount": 18.1,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "before": 138.97,
              "cumulativeAmount": 0,
              "after": 138.97,
              "type": "CREDIT",
            },
          ],
          "name": {
            "en": "Compute",
          },
          "subTotal": 120.87,
          "categoryId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
          "products": [
            {
              "total": 738.1,
              "unit": {
                "unit": "UNIT",
                "name": {},
              },
              "adjustments": [
                {
                  "itemId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
                  "amount": 6.04,
                  "before": 720.0,
                  "source": {
                    "discountScope": "PRODUCTS",
                    "type": "TAX",
                    "adjustmentReferenceId": "",
                  },
                  "after": 726.04,
                  "type": "TAX",
                },
                {
                  "itemId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
                  "amount": 12.06,
                  "before": 726.04,
                  "source": {
                    "discountScope": "PRODUCTS",
                    "type": "TAX",
                    "adjustmentReferenceId": "",
                  },
                  "after": 738.1,
                  "type": "TAX",
                },
              ],
              "adjustmentAggregations": [
                {
                  "amount": 0,
                  "before": 720.0,
                  "cumulativeAmount": 0,
                  "after": 720.0,
                  "type": "PERCENTAGE",
                },
                {
                  "amount": 12.06,
                  "subtype": "QUEBEC QST/TVQ",
                  "before": 726.04,
                  "cumulativeAmount": 12.06,
                  "after": 738.1,
                  "type": "TAX",
                },
                {
                  "amount": 6.04,
                  "subtype": "CANADA GST/TPS",
                  "before": 720.0,
                  "cumulativeAmount": 6.04,
                  "after": 726.04,
                  "type": "TAX",
                },
                {
                  "amount": 18.1,
                  "before": 720.0,
                  "cumulativeAmount": 18.1,
                  "after": 738.1,
                  "type": "TAX",
                },
                {
                  "amount": 0,
                  "before": 738.1,
                  "cumulativeAmount": 0,
                  "after": 738.1,
                  "type": "CREDIT",
                },
              ],
              "productId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
              "price": "1.00",
              "usage": 720.0,
              "name": {
                "en": "Container (1 vCPU, 2Gi RAM, 5Gi Root Disk)",
              },
              "subTotal": 720.0,
              "sku": "CCM-1M02",
              "taxCode": "SW053000",
              "categoryId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
            },
          ],
        },
      ],
      "startDate": "2021-09-08T00:00:00Z",
    }
 }]
}

```

Optional Query Parameters | &nbsp;
---------- | -----------
`organization_id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`billingCycle`<br/>*String* | The cycle which the invoice belongs to. Format is `MM-YYYY`

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`invoiceId`<br/>*string* | The human readable id.
`status`<br/>*enum* | The status of the invoice. Possible values are: USAGE_PENDING, DRAFT, ISSUED, OVERDUE, PAID, VOID.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted. Is null if status is still USAGE_PENDING.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before taxes and credits.
`detail.total`<br/>*string* | The invoice total after discounts, taxes, and credits.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustments.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustments.before`<br/>*string* | The invoice total before the adjustment was applied.
`detail.adjustments.after`<br/>*string* | The invoice total after the adjustment was applied.
`detail.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustmentAggregations.before`<br/>*string* | The invoice total before the adjustments were applied.
`detail.adjustmentAggregations.after`<br/>*string* | The invoice total after the adjustments were applied.
`detail.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the invoice, its categories and their products.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period.
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.subTotal`<br/>*string* | A string with the category subtotal, before taxes and credits.
`detail.categories.total`<br/>*string* | A string with the category subtotal, after taxes and credits.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the category. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustments.itemId`<br/>*UUID* | The category id.
`detail.categories.adjustments.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustments.before`<br/>*string* | The category total before the adjustment was applied.
`detail.categories.adjustments.after`<br/>*string* | The category total after the adjustment was applied.
`detail.categories.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustmentAggregations.before`<br/>*string* | The category total before the adjustments were applied.
`detail.categories.adjustmentAggregations.after`<br/>*string* | The category total after the adjustments were applied.
`detail.categories.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the category and its products.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the period.
`detail.categories.products.subTotal`<br/>*string* | A string with the product subtotal, before taxes and credits.
`detail.categories.products.total`<br/>*string* | A string with the product total, after taxes and credits.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`detail.categories.products.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.products.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustments.itemId`<br/>*UUID* | The product id.
`detail.categories.products.adjustments.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustments.before`<br/>*string* | The product total before the adjustment was applied.
`detail.categories.products.adjustments.after`<br/>*string* | The product total after the adjustment was applied.
`detail.categories.products.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.products.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.products.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustmentAggregations.before`<br/>*string* | The product total before the adjustments were applied.
`detail.categories.products.adjustmentAggregations.after`<br/>*string* | The product total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.cumulativeAmount`<br/>*string* | The adjustment amount applied to the product total.

<!-------------------- APPROVE INVOICE -------------------->
### Approve invoice

`PUT /invoices/:invoice_id/approve`

Manually approve an invoice in the 'DRAFT' state and issue the invoice to the customer by email. If the invoice is already in the 'ISSUED' state, an empty response will be returned and an email will not be sent. If the invoice is in any other state, an error will be thrown.

```shell
# Approve a draft invoice
curl -X PUT "https://cloudmc_endpoint/rest/invoices/20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb/approve" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
 "data": {
  "draftedDate": "2021-07-27T00:00:00Z",
  "createdDate": "2021-07-27T00:00:00Z",
  "status": "ISSUED",
  "organization": {
   "name": "org_name",
   "id": "289ec5fb-0970-44e3-bca8-777a691e23c7"
  },
  "id": "20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb",
  "detail": {
      "total": 138.98,
      "adjustments": [],
      "adjustmentAggregations": [
        {
          "amount": 0,
          "before": 120.88,
          "cumulativeAmount": -599.14,
          "after": 120.88,
          "type": "PERCENTAGE",
        },
        {
          "amount": 0,
          "subtype": "QUEBEC QST/TVQ",
          "before": 138.98,
          "cumulativeAmount": 12.06,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "subtype": "CANADA GST/TPS",
          "before": 138.98,
          "cumulativeAmount": 6.04,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "before": 138.98,
          "cumulativeAmount": 18.1,
          "after": 138.98,
          "type": "TAX",
        },
        {
          "amount": 0,
          "before": 138.97,
          "cumulativeAmount": 0,
          "after": 138.98,
          "type": "CREDIT",
        },
      ],
      "endDate": "2021-10-08T00:00:00Z",
      "currency": "CAD",
      "subTotal": 120.87,
      "categories": [
        {
          "total": 138.97,
          "adjustments": [
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -72.0,
              "before": 720.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "packageDiscount": 10.0,
                "adjustmentReferenceId": "625b78d8-ed4c-4004-8f8c-ab8073979714",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "all product discount",
                },
                "subtype": "",
                "id": "625b78d8-ed4c-4004-8f8c-ab8073979714",
                "credit": false,
                "startDate": "2021-10-06T00:00:00Z",
              },
              "after": 648.0,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -162.0,
              "before": 648.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "cutoffDate": "2022-01-20T00:00:00Z",
                "adjustmentReferenceId": "cc8b2e31-0050-4e09-9f76-7fa2f9c86381",
                "discountScope": "CATEGORIES",
                "discountedCategories": {
                  "5e111681-3025-4fc0-9890-b85512f7cb97": 5,
                  "d88a106d-608f-48f4-a6be-a97f9f6c29c5": 25,
                  "f989c36f-ca07-43eb-90e4-b263446a0e51": 10,
                  "ceb6e3b8-36bf-4e10-a309-671d65bab26b": 12,
                  "b740f674-0594-49fb-9b0a-f3e0f91b2aa5": 30,
                  "b4fefd4a-f447-4a72-9c2d-34e35232b89d": 15,
                },
                "name": {
                  "en": "Category discount",
                },
                "subtype": "",
                "id": "cc8b2e31-0050-4e09-9f76-7fa2f9c86381",
                "credit": false,
                "startDate": "2021-07-07T00:00:00Z",
              },
              "after": 486.0,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -24.3,
              "before": 486.0,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "durationDays": 60,
                "type": "PERCENTAGE",
                "cutoffDate": "2021-09-16T00:00:00Z",
                "adjustmentReferenceId": "dfbe71e2-113d-4212-a315-b8d755ef02d4",
                "discountScope": "CATEGORIES",
                "discountedCategories": {
                  "5e111681-3025-4fc0-9890-b85512f7cb97": 5,
                  "d88a106d-608f-48f4-a6be-a97f9f6c29c5": 5,
                  "f989c36f-ca07-43eb-90e4-b263446a0e51": 10,
                },
                "name": {
                  "en": "test-categories",
                },
                "subtype": "",
                "id": "dfbe71e2-113d-4212-a315-b8d755ef02d4",
                "credit": false,
                "startDate": "2021-09-16T00:00:00Z",
              },
              "after": 461.7,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -304.72,
              "before": 461.7,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "type": "PERCENTAGE",
                "packageDiscount": 66.0,
                "adjustmentReferenceId": "ebb7f584-7bb2-4a41-90e7-9cc1eb428b95",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "gui's special",
                },
                "subtype": "",
                "id": "ebb7f584-7bb2-4a41-90e7-9cc1eb428b95",
                "credit": false,
                "startDate": "2021-08-23T00:00:00Z",
              },
              "after": 156.98,
              "type": "PERCENTAGE",
            },
            {
              "itemId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
              "amount": -36.11,
              "before": 156.98,
              "source": {
                "applyToNewCustomersOnly": false,
                "discountedProducts": {},
                "durationDays": 60,
                "type": "PERCENTAGE",
                "packageDiscount": 23.0,
                "cutoffDate": "2021-08-29T00:00:00Z",
                "adjustmentReferenceId": "f3b579a2-b37f-4a55-bfbe-bc07973eb242",
                "discountScope": "ALL_PRODUCTS",
                "discountedCategories": {},
                "name": {
                  "en": "new-discount",
                },
                "subtype": "",
                "id": "f3b579a2-b37f-4a55-bfbe-bc07973eb242",
                "credit": false,
                "startDate": "2021-08-13T00:00:00Z",
              },
              "after": 120.87,
              "type": "PERCENTAGE",
            },
          ],
          "adjustmentAggregations": [
            {
              "amount": -599.13,
              "before": 720.0,
              "cumulativeAmount": -599.13,
              "after": 120.87,
              "type": "PERCENTAGE",
            },
            {
              "amount": 0,
              "subtype": "QUEBEC QST/TVQ",
              "before": 138.97,
              "cumulativeAmount": 12.06,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "subtype": "CANADA GST/TPS",
              "before": 138.97,
              "cumulativeAmount": 6.04,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "before": 138.97,
              "cumulativeAmount": 18.1,
              "after": 138.97,
              "type": "TAX",
            },
            {
              "amount": 0,
              "before": 138.97,
              "cumulativeAmount": 0,
              "after": 138.97,
              "type": "CREDIT",
            },
          ],
          "name": {
            "en": "Compute",
          },
          "subTotal": 120.87,
          "categoryId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
          "products": [
            {
              "total": 738.1,
              "unit": {
                "unit": "UNIT",
                "name": {},
              },
              "adjustments": [
                {
                  "itemId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
                  "amount": 6.04,
                  "before": 720.0,
                  "source": {
                    "discountScope": "PRODUCTS",
                    "type": "TAX",
                    "adjustmentReferenceId": "",
                  },
                  "after": 726.04,
                  "type": "TAX",
                },
                {
                  "itemId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
                  "amount": 12.06,
                  "before": 726.04,
                  "source": {
                    "discountScope": "PRODUCTS",
                    "type": "TAX",
                    "adjustmentReferenceId": "",
                  },
                  "after": 738.1,
                  "type": "TAX",
                },
              ],
              "adjustmentAggregations": [
                {
                  "amount": 0,
                  "before": 720.0,
                  "cumulativeAmount": 0,
                  "after": 720.0,
                  "type": "PERCENTAGE",
                },
                {
                  "amount": 12.06,
                  "subtype": "QUEBEC QST/TVQ",
                  "before": 726.04,
                  "cumulativeAmount": 12.06,
                  "after": 738.1,
                  "type": "TAX",
                },
                {
                  "amount": 6.04,
                  "subtype": "CANADA GST/TPS",
                  "before": 720.0,
                  "cumulativeAmount": 6.04,
                  "after": 726.04,
                  "type": "TAX",
                },
                {
                  "amount": 18.1,
                  "before": 720.0,
                  "cumulativeAmount": 18.1,
                  "after": 738.1,
                  "type": "TAX",
                },
                {
                  "amount": 0,
                  "before": 738.1,
                  "cumulativeAmount": 0,
                  "after": 738.1,
                  "type": "CREDIT",
                },
              ],
              "productId": "b0ba5102-10fe-44b6-841b-19457a8bb29e",
              "price": "1.00",
              "usage": 720.0,
              "name": {
                "en": "Container (1 vCPU, 2Gi RAM, 5Gi Root Disk)",
              },
              "subTotal": 720.0,
              "sku": "CCM-1M02",
              "taxCode": "SW053000",
              "categoryId": "d88a106d-608f-48f4-a6be-a97f9f6c29c5",
            },
          ],
        },
      ],
      "startDate": "2021-09-08T00:00:00Z",
    }
 }
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`invoiceId`<br/>*string* | The human readable id.
`status`<br/>*enum* | The status of the invoice. Should be ISSUED upon a successful approval.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before taxes and credits.
`detail.total`<br/>*string* | The invoice total after discounts, taxes, and credits.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustments.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustments.before`<br/>*string* | The invoice total before the adjustment was applied.
`detail.adjustments.after`<br/>*string* | The invoice total after the adjustment was applied.
`detail.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the invoice total.
`detail.adjustmentAggregations.before`<br/>*string* | The invoice total before the adjustments were applied.
`detail.adjustmentAggregations.after`<br/>*string* | The invoice total after the adjustments were applied.
`detail.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the invoice, its categories and their products.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period.
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.subTotal`<br/>*string* | A string with the category subtotal, before taxes and credits.
`detail.categories.total`<br/>*string* | A string with the category subtotal, after taxes and credits.
`detail.adjustments`<br/>*Array[Object]* | The adjustments applied to the category. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustments.itemId`<br/>*UUID* | The category id.
`detail.categories.adjustments.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustments.before`<br/>*string* | The category total before the adjustment was applied.
`detail.categories.adjustments.after`<br/>*string* | The category total after the adjustment was applied.
`detail.categories.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the category total.
`detail.categories.adjustmentAggregations.before`<br/>*string* | The category total before the adjustments were applied.
`detail.categories.adjustmentAggregations.after`<br/>*string* | The category total after the adjustments were applied.
`detail.categories.adjustmentAggregations.cumulativeAmount`<br/>*string* | The cumulative adjustment amount applied to the category and its products.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names.
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the period.
`detail.categories.products.subTotal`<br/>*string* | A string with the product subtotal, before taxes and credits.
`detail.categories.products.total`<br/>*string* | A string with the product total, after taxes and credits.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`detail.categories.products.adjustments`<br/>*Array[Object]* | The adjustments applied to the invoice. An adjustment tracks the application of a discount, a credit or a tax.
`detail.categories.products.adjustments.type`<br/>*string* | The type of adjustment. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustments.itemId`<br/>*UUID* | The product id.
`detail.categories.products.adjustments.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustments.before`<br/>*string* | The product total before the adjustment was applied.
`detail.categories.products.adjustments.after`<br/>*string* | The product total after the adjustment was applied.
`detail.categories.products.adjustments.source`<br/>*Object* | The model of the adjustment. Can be a discount or a tax model.
`detail.categories.products.adjustmentAggregations`<br/>*Array[Object]* | The adjustment aggregations. An aggregation summarizes the application of discounts, taxes or credits.
`detail.categories.products.adjustmentAggregations.type`<br/>*string* | The type of adjustment being aggregated. Possible values are: PERCENTAGE, CREDIT, TAX.
`detail.categories.products.adjustmentAggregations.subtype`<br/>*string* | The optional type used for sub-aggregations, like tax breakdowns.
`detail.categories.products.adjustmentAggregations.amount`<br/>*string* | The adjustment amount applied to the product total.
`detail.categories.products.adjustmentAggregations.before`<br/>*string* | The product total before the adjustments were applied.
`detail.categories.products.adjustmentAggregations.after`<br/>*string* | The product total after the adjustments were applied.
`detail.categories.products.adjustmentAggregations.cumulativeAmount`<br/>*string* | The adjustment amount applied to the product total.

<!-------------------- DOWNLOAD INVOICE -------------------->
### Download invoice

`GET /invoices/download?invoice_id=:invoice_id`

Download an invoice as a PDF file.

```shell
# Download an invoice
curl  -X GET 'https://cloudmc_endpoint/rest/invoices/download?invoice_id=3f7b7cca-d440-4c70-8ea7-ff23fe88b152' \
  -H 'MC-Api-Key: your_api_key'
```

| Required | &nbsp; |
| --- | --- |
| `invoice_id`<br/>*UUID* | The id of the invoice. |
