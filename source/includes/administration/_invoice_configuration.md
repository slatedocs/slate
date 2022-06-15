### Invoice Generation Configuration

Allows you to order different invoicing steps before or after taxes when generating an invoice.

<!-------------------- FIND INVOICE CONFIG -------------------->

#### Find the invoice configuration associated to an organization

`GET /reseller/settings/invoice-config/find?organizationId=:id`

Retrieve the invoice configuration associated to an organization. If the `organizationId` is omitted, the authenticated user's organization will be used.

```shell
# Retrieve the invoice configuration
curl "https://cloudmc_endpoint/api/v2/reseller/settings/invoice-config/find?organizationId=10572c3d-16e5-450f-8af8-a01e50dc52d4" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d73b5380-cbcc-4b96-9a2e-1448edbf895c",
    "steps": [
      {
        "scope": "ALL_PRODUCTS",
        "beforeTax": false,
        "type": "CREDIT"
      },
      {
        "scope": "PRODUCTS",
        "beforeTax": false,
        "type": "CREDIT"
      },
      {
        "scope": "ALL_PRODUCTS",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "PRODUCTS",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "CATEGORIES",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "CATEGORIES",
        "beforeTax": true,
        "type": "CREDIT"
      }
    ],
    "version": 4
  }
}
```

Retrieve the invoice configuration associated to an organization.
It returns a default configuration if none is configured for the specified organization.

| Attributes                   | &nbsp;                                                                                                                                                                                                                                                                                    |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*UUID*              | The invoice configuration id.                                                                                                                                                                                                                                                             |
| `organization.id`<br/>*UUID* | The organization id that the invoice configuration is linked to.                                                                                                                                                                                                                          |
| `version`<br/>*integer*      | The invoice configuration version.                                                                                                                                                                                                                                                        |
| `steps`<br/>*Array[Object]*  | The list of invoicing steps. It consists of the cross product between the adjustments type [CREDIT, PERCENTAGE] and their scope [PRODCUTS, CATEGORIES, ALL_PRODUCT] as well as a boolean specifying if this steps needs to be processed before or after taxes when generating an invoice. |

<!-------------------- GET INVOICE CONFIGURATION -------------------->
#### Retrieve invoice configuration

`GET /reseller/settings/invoice-config/:id`

```shell
# Retrieve invoice configuration
curl "https://cloudmc_endpoint/api/v2/reseller/settings/invoice-config/f7ad28a8-1227-44de-9785-6dbd556f3bda" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d73b5380-cbcc-4b96-9a2e-1448edbf895c",
    "steps": [
      {
        "scope": "ALL_PRODUCTS",
        "beforeTax": false,
        "type": "CREDIT"
      },
      {
        "scope": "PRODUCTS",
        "beforeTax": false,
        "type": "CREDIT"
      },
      {
        "scope": "ALL_PRODUCTS",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "PRODUCTS",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "CATEGORIES",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "CATEGORIES",
        "beforeTax": true,
        "type": "CREDIT"
      }
    ],
    "version": 4
  }
}
```

Retrieve the invoice configuration using the provided id.

| Attributes                   | &nbsp;                                                                                                                                                                                                                                                                                    |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*UUID*              | The invoice configuration id.                                                                                                                                                                                                                                                             |
| `organization.id`<br/>*UUID* | The organization id that the invoice configuration is linked to.                                                                                                                                                                                                                          |
| `version`<br/>*integer*      | The invoice configuration version.                                                                                                                                                                                                                                                        |
| `steps`<br/>*Array[Object]*  | The list of invoicing steps. It consists of the cross product between the adjustments type [CREDIT, PERCENTAGE] and their scope [PRODCUTS, CATEGORIES, ALL_PRODUCT] as well as a boolean specifying if this steps needs to be processed before or after taxes when generating an invoice. |


<!-------------------- CREATE INVOICE CONFIGURATION -------------------->
#### Create invoice configuration

`POST /reseller/settings/invoice-config`

Create new invoice configuration.

```shell
# Creates a new invoice configuration
curl -X POST "https://cloudmc_endpoint/api/v2/reseller/settings/invoice-config" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
  "organization": {
    "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
  },
  "steps": [
    {
      "scope": "ALL_PRODUCTS",
      "beforeTax": false,
      "type": "CREDIT"
    },
    {
      "scope": "PRODUCTS",
      "beforeTax": false,
      "type": "CREDIT"
    },
    {
      "scope": "ALL_PRODUCTS",
      "beforeTax": true,
      "type": "PERCENTAGE"
    },
    {
      "scope": "PRODUCTS",
      "beforeTax": true,
      "type": "PERCENTAGE"
    },
    {
      "scope": "CATEGORIES",
      "beforeTax": true,
      "type": "PERCENTAGE"
    },
    {
      "scope": "CATEGORIES",
      "beforeTax": true,
      "type": "CREDIT"
    }
  ]
}
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d73b5380-cbcc-4b96-9a2e-1448edbf895c",
    "steps": [
      {
        "scope": "ALL_PRODUCTS",
        "beforeTax": false,
        "type": "CREDIT"
      },
      {
        "scope": "PRODUCTS",
        "beforeTax": false,
        "type": "CREDIT"
      },
      {
        "scope": "ALL_PRODUCTS",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "PRODUCTS",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "CATEGORIES",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "CATEGORIES",
        "beforeTax": true,
        "type": "CREDIT"
      }
    ],
    "version": 4
  }
}
```

| Required                     | &nbsp;                                                                                                                                                                                                                                                                                    |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*UUID*              | The invoice configuration id.                                                                                                                                                                                                                                                             |                                                                                                                                                                                                                        |
| `version`<br/>*integer*      | The invoice configuration version.                                                                                                                                                                                                                                                        |
| `steps`<br/>*Array[Object]*  | The list of invoicing steps. It consists of the cross product between the adjustments type [CREDIT, PERCENTAGE] and their scope [PRODCUTS, CATEGORIES, ALL_PRODUCT] as well as a boolean specifying if this steps needs to be processed before or after taxes when generating an invoice. |

| Optional                     | &nbsp;                                                                                                                              |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| `organization.id`<br/>*UUID* | The organization id the invoice configuration is created for. If not provided, it defaults to the authenticated user's organization |


<!-------------------- UPDATE INVOICE CONFIGURATION -------------------->
#### Update invoice configuration

`PUT /reseller/settings/invoice-config/:id`

Updates the invoice configuration of an organization.

```shell
# Updates an existing invoice configuration for an organization
curl -X PUT "https://cloudmc_endpoint/api/v2/reseller/settings/invoice-config/d73b5380-cbcc-4b96-9a2e-1448edbf895c \
   -H "MC-Api-Key: your_api_key"
   -H "Content-Type: application/json" \
   -d "request-body"
```

> Request body example:

```json
{
  "organization": {
    "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
  },
  "id": "d73b5380-cbcc-4b96-9a2e-1448edbf895c",
  "steps": [
    {
      "scope": "ALL_PRODUCTS",
      "beforeTax": false,
      "type": "CREDIT"
    },
    {
      "scope": "PRODUCTS",
      "beforeTax": false,
      "type": "CREDIT"
    },
    {
      "scope": "ALL_PRODUCTS",
      "beforeTax": true,
      "type": "PERCENTAGE"
    },
    {
      "scope": "PRODUCTS",
      "beforeTax": true,
      "type": "PERCENTAGE"
    },
    {
      "scope": "CATEGORIES",
      "beforeTax": true,
      "type": "PERCENTAGE"
    },
    {
      "scope": "CATEGORIES",
      "beforeTax": true,
      "type": "CREDIT"
    }
  ]
}
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d73b5380-cbcc-4b96-9a2e-1448edbf895c",
    "steps": [
      {
        "scope": "ALL_PRODUCTS",
        "beforeTax": false,
        "type": "CREDIT"
      },
      {
        "scope": "PRODUCTS",
        "beforeTax": false,
        "type": "CREDIT"
      },
      {
        "scope": "ALL_PRODUCTS",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "PRODUCTS",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "CATEGORIES",
        "beforeTax": true,
        "type": "PERCENTAGE"
      },
      {
        "scope": "CATEGORIES",
        "beforeTax": true,
        "type": "CREDIT"
      }
    ],
    "version": 4
  }
}
```

| Attributes                   | &nbsp;                                                                                                                                                                                                                                                                                    |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*UUID*              | The invoice configuration id.                                                                                                                                                                                                                                                             |
| `organization.id`<br/>*UUID* | The organization id that the invoice configuration is linked to.                                                                                                                                                                                                                          |
| `version`<br/>*integer*      | The invoice configuration version.                                                                                                                                                                                                                                                        |
| `steps`<br/>*Array[Object]*  | The list of invoicing steps. It consists of the cross product between the adjustments type [CREDIT, PERCENTAGE] and their scope [PRODCUTS, CATEGORIES, ALL_PRODUCT] as well as a boolean specifying if this steps needs to be processed before or after taxes when generating an invoice. |


<!-------------------- DELETE INVOICE CONFIGURATION -------------------->
#### Delete invoice configuration

`DELETE /reseller/settings/invoice-config/:id`

Delete an existing invoice configuration.

```shell
curl -X DELETE "https://cloudmc_endpoint/api/v2/reseller/settings/invoice-config/d785ffcb-9b03-478d-a49b-52a2ccedf1b8" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "26022b83-9797-44c0-883c-7e82ecb757e9",
  "taskStatus": "SUCCESS"
}
```
