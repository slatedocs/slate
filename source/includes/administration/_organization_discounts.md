## Organization Discounts

The discount allows the assignment of a percentage discount or credit to an organization.

<!-------------------- LIST ORGANIZATION DISCOUNTS -------------------->
### List organization discounts

`GET /organizations/:organization_id/discounts?type=:type`

Retrieve the list of discounts associated with an organization.

```shell
# Retrieve organization discount list
curl "https://cloudmc_endpoint/rest/organizations/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts?type=PERCENTAGE" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "1cb2b345-2b5f-4159-8466-7f3b7e092b38",
      "scope": "PRODUCTS",
      "status": "CURRENT",
      "type": "PERCENTAGE",
      "packageDiscount": null,
      "discountedCategories": {},
      "discountedProducts": {
        "9d842142-1ce9-449f-9691-798f83925214": 10
      },
      "startDate": "2021-02-01T00:00:00Z",
      "discountedLabels": {
        "9d842142-1ce9-449f-9691-798f83925214": {
          "en": "CVM-16M64"
        }
      },
      "name": {
        "en": "Custom discount CVM-16M64 products 10%",
        "fr": "Custom discount CVM-16M64 products 10%"
      }
    },
    {
      "id": "93b165a7-d1eb-43cf-9bdf-9fbdd06defec",
      "scope": "CATEGORIES",
      "status": "CURRENT",
      "type": "PERCENTAGE",
      "packageDiscount": null,
      "discountedCategories": {
        "80140d9b-0a47-4a80-91c4-128613fc329e": 10,
        "a707483d-f6a8-4a6c-8603-da856417e1e8": 10
      },
      "discountedProducts": {},
      "startDate": "2021-02-01T00:00:00Z",
      "discountedLabels": {
        "80140d9b-0a47-4a80-91c4-128613fc329e": {
          "en": "CDN"
        },
        "a707483d-f6a8-4a6c-8603-da856417e1e8": {
          "en": "Storage"
        }
      },
      "name": {
        "en": "custom discount storage/CDN categories 10%",
        "fr": "custom discount storage/CDN categories 10%"
      }
    },
    {
      "id": "cefa859f-07da-4113-8002-6a295e0c40e5",
      "scope": "ALL_PRODUCTS",
      "status": "CURRENT",
      "type": "PERCENTAGE",
      "packageDiscount": 10.0,
      "discountedCategories": {},
      "discountedProducts": {},
      "startDate": "2021-02-01T00:00:00Z",
      "discountedLabels": {},
      "name": {
        "en": "custom discount all products 10%",
        "fr": "custom discount all products 10%"
      }
    }
  ]
}
```

Optional Query Parameters | &nbsp;
---------- | -----------
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".

Attributes | &nbsp;
---- | -----------
`id`<br/>*string* | The id of the discount.
`name`<br/>*object[string, string]* | The name translations of the discount.
`status`<br/>*enum* | The status of the discount. Possible values are: UPCOMING, CURRENT, ENDED.
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".
`scope`<br/>*enum* | The scope of the discount. It could be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`packageDiscount`<br/>*number* | The discount value that will be applied to all products within the applied pricing.
`discountedProducts`<br/>*object[string, number]* | A mapping between product IDs and discount values. All pricing products specified will have the discount value applied to them.
`discountedCategories`<br/>*object[string, number]* | A mapping between category IDs and discount values. All pricing products within a category will have the discount value applied to them.
`startDate`<br/>*date* | The start date of the discount.
`durationDays`<br/>*integer* | Duration of the discount once it has been applied to a customer. If not provided the discount will last indefinitely, or until credit values are reached.

<!-------------------- GET ORGANIZATION DISCOUNT -------------------->
### Get organization discount

`GET /organizations/:organization_id/discounts/:id`

Retrieve a discount's details.

```shell
# Retrieve organization discount list
curl "https://cloudmc_endpoint/rest/organizations/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts/18db7bc6-8be1-48bb-bab1-77a7d696fa3b" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
      "discountedProducts": {},
      "durationDays": 60,
      "type": "PERCENTAGE",
      "packageDiscount": 20.0,
      "scope": "ALL_PRODUCTS",
      "discountedCategories": {},
      "name": {
        "en": "Summer Discount",
        "fr": "Réduction Estival"
      },
      "id": "18db7bc6-8be1-48bb-bab1-77a7d696fa3b",
      "startDate": "2021-07-20T15:57:16.132Z",
      "status": "CURRENT"
  }
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*string* | The id of the discount.
`name`<br/>*object[string, string]* | The name translations of the discount.
`status`<br/>*enum* | The status of the discount. Possible values are: UPCOMING, CURRENT, ENDED.
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".
`scope`<br/>*enum* | The scope of the discount. It could be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`packageDiscount`<br/>*number* | The discount value that will be applied to all products within the applied pricing.
`discountedProducts`<br/>*object[string, number]* | A mapping between product IDs and discount values. All pricing products specified will have the discount value applied to them.
`discountedCategories`<br/>*object[string, number]* | A mapping between category IDs and discount values. All pricing products within a category will have the discount value applied to them.
`startDate`<br/>*date* | The start date of the discount.
`durationDays`<br/>*integer* | Duration of the discount once it has been applied to a customer. If not provided the discount will last indefinitely, or until credit values are reached.

<!-------------------- CREATE ORGANIZATION DISCOUNT -------------------->
### Create organization discount

`POST /organizations/:organization_id/discounts`

Create a new discount

```shell
# Creates a new discount
curl -X POST "https://cloudmc_endpoint/rest/organizations/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts" \
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
  "durationDays": 60,
  "discountedProducts": {},
  "discountedCategories": {
    "8cf73cc0-b86e-49b4-a102-6102894f7955": 2, 
    "00358632-5c9a-4164-a9a9-df271a9c06a9": 22
  },
  "scope": "CATEGORIES", 
}
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
      "discountedProducts": {},
      "durationDays": 60,
      "type": "PERCENTAGE",
      "scope": "CATEGORIES",
      "discountedCategories": {
        "8cf73cc0-b86e-49b4-a102-6102894f7955": 2, 
        "00358632-5c9a-4164-a9a9-df271a9c06a9": 22
      },  
      "name": {
        "en": "Summer Discount",
        "fr": "Réduction Estival"
      },
      "id": "18db7bc6-8be1-48bb-bab1-77a7d696fa3b",
      "startDate": "2021-07-23T00:00:00.000Z"
  }
}
```

Required | &nbsp;
------- | -----------
`name`<br/>*object[string, string]* | The name translations of the discount.
`type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".
`scope`<br/>*enum* | The scope of the discount. It could be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`packageDiscount`<br/>*number* | The discount value that will be applied to all products within the applied pricing.
`discountedProducts`<br/>*object[string, number]* | A mapping between product IDs and discount values. All pricing products specified will have the discount value applied to them.
`discountedCategories`<br/>*object[string, number]* | A mapping between category IDs and discount values. All pricing products within a category will have the discount value applied to them.
`startDate`<br/>*date* | The start date of the discount.

Optional | &nbsp;
------- | -----------
`durationDays`<br/>*integer* | Duration of the discount once it has been applied to a customer. If not provided the discount will last indefinitely, or until credit values are reached.

<!-------------------- EDIT ORGANIZATION DISCOUNT -------------------->
### Edit organization discount

`PUT /organizations/:organization_id/discounts/:id`

Edit an existing discount that hasn't ended. Only the name and cutoff date can be edited for current discount. All fields can be edited for upcoming discounts.

```shell
# Edit an existing discount
curl -X PUT "https://cloudmc_endpoint/rest/organizations/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts/18db7bc6-8be1-48bb-bab1-77a7d696fa3b" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
 "discountedProducts": {
  "9d842142-1ce9-449f-9691-798f83925214": 5,
  "191f69c9-3a76-480e-843c-35afb9cbb1a2": 5,
  "49a49de7-74c4-459f-9189-3adc7c9c1585": 5,
  "b8eede50-4f5f-47ac-8a90-2b32c1a995ce": 5,
  "bcd82514-d539-4d66-aaf4-b24a95ebe1cd": 5,
  "47c1006d-84bf-4bb7-92c5-7bcd34baa82b": 5,
  "47bb82f9-5af4-4cc3-bf79-168cc7bdb7a4": 5,
  "24948849-7303-48c5-bfd8-f58f3e88a7c2": 5,
  "64b8d628-89ad-41b1-8375-27c0453deef9": 5,
  "9a6d318c-fa8b-437e-a8d0-cf50d933ef0c": 5,
  "0642dc67-6d97-460f-9046-91fccbddc15d": 5,
  "6313dba8-e971-48cb-97f9-21dc8ff4cae5": 5,
  "30a3bf2c-d00a-4bff-9d24-c13af4f7f31f": 5,
  "3feb88cb-b665-4481-a30f-a90746ddf25c": 5,
  "757db7f8-3cef-41b2-8e08-0460dc65fc66": 5,
  "414ddeb5-4df3-4ce7-ab93-2fb39c195eaf": 5
 },
 "type": "PERCENTAGE",
 "discountedCategories": {},
 "scope": "PRODUCTS",
 "name": {
  "en": "product discounts may 1st"
 },
 "startDate": "2022-05-01T00:00:00Z"
}
```

> The above command returns a JSON structured like this:

```json
{
 "data": {
  "discountedProducts": {
   "9d842142-1ce9-449f-9691-798f83925214": 5,
   "191f69c9-3a76-480e-843c-35afb9cbb1a2": 5,
   "49a49de7-74c4-459f-9189-3adc7c9c1585": 5,
   "b8eede50-4f5f-47ac-8a90-2b32c1a995ce": 5,
   "bcd82514-d539-4d66-aaf4-b24a95ebe1cd": 5,
   "47c1006d-84bf-4bb7-92c5-7bcd34baa82b": 5,
   "47bb82f9-5af4-4cc3-bf79-168cc7bdb7a4": 5,
   "24948849-7303-48c5-bfd8-f58f3e88a7c2": 5,
   "64b8d628-89ad-41b1-8375-27c0453deef9": 5,
   "9a6d318c-fa8b-437e-a8d0-cf50d933ef0c": 5,
   "0642dc67-6d97-460f-9046-91fccbddc15d": 5,
   "6313dba8-e971-48cb-97f9-21dc8ff4cae5": 5,
   "30a3bf2c-d00a-4bff-9d24-c13af4f7f31f": 5,
   "3feb88cb-b665-4481-a30f-a90746ddf25c": 5,
   "757db7f8-3cef-41b2-8e08-0460dc65fc66": 5,
   "414ddeb5-4df3-4ce7-ab93-2fb39c195eaf": 5
  },
  "type": "PERCENTAGE",
  "mode": "ORGANIZATION",
  "isDeactivated": false,
  "discountedCategories": {},
  "scope": "PRODUCTS",
  "name": {
   "en": "product discounts may 1st"
  },
  "id": "6f62e128-9d83-4423-9fea-9bcd5a2cfa72",
  "startDate": "2022-05-01T00:00:00Z"
 }
}
```

Optional | &nbsp;
------- | -----------
`name`<br/>*object[string, string]* | The name translations of the discount.
`scope`<br/>*enum* | The scope of the discount. It could be either "ALL_PRODUCTS", "CATEGORIES" or "PRODUCTS".
`packageDiscount`<br/>*number* | The discount value that will be applied to all products within the applied pricing.
`discountedProducts`<br/>*object[string, number]* | A mapping between product IDs and discount values. All pricing products specified will have the discount value applied to them.
`discountedCategories`<br/>*object[string, number]* | A mapping between category IDs and discount values. All pricing products within a category will have the discount value applied to them.
`startDate`<br/>*date* | The start date of the discount.
`durationDays`<br/>*integer* | Duration of the discount once it has been applied to a customer. If not provided the discount will last indefinitely, or until credit values are reached.

<!-------------------- DELETE ORGANIZATION DISCOUNT -------------------->
### Delete organization discount

`DELETE /organizations/:organization_id/discounts/:id`

Delete a discount. This operation can only be performed on discounts that have status UPCOMING.

```shell
curl -X DELETE "https://cloudmc_endpoint/rest/organizations/efd32752-c6f2-45cf-b494-cc6be8a45845/discounts/18db7bc6-8be1-48bb-bab1-77a7d696fa3b" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "85df8dfb-b904-42dc-bb76-4824e6b50c83",
  "taskStatus": "SUCCESS"
}
```
