## Resource commitments

Resource commitments allow you to set specific commitment levels on cloud resources available on a [service-connection](#administration-service-connections). This assures commitment to a specific set of resources on a fixed monthly price. Any additional resource usage will be billed on the utility price defined by the CMC [pricing](#administration-pricing). Commitments can either be restricted to a specific date range or be un-restricted with no end date. Whilst the commitment price is decided by the pre-defined [pricing](#administration-pricing), various discounts can be given on the resource utility price. Resource commitments allow CloudMC users to receive services at fixed discounted rates whilst enabling additional usage at utility cost.

<!-------------------- LIST RESOURCE COMMITMENTS -------------------->

### List resource commitments

`GET /resource_commitments`

```shell
# Retrieve visible resource commitments
curl "https://cloudmc_endpoint/api/v1/resource_commitments" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "id": "f5dc7647-71e6-4b9b-998a-c0e4d38bf2e6",
    "displayName": "CRB-SYSTEM-1",
    "creationDate": "2019-05-24T18:02:01.000Z",
    "startDate": "2019-05-16T00:00:00Z",
    "endDate": "2019-05-24T00:00:00Z",
    "pricingMethod": "FIXED_MONTHLY",
    "currency": "CAD",
    "monthlyPrice": 20.0,
    "effectiveDiscount": 92.39,
    "billableHoursPerMonth": 730,
    "billingDay": 16,
    "resourceCommitmentDetails": [
      {
        "id": "08125b3c-3b25-4585-910b-c1a0dc53010a",
        "name": "CustomDoF",
        "primaryType": "6",
        "secondaryType": "CustomDoF",
        "commitment": 0,
        "discountPercent": 0,
        "unit": "gigabyte",
        "labelKey": "cloudstack.volume"
      },
      {
        "id": "0bf1a48d-f807-4821-8247-2eb9a3128091",
        "primaryType": "3",
        "commitment": 0,
        "discountPercent": 0,
        "unit": "unit",
        "labelKey": "cloudstack.ipAddress"
      },
      { ... },
      { ... },
      { ... }
    ],
    "serviceConnection": {
      "name": "dev1-cloudstack",
      "id": "cb511a38-eab5-4a2e-969b-04e129c98415",
      "type": "cloudstack"
    },
    "organization": {
      "name": "System",
      "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
    },
    "version": 1,
    "deleted": false
  }, 
  {
    "id": "51c01cfe-f0d5-4a3d-841d-35ec2b7df9cc",
    "displayName": "CRB-SYSTEM-2",
    ....
  }]
}
```
List all the resource commitments that you have access to. You can only view resource commitments if you have been assigned either the `Usage: View` or the `Commitments: Manage` permission. If you have `Usage: View` access then you will only be able to see the commitments specific to your organization. Having the `Commitments: Manage` permission lets you see all resource commitments in the system.

An array of resource commitments with the following attributes are returned.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the resource commitment.
`displayName`<br/>*string* | The name of the resource commitment.
`creationDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the resource commitment was created.
`startDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) from when the resource commitment becomes active.
`endDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) until when the resource commitment will be active.<br/>*optional*: `if not present then the commitment has no end date`
`pricingMethod`<br/>*string* | One of the two following options that define how the effective price for the resource commitment is calculated.<br/>*FIXED_MONTHLY*: `a fixed price per billing cycle`<br/>*VARIABLE_UTILITY_DISCOUNT*: `pricing with custom discount on specific resources`
`currency`<br/>*string* | The currency type based on which the pricing is defined.
`monthlyPrice`<br/>*number* | The effective monthly price for this resource commitment.
`effectiveDiscount`<br/>*number* | The effective discount percentage (%) on this resource commitment.
`billableHoursPerMonth`<br/>*number* | The number hours per month based on which the monthly price is calculated.<br/>*optional*: `not present if the pricing method is FIXED_MONTHLY`
`billingDay`<br/>*number* | The day of the month based on which the billing cycle is calculated.
`resourceCommitmentDetails`<br/>*Array [Commitment detail]* | The resources on which different commitment levels _(and discounts)_ have been set.<br/>*includes*: `id`, `name`, `primaryType`, `secondaryType`, `commitment`, `discountPercent`, `unit`, `labelKey`
`organization`<br/>*[Organization](#administration-organizations)* | The organization on whose connection the resource commitment is defined.<br/>*includes*: `id`, `name`
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection on which the resource commitment is defined.<br/>*includes*: `id`, `name`, `type`


<!-------------------- GET A RESOURCE COMMITMENT -------------------->

### Retrieve a resource commitment

`GET /resource_commitments/:id`

```shell
# Retrieve visible a resource commitment

curl "https://cloudmc_endpoint/api/v2/resource_commitments/fbgc7647-71e6-w69b-998a-c02rf58bf2e6" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "f5dc7647-71e6-4b9b-998a-c0e4d38bf2e6",
    "displayName": "CRB-SYSTEM-5",
    "creationDate": "2019-05-24T18:02:01.000Z",
    "startDate": "2019-05-16T00:00:00Z",
    "endDate": "2019-05-24T00:00:00Z",
    "pricingMethod": "FIXED_MONTHLY",
    "currency": "CAD",
    "monthlyPrice": 20.0,
    "effectiveDiscount": 92.39,
    "billableHoursPerMonth": 730,
    "billingDay": 16,
    "resourceCommitmentDetails": [
      {
        "id": "08125b3c-3b25-4585-910b-c1a0dc53010a",
        "name": "CustomDoF",
        "primaryType": "6",
        "secondaryType": "CustomDoF",
        "commitment": 0,
        "discountPercent": 0,
        "unit": "gigabyte",
        "labelKey": "cloudstack.volume"
      },
      {
        "id": "0bf1a48d-f807-4821-8247-2eb9a3128091",
        "primaryType": "3",
        "commitment": 0,
        "discountPercent": 0,
        "unit": "unit",
        "labelKey": "cloudstack.ipAddress"
      },
      { ... },
      { ... },
      { ... }
    ],
    "serviceConnection": {
      "name": "dev1-cloudstack",
      "id": "cb511a38-eab5-4a2e-969b-04e129c98415",
      "type": "cloudstack"
    },
    "organization": {
      "name": "System",
      "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
    },
    "version": 1,
    "deleted": false
  }
}
```

Retrieve a specific resource commitment you have access to. You can only retrieve the resource commitment if you have either the `Usage: View` permission on the organization in which the commitment is defined or the `Commitments: Manage` permission.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the resource commitment.
`displayName`<br/>*string* | The name of the resource commitment.
`creationDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the resource commitment was created.
`startDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) from when the resource commitment becomes active.
`endDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) until when the resource commitment will be active.<br/>*optional*: `if not present then the commitment has no end date`
`pricingMethod`<br/>*string* | One of the two following options that define how the effective price for the resource commitment is calculated.<br/>*FIXED_MONTHLY*: `a fixed price per billing cycle`<br/>*VARIABLE_UTILITY_DISCOUNT*: `pricing with custom discount on specific resources`
`currency`<br/>*string* | The currency type based on which the pricing is defined.
`monthlyPrice`<br/>*number* | The effective monthly price for this resource commitment.
`effectiveDiscount`<br/>*number* | The effective discount on this resource commitment.
`billableHoursPerMonth`<br/>*number* | The number hours per month based on which the monthly price is calculated.<br/>*optional*: `not present if the pricing method is FIXED_MONTHLY`
`billingDay`<br/>*number* | The day of the month based on which the billing cycle is calculated.
`resourceCommitmentDetails`<br/>*Array [Commitment detail]* | The resources on which different commitment levels _(and discounts)_ have been set.<br/>*includes*: `id`, `name`, `primaryType`, `secondaryType`, `commitment`, `discountPercent`, `unit`, `labelKey`
`organization`<br/>*[Organization](#administration-organizations)* | The organization on whose connection the resource commitment is defined.<br/>*includes*: `id`, `name`
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection on which the resource commitment is defined.<br/>*includes*: `id`, `name`, `type`

<!-------------------- CREATE A RESOURCE COMMITMENT -------------------->


### Create a resource commitment

`POST /resource_commitments`

```shell
# Create a resource commitment

curl -X POST "https://cloudmc_endpoint/api/v1/resource_commitments" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
  "displayName": "NEW-RESOURCE-COMMITMENT",
  "startDate": "2019-05-16T00:00:00Z",
  "endDate": "2019-05-24T00:00:00Z",
  "pricingMethod": "FIXED_MONTHLY",
  "currency": "CAD",
  "monthlyPrice": 20.0,
  "billableHoursPerMonth": 730,
  "billingDay": 16,
  "resourceCommitmentDetails": [
    {
      "primaryType": "6",
      "secondaryType": "CustomDoF",
      "commitment": 0,
      "discountPercent": 0,
    },
    {
      "primaryType": "3",
      "commitment": 0,
      "discountPercent": 0,
    },
    { ... },
    { ... },
    { ... }
  ],
  "serviceConnection": {
    "id": "cb511a38-eab5-4a2e-969b-04e129c98415"
  },
  "organization": {
    "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
  },
}
```

Create a new resource commitment defined on a service connection. You will need the `Commitments: Manage` permission to execute this operation.

Required | &nbsp;
-------- | -----------
`displayName`<br/>*string* | The name of the resource commitment.
`startDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) from when the resource commitment becomes active.
`endDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) until when the resource commitment will be active.<br/>*optional*: `if not present then the commitment has no end date`
`pricingMethod`<br/>*string* | One of the two following options that define how the effective price for the resource commitment is calculated.<br/>*FIXED_MONTHLY*: `a fixed price per billing cycle`<br/>*VARIABLE_UTILITY_DISCOUNT*: `pricing with custom discount on specific resources`
`currency`<br/>*string* | The currency type based on which the pricing is defined.
`monthlyPrice`<br/>*number* | The effective monthly price for this resource commitment.
`billableHoursPerMonth`<br/>*number* | The number hours per month based on which the monthly price is calculated.<br/>*optional*: `only required if the pricing method is VARIABLE_UTILITY_DISCOUNT`
`billingDay`<br/>*number* | The day of the month based on which the billing cycle is calculated.
`resourceCommitmentDetails`<br/>*Array [Commitment detail]* | The resources on which different commitment levels _(and discounts)_ have been set.<br/>*must include*: `primaryType`, `secondaryType`, `commitment`, `discountPercent`
`organization`<br/>*[Organization](#administration-organizations)* | The organization on whose connection the resource commitment is to be defined.<br/>*must include*: `id`
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection on which the resource commitment is to be defined.<br/>*must include*: `id`


The responses' `data` field contains the created [resource-commitment](#administration-retrieve-a-resource-commitment).


<!-------------------- UPDATE A RESOURCE COMMITMENT  -------------------->


### Update resource commitment

`PUT /resource_commitments/:id`

```shell
# Update a resource commitment

curl -X PUT "https://cloudmc_endpoint/api/v2/resource_commitments/fbgc7647-71e6-w69b-998a-c02rf58bf2e6" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
  "id": "ef17768a-c037-4a8a-8f12-f4595dd84ca0",
  "displayName": "COMMITMENT-TO-UPDATE",
  "startDate": "2019-06-06T00:00:00Z",
  "endDate": "2019-07-07T00:00:00Z",
  "pricingMethod": "FIXED_MONTHLY",
  "currency": "CAD",
  "billingDay": 6,
  "monthlyPrice": 335,
  "billableHoursPerMonth": 730,
  "resourceCommitmentDetails": [
    {
      "id": "125e01c7-6486-46be-8cb8-f0da46c7dbbd",
      "commitment": 5,
      "primaryType": "1",
      "secondaryType": "5d94cfdc-87cf-4f0a-9083-bf92e5caa2cd_mem",
      "discountPercent": 0
    },
    {
      "id": "6293b5ba-4fa2-49c7-b51d-4129ae0ae340",
      "commitment": 5,
      "primaryType": "1",
      "secondaryType": "c85a8899-e2b7-4786-9304-481533665215",
      "discountPercent": 0
    },
    { ... },
    { ... },
    { ... }
  ],
  "creationDate": "2019-06-06T20:06:28.000Z",
  "organization": {
    "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
  },
  "serviceConnection": {
    "id": "cb511a38-eab5-4a2e-969b-04e129c98415"
  }
}
```


Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the resource commitment.
`displayName`<br/>*string* | The name of the resource commitment.
`startDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) from when the resource commitment becomes active.
`endDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) until when the resource commitment will be active.<br/>*optional*: `if not present then the commitment has no end date`
`pricingMethod`<br/>*string* | One of the two following options that define how the effective price for the resource commitment is calculated.<br/>*FIXED_MONTHLY*: `a fixed price per billing cycle`<br/>*VARIABLE_UTILITY_DISCOUNT*: `pricing with custom discount on specific resources`
`currency`<br/>*string* | The currency type based on which the pricing is defined.
`monthlyPrice`<br/>*number* | The effective monthly price for this resource commitment.
`billableHoursPerMonth`<br/>*number* | The number hours per month based on which the monthly price is calculated.<br/>*optional*: `only required if the pricing method is VARIABLE_UTILITY_DISCOUNT`
`billingDay`<br/>*number* | The day of the month based on which the billing cycle is calculated.
`resourceCommitmentDetails`<br/>*Array [Commitment detail]* | The resources on which different commitment levels _(and discounts)_ have been set.<br/>*includes*: `id`, `primaryType`, `secondaryType`, `commitment`, `discountPercent`
`organization`<br/>*[Organization](#administration-organizations)* | The organization on whose connection the resource commitment to be edited is defined.<br/>*includes*: `id`
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection on which the resource commitment to be edited is defined.<br/>*includes*: `id`


The responses' `data` field contains the created [resource-commitment](#administration-retrieve-a-resource-commitment). You will need the `Commitments: Manage` permission to execute this operation.

<!-------------------- DELETE A RESOURCE COMMITMENT -------------------->


### Delete resource commitment

`DELETE /resource_commitments/:id`

```shell
# Delete a resource commitment

curl "https://cloudmc_endpoint/api/v2/resource_commitments/fbgc7647-71e6-w69b-998a-c02rf58bf2e6" \
   -X DELETE -H "MC-Api-Key: your_api_key"
```

Delete a specific resource commitment. You will need a [role](#administration-roles) with the `Commitments: Manage` permission to execute this operation.
