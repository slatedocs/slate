### SAML settings

Allows to change the configuration for the service provider integrated with SAML.

<!-------------------- LIST SERVICE SAML -------------------->

#### List SAML settings

`GET /saml_settings`

```shell
# Retrieve SAML settings
curl "https://cloudmc_endpoint/api/v1/saml_settings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
      "certificate": "certificate value",
      "privateKey":  "private key value"
    }
  ]
}
```
List the SAML settings configured on the system. There will be only one entry if configured.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the SAML setting
`certificate`<br/>*string* | The certificate send in the saml response for the service provider to validate the signature.
`privateKey`<br/>*string* | The private key used to sign the SAML request.



<!-------------------- GET SAML SETTINGS -------------------->

#### Retrieve SAML settings

`GET /saml_settings/:id`

```shell
# Retrieve saml settings
curl "https://cloudmc_endpoint/api/v1/saml_settings/04b77783-516f-4064-a6df-e7f9cae222c1" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "certificate": "certificate value",
    "privateKey":  "private key value"
  }
}
```
Return the SAML settings configured on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the SAML setting
`certificate`<br/>*string* | The certificate send in the saml response for the service provider to validate the signature.
`privateKey`<br/>*string* | The private key used to sign the SAML request.


<!-------------------- UPDATE SAML SETTINGS -------------------->

#### Update SAML settings

`PUT /saml_settings/:id`

```shell
# Updates an existing saml settings
curl -X POST "https://cloudmc_endpoint/rest/saml_settings/:id" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "certificate": "certificate value",
    "privateKey":  "private key value"
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "id": "04b77783-516f-4064-a6df-e7f9cae222c1",
    "certificate": "certificate value",
    "privateKey":  "private key value"
  }
}
```

Updates a specific SAML settings

Required | &nbsp;
---------- | -----------
`certificate`<br/>*string* | The certificate send in the saml response for the service provider to validate the signature. It must use the SHA-256 algorithm.
`privateKey`<br/>*string* | The private key used to sign the SAML request. It must be an RSA key of 2048 bits
