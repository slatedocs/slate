### Billing providers

The billing providers are the different payment processing tools that can be used to charge organizations.

<!-------------------- LIST BILLING PROVIDERS -------------------->
#### List billing providers

`GET /billing_providers`

Retrieves a list of billing providers configured in the system.

```shell
# Retrieve billing providers list
curl "https://cloudmc_endpoint/rest/billing_providers" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "f26e66a4-755c-4867-b565-ad68aa515237",
      "organization": {
        "id": "23910576-d29f-4c14-b663-31d728ff49a5"
      },
      "name": "Chase Credit Card (Dev)",
      "type": "CREDIT_CARD",
      "providerType": "chaseCreditCard",
      "createdDate": "2021-05-07T19:21:20Z",
      "updatedDate": "2021-05-07T19:21:20Z",
      "defaultForType": true,
      "configurationAttributes": {
        "creditCards": "American Express,MasterCard,Visa,Discover"
      }
    }
  ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the billing provider.
`organization.id`<br/>*UUID* | UUID of the organization to which belongs the billing provider. This can only be a organization which is root or reseller.
`name`<br/>*string* | The name of the billing provider object.
`type`<br/>*string* | The type of billing provider. Possible values are: `CREDIT_CARD`.
`providerType`<br/>*string* | The provider for the associated type.
`createdDate`<br/>*string* | The date the billing provider was created.
`updatedDate`<br/>*string* | The last date the billing provider was updated.
`defaultForType`<br/>*UUID* | If this billing provider is the default for the specified type.
`configurationAttributes`<br/>*Object* | The configuration attribute associated to the provider type. [See possible values](#administration-provider-type-configuration-attribute)


<!-------------------- GET BILLING PROVIDER -------------------->
#### Retrieve a billing provider

`GET /billing_providers/:id`

Retrieve a billing provider's details.

```shell
# Retrieve a billing provider's details
curl "https://cloudmc_endpoint/rest/billing_providers/f26e66a4-755c-4867-b565-ad68aa515237" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "f26e66a4-755c-4867-b565-ad68aa515237",
    "organization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5"
    },
    "name": "Chase Credit Card (Dev)",
    "type": "CREDIT_CARD",
    "providerType": "chaseCreditCard",
    "createdDate": "2021-05-07T19:21:20Z",
    "updatedDate": "2021-05-07T19:21:20Z",
    "defaultForType": true,
    "configurationAttributes": {
      "creditCards": "American Express,MasterCard,Visa,Discover"
    }
  }
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the billing provider.
`organization.id`<br/>*UUID* | UUID of the organization to which belongs the billing provider. This can only be a organization which is root or reseller.
`name`<br/>*string* | The name of the billing provider object.
`type`<br/>*string* | The type of billing provider. Possible values are: `CREDIT_CARD`.
`providerType`<br/>*string* | The provider for the associated type.
`createdDate`<br/>*string* | The date the billing provider was created.
`updatedDate`<br/>*string* | The last date the billing provider was updated.
`defaultForType`<br/>*UUID* | If this billing provider is the default for the specified type.
`configurationAttributes`<br/>*Object* | The configuration attribute associated to the provider type. [See possible values](#administration-provider-type-configuration-attribute) 

<!-------------------- PROVIDER TYPE ATTRIBUTES -------------------->
#### Provider type configuration attribute

Here are the attributes for the `CREDIT_CARD` providers.

Provider | Attributes | &nbsp;
---- | ---- | -----------
all | `creditCards`<br/>*string* | The type of credit card accepted. This is a comma separated field.

<!-------------------- CREATE BILLING PROVIDER -------------------->

#### Create a billing provider

`POST /billing_providers`

Create a new billing provider.

```shell
# Creates a new billing provider
curl -X POST "https://cloudmc_endpoint/rest/billing_providers" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
  "name": "Chase Credit Card (Dev)",
	"organization": {
			"id": "23910576-d29f-4c14-b663-31d728ff49a5"
	},
	"type": "CREDIT_CARD",
  "providerType": "chaseCreditCard",
	"configurationAttributes": {
		"creditCards": "Visa, Mastercard, American Express, Discover"
	} 
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "createdDate": "2021-05-17T19:59:33.387453Z",
    "organization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5"
    },
    "name": "testing API",
    "configurationAttributes": {
      "creditCards": "Visa, Mastercard, American Express, Discover"
    },
    "defaultForType": false,
    "id": "8db7cd13-b309-4fb9-b022-1632dbd165d0",
    "updatedDate": "2021-05-17T19:59:33.387477Z",
    "type": "CREDIT_CARD",
    "providerType": "chaseCreditCard"
  }
}
```

Required | &nbsp;
---------- | -----------
`name`<br/>*string* | The name of the billing provider object.
`organization.id`<br/>*UUID* | UUID of the organization to which belongs the billing provider. This can only be a organization which is root or reseller.
`type`<br/>*string* | The type of billing provider. Possible values are: `CREDIT_CARD`.
`providerType`<br/>*string* | The provider for the associated type.
`configurationAttributes`<br/>*Object* | The configuration attribute associated to the provider type. [See possible values](#administration-provider-type-configuration-attribute) 
`configurationAttributes.creditCards`<br/>*string* | The type of credit card accepted. This is a comma separated field.

<!-------------------- UPDATE IDPS -------------------->

#### Update billing provider

`PUT /billing_providers/:id`

Update an existing identity provider.

```shell
# Updates an existing identity provider
curl -X PUT "https://cloudmc_endpoint/rest/billing_providers/c84cfe41-929b-47c9-bde4-b55a10bd2774" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
  "name": "Chase Credit Card (Dev)",
	"organization": {
			"id": "23910576-d29f-4c14-b663-31d728ff49a5"
	},
	"type": "CREDIT_CARD",
  "providerType": "chaseCreditCard",
	"configurationAttributes": {
		"creditCards": "Visa, Mastercard, American Express, Discover"
	} 
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "createdDate": "2021-05-17T20:32:07Z",
    "organization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5"
	  },
    "name": "Chase Credit Card (Dev)",
    "configurationAttributes": {
      "creditCards": "Visa, MasterCard, American Express"
    },
    "defaultForType": false,
    "id": "c84cfe41-929b-47c9-bde4-b55a10bd2774",
    "updatedDate": "2021-05-17T21:09:49Z",
    "type": "CREDIT_CARD",
    "providerType": "chaseCreditCard"
  }
}
```

Required | &nbsp;
---------- | -----------
`name`<br/>*string* | The name of the billing provider object.
`organization.id`<br/>*UUID* | UUID of the organization to which belongs the billing provider. This can only be a organization which is root or reseller.
`type`<br/>*string* | The type of billing provider. Possible values are: `CREDIT_CARD`.
`providerType`<br/>*string* | The provider for the associated type.
`configurationAttributes`<br/>*Object* | The configuration attribute associated to the provider type. [See possible values](#administration-provider-type-configuration-attribute) 
`configurationAttributes.creditCards`<br/>*string* | The type of credit card accepted. This is a comma separated field.

<!-------------------- DELETE BILLING PROVIDER -------------------->
#### Delete a billing provider

`DELETE /billing_providers/:id`


```shell
curl --request DELETE \
  --url https://cloudmc_endpoint/rest/billing_providers/f9a2b02b-7d67-4910-8353-c4bfcbdeaa7e \
  --header "Content-Type: application/json" \
  --header "Mc-Api-Key: your_api_key" 
```

Delete a billing provider.