## Reports

Reports using the pricing v2 engine.

<!------------------- GET ORGANIZATION REPORT --------------------->

### Get an organization report

`GET /reports/organization_pricing?organization_id=:id&start_date:=end_date=&end_date=:end_date`

Retrieves a list of usage grouped by currency and containing categories and their products. There is a cost sum at the currency, category and product level of granularity. Generates a report using applied pricings from the closest reseller to the organization, not including itself.

**Query Parameters**

Required | &nbsp;
---------- | -----------
`start_date`<br/>*String* | An ISO-8601 instant format string representing the start of the usage. This will included any usage who's usage start date is greater than, inclusively, the provided instant.
`end_date`<br/>*String* | An ISO-8601 instant format string representing the end of the usage. This will include any usage who's usage end date is less than, non-inclusively, the provided instant.

Optional | &nbsp;
---------- | -----------
`organization_id`<br/>*UUID* | The organization for which you're building the report. If not passed will default to the calling user's organization.
`service_connection_id`<br/>*UUID* | Only return usage for the selected service connection id.
`environment_id`<br/>*UUID* | Only return usage for the selected environment id. Needs to be provided along with the `service_connection_id`.

```shell
curl --request GET \
  --url 'https://cloudmc_endpoint/api/v2/reports/organization_pricing?start_date=2021-03-30T00%3A00%3A00.000Z&end_date=2021-04-01T23%3A59%3A59.999Z' 
  \
  --header 'MC-Api-Key: your_api_key'
```

```json
{
  "data": {
    "currencies": [
      {
        "currency": "CAD",
        "total": "432.00",
        "categories": [
          {
            "name": {
              "en": "Networking",
              "fr": "Networking"
            },
            "products": [
              {
                "sku": "PUBLIC_IP",
                "name": {
                  "en": "Public IP",
                  "fr": "Public IP"
                },
                "cost": "432.00",
                "usage": "465.0000",
                "period": "HOUR",
                "unit": {
                  "unit": "HOUR",
                  "name": {}
                },
                "pricingTiers": [
                  {
                    "usage": "300.0000",
                    "price": "1.00",
                    "cost": "300.00"
                  },
                  {
                    "usage": "165.0000",
                    "price": "0.80",
                    "cost": "132.00"
                  }
                ]
              }
            ],
            "subTotal": "432.00"
          }
        ]
      }
    ],
    "startDate": "2021-03-30T00:00:00Z",
    "endDate": "2021-04-01T23:59:59.999Z",
    "reportGenerated": true
  }
}

```

Organization Report Attributes | &nbsp;
---------- | -----------
`currencies`<br/>*Array[Object]* | Returns an array of currencies for the usage.
`currencies.currency`<br/>*string* | The short-name of the currency.
`currencies.total`<br/>*string* | A string containing the total of all usage.
`currencies.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period. 
`currencies.categories.name`<br/>*Object* | A map of short language codes to their translated category names. 
`currencies.categories.subTotal`<br/>*string* | A string with the subtotal of usage for the category. It is the summed up product usage.
`currencies.categories.products`<br/>*Object* | A map of short language codes to their translated category names. 
`currencies.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`currencies.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`currencies.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`currencies.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`currencies.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the preriod.
`currencies.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`currencies.categories.products.unit`<br/>*Object* | The unit object of the product.
`currencies.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`currencies.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`currencies.categories.products.pricingTiers` <br/> *Array[Object]* | The cost and usage breakdown per pricing tier configured on the product. Only pricing tiers with usage for the period are shown.
`currencies.categories.products.pricingTiers.usage` <br/> *string* | The total usage gathered for the given pricing tier configured on the product.
`currencies.categories.products.pricingTiers.cost` <br/> *string* | The total cost incurred for the given pricing tier configured on the product.
`currencies.categories.products.pricingTiers.price` <br/> *string* | The unit price charged per usage unit for the given pricing tier configured on the product.
`startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the report.
`endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the report.
`reportGenerated`<br/>*boolean* | Whether or not a report could be generated for this time period.

<!------------------- GET CUSTOMER REPORT --------------------->

### Get a customer's report

`GET /reports/customers?start_date:=end_date=&end_date=:end_date`

Retrieves a list of all usage for the provided reseller organization and all of it's suborgs.

**Query Parameters**

Required | &nbsp;
---------- | -----------
`start_date`<br/>*String* | An ISO-8601 instant format string representing the start of the usage. This will included any usage who's usage start date is greater than, inclusively, the provided instant.
`end_date`<br/>*String* | An ISO-8601 instant format string representing the end of the usage. This will include any usage who's usage end date is less than, non-inclusively, the provided instant.

Optional | &nbsp;
---------- | -----------
`organization_id`<br/>*UUID* | The reseller for which you're building the report. If not passed will default to the calling user's organization. This organization must be a reseller.
`service_connection_id`<br/>*UUID* | Only return usage for the selected service connection id.

```shell
curl --request GET \
  --url 'https://cloudmc_endpoint/api/v2/reports/customers?start_date=2021-04-01T00%3A00%3A00.000Z&end_date=2021-04-07T23%3A59%3A59.999Z' \
  --header 'MC-Api-Key: your_api_key'
```

```json
{
  "data": {
    "organizations": [
      {
        "id": "4b0c91a8-522a-4121-ac63-f9ae33be4eda",
        "name": "JasonOrg",
        "total": "5244.00",
        "currency": "CAD",
        "categories": [
          {
            "name": {
              "en": "Networking",
              "fr": "Networking"
            },
            "subTotal": "684.00"
          },
          {
            "name": {
              "en": "Disk",
              "fr": "Disk"
            },
            "subTotal": "4560.00"
          }
        ],
        "appliedPricing": {
          "id": "0495ac17-0b75-4583-af6c-c69d0d2e7289",
          "name": {
            "en": "Standard Pricing",
            "fr": "Standard Pricing"
          }
        }
      }
    ],
    "reportGenerated": true,
    "startDate": "2021-04-01T00:00:00Z",
    "endDate": "2021-04-07T23:59:59.999Z"
  }
}
```

Customer Report Attributes | &nbsp;
---------- | -----------
`organizations`<br/>*Array[Object]* | Returns an array of organizations for the usage. There will be one entry per organization and applied pricing combination found for the time period.
`organizations.currency`<br/>*string* | The short-name of the currency.
`organizations.total`<br/>*string* | A string containing the total of all usage.
`organizations.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period.
`organizations.categories.name`<br/>*Object* | A map of short language codes to their translated category names.
`organizations.categories.subTotal`<br/>*string* | A string with the subtotal of usage for the category. It is the summed up product usage.
`organizations.appliedPricing`<br/>*Object* | The applied pricing for this organization entry.
`organizations.appliedPricing.id`<br/>*UUID* | The applied pricing for this organization entry.
`organizations.appliedPricing.name`<br/>*Object* | A map of short language codes to their translated name for the applied pricing.
`startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the report.
`endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the report.
`reportGenerated`<br/>*boolean* | Whether or not a report could be generated for this time period.

<!------------------- GET REVENUE TAXATION REPORT --------------------->

`GET /reports/revenue_tax_report?billing_cycle=:billing_cycle&organization_id=:organization_id&language=:language`

The response is a list of priced products, with the first line as a header, across all the customers of the given reseller and billing cycle.

The format of the response is a CSV with `,` used as the delimiter.

**Query Parameters**

Optional | &nbsp;
---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------
`billingCycle`<br/>*String*  | The cycle which the invoice belongs to. Format is `MM-YYYY`. Defaults to the latest billing cycle.
`organization_id`<br/>*UUID* | The reseller for which you're building the report. If not passed will default to the calling user's organization. This organization must be a reseller.
`language`<br/>*UUID*        | Language to use for the report fields (but not the headers). Expected values are "en" (English), "fr" (French) or "es" (Spanish). Defaults to "en".

```shell
curl -X GET \
  'https://cloudmc_endpoint/api/v2/reports/customers/revenue_tax_report?billing_cycle=:billing_cycle&organization_id=:organization_id&language=:language' \
  --header 'MC-Api-Key: your_api_key'
```

```csv
organization,custom_field_1,custom_field_2,category,sku,usage,unit,currency,total_before_tax,tax_code,total_tax,tax_name1,tax_amount1,tax_name2,tax_amount2,invoice_number,status,due_date,credit_card_transaction_id,billing_start_date,billing_end_date,
AcmeCorp,null,null,Networking,BANDWIDTH,0.0043,GIGABYTE,USD,$0.00,SW056003,$0.00,QUEBEC QST/TVQ,$0.00,CANADA GST/TPS,$0.00,NFROFNGWHU,DRAFT,null,null,9/20/21,10/20/21,
AcmeCorp,null,null,Compute,CCM-1M02,295.935,GIGABYTE,USD,$21.90,SW056003,$3.28,QUEBEC QST/TVQ,$2.18,CANADA GST/TPS,$1.10,NFROFNGWHU,DRAFT,null,null,9/20/21,10/20/21,%         
```

Report Attributes | &nbsp;
----------------- | ------
`organization`<br/>*String* | The organization name.
`custom_field_1`<br/>*String* | The organization custom field (ex: account ID). Configured in the reseller billing settings. <b>There can be more than one custom field<b>.
`category`<br/>*String* | The product category.
`sku`<br/>*String* | The SKU of the product.
`usage`<br/>*String* | The total usage of the product.
`unit`<br/>*String* | The name of the unit of the product.
`currency`<br/>*String* | The short-name of the currency.
`total_before_tax`<br/>*String* | The total cost before taxes are applied.
`tax_code`<br/>*String* | The code of the tax.
`total_tax`<br/>*String* | The total tax.
`tax_name1`<br/>*String* | The name of the tax. Depends on the `tax_code`, reseller billing address and customer billing address. <b>There can be more than one tax name<b>.
`tax_amount1`<br/>*String* | The amount of the tax. Depends on the `tax_code`, reseller billing address and customer billing address. <b>There can be more than one tax amount<b>.
`invoice_number`<br/>*String* | The human-readable number of the invoice.
`status`<br/>*String* | The status of the invoice. Possible values are: USAGE_PENDING, DRAFT, ISSUED, OVERDUE, PAID, VOID.
`due_date`<br/>*String* | The date the invoice is due.
`credit_card_transaction_id`<br/>*String* | The confirmation number returned from the payment provider for the invoice.
`billing_start_date`<br/>*String* | The billing start date of the invoice.
`billing_end_date`<br/>*String* | The billing end date of the invoice.
