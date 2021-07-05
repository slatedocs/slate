## Pricings

The pricing determines the price for each product defined for a selected catalog.

<!-------------------- LIST PRICINGS -------------------->
### List pricings

`GET /pricings`

Retrieves a list of pricings configured in the system.

```shell
# Retrieve pricing list
curl "https://cloudmc_endpoint/rest/pricings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

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
          "pricingTiers": [
            {
              "pricingMode": "FLAT_FEE",
              "lowerBound": 0.0,
              "upperBound": 1000.5,
              "price": {
                "CAD": 999
              },
              "id": "9c560c79-e600-4a8b-b73b-d359a6512601"
             },
             {
              "pricingMode": "FLAT_FEE",
              "lowerBound": 1000.5,
              "upperBound": 2000.0,
              "chunkSize": 500,
              "price": {
                "CAD": 999
              },
              "id": "accf0b65-1406-45d6-b6d8-b83c062efcd7"
             }
           ],
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
`pricingProducts.pricingTiers`<br/>*Array[Object]* | The list of pricing tiers assigned to the product pricings.
`pricingProducts.pricingTier.id`<br/>*UUID* | UUID of the pricing tier.
`pricingProducts.pricingTier.pricingMode`<br/>*Enum* | The pricing mode of the pricing tier. Must be one of "FLAT_FEE" or "PER_UNIT".
`pricingProducts.pricingTier.lowerBound`<br/>*double* | The pricing tier's lower bound.
`pricingProducts.pricingTier.upperBound`<br/>*double* | The pricing tier's upper bound.
`pricingProducts.pricingTier.price`<br/>*Map[string, double]>* | The pricing tier's price in each of the pricing product's supported currencies.
`pricingProducts.pricingTier.chunkSize`<br/>*double* | The pricing tier's chunk size.


<!-------------------- GET PRICING -------------------->
### Retrieve a pricing

`GET /pricings/:id`

Retrieve a pricing's details.

```shell
# Retrieve a pricing's details
curl "https://cloudmc_endpoint/rest/pricings/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

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
          "pricingTiers": [
            {
              "pricingMode": "FLAT_FEE",
              "lowerBound": 0.0,
              "upperBound": 1000.5,
              "price": {
               "CAD": 999
              },
             "id": "9c560c79-e600-4a8b-b73b-d359a6512601"
            },
            {
             "pricingMode": "FLAT_FEE",
             "lowerBound": 1000.5,
             "upperBound": 2000.0,
             "chunkSize": 500,
             "price": {
              "CAD": 999
             },
             "id": "accf0b65-1406-45d6-b6d8-b83c062efcd7"
            }
           ],
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
`pricingProducts.pricingTiers`<br/>*Array[Object]* | The list of pricing tiers assigned to the product pricings.
`pricingProducts.pricingTier.id`<br/>*UUID* | UUID of the pricing tier.
`pricingProducts.pricingTier.pricingMode`<br/>*Enum* | The pricing mode of the pricing tier. Must be one of "FLAT_FEE" or "PER_UNIT".
`pricingProducts.pricingTier.lowerBound`<br/>*double* | The pricing tier's lower bound.
`pricingProducts.pricingTier.upperBound`<br/>*double* | The pricing tier's upper bound.
`pricingProducts.pricingTier.price`<br/>*Map[string, double]>* | The pricing tier's price in each of the pricing product's supported currencies.
`pricingProducts.pricingTier.chunkSize`<br/>*double* | The pricing tier's chunk size.

<!-------------------- CREATE PRICING -------------------->
### Create pricing

`POST /pricings`

Create a new pricing.

```shell
# Creates a new pricing
curl -X POST "https://cloudmc_endpoint/rest/pricings" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
	"organization": {
		"id": "1d37a999-6ac6-4193-acb2-49df5c43ff31"
	},
	"productCatalogs": [
		{
			"id": "b6c89a59-34bf-4be4-a9bf-4414de84f5f7"
		}
	],
	"name": {
		"en": "name",
		"fr": "nom",
		"es": "nombre"
	},
	"description": {
		"en": "desc_en",
		"fr": "desc_fr",
		"es": "desc_es"
	},
	"effectiveDate": "2020-05-06T00:00:00.000Z",
	"pricingProducts": [
		{
			"product": {
				"id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
			},
			"cogs": 4,
			"unitPrice": 5,
			"currency": "CAD",
      "pricingTiers": [
        {
         "pricingMode": "FLAT_FEE",
         "lowerBound": 0.0,
         "upperBound": 1000.5,
         "price": {
         "CAD": 999
         },
         "id": "9c560c79-e600-4a8b-b73b-d359a6512601"
        },
        {
         "pricingMode": "FLAT_FEE",
         "lowerBound": 1000.5,
         "chunkSize": 500,
         "price": {
          "CAD": 999
         },
         "id": "accf0b65-1406-45d6-b6d8-b83c062efcd7"
        }
      ],
		},
		{
			"product": {
				"id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
			},
			"cogs": 4,
			"unitPrice": 5,
			"currency": "USD"
		}
	],
	"supportedCurrencies": [
		"CAD",
		"USD"
	]
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "supportedCurrencies": [
      "CAD",
      "USD"
    ],
    "productCatalogs": [
      {
        "id": "b6c89a59-34bf-4be4-a9bf-4414de84f5f7"
      }
    ],
    "organization": {
      "id": "1d37a999-6ac6-4193-acb2-49df5c43ff31"
    },
    "pricingProducts": [
      {
        "unitPrice": 5,
        "product": {
          "id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3",
        },
        "cogs": 4,
        "currency": "CAD",
        "id": "45301951-59cb-461e-b0d0-85c46a7abb69",
        "pricingProducts": [
		{
			"product": {
				"id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
			},
			"cogs": 4,
			"unitPrice": 5,
			"currency": "CAD",
      "pricingTiers": [
        {
         "pricingMode": "FLAT_FEE",
         "lowerBound": 0.0,
         "upperBound": 1000.5,
         "price": {
         "CAD": 999
         },
         "id": "9c560c79-e600-4a8b-b73b-d359a6512601"
        },
        {
         "pricingMode": "FLAT_FEE",
         "lowerBound": 1000.5,
         "chunkSize": 500,
         "price": {
          "CAD": 999
         },
         "id": "accf0b65-1406-45d6-b6d8-b83c062efcd7"
        }
      ]
      },
      {
        "unitPrice": 5,
        "product": {
          "id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3",
        },
        "cogs": 4,
        "currency": "USD",
        "id": "30ec5361-0044-44d5-a8b1-68dca07d274e"
      }
    ],
    "name": {
      "en": "name",
      "fr": "nom",
      "es": "nombre"
    },
    "changes": [],
    "description": {
      "en": "desc_en",
      "fr": "desc_fr",
      "es": "desc_es"
    },
    "id": "c4860b7d-ad41-40a8-b2a2-6f96be87c8b0",
    "effectiveDate": "2020-05-06T00:00:00Z"
  }
}
```

Required | &nbsp;
------- | -----------
`organization.id` <br/>*UUID* | The id of the organization the pricing belongs to. 
`productCatalogs` <br/>*Array[productCatalogs.id]* | An array of product catalogs the pricing can add products from.
`productCatalogs.id` <br/>*UUID* | The id for a product catalog you'd like to add as a source for your pricing.
`name` <br/>*Object* | A map of language keys to a name in the specified language. 
`effectiveDate` <br/>*string* | The date the pricing should become effective.
`pricingProducts` <br/>*Array[pricingProduct]* | A list of products from a supplied product catalog that are priced, need to supply a product with every supported currency.
`pricingProduct.product.id` <br/>*UUID* | The id of the product you're applying a price to. Must be contained in one of the specified product catalogs. 
`pricingProduct.cogs` <br/>*int* | The cost of goods sold, represents the direct cost of producing the specified product. 
`pricingProduct.unitPrice` <br/>*int* | The unit price is the price at which the product will be sold to the consumer.
`pricingProduct.currency` <br/>*string* | The currency the price is set in. 
`supportedCurrencies` <br/>*Array[string]*| An array of supported currencies.

Optional | &nbsp;
------- | -----------
`description` <br/>*Object* | A map of language language keys to the description in the specified language.
`pricingProducts.pricingTiers`<br/>*Array[Object]* | The list of pricing tiers assigned to the product pricings. Pricing tiers must be contiguous, there cannot be any overlap between tiers, nor can there be gaps in between them.
`pricingProducts.pricingTier.pricingMode`<br/>*Enum* | The pricing mode of the pricing tier. Must be one of "FLAT_FEE" or "PER_UNIT". If a pricing tier is specified, this attribute is mandatory.
`pricingProducts.pricingTier.lowerBound`<br/>*double* | The pricing tier's lower bound. The lower bound must be a non-negative value. If a pricing tier is specified, this attribute is mandatory.
`pricingProducts.pricingTier.upperBound`<br/>*double* | The pricing tier's upper bound. The upper bound must be a non-negative value. If a pricing tier is specified, the upper bound must be specified unless it is a part of the last pricing tier. In that case, a null value indicates that there is no upper bound for the given tier. 
`pricingProducts.pricingTier.price`<br/>*Map[string, double]>* | The pricing tier's price in each of the pricing product's supported currencies. All currencies specified must be supported by the pricing. Any missing or invalid currencies will not be accepted. Also, pricings must be non-negative.
`pricingProducts.pricingTier.chunkSize`<br/>*double* | The pricing tier's chunk size. The chunk size must be a non-negative value

<!-------------------- UPDATE PRICING -------------------->
### Update pricing

`PUT /pricings/:id`

Update an existing pricing's name and description.

```shell
# Creates a new pricing
curl -X PUT "https://cloudmc_endpoint/rest/pricings/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
  "name": {
      "en": "name-updated",
      "fr": "nom-updated",
      "es": "nombre-updated"
  },
  "description": {
    "en": "pricing-desc-updated",
    "fr": "desc_fr",
    "es": "desc_es"
  }
}
```

> The above command return JSON structured like this:

```js
{
  "data": {
    "supportedCurrencies": [
      "CAD",
      "USD"
    ],
    "productCatalogs": [
      {
        "id": "b6c89a59-34bf-4be4-a9bf-4414de84f5f7"
      }
    ],
    "organization": {
      "id": "1d37a999-6ac6-4193-acb2-49df5c43ff31"
    },
    "pricingProducts": [
      {
        "unitPrice": 5,
        "product": {
          "id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3",
        },
        "cogs": 4,
        "currency": "CAD",
        "id": "45301951-59cb-461e-b0d0-85c46a7abb69"
      },
      {
        "unitPrice": 5,
        "product": {
          "id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3",
        },
        "cogs": 4,
        "currency": "USD",
        "id": "30ec5361-0044-44d5-a8b1-68dca07d274e"
      }
    ],
    "name": {
      "en": "name-updated",
      "fr": "nom-updated",
      "es": "nombre-updated"
    },
    "changes": [],
    "description": {
      "en": "pricing-desc-updated",
      "fr": "desc_fr",
      "es": "desc_es"
    },
    "id": "03bc22bd-adc4-46b8-988d-afddc24c0cb5",
    "effectiveDate": "2020-05-06T00:00:00Z"
  }
}
```

Required | &nbsp;
------- | -----------
`name` <br/>*Object* | A map of language keys to a name in the specified language. 

Optional | &nbsp;
------- | -----------
`description` <br/>*Object* | A map of language language keys to the description in the specified language.

### Delete pricing

`DELETE /pricings/:id`

Delete an existing pricing. A pricing cannot be deleted if it is associated to an applied pricing.

```shell
curl -X DELETE "https://cloudmc_endpoint/rest/pricings/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "85df8dfb-b904-42dc-bb76-4824e6b50c83",
  "taskStatus": "SUCCESS"
}
```
