### Tax providers

A tax provider enables a reseller to map tax codes to monetization products. The tax code provider will ensure that invoices include taxes based
on the billing details (i.e. billing address) and mapping of tax codes to product offerings provided by the reseller.

<!-------------------- LIST TAX PROVIDERS -------------------->

#### List tax providers

`GET /tax_providers`

Retrieves a list of tax providers configured for a reseller.

> Note: You must have the Reseller billing permission on the target reseller. If the caller does not have the correct permissions or the reseller with the ID provided does not exist then a `404 Not Found` response will be returned.

```shell
# Retrieve tax providers
curl "https://cloudmc_endpoint/rest/tax_providers?reseller_id=23910576-d29f-4c14-b663-31d728ff49a5" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "f26e66a4-755c-4867-b565-ad68aa515237",
      "reseller": {
        "id": "23910576-d29f-4c14-b663-31d728ff49a5"
      },
      "type": "AVALARA",
      "createdDate": "2021-05-07T19:21:20Z",
      "updatedDate": "2021-05-07T19:21:20Z",
      "configurationAttributes": {
        "companyId": "acme",
        "username": "username",
        "password" "password"
      }
    }
  ]
}
```

| Attributes                             | &nbsp;                                                                                              |
| -------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                        | The UUID of the tax provider.                                                                       |
| `reseller.id`<br/>_UUID_               | UUID of the reseller to which the tax provider belongs (AKA an organization id that is a reseller). |
| `type`<br/>_string_                    | The type of tax provider. Possible values are: `AVALARA`.                                           |
| `state`<br/>\*enum"                    | The state of the tax provider. Possible values are: `CONFIGURED`, `CONFIGURING`, `ERROR`.           |
| `createdDate`<br/>_string_             | The date the tax provider was created.                                                              |
| `updatedDate`<br/>_string_             | The last date the tax provider was updated.                                                         |
| `configurationAttributes`<br/>_Object_ | The configuration attributes associated to the provider type. This depends on the provider type.    |

<!-------------------- GET TAX PROVIDER -------------------->

#### Get a tax provider

`GET /tax_providers/:id`

Retrieves a list of tax providers configured for a reseller.

> Note: You must have the Reseller billing permission on the owner of the tax provider requested. If the caller does not have the correct permissions or the tax provider for the given ID does not exist, then a `404 Not Found` response will be returned.

```shell
# Retrieve a specific tax provider
curl "https://cloudmc_endpoint/rest/tax_providers/f26e66a4-755c-4867-b565-ad68aa515237" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "f26e66a4-755c-4867-b565-ad68aa515237",
    "reseller": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5"
    },
    "type": "AVALARA",
    "createdDate": "2021-05-07T19:21:20Z",
    "updatedDate": "2021-05-07T19:21:20Z",
    "configurationAttributes": {
      "companyId": "acme",
      "username": "username",
      "password" "password"
    }
  }
}
```

| Attributes                             | &nbsp;                                                                                              |
| -------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                        | The UUID of the tax provider.                                                                       |
| `reseller.id`<br/>_UUID_               | UUID of the reseller to which the tax provider belongs (AKA an organization id that is a reseller). |
| `type`<br/>_string_                    | The type of tax provider. Possible values are: `AVALARA`.                                           |
| `state`<br/>\*enum"                    | The state of the tax provider. Possible values are: `CONFIGURED`, `CONFIGURING`, `ERROR`.           |
| `createdDate`<br/>_string_             | The date the tax provider was created.                                                              |
| `updatedDate`<br/>_string_             | The last date the tax provider was updated.                                                         |
| `configurationAttributes`<br/>_Object_ | The configuration attributes associated to the provider type. This depends on the provider type.    |

<!-------------------- GET TAX CODES FROM PROVIDER -------------------->

#### Get tax codes for a given reseller organization

`GET /tax_providers/:id/tax-codes`

Retrieves a list of tax codes from the configured tax provider for a reseller organization.

> Note: You must have the Reseller billing permission on the owner of the tax provider requested. If the caller does not have the correct permissions or the tax provider is not configured for the given organization ID or the organization does not exist, then a `404 Not Found` response will be returned. The required ID in the URL is the ID of the reseller organization for which the tax codes are being fetched.

```shell
# Retrieve tax codes for a given organization
curl "https://cloudmc_endpoint/rest/tax_providers/f26e66a4-755c-4867-b565-ad68aa515237/tax-codes" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "code": "SW054101",
      "description": "Cloud Services - SaaS - Service Agreement - Database Products"
    },
    {
      "code": "SW053004",
      "description": "Cloud Services - SaaS - License Agreement - for business use only"
    },
    {
      "code": "SW056003",
      "description": "Cloud Services / Platform as a Service (PaaS)"
    }
  ]
}
```

| Attributes                 | &nbsp;                           |
| -------------------------- | -------------------------------- |
| `code`<br/>_string_        | The code of the tax.             |
| `description`<br/>_string_ | The description of the tax code. |

<!-------------------- CREATE TAX PROVIDER -------------------->

#### Create a tax provider

`POST /tax_providers/`

Creates a tax provider for the given reseller

> Note: You must have the Reseller billing permission on the owner of the tax provider requested. If the caller does not have the correct permissions or the tax provider for the given ID does not exist, then a `404 Not Found` response will be returned.

```shell
# Create a tax provider
curl "https://cloudmc_endpoint/rest/tax_providers" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
  "reseller": {
    "id": "174cace2-ad04-47c7-9429-e180bb44cf71"
  },
  "type": "AVALARA",
  "configurationAttributes": {
    "environment": "Production",
    "username": "email@cloudops.com",
    "password": "password",
    "companyId": "1148191"
  },
  "address": {
    "lineOne": "420 GUY ST",
    "lineTwo": "",
    "city": "MONTREAL",
    "province": "QC",
    "country": "CA",
    "postalCode": "H3J 1S6"
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "address": {
      "country": "CA",
      "lineTwo": "",
      "province": "QC",
      "city": "MONTREAL",
      "postalCode": "H3J 1S6",
      "lineOne": "420 GUY ST"
    },
    "reseller": {
      "id": "174cace2-ad04-47c7-9429-e180bb44cf71"
    },
    "configurationAttributes": {
      "environment": "Production",
      "password": "password",
      "companyId": "1148191",
      "username": "email@cloudops.com"
    },
    "id": "961a2b96-0a6a-4bb4-9e32-59a3dcc555aa",
    "state": "CONFIGURING",
    "type": "AVALARA"
  },
  "taskId": "eea0cf4d-47fc-4f5d-b227-863502486192",
  "taskStatus": "PENDING"
}
```

| Attributes                             | &nbsp;                                                                                              |
| -------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `reseller.id`<br/>_UUID_               | UUID of the reseller to which the tax provider belongs (AKA an organization id that is a reseller). |
| `type`<br/>_string_                    | The type of tax provider. Possible values are: `AVALARA`.                                           |
| `configurationAttributes`<br/>_Object_ | The configuration attributes associated to the provider type. This depends on the provider type.    |
| `address.lineOne`<br/>_string_         | The address line 1 of the reseller.                                                                 |
| `address.lineTwo`<br/>_string_         | The address line 2 of the reseller.                                                                 |
| `address.city`<br/>_string_            | The city name of the reseller.                                                                      |
| `address.province`<br/>_string_        | The province of the reseller.                                                                       |
| `address.country`<br/>_string_         | The country of the reseller.                                                                        |
| `address.postalCode`<br/>_string_      | The postal code of the reseller.                                                                    |

<!-------------------- UPDATE TAX PROVIDER -------------------->

#### Update a tax provider

`PUT /tax_providers/:id`

Updates a tax provider for the given reseller

> Note: You must have the Reseller billing permission on the owner of the tax provider requested. If the caller does not have the correct permissions or the tax provider for the given ID does not exist, then a `404 Not Found` response will be returned.

```shell
# Update a tax provider
curl "https://cloudmc_endpoint/rest/tax_providers/961a2b96-0a6a-4bb4-9e32-59a3dcc555aa" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
  "reseller": {
    "id": "174cace2-ad04-47c7-9429-e180bb44cf71"
  },
  "type": "AVALARA",
  "configurationAttributes": {
    "environment": "Production",
    "username": "email@cloudops.com",
    "password": "password",
    "companyId": "1148191"
  },
  "address": {
    "lineOne": "420 GUY ST",
    "lineTwo": "",
    "city": "MONTREAL",
    "province": "QC",
    "country": "CA",
    "postalCode": "H3J 1S6"
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "address": {
      "country": "CA",
      "lineTwo": "",
      "province": "QC",
      "city": "MONTREAL",
      "postalCode": "H3J 1S6",
      "lineOne": "420 GUY ST"
    },
    "reseller": {
      "id": "174cace2-ad04-47c7-9429-e180bb44cf71"
    },
    "createdDate": "2021-05-07T19:21:20Z",
    "updatedDate": "2021-05-07T19:21:20Z",
    "configurationAttributes": {
      "environment": "Production",
      "password": "password",
      "companyId": "1148191",
      "username": "email@cloudops.com"
    },
    "id": "961a2b96-0a6a-4bb4-9e32-59a3dcc555aa",
    "state": "CONFIGURING",
    "type": "AVALARA"
  },
  "taskId": "eea0cf4d-47fc-4f5d-b227-863502486192",
  "taskStatus": "PENDING"
}
```

| Attributes                             | &nbsp;                                                                                              |
| -------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `reseller.id`<br/>_UUID_               | UUID of the reseller to which the tax provider belongs (AKA an organization id that is a reseller). |
| `type`<br/>_string_                    | The type of tax provider. Possible values are: `AVALARA`.                                           |
| `configurationAttributes`<br/>_Object_ | The configuration attributes associated to the provider type. This depends on the provider type.    |
| `address.lineOne`<br/>_string_         | The address line 1 of the reseller.                                                                 |
| `address.lineTwo`<br/>_string_         | The address line 2 of the reseller.                                                                 |
| `address.city`<br/>_string_            | The city name of the reseller.                                                                      |
| `address.province`<br/>_string_        | The province of the reseller.                                                                       |
| `address.country`<br/>_string_         | The country of the reseller.                                                                        |
| `address.postalCode`<br/>_string_      | The postal code of the reseller.                                                                    |
| `createdDate`<br/>_string_             | The date the tax provider was created.                                                              |
| `updatedDate`<br/>_string_             | The last date the tax provider was updated.                                                         |


#### Verify an organization's reseller tax configuration

`GET /tax_providers/:id/tax-provider-configured`

This endpoint verifies whether or not a given organization's reseller parent organization has configured a tax provider.

```shell
# Verify an organization's reseller tax configuration
curl "https://cloudmc_endpoint/rest/tax_providers/961a2b96-0a6a-4bb4-9e32-59a3dcc555aa/tax-provider-configured" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:
```json
{
  "data": true
}
```

| Path Parameters                 | &nbsp;                           |
| -------------------------- | -------------------------------- |
| `id`<br/>_UUID_        | The id of the organization to verify the tax configuration for.             |

| Attributes                 | &nbsp;                           |
| -------------------------- | -------------------------------- |
| `data`<br/>_boolean_        | Whether or not the specified organization's reseller parent has a tax provider configured             |

