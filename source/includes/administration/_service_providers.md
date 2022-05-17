### Service Providers

Configure the service providers that can use CloudMC as their authentication source.

<!-------------------- LIST SERVICE PROVIDERS -------------------->

#### List service providers

`GET /service_providers?organization_id=:organization_id`

```shell
# Retrieve service providers
curl "https://cloudmc_endpoint/api/v1/service_providers?organization_id=:organization_id" \
   -H "MC-Api-Key: your_api_key"
```

| Optional query parameters      | &nbsp;                                                                                                                                  |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`<br/>_string_ | The organization whose SAML settings are to be retrieved. If this is not provided then the request defaults to the user's organization. |

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
      },
      "organization": {
        "id": "976e1d4b-de6f-454b-a189-b12dd1b85112"
      }
    }
  ]
}
```

List the service providers of an organization

| Attributes                                                               | &nbsp;                                                                                                                                                            |
| ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                                                          | The id of the service provider.                                                                                                                                   |
| `name`<br/>_string_                                                      | The name of the service provider.                                                                                                                                 |
| `type`<br/>_string_                                                      | The type of service provider. Possible values are : SAML.                                                                                                         |
| `config`<br/>_Object_                                                    | The object containing the configuration of the service provider.                                                                                                  |
| `config.serviceProviderIssuer`<br/>_string_                              | The issuer for the service provider. This is what is contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.             |
| `config.assertionConsumerUrl`<br/>_string_                               | The URL where the response is sent.                                                                                                                               |
| `config.sign`<br/>_string_                                               | How the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE.                                                                |
| `config.nameIdFormat`<br/>_string_                                       | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT. |
| `config.responseAttributes`<br/>_Array[Object]_                          | The list of attributes part of the response                                                                                                                       |
| `config.responseAttributes.nameFormat`<br/>_string_                      | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC.                                                                                  |
| `config.responseAttributes.attributeName`<br/>_string_                   | The attribute name                                                                                                                                                |
| `config.responseAttributes.attributeValueField`<br/>_Object_             | The object containing the source for the value in the response.                                                                                                   |
| `config.responseAttributes.attributeValueField.sourceModel`<br/>_string_ | The model object to get the value from. Possible values are : ORGANIZATION, USER.                                                                                 |
| `config.responseAttributes.attributeValueField.fieldName`<br/>_string_   | The field name to get the information from.                                                                                                                       |
| `organization`<br/>_[Organization](#administration-organizations)_       | The organization tied to the service provider.                                                                                                                    |

<!-------------------- GET SERVICE PROVIDERS -------------------->

#### Retrieve service provider

`GET /service_providers/:id`

```shell
# Retrieve service providers
curl "https://cloudmc_endpoint/api/v1/service_providers/:id" \
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
    },
    "organization": {
      "id": "976e1d4b-de6f-454b-a189-b12dd1b85112"
    }
  }
}
```

Return the service provider configured associated to the id on the system.

| Attributes                                                               | &nbsp;                                                                                                                                                            |
| ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                                                          | The id of the service provider.                                                                                                                                   |
| `name`<br/>_string_                                                      | The name of the service provider.                                                                                                                                 |
| `type`<br/>_string_                                                      | The type of service provider. Possible values are : SAML.                                                                                                         |
| `config`<br/>_Object_                                                    | The object containing the configuration of the service provider.                                                                                                  |
| `config.serviceProviderIssuer`<br/>_string_                              | The issuer for the service provider. This is what is contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.             |
| `config.assertionConsumerUrl`<br/>_string_                               | The URL where the response is sent.                                                                                                                               |
| `config.sign`<br/>_string_                                               | How the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE.                                                                |
| `config.nameIdFormat`<br/>_string_                                       | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT. |
| `config.responseAttributes`<br/>_Array[Object]_                          | The list of attributes part of the response                                                                                                                       |
| `config.responseAttributes.nameFormat`<br/>_string_                      | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC.                                                                                  |
| `config.responseAttributes.attributeName`<br/>_string_                   | The attribute name                                                                                                                                                |
| `config.responseAttributes.attributeValueField`<br/>_Object_             | The object containing the source for the value in the response.                                                                                                   |
| `config.responseAttributes.attributeValueField.sourceModel`<br/>_string_ | The model object to get the value from. Possible values are : ORGANIZATION, USER.                                                                                 |
| `config.responseAttributes.attributeValueField.fieldName`<br/>_string_   | The field name to get the information from.                                                                                                                       |
| `organization`<br/>_[Organization](#administration-organizations)_       | The organization tied to the service provider.                                                                                                                    |

<!-------------------- CREATE SERVICE PROVIDERS -------------------->

#### Create service provider

`POST /service_providers`

```shell
# Creates a new service provider
curl -X POST "https://cloudmc_endpoint/api/v1/service_providers" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
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
  },
  "organization": {
    "id": "976e1d4b-de6f-454b-a189-b12dd1b85112"
  }
}
```

> The above command return JSON structured like this:

```json
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
    },
    "organization": {
      "id": "976e1d4b-de6f-454b-a189-b12dd1b85112"
    }
  }
}
```

Create a new service provider

| Required                                                                 | &nbsp;                                                                                                                                                     |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`<br/>_string_                                                      | The name of the service provider.                                                                                                                          |
| `type`<br/>_string_                                                      | The type of service provider. Possible values are : SAML.                                                                                                  |
| `config`<br/>_Object_                                                    | The object containing the configuration of the service provider.                                                                                           |
| `config.serviceProviderIssuer`<br/>_string_                              | The issuer for the service provider. This is what is contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.      |
| `config.assertionConsumerUrl`<br/>_string_                               | The URL where the response is sent.                                                                                                                        |
| `config.sign`<br/>_string_                                               | How the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE. Only required if `config.responseAttributes` is passed. |
| `config.responseAttributes.attributeName`<br/>_string_                   | The attribute name. Only required if `config.responseAttributes` is passed.                                                                                |
| `config.responseAttributes.attributeValueField`<br/>_Object_             | The object containing the source for the value in the response. Only required if `config.responseAttributes` is passed.                                    |
| `config.responseAttributes.attributeValueField.sourceModel`<br/>_string_ | The model object to get the value from. Possible values are : ORGANIZATION, USER. Only required if `config.responseAttributes` is passed.                  |
| `config.responseAttributes.attributeValueField.fieldName`<br/>_string_   | The field name to get the information from. Only required if `config.responseAttributes` is passed.                                                        |
| `organization`<br/>_[Organization](#administration-organizations)_       | The organization tied to the service provider.                                                                                                             |

| Optional                                            | &nbsp;                                                                                                                                                                                                          |
| --------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config.nameIdFormat`<br/>_string_                  | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT. If not provided this defaults to UNSPECIFIED. |
| `config.responseAttributes.nameFormat`<br/>_string_ | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC. If not provided this defaults to UNSPECIFIED.                                                                                  |
| `config.responseAttributes`<br/>_Array[Object]_     | The list of attributes part of the response.                                                                                                                                                                    |

<!-------------------- UPDATE SERVICE PROVIDERS -------------------->

#### Update service provider

`PUT /service_providers/:id`

```shell
# Updates an existing service provider
curl -X PUT "https://cloudmc_endpoint/api/v1/service_providers/:id" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
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
  },
  "organization": {
    "id": "976e1d4b-de6f-454b-a189-b12dd1b85112"
  }
}
```

> The above command return JSON structured like this:

```json
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
    },
    "organization": {
      "id": "976e1d4b-de6f-454b-a189-b12dd1b85112"
    }
  }
}
```

Updates a specific service provider

| Required                                                                 | &nbsp;                                                                                                                                                     |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`<br/>_string_                                                      | The name of the service provider.                                                                                                                          |
| `type`<br/>_string_                                                      | The type of service provider. Possible values are : SAML.                                                                                                  |
| `config`<br/>_Object_                                                    | The object containing the configuration of the service provider.                                                                                           |
| `config.serviceProviderIssuer`<br/>_string_                              | The issuer for the service provider. This is what is contained in the SAML request issuer tag. This is also referred to as the EntityID or EntityURL.      |
| `config.assertionConsumerUrl`<br/>_string_                               | The URL where the response is sent.                                                                                                                        |
| `config.sign`<br/>_string_                                               | How the returned XML is signed. Possible values are : ASSERTION, RESPONSE, ASSERTION_AND_RESPONSE. Only required if `config.responseAttributes` is passed. |
| `config.responseAttributes.attributeName`<br/>_string_                   | The attribute name. Only required if `config.responseAttributes` is passed.                                                                                |
| `config.responseAttributes.attributeValueField`<br/>_Object_             | The object containing the source for the value in the response. Only required if `config.responseAttributes` is passed.                                    |
| `config.responseAttributes.attributeValueField.sourceModel`<br/>_string_ | The model object to get the value from. Possible values are : ORGANIZATION, USER. Only required if `config.responseAttributes` is passed.                  |
| `config.responseAttributes.attributeValueField.fieldName`<br/>_string_   | The field name to get the information from. Only required if `config.responseAttributes` is passed.                                                        |
| `organization`<br/>_[Organization](#administration-organizations)_       | The organization tied to the service provider.                                                                                                             |

| Optional                                            | &nbsp;                                                                                                                                                                                                          |
| --------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config.nameIdFormat`<br/>_string_                  | The format for the name field. Possible values are : UNSPECIFIED, EMAIL_ADDRESS, X509_SUBJECT, WINDOWS_DQN, KERBEROS_PRINCIPAL, ENTITY, PERSISTENT and TRANSIENT. If not provided this defaults to UNSPECIFIED. |
| `config.responseAttributes.nameFormat`<br/>_string_ | The format for the name field. Possible values are : UNSPECIFIED, URI and BASIC. If not provided this defaults to UNSPECIFIED.                                                                                  |
| `config.responseAttributes`<br/>_Array[Object]_     | The list of attributes part of the response.                                                                                                                                                                    |

<!-------------------- DELETE SERVICE PROVIDER -------------------->

#### Delete service provider

`DELETE /service_providers/:id`

```shell
# Delete a service provider
curl "https://cloudmc_endpoint/api/v1/service_providers/:id" \
   -X DELETE -H "MC-Api-Key: your_api_key"

```

Delete a specific service provider

<!-------------------- GET SERVICE PROVIDER METADATA -------------------->

#### Get service provider metadata file

`GET /service_providers/:id/metadata`

````shell
# Get a service provider's metadata file
curl "https://cloudmc_endpoint/rest/service_providers/:id/metadata"

> The above command returns XML structured like this:

```xml
<md:EntityDescriptor entityID="https://cloudmc_endpoint">
    <ds:Signature>
        <ds:SignedInfo>
            <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
            <ds:SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"/>
            <ds:Reference URI="">
                <ds:Transforms>
                    <ds:Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
                    <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
                </ds:Transforms>
                <ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"/>
                <ds:DigestValue>5U/iSjUM0ooVDT5n60sK1vgPchsZbVyp+Epm7P/GP8Y=</ds:DigestValue>
            </ds:Reference>
        </ds:SignedInfo>
        <ds:SignatureValue>
k2k3+9IbMkUCIN/TmcZMmrG3AB6izICW10bjtnjSocz+RgnAwrUEoNQTYsOG4nsEcHFZ31zxuRJq YOnjJ259XcPGsTrZSmV/GIWxYwUcPUP292D00Ulql+Gpj5YVk31uoaWQ93fln42hbwW6Qkaaiz9i +4OXASSxx8WgBpG4Ro0Carm0fT7nJU55+ZX0bFiKRCBmbUhxXivbVj914ed2vFjkWoucG1NXvIdF L+j3Qhn3DAd/XUvR06WfPWModAl7ip/+GH97QkE7sq4szcRAKzrR10kFVLFBbMu/zZ1a0FMSc1tC vZKh1SAA61IYZy/j9OuYGCELt59f2wd+5X1+7w==
</ds:SignatureValue>
        <ds:KeyInfo>
            <ds:X509Data>
                <ds:X509Certificate>CERT_DATA</ds:X509Data>
        </ds:KeyInfo>
    </ds:Signature>
    <md:IDPSSODescriptor WantAuthnRequestsSigned="true" protocolSupportEnumeration="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect">
        <md:KeyDescriptor use="signing">
            <ds:KeyInfo>
                <ds:X509Data>
                    <ds:X509Certificate>CERT_DATA</ds:X509Data>
            </ds:KeyInfo>
        </md:KeyDescriptor>
        <md:NameIDFormat>
urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified
</md:NameIDFormat>
        <md:SingleSignOnService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" Location="https://cloudmc_endpoint/rest/service_providers/f9dea588-d7ab-4f42-b6e6-4b85f273f3db"/>
        <saml2:Attribute Name="first-name" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:unspecified"/>
    </md:IDPSSODescriptor>
</md:EntityDescriptor>
````

Gets the metadata file for a given service provider. This can be provided to certain identity providers for quick set-up.
