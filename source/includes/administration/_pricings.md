### Pricings


<!-------------------- LIST PRICINGS -------------------->
#### List pricings

`GET /pricings`

List pricings in your organization


```shell
# List pricings
curl "https://cloudmc_endpoint/v2/pricings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5",
      "name": {
        "en": "Name here",
        "fr": "Nom ici"
      },
      "description": {
        "en": "Description here",
        "fr": "Description ici"
      },
      "supportedCurrencies": [
        "CAD"
      ],
      "missingCurrenciesPricing": false,
      "effectiveDate": "2020-08-31T15:43:53Z",
      "productCatalogs": [
        {
          "id": "ea9ff508-624f-4caa-add9-4f84c20cc1a6",
          ...
        }
      ],
      "organization": {
        "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
      },
      "pricingProducts": [
        {
          "unitPrice": {
            "CAD": 13
          },
          "product": {
            "id": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
            ...
          },
          "cogs": {
            "CAD": 10
          },
          "deprecated": false,
          "id": "0a5553f7-5ea9-432e-9a00-58fa81964422"
        }
      ]
    },
  ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the pricing
`name`<br/>*Map* | A map from language to name value for that language
`description`<br/>*Map* | A map from language to description value for that language
`supportedCurrencies`<br/>*List* | A list of currencies supported by the pricing
`missingCurrenciesPricing`<br/>*boolean* | Specifies if one of the changes is missing the prices for one or more currencies.
`effectiveDate`<br/>*Date* | The date at which the pricing will take effect.
`productCatalogs`<br/>*Array<ProductCatalog>* | A list of catalogs added to the pricing
`organization`<br/>*Organization* | Organization where the pricing was created. Fields: `id`
`pricingProducts`<br/>*Array<PricedProduct>* | Products with an associated price on it

Priced product

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the priced product
`product`<br/>*Product* | The product being priced
`cogs`<br/>*Map* | Map from currency code to cogs
`unitPrice`<br/>*Map* | Map from currency code to unit price
`deprecated`<br/>*Boolean* | True if priced product is deprecated


<!-------------------- FIND PRICING -------------------->
#### Retrieve pricing

`GET /pricings/:id`

Get a pricing in your organization


```shell
# Retrieve specific pricing
curl "https://cloudmc_endpoint/v2/pricings/73eb0d75-03b0-44e2-9cbf-9ad25dff5da5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": 
    {
      "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5",
      "name": {
        "en": "Name here",
        "fr": "Nom ici"
      },
      "description": {
        "en": "Description here",
        "fr": "Description ici"
      },
      "supportedCurrencies": [
        "CAD"
      ],
      "missingCurrenciesPricing": false,
      "effectiveDate": "2020-08-31T15:43:53Z",
      "productCatalogs": [
        {
          "id": "ea9ff508-624f-4caa-add9-4f84c20cc1a6",
          ...
        }
      ],
      "organization": {
        "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
      },
      "pricingProducts": [
        {
          "unitPrice": {
            "CAD": 13
          },
          "product": {
            "id": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
            ...
          },
          "cogs": {
            "CAD": 10
          },
          "deprecated": false,
          "id": "0a5553f7-5ea9-432e-9a00-58fa81964422"
        }
      ]
    },
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the pricing
`name`<br/>*Map* | A map from language to name value for that language
`description`<br/>*Map* | A map from language to description value for that language
`supportedCurrencies`<br/>*List* | A list of currencies supported by the pricing
`missingCurrenciesPricing`<br/>*boolean* | Specifies if one of the changes is missing the prices for one or more currencies.
`effectiveDate`<br/>*Date* | The date at which the pricing will take effect.
`productCatalogs`<br/>*Array<ProductCatalog>* | A list of catalogs added to the pricing
`organization`<br/>*Organization* | Organization where the pricing was created. Fields: `id`
`pricingProducts`<br/>*Array<PricedProduct>* | Products with an associated price on it

Priced product

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the priced product
`product`<br/>*Product* | The product being priced
`cogs`<br/>*Map* | Map from currency code to cogs
`unitPrice`<br/>*Map* | Map from currency code to unit price
`deprecated`<br/>*Boolean* | True if priced product is deprecated

<!-------------------- CREATE PRICING -------------------->
#### Create Pricing

`POST /pricings`

Create a pricing and put a price on selected products.

```shell
# Create a pricing
curl -X POST "https://cloudmc_endpoint/v2/pricings" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
      "name": {
        "en": "Name here",
        "fr": "Nom ici"
      },
      "description": {
        "en": "Description here",
        "fr": "Description ici"
      },
      "supportedCurrencies": [
        "CAD"
      ],
      "effectiveDate": "2020-08-31T12:00:00Z",
      "organization": {
        "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
      },
      "pricingProducts": [
        {
          "unitPrice": {
            "CAD": 13
          },
          "product": {
            "id": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          },
          "cogs": {
            "CAD": 10
          }
        }
      ]
}
```

Required | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the pricing
`name`<br/>*Map* | A map from language to name value for that language
`description`<br/>*Map* | A map from language to description value for that language
`supportedCurrencies`<br/>*List* | A list of currencies supported by the pricing
`effectiveDate`<br/>*Date* | The date at which the pricing will take effect.
`pricingProducts`<br/>*Array<PricedProduct>* | Products with an associated price on it

Priced product

Required | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the priced product
`product`<br/>*Product* | The product being priced
`cogs`<br/>*Map* | Map from currency code to cogs
`unitPrice`<br/>*Map* | Map from currency code to unit price

Optional | &nbsp;
---- | -----------
`pricingTiers` <br/>*Array<PricingTier>* | List of pricing tiers on priced product

Pricing tier

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | UUID of the pricing tier.
`pricingMode`<br/>*Enum* | The pricing mode of the pricing tier. Must be one of "FLAT_FEE" or "PER_UNIT".
`lowerBound`<br/>*double* | The pricing tier's lower bound.
`upperBound`<br/>*double* | The pricing tier's upper bound. A null value indicates that there is no upper bound for the given tier.
`price`<br/>*Map<string, double* | The pricing tier's price in each of the pricing product's supported currencies.
`chunkSize`<br/>*double* | The pricing tier's chunk size.

```shell
# Response body example
```
```json
{
  "data": 
    {
      "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5",
      "name": {
        "en": "Name here",
        "fr": "Nom ici"
      },
      "description": {
        "en": "Description here",
        "fr": "Description ici"
      },
      "supportedCurrencies": [
        "CAD"
      ],
      "effectiveDate": "2020-08-31T12:00:00Z",
      "organization": {
        "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
      },
      "pricingProducts": [
        {
          "unitPrice": {
            "CAD": 13
          },
          "product": {
            "id": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          },
          "cogs": {
            "CAD": 10
          },
          "deprecated": false,
        }
      ]
    },
}
```


<!-------------------- UPDATE PRICING -------------------->
#### Update Pricing 

`PUT /pricings/:id`

Update the name and description of a pricing. If you want to modify anything else, then you can use the pricing change API.

```shell
# Update a pricing
curl -X PUT "https://cloudmc_endpoint/v2/pricings/73eb0d75-03b0-44e2-9cbf-9ad25dff5da5" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
    "name": {
        "en": "Name here",
        "fr": "Nom ici"
    },
    "description": {
        "en": "Description here",
        "fr": "Description ici"
    }
}
```

Required | &nbsp;
---- | -----------
`name`<br/>*Map* | A map from language to name value for that language
`description`<br/>*Map* | A map from language to description value for that language
Priced product

```shell
# Response body example
```
```json
{
  "data": 
    {
      "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5",
      "name": {
        "en": "Name here",
        "fr": "Nom ici"
      },
      "description": {
        "en": "Description here",
        "fr": "Description ici"
      },
      "supportedCurrencies": [
        "CAD"
      ],
      "effectiveDate": "2020-08-31T12:00:00Z",
      "organization": {
        "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
      },
      "pricingProducts": [
        {
          "unitPrice": {
            "CAD": 13
          },
          "product": {
            "id": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          },
          "cogs": {
            "CAD": 10
          },
          "deprecated": false,
        }
      ]
    },
}
```

<!-------------------- DELETE PRICING -------------------->
#### Delete Pricing 

`DELETE /pricings/:id`

Delete a pricing that has no applied pricing using it.

```shell
# Update a pricing
curl -X DELETE "https://cloudmc_endpoint/v2/pricings/73eb0d75-03b0-44e2-9cbf-9ad25dff5da5" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```

<!-------------------- FIND EFFECTIVE PRICING -------------------->
#### Retrieve Effective Pricing

`GET /pricings/:id`

Get an effective pricing in your organization at a certain date. It will apply all the changes up-to the specified date.


```shell
# Get effective pricing
curl "https://cloudmc_endpoint/v2/pricings/73eb0d75-03b0-44e2-9cbf-9ad25dff5da5/effective?date=2021-01-01" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data":
    {
      "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5",
      "name": {
        "en": "Name here",
        "fr": "Nom ici"
      },
      "description": {
        "en": "Description here",
        "fr": "Description ici"
      },
      "supportedCurrencies": [
        "CAD"
      ],
      "missingCurrenciesPricing": false,
      "effectiveDate": "2020-08-31T15:43:53Z",
      "productCatalogs": [
        {
          "id": "ea9ff508-624f-4caa-add9-4f84c20cc1a6",
          ...
        }
      ],
      "organization": {
        "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
      },
      "pricingProducts": [
        {
          "unitPrice": {
            "CAD": 14
          },
          "product": {
            "id": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
            ...
          },
          "cogs": {
            "CAD": 11
          },
          "deprecated": false,
          "id": "0a5553f7-5ea9-432e-9a00-58fa81964422"
        }
      ]
    },
}
```

Query | &nbsp;
---- | -----------
`date`<br/>*Date* | The date we want the pricing on. Defaults to current date.

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the pricing
`name`<br/>*Map* | A map from language to name value for that language
`description`<br/>*Map* | A map from language to description value for that language
`supportedCurrencies`<br/>*List* | A list of currencies supported by the pricing
`missingCurrenciesPricing`<br/>*boolean* | Specifies if one of the changes is missing the prices for one or more currencies.
`effectiveDate`<br/>*Date* | The date at which the pricing will take effect.
`productCatalogs`<br/>*Array<ProductCatalog>* | A list of catalogs added to the pricing
`organization`<br/>*Organization* | Organization where the pricing was created. Fields: `id`
`pricingProducts`<br/>*Array<PricedProduct>* | Products with an associated price on it

Priced product

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the priced product
`product`<br/>*Product* | The product being priced
`cogs`<br/>*Map* | Map from currency code to cogs
`unitPrice`<br/>*Map* | Map from currency code to unit price
`pricingTiers`<br/>*Array<PricingTier>* | Pricing tiers of priced product
`deprecated`<br/>*Boolean* | True if priced product is deprecated

Pricing tier

Attributes | &nbsp;
---- | -----------
`pricingMode`<br/>*Enum* | The pricing mode of the pricing tier. Must be one of "FLAT_FEE" or "PER_UNIT".
`lowerBound`<br/>*double* | The pricing tier's lower bound.
`upperBound`<br/>*double* | The pricing tier's upper bound. A null value indicates that there is no upper bound for the given tier.
`price`<br/>*Map<string, double* | The pricing tier's price in each of the pricing product's supported currencies.
`chunkSize`<br/>*double* | The pricing tier's chunk size.


<!-------------------- List PRICING CHANGES -------------------->
#### List pricing changes

`GET /pricings/:id/changes`

Get all changes of a specific pricing

```shell
# List pricing changes of a pricing
curl "https://cloudmc_endpoint/v2/pricings/73eb0d75-03b0-44e2-9cbf-9ad25dff5da5/changes" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "50a7f27e-25f3-4dda-bf07-1b4f58056ffc",
      "description": "Adding a product",
      "pricingDefinition": {
        "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5"
      },
      "pricedProductsToAdd": [
          {
            "product": {
              "id": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4"
            },
            "cogs": {
              "CAD": 9
            },
            "unitPrice": {
              "CAD": 10
            }
          }
      ],
      "creationDate": "2020-09-01T18:34:43Z",
      "effectiveDate": "2020-09-02T12:00:00Z",
      "missingCurrencies": [],
      "pricingChangeType": "ADD_PRODUCTS"
    },
    {
      "id": "153fa103-1017-4918-a7d5-6dcd91c3de1f",
      "description": "Modifying a product",
      "pricingDefinition": {
        "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5"
      },
      "pricedProductsToModify": [
        {
          "productId": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          "field": "unitPrice",
          "currency": "CAD",
          "value": 13
        }
      ],
      "creationDate": "2020-09-01T15:08:40Z",
      "effectiveDate": "2020-09-02T12:00:00Z",
      "missingCurrencies": [],
      "pricingChangeType": "MODIFY_PRODUCTS"
    },
    {
      "id": "920d7ee9-8771-4485-a0f2-2e122db83c32",
      "description": "Removing a product",
      "pricingDefinition": {
        "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5"
      },
      "creationDate": "2020-09-09T17:56:36Z",
      "effectiveDate": "2020-09-02T12:00:00Z",
      "pricedProductsToDeprecate": [
        "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4"
      ],
      "missingCurrencies": [],
      "pricingChangeType": "REMOVE_PRODUCTS"
    },
    {
      "id": "f93d8d64-b34d-4df3-be5e-4ed265fe474d",
      "description": "Adding a currency",
      "pricingDefinition": {
        "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5"
      },
      "pricedProductsToModify": [
        {
          "productId": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          "field": "cogs",
          "currency": "USD",
          "value": 14
        },
        {
          "productId": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          "field": "unitPrice",
          "currency": "USD",
          "value": 14
        }
      ],
      "currenciesToAdd": [
        "USD"
      ],
      "creationDate": "2020-09-01T18:34:43Z",
      "effectiveDate": "2020-09-02T12:00:00Z",
      "missingCurrencies": [],
      "pricingChangeType": "ADD_CURRENCIES"
    },
    {
      "id": "829ce268-4235-1425-d2g4-8gws49v7dg2",
      "description": "Modifying a product",
      "pricingDefinition": {
        "id": "73eb0d75-03b0-44e2-9cbf-9ad25dff5da5"
      },
      "pricedProductsToModify": [
        {
          "productId": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          "field": "pricingTiers",
          "pricingTiers": [
            {
              "lowerBound": 0,
              "upperBound": 20,
              "priceMode": "PER_UNIT",
              "price": {
                "CAD": 20,
                "USD": 17
              },
            },
            {
              "lowerBound": 20,
              "upperBound": null,
              "priceMode": "PER_UNIT",
              "price": {
                "CAD": 17,
                "USD": 13
              },
            }
          ],
        }
      ],
      "creationDate": "2020-09-01T15:08:40Z",
      "effectiveDate": "2020-09-02T12:00:00Z",
      "missingCurrencies": [],
      "pricingChangeType": "MODIFY_PRODUCTS"
    },
  ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the pricing
`description`<br/>*string* | Description of what the change is doing
`pricingDefinition.id`<br/> *UUID* | The pricing being modified
`pricedProductsToAdd`<br/> *Array<PricedProduct>* | A priced product to add to the pricing. Only with ADD_PRODUCTS type.
`pricedProductsToModify`<br/> *Array<PricedProductChange>* | A change to a priced product in the pricing. Only with MODIFY_PRODUCTS and ADD_CURRENCIES type.
`pricedProductsToDeprecate`<br> *Array<UUID>* | Priced products to deprecate
`currenciesToAdd`<br/> *Array<String>* | Currencies to add to the pricing. Only with ADD_CURRENCIES type.
`missingCurrencies`<br/> *Array<String>* | Currencies that are missing some prices for either the unitPrice or COGS.
`pricingChangeType`<br/> *string* | Type of change to apply
`effectiveDate`<br/> *Date* | Date that the change should be applied
`creationDate`<br/> *Date* | Date that the change was created


PricedProduct

Attributes | &nbsp;
---- | -----------
`product.id`<br/>*UUID* | The id of the product to add prices.
`cogs`<br/>*Map<string, double>* | Map from currency to price. Must include all currencies in pricing at that point (see Effective pricing API).
`unitPrice`<br/>*Map<string, double>* | Map from currency to price. Must include all currencies in pricing at that point (see Effective pricing API).
`pricingTiers` <br/>*Array<PricingTier>* | Pricing tiers for priced product.


PricedProductChange

Attributes | &nbsp;
---- | -----------
`productId`<br/>*UUID* | The id of the product to modify the price.
`field`<br/>*string* | Field to modify. Either 'cogs', 'unitPrice', or 'pricingTiers'.
`currency`<br/>*string* | Currency of value to change. Only for 'cogs' or 'unitPrice'.
`value`<br/>*double* | New price for specifified field. Only for 'cogs' or 'unitPrice'.
`pricingTiers`<br/>*Array<PricingTier>* | New pricing tiers to apply to specified product (the entire tiers, not just changes). Only for 'pricingTiers'.

Pricing tier

Attributes | &nbsp;
---- | -----------
`pricingMode`<br/>*Enum* | The pricing mode of the pricing tier. Must be one of "FLAT_FEE" or "PER_UNIT".
`lowerBound`<br/>*double* | The pricing tier's lower bound.
`upperBound`<br/>*double* | The pricing tier's upper bound. A null value indicates that there is no upper bound for the given tier.
`price`<br/>*Map<string, double* | The pricing tier's price in each of the pricing product's supported currencies.
`chunkSize`<br/>*double* | The pricing tier's chunk size.



<!-------------------- CREATE PRICING CHANGES -------------------->
#### Add pricing change

`POST /pricings/:id/changes`

Add a pricing change to a pricing

```shell
# Add pricing change
curl -X POST "https://cloudmc_endpoint/v2/pricings/73eb0d75-03b0-44e2-9cbf-9ad25dff5da5/changes" \
   -H "MC-Api-Key: your_api_key"
```
> Request body example: 
> Add product body

```json
{
    "description": "Adding a product",
    "pricedProductsToAdd": [
        {
            "product": {
              "id": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4"
            },
            "cogs": {
              "CAD": 9
            },
            "unitPrice": {
              "CAD": 10
            }
        }
    ],
    "effectiveDate": "2020-09-02T12:00:00Z",
    "pricingChangeType": "ADD_PRODUCTS"
}
```
> Modify product body

```json
{
    "description": "Modifying a product",
    "pricedProductsToModify": [
        {
          "productId": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          "field": "unitPrice",
          "currency": "CAD",
          "value": 13
        },
        {
          "productId": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          "field": "pricingTiers",
          "pricingTiers": [
            {
              "lowerBound": 0,
              "upperBound": 20,
              "priceMode": "PER_UNIT",
              "price": {
                "CAD": 20,
                "USD": 17
              },
            },
            {
              "lowerBound": 20,
              "upperBound": null,
              "priceMode": "PER_UNIT",
              "price": {
                "CAD": 17,
                "USD": 13
              },
            }
          ],
        }
    ],
    "effectiveDate": "2020-09-02T12:00:00Z",
    "pricingChangeType": "MODIFY_PRODUCTS"
}
```
> Remove product body

```json
{
    "description": "Removing a product",
    "effectiveDate": "2020-09-02T12:00:00Z",
    "pricedProductsToDeprecate": [
        "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4"
    ],
    "pricingChangeType": "REMOVE_PRODUCTS"
}
```
> Add currency to pricing body

```json
{
    "description": "Adding a currency",
    "pricedProductsToModify": [
        {
          "productId": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          "field": "cogs",
          "currency": "USD",
          "value": 14
        },
        {
          "productId": "dd3fcab9-5b31-4f08-9b50-ed3326bccfb4",
          "field": "unitPrice",
          "currency": "USD",
          "value": 14
        }
    ],
    "currenciesToAdd": [
        "USD"
    ],
    "effectiveDate": "2020-09-02T12:00:00Z",
    "pricingChangeType": "ADD_CURRENCIES"
}
```

Add product

Required | &nbsp;
---- | -----------
`description`<br/> *string* | Description of the change
`pricedProductsToAdd`<br/> *Array<PricedProduct>* | A priced product to add to the pricing.
`pricingChangeType`<br/> *string* | ADD_PRODUCTS
`effectiveDate`<br/> *Date* | Date that the change should be applied

Modify product prices

Required | &nbsp;
---- | -----------
`description`<br/> *string* | Description of the change
`pricedProductsToModify`<br/> *Array<PricedProductChange>* | A change to a priced product in the pricing.
`pricingChangeType`<br/> *string* | MODIFY_PRODUCTS
`effectiveDate`<br/> *Date* | Date that the change should be applied

Remove priced product

Required | &nbsp;
---- | -----------
`description`<br/> *string* | Description of the change
`pricedProductsToDeprecate`<br> *Array<UUID>* | Priced products to deprecate
`pricingChangeType`<br/> *string* | REMOVE_PRODUCTS
`effectiveDate`<br/> *Date* | Date that the change should be applied

Add currencies

Required | &nbsp;
---- | -----------
`description`<br/> *string* | Description of the change
`pricedProductsToModify`<br/> *Array<PricedProductChange>* | Prices for the new currencies for all products. 
`currenciesToAdd`<br/> *Array<string>* | Currencies to add
`pricingChangeType`<br/> *string* | ADD_CURRENCIES
`effectiveDate`<br/> *Date* | Date that the change should be applied


PricedProduct

Attributes | &nbsp;
---- | -----------
`product.id`<br/>*UUID* | The id of the product to add prices.
`cogs`<br/>*Map<string, double>* | Map from currency to price. Must include all currencies in pricing at that point (see Effective pricing API).
`unitPrice`<br/>*Map<string, double>* | Map from currency to price. Must include all currencies in pricing at that point (see Effective pricing API).
`pricingTiers` <br/>*Array<PricingTier>* | Pricing tiers for priced product.


PricedProductChange

Attributes | &nbsp;
---- | -----------
`productId`<br/>*UUID* | The id of the product to modify the price.
`field`<br/>*string* | Field to modify. Either 'cogs', 'unitPrice', or 'pricingTiers'.
`currency`<br/>*string* | Currency of value to change. Only for 'cogs' or 'unitPrice'.
`value`<br/>*double* | New price for specifified field. Only for 'cogs' or 'unitPrice'.
`pricingTiers`<br/>*Array<PricingTier>* | New pricing tiers to apply to specified product (the entire tiers, not just changes). Only for 'pricingTiers'.

Pricing tier

Attributes | &nbsp;
---- | -----------
`pricingMode`<br/>*Enum* | The pricing mode of the pricing tier. Must be one of "FLAT_FEE" or "PER_UNIT".
`lowerBound`<br/>*double* | The pricing tier's lower bound.
`upperBound`<br/>*double* | The pricing tier's upper bound. A null value indicates that there is no upper bound for the given tier.
`price`<br/>*Map<string, double* | The pricing tier's price in each of the pricing product's supported currencies.
`chunkSize`<br/>*double* | The pricing tier's chunk size.


<!-------------------- UPDATE PRICING CHANGES -------------------->
#### Update pricing change

`PUT /pricings/:id/changes/:change_id`

Update a future pricing change of a pricing

```shell
# Update a pricing change
curl -X PUT "https://cloudmc_endpoint/v2/pricings/73eb0d75-03b0-44e2-9cbf-9ad25dff5da5/changes/920d7ee9-8771-4485-a0f2-2e122db83c32" \
   -H "MC-Api-Key: your_api_key"
```

See Add Pricing Change for body. You cannot change the `pricingChangeType`


<!-------------------- REMOVE PRICING CHANGES -------------------->
#### Remove pricing change

`DELETE /pricings/:id/changes/:change_id`

Remove a future pricing change from a pricing

```shell
# Remove a pricing change
curl -X DELETE "https://cloudmc_endpoint/v2/pricings/73eb0d75-03b0-44e2-9cbf-9ad25dff5da5/changes/920d7ee9-8771-4485-a0f2-2e122db83c32" \
   -H "MC-Api-Key: your_api_key"
```