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
`environment_id`<br/>*UUID* | Only return usage for the selected environment id.
`service_connection_id`<br/>*UUID* | Only return usage for the selected service connection id.

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
                "usage": "432.0",
                "price": "1.0",
                "period": "HOUR",
                "unit": {
                  "unit": "HOUR",
                  "name": {}
                }
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