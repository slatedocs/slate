## Commitments

A commitment is a set of resources given to a customer at a certain price. A customer will only pay more than the negotiated price if they go over their committed resource.

<!-------------------- LIST COMMITMENTS -------------------->
### List commitments

`GET /commitments?:organization_id=:id&from=2022-01-01&to=2023-01-01`

Retrieves the list of commitments associated with an organization.

```shell
# Retrieve organization commitment list
curl "https://cloudmc_endpoint/api/v2/commitments" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
 "data": [
  {
   "committedProducts": [
    {
     "createdAt": "2022-06-17T18:48:25Z",
     "product": {
      "id": "bcd82514-d539-4d66-aaf4-b24a95ebe1cd",
      "sku": "CVM-1M02"
     },
     "priceCreatedAt": 10.0,
     "committedAmount": 1000.0,
     "id": "52a54cde-0e5d-4168-9827-5967ded6095e",
     "updatedAt": "2022-06-17T18:48:25Z"
    }
   ],
   "endDate": "2023-01-01T00:00:00Z",
   "pricingMethod": "FIXED_PRICE",
   "type": "RESOURCE",
   "fixedPrice": 500.0,
   "createdAt": "2022-06-17T18:48:07Z",
   "organization": {
    "name": "SleepyCo",
    "id": "42a54cde-0e5d-4168-9827-5967ded6095e"
   },
   "name": "fixed price commitment",
   "id": "52a54cde-0e5d-4168-9827-5967ded6095e",
   "terminated": false,
   "startDate": "2022-01-01T00:00:00Z",
   "updatedAt": "2022-06-17T18:48:07Z",
   "status": "IN_PROGRESS"
  },
  {
   "committedProducts": [
    {
     "createdAt": "2022-06-17T18:49:50Z",
     "product": {
      "id": "bcd82514-d539-4d66-aaf4-b24a95ebe1cd",
      "sku": "CVM-1M02"
     },
     "priceCreatedAt": 10.0,
     "discountAmount": 0.1,
     "committedAmount": 1000.0,
     "id": "62a54cde-0e5d-4168-9827-5967ded6095e",
     "updatedAt": "2022-06-17T18:49:50Z"
    }
   ],
   "endDate": "2023-01-01T00:00:00Z",
   "pricingMethod": "UTILITY_DISCOUNT",
   "type": "RESOURCE",
   "createdAt": "2022-06-17T18:49:38Z",
   "organization": {
    "name": "SleepyCo",
    "id": "42a54cde-0e5d-4168-9827-5967ded6095e"
   },
   "name": "fixed rate commitment",
   "id": "62a54cde-0e5d-4168-9827-5967ded6095e",
   "terminated": false,
   "startDate": "2022-01-01T00:00:00Z",
   "updatedAt": "2022-06-17T18:49:38Z",
   "status": "IN_PROGRESS"
  }
 ]
}
```

Optional Query Parameters | &nbsp;
--- | ---
`organization_id`<br/>*UUID* | The id of the organization that owns the commitment. If not provided, will default to the calling user's organization.
`from`<br/>*string* | Used as part of a date range query. Denotes the inclusive start date in the format YYYY-MM-DD. Cannot be after `to`.
`to`<br/>*string* | Used as part of a date range query. Denotes the exclusive end date in the format YYYY-MM-DD. Cannot be before `from`.

The parameters `from` and `to` are used to retrieve commitments applicable during a specific date range. They must be used together otherwise the individual parameter is ignored.

Attributes | &nbsp;
---- | ---
`id`<br/>*string* | The id of the commitment.
`name`<br/>*string* | The name of the commitment.
`organization`<br/>*Organization* | The organization that owns the commitment.
`committedProducts`<br/>*Array[CommittedProduct]* | The list of products, commitment levels and negotiated price associated to the commitment.
`pricingMethod`<br/>*enum* | The pricing method of the commitment. Possible values are: `FIXED_PRICE` and `UTILITY_DISCOUNT`. Used to define how the effective price of the commitment is calculated.
`rateType`<br/>*enum* | The rate type of the commitment. Applies only to commitments with pricing method `UTILITY_DISCOUNT`. Possible values are: `FIXED_RATE` and `VARIABLE_RATE`.
`status`<br/>*enum* | The status of the commitment. Possible values are: `IN_PROGRESS`, `UPCOMING`, and `EXPIRED`.
`type`<br/>*enum* | The type of the commitment. Currently limited to only `RESOURCE`.
`fixedPrice`<br/>*double* | The effective price for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
`startDate`<br/>*date* | The start date of the commitment.
`endDate`<br/>*date* | The end date of the commitment.
`terminated`<br/>*Boolean* | A flag denoting whether or not the commitment is terminated. This value is not directly tied to the status. 
`createdAt`<br/>*string* | The date on which the commitment product was created.
`updatedAt`<br/>*string* | The date on which the commitment product was updated.

Object: **Organization**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the organization.
`name`<br/>*string* | The name of the organization.

Object: **CommittedProduct**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the committed product.
`product`<br/>*Product* | A product defined in the commitment.
`priceCreatedAt`<br/>*double* | The product's price when the commitment was created.
`discountAmount`<br/>*double* | The product's discount.
`committedAmount`<br/>*double* | The product's committed amount.
`createdAt`<br/>*string* | The date on which the committed product was created.
`updatedAt`<br/>*string* | The date on which the committed product was updated.

Object: **Product**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the product.
`sku`<br/>*string* | The sku of the product.

<!-------------------- GET COMMITMENT -------------------->
### Get commitment

`GET /commitments/:id`

Retrieves a commitment's details.

```shell
# Retrieves organization's commitment
curl "https://cloudmc_endpoint/api/v2/commitments/52a54cde-0e5d-4168-9827-5967ded6095e" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
   "data": {
      "committedProducts": [
         {
         "createdAt": "2022-06-17T18:48:25Z",
         "product": {
         "id": "bcd82514-d539-4d66-aaf4-b24a95ebe1cd",
         "sku": "CVM-1M02"
         },
         "priceCreatedAt": 10.0,
         "committedAmount": 1000.0,
         "id": "52a54cde-0e5d-4168-9827-5967ded6095e",
         "updatedAt": "2022-06-17T18:48:25Z"
         }
      ],
      "endDate": "2023-01-01T00:00:00Z",
      "pricingMethod": "FIXED_PRICE",
      "type": "RESOURCE",
      "fixedPrice": 500.0,
      "createdAt": "2022-06-17T18:48:07Z",
      "organization": {
         "name": "SleepyCo",
         "id": "42a54cde-0e5d-4168-9827-5967ded6095e"
      },
      "name": "fixed price commitment",
      "id": "52a54cde-0e5d-4168-9827-5967ded6095e",
      "terminated": false,
      "startDate": "2022-01-01T00:00:00Z",
      "updatedAt": "2022-06-17T18:48:07Z",
      "status": "IN_PROGRESS"
   }
}
```

Attributes | &nbsp;
---- | ---
`id`<br/>*string* | The id of the commitment.
`name`<br/>*string* | The name of the commitment.
`organization`<br/>*Organization* | The organization that owns the commitment.
`committedProducts`<br/>*Array[CommittedProduct]* | The list of products, commitment levels and negotiated price associated to the commitment.
`pricingMethod`<br/>*enum* | The pricing method of the commitment. Possible values are: `FIXED_PRICE` and `UTILITY_DISCOUNT`. Used to define how the effective price of the commitment is calculated.
`rateType`<br/>*enum* | The rate type of the commitment. Applies only to commitments with pricing method `UTILITY_DISCOUNT`. Possible values are: `FIXED_RATE` and `VARIABLE_RATE`.
`status`<br/>*enum* | The status of the commitment. Possible values are: `IN_PROGRESS`, `UPCOMING`, and `EXPIRED`.
`type`<br/>*enum* | The type of the commitment. Currently limited to only `RESOURCE`.
`fixedPrice`<br/>*double* | The effective price for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
`startDate`<br/>*date* | The start date of the commitment.
`endDate`<br/>*date* | The end date of the commitment.
`terminated`<br/>*Boolean* | A flag denoting whether or not the commitment is terminated. This value is not directly tied to the status. 
`createdAt`<br/>*string* | The date on which the commitment product was created.
`updatedAt`<br/>*string* | The date on which the commitment product was updated.

Object: **Organization**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the organization.
`name`<br/>*string* | The name of the organization.

Object: **CommittedProduct**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the committed product.
`product`<br/>*Product* | A product defined in the commitment.
`priceCreatedAt`<br/>*double* | The product's price when the commitment was created.
`discountAmount`<br/>*double* | The product's discount.
`committedAmount`<br/>*double* | The product's committed amount.
`createdAt`<br/>*string* | The date on which the committed product was created.
`updatedAt`<br/>*string* | The date on which the committed product was updated.

Object: **Product**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the product.
`sku`<br/>*string* | The sku of the product.
