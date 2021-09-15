### Tax providers

A tax provider enables a reseller to map tax codes to monetization products. The tax code provider type will ensure that invoices include taxes based 
on the billing details (i.e. billing address) provided by the reseller. 

<!-------------------- LIST TAX PROVIDERS -------------------->
#### List tax providers

`GET /tax_providers`

Retrieves a list of tax providers configured for a reseller.

```shell
# Retrieve tax providers
curl "https://cloudmc_endpoint/rest/tax_providers" \
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
`reseller.id`<br/>*UUID* | UUID of the reseller to which the tax provider belongs. (AKA an organization id that is a reseller)
`type`<br/>*string* | The type of tax provider. Possible values are: `AVALARA`.
`state`<br/>*enum"  | The state of the tax provider. Possible values are: `CONFIGURED`, `CONFIGURING`, `ERROR`
`createdDate`<br/>*string* | The date the tax provider was created.
`updatedDate`<br/>*string* | The last date the tax provider was updated.
`configurationAttributes`<br/>*Object* | The configuration attributes associated to the provider type. This depends on the provider type.


<!-------------------- GET TAX PROVIDER -------------------->
#### Get a tax provider

`GET /tax_providers/:id`

Retrieves a list of tax providers configured for a reseller.

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
`reseller.id`<br/>*UUID* | UUID of the reseller to which the tax provider belongs. (AKA an organization id that is a reseller)
`type`<br/>*string* | The type of tax provider. Possible values are: `AVALARA`.
`state`<br/>*enum"  | The state of the tax provider. Possible values are: `CONFIGURED`, `CONFIGURING`, `ERROR`
`createdDate`<br/>*string* | The date the tax provider was created.
`updatedDate`<br/>*string* | The last date the tax provider was updated.
`configurationAttributes`<br/>*Object* | The configuration attributes associated to the provider type. This depends on the provider type.