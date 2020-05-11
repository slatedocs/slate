### Pricings

The pricings determines the price for each product defines for a selected catalogs.

<!-------------------- LIST PRICINGS -------------------->
#### List pricings

`GET /pricings`

Retrieves a list of pricings configured in the system.

```shell
# Retrieve pricing list
curl "https://cloudmc_endpoint/rest/pricings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "supportedCurrencies": [
        "CAD"
      ],
      "productCatalogs": [
        {
          "mode": "ALL_CONNECTIONS_OF_TYPE",
          "serviceType": "cloudca",
          "connectionIds": [],
          "name": {
            "en": "Default cloud.ca",
            "fr": "Défaut cloud.ca"
          },
          "description": {
            "en": "cloud.ca default product catalog",
            "fr": "catalogue des produits cloud.ca par défaut"
          },
          "id": "5ba5df7c-1e60-4d99-869d-dd3d97826b2e"
        },
      ],
      "organization": {
        "id": "409c1162-a930-4207-bdf9-710580c3542b"
      },
      "pricingProducts": [
        {
          "unitPrice": 123.0,
          "product": {
            "metricType": "GAUGE",
            "unit": {
              "unit": "HOUR",
              "name": {}
            },
            "period": "HOUR",
            "name": {
              "en": "vCPU",
              "fr": "vCPU"
            },
            "transformer": {
              "type": "PROPORTIONAL_TO_TIME"
            },
            "id": "342f0d9b-3c3c-456d-b853-31d713b79e72",
            "attribute": "RAWUSAGE",
            "source": "1",
            "filters": [],
            "sku": "vCPU",
            "categoryId": "fcd8908d-e1a0-41f2-9c38-fed1d1f77f18"
          },
          "cogs": 321.0,
          "currency": "CAD",
          "id": "45425fe6-beb3-4c78-be68-f82eeb3976c6"
        }
      ],
      "name": {
        "en": "cloud.ca default pricing",
        "fr": "prix par défaut cloud.ca"
      },
      "description": {
        "en": "cloud.ca default pricing",
        "fr": "prix par défaut cloud.ca"
      },
      "id": "096bbfee-a6e6-4373-8a4e-1a8b0f2bf484",
      "effectiveDate": "2020-05-08T16:53:45Z"
    }
  ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the pricing.
`name`<br/>*Object* | The name object in each language for the pricing (en, fr or es).
`description`<br/>*string* | The description object in each language for the pricing (en, fr or es).
`supportedCurrencies`<br/>*Array[string]* | List of the currency which are link to this pricing.
`productCatalogs`<br/>*Object* | List of product catalog object which are attached to this pricing.
`organization.id`<br/>*UUID* | UUID of the organisation to which belongs the pricing.
`pricingProducts`<br/>*Array[Object]* | The list of products assigned to the pricing.
`pricingProducts.id`<br/>*UUID* | UUID of the product pricing.
`pricingProducts.unitPrice`<br/>*double* | The unit price of the product.
`pricingProducts.product`<br/>*Object* | The product attached to this product pricing element.
`pricingProducts.cogs`<br/>*double* | The Cost Of Goods Sold (COGS) of the product.
`pricingProducts.currency`<br/>*string* | The currency of the pricing.


<!-------------------- GET PRICING -------------------->
#### Retrieve a pricing

`GET /pricings/:id`

Retrieve a pricing's details.

```shell
# Retrieve an organization
curl "https://cloudmc_endpoint/rest/pricings/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "supportedCurrencies": [
      "CAD"
    ],
    "productCatalogs": [
      {
        "mode": "ALL_CONNECTIONS_OF_TYPE",
        "serviceType": "cloudca",
        "connectionIds": [],
        "name": {
          "en": "Default cloud.ca",
          "fr": "Défaut cloud.ca"
        },
        "changes": [],
         "description": {
          "en": "cloud.ca default product catalog",
          "fr": "catalogue des produits cloud.ca par défaut"
        },
        "id": "5ba5df7c-1e60-4d99-869d-dd3d97826b2e",
        "categories": [
          {
            "name": {
              "en": "Compute",
              "fr": "Compute"
            },
            "id": "fcd8908d-e1a0-41f2-9c38-fed1d1f77f18"
          }
        ],
        "products": [
          {
            "metricType": "GAUGE",
            "unit": {
              "unit": "HOUR",
              "name": {}
            },
            "period": "HOUR",
            "name": {
              "en": "vCPU",
              "fr": "vCPU"
            },
            "transformer": {
              "type": "PROPORTIONAL_TO_TIME"
            },
            "id": "342f0d9b-3c3c-456d-b853-31d713b79e72",
            "attribute": "RAWUSAGE",
            "source": "1",
            "filters": [],
            "sku": "vCPU",
            "categoryId": "fcd8908d-e1a0-41f2-9c38-fed1d1f77f18"
          }
        ]
      }
    ],
    "organization": {
      "id": "409c1162-a930-4207-bdf9-710580c3542b"
    },
    "pricingProducts": [
      {
        "unitPrice": 123.0,
        "product": {
          "metricType": "GAUGE",
          "unit": {
            "unit": "HOUR",
            "name": {}
          },
          "period": "HOUR",
          "name": {
            "en": "sfg",
            "fr": "sdfg"
          },
          "transformer": {
            "type": "PROPORTIONAL_TO_TIME"
          },
          "id": "342f0d9b-3c3c-456d-b853-31d713b79e72",
          "attribute": "RAWUSAGE",
          "source": "1",
          "filters": [],
          "sku": "sdfg",
          "categoryId": "fcd8908d-e1a0-41f2-9c38-fed1d1f77f18"
        },
        "cogs": 321.0,
        "currency": "USD",
        "id": "45425fe6-beb3-4c78-be68-f82eeb3976c6"
      }
    ],
    "name": {
      "en": "testen",
      "fr": "testfr"
    },
    "description": {
      "en": "descen",
      "fr": "testfr"
    },
    "id": "096bbfee-a6e6-4373-8a4e-1a8b0f2bf484",
    "effectiveDate": "2020-05-08T16:53:45Z"
  }
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the pricing.
`name`<br/>*Object* | The name object in each language for the pricing (en, fr or es).
`description`<br/>*string* | The description object in each language for the pricing (en, fr or es).
`supportedCurrencies`<br/>*Array[string]* | List of the currency which are link to this pricing.
`productCatalogs`<br/>*Object* | List of product catalog object which are attached to this pricing.
`organization.id`<br/>*UUID* | UUID of the organisation to which belongs the pricing. It is more detailed.
`pricingProducts`<br/>*Array[Object]* | The list of products assigned to the pricing.
`pricingProducts.id`<br/>*UUID* | UUID of the product pricing.
`pricingProducts.unitPrice`<br/>*double* | The unit price of the product.
`pricingProducts.product`<br/>*Object* | The product attached to this product pricing element.
`pricingProducts.cogs`<br/>*double* | The Cost Of Goods Sold (COGS) of the product.
`pricingProducts.currency`<br/>*string* | The currency of the pricing.
