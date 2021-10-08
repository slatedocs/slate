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

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the tax provider.
`reseller.id`<br/>*UUID* | UUID of the reseller to which the tax provider belongs (AKA an organization id that is a reseller).
`type`<br/>*string* | The type of tax provider. Possible values are: `AVALARA`.
`state`<br/>*enum"  | The state of the tax provider. Possible values are: `CONFIGURED`, `CONFIGURING`, `ERROR`.
`createdDate`<br/>*string* | The date the tax provider was created.
`updatedDate`<br/>*string* | The last date the tax provider was updated.
`configurationAttributes`<br/>*Object* | The configuration attributes associated to the provider type. This depends on the provider type.


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

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the tax provider.
`reseller.id`<br/>*UUID* | UUID of the reseller to which the tax provider belongs (AKA an organization id that is a reseller).
`type`<br/>*string* | The type of tax provider. Possible values are: `AVALARA`.
`state`<br/>*enum"  | The state of the tax provider. Possible values are: `CONFIGURED`, `CONFIGURING`, `ERROR`.
`createdDate`<br/>*string* | The date the tax provider was created.
`updatedDate`<br/>*string* | The last date the tax provider was updated.
`configurationAttributes`<br/>*Object* | The configuration attributes associated to the provider type. This depends on the provider type.


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

Attributes | &nbsp;
---- | -----------
`code`<br/>*string* | The code of the tax.
`description`<br/>*string* | The description of the tax code.