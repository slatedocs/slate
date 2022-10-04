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
     "committedAmount": 1000.0,
     "id": "52a54cde-0e5d-4168-9827-5967ded6095e",
     "updatedAt": "2022-06-17T18:48:25Z"
    }
   ],
   "endDate": "2023-01-01T00:00:00Z",
   "pricingMethod": "FIXED_PRICE",
   "type": "RESOURCE",
   "fixedPrice": 500.0, 
   "fixedPriceTaxCode": {
     "code": "SI086690",
     "description": "IT Services"
   }, 
   "createdAt": "2022-06-17T18:48:07Z",
   "organization": {
    "name": "SleepyCo",
    "id": "42a54cde-0e5d-4168-9827-5967ded6095e"
   },
   "reseller": {
      "name": "SleepyParentCo",
      "id": "55a89cde-0e5d-4168-9827-5967ded6095e"
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
     "fixedRateReferencePrice": 10.0,
     "discountAmount": 0.1,
     "committedAmount": 1000.0,
     "id": "62a54cde-0e5d-4168-9827-5967ded6095e",
     "updatedAt": "2022-06-17T18:49:50Z"
    }
   ],
   "endDate": "2023-01-01T00:00:00Z",
   "pricingMethod": "UTILITY_DISCOUNT",
   "rateType": "FIXED_RATE",
   "type": "RESOURCE",
   "createdAt": "2022-06-17T18:49:38Z",
   "organization": {
    "name": "SleepyCo",
    "id": "42a54cde-0e5d-4168-9827-5967ded6095e"
   },
   "reseller": {
      "name": "SleepyParentCo",
      "id": "55a89cde-0e5d-4168-9827-5967ded6095e"
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
`organization_id`<br/>*UUID* | The id of the organization that is associated to the commitment. If not provided, will default to the calling user's organization.
`from`<br/>*string* | Used as part of a date range query. Denotes the inclusive start date in the format YYYY-MM-DD. Cannot be after `to`.
`to`<br/>*string* | Used as part of a date range query. Denotes the exclusive end date in the format YYYY-MM-DD. Cannot be before `from`.

The parameters `from` and `to` are used to retrieve commitments applicable during a specific date range. They must be used together otherwise the individual parameter is ignored.

Attributes | &nbsp;
---- | ---
`id`<br/>*string* | The id of the commitment.
`name`<br/>*string* | The name of the commitment.
`organization`<br/>*Organization* | The organization that is associated to the commitment.
`committedProducts`<br/>*Array[CommittedProduct]* | The list of products, commitment levels and negotiated price associated to the commitment.
`pricingMethod`<br/>*enum* | The pricing method of the commitment. Possible values are: `FIXED_PRICE` and `UTILITY_DISCOUNT`. Used to define how the effective price of the commitment is calculated.
`rateType`<br/>*enum* | The rate type of the commitment. Applies only to commitments with pricing method `UTILITY_DISCOUNT`. Possible values are: `FIXED_RATE` and `VARIABLE_RATE`.
`status`<br/>*enum* | The status of the commitment. Possible values are: `IN_PROGRESS`, `UPCOMING`, and `EXPIRED`.
`type`<br/>*enum* | The type of the commitment. Currently limited to only `RESOURCE`.
`fixedPrice`<br/>*double* | The effective price for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
`fixedPriceTaxCode`<br/>*TaxCode* | The chosen tax code for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
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
`discountAmount`<br/>*double* | The product's discount percentage.
`committedAmount`<br/>*double* | The product's committed usage amount.
`createdAt`<br/>*string* | The date on which the committed product was created.
`updatedAt`<br/>*string* | The date on which the committed product was updated.

Object: **Product**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the product.
`sku`<br/>*string* | The sku of the product.

Object: **TaxCode**

Attributes | &nbsp;
--- | ---
`code`<br/>*UUID* | The tax code.
`description`<br/>*Product* | Optional description or category for given tax code.

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
         "committedAmount": 1000.0,
         "id": "52a54cde-0e5d-4168-9827-5967ded6095e",
         "updatedAt": "2022-06-17T18:48:25Z"
         }
      ],
      "endDate": "2023-01-01T00:00:00Z",
      "pricingMethod": "FIXED_PRICE",
      "type": "RESOURCE",
      "fixedPrice": 500.0,
      "fixedPriceTaxCode": {
         "code": "SI086690",
         "description": "IT Services"
      },
     "createdAt": "2022-06-17T18:48:07Z",
      "organization": {
         "name": "SleepyCo",
         "id": "42a54cde-0e5d-4168-9827-5967ded6095e"
      },
      "reseller": {
         "name": "SleepyParentCo",
         "id": "55a89cde-0e5d-4168-9827-5967ded6095e"
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
`organization`<br/>*Organization* | The organization that is associated to the commitment.
`reseller`<br/>*Organization* | The organization that owns the commitment.
`committedProducts`<br/>*Array[CommittedProduct]* | The list of products, commitment levels and negotiated price associated to the commitment.
`pricingMethod`<br/>*enum* | The pricing method of the commitment. Possible values are: `FIXED_PRICE` and `UTILITY_DISCOUNT`. Used to define how the effective price of the commitment is calculated.
`rateType`<br/>*enum* | The rate type of the commitment. Applies only to commitments with pricing method `UTILITY_DISCOUNT`. Possible values are: `FIXED_RATE` and `VARIABLE_RATE`.
`status`<br/>*enum* | The status of the commitment. Possible values are: `IN_PROGRESS`, `UPCOMING`, and `EXPIRED`.
`type`<br/>*enum* | The type of the commitment. Currently limited to only `RESOURCE`.
`fixedPrice`<br/>*double* | The effective price for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
`fixedPriceTaxCode`<br/>*TaxCode* | The chosen tax code for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
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
`fixedRateReferencePrice`<br/>*double* | The product's price when the commitment was created.
`discountAmount`<br/>*double* | The product's discount percentage.
`committedAmount`<br/>*double* | The product's committed usage amount.
`createdAt`<br/>*string* | The date on which the committed product was created.
`updatedAt`<br/>*string* | The date on which the committed product was updated.

Object: **Product**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the product.
`sku`<br/>*string* | The sku of the product.

Object: **TaxCode**

Attributes | &nbsp;
--- | ---
`code`<br/>*UUID* | The tax code.
`description`<br/>*Product* | Optional description or category for given tax code.


<!-------------------- CREATE COMMITMENT -------------------->
### Create commitment

`POST /commitments`

Creates a commitment to be associated with an organization.

```shell
# Create a commitment
curl "https://cloudmc_endpoint/api/v2/commitments" \
   -X POST -H "MC-Api-Key: your_api_key"
```

> Request body example for FIXED_PRICE commitments

```json
{
   "committedProducts": [
      {
         "product": {
            "id": "73ebf9c8-ecf7-4ee6-b881-150023d5f422"
         },
         "committedAmount": 1000.0
      }
   ],
   "endDate": "2023-01-01T00:00:00Z",
   "pricingMethod": "FIXED_PRICE",
   "type": "RESOURCE",
   "fixedPrice": 500.0,
   "fixedPriceTaxCode": {
      "code": "SI086690",
      "description": "IT Services"
   },
   "organization": {
      "id": "e2c00fdb-d493-422c-889f-eb734806b80e"
   },
   "name": "fixed monthly price commitment",
   "startDate": "2022-06-01T00:00:00Z"
}
```
      

> The above command returns a JSON structured like this:

```json
{
   "data": {
      "committedProducts": [{
         "createdAt": "2022-06-29T21:03:36.731Z",
         "product": {
            "id": "73ebf9c8-ecf7-4ee6-b881-150023d5f442",
            "sku": "f"
         },
         "committedAmount": 1000.0,
         "id": "6dc908c1-3e52-4dc1-b12d-b9de518aae7a",
         "updatedAt": "2022-06-29T21:03:36.731Z"
      }],
      "endDate": "2023-01-01T00:00:00Z",
      "pricingMethod": "FIXED_PRICE",
      "type": "RESOURCE",
      "fixedPrice": 500.0,
      "fixedPriceTaxCode": {
        "code": "SI086690",
        "description": "IT Services"
      },
      "createdAt": "2022-06-29T21:03:36.708Z",
      "organization": {
         "name": "subOrg",
         "id": "e2c00fdb-d493-422c-889f-eb734806b80e"
      },
      "name": "fixed monthly price commitment",
      "id": "aa7c81ab-478a-496b-a0ae-8f30459b0fa5",
      "terminated": false,
      "startDate": "2022-06-01T00:00:00Z",
      "updatedAt": "2022-06-29T21:03:36.708Z"
    }
}

```

> Request body example for UTILITY_DISCOUNT commitments

```json

{
   "committedProducts": [{
      "product": {
         "id": "73ebf9c8-ecf7-4ee6-b881-150023d5f442"
      },
      "committedAmount": 1000.0,
      "discountAmount": 10
   }],
   "endDate": "2023-01-01T00:00:00Z",
   "pricingMethod": "UTILITY_DISCOUNT",
   "rateType": "FIXED_RATE",
   "type": "RESOURCE",
   "organization": {
      "id": "e2c00fdb-d493-422c-889f-eb734806b80e"
   },
   "name": "fixed price commitment",
   "startDate": "2022-06-01T00:00:00Z"
}
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "committedProducts": [{
         "createdAt": "2022-06-29T21:06:55.163Z",
         "product": {
            "id": "73ebf9c8-ecf7-4ee6-b881-150023d5f442",
            "sku": "f"
         },
         "discountAmount": 10,
         "committedAmount": 1000.0,
         "fixedRateReferencePrice": 10,
         "id": "4a7be20e-23f2-4e83-883e-8e5c56e7552a",
         "updatedAt": "2022-06-29T21:06:55.163Z"
      }],
      "endDate": "2023-01-01T00:00:00Z",
      "pricingMethod": "UTILITY_DISCOUNT",
      "type": "RESOURCE",
      "rateType": "FIXED_RATE",
      "createdAt": "2022-06-29T21:06:55.153Z",
      "organization": {
         "name": "subOrg",
         "id": "e2c00fdb-d493-422c-889f-eb734806b80e"
      },
      "name": "fixed rate commitment",
      "id": "7e2c15ae-c43b-44e9-9bbb-8e8821740f53",
      "terminated": false,
      "startDate": "2022-06-01T00:00:00Z",
      "updatedAt": "2022-06-29T21:06:55.153Z"
   }
}

```


Attributes | &nbsp;
---- | ---
`name`<br/>*string* | The name of the commitment.
`organization`<br/>*Organization* | The organization that is associated to the commitment.
`committedProducts`<br/>*Array[CommittedProduct]* | The list of products, commitment levels and negotiated price associated to the commitment.
`pricingMethod`<br/>*enum* | The pricing method of the commitment. Possible values are: `FIXED_PRICE` and `UTILITY_DISCOUNT`. Used to define how the effective price of the commitment is calculated.
`rateType`<br/>*enum* | The rate type of the commitment. Applies only to commitments with pricing method `UTILITY_DISCOUNT`. Possible values are: `FIXED_RATE` and `VARIABLE_RATE`.
`type`<br/>*enum* | The type of the commitment. Currently limited to only `RESOURCE`.
`fixedPrice`<br/>*double* | The effective price for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
`fixedPriceTaxCode`<br/>*TaxCode* | The chosen tax code for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
`startDate`<br/>*date* | The start date of the commitment. The start date must be specified. A commitment's date range cannot span a billing cycle with an issued invoice.
`endDate`<br/>*date* | The end date of the commitment. An indefinite end date can be set by omitting the `endDate` field from the request body.

Object: **Organization**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the organization.

Object: **CommittedProduct**

Attributes | &nbsp;
--- | ---
`product`<br/>*Product* | A product defined in the commitment.
`discountAmount`<br/>*double* | The product's discount percentage. Applies only to commitments with pricing method `UTILITY_DISCOUNT`.
`committedAmount`<br/>*double* | The product's committed usage amount.

Object: **Product**

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The id of the product.

Object: **TaxCode**

Attributes | &nbsp;
--- | ---
`code`<br/>*UUID* | The tax code.
`description`<br/>*Product* | Optional description or category for given tax code.


<!-------------------- DELETE COMMITMENT -------------------->
### Delete commitment

`DELETE /commitments/:id`

Deletes a commitment that has already been created for an organization.

A commitment can only be deleted if it has no closed billing cycles associated to it. This means that a commitment will likely only be able to be deleted within a month of creation at most.

```shell
# delete commitment
curl "https://cloudmc_endpoint/api/v2/commitments/:id" \
   -X DELETE -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
	"taskId": "taskId...",
	"taskStatus": "SUCCESS"
}
```

<!-------------------- TERMINATE COMMITMENT -------------------->
### Terminate commitment

`POST /commitments/:id/terminate`

Terminates a commitment that spans a closed billing cycle.

A commitment cannot be deleted if it has a closed billing cycle associated to it. Therefore, it has to be terminated.

A reprocess of the usage may be necessary if the termination date of the commitment is before the current date.

```shell
# terminate commitment
curl "https://cloudmc_endpoint/api/v2/commitments/:id/terminate" \
   -X POST -H "MC-Api-Key: your_api_key" -d '{"endDate": "YYYY-MM-DD"}'
```

Attributes | &nbsp;
---- | ---
`endDate`<br/>*string* | The termination date of the commitment. The termination date has to correspond to the end date of the current billing cycle or the next billing cycle.

> Request body example for a terminated commitments

```json
{
   "endDate": "2022-09-01"
}
```

> The above command returns a JSON structured like this:

```json
{
    "taskId": "75a68ec2-d63e-4bc9-b485-8d5a3cc33d4f",
    "taskStatus": "SUCCESS"
}
```

<!-------------------- UPDATE COMMITMENT -------------------->
### Update commitment

`PUT /commitments/:id`

Update the attributes of a commitment for an organization

If an invoice hasn't been issued to the customer, all of the attributes of the commitment can be updated.

A commitment that is pre-paid can be updated, **but** it will be terminated and a new commitment will be created with the updated attributes and will be effective at the start at the end of the current billing cycle.

```shell
# update commitment
curl "https://cloudmc_endpoint/api/v2/commitments/:id" \
   -X PUT -H "MC-Api-Key: your_api_key" -d '{ ... }'
```

> Request body example

```json
{
   "id": "60d16762-bec2-4d5a-916d-15c81b6c2d98"
   "name": "updated fixed monthly price commitment",
   "committedProducts": [
      {
         "product": {
            "id": "73ebf9c8-ecf7-4ee6-b881-150023d5f422"
         },
         "committedAmount": 1234.0
      }
   ],
   "pricingMethod": "FIXED_PRICE",
   "type": "RESOURCE",
   "fixedPrice": 550.0,
   "fixedPriceTaxCode": {
       "code": "SI086690",
       "description": "IT Services"
   },
   "startDate": "2022-06-01T00:00:00Z",
   "endDate": "2023-01-01T00:00:00Z"
}
```


> The above command returns a JSON structured like this:

```json
{
    "taskId": "75a68ec2-d63e-4bc9-b485-8d5a3cc33d4f",
    "taskStatus": "SUCCESS"
}
```

Attributes | &nbsp;
---- | ---
`id`<br/>*string* | The identifier of the commitment.
`name`<br/>*string* | The name of the commitment.
`organization`<br/>*Organization* | The organization that is associated to the commitment.
`reseller`<br/>*Organization* | The organization that owns the commitment.
`committedProducts`<br/>*Array[CommittedProduct]* | The list of products, commitment levels and negotiated price associated to the commitment.
`pricingMethod`<br/>*enum* | The pricing method of the commitment. Possible values are: `FIXED_PRICE` and `UTILITY_DISCOUNT`. Used to define how the effective price of the commitment is calculated.
`rateType`<br/>*enum* | The rate type of the commitment. Applies only to commitments with pricing method `UTILITY_DISCOUNT`. Possible values are: `FIXED_RATE` and `VARIABLE_RATE`.
`type`<br/>*enum* | The type of the commitment. Currently limited to only `RESOURCE`.
`fixedPrice`<br/>*double* | The effective price for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
`fixedPriceTaxCode`<br/>*TaxCode* | The chosen tax code for this commitment. Applies only to commitments with pricing method `FIXED_PRICE`.
`startDate`<br/>*date* | The start date of the commitment. The start date must be specified. A commitment's date range cannot span a billing cycle with an issued invoice.
`endDate`<br/>*date* | The end date of the commitment. An indefinite end date can be set by omitting the `endDate` field from the request body.

**_NOTE:_** The organization and the reseller attribute cannot be updated

Object: **TaxCode**

Attributes | &nbsp;
--- | ---
`code`<br/>*UUID* | The tax code.
`description`<br/>*Product* | Optional description or category for given tax code.