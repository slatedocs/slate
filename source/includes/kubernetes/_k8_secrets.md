### Secrets

<!-------------------- LIST SECRETS -------------------->

#### List secrets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/secrets"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "default-token-xxxmt/default",
      "apiVersion": "v1",
      "encodedData": {
        "ca.crt": "LS0tLS...",
        "namespace": "a3ViZS1zeXN0ZW0=",
        "token": "ZXlKa..."
      },
      "kind": "Secret",
      "metadata": {},
      "type": "kubernetes.io/service-account-token"
    }
  ],
  "metadata": {
    "recordCount": 100
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets</code>

Retrieve a list of all secrets in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                                                     |
| -------------------------- | -------------------------------------------------------------------------- |
| `id` <br/>_string_         | The id of the secret.                                                      |
| `apiVersion` <br/>_string_ | The API version used to retrieve the secret.                               |
| `encodedData`<br/>_object_ | The base64 encoded data stored in the secret.                              |
| `metadata` <br/>_object_   | The metadata of the secret.                                                |
| `type` <br/>_string_       | A string used to facilitate programmatic handling of a secret's data.      |

<!-------------------- GET A secret -------------------->

#### Get a secret

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/secrets/default-token-xxxmt/default"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "default-token-xxxmt/default",
    "apiVersion": "v1",
    "encodedData": {
      "ca.crt": "LS0tLS...",
      "namespace": "a3ViZS1zeXN0ZW0=",
      "token": "ZXlKa..."
    },
    "kind": "Secret",
    "metadata": {},
    "type": "kubernetes.io/service-account-token"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets/:id</code>

Retrieve a secret and all its info in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                                                     |
| -------------------------- | -------------------------------------------------------------------------- |
| `id` <br/>_string_         | The id of the secret.                                                      |
| `apiVersion` <br/>_string_ | The API version used to retrieve the secret.                               |
| `encodedData`<br/>_object_ | The base64 encoded data stored in the secret.                              |
| `metadata` <br/>_object_   | The metadata of the secret.                                                |
| `type` <br/>_string_       | A string used to facilitate programmatic handling of a secret's data.      |

<!-------------------- CREATE A SECRET -------------------->

#### Create a secret

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/secrets"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "Secret",
  "metadata": {
    "name": "mysecret"
  },
  "type": "Opaque",
  "stringData": {
    "username": "my-username",
    "password": "my-password"
  }
}

# OR

curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/secrets"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "Secret",
  "metadata": {
    "name": "mysecret"
  },
  "type": "Opaque",
  "encodedData": {
    "username": "YWRtaW4=",
    "password": "MWYyZDFlMmU2N2Rm"
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets</code>

Create a secret in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                            |
| ----------------------------- | ------------------------------------------------- |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the secret. |
| `metadata` <br/>_object_      | The metadata of the secret.                       |
| `metadata.name` <br/>_string_ | The name of the secret.                           |

One of the following two attributes is also required.

| Attributes                 | &nbsp;                                                                |
| -------------------------- | --------------------------------------------------------------------- |
| `encodedData`<br/>_object_ | The base64 encoded data stored in the secret.                         |
| `stringData`<br/>_object_  | The non-base64 encoded data to be encoded when the secret is created. |

| Optional Attributes                | &nbsp;                                        |
| ---------------------------------- | --------------------------------------------- |
| `metadata.namespace` <br/>_string_ | The namespace in which the secret is created. |

Return value:

| Attributes                 | &nbsp;                                          |
| -------------------------- | ----------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create secret task. |
| `taskStatus` <br/>_string_ | The status of the operation.                    |

<!-------------------- REPLACE A SECRET -------------------->

#### Replace a secret

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/secrets/my-secret/shhh"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "Secret",
  "metadata": {
    "name": "mysecret",
    "namespace": "shhh"
  },
  "type": "Opaque",
  "stringData": {
    "username": "my-username",
    "password": "my-new-password"
  }
}

# OR

curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/secrets/my-secret/shhh"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "Secret",
  "metadata": {
    "name": "mysecret"
  },
  "type": "Opaque",
  "encodedData": {
    "username": "YWRtaW4=",
    "password": "MWYyFDZlMmU2N2Rm"
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets/:id</code>

Replace a secret in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                            |
| ----------------------------- | ------------------------------------------------- |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the secret. |
| `metadata` <br/>_object_      | The metadata of the secret.                       |
| `metadata.name` <br/>_string_ | The name of the secret.                           |

One of the following two attributes is also required.

| Attributes                 | &nbsp;                                                                 |
| -------------------------- | ---------------------------------------------------------------------- |
| `encodedData`<br/>_object_ | The base64 encoded data stored in the secret.                          |
| `stringData`<br/>_object_  | The non-base64 encoded data to be encoded when the secret is replaced. |

| Optional Attributes                | &nbsp;                                         |
| ---------------------------------- | ---------------------------------------------- |
| `metadata.namespace` <br/>_string_ | The namespace in which the secret is replaced. |

Return value:

| Attributes                 | &nbsp;                                           |
| -------------------------- | ------------------------------------------------ |
| `taskId` <br/>_string_     | The id corresponding to the replace secret task. |
| `taskStatus` <br/>_string_ | The status of the operation.                     |

<!-------------------- DELETE SECRET -------------------->

#### Delete a secret

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/secrets/default-token-xxxmt/default"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets/:id</code>

Delete a secret from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                          |
| -------------------------- | ----------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete secret task. |
| `taskStatus` <br/>_string_ | The status of the operation.                    |
