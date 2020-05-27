## Authentication



<!-------------------- LIST ENVIRONMENTS -------------------->

### List identity providers

`GET /identity_providers`

```shell
# Retrieve identity providers
curl "https://cloudmc_endpoint/v1/identity_providers" \
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
`logo`<br/>*string* | A base64 encoded data url for the logo to display on the login screen.
`identityProviderUsers`<br/>*Array* | A list of objects containing the ids of users associated with the identity provider, and their subject ids.
`connectionName`<br/>*string* | The connection name of the identity provider.
`type`<br/>*string* | The type of authentication protocol. Possible values: OIDC, SAML.
`parameters`<br/>*Array* | A list of parameters associated with the identity provider.
