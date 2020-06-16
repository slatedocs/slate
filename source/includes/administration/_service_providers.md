## Service Providers
Configure the service providers that can use CloudMC as their authentication source.

<!-------------------- LIST SERVICE PROVIDERS -------------------->

### List service providers

`GET /service_providers`

```shell
# Retrieve service providers
curl "https://cloudmc_endpoint/v1/service_providers" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "name": "Slack",
      "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
      "type": "SAML",
      "config": {
        "assertionConsumerUrl": "issuer.com",
        "nameIdFormat": "UNSPECIFIED",
        "responseAttributes": [
          {
            "nameFormat": "UNSPECIFIED",
            "attributeName": "username",
            "attributeValueField": {
              "fieldName": "firstName",
              "sourceModel": "user"
            }
          }
        ],
        "sign": "RESPONSE",
        "serviceProviderIssuer": "slack"
      }
    }
  ]
}
```
List the service providers configured on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the service provider.
`name`<br/>*string* | The name of the service provider.
`type`<br/>*string* | The type of service provider. Possible values are : SAML.
`config`<br/>*Object* | The object containing the configuration of the service provider.
`config.serviceProviderIssuer`<br/>*string* | The issuer for the service provider. This is what is contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.
`config.assertionConsumerUrl`<br/>*string* | The URL where the response is sent.
`config.sign`<br/>*string* | How the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE.
`config.nameIdFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT.
`config.responseAttributes`<br/>*Array[Object]* | The list of attributes part of the response
`config.responseAttributes.nameFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC. 
`config.responseAttributes.attributeName`<br/>*string* | The attribute name
`config.responseAttributes.attributeValueField`<br/>*Object* | The object containing the source for the value in the response.
`config.responseAttributes.attributeValueField.sourceModel`<br/>*string* | The model object to get the value from. Possible values are : ORGANIZATION, USER.
`config.responseAttributes.attributeValueField.fieldName`<br/>*string* | The field name to get the information from.



<!-------------------- GET SERVICE PROVIDERS -------------------->

### Retrieve service provider

`GET /service_provider/:id`

```shell
# Retrieve service providers
curl "https://cloudmc_endpoint/v1/service_providers/04b77783-516f-4064-a6df-e7f9cae222c1" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "name": "Slack",
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "type": "SAML",
    "config": {
      "assertionConsumerUrl": "issuer.com",
      "nameIdFormat": "UNSPECIFIED",
      "responseAttributes": [
        {
          "nameFormat": "UNSPECIFIED",
          "attributeName": "username",
          "attributeValueField": {
            "fieldName": "firstName",
            "sourceModel": "user"
          }
        }
      ],
      "sign": "RESPONSE",
      "serviceProviderIssuer": "slack"
    }
  }
}
```
Return the service provider configured associated to the id on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the service provider.
`name`<br/>*string* | The name of the service provider.
`type`<br/>*string* | The type of service provider. Possible values are : SAML.
`config`<br/>*Object* | The object containing the configuration of the service provider.
`config.serviceProviderIssuer`<br/>*string* | The issuer for the service provider. This is what is contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.
`config.assertionConsumerUrl`<br/>*string* | The URL where the response is sent.
`config.sign`<br/>*string* | How the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE.
`config.nameIdFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT.
`config.responseAttributes`<br/>*Array[Object]* | The list of attributes part of the response
`config.responseAttributes.nameFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC. 
`config.responseAttributes.attributeName`<br/>*string* | The attribute name
`config.responseAttributes.attributeValueField`<br/>*Object* | The object containing the source for the value in the response.
`config.responseAttributes.attributeValueField.sourceModel`<br/>*string* | The model object to get the value from. Possible values are : ORGANIZATION, USER.
`config.responseAttributes.attributeValueField.fieldName`<br/>*string* | The field name to get the information from.


<!-------------------- CREATE SERVICE PROVIDERS -------------------->

#### Create service provider

`POST /service_providers`

```shell
# Creates a new service provider
curl -X POST "https://cloudmc_endpoint/rest/service_providers" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
	"name": "Slack",
	"type": "SAML",
	"config": {
		"assertionConsumerUrl": "https://yourdomain.slack.com/sso/saml",
		"serviceProviderIssuer": "https://slack.com",
		"sign": "RESPONSE",
		"responseAttributes": [
			{
				"attributeName": "first-name",
				"attributeValueField": {
					"sourceModel": "user",
					"fieldName": "firstName"
				}
			}
		]
	}
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "name": "Slack",
    "id": "dbf3df1c-d28e-4cb5-bcb9-ce85d1675b27",
    "type": "SAML",
    "config": {
      "assertionConsumerUrl": "https://yourdomain.slack.com/sso/saml",
      "nameIdFormat": "UNSPECIFIED",
      "responseAttributes": [
        {
          "nameFormat": "UNSPECIFIED",
          "attributeName": "first-name",
          "attributeValueField": {
            "fieldName": "firstName",
            "sourceModel": "user"
          }
        }
      ],
      "name": "Slack",
      "sign": "RESPONSE",
      "serviceProviderIssuer": "https://slack.com"
    }
  }
}
```
Required | &nbsp;
---------- | -----------
`name`<br/>*string* | The name of the service provider.
`type`<br/>*string* | The type of service provider. Possible values are : SAML.
`config`<br/>*Object* | The object containing the configuration of the service provider.
`config.serviceProviderIssuer`<br/>*string* | The issuer for the service provider. This is what is contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.
`config.assertionConsumerUrl`<br/>*string* | The URL where the response is sent.
`config.sign`<br/>*string* | How the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE. Only required if `config.responseAttributes` is passed.
`config.responseAttributes.attributeName`<br/>*string* | The attribute name. Only required if `config.responseAttributes` is passed.
`config.responseAttributes.attributeValueField`<br/>*Object* | The object containing the source for the value in the response. Only required if `config.responseAttributes` is passed.
`config.responseAttributes.attributeValueField.sourceModel`<br/>*string* | The model object to get the value from. Possible values are : ORGANIZATION, USER. Only required if `config.responseAttributes` is passed.
`config.responseAttributes.attributeValueField.fieldName`<br/>*string* | The field name to get the information from. Only required if `config.responseAttributes` is passed.

Optional | &nbsp;
---------- | -----------
`config.nameIdFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT. If not provided this defaults to UNSPECIFIED.
`config.responseAttributes.nameFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC. If not provided this defaults to UNSPECIFIED.
`config.responseAttributes`<br/>*Array[Object]* | The list of attributes part of the response.

<!-------------------- UPDATE SERVICE PROVIDERS -------------------->

#### Update service provider

`PUT /service_providers/:id`

```shell
# Updates an existing service provider
curl -X POST "https://cloudmc_endpoint/rest/service_providers/:id" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
	"name": "Slack",
  "id": "dbf3df1c-d28e-4cb5-bcb9-ce85d1675b27",
	"type": "SAML",
	"config": {
		"assertionConsumerUrl": "https://yourdomain.slack.com/sso/saml",
		"serviceProviderIssuer": "https://slack.com",
		"sign": "RESPONSE",
		"responseAttributes": [
			{
				"attributeName": "first-name",
				"attributeValueField": {
					"sourceModel": "user",
					"fieldName": "firstName"
				}
			}
		]
	}
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "name": "Slack",
    "id": "dbf3df1c-d28e-4cb5-bcb9-ce85d1675b27",
    "type": "SAML",
    "config": {
      "assertionConsumerUrl": "https://yourdomain.slack.com/sso/saml",
      "nameIdFormat": "UNSPECIFIED",
      "responseAttributes": [
        {
          "nameFormat": "UNSPECIFIED",
          "attributeName": "first-name",
          "attributeValueField": {
            "fieldName": "firstName",
            "sourceModel": "user"
          }
        }
      ],
      "name": "Slack",
      "sign": "RESPONSE",
      "serviceProviderIssuer": "https://slack.com"
    }
  }
}
```
Required | &nbsp;
---------- | -----------
`name`<br/>*string* | The name of the service provider.
`type`<br/>*string* | The type of service provider. Possible values are : SAML.
`config`<br/>*Object* | The object containing the configuration of the service provider.
`config.serviceProviderIssuer`<br/>*string* | The issuer for the service provider. This is what is contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.
`config.assertionConsumerUrl`<br/>*string* | The URL where the response is sent.
`config.sign`<br/>*string* | How the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE. Only required if `config.responseAttributes` is passed.
`config.responseAttributes.attributeName`<br/>*string* | The attribute name. Only required if `config.responseAttributes` is passed.
`config.responseAttributes.attributeValueField`<br/>*Object* | The object containing the source for the value in the response. Only required if `config.responseAttributes` is passed.
`config.responseAttributes.attributeValueField.sourceModel`<br/>*string* | The model object to get the value from. Possible values are : ORGANIZATION, USER. Only required if `config.responseAttributes` is passed.
`config.responseAttributes.attributeValueField.fieldName`<br/>*string* | The field name to get the information from. Only required if `config.responseAttributes` is passed.

Optional | &nbsp;
---------- | -----------
`config.nameIdFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT. If not provided this defaults to UNSPECIFIED.
`config.responseAttributes.nameFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC. If not provided this defaults to UNSPECIFIED.
`config.responseAttributes`<br/>*Array[Object]* | The list of attributes part of the response.

<!-------------------- DELETE SERVICE PROVIDER -------------------->


### Delete service provider

`DELETE /service_providers/:id`

```shell
# Delete a service provider
curl "https://cloudmc_endpoint/rest/service_providers/f9dea588-d7ab-4f42-b6e6-4b85f273f3db" \
   -X DELETE -H "MC-Api-Key: your_api_key"

```
Delete a specific service provider. 
