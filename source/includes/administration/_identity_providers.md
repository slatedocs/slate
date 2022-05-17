### Identity providers

Configure methods of authentication for your organizations.


<!-------------------- LIST IDPS -------------------->

#### List identity providers

`GET /identity_providers`

```shell
# Retrieve identity providers
curl "https://cloudmc_endpoint/api/v1/identity_providers" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [{
      "provider": "GOOGLE",
      "displayName": "Google",
      "logo": "aHR0cHM6Ly9kZXZlbG9wZXJzLmdvb2dsZS5jb20vaWR23nRpdHkvaW1hZ2VzL2ctbG9nby5wbmc=",
      "identityProviderUsers": [
        {
          "user": {
            "id": "0c4hc34e-ff76-48de-8976-7cb2fc89aa96"
          },
          "subjectId": "totallyFakeSubjectID"
        }
      ],
      "id": "02b3cbd5-9286-4cd7-b47e-22b2fb9ceae5",
      "connectionName": "Google",
      "type": "OIDC",
      "rank": "1",
      "parameters": [
        {
          "parameter": "issuerURL",
          "id": "02b3cbd5-9286-4cd7-b47e-22b2fb9ceab1",
          "value": "https://accounts.google.com"
        },
        {
          "parameter": "clientSecret",
          "id": "02b3cbd5-9286-4cd7-b47e-22b2fb9ceab3",
          "value": "sssshhhhhhhhh"
        },
        {
          "parameter": "clientID",
          "id": "02b3cbd5-9286-4cd7-b47e-22b2fb9ceab4",
          "value": "shhhID"
        }
      ]
    }]
}
```
List the identity providers configured on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the identity provider.
`provider`<br/>*string* | The name of the provider. Possible values include the default providers (e.g GOOGLE), or CUSTOM for a custom user-defined provider.
`displayName`<br/>*string* | The display name of the identity provider that will appear on the login screen.
`logo`<br/>*string* | A base64 encoded data URL or URL to an image for the logo to display on the login screen.
`css`<br/>*string* | Custom css for the login button of the identity provider.
`identityProviderUsers`<br/>*Array* | A list of objects containing the ids of users associated with the identity provider, and their subject ids.
`connectionName`<br/>*string* | The connection name of the identity provider.
`type`<br/>*string* | The type of authentication protocol. Possible values: OIDC, SAML.
`parameters`<br/>*Array* | A list of parameters associated with the identity provider.
`rank`<br/>*int* | If provided, this integer sorts identity providers on the Login page in ascending order.


<!-------------------- CREATE IDPS -------------------->

#### Create identity provider

`POST /identity_providers`

Create a new identity provider.

```shell
# Creates a new identity provider
curl -X POST "https://cloudmc_endpoint/rest/identity_providers" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
	"provider": "CUSTOM",
	"type": "OIDC",
	"connectionName": "CloudMC Google",
	"displayName": "Google",
	"parameters": [
		{
			"parameter": "issuerURL",
			"value": "https://accounts.google.com"
		},
		{
			"parameter": "clientId",
			"value": "secret"
		},
		{
			"parameter": "clientSecret",
			"value": "secret"
		}
	]
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "provider": "CUSTOM",
    "displayName": "Google",
    "connectionName": "CloudMC Google",
    "type": "OIDC",
    "rank": "1",
    "parameters": [
      {
        "parameter": "issuerURL",
        "id": "54d423fc-5ae2-4abc-bca6-9325376b6275",
        "value": "https://accounts.google.com"
      },
      {
        "parameter": "clientId",
        "id": "a0538e7e-3049-45f0-97a5-83f55fc012e9",
        "value": "secret"
      },
      {
        "parameter": "clientSecret",
        "id": "760c6c03-7c2f-4a18-a7c8-9ebc758ea33e",
        "value": "secret"
      }
    ]
  }
}
```

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the identity provider.
`provider`<br/>*string* | The name of the provider. Possible values include the default providers (e.g GOOGLE), or CUSTOM for a custom user-defined provider.
`displayName`<br/>*string* | The display name of the identity provider that will appear on the login screen. If of a default provider type, this will be set with a default if not passed.
`connectionName`<br/>*string* | The connection name of the identity provider. If of a default provider type, this will be set with a default if not passed.
`logo`<br/>*string* | A base64 encoded data URL or URL to an image for the logo to display on the login screen. If of a default provider type, this will be set with a default if not passed.
`type`<br/>*string* | The type of authentication protocol. Possible values: OIDC, SAML.
`parameters`<br/>*Array* | A list of parameters associated with the identity provider. The issuerURL will be set if of a default provider type.
`rank`<br/>*int* | If provided, this integer sorts identity providers on the Login page in ascending order.


Optional | &nbsp;
---------- | -----------
`css`<br/>*string* | Custom css for the login button of the identity provider.

<!-------------------- UPDATE IDPS -------------------->

#### Update Identity Provider

`PUT /identity_providers/:id`

Update an existing identity provider.

```shell
# Updates an existing identity provider
curl -X PUT "https://cloudmc_endpoint/rest/identity_providers/c84cfe41-929b-47c9-bde4-b55a10bd2774" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
	"provider": "CUSTOM",
	"type": "OIDC",
    "id": "c84cfe41-929b-47c9-bde4-b55a10bd2774",
	"connectionName": "CloudMC Google",
	"displayName": "Google",
	"parameters": [
		{
			"parameter": "issuerURL",
			"value": "https://accounts.google.com"
		},
		{
			"parameter": "clientId",
			"value": "secret"
		},
		{
			"parameter": "clientSecret",
			"value": "secret"
		}
	]
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "provider": "CUSTOM",
    "displayName": "Google",
    "id": "da33bf85-6ba3-4214-a258-9442de149eff",
    "connectionName": "CloudMC Google",
    "type": "OIDC",
    "rank": "1",
    "parameters": [
      {
        "parameter": "issuerURL",
        "id": "54d423fc-5ae2-4abc-bca6-9325376b6275",
        "value": "https://accounts.google.com"
      },
      {
        "parameter": "clientId",
        "id": "a0538e7e-3049-45f0-97a5-83f55fc012e9",
        "value": "secret"
      },
      {
        "parameter": "clientSecret",
        "id": "760c6c03-7c2f-4a18-a7c8-9ebc758ea33e",
        "value": "secret"
      }
    ]
  }
}
```

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the identity provider.
`provider`<br/>*string* | The name of the provider. Possible values include the default providers (e.g GOOGLE), or CUSTOM for a custom user-defined provider.
`displayName`<br/>*string* | The display name of the identity provider that will appear on the login screen. If of a default provider type, this will be set with a default if not passed.
`connectionName`<br/>*string* | The connection name of the identity provider. If of a default provider type, this will be set with a default if not passed.
`logo`<br/>*string* | A base64 encoded data URL or URL to an image for the logo to display on the login screen. If of a default provider type, this will be set with a default if not passed.
`type`<br/>*string* | The type of authentication protocol. Possible values: OIDC, SAML.
`parameters`<br/>*Array* | A list of parameters associated with the identity provider. The issuerURL will be set if of a default provider type.
`rank`<br/>*int* | If provided, this integer sorts identity providers on the Login page in ascending order.


Optional | &nbsp;
---------- | -----------
`css`<br/>*string* | Custom css for the login button of the identity provider.

<!-------------------- Delete IDPs -------------------->

#### Delete Identity Provider

`Delete /identity_providers/:id`

Delete an existing identity provider.

```shell
# Deletes a specified identity provider
curl -X DELETE "https://cloudmc_endpoint/rest/identity_providers/c84cfe41-929b-47c9-bde4-b55a10bd2774" \
   -H "MC-Api-Key: your_api_key"
```
> The above command(s) return(s) JSON structured like this:

```js
{
  "taskId": "c50390c7-9d5b-4af4-a2da-e2a2678a83e8",
  "taskStatus": "SUCCESS"
}
```

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the identity provider deletion.
`taskStatus` <br/>*string* | The status of the operation.