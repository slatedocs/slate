## Product Catalogs

The product catalogs determine the product configured for a service type and optionally for specific connections.

<!-------------------- LIST PRODUCT CATALOGS -------------------->
### List product catalogs

`GET /product_catalogs`

Retrieves a list of product catalogs configured in the system.

```shell
# Retrieve product catalog list
curl "https://cloudmc_endpoint/rest/product_catalogs" \
   -H "MC-Api-Key: your_api_key"
```s
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "mode": "ALL_CONNECTIONS_OF_TYPE",
      "serviceType": "cloudca",
      "connectionIds": [],
      "name": {
        "en": "fgsfdg",
        "fr": "sfdg"
      },
      "changes": [],
      "description": {
        "en": "sdfg",
        "fr": "sdg"
      },
      "id": "5ba5df7c-1e60-4d99-869d-dd3d97826b2e",
      "categories": [
        {
          "name": {
            "en": "sdfg",
            "fr": "sdfg"
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
          "deprecated": false,
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
  ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the product catalog.
`name`<br/>*Object* | The name object in each language for the product catalog.
`description`<br/>*string* | The description object in each language for the product catalog.
`mode`<br/>*string* | Identify the mode if it is for all service type or specific connections. Possible values: ALL_CONNECTIONS_OF_TYPE, SPECIFIC_CONNECTIONS.
`serviceType`<br/>*Object* | The service connection type the product catalog is bound to.
`connectionIds`<br/>*Array[UUID]* | Array of UUID for the service connections that the catalog is bound to.
`changes`<br/>*Array[Object]* | Array of all changes done on the product catalog.
`categories`<br/>*Array[Object]* | The list of product categories object.
`categories.id`<br/>*UUID* | The id of product category object.
`categories.name`<br/>*Object* | The name object in each language for the category.
`products`<br/>*Array[Object]* | The list of products assigned to the catalog.
`products.metricType`<br/>*string* | The type of metrics taken. Possible values: COUNTER, GAUGE.
`products.unit`<br/>*Object* | The unit object of the product.
`products.unit.unit`<br/>*string* | The unit value of the product.
`products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`products.deprecated`<br>*boolean* | Whether or not the product is deprecated. Defaults to false.
`products.name`<br/>*Object* | The name object in each language for the product name.
`products.transformer`<br/>*Object* | The object representing the transformation to do on the product usage.
`products.transformer.type`<br/>*string* | The type of transformation to apply. Possible values: PROPORTIONAL_TO_TIME, EXPRESSION, NONE.
`products.transformer.expression`<br/>*string* | The transformation expression to apply. Only required if the type is EXPRESSION.
`products.id`<br/>*UUID* | The ID of the product.
`products.attribute`<br/>*string* | The attribute that will be used to compute usage from the service type usage.
`products.source`<br/>*strubg* | The source of the usage to get from the service type.
`products.filters`<br/>*Array[Object]* | The list of products assigned to the catalog.
`products.filters.type`<br/>*string* | The type of the filter. Possible values: EXPRESSION, SIMPLE.
`products.filters.expression`<br/>*string* | The expression to filter the product in the usage generation. Only required when the type is EXPRESSION. The expression must follow the syntax of Spring Expression Language(SPEL).
`products.filters.field`<br/>*string* | The field to filter. This is only required when type is SIMPLE.
`products.filters.operator`<br/>*string* | The operation to check on the selected field. This is only required when type is SIMPLE. Possible values: EQUAL, NOT_EQUAL, CONTAINS, STARTS_WITH, ENDS_WITH, MATCHES_REGEX, LESS_THAN, LESS_OR_EQUAL_THAN, BIGGER_THAN, BIGGER_OR_EQUAL_THAN.
`products.filters.value`<br/>*string* | The value to use in the field combined with the operation. This is only required when type is SIMPLE.
`products.sku`<br/>*string* | The SKU of the product.
`products.categoryId`<br/>*UUID* | The UUID of the category to which belongs the product.

<!-------------------- GET PRODUCT CATALOG -------------------->
### Retrieve a product catalog

`GET /product_catalogs/:id`

Retrieve a product catalog's details.

```shell
# Retrieve a product catalog's details
curl "https://cloudmc_endpoint/rest/product_catalogs/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "mode": "ALL_CONNECTIONS_OF_TYPE",
    "serviceType": "cloudca",
    "connectionIds": [],
    "name": {
      "en": "fgsfdg",
      "fr": "sfdg"
    },
    "changes": [],
    "description": {
      "en": "sdfg",
      "fr": "sdg"
    },
    "id": "5ba5df7c-1e60-4d99-869d-dd3d97826b2e",
    "categories": [
      {
        "name": {
          "en": "sdfg",
          "fr": "sdfg"
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
        "deprecated": false,
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
}

```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the product catalog.
`name`<br/>*Object* | The name object in each language for the product catalog.
`description`<br/>*string* | The description object in each language for the product catalog.
`mode`<br/>*string* | Identify the mode if it is for all service type or specific connections. Possible values: ALL_CONNECTIONS_OF_TYPE, SPECIFIC_CONNECTIONS.
`serviceType`<br/>*Object* | The service connection type the product catalog is bound to.
`connectionIds`<br/>*Array[UUID]* | Array of UUID for the service connections that the catalog is bound to.
`changes`<br/>*Array[Object]* | Array of all changes done on the product catalog.
`categories`<br/>*Array[Object]* | The list of product categories object.
`categories.id`<br/>*UUID* | The id of product category object.
`categories.name`<br/>*Object* | The name object in each language for the category.
`products`<br/>*Array[Object]* | The list of products assigned to the catalog.
`products.metricType`<br/>*string* | The type of metrics taken. Possible values: COUNTER, GAUGE.
`products.unit`<br/>*Object* | The unit object of the product.
`products.unit.unit`<br/>*string* | The unit value of the product.
`products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`products.deprecated`<br>*boolean* | Whether or not the product is deprecated. Deprecated products may not be updated or undeprecated. Defaults to false.
`products.name`<br/>*Object* | The name object in each language for the product name.
`products.transformer`<br/>*Object* | The object representing the transformation to do on the product usage.
`products.transformer.type`<br/>*string* | The type of transformation to apply. Possible values: PROPORTIONAL_TO_TIME, EXPRESSION, NONE.
`products.transformer.expression`<br/>*string* | The transformation expression to apply. Only required if the type is EXPRESSION.
`products.id`<br/>*UUID* | The ID of the product.
`products.attribute`<br/>*string* | The attribute that will be used to compute usage from the service type usage.
`products.source`<br/>*strubg* | The source of the usage to get from the service type.
`products.filters`<br/>*Array[Object]* | The list of products assigned to the catalog.
`products.filters.type`<br/>*string* | The type of the filter. Possible values: EXPRESSION, SIMPLE.
`products.filters.expression`<br/>*string* | The expression to filter the product in the usage generation. Only required when the type is EXPRESSION. The expression must follow the syntax of Spring Expression Language(SPEL).
`products.filters.field`<br/>*string* | The field to filter. This is only required when type is SIMPLE.
`products.filters.operator`<br/>*string* | The operation to check on the selected field. This is only required when type is SIMPLE. Possible values: EQUAL, NOT_EQUAL, CONTAINS, STARTS_WITH, ENDS_WITH, MATCHES_REGEX, LESS_THAN, LESS_OR_EQUAL_THAN, BIGGER_THAN, BIGGER_OR_EQUAL_THAN.
`products.filters.value`<br/>*string* | The value to use in the field combined with the operation. This is only required when type is SIMPLE.
`products.sku`<br/>*string* | The SKU of the product.
`products.categoryId`<br/>*UUID* | The UUID of the category to which belongs the product.

<!-------------------- CREATE PRODUCT CATALOG -------------------->
### Create product catalog

`POST /product_catalogs`

Create a new product catalog.

```shell
# Creates a new product catalog
curl -X POST "https://cloudmc_endpoint/rest/product_catalogs" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
 {
      "mode": "ALL_CONNECTIONS_OF_TYPE",
      "serviceType": "cloudca",
      "connectionIds": [],
      "name": {
        "en": "name_en",
        "fr": "name_fr",
        "es": "name_es"
      },
      "description": {
        "en": "beep boop",
        "fr": "beep boop",
        "es": "beep boop"
      },
      "categories": [
        {
          "name": {
            "en": "category_en",
            "fr": "category_fr",
            "es": "category_es"
          },
     "id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
        }
      ],
      "products": [
        {
     "categoryId": "c14daee2-4678-4710-b9af-fc26fbd3c7f3",
          "metricType": "GAUGE",
          "unit": {
            "unit": "HOUR",
            "name": {}
          },
          "period": "HOUR",
          "deprecated": false,
          "name": {
            "en": "product_en",
            "fr": "product_fr",
            "es": "product_es"
          },
          "transformer": {
            "type": "PROPORTIONAL_TO_TIME"
          },
          "attribute": "RAWUSAGE",
          "source": "1",
          "filters": [],
          "sku": "product_sku"
        }
      ]
    }
```

> The above command return JSON structured like this:

```js
{
  "data": {
    "mode": "ALL_CONNECTIONS_OF_TYPE",
    "serviceType": "cloudca",
    "connectionIds": [],
    "name": {
      "en": "madeInApi",
      "fr": "madeInApi",
      "es": "madeInApi"
    },
    "description": {
      "en": "beep boop",
      "fr": "beep boop",
      "es": "beep boop"
    },
    "id": "b541a90b-afb6-44cf-8a0d-3332668bbe12",
    "categories": [
      {
        "name": {
          "en": "category_en",
          "fr": "category_fr",
          "es": "category_es"
        },
        "id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
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
        "deprecated": false,
        "name": {
          "en": "product_en",
          "fr": "product_fr",
          "es": "product_es"
        },
        "transformer": {
          "type": "PROPORTIONAL_TO_TIME"
        },
        "id": "e28f7a0a-ca4d-4840-af11-ac760bfcd42b",
        "attribute": "RAWUSAGE",
        "source": "1",
        "filters": [],
        "sku": "product_sku",
        "categoryId": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
      }
    ]
  }
}
```

Required | &nbsp;
------- | -----------
`name`<br/>*Object* | The name object in each language for the product catalog.
`description`<br/>*string* | The description object in each language for the product catalog.
`mode`<br/>*string* | Identify the mode if it is for all service type or specific connections. Possible values: ALL_CONNECTIONS_OF_TYPE, SPECIFIC_CONNECTIONS.
`serviceType`<br/>*Object* | The service connection type the product catalog is bound to.

Optional | &nbsp;
------- | -----------
`connectionIds`<br/>*Array[UUID]* | Array of UUID for the service connections that the catalog is bound to.
`categories`<br/>*Array[Object]* | The list of product categories object.
`categories.id`<br/>*UUID* | The id of product category object. Required for each category object.
`categories.name`<br/>*Object* | The name object in each language for the category.
`products`<br/>*Array[Object]* | The list of products assigned to the catalog.
`products.metricType`<br/>*string* | The type of metrics taken. Possible values: COUNTER, GAUGE.
`products.unit`<br/>*Object* | The unit object of the product.
`products.unit.unit`<br/>*string* | The unit value of the product.
`products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`products.deprecated`<br>*boolean* | Whether or not the product is deprecated. Deprecated products may not be updated or undeprecated. Defaults to false.
`products.name`<br/>*Object* | The name object in each language for the product name.
`products.transformer`<br/>*Object* | The object representing the transformation to do on the product usage.
`products.transformer.type`<br/>*string* | The type of transformation to apply. Possible values: PROPORTIONAL_TO_TIME, EXPRESSION, NONE.
`products.transformer.expression`<br/>*string* | The transformation expression to apply. Only required if the type is EXPRESSION.
`products.id`<br/>*UUID* | The id of the product. Returned with the response.
`products.attribute`<br/>*string* | The source attribute that will be used to compute usage from the service type usage.
`products.source`<br/>*strubg* | The source of the usage to get from the service type.
`products.filters`<br/>*Array[Object]* | The list of products assigned to the catalog.
`products.filters.type`<br/>*string* | The type of the filter. Possible values: EXPRESSION, SIMPLE.
`products.filters.expression`<br/>*string* | The expression to filter the product in the usage generation. Only required when the type is EXPRESSION. The expression must follow the syntax of Spring Expression Language(SPEL).
`products.filters.field`<br/>*string* | The field to filter. This is only required when type is SIMPLE.
`products.filters.operator`<br/>*string* | The operation to check on the selected field. This is only required when type is SIMPLE. Possible values: EQUAL, NOT_EQUAL, CONTAINS, STARTS_WITH, ENDS_WITH, MATCHES_REGEX, LESS_THAN, LESS_OR_EQUAL_THAN, BIGGER_THAN, BIGGER_OR_EQUAL_THAN.
`products.filters.value`<br/>*string* | The value to use in the field combined with the operation. This is only required when type is SIMPLE.
`products.sku`<br/>*string* | The SKU of the product.
`products.categoryId`<br/>*UUID* | The UUID of the category to which belongs the product. Required for each product.

<!-------------------- UPDATE PRODUCT CATALOG -------------------->
### Update product catalog

`PUT /product_catalogs/:id`

Update an existing product catalog, including its associated categories and products.

The catalog's service type as well as the existing product SKUs cannot be edited. In addition, users may not delete categories or products. Products may be marked as deprecated. Deprecated products may not be updated or un-deprecated.

Changing a product definition affects how future usage charges will be calculated to customers. It will not be retroactively applied to records already processed. A manual rollback can be used to reprocess past usage charges with the updated product definition.

```shell
# Updates a product catalog
curl -X PUT "https://cloudmc_endpoint/rest/product_catalogs/b541a90b-afb6-44cf-8a0d-3332668bbe12" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
 {
      "mode": "ALL_CONNECTIONS_OF_TYPE",
      "connectionIds": [],
      "name": {
        "en": "updated_en",
        "fr": "name_fr",
        "es": "name_es"
      },
      "description": {
        "en": "beep boop",
        "fr": "beep boop",
        "es": "beep boop"
      },
      "id": "b541a90b-afb6-44cf-8a0d-3332668bbe12",
      "categories": [
        {
          "name": {
            "en": "category_en",
            "fr": "category_fr",
            "es": "category_es"
          },
     "id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
        }
      ],
      "products": [
        {
     "categoryId": "c14daee2-4678-4710-b9af-fc26fbd3c7f3",
          "metricType": "GAUGE",
          "unit": {
            "unit": "HOUR",
            "name": {}
          },
          "period": "HOUR",
          "deprecated": false,
          "name": {
            "en": "product_en",
            "fr": "product_fr",
            "es": "product_es"
          },
          "transformer": {
            "type": "PROPORTIONAL_TO_TIME"
          },
          "id": "e28f7a0a-ca4d-4840-af11-ac760bfcd42b",
          "attribute": "RAWUSAGE",
          "source": "1",
          "filters": [],
        }
      ]
    }
```

> The above command return JSON structured like this:

```js
{
  "data": {
    "mode": "ALL_CONNECTIONS_OF_TYPE",
    "serviceType": "cloudca",
    "connectionIds": [],
    "name": {
      "en": "updated_en",
      "fr": "name_fr",
      "es": "name_es"
    },
    "description": {
      "en": "beep boop",
      "fr": "beep boop",
      "es": "beep boop"
    },
    "id": "b541a90b-afb6-44cf-8a0d-3332668bbe12",
    "categories": [
      {
        "name": {
          "en": "category_en",
          "fr": "category_fr",
          "es": "category_es"
        },
        "id": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
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
        "deprecated": false,
        "name": {
          "en": "product_en",
          "fr": "product_fr",
          "es": "product_es"
        },
        "transformer": {
          "type": "PROPORTIONAL_TO_TIME"
        },
        "id": "e28f7a0a-ca4d-4840-af11-ac760bfcd42b",
        "attribute": "RAWUSAGE",
        "source": "1",
        "filters": [],
        "sku": "product_sku",
        "categoryId": "c14daee2-4678-4710-b9af-fc26fbd3c7f3"
      }
    ]
  }
}
```

Required | &nbsp;
------- | -----------
`name`<br/>*Object* | The name object in each language for the product catalog.
`description`<br/>*string* | The description object in each language for the product catalog.
`mode`<br/>*string* | Identify the mode if it is for all service type or specific connections. Possible values: ALL_CONNECTIONS_OF_TYPE, SPECIFIC_CONNECTIONS.
`categories`<br/>*Array[Object]* | The list of product categories object.
`categories.id`<br/>*UUID* | The id of product category object. Required for each category object.
`categories.name`<br/>*Object* | The name object in each language for the category.
`products`<br/>*Array[Object]* | The list of products assigned to the catalog.
`products.metricType`<br/>*string* | The type of metrics taken. Possible values: COUNTER, GAUGE.
`products.unit`<br/>*Object* | The unit object of the product.
`products.unit.unit`<br/>*string* | The unit value of the product.
`products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
`products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`products.name`<br/>*Object* | The name object in each language for the product name.
`products.deprecated`<br>*boolean* | Whether or not the product is deprecated. Deprecated products may not be updated or undeprecated. Defaults to false.
`products.transformer`<br/>*Object* | The object representing the transformation to do on the product usage.
`products.transformer.type`<br/>*string* | The type of transformation to apply. Possible values: PROPORTIONAL_TO_TIME, EXPRESSION, NONE.
`products.transformer.expression`<br/>*string* | The transformation expression to apply. Only required if the type is EXPRESSION.
`products.id`<br/>*UUID* | The ID of the product.
`products.attribute`<br/>*string* | The attribute that will be used to compute usage from the service type usage.
`products.source`<br/>*strubg* | The source of the usage to get from the service type.
`products.filters`<br/>*Array[Object]* | The list of products assigned to the catalog.
`products.filters.type`<br/>*string* | The type of the filter. Possible values: EXPRESSION, SIMPLE.
`products.filters.expression`<br/>*string* | The expression to filter the product in the usage generation. Only required when the type is EXPRESSION. The expression must follow the syntax of Spring Expression Language(SPEL).
`products.filters.field`<br/>*string* | The field to filter. This is only required when type is SIMPLE.
`products.filters.operator`<br/>*string* | The operation to check on the selected field. This is only required when type is SIMPLE. Possible values: EQUAL, NOT_EQUAL, CONTAINS, STARTS_WITH, ENDS_WITH, MATCHES_REGEX, LESS_THAN, LESS_OR_EQUAL_THAN, BIGGER_THAN, BIGGER_OR_EQUAL_THAN.
`products.filters.value`<br/>*string* | The value to use in the field combined with the operation. This is only required when type is SIMPLE.
`products.sku`<br/>*string* | The SKU of the product. May not be edited after product is created.
`products.categoryId`<br/>*UUID* | The UUID of the category to which belongs the product. Required for each product.

Optional | &nbsp;
------- | -----------
`connectionIds`<br/>*Array[UUID]* | Array of UUID for the service connections that the catalog is bound to.

<!-------------------- DELETE PRODUCT CATALOG -------------------->
### Delete product catalog

`DELETE /product_catalogs/:id`

Delete an existing product catalog. Users may not delete a product catalog that has associated pricings.

```shell
# Deletes a specified product catalog
curl -X DELETE "https://cloudmc_endpoint/rest/product_catalogs/b541a90b-afb6-44cf-8a0d-3332668bbe12" \
   -H "MC-Api-Key: your_api_key"
```

> The above command(s) return(s) JSON structured like this:

```js
{
  "taskId": "c50390c7-9d5b-4af4-a2da-e2a2678a83e8",
  "taskStatus": "SUCCESS"
}
```

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the identity provider deletion.
`taskStatus` <br/>*string* | The status of the operation.
