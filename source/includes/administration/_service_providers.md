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
`config.serviceProviderIssuer`<br/>*string* | The issuer for the service provider. This is what contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.
`config.assertionConsumerUrl`<br/>*string* | The URL where the response is sent.
`config.sign`<br/>*string* | How is the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE.
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
`config.serviceProviderIssuer`<br/>*string* | The issuer for the service provider. This is what contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.
`config.assertionConsumerUrl`<br/>*string* | The URL where the response is sent.
`config.sign`<br/>*string* | How is the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE.
`config.nameIdFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT.
`config.responseAttributes`<br/>*Array[Object]* | The list of attributes part of the response
`config.responseAttributes.nameFormat`<br/>*string* | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC. 
`config.responseAttributes.attributeName`<br/>*string* | The attribute name
`config.responseAttributes.attributeValueField`<br/>*Object* | The object containing the source for the value in the response.
`config.responseAttributes.attributeValueField.sourceModel`<br/>*string* | The model object to get the value from. Possible values are : ORGANIZATION, USER.
`config.responseAttributes.attributeValueField.fieldName`<br/>*string* | The field name to get the information from.
