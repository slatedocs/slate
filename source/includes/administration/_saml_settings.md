### SAML settings

Allows to change the configuration for the service provider integrated with SAML.

<!-------------------- LIST SERVICE SAML -------------------->

#### List SAML settings

`GET /saml_settings?organization_id=:organization_id`

```shell
# Retrieve SAML settings
curl "https://cloudmc_endpoint/api/v1/saml_settings?organization_id=:organization_id" \
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
      "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
      "certificate": "certificate value",
      "privateKey": "private key value",
      "organization": {
        "id": "a310f701-1d77-4bda-b3f7-8c514c5a005e"
      }
    }
  ]
}
```

List the SAML settings of an organization

| Attributes                                                         | &nbsp;                                                                                        |
| ------------------------------------------------------------------ | --------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                                                    | The id of the SAML setting.                                                                   |
| `certificate`<br/>_string_                                         | The certificate sent in the SAML response for the service provider to validate the signature. |
| `privateKey`<br/>_string_                                          | The private key used to sign the SAML request.                                                |
| `organization`<br/>_[Organization](#administration-organizations)_ | The organization tied to the SAML settings.                                                   |

<!-------------------- GET SAML SETTINGS -------------------->

#### Retrieve SAML settings

`GET /saml_settings/:id`

```shell
# Retrieve saml settings
curl "https://cloudmc_endpoint/api/v1/saml_settings/:id" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "certificate": "certificate value",
    "privateKey": "private key value",
    "organization": {
      "id": "a310f701-1d77-4bda-b3f7-8c514c5a005e"
    }
  }
}
```

Return the SAML settings of an organization

| Attributes                                                         | &nbsp;                                                                                        |
| ------------------------------------------------------------------ | --------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                                                    | The id of the SAML setting.                                                                   |
| `certificate`<br/>_string_                                         | The certificate sent in the SAML response for the service provider to validate the signature. |
| `privateKey`<br/>_string_                                          | The private key used to sign the SAML request.                                                |
| `organization`<br/>_[Organization](#administration-organizations)_ | The organization tied to the SAML settings.                                                   |

<!-------------------- CREATE SAML SETTINGS -------------------->

#### Create SAML settings

`POST /saml_settings`

```shell
# Updates an existing saml settings
curl -X POST "https://cloudmc_endpoint/api/v1/saml_settings/:id" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "certificate": "certificate value",
    "privateKey": "private key value",
    "organization": {
      "id": "a310f701-1d77-4bda-b3f7-8c514c5a005e"
    }
}
```

> The above command return JSON structured like this:

```js
{
  "data": {
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "certificate": "certificate value",
    "privateKey": "private key value",
    "organization": {
      "id": "a310f701-1d77-4bda-b3f7-8c514c5a005e"
    }
  }
}
```

Creates a specific SAML settings

| Required                                                           | &nbsp;                                                                                                                           |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| `certificate`<br/>_string_                                         | The certificate sent in the SAML response for the service provider to validate the signature. It must use the SHA-256 algorithm. |
| `privateKey`<br/>_string_                                          | The private key used to sign the SAML request. It must be an RSA key of 2048 bits.                                               |
| `organization`<br/>_[Organization](#administration-organizations)_ | The organization tied to the SAML settings.                                                                                      |

<!-------------------- UPDATE SAML SETTINGS -------------------->

#### Update SAML settings

`PUT /saml_settings/:id`

```shell
# Updates an existing saml settings
curl -X PUT "https://cloudmc_endpoint/api/v1/saml_settings/:id" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "certificate": "certificate value",
    "privateKey":  "private key value",
    "organization": {
      "id": "a310f701-1d77-4bda-b3f7-8c514c5a005e"
    }
}
```

> The above command return JSON structured like this:

```js
{
  "data": {
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "certificate": "certificate value",
    "privateKey": "private key value",
    "organization": {
      "id": "a310f701-1d77-4bda-b3f7-8c514c5a005e"
    }
  }
}
```

Updates a specific SAML settings

| Required                                                           | &nbsp;                                                                                                                           |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                                                    | The id of the SAML setting.                                                                                                      |
| `certificate`<br/>_string_                                         | The certificate sent in the SAML response for the service provider to validate the signature. It must use the SHA-256 algorithm. |
| `privateKey`<br/>_string_                                          | The private key used to sign the SAML request. It must be an RSA key of 2048 bits.                                               |
| `organization`<br/>_[Organization](#administration-organizations)_ | The organization tied to the SAML settings.                                                                                      |

#### Delete SAML settings

`DELETE /saml_settings/:id`

```shell
# Updates an existing saml settings
curl -X DELETE "https://cloudmc_endpoint/api/v1/saml_settings/:id" \
   -H "MC-Api-Key: your_api_key"
```

Deletes a specific SAML settings

| Attributes      | &nbsp;                     |
| --------------- | -------------------------- |
| `id`<br/>_UUID_ | The id of the SAML setting |
